CREATE TABLE `msgs` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`email` TEXT NULL,
	`sender` TEXT NULL,
	`to` TEXT NULL,
	`msg` TEXT NULL,
	`dnt` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='For messages sent'
ENGINE=InnoDB;

CREATE TABLE `members` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`fullname` TEXT NULL,
	`email` TEXT NULL,
	`phone` TEXT NULL,
	`password` TEXT NULL,
	`bal` TEXT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='A table which contains list of members'
ENGINE=InnoDB;
