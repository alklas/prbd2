-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema univer008
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema univer008
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `univer008_Oleg` DEFAULT CHARACTER SET utf8 ;
USE `univer008_Oleg` ;

-- -----------------------------------------------------
-- Table `univer008`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`director` (
  `#director` INT NOT NULL AUTO_INCREMENT,
  `dirname` VARCHAR(25) NOT NULL,
  `facult` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`#director`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008_Oleg`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`group` (
  `#gr` CHAR(10) NOT NULL,
  `napr` MEDIUMTEXT NOT NULL,
  `profil` MEDIUMTEXT NULL,
  PRIMARY KEY (`#gr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`student` (
  `#stud` INT NOT NULL AUTO_INCREMENT,
  `studname` VARCHAR(25) NOT NULL,
  `director_#director` INT NOT NULL,
  `group_#gr` CHAR(10) NULL,
  PRIMARY KEY (`#stud`),
  INDEX `fk_student_director_idx` (`director_#director` ASC) VISIBLE,
  INDEX `fk_student_group1_idx` (`group_#gr` ASC) VISIBLE,
  CONSTRAINT `fk_student_director`
    FOREIGN KEY (`director_#director`)
    REFERENCES `univer008_Oleg`.`director` (`#director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer008_Oleg`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`post` (
  `postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`postname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`employee` (
  `#employee` INT NOT NULL AUTO_INCREMENT,
  `empname` VARCHAR(25) NOT NULL,
  `director_#director` INT NOT NULL,
  `post_postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  INDEX `fk_employee_director1_idx` (`director_#director` ASC) VISIBLE,
  INDEX `fk_employee_post1_idx` (`post_postname` ASC) VISIBLE,
  CONSTRAINT `fk_employee_director1`
    FOREIGN KEY (`director_#director`)
    REFERENCES `univer008_Oleg`.`director` (`#director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_post1`
    FOREIGN KEY (`post_postname`)
    REFERENCES `univer008_Oleg`.`post` (`postname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`subject` (
  `#subj` INT NOT NULL AUTO_INCREMENT,
  `subjname` VARCHAR(85) NOT NULL,
  `subjinfo` MEDIUMTEXT NULL,
  PRIMARY KEY (`#subj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`lessontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`lessontype` (
  `lessonname` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`lessonname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`employee_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`employee_has_subject` (
  `employee_#employee` INT NOT NULL,
  `subject_#subj` INT NOT NULL,
  PRIMARY KEY (`employee_#employee`, `subject_#subj`),
  INDEX `fk_employee_has_subject_subject1_idx` (`subject_#subj` ASC) VISIBLE,
  INDEX `fk_employee_has_subject_employee1_idx` (`employee_#employee` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_subject_employee1`
    FOREIGN KEY (`employee_#employee`)
    REFERENCES `univer008_Oleg`.`employee` (`#employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_subject_subject1`
    FOREIGN KEY (`subject_#subj`)
    REFERENCES `univer008_Oleg`.`subject` (`#subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`schedule` (
  `#week` INT NOT NULL,
  `day` CHAR(3) BINARY NOT NULL,
  `group_#gr` CHAR(10) NOT NULL,
  `subject_#subj` INT NOT NULL,
  `lessontype_lessonname` VARCHAR(12) NOT NULL,
  `#room` CHAR(3) NOT NULL,
  PRIMARY KEY (`#week`, `day`, `group_#gr`, `subject_#subj`, `lessontype_lessonname`),
  INDEX `fk_group_has_subject_subject1_idx` (`subject_#subj` ASC) VISIBLE,
  INDEX `fk_group_has_subject_group1_idx` (`group_#gr` ASC) VISIBLE,
  INDEX `fk_group_has_subject_lessontype1_idx` (`lessontype_lessonname` ASC) VISIBLE,
  CONSTRAINT `fk_group_has_subject_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer008_Oleg`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_subject1`
    FOREIGN KEY (`subject_#subj`)
    REFERENCES `univer008_Oleg`.`subject` (`#subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_lessontype1`
    FOREIGN KEY (`lessontype_lessonname`)
    REFERENCES `univer008_Oleg`.`lessontype` (`lessonname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`vedomost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008_Oleg`.`vedomost` (
  `date` DATE NOT NULL,
  `student_#stud` INT NOT NULL,
  `employee_#employee` INT NOT NULL,
  `subject_#subj` INT NOT NULL,
  `mark` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`date`, `student_#stud`, `employee_#employee`, `subject_#subj`),
  INDEX `fk_student_has_employee_employee1_idx` (`employee_#employee` ASC) VISIBLE,
  INDEX `fk_student_has_employee_student1_idx` (`student_#stud` ASC) VISIBLE,
  INDEX `fk_student_has_employee_subject1_idx` (`subject_#subj` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_employee_student1`
    FOREIGN KEY (`student_#stud`)
    REFERENCES `univer008_Oleg`.`student` (`#stud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_employee1`
    FOREIGN KEY (`employee_#employee`)
    REFERENCES `univer008_Oleg`.`employee` (`#employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_subject1`
    FOREIGN KEY (`subject_#subj`)
    REFERENCES `univer008_Oleg`.`subject` (`#subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
