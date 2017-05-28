DROP TABLE IF EXISTS `aowow_profiler_sync`;
CREATE TABLE `aowow_profiler_sync` (
  `realm` tinyint(3) unsigned NOT NULL,
  `realmGUID` int(10) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `typeId` int(10) unsigned NOT NULL,
  `requestTime` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `errorCode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `realm_realmGUID_type_typeId` (`realm`,`realmGUID`,`type`),
  UNIQUE KEY `type_typeId` (`type`,`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_guild`;
CREATE TABLE `aowow_profiler_guild` (
  `id` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL DEFAULT '0',
  `realmGUID` int(10) unsigned NOT NULL DEFAULT '0',
  `cuFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(26) NOT NULL DEFAULT '',
  `emblemStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emblemColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `borderColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `backgroundColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info` varchar(500) NOT NULL DEFAULT '',
  `createDate` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `name` (`name`),
  KEY `guild` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_guild_rank`;
CREATE TABLE `aowow_profiler_guild_rank` (
  `guildId` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`guildId`,`rank`),
  KEY `rank` (`rank`),
  CONSTRAINT `FK_aowow_profiler_guild_rank_aowow_profiler_guild` FOREIGN KEY (`guildId`) REFERENCES `aowow_profiler_guild` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_profiles`;
CREATE TABLE `aowow_profiler_profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realm` tinyint(3) unsigned DEFAULT NULL,
  `realmGUID` int(11) unsigned DEFAULT NULL,
  `cuFlags` int(11) unsigned NOT NULL DEFAULT '0',
  `sourceId` int(11) unsigned DEFAULT NULL,
  `sourceName` varchar(50) DEFAULT NULL,
  `copy` int(10) unsigned DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `user` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  `guild` int(10) unsigned NULL,
  `guildrank` tinyint(3) unsigned DEFAULT NULL COMMENT '0: guild master',
  `skincolor` tinyint(3) unsigned NOT NULL,
  `hairstyle` tinyint(3) unsigned NOT NULL,
  `haircolor` tinyint(3) unsigned NOT NULL,
  `facetype` tinyint(3) unsigned NOT NULL,
  `features` tinyint(3) unsigned NOT NULL,
  `nomodelMask` int(11) unsigned NOT NULL DEFAULT '0',
  `title` tinyint(3) unsigned NOT NULL,
  `description` text NULL,
  `playedtime` int(11) unsigned NOT NULL,
  `gearscore` smallint(5) unsigned NOT NULL,
  `lastupdated` int(11) NOT NULL,
  `talenttree1` tinyint(4) unsigned NOT NULL COMMENT 'points spend in 1st tree',
  `talenttree2` tinyint(4) unsigned NOT NULL COMMENT 'points spend in 2nd tree',
  `talenttree3` tinyint(4) unsigned NOT NULL COMMENT 'points spend in 3rd tree',
  `talentbuild1` varchar(105) NOT NULL,
  `talentbuild2` varchar(105) NOT NULL,
  `glyphs1` varchar(45) NOT NULL,
  `glyphs2` varchar(45) NOT NULL,
  `activespec` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `realm_realmGUID_name` (`realm`,`realmGUID`,`name`),
  KEY `user` (`user`),
  KEY `guild` (`guild`),
  CONSTRAINT `FK_aowow_profiler_profiles_aowow_profiler_guild` FOREIGN KEY (`guild`) REFERENCES `aowow_profiler_guild` (`id`) ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_items`;
CREATE TABLE `aowow_profiler_items` (
  `id` int(11) unsigned DEFAULT NULL,
  `slot` tinyint(3) unsigned DEFAULT NULL,
  `item` mediumint(8) unsigned DEFAULT NULL,
  `subItem` smallint(6) DEFAULT NULL,
  `permEnchant` mediumint(8) unsigned DEFAULT NULL,
  `tempEnchant` mediumint(8) unsigned DEFAULT NULL,
  `extraSocket` tinyint(3) unsigned DEFAULT NULL COMMENT 'not used .. the appropriate gem slot is set to -1 instead',
  `gem1` mediumint(8) DEFAULT NULL,
  `gem2` mediumint(8) DEFAULT NULL,
  `gem3` mediumint(8) DEFAULT NULL,
  `gem4` mediumint(8) DEFAULT NULL,
  UNIQUE KEY `id_slot` (`id`,`slot`),
  KEY `id` (`id`),
  CONSTRAINT `FK_pr_items` FOREIGN KEY (`id`) REFERENCES `aowow_profiler_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_arena_team`;
CREATE TABLE `aowow_profiler_arena_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `realm` tinyint(3) unsigned NOT NULL,
  `realmGUID` int(10) unsigned NOT NULL,
  `name` varchar(24) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cuFlags` int(11) unsigned NOT NULL,
  `rating` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `backgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `emblemStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `borderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `realm_realmGUID` (`realm`,`realmGUID`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_arena_team_member`;
CREATE TABLE `aowow_profiler_arena_team_member` (
  `arenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `profileId` int(10) unsigned NOT NULL DEFAULT '0',
  `captain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `personalRating` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`,`profileId`),
  KEY `guid` (`profileId`),
  CONSTRAINT `FK_aowow_profiler_arena_team_member_aowow_profiler_arena_team` FOREIGN KEY (`arenaTeamId`) REFERENCES `aowow_profiler_arena_team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aowow_profiler_arena_team_member_aowow_profiler_profiles` FOREIGN KEY (`profileId`) REFERENCES `aowow_profiler_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_completion`;
CREATE TABLE `aowow_profiler_completion` (
  `id` int(11) unsigned NOT NULL,
  `type` smallint(6) unsigned NOT NULL,
  `typeId` mediumint(9) NOT NULL,
  `cur` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `FK_pr_completion` FOREIGN KEY (`id`) REFERENCES `aowow_profiler_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_pets`;
CREATE TABLE `aowow_profiler_pets` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `family` tinyint(3) unsigned DEFAULT NULL,
  `npc` smallint(5) unsigned DEFAULT NULL,
  `displayId` smallint(5) unsigned DEFAULT NULL,
  `talents` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `FK_pr_pets` FOREIGN KEY (`owner`) REFERENCES `aowow_profiler_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `aowow_profiler_excludes`;
CREATE TABLE `aowow_profiler_excludes` (
  `type` smallint(5) unsigned NOT NULL,
  `typeId` mediumint(8) unsigned NOT NULL,
  `groups` smallint(5) unsigned NOT NULL COMMENT 'see exclude group defines',
  `comment` varchar(50) NOT NULL COMMENT 'rebuilding profiler files will delete everything without a comment',
  PRIMARY KEY (`type`,`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `aowow_profiler_excludes` (`type`, `typeId`, `groups`, `comment`) VALUES
	(6, 459, 1, 'Gray Wolf'),
	(6, 468, 1, 'White Stallion'),
	(6, 471, 1, 'Palamino'),
	(6, 472, 1, 'Pinto'),
	(6, 578, 1, 'Black Wolf'),
	(6, 579, 1, 'Red Wolf'),
	(6, 581, 1, 'Winter Wolf'),
	(6, 3363, 1, 'Nether Drake'),
	(6, 6896, 1, 'Black Ram'),
	(6, 6897, 1, 'Blue Ram'),
	(6, 8980, 1, 'Skeletal Horse'),
	(6, 10681, 1, 'Summon Cockatoo'),
	(6, 10686, 1, 'Summon Prairie Chicken'),
	(6, 10687, 1, 'Summon White Plymouth Rock'),
	(6, 10699, 1, 'Summon Bronze Whelpling'),
	(6, 10700, 1, 'Summon Faeling'),
	(6, 10701, 1, 'Summon Dart Frog'),
	(6, 10702, 1, 'Summon Island Frog'),
	(6, 10705, 1, 'Summon Eagle Owl'),
	(6, 10708, 1, 'Summon Snowy Owl'),
	(6, 10710, 1, 'Summon Cottontail Rabbit'),
	(6, 10712, 1, 'Summon Spotted Rabbit'),
	(6, 10715, 1, 'Summon Blue Racer'),
	(6, 10718, 1, 'Green Water Snake'),
	(6, 10719, 1, 'Ribbon Snake'),
	(6, 10720, 1, 'Scarlet Snake'),
	(6, 10721, 1, 'Summon Elven Wisp'),
	(6, 10795, 1, 'Ivory Raptor'),
	(6, 10798, 1, 'Obsidian Raptor'),
	(6, 15648, 1, 'Corrupted Kitten'),
	(6, 15779, 1, 'White Mechanostrider Mod B'),
	(6, 15780, 1, 'Green Mechanostrider'),
	(6, 15781, 1, 'Steel Mechanostrider'),
	(6, 16055, 1, 'Black Nightsaber'),
	(6, 16056, 1, 'Ancient Frostsaber'),
	(6, 16058, 1, 'Primal Leopard'),
	(6, 16059, 1, 'Tawny Sabercat'),
	(6, 16060, 1, 'Golden Sabercat'),
	(6, 16080, 1, 'Red Wolf'),
	(6, 16081, 1, 'Winter Wolf'),
	(6, 16082, 1, 'Palomino'),
	(6, 16083, 1, 'White Stallion'),
	(6, 16084, 1, 'Mottled Red Raptor'),
	(6, 17450, 1, 'Ivory Raptor'),
	(6, 17455, 1, 'Purple Mechanostrider'),
	(6, 17456, 1, 'Red and Blue Mechanostrider'),
	(6, 17458, 1, 'Fluorescent Green Mechanostrider'),
	(6, 17459, 1, 'Icy Blue Mechanostrider Mod A'),
	(6, 17460, 1, 'Frost Ram'),
	(6, 17461, 1, 'Black Ram'),
	(6, 17468, 1, 'Pet Fish'),
	(6, 17469, 1, 'Pet Stone'),
	(6, 18363, 1, 'Riding Kodo'),
	(6, 18991, 1, 'Green Kodo'),
	(6, 18992, 1, 'Teal Kodo'),
	(6, 19363, 1, 'Summon Mechanical Yeti'),
	(6, 23220, 1, 'Swift Dawnsaber'),
	(6, 23428, 1, 'Albino Snapjaw'),
	(6, 23429, 1, 'Loggerhead Snapjaw'),
	(6, 23430, 1, 'Olive Snapjaw'),
	(6, 23431, 1, 'Leatherback Snapjaw'),
	(6, 23432, 1, 'Hawksbill Snapjaw'),
	(6, 23530, 16, 'Tiny Red Dragon'),
	(6, 23531, 16, 'Tiny Green Dragon'),
	(6, 24985, 1, 'Summon Baby Murloc (Blue)'),
	(6, 24986, 1, 'Summon Baby Murloc (Green)'),
	(6, 24987, 1, 'Summon Baby Murloc (Orange)'),
	(6, 24988, 4, 'Lurky'),
	(6, 24989, 1, 'Summon Baby Murloc (Pink)'),
	(6, 24990, 1, 'Summon Baby Murloc (Purple)'),
	(6, 25849, 1, 'Baby Shark'),
	(6, 26067, 1, 'Summon Mechanical Greench'),
	(6, 26391, 1, 'Tentacle Call'),
	(6, 28828, 1, 'Nether Drake'),
	(6, 29059, 1, 'Naxxramas Deathcharger'),
	(6, 30152, 1, 'White Tiger Cub'),
	(6, 30156, 2, 'Hippogryph Hatchling'),
	(6, 30174, 2, 'Riding Turtle'),
	(6, 32298, 4, 'Netherwhelp'),
	(6, 32345, 1, 'Peep the Phoenix Mount'),
	(6, 33050, 128, 'Magical Crawdad'),
	(6, 33057, 1, 'Summon Mighty Mr. Pinchy'),
	(6, 33630, 1, 'Blue Mechanostrider'),
	(6, 34407, 1, 'Great Elite Elekk'),
	(6, 35157, 1, 'Summon Spotted Rabbit'),
	(6, 37015, 1, 'Swift Nether Drake'),
	(6, 40319, 16, 'Lucky'),
	(6, 40405, 16, 'Lucky'),
	(6, 43688, 1, 'Amani War Bear'),
	(6, 43810, 1, 'Frost Wyrm'),
	(6, 44317, 1, 'Merciless Nether Drake'),
	(6, 44744, 1, 'Merciless Nether Drake'),
	(6, 45125, 2, 'Rocket Chicken'),
	(6, 45174, 16, 'Golden Pig'),
	(6, 45175, 16, 'Silver Pig'),
	(6, 45890, 1, 'Scorchling'),
	(6, 47037, 1, 'Swift War Elekk'),
	(6, 48406, 16, 'Essence of Competition'),
	(6, 48408, 1, 'Essence of Competition'),
	(6, 48954, 8, 'Swift Zhevra'),
	(6, 49322, 8, 'Swift Zhevra'),
	(6, 49378, 1, 'Brewfest Riding Kodo'),
	(6, 50869, 1, 'Brewfest Kodo'),
	(6, 50870, 1, 'Brewfest Ram'),
	(6, 51851, 1, 'Vampiric Batling'),
	(6, 51960, 1, 'Frost Wyrm Mount'),
	(6, 52615, 4, 'Frosty'),
	(6, 53082, 8, 'Mini Tyrael'),
	(6, 53768, 1, 'Haunted'),
	(6, 54187, 1, 'Clockwork Rocket Bot'),
	(6, 55068, 1, 'Mr. Chilly'),
	(6, 58983, 8, 'Big Blizzard Bear'),
	(6, 59572, 1, 'Black Polar Bear'),
	(6, 59573, 1, 'Brown Polar Bear'),
	(6, 59802, 1, 'Grand Ice Mammoth'),
	(6, 59804, 1, 'Grand Ice Mammoth'),
	(6, 59976, 1, 'Black Proto-Drake'),
	(6, 60021, 1, 'Plagued Proto-Drake'),
	(6, 60136, 1, 'Grand Caravan Mammoth'),
	(6, 60140, 1, 'Grand Caravan Mammoth'),
	(6, 61309, 512, 'Magnificent Flying Carpet'),
	(6, 61442, 1, 'Swift Mooncloth Carpet'),
	(6, 61444, 1, 'Swift Shadoweave Carpet'),
	(6, 61446, 1, 'Swift Spellfire Carpete'),
	(6, 61451, 512, 'Flying Carpet'),
	(6, 61855, 1, 'Baby Blizzard Bear'),
	(6, 62048, 1, 'Black Dragonhawk Mount'),
	(6, 62514, 1, 'Alarming Clockbot'),
	(6, 63318, 8, 'Murkimus the Gladiator'),
	(6, 64351, 1, 'XS-001 Constructor Bot'),
	(6, 64656, 1, 'Blue Skeletal Warhorse'),
	(6, 64731, 128, 'Sea Turtle'),
	(6, 65682, 1, 'Warbot'),
	(6, 65917, 2, 'Magic Rooster'),
	(6, 66030, 8, 'Grunty'),
	(6, 66122, 1, 'Magic Rooster - dummy spell'),
	(6, 66123, 1, 'Magic Rooster - dummy spell'),
	(6, 66124, 1, 'Magic Rooster - dummy spell'),
	(6, 66520, 1, 'Jade Tiger'),
	(6, 66907, 1, 'Argent Warhorse'),
	(6, 67527, 16, 'Onyx Panther'),
	(6, 68767, 2, 'Tuskarr Kite'),
	(6, 68810, 2, 'Spectral Tiger Cub'),
	(6, 69002, 1, 'Onyxian Whelpling'),
	(6, 69452, 8, 'Core Hound Pup'),
	(6, 69535, 4, 'Gryphon Hatchling'),
	(6, 69536, 4, 'Wind Rider Cub'),
	(6, 69539, 1, 'Zipao Tiger'),
	(6, 69541, 4, 'Pandaren Monk'),
	(6, 69677, 4, 'Lil\' K.T.'),
	(6, 74856, 2, 'Blazing Hippogryph'),
	(6, 74918, 2, 'Wooly White Rhino'),
	(6, 75596, 512, 'Frosty Flying Carpet'),
	(6, 75613, 1, 'Celestial Dragon'),
	(6, 75614, 16, 'Celestial Steed'),
	(6, 75906, 4, 'Lil\' XT'),
	(6, 75936, 1, 'Murkimus the Gladiator'),
	(6, 75973, 8, 'X-53 Touring Rocket'),
	(6, 78381, 8, 'Mini Thor'),
	(8, 87, 1024, 'Bloodsail Buccaneers - max rank is honored'),
	(8, 92, 1024, 'Gelkis Clan Centaur - max rank is friendly'),
	(8, 93, 1024, 'Magram Clan Centaur - max rank is friendly');

CREATE TABLE `aowow_account_profiles` (
  `accountId` INT(10) UNSIGNED NOT NULL,
  `profileId` INT(10) UNSIGNED NOT NULL,
  `extraFlags` INT(10) UNSIGNED NOT NULL,
  UNIQUE INDEX `accountId_profileId` (`accountId`, `profileId`),
  INDEX `accountId` (`accountId`),
  INDEX `profileId` (`profileId`),
  CONSTRAINT `FK_account_id` FOREIGN KEY (`accountId`) REFERENCES `aowow_account` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `FK_profile_id` FOREIGN KEY (`profileId`) REFERENCES `aowow_profiler_profiles` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `aowow_account_excludes` (
  `userId` INT(11) UNSIGNED NOT NULL,
  `type` SMALLINT(5) UNSIGNED NOT NULL,
  `typeId` MEDIUMINT(8) UNSIGNED NOT NULL,
  `mode` TINYINT(2) UNSIGNED NOT NULL COMMENT '1: exclude; 2: include',
  UNIQUE INDEX `userId_type_typeId` (`userId`, `type`, `typeId`),
  INDEX `userId` (`userId`),
  CONSTRAINT `FK_acc_excludes` FOREIGN KEY (`userId`) REFERENCES `aowow_account` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

