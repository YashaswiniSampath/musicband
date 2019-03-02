-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5293
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;

-- Dumping structure for table test.band
CREATE TABLE IF NOT EXISTS `band` (
  `bandid` int(11) NOT NULL,
  `bandName` varchar(50) DEFAULT NULL,
  `leadvocal` varchar(50) DEFAULT NULL,
  `guitarist` varchar(50) DEFAULT NULL,
  `drums` varchar(50) DEFAULT '0',
  PRIMARY KEY (`bandid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is designed to collect all the data related to the information of Artist.';

-- Dumping data for table test.band: ~2 rows (approximately)
DELETE FROM `band`;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` (`bandid`, `bandName`, `leadvocal`, `guitarist`, `drums`) VALUES
	(1, 'abc', 'aaa', 'bbb', 'ccc'),
	(2, 'def', 'ddd', 'eee', 'fff');
/*!40000 ALTER TABLE `band` ENABLE KEYS */;

-- Dumping structure for table test.live
CREATE TABLE IF NOT EXISTS `live` (
  `liveID` int(11) NOT NULL,
  `bandName` varchar(50) DEFAULT NULL,
  `venue` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`liveID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is designed to collect all the data related to band’s Live performances with respected dates.';

-- Dumping data for table test.live: ~4 rows (approximately)
DELETE FROM `live`;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
INSERT INTO `live` (`liveID`, `bandName`, `venue`, `date`) VALUES
	(11, 'abc', 'bangalore', '2018-10-21'),
	(12, 'abc', 'goa', '2018-11-21'),
	(13, 'def', 'pondi', '2018-10-01'),
	(14, 'def', 'goa', '2018-09-30');
/*!40000 ALTER TABLE `live` ENABLE KEYS */;

-- Dumping structure for table test.new
CREATE TABLE IF NOT EXISTS `new` (
  `bandName` varchar(50) DEFAULT NULL,
  `noOfPeople` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='new band people';

-- Dumping data for table test.new: ~4 rows (approximately)
DELETE FROM `new`;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
INSERT INTO `new` (`bandName`, `noOfPeople`) VALUES
	('qwe', 4),
	('ret', 2),
	('xtu', 1),
	('tyu', 1),
	('sdf', 4);
/*!40000 ALTER TABLE `new` ENABLE KEYS */;

-- Dumping structure for table test.song
CREATE TABLE IF NOT EXISTS `song` (
  `albumID` int(11) NOT NULL,
  `tracklist` varchar(50) DEFAULT NULL,
  `bandID` int(11) DEFAULT NULL,
  `bandname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`albumID`),
  KEY `FK_song_band` (`bandID`),
  CONSTRAINT `FK_song_band` FOREIGN KEY (`bandID`) REFERENCES `band` (`bandid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is designed to collect all the data related to band’s track listings.';

-- Dumping data for table test.song: ~3 rows (approximately)
DELETE FROM `song`;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` (`albumID`, `tracklist`, `bandID`, `bandname`) VALUES
	(21, 'xyz', 1, 'abc'),
	(22, 'pqr', 1, 'abc'),
	(23, 'stu', 2, 'def');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
