
CREATE DATABASE IF NOT EXISTS cftunes;
USE cftunes;

--
-- Definition of table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `albumId` bigint(20) NOT NULL AUTO_INCREMENT,
  `artistId` bigint(20) NOT NULL,
  `albumName` varchar(255) NOT NULL,
  `imageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`albumId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` (`albumId`,`artistId`,`albumName`,`imageId`) VALUES 
 (1,1,'Meteora',NULL),
 (2,1,'Hybrid Theory',NULL),
 (3,2,'Metallica',NULL),
 (4,8,'Division Bell',NULL),
 (5,9,'Every Breath You Take: The Singles',NULL),
 (6,2,'Load',NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;


--
-- Definition of table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `artistId` bigint(20) NOT NULL AUTO_INCREMENT,
  `artistName` varchar(255) NOT NULL,
  `imageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`artistId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` (`artistId`,`artistName`,`imageId`) VALUES 
 (1,'Linkin Park',1),
 (2,'Metallica',2),
 (8,'Pink Floyd',11),
 (9,'The Police',NULL);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;


--
-- Definition of table `artist_subgenre`
--

DROP TABLE IF EXISTS `artist_subgenre`;
CREATE TABLE `artist_subgenre` (
  `artistId` bigint(20) NOT NULL,
  `subGenreId` bigint(20) NOT NULL,
  PRIMARY KEY (`artistId`,`subGenreId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_subgenre`
--

/*!40000 ALTER TABLE `artist_subgenre` DISABLE KEYS */;
INSERT INTO `artist_subgenre` (`artistId`,`subGenreId`) VALUES 
 (1,4),
 (2,6),
 (8,7),
 (9,9);
/*!40000 ALTER TABLE `artist_subgenre` ENABLE KEYS */;


--
-- Definition of table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `genreId` bigint(20) NOT NULL AUTO_INCREMENT,
  `genreName` varchar(255) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`genreId`,`genreName`,`imageUrl`) VALUES 
 (1,'Rock','rock.png'),
 (2,'Electronic','electronic.png'),
 (3,'Blues','blue.png'),
 (4,'Hip-Hop','hiphop.png'),
 (5,'Metal','metal.png'),
 (6,'Pop','pop.png'),
 (7,'R&B','R&B.png'),
 (8,'Alternative','alternative.png'),
 (9,'Dance','dance.png');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;


--
-- Definition of table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `imageName` varchar(255) DEFAULT NULL,
  `imageFileName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`imageId`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`imageId`,`imageName`,`imageFileName`) VALUES 
 (1,'Linkin Park','1.jpg'),
 (2,'Metallica','2.jpg'),
 (8,'Division Bell_Cluster One',NULL),
 (9,'Division Bell_What Do You Want From Me',NULL),
 (10,'Division Bell_Poles Apart',NULL),
 (11,'pink_floyd_img','3.jpg'),
 (12,'Metallica_My Friend Of Misery','Metallica_My Friend Of Misery.png'),
 (13,'Metallica_Sad But True','Metallica_Sad But True.png'),
 (14,'Load_Hero Of The Day','Load_Hero Of The Day.png'),
 (15,'Load_King Nothing','Load_King Nothing.png'),
 (16,'Load_The House Jack Built','Load_The House Jack Built.png');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


--
-- Definition of table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist` (
  `playlistId` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `playlistName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`playlistId`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist`
--

/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` (`playlistId`,`createdBy`,`playlistName`,`description`,`createdOn`) VALUES 
 (1,1,'Linkin Park Favorite','Best of Linkin park','2009-06-28 00:00:00'),
 (2,1,'Best Metal',NULL,'2009-06-28 00:00:00'),
 (3,1,'Metallica Fav','Metallica Fav','2009-06-28 00:00:00'),
 (4,1,'Disturbed Fav','Disturbed Fav','2009-06-28 00:00:00'),
 (5,1,'Limp Bizkit Fav','Limp Bizkit Fav','2009-06-28 00:00:00'),
 (6,1,'My Metal','My Metal','2009-06-28 00:00:00'),
 (7,1,'Heavy Metal','Heavy Metal','2009-06-28 00:00:00'),
 (8,1,'Death Metal','Death Metal','2009-06-28 00:00:00'),
 (9,1,'Smoothing Music','Smoothing Music','2009-06-28 16:30:45'),
 (10,1,'GT  Playlist','GT  Playlist','2009-07-12 22:55:58'),
 (11,1,'Vamsee Playlist','Vamsee Playlist','2009-07-13 11:43:18'),
 (12,1,'Gaurav Tiwari','Gaurav Tiwari','2009-07-13 11:55:07'),
 (13,1,'Praveen','This is praveen playlist','2009-07-13 17:14:58'),
 (14,1,'MyPlaylist','This is my playlist.','2009-07-14 10:44:25'),
 (15,1,'PrabsPlaylist','This is Prabs.','2009-07-16 16:59:43'),
 (16,6,'HoneyPlaylist','This is honey Playlist','2009-07-16 23:39:27'),
 (17,7,'Evelin','This is my playlist','2009-07-17 18:47:57'),
 (18,1,'Thats Me','This playlist is mine.','2009-07-20 14:50:31'),
 (19,6,'MySecond','My second playlist','2009-07-20 14:53:23'),
 (20,6,'MyThird','This is my third playlist','2009-07-20 14:55:37'),
 (21,9,'Pink Floyd','This is my playlist.','2009-07-20 18:22:44'),
 (22,1,'My Playlist2','This is my Playlist','2009-07-21 15:36:05'),
 (23,1,'My Playlist 3','This is my description.','2009-07-23 16:59:33'),
 (24,10,'GymMike','Listen to this play list in GYM.','2009-07-31 20:16:28'),
 (25,10,'GymMike2','Listen to this play list in GYM.','2009-07-31 20:16:38'),
 (26,10,'Gaurav','Description','2009-07-31 20:20:15'),
 (27,1,'GymWorkOut','Listen this playlist in GYM.','2009-07-31 20:26:39'),
 (28,1,'HimaPlaylist','asdf','2009-08-06 15:27:46'),
 (29,1,'gtplaylist','This is my playlist','2009-08-15 11:34:59');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;


--
-- Definition of table `playlist_song`
--

DROP TABLE IF EXISTS `playlist_song`;
CREATE TABLE `playlist_song` (
  `playlistId` bigint(20) NOT NULL,
  `songId` bigint(20) NOT NULL,
  PRIMARY KEY (`playlistId`,`songId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist_song`
--

/*!40000 ALTER TABLE `playlist_song` DISABLE KEYS */;
INSERT INTO `playlist_song` (`playlistId`,`songId`) VALUES 
 (1,1),
 (1,2),
 (1,3),
 (1,4),
 (2,5),
 (2,6),
 (2,7),
 (5,4),
 (6,2),
 (8,2),
 (9,12),
 (11,3),
 (12,4),
 (13,2),
 (13,4),
 (14,3),
 (15,4),
 (17,2),
 (17,3),
 (21,20),
 (21,21),
 (23,3),
 (23,4),
 (27,1),
 (27,3),
 (27,4),
 (27,24),
 (29,5);
/*!40000 ALTER TABLE `playlist_song` ENABLE KEYS */;


--
-- Definition of table `playlist_subgenre`
--

DROP TABLE IF EXISTS `playlist_subgenre`;
CREATE TABLE `playlist_subgenre` (
  `playlistId` bigint(20) NOT NULL,
  `subgenreId` bigint(20) NOT NULL,
  PRIMARY KEY (`playlistId`,`subgenreId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist_subgenre`
--

/*!40000 ALTER TABLE `playlist_subgenre` DISABLE KEYS */;
INSERT INTO `playlist_subgenre` (`playlistId`,`subgenreId`) VALUES 
 (1,3),
 (1,4),
 (1,5),
 (10,1),
 (10,2),
 (11,1),
 (11,4),
 (11,5),
 (12,1),
 (12,2),
 (13,1),
 (13,3),
 (14,1),
 (14,2),
 (14,4),
 (15,7),
 (15,8),
 (16,2),
 (16,7),
 (17,1),
 (18,1),
 (18,4),
 (18,6),
 (19,1),
 (20,1),
 (20,2),
 (21,4),
 (21,6),
 (21,7),
 (22,1),
 (22,4),
 (23,1),
 (23,2),
 (23,4),
 (26,3),
 (26,4),
 (26,5),
 (27,3),
 (27,4),
 (27,6),
 (28,2),
 (28,4),
 (28,7),
 (29,1),
 (29,2);
/*!40000 ALTER TABLE `playlist_subgenre` ENABLE KEYS */;


--
-- Definition of table `playlist_tag`
--

DROP TABLE IF EXISTS `playlist_tag`;
CREATE TABLE `playlist_tag` (
  `playlistId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`playlistId`,`tagId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist_tag`
--

/*!40000 ALTER TABLE `playlist_tag` DISABLE KEYS */;
INSERT INTO `playlist_tag` (`playlistId`,`tagId`) VALUES 
 (1,1),
 (1,2),
 (1,3),
 (1,4),
 (18,9),
 (19,9),
 (20,3),
 (20,10),
 (20,11),
 (21,5),
 (21,7),
 (21,12),
 (22,1),
 (22,5),
 (22,11),
 (23,1),
 (23,5),
 (23,13),
 (24,1),
 (24,14),
 (25,1),
 (25,14),
 (26,13),
 (27,14),
 (27,15),
 (28,1),
 (28,14),
 (29,8),
 (29,10),
 (29,11);
/*!40000 ALTER TABLE `playlist_tag` ENABLE KEYS */;


--
-- Definition of table `playlistmood`
--

DROP TABLE IF EXISTS `playlistmood`;
CREATE TABLE `playlistmood` (
  `moodId` bigint(20) NOT NULL AUTO_INCREMENT,
  `moodName` varchar(255) NOT NULL,
  `moodDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`moodId`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlistmood`
--

/*!40000 ALTER TABLE `playlistmood` DISABLE KEYS */;
INSERT INTO `playlistmood` (`moodId`,`moodName`,`moodDescription`) VALUES 
 (1,'Blues','Saddy-Saddy'),
 (2,'Euphoria','Areeeeeee !!!'),
 (3,'Romantic','Luv u !!!!'),
 (4,'Pleasant',NULL),
 (5,'Angry','Finish him !!!'),
 (6,'Depressed',NULL),
 (7,'Festive',NULL),
 (8,'Party',NULL),
 (9,'Lazy','Life is cool !!!'),
 (10,'Irritated','Dont Bugged me .....'),
 (11,'Head-Banging',NULL);
/*!40000 ALTER TABLE `playlistmood` ENABLE KEYS */;


--
-- Definition of table `playlistmood_playlist`
--

DROP TABLE IF EXISTS `playlistmood_playlist`;
CREATE TABLE `playlistmood_playlist` (
  `moodId` bigint(20) NOT NULL,
  `playlistId` bigint(20) NOT NULL,
  PRIMARY KEY (`moodId`,`playlistId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlistmood_playlist`
--

/*!40000 ALTER TABLE `playlistmood_playlist` DISABLE KEYS */;
INSERT INTO `playlistmood_playlist` (`moodId`,`playlistId`) VALUES 
 (1,10),
 (1,20),
 (1,22),
 (2,10),
 (2,12),
 (2,18),
 (2,20),
 (2,22),
 (2,23),
 (2,29),
 (3,11),
 (3,15),
 (3,16),
 (3,23),
 (3,26),
 (3,29),
 (4,11),
 (4,14),
 (4,16),
 (4,28),
 (5,1),
 (5,13),
 (5,16),
 (5,18),
 (5,19),
 (5,21),
 (5,26),
 (6,12),
 (6,21),
 (6,27),
 (6,28),
 (7,17),
 (7,26),
 (8,13),
 (8,15),
 (8,18),
 (9,11),
 (9,21),
 (10,23),
 (11,1),
 (11,14),
 (11,27);
/*!40000 ALTER TABLE `playlistmood_playlist` ENABLE KEYS */;


--
-- Definition of table `playlistrating`
--

DROP TABLE IF EXISTS `playlistrating`;
CREATE TABLE `playlistrating` (
  `ratingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `playlistId` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `ratedBy` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `favorite` tinyint(4) DEFAULT '0',
  `ratedOn` datetime NOT NULL,
  PRIMARY KEY (`ratingId`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlistrating`
--

/*!40000 ALTER TABLE `playlistrating` DISABLE KEYS */;
INSERT INTO `playlistrating` (`ratingId`,`playlistId`,`rating`,`ratedBy`,`comment`,`favorite`,`ratedOn`) VALUES 
 (1,1,4,1,'Cool playlist !!!',1,'2009-07-11 21:39:50'),
 (2,1,3,2,'Average Playlist.. Nothing New',0,'2009-07-11 21:40:52'),
 (3,15,3,1,'Man only one song!!!!',1,'2009-07-16 22:13:18'),
 (5,13,4,1,'Good playlist.',1,'2009-07-16 22:56:25'),
 (6,14,5,1,'Wow.',1,'2009-07-16 23:26:48'),
 (7,12,4,1,'Cool!',1,'2009-07-16 23:30:41'),
 (8,11,4,1,'Good one!!!!',1,'2009-07-16 23:33:57'),
 (9,15,4,6,'1 Song playlist.:)',1,'2009-07-16 23:42:38'),
 (10,13,4,6,'Superb Playlist.',1,'2009-07-17 07:13:10'),
 (11,12,4,6,'I Like This.',1,'2009-07-17 07:16:14'),
 (12,11,5,6,'Superb!!!!!',1,'2009-07-17 07:18:59'),
 (13,14,4,6,'Stunning!!!',1,'2009-07-17 07:23:45'),
 (14,14,4,6,'You are killing me!!!',1,'2009-07-17 07:25:59'),
 (15,14,4,6,'This is superb!!!!',1,'2009-07-17 07:32:50'),
 (16,14,4,6,'Comment',1,'2009-07-17 07:33:56'),
 (17,12,4,6,'Cool!!!!',1,'2009-07-17 07:36:44'),
 (18,13,5,6,'Killing playlist!!!',1,'2009-07-17 07:41:10'),
 (19,16,4,6,'My Comment On my playlist.',1,'2009-07-17 07:44:45'),
 (20,16,4,6,'My Comment On my playlist.',1,'2009-07-17 07:44:45'),
 (21,16,4,6,'My Comment On my playlist.',1,'2009-07-17 07:45:01'),
 (22,16,2,1,'My comment.',1,'2009-07-17 12:40:08'),
 (23,17,3,1,'Aaeee Playlist !!!!\n',1,'2009-07-17 18:51:14'),
 (24,21,4,1,'This is a nice playlist',1,'2009-07-23 16:54:36'),
 (25,21,4,1,'Hey Cool Playlist...:)',1,'2009-07-31 20:28:44'),
 (26,29,4,1,'Cool playlist',1,'2009-08-15 11:35:51');
/*!40000 ALTER TABLE `playlistrating` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) NOT NULL,
  `roleDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roleId`,`roleName`,`roleDescription`) VALUES 
 (1,'Administrator','Administrator'),
 (2,'User','User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `rtmsongs`
--

DROP TABLE IF EXISTS `rtmsongs`;
CREATE TABLE `rtmsongs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `addedOn` datetime NOT NULL,
  `addedBy` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtmsongs`
--

/*!40000 ALTER TABLE `rtmsongs` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtmsongs` ENABLE KEYS */;


--
-- Definition of table `song`
--

DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `songId` bigint(20) NOT NULL AUTO_INCREMENT,
  `albumId` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `imageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`songId`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `song`
--

/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` (`songId`,`albumId`,`name`,`path`,`imageId`) VALUES 
 (1,1,'01 Somewhere I Belong.mp3','/Linkin Park/Meteora/01 Somewhere I Belong.mp3',NULL),
 (2,1,'04 Lying From You.mp3','/Linkin Park/Meteora/04 Lying From You.mp3',NULL),
 (3,1,'05 Hit The Floor.mp3','/Linkin Park/Meteora/05 Hit The Floor.mp3',NULL),
 (4,1,'06 Easier To Run.mp3','/Linkin Park/Meteora/06 Easier To Run.mp3',NULL),
 (5,1,'08 Figure.09.mp3','/Linkin Park/Meteora/08 Figure.09.mp3',NULL),
 (6,1,'09 Breaking The Habit.mp3','/Linkin Park/Meteora/09 Breaking The Habit.mp3',NULL),
 (7,1,'10 From The Inside.mp3','/Linkin Park/Meteora/10 From The Inside.mp3',NULL),
 (8,1,'11 Nobody\'s Listening.mp3','/Linkin Park/Meteora/11 Nobody\'s Listening.mp3',NULL),
 (9,1,'12 Session.mp3','/Linkin Park/Meteora/12 Session.mp3',NULL),
 (10,1,'13 Numb.mp3','/Linkin Park/Meteora/13 Numb.mp3',NULL),
 (11,1,'Don\'t Stay.mp3','/Linkin Park/Meteora/Don\'t Stay.mp3',NULL),
 (12,1,'Faint.mp3','/Linkin Park/Meteora/Faint.mp3',NULL),
 (13,3,'Holier Than Thou','/Metallica/Metallica/Holier Than Thou.mp3',NULL),
 (19,4,'Cluster One','/Pink Floyd/Division Bell/01 Cluster One.mp3',NULL),
 (20,4,'What Do You Want From Me','/Pink Floyd/Division Bell/02 What Do You Want From Me.mp3',NULL),
 (21,4,'Poles Apart','/Pink Floyd/Division Bell/03 Poles Apart.mp3',NULL),
 (22,4,'Marooned','/Pink Floyd/Division Bell/04 Marooned.mp3',NULL),
 (23,3,'My Friend Of Misery','/Metallica/Metallica/My Friend Of Misery.mp3',12),
 (24,3,'Nothing Else Matters','/Metallica/Metallica/Nothing Else Matters.mp3',NULL),
 (25,3,'Sad But True','/Metallica/Metallica/Sad But True.mp3',13),
 (26,6,'Hero Of The Day','/Metallica/Load/Hero Of The Day.mp3',14),
 (27,6,'King Nothing','/Metallica/Load/King Nothing.mp3',15),
 (28,6,'The House Jack Built','/Metallica/Load/The House Jack Built.mp3',16);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;


--
-- Definition of table `song_subgenre`
--

DROP TABLE IF EXISTS `song_subgenre`;
CREATE TABLE `song_subgenre` (
  `songId` bigint(20) NOT NULL,
  `subGenreId` bigint(20) NOT NULL,
  PRIMARY KEY (`songId`,`subGenreId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `song_subgenre`
--

/*!40000 ALTER TABLE `song_subgenre` DISABLE KEYS */;
INSERT INTO `song_subgenre` (`songId`,`subGenreId`) VALUES 
 (13,6),
 (14,7),
 (15,7),
 (16,7),
 (17,7),
 (18,7),
 (19,8),
 (20,8),
 (21,8),
 (22,8),
 (23,6),
 (24,6),
 (25,6),
 (26,6),
 (27,6),
 (28,6);
/*!40000 ALTER TABLE `song_subgenre` ENABLE KEYS */;


--
-- Definition of table `subgenre`
--

DROP TABLE IF EXISTS `subgenre`;
CREATE TABLE `subgenre` (
  `subGenreId` bigint(20) NOT NULL AUTO_INCREMENT,
  `genreId` bigint(20) NOT NULL,
  `subGenreName` varchar(255) NOT NULL,
  PRIMARY KEY (`subGenreId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subgenre`
--

/*!40000 ALTER TABLE `subgenre` DISABLE KEYS */;
INSERT INTO `subgenre` (`subGenreId`,`genreId`,`subGenreName`) VALUES 
 (1,1,'Alternative Rock'),
 (2,1,'Arena Rock'),
 (3,5,'Nu Metal'),
 (4,5,'Rapcore'),
 (5,5,'Alternative Metal'),
 (6,5,'Heavy Metal'),
 (7,1,'Psychedelic Rock'),
 (8,1,'Division Bell'),
 (9,1,'Rock');
/*!40000 ALTER TABLE `subgenre` ENABLE KEYS */;


--
-- Definition of table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tagId`,`tagName`) VALUES 
 (1,'Linkin-Park'),
 (2,'Metal'),
 (3,'Killing-Playlist'),
 (4,'Inside-Out'),
 (5,'Love'),
 (6,'Romance'),
 (7,'Hate'),
 (8,'Sad'),
 (9,'Aeeeeee'),
 (10,'lovely'),
 (11,'sweety'),
 (12,'orm'),
 (13,'Gaurav'),
 (14,'gym'),
 (15,'Heavy');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`,`userName`,`email`,`gender`,`password`,`dob`) VALUES 
 (1,'ozeetee','gtiwari@adobe.com','Male','gtiwari','2009-08-25 15:01:49'),
 (2,'vamsee','vamsee@gmail','Male','vamsee','2009-08-25 15:01:54'),
 (3,'admin','admin@cfTunes.com','Male','admin','2009-08-24 15:01:58'),
 (5,'gtiwari','gauravtiwari.in@gmail.com','Male','gtiwari','2009-08-25 15:02:02'),
 (6,'honey','honey_gyan@gmail.com','Male','honey','2009-08-24 15:02:06'),
 (7,'evelin','evelinv@adobe.com','Female','evelin','2009-08-18 15:02:10'),
 (8,'prabs','prabs@adobe.com','Male','prabs','2009-08-19 15:02:13'),
 (9,'rupesh','rukumar@adobe.com','Male','rupesh','2009-08-20 15:02:17'),
 (10,'mike','mike@adobe.com','Male','mike','2009-08-13 15:02:21'),
 (11,'sagar','sagar@adobe.com','Male','sagarGanatra','2006-01-02 00:00:01'),
 (12,'tiku','tiku@tiku.com','Male','P@$$w0rd','1987-02-20 00:00:01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_artist`
--

DROP TABLE IF EXISTS `user_artist`;
CREATE TABLE `user_artist` (
  `userId` bigint(20) NOT NULL,
  `artistId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`artistId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_artist`
--

/*!40000 ALTER TABLE `user_artist` DISABLE KEYS */;
INSERT INTO `user_artist` (`userId`,`artistId`) VALUES 
 (1,1);
/*!40000 ALTER TABLE `user_artist` ENABLE KEYS */;


--
-- Definition of table `user_playlist`
--

DROP TABLE IF EXISTS `user_playlist`;
CREATE TABLE `user_playlist` (
  `userId` bigint(20) NOT NULL,
  `playlistId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`playlistId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_playlist`
--

/*!40000 ALTER TABLE `user_playlist` DISABLE KEYS */;
INSERT INTO `user_playlist` (`userId`,`playlistId`) VALUES 
 (1,1),
 (1,11),
 (1,17),
 (9,1);
/*!40000 ALTER TABLE `user_playlist` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`roleId`,`userId`) VALUES 
 (1,3),
 (2,1),
 (2,2),
 (2,3);
