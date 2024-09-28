-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema univer_3008120
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema univer_3008120
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `univer_3008120` DEFAULT CHARACTER SET utf8 ;
USE `univer_3008120` ;

-- -----------------------------------------------------
-- Table `univer_3008120`.`reader`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`reader` (
  `id_reader` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(15) NOT NULL,
  `dob` DATE NULL,
  `address` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id_reader`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`employee` (
  `id_emp` INT NOT NULL AUTO_INCREMENT,
  `empname` VARCHAR(15) NOT NULL,
  `dob` DATE NULL,
  `post_name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_emp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`genre` (
  `idgenre` INT NOT NULL AUTO_INCREMENT,
  `gname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`book` (
  `id_book` INT NOT NULL AUTO_INCREMENT,
  `bookname` VARCHAR(45) NOT NULL,
  `numpages` INT NOT NULL,
  `price` FLOAT(7,2) NULL,
  `genre_idgenre` INT NULL,
  PRIMARY KEY (`id_book`),
  INDEX `fk_book_genre_idx` (`genre_idgenre` ASC) VISIBLE,
  CONSTRAINT `fk_book_genre`
    FOREIGN KEY (`genre_idgenre`)
    REFERENCES `univer_3008120`.`genre` (`idgenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`pubhouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`pubhouse` (
  `idpubhouse` INT NOT NULL AUTO_INCREMENT,
  `pubname` VARCHAR(45) NOT NULL,
  `address` MEDIUMTEXT NULL,
  PRIMARY KEY (`idpubhouse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`author` (
  `idauthor` INT NOT NULL AUTO_INCREMENT,
  `authname` VARCHAR(15) NOT NULL,
  `dob` DATE NULL,
  `info` MEDIUMTEXT NULL,
  PRIMARY KEY (`idauthor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`awards` (
  `idawards` INT NOT NULL AUTO_INCREMENT,
  `awname` VARCHAR(45) NOT NULL,
  `awrang` VARCHAR(10) NULL,
  PRIMARY KEY (`idawards`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`book_has_pubhouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`book_has_pubhouse` (
  `book_id_book` INT NOT NULL,
  `pubhouse_idpubhouse` INT NOT NULL,
  `pubdate` DATE NOT NULL,
  PRIMARY KEY (`book_id_book`, `pubhouse_idpubhouse`, `pubdate`),
  INDEX `fk_book_has_pubhouse_pubhouse1_idx` (`pubhouse_idpubhouse` ASC) VISIBLE,
  INDEX `fk_book_has_pubhouse_book1_idx` (`book_id_book` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_pubhouse_book1`
    FOREIGN KEY (`book_id_book`)
    REFERENCES `univer_3008120`.`book` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_pubhouse_pubhouse1`
    FOREIGN KEY (`pubhouse_idpubhouse`)
    REFERENCES `univer_3008120`.`pubhouse` (`idpubhouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`author_has_awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`author_has_awards` (
  `author_idauthor` INT NOT NULL,
  `awards_idawards` INT NOT NULL,
  `date_author_has_awards` DATE NOT NULL,
  PRIMARY KEY (`author_idauthor`, `awards_idawards`, `date_author_has_awards`),
  INDEX `fk_author_has_awards_awards1_idx` (`awards_idawards` ASC) VISIBLE,
  INDEX `fk_author_has_awards_author1_idx` (`author_idauthor` ASC) VISIBLE,
  CONSTRAINT `fk_author_has_awards_author1`
    FOREIGN KEY (`author_idauthor`)
    REFERENCES `univer_3008120`.`author` (`idauthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_author_has_awards_awards1`
    FOREIGN KEY (`awards_idawards`)
    REFERENCES `univer_3008120`.`awards` (`idawards`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`book_has_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`book_has_author` (
  `book_id_book` INT NOT NULL,
  `author_idauthor` INT NOT NULL,
  `book_ath_date` DATE NULL,
  PRIMARY KEY (`book_id_book`, `author_idauthor`),
  INDEX `fk_book_has_author_author1_idx` (`author_idauthor` ASC) VISIBLE,
  INDEX `fk_book_has_author_book1_idx` (`book_id_book` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_author_book1`
    FOREIGN KEY (`book_id_book`)
    REFERENCES `univer_3008120`.`book` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_author_author1`
    FOREIGN KEY (`author_idauthor`)
    REFERENCES `univer_3008120`.`author` (`idauthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_3008120`.`reader_has_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_3008120`.`reader_has_book` (
  `reader_id_reader` INT NOT NULL,
  `book_id_book` INT NOT NULL,
  `emploee_id_emp` INT NOT NULL,
  `reader_has_book_date` DATE NOT NULL,
  `return_date` DATE NOT NULL,
  PRIMARY KEY (`reader_id_reader`, `book_id_book`, `emploee_id_emp`, `reader_has_book_date`),
  INDEX `fk_reader_has_book_book1_idx` (`book_id_book` ASC) VISIBLE,
  INDEX `fk_reader_has_book_reader1_idx` (`reader_id_reader` ASC) VISIBLE,
  INDEX `fk_reader_has_book_emploee1_idx` (`emploee_id_emp` ASC) VISIBLE,
  CONSTRAINT `fk_reader_has_book_reader1`
    FOREIGN KEY (`reader_id_reader`)
    REFERENCES `univer_3008120`.`reader` (`id_reader`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reader_has_book_book1`
    FOREIGN KEY (`book_id_book`)
    REFERENCES `univer_3008120`.`book` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reader_has_book_emploee1`
    FOREIGN KEY (`emploee_id_emp`)
    REFERENCES `univer_3008120`.`employee` (`id_emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
