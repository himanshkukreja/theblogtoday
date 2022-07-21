from flask import Flask,render_template, request, session,redirect,flash
from flask_login import UserMixin, LoginManager, login_user
from flask_login import login_required, current_user , logout_user
from datetime import datetime,date
from flask_sqlalchemy import SQLAlchemy
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
from werkzeug.security import generate_password_hash, check_password_hash
import math


local_server=False
with open('config.json','r') as c:
  params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'secret-key'
app.config['UPLOAD_FOLDER'] = os.path.abspath("static/img")


app.config.update(
  MAIL_SERVER = 'smtp.gmail.com',
  MAIL_PORT ='465',
  MAIL_USE_SSL = "True",
  MAIL_USERNAME=params['gmail_username'],
  MAIL_PASSWORD=params['gmail_password']
)

mail =Mail(app)

if(local_server):
  app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:

  PASSWORD=params["PASSWORD"]
  PUBLIC_IP_ADDRESS=params["PUBLIC_IP_ADDRESS"]
  DBNAME=params["DBNAME"]
  PROJECT_ID=params["PROJECT_ID"]
  INSTANCE_NAME=params["INSTANCE_NAME"]
  string=f"mysql+mysqldb://root:{PASSWORD}@{PUBLIC_IP_ADDRESS}/{DBNAME}?unix_socket=/cloudsql/{PROJECT_ID}:{INSTANCE_NAME}"
  
  app.config["SQLALCHEMY_DATABASE_URI"] = string
  print(string)


  # mysql+mysqldb://root@/<dbname>?unix_socket=/cloudsql/<projectid>:<instancename>
  app.config["SQLALCHEMY_TRACK_MODIFICATIONS"]= True


db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255),  nullable=False)
    email = db.Column(db.String(255),  nullable=False)
    phone_num = db.Column(db.Integer, nullable=False)
    message = db.Column(db.String(255),  nullable=False)
    date = db.Column(db.String(255), nullable=True)

class Posts(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    author= db.Column(db.String(255),  nullable=False)
    title = db.Column(db.String(255),  nullable=False)
    subtitle = db.Column(db.String(255),  nullable=False)
    slug = db.Column(db.String(255),  nullable=False)
    content = db.Column(db.String(10000), nullable=False)
    img = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(20), nullable=True)

class Users(UserMixin,db.Model):
    
    sno = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255),  nullable=False)
    email = db.Column(db.String(255),  nullable=False)
    phone = db.Column(db.Integer,  nullable=False)
    age = db.Column(db.Integer,  nullable=False)
    password = db.Column(db.String(100), nullable=False)
    dateofsignup = db.Column(db.String(20), nullable=True)
    def get_id(self):
      return (self.sno)

login_manager=LoginManager()
login_manager.login_view='app.signin'
login_manager.init_app(app)

@login_manager.user_loader
def load_user(user_id):
  return Users.query.get(int(user_id))



@app.route('/')
def home():

  posts = Posts.query.filter_by().all()
  last = math.ceil(len(posts)/int(params['no_of_posts']))

  page=(request.args.get('page'))
  if not str(page).isnumeric():
    page=1
  page=int(page)

  posts=posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]

  if page==1:
    prev='#'
    next = "/?page="+str(page+1)
  elif page==last:
    prev="/?page="+str(page-1)
    next='#'
  else:
    prev="/?page="+str(page-1)
    next ="/?page="+str(page+1)

  return render_template('index.html',prev=prev,next=next,params = params, posts = posts, title="TheBlogToday - Home")



@app.route('/about')
def about():
  return render_template('about.html',params = params, title="TheBlogToday - know the admin")



@app.route('/contact', methods= ['GET', 'POST'])
def contact():
    if(request.method=="POST"):
        name = request.form.get('name')
        email =request.form.get('email')
        phone =request.form.get('phone')
        message =request.form.get('message')
        
        entry= Contacts(name=name, email=email, phone_num=phone, message=message, date=date.today())

        db.session.add(entry)
        db.session.commit()

        mail.send_message('New message from  ' + name + ' via  '+params['blog_name'], 
                          sender= email, 
                          recipients =[params['gmail_username'],params['recipient_username']],
                          body = message + "\n" + "Contact No.: "+ phone 
                          )

        reply= "Thanks for reaching to us.\nYou will receive your reply shortly.\nTill then happy codding.\nThis is computer generated mail kindly don't reply back.\nFor more information contact the admin\nHimanshu Kukreja\nhkukreja_be19@thapar.edu\n9915579903"
        try:
          mail.send_message('Thanks for Contacting TheBlogToday', 
                            sender= params['gmail_username'], 
                            recipients =[email],
                            body = reply
                          )
        except:
          return render_template('contact.html',params = params,title="TheBlogToday -Contact Admin")


    return render_template('contact.html',params = params,title="TheBlogToday -Contact Admin")



@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
  post = Posts.query.filter_by(slug=post_slug).first()
  return render_template('post.html',params = params, post = post,title="TheBlogToday -Post")


@app.route('/user-profile-view/<string:username>',methods=['GET'])
def profile_view(username):
  posts= Posts.query.filter_by(author=username).all()
  userdata=Users.query.filter_by(username=username).first()
  number_of_posts=len(posts)
  membersince= ((date.today()-userdata.dateofsignup).days)   
  return render_template('user_profile_view.html',posts=posts,userdata=userdata,number_of_posts=number_of_posts,params = params,membersince=membersince,title="TheBlogToday - users")
  

