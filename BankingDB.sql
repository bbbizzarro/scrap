CREATE DATABASE IF NOT EXISTS bank;

CREATE TABLE IF NOT EXISTS `bank`.`user` (
  `role` VARCHAR(31) NOT NULL,
  `account_number` VARCHAR(255),
  `enabled` BIT(1) NOT NULL,
  `password` VARCHAR(255)NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `bank`.`account` (
  `account_type` VARCHAR(31) NOT NULL,
  `account_number` VARCHAR(255),
  `balance` INT NOT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `available_balance` INT NULL DEFAULT NULL,
  `available_credit` INT NULL DEFAULT NULL,
  `apy` FLOAT NULL DEFAULT NULL,
  `username` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE INDEX `UK_66gkcp94endmotfwb8r4ocxm9` (`account_number` ASC) VISIBLE,
  CONSTRAINT `FK8mr193rmld8wwqn5nlbr8vclx`
    FOREIGN KEY (`username`)
    REFERENCES `bank`.`user` (`username`))

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `bank`.`transaction` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `created_date` DATETIME(6) NULL DEFAULT NULL,
  `date_processed` DATETIME(6) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `initial_balance` INT NOT NULL,
  `last_modified` DATETIME(6) NULL DEFAULT NULL,
  `method` VARCHAR(255) NOT NULL,
  `posted_balance` INT NULL DEFAULT NULL,
  `state` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `account_number` VARCHAR(255) ,
  `merchant_code` VARCHAR(255) NOT NULL,
  `merchant_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK6g20fcr3bhr6bihgy24rq1r1b`
    FOREIGN KEY (`account_number`)
    REFERENCES `bank`.`account` (`account_number`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `bank`.`loan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `apr` FLOAT NOT NULL,
  `loan_type` VARCHAR(255) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `term` INT NOT NULL,
  `account_number` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK5v8rflshj4igi4j1uxg3sq8iu`
    FOREIGN KEY (`account_number`)
    REFERENCES `bank`.`account` (`account_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `bank`.`branch` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_243da5619wvedk7ah55d50tph` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `bank`.`card` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(255) NOT NULL,
  `card_status` VARCHAR(255) NULL DEFAULT NULL,
  `card_type` VARCHAR(255) NULL DEFAULT NULL,
  `expiration_date` DATE NOT NULL,
  `security_code` VARCHAR(3) NOT NULL,
  `account_number`  VARCHAR(255)  NOT NULL,
  `card_issuer_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_by1nk98m2hq5onhl68bo09sc1` (`card_number` ASC) VISIBLE,
  CONSTRAINT `FK8v67eys6tqflsm6hrdgru2phu`
    FOREIGN KEY (`account_number`)
    REFERENCES `bank`.`account` (`account_number`))
 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
