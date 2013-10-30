CREATE TABLE IF NOT EXISTS `#__ec_video_items` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL DEFAULT '1',
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`catid` VARCHAR(255)  NOT NULL ,
`title` VARCHAR(255)  NOT NULL ,
`url` VARCHAR(255)  NOT NULL ,
`thumb` VARCHAR(255)  NOT NULL ,
`youtubethumb` INT(11)  NOT NULL ,
`description` TEXT NOT NULL ,
`created_by` INT(11)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8_general_ci;