@app.route('/editpost/<string:sno>', methods=['GET', 'POST'])
def editpost(sno):
  def find_slug(post_title,author):
    stri=post_title
    stri=stri.replace(" ","-")
    return stri+"-"+author

  if current_user.is_authenticated:
    if request.method == "POST":
      author = current_user.username
      post_title = request.form.get('title')
      tagline = request.form.get('tagline')
      slug = find_slug(post_title,author)
      content = request.form.get('content')
      img_file = request.form.get('img_file')
      
      if sno =='0':
        entry = Posts(title=post_title, slug= slug, content=content, subtitle = tagline, img = img_file, author=author,date=date.today())
        try:
          db.session.add(entry)
          db.session.commit()
          print()
          flash("Uploaded")
          return redirect('/user_profile')
        except:
          flash("Not Uploaded")
          return redirect('/user_profile')
      else:
        post = Posts.query.filter_by(sno = sno).first()
        post.title = post_title
        post.content = content
        post.subtitle= tagline
        post.slug = slug
        post.img= img_file
        post.date = date.today()
        try:
          db.session.commit()
          print()
          flash("Edited")
          return redirect('/user_profile')
        except:
          flash("Not Edited")
          return redirect('/user_profile')

    post = Posts.query.filter_by(sno = sno).first()
    return render_template('edit_post.html', params=params,post=post,sno=sno,username=current_user.username,title="TheBlogToday - Edit Post")
  return redirect('/')



@app.route('/delete/<string:sno>', methods=['GET', 'POST'])
def delelte(sno):
  if current_user.is_authenticated:
    post= Posts.query.filter_by(sno=sno).first()
    try:
      db.session.delete(post)
      db.session.commit()
      flash("Deleted")
      return redirect('/user_profile')
    except:
      flash("Not Deleted")
      return redirect('/user_profile')


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if current_user.is_authenticated:
      if (request.method == 'POST'):
        f=request.files['file']
        try:
          f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
          flash("OK")
          return redirect('/user_profile')
        except:
          flash("NOT OK")
          return redirect('/user_profile')
      return redirect('/user_profile')


@app.route('/signup',methods=['GET', 'POST'])
def signup():
  if (request.method == "POST"):
    username = request.form.get('uname')
    email = request.form.get('email')
    age = request.form.get('age')
    phone = request.form.get('phone')
    password = request.form.get('pass')

    dbusername=Users.query.filter_by(username=username).first()
    if dbusername:
      flash('Username already exists')
      return redirect('/signup')

    new_user = Users(email=email, username=username, age=age, phone=phone, password=generate_password_hash(password, method='sha256'),dateofsignup=datetime.now())

    db.session.add(new_user)
    db.session.commit()
    flash("Account Created Successfully")
    return redirect('/signin')
    
  return render_template('signup.html', params = params)




@app.route('/signin',methods=['GET', 'POST'])
def signin():
  if request.method == 'POST':
    uname = request.form.get('uname')
    password = request.form.get('pass')
    remember = True if request.form.get('remember') else False
    user=Users.query.filter_by(username=uname).first()
    if not user or not check_password_hash(user.password,password):
      flash('notmatch')
      return redirect('/signin')
    
    login_user(user,remember=remember)
    return redirect('/user_profile')
  return render_template('user_login.html', params = params)



@app.route('/user_profile')
@login_required
def profile():
  username=current_user.username
  id=current_user.sno
  email=current_user.email
  phone=current_user.phone
  age=current_user.age
  posts= Posts.query.filter_by(author=username).all()
  return render_template('user_profile.html',params = params,phone=phone,age=age, username=username, id=id,email=email,posts=posts,title="TheBlogToday - User Profile")


@app.route('/updateprofile',methods=['POST'])
@login_required
def update():
  uname=current_user.username
  username = request.form.get('uname')
  email = request.form.get('email')
  age = request.form.get('age')
  phone = request.form.get('phone')
  password = request.form.get('pass')

  currpass= (Users.query.filter_by(username=uname).first()).password
  passcheck = check_password_hash(currpass,password)
  
  if not passcheck:
    flash('Password do not match')
    return redirect('/user_profile')

  user=Users.query.filter_by(username=uname).first()
  user.email=email
  user.phone=phone
  user.age=age
  try:
    db.session.commit()
    flash("Profile Updated Successfully")
    return redirect('/user_profile')
  except:
    flash("Not Edited")
    return redirect('/user_profile')
  
  flash("Username already exists")
  return redirect('/user_profile')


@app.route('/logout_user')
@login_required
def user_logout():
  logout_user()
  flash("Logout")
  return redirect('/')


@app.route('/delete_account')
@login_required
def delete_account():
  deleted_user_name=current_user.username
  user= Users.query.filter_by(username=deleted_user_name).first()
  posts= Posts.query.filter_by(author=deleted_user_name).all()
  db.session.delete(user)
  db.session.commit()
  for post in posts:
    db.session.delete(post)
    db.session.commit()
  logout_user()
  flash("account deleted")
  return redirect('/')  

app.run(debug=True)