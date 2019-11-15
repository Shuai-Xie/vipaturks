CREATE TABLE `configs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(20) NOT NULL,
  `bucket` varchar(20) DEFAULT NULL,
  `notes` text,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;



CREATE TABLE `d_api_keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(36) NOT NULL,
  `keyValue` varchar(36) NOT NULL DEFAULT '',
  `secret` varchar(300) NOT NULL,
  `status` varchar(11) DEFAULT 'NONE',
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;


CREATE TABLE `d_hits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` varchar(36) NOT NULL,
  `data` text CHARACTER SET utf8,
  `extras` text,
  `status` varchar(50) NOT NULL DEFAULT 'notDone',
  `evaluation` varchar(50) DEFAULT 'NONE',
  `isGoldenHIT` tinyint(1) DEFAULT '0',
  `goldenHITResultId` int(11) unsigned DEFAULT '0',
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isURL` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3561574 DEFAULT CHARSET=latin1;



CREATE TABLE `d_hits_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hitId` int(11) unsigned NOT NULL,
  `projectId` varchar(36) NOT NULL DEFAULT '',
  `result` text CHARACTER SET utf8,
  `userId` varchar(36) NOT NULL,
  `timeTakenToLabelInSec` int(11) unsigned DEFAULT '0',
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=948028 DEFAULT CHARSET=latin1;



CREATE TABLE `d_org_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orgId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;



CREATE TABLE `d_orgs` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL,
  `subscriptionId` int(11) unsigned NOT NULL,
  `website` varchar(300) DEFAULT NULL,
  `contactName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `contactEmail` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `contactPhone` varchar(20) DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `logoPic` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `d_project_invites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inviterId` varchar(36) NOT NULL,
  `projectId` varchar(36) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'CONTRIBUTOR',
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


CREATE TABLE `d_project_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

CREATE TABLE `d_projects` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `orgId` varchar(36) NOT NULL,
  `accessType` varchar(50) DEFAULT NULL,
  `taskType` varchar(50) DEFAULT NULL,
  `taskRules` text CHARACTER SET utf8,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `shortDescription` text CHARACTER SET utf8,
  `status` varchar(50) DEFAULT NULL,
  `totalStorageInMBs` int(11) DEFAULT '0',
  `labelsDone` int(11) NOT NULL DEFAULT '0',
  `validateWithGoldenHITs` tinyint(1) DEFAULT '0',
  `minGoldenHITs` int(11) DEFAULT '5',
  `HITRepeatCount` int(11) DEFAULT '2',
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `d_subscription_plans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `displayName` varchar(50) DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `amountPerMonth` double DEFAULT '0',
  `discountPercent` int(11) DEFAULT '0',
  `numProjects` int(11) DEFAULT '100',
  `numHITsPerProject` int(11) DEFAULT '1000000',
  `totalStorageInGBs` int(11) DEFAULT '10',
  `numUsers` int(11) DEFAULT '1',
  `config` text,
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `d_subscriptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orgId` varchar(36) NOT NULL,
  `planId` int(11) unsigned NOT NULL,
  `paymentMethodId` int(11) unsigned DEFAULT '0',
  `config` text,
  `labelsDone` int(11) NOT NULL DEFAULT '0',
  `validTill` timestamp NULL DEFAULT NULL,
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

CREATE TABLE `d_users` (
  `id` varchar(36) NOT NULL,
  `oAuthId` varchar(48) NOT NULL,
  `oAuthType` varchar(20) DEFAULT NULL,
  `firstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `secondName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `profileLink` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `profilePic` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `notificationToken` text,
  `password` varchar(64) DEFAULT NULL,
  `notes` text,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oAuthId` (`oAuthId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `keyValues` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyName` varchar(100) DEFAULT NULL,
  `typeName` varchar(100) DEFAULT NULL,
  `fieldValue` text,
  `notes` text,
  `updated_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=utf8;


-- key
INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ( 'publicKey', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArPjaCCZ51odBmCv45TnF\nf1fpjpY+vL7qy1XOsFlpY04RF7OFlK2zPnNJohbF5MDXNHVBGVqJ1vbUL9sCOxzX\nPOH4fvI0azam/8lFo33hO34Z+PBqaRhUJnE6HBVU0WHqIKgIUVIJtNcHPNsH741E\n8bs8xdfh0UtM/eYgqOyR95KAOtv4BELutVOiyq038lA2rVfpotHSJZYkG2z4Fijl\nfGtk1ryk8bB1vNWdnWmHMizu2bA5qryNQOYHOcDEUzJuZxcI3kPZYRgEMj2WOqw5\n4LnMxUAOhNFYbHKdmYEhwfSWBvDBkhTZv1jvs09NVIZi0dtmOvmh3JcjQh5jo2OA\nSQIDAQAB\n-----END PUBLIC KEY-----', 'string');


-- configs
INSERT INTO `d_subscription_plans` (`id`, `name`, `displayName`, `paid`, `amountPerMonth`, `discountPercent`, `numProjects`, `numHITsPerProject`, `totalStorageInGBs`, `numUsers`, `config`)
VALUES
  (2, 'Onprem users', 'Onprem users', 1, 0, 0, 100, 1000000, 10, 1, '{\n  \"maxStringLengthForTextTasks\": \"500000\",\n  \"fileUploadMaxSizeBytes\": \"2073741824\",\n \"maxHitsPerProject\": \"10000000\",\n        \"numLabelsAllowed\": \"2500000\"\n}');


INSERT INTO `configs` ( `key`, `value`, `type`)
VALUES
  ('isDataturksAuthTokenEnabled', 'true', 'boolean');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('internalLoginAllowed', 'true', 'boolean');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('dDripFlowsStatus', 'false', 'boolean');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('imageUploadAllowed', 'true', 'boolean');

INSERT INTO `configs` ( `key`, `value`, `type`)
VALUES
  ('dFreePlanId', '2', 'int');

INSERT INTO `configs` ( `key`, `value`, `type`)
VALUES
  ('dEmailSendingAllowed', 'false', 'boolean');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('fileUploadDir', '/tmp', 'string');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('fileDownloadDir', '/tmp', 'string');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('dUploadStoragePath', '/home/dataturks/bazaar/uploads', 'string');

INSERT INTO `configs` (`key`, `value`, `type`)
VALUES
  ('maxStringLengthForTextTasks', '9000000', 'int'),
  ('fileUploadMaxSizeBytes', '2147483600', 'int');
-- todo: can change fileUploadMaxSizeBytes