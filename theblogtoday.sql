-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2022 at 07:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theblogtoday`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_num` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `message`, `date`) VALUES
(1, 'Himanshu', 'demo@gmail.com', '123456789', 'first post', '2022-07-15 17:18:39'),
(5, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'help', '2022-07-15 17:22:56'),
(6, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'help', '2022-07-15 17:30:03'),
(7, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'this is demo message\r\n', '2022-07-15 18:19:18'),
(8, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'demo mail2 ', '2022-07-15 18:39:44'),
(9, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'demo mail2 ', '2022-07-15 18:39:52'),
(10, 'Himanshu Kukreja', 'hkukreja_be19@thapar.edu', '9814826244', 'finally send ho ja', '2022-07-15 18:56:51'),
(11, 'Diwanshi Kukreja', 'hkukreja_be19@thapar.edu', '9915579903', 'Hello Mail', '2022-07-15 19:03:39'),
(12, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'hello message', '2022-07-15 19:05:43'),
(13, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 'help mail2', '2022-07-15 19:10:42'),
(14, 'Himanshu Kukreja', 'demoojdf', '9814826244', 'demo', '2022-07-15 19:13:51'),
(15, 'Diwanshi Kukreja', 'demoojdf', '9915579903', 'demo 3', '2022-07-15 19:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(50) NOT NULL,
  `author` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `img` varchar(20) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `author`, `title`, `subtitle`, `slug`, `content`, `img`, `date`) VALUES
