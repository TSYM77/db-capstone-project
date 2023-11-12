-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDB` ;

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `Employee_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NULL,
  `Employee_Role` VARCHAR(100) NULL,
  `Employee_Address` VARCHAR(100) NULL,
  `Employee_Contact_Number` INT NULL,
  `Employee_Email` VARCHAR(100) NULL,
  `Employee_Annual_Salary` INT NULL,
  PRIMARY KEY (`Employee_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `Customer_ID` INT NOT NULL AUTO_INCREMENT,
  `Customer_Name` VARCHAR(100) NULL,
  `Customer_Contact` INT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `Booking_ID` INT NOT NULL AUTO_INCREMENT,
  `Booking_Date` DATE NULL,
  `Table_Number` INT NULL,
  `Customer_ID` INT NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`Booking_ID`),
  INDEX `staff_id_fk_idx` (`EmployeeID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`Employee_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customerid_fk`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `LittleLemonDB`.`Customer` (`Customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `Menu_Items_ID` INT NOT NULL,
  `Course_Name` VARCHAR(100) NULL,
  `Type` VARCHAR(100) NULL,
  `Price` INT NULL,
  PRIMARY KEY (`Menu_Items_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `Menu_ID` INT NOT NULL,
  `Menu_Items_ID` INT NULL,
  `Food_Type` VARCHAR(100) NULL,
  PRIMARY KEY (`Menu_ID`),
  INDEX `menu_items_id_fk_idx` (`Menu_Items_ID` ASC) VISIBLE,
  CONSTRAINT `menu_items_id_fk`
    FOREIGN KEY (`Menu_Items_ID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`Menu_Items_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `Order_ID` INT NOT NULL,
  `Menu_ID` INT NULL,
  `Customer_ID` INT NULL,
  `Order_Quantity` INT NULL,
  `Total_Cost` INT NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `menuid_fk_idx` (`Menu_ID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`Menu_ID`)
    REFERENCES `LittleLemonDB`.`Menus` (`Menu_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `LittleLemonDB`.`Customer` (`Customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
