CREATE TABLE `Categories` (
	`category_ID` INT NOT NULL AUTO_INCREMENT,
	`category_name` varchar(255) NOT NULL,
	`category_type` varchar(255) NOT NULL,
	PRIMARY KEY (`category_ID`)
);

CREATE TABLE `Orders` (
	`order-ID` INT NOT NULL AUTO_INCREMENT,
	`customer_ID` INT NOT NULL AUTO_INCREMENT,
	`date` DATE NOT NULL,
	PRIMARY KEY (`order-ID`)
);

CREATE TABLE `Deliveries` (
	`deliveries_ID` INT NOT NULL AUTO_INCREMENT,
	`customer_ID` INT NOT NULL,
	`date` DATE NOT NULL,
	`post_tracking_code` varchar(255) NOT NULL,
	PRIMARY KEY (`deliveries_ID`)
);

CREATE TABLE `Products` (
	`product_ID` INT NOT NULL AUTO_INCREMENT,
	`category_ID` INT NOT NULL AUTO_INCREMENT,
	`product_name` varchar(255) NOT NULL,
	`product_price` INT(512) NOT NULL,
	PRIMARY KEY (`product_ID`)
);

CREATE TABLE `Customers` (
	`customer_ID` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`address` varchar(1024) NOT NULL,
	PRIMARY KEY (`customer_ID`)
);

CREATE TABLE `Transaction Reports` (
	`report_ID` INT NOT NULL AUTO_INCREMENT,
	`customer_ID` INT NOT NULL,
	`order-ID` INT NOT NULL,
	`product_ID` INT NOT NULL,
	`payment_ID` INT NOT NULL,
	PRIMARY KEY (`report_ID`)
);

CREATE TABLE `Sellert` (
	`seller_ID` INT NOT NULL AUTO_INCREMENT,
	`product_ID` INT NOT NULL,
	`name` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`address` varchar(1024) NOT NULL,
	PRIMARY KEY (`seller_ID`)
);

CREATE TABLE `Payment` (
	`payment_ID` INT NOT NULL AUTO_INCREMENT,
	`customer_ID` INT NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY (`payment_ID`)
);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customers`(`customer_ID`);

ALTER TABLE `Deliveries` ADD CONSTRAINT `Deliveries_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customers`(`customer_ID`);

ALTER TABLE `Products` ADD CONSTRAINT `Products_fk0` FOREIGN KEY (`category_ID`) REFERENCES `Categories`(`category_ID`);

ALTER TABLE `Transaction Reports` ADD CONSTRAINT `Transaction Reports_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customers`(`customer_ID`);

ALTER TABLE `Transaction Reports` ADD CONSTRAINT `Transaction Reports_fk1` FOREIGN KEY (`order-ID`) REFERENCES `Orders`(`order-ID`);

ALTER TABLE `Transaction Reports` ADD CONSTRAINT `Transaction Reports_fk2` FOREIGN KEY (`product_ID`) REFERENCES `Products`(`product_ID`);

ALTER TABLE `Transaction Reports` ADD CONSTRAINT `Transaction Reports_fk3` FOREIGN KEY (`payment_ID`) REFERENCES `Payment`(`payment_ID`);

ALTER TABLE `Sellert` ADD CONSTRAINT `Sellert_fk0` FOREIGN KEY (`product_ID`) REFERENCES `Products`(`product_ID`);

ALTER TABLE `Payment` ADD CONSTRAINT `Payment_fk0` FOREIGN KEY (`customer_ID`) REFERENCES `Customers`(`customer_ID`);