(1, 'Himanshu Kukreja', 'Is Google and Microsoft creating monopoly', 'Google and Microsoft are creating a monopoly on coding in plain language', 'first-post', 'In recent years, companies such as OpenAI and Google have been rapidly improving Natural Language Processing (NLP) technologies. These are machine learning-driven programs designed to better understand and mimic natural human language and translate between different languages. Training machine learning systems requires access to a large dataset with texts written in the desired human languages. NLC applies all this to coding too.\r\n\r\nCoding is a difficult skill to learn let alone master and an experienced coder would be expected to be proficient in multiple programming languages. NLC, in contrast, leverages NLP technologies and a vast database such as CodeNet to enable anyone to use English, or ultimately French or Chinese or any other natural language, to code. It could make tasks like designing a website as simple as typing “make a red background with an image of an airplane on it, my company logo in the middle and a contact me button underneath,” and that exact website would spring into existence, the result of automatic translation of natural language to code.\r\n\r\nIt is clear that IBM was not alone in its thinking. GPT-3, OpenAI’s industry-leading NLP model, has been used to allow coding a website or app by writing a description of what you want. Soon after IBM’s news, Microsoft announced it had secured exclusive rights to GPT-3.\r\n\r\nMicrosoft also owns GitHub, — the largest collection of open source code on the internet — acquired in 2018. The company has added to GitHub’s potential with GitHub Copilot, an AI assistant. When the programmer inputs the action they want to code, Copilot generates a coding sample that could achieve what they specified. The programmer can then accept the AI-generated sample, edit it or reject it, drastically simplifying the coding process. Copilot is a huge step towards NLC, but it is not there yet.\r\nAlthough NLC is not yet fully feasible, we are moving quickly towards a future where coding is much more accessible to the average person The implications are huge.\r\n\r\nFirst, there are consequences for research and development. It is argued that the greater the number of potential innovators, the higher the rate of innovation. By removing barriers to coding, the potential for innovation through programming expands.\r\n\r\nFurther, academic disciplines as varied as computational physics and statistical sociology increasingly rely on custom computer programs to process data. Decreasing the skill required to create these programs would increase the ability of researchers in specialized fields outside computer sciences to deploy such methods and make new discoveries.', 'home-bg', '2022-07-15'),
(2, 'Sanjana', '18 Best Programming Blogs', 'If you’re a newbie to the world of coding and thinking about learning how to code? Are you looking for the best programming blogs to sharpen your coding skills? You’re in the right place.', '18 Best Programming Blogs-Sanjana', 'If you’re a newbie to the world of coding and thinking about learning how to code? Are you looking for the best programming blogs to sharpen your coding skills? You’re in the right place.\r\n\r\nHere’s a list of some of the best programming and web development blogs that you can follow to improve your coding skills or learn better programming. Are you curious to find them out? Let’ find out the list of all the best coding blogs for 2022.\r\nThe best part about using freeCodeCamp is that you get easy to follow program modules and you’ll also get programming certificates that you can use to get developer jobs (there are so many students who cracked high paying developer jobs through this platform).\r\nIf you’re a beginner coder, you must have already heard about Khan Academy which is one of the largest and widely used online platforms for learning coding and expert level content for every subject for free.\r\n\r\nIt includes a ton of practice exercises and instructional videos to make the learning process easier for you.\r\nThe biggest advantage of using Khan Academy is its biggest community of programmers who are ready to help others when they get stuck somewhere.\r\nSitePoint is an incredible online community of web developers that hosts courses related to coding and web programming languages.\r\nSo if you’re someone who’s looking to get better at coding or learning SEO with the help of professional courses, SitePoint is a great platform for you.\r\n\r\nWhat are the features that make this blog unique to learn coding?\r\n\r\nSitePoint is considered as the granddaddy of all the coming blogs where you can find a ton of useful resources taught by programming experts to teach you coding in a simple way.\r\n\r\nUdemy is the #1 platform which has over 65,000 whopping online courses which are ranging from python to graphic design to WordPress.\r\n\r\nWhat are the topics that are covered on this programming blog?\r\n\r\nHere are some of the web development and programming courses offered by Udemy.\r\n\r\nC++ Courses and Tutorials\r\nPHP Video Tutorials\r\nPython Courses\r\nJava and Javascript Tutorials\r\nWordPress Tutorials\r\nHTML Tutorials\r\nSo basically you’ll find almost everything related to coding and programming in the form of both video and text based tutorials to hone your coding skills.\r\n\r\nWhat are the features that make this platform unique to learn coding?\r\n\r\nUdemy is also a premium online course platform where you’ve to purchase online courses on the topics you’re interested in and you’ll get lifetime access to those courses (with one time fee).', 'img1', '2022-07-16'),
(3, 'Sanjana', 'Thor Love and Thunder', 'Gorr and his daughter, Love, struggle in a barren desert.', 'Thor Love and Thunder-Sanjana', 'Gorr and his daughter, Love, struggle in a barren desert. Despite their prayers to their god, Rapu, Love dies. The god-killing Necrosword weapon calls to Gorr, leading him to Rapu\'s lush realm. After Rapu nonchalantly dismisses Gorr\'s plight and proceeds to strangle him, the Necrosword offers itself to Gorr, who kills Rapu with it and vows to kill all gods. Gorr is granted the ability to manipulate shadows and produce monsters, but is cursed with impending death and corrupted by the sword\'s influence.\r\n\r\nAfter Gorr kills several gods, Thor learns of a distress signal from Sif. Thor parts ways with the Guardians of the Galaxy[N 1] and finds an injured Sif, who warns that Gorr\'s next target is New Asgard. Meanwhile, Dr. Jane Foster, Thor\'s ex-girlfriend, has been diagnosed with Stage IV terminal cancer. With medical treatment proving ineffective, she travels to New Asgard hoping that Thor\'s fractured hammer Mjolnir[N 2] might heal her. Due to an enchantment Thor unknowingly placed on it years earlier to protect Foster, Mjolnir reforges and bonds itself to her. Thor arrives in New Asgard just as Gorr\'s attack begins. Thor is surprised to find Foster wielding Mjolnir, but nevertheless teams up with her, Valkyrie, and Korg to fight Gorr. The group thwarts Gorr, but he escapes, kidnapping several Asgardian children and imprisoning them in the Shadow Realm.\r\n\r\nThe group travels to Omnipotence City, a realm that is home to many gods, to warn them and ask for their help. The leader of the gods, Zeus, fears Gorr and is unwilling to help, thinking they can remain safe and hidden from Gorr in the City. Zeus orders the group\'s capture to prevent them from exposing the City\'s location to Gorr, and in the ensuing fight Korg\'s body is destroyed, though his face remains alive. Thor impales Zeus with his own thunderbolt, which Valkyrie steals before they escape. As the journey continues, Thor and Foster rekindle their romantic relationship and Foster reveals her illness. The group arrives at the Shadow Realm, but are unable to find the children. Foster deduces that the kidnappings were a trap for Gorr to take Thor\'s axe, Stormbreaker, in order to summon the Bifrost and enter the realm of Eternity, who can grant his wish to destroy all gods. Gorr overpowers the group, severely injuring Valkyrie. The group retreats back to Earth, though Gorr manages to steal Stormbreaker.\r\n\r\nDrained of her strength each time she uses Mjolnir, Foster is warned that using it once more will likely kill her. Thor persuades Foster to let him fight Gorr alone while she recuperates. Thor finds the kidnapped children at Eternity\'s altar and, using Zeus\'s thunderbolt, imbues them with his power to fight Gorr\'s monsters while he battles Gorr. When Foster senses that Gorr is about to kill Thor, she joins the battle with Mjolnir to save him. They destroy the Necrosword, freeing Gorr from its influence, but the three are brought into Eternity\'s realm. With Gorr poised to make his wish, Thor implores Gorr to revive his daughter instead of destroying the gods. Thor then leaves Gorr to make his decision and attends to Foster, who succumbs to her illness. Moved by their display, Gorr wishes for Eternity to revive Love, which it grants. As Gorr dies from the curse, he requests Thor to care for Love.\r\n\r\nKorg\'s body is restored and he starts a family, while Foster\'s sacrifice is honored in New Asgard, where Valkyrie and Sif begin training the children. Thor adopts Love, who joins him in his heroics, with the former wielding Mjolnir and the latter wielding Stormbreaker.\r\n\r\nIn a mid-credits scene, a recuperating Zeus sends his son Hercules to kill Thor. In a post-credits scene, Foster arrives at the gates of Valhalla, where she is welcomed by Heimdall.', 'img2', '2022-07-16'),
(20, 'Mamta', '“We Need to Know Our Data”', 'I\'m a little confused. \"foo.html\" is just the name of your template.', '“We-Need-to-Know-Our-Data”-Mamta', 'There’s a widespread—and understandable—unease about attempts to measure or quantify traits that people have historically associated with marginalized groups. This iffy (or even icky) feeling goes back to the very origins of modern data science, and attempts by 19th-century pseudosciences like phrenology and physiognomy to detect and catalog deviance from social norms; at the time, these included not just criminal behavior, but also mental illness and non-heteronormative sexual orientation (the three categories, one should note, stayed lumped together well into the 20th century). Even much more recently, as \r\nMichelle Jane Tat\r\n noted in a TDS post a couple of years ago, “data collection does not really have a great reputation in marginalized communities.” Attempts to, say, leverage AI into some sort of turbocharged gaydar don’t inspire a whole lot of confidence in our collective guardrails against intrusive data-powered technology.\r\n\r\nThere’s a flip side, though, to data’s ability to perpetuate bias and reinforce marginalization: its potential to empower, enlighten, and inform both individuals and institutions. On a social level, it’s all but impossible to tackle social injustice and discrimination without seeing its concrete, real-world effects; on a more granular level—this has also been my personal experience—there are real benefits in seeing one’s own lived experience reflected across broader groups; in some ways, it’s a prerequisite to a sense of community.\r\n\r\nTo mark and celebrate Pride 2021, I wanted to share some of the insightful and important work TDS has published over the years on the intersection of data science and LGBTQIA+ communities. They range from expansive data explorations to personal reflections, and they tackle head-on questions around bias and our ability to bring about positive change. They’re all very much worth your time—this month, and beyond.\r\n\r\nTowards Trans-Inclusive AI\r\nZachary Hay\r\n’s post is centered around a clear and powerful premise:\r\n\r\nThe use of gender as the output of AI algorithms is unscientific because gender identity is under the authority of the individual. It is not something that can be determined by looking at bodies or outward expressions.\r\n\r\nFrom there, Zachary enumerates the multiple ways that companies and organizations are currently using AI and how these practices are harmful in their insistence on a stable, easily detectible gender binary. What I appreciate about Zachary’s post, though, is that it also aims to trace the contours of potential solutions—from insisting on more transparency when it comes to AI use (notably in automated-decision systems in public agencies) to the proactive inclusion of trans knowledge and experience in the design of AI tools.\r\n\r\nTowards Trans-Inclusive AI\r\nAI ‘thinks’ like those who designed them — with a heteronormative conception of gender. They exclude transgender people…\r\ntowardsdatascience.com\r\n\r\nKeeping Data Inclusivity without Diluting Your Results\r\nEven when data scientists wish to address bias in their projects and design them in an equitable way, a tension often arises between the need to keep results statistically meaningful and the desire for an inclusive dataset. \r\nHeather Krause\r\n thinks through the issue with a case study: a survey that touches on sexual orientation, but only receives a small number of responses from certain subgroups.\r\n\r\nKeeping Data Inclusivity Without Diluting your Results\r\nLet’s say you are surveying 100 people out of 10,000. You want to analyse the data from your sample of 100 to get…\r\ntowardsdatascience.com\r\n\r\nGoogle Knew I Was Non-Binary Before I Did\r\nIt’s funny how inherently sexist algorithms can reveal truths about non-conforming people like me. And how that can be a source of relief and freedom for us.\r\n\r\nRhea Moutafis\r\n’s meditation on Google’s ads settings and how they reflected their personal journey as a non-binary person blends together essay, analysis, and memoir. It’s a powerful read, and pushes the boundaries not just of coming-out stories, but of data-science storytelling, too.\r\n\r\nGoogle knew I was non-binary before I did\r\nBut somehow it changed its mind after I came out\r\ntowardsdatascience.com\r\n\r\nData Activism and the Fight for Social Justice in Scotland\r\nDr Kevin Guyan\r\n frames his post around a very specific place—it starts in a police interview room in Edinburgh, and goes on to advocate for social justice and equity in Scotland. But the underlying message of his post applies far more broadly, and serves as a great rallying cry and closing note for this selection:\r\n\r\nTo justify the existence of a social or cultural group that exclusively works with marginalised communities, we need to know our data. Data is ammunition. Data is power.\r\n\r\nData activism and the fight for social justice in Scotland\r\n‘The numbers are too small’ is a poor excuse for inaction against inequality in Scotland\r\ntowardsdatascience.com\r\n\r\nThank you for reading—if you’d like to share your work (or someone else’s) at the nexus of data science, AI, and LGBTQIA+ topics, please drop a link in the comments.\r\n\r\n176\r\n\r\n\r\n176\r\n\r\n\r\n\r\n\r\nSign up for The Variable\r\nBy Towards Data Science\r\nEvery Thursday, the Variable delivers the very best of Towards Data Science: from hands-on tutorials and cutting-edge research to original features you don\'t want to miss. Take a look.\r\n\r\n\r\nGet this newsletter\r\nMore from Towards Data Science\r\nFollow\r\nYour home for data science. A Medium publication sharing concepts, ideas and codes.\r\n\r\nAngelica Lo Duca\r\nAngelica Lo Duca\r\n\r\n·Jun 23, 2021\r\n\r\nR for Beginners — Part 1: Data Structures\r\nAn interactive article to learn the R language in a very simple way. — With this article I start a series of tutorials for beginners to learn the R language in a very easy and interactive way. Interactive? Yes, really interactive :) In the complete R for Beginners Part 1 tutorials, you will learn how to deal with the most common data structures: vector …\r\n\r\nData Science\r\n4 min read\r\n\r\nR for Beginners — Part 1: Data Structures\r\nShare your ideas with millions of readers.\r\n\r\nWrite on Medium\r\nCurt Langlotz\r\nCurt Langlotz\r\n\r\n·Jun 23, 2021\r\n\r\nGetting Started in Medical AI\r\nA Guide to Online Learning Resources for Clinicians — As artificial intelligence (AI) transforms medical practice, all clinicians will become users of machine learning technology and will need to learn the basics of AI and machine learning. As you plan to upgrade your machine learning knowledge, you may be baffled by the many available educational options. I recently completed…\r\n\r\nArtificial Intelligence\r\n7 min read\r\n\r\nGetting Started in Medical AI\r\nWouter van Heeswijk, PhD\r\nWouter van Heeswijk, PhD\r\n\r\n·Jun 23, 2021\r\n\r\nAbout Post-Decision States Again\r\nOn the (not so) subtle differences between state-action pairs and post-decision states in Reinforcement Learning. — My previous article on post-decision states didn’t receive a lot of traction, so I decide', 'img1', '2022-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `age` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateofsignup` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `username`, `email`, `phone`, `age`, `password`, `dateofsignup`) VALUES
(7, 'Himanshu Kukreja', 'himansharora2001@gmail.com', '9915579903', 21, 'sha256$58nIO6Hj$e4d130079a04bd8106c9d25c8291b26563efdf3d3d20be0768f050f0ce6f910a', '2022-07-16 01:19:41'),
(8, 'Sanjana', 'sanjana@gmai.com', '8427915799', 22, 'sha256$PtlMf8z9$dcd8cc676aae396708b42397a15310827500e8c259417cd1aa1dc327aed28ff0', '2022-07-16 02:23:01'),
(9, 'Mamta', '123@gmail.com', '8427915799', 41, 'sha256$bdNQDFFb$1ab6f91dfd48c07e550b8ab81b927ed26101d71f04f5282159b1a87da94ab315', '2022-07-16 17:45:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
