CREATE SCHEMA `food_delivery_system` ;
#Creating tables and inserting data:
#1. CITIES
CREATE TABLE food_delivery_system.cities (
pincode INT NOT NULL,
city VARCHAR(45) NOT NULL,
state VARCHAR(45) NOT NULL,
PRIMARY KEY (pincode));

#Data:
INSERT INTO cities VALUES ('600001', 'chennai', 'tamil nadu');
INSERT INTO cities VALUES ('560002', 'bengaluru', 'karnataka');
INSERT INTO cities VALUES ('302001', 'jaipur', 'rajasthan');
INSERT INTO cities VALUES ('110001', 'delhi', 'delhi');
INSERT INTO cities VALUES ('400001', 'mumbai', 'maharashtra');
INSERT INTO cities VALUES ('700001', 'kolkata', 'west bengal');
INSERT INTO cities VALUES ('411001', 'pune', 'maharashtra');
INSERT INTO cities VALUES ('380001', 'ahmedabad', 'gujarat');
INSERT INTO cities VALUES ('500001', 'hyderabad', 'telangana');
INSERT INTO cities VALUES ('520001', 'vijayawada', 'andhra pradesh');

#2. RESTAURANT
CREATE TABLE `food_delivery_system`.`restaurant` (
`hotel_id` INT NOT NULL AUTO_INCREMENT,
`status` VARCHAR(45) NULL DEFAULT NULL,
`house_no` VARCHAR(45) NOT NULL,
`pincode` INT NOT NULL,
`name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`hotel_id`),
UNIQUE INDEX `hotel_id_UNIQUE` (`hotel_id` ASC) VISIBLE,
INDEX `FK_hotel_pin_idx` (`pincode` ASC) VISIBLE,
CONSTRAINT `FK_hotel_pin`
FOREIGN KEY (`pincode`)
REFERENCES `food_delivery_system`.`cities` (`pincode`)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO restaurant VALUES (1, 'Open', '2-789', '520001', 'Dalchin');
INSERT INTO restaurant VALUES (2, 'Closed', '3-628', '520001', 'Vivanta');
INSERT INTO restaurant VALUES (3, 'Open', '6-826', '110001', 'Parikrama');
INSERT INTO restaurant VALUES (4, 'Closed', '2-279', '110001', 'Kiyan');
INSERT INTO restaurant VALUES (5, 'Open', '5-459', '380001', 'Tinello');
INSERT INTO restaurant VALUES (6, 'Open', '8-582', '380001', 'Bayleaf');
INSERT INTO restaurant VALUES (7, 'Open', '6-742', '560002', 'Lotus Pavilion');
INSERT INTO restaurant VALUES (8, 'Closed', '8-284', '560002', 'Jamavar');
INSERT INTO restaurant VALUES (9, 'Open', '5-428', '400001', 'Citrus');
INSERT INTO restaurant VALUES (10, 'Open', '4-826', '400001', 'Fifty five east');
INSERT INTO restaurant VALUES (11, 'Open', '4-852', '411001', 'Senses');
INSERT INTO restaurant VALUES (12, 'Closed', '2-485', '411001', 'Spice Kitchen');
INSERT INTO restaurant VALUES (13, 'Open', '8-284', '302001', 'Suvarna');
INSERT INTO restaurant VALUES (14, 'Open', '4-252', '302001', 'The rajput room');
INSERT INTO restaurant VALUES (15, 'Open', '3-473', '600001', 'The crown');
INSERT INTO restaurant VALUES (16, 'Closed', '8-743', '600001', 'Paprika');
INSERT INTO restaurant VALUES (17, 'Open', '4-273', '500001', 'Amara');
INSERT INTO restaurant VALUES (18, 'Closed', '7-274', '500001', 'So the sky kitchen');
INSERT INTO restaurant VALUES (19, 'Open', '3-243', '700001', 'The bridge');
INSERT INTO restaurant VALUES (20, 'Closed', '8-421', '700001', 'Golden joy');

#3. CUSTOMER
CREATE TABLE `food_delivery_system`.`customer` (
`email_id` VARCHAR(45) NOT NULL,
`name` VARCHAR(45) NOT NULL,
`phone_number` VARCHAR(45) NOT NULL,
PRIMARY KEY (`email_id`),
UNIQUE INDEX `email_id_UNIQUE` (`email_id` ASC) VISIBLE);

#Data:
INSERT INTO customer VALUES ('os22csb0b11@student.nitw.ac.in', 'Obulapuram
Sunitha Pavani', '+917207031065');
INSERT INTO customer VALUES ('rr22csb0c15@student.nitw.ac.in', 'Rachakonda
Rishmitha', '+919381721301');
INSERT INTO customer VALUES ('tl22csb0c16@student.nitw.ac.in', 'Talluri Laasya',
'+917659976939');
INSERT INTO customer VALUES ('cg22csb0b09@student.nitw.ac.in', 'Chamarthy
Geethanjali', '+918331097026');
INSERT INTO customer VALUES ('pa22csb0c08@student.nitw.ac.in', 'Pareddy
Anshitha Reddy', '+919347281978');
INSERT INTO customer VALUES ('lv22csb0c33@student.nitw.ac.in', 'Lagishetti
Vaishnavi', '+917013170493');
INSERT INTO customer VALUES ('kp22csb0c30@student.nitw.ac.in', 'Kanneboyina
Pragna', '+919347058117');
INSERT INTO customer VALUES ('ks22csb0c11@student.nitw.ac.in', 'Kalakota Sai
chinmai', '+919392001305');
INSERT INTO customer VALUES ('ba22csb0b12@student.nitw.ac.in', 'Bethi Aashritha
Reddy', '+919700575007');

#4. CUST_ADD
CREATE TABLE `food_delivery_system`.`cust_add` (
`cust_id` VARCHAR(55) NOT NULL,
`add_type` VARCHAR(45) NOT NULL,
`house_no` VARCHAR(45) NOT NULL,
`pin_number` INT NOT NULL,
PRIMARY KEY (`cust_id`, `add_type`),
INDEX `FK_pincode_idx` (`pin_number` ASC) VISIBLE,
CONSTRAINT `FK_cust`
FOREIGN KEY (`cust_id`)
REFERENCES `food_delivery_system`.`customer` (`email_id`)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT `FK_pincode`
FOREIGN KEY (`pin_number`)
REFERENCES `food_delivery_system`.`cities` (`pincode`)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO cust_add VALUES ('ba22csb0b12@student.nitw.ac.in', 'home', '4-123',
'500001');
INSERT INTO cust_add VALUES ('cg22csb0b09@student.nitw.ac.in', 'home', '3-567',
'110001');
INSERT INTO cust_add VALUES ('kp22csb0c30@student.nitw.ac.in', 'home', '8-675',
'520001');
INSERT INTO cust_add VALUES ('ks22csb0c11@student.nitw.ac.in', 'home', '4-729',
'411001');
INSERT INTO cust_add VALUES ('lv22csb0c33@student.nitw.ac.in', 'office', '3-823',
'400001');
INSERT INTO cust_add VALUES ('os22csb0b11@student.nitw.ac.in', 'home', '8-729',
'520001');
INSERT INTO cust_add VALUES ('pa22csb0c08@student.nitw.ac.in', 'office', '7-622',
'411001');
INSERT INTO cust_add VALUES ('rr22csb0c15@student.nitw.ac.in', 'home', '2-838',
'500001');
INSERT INTO cust_add VALUES ('tl22csb0c16@student.nitw.ac.in', 'home', '6-732',
'500001');
INSERT INTO cust_add VALUES ('pa22csb0c08@student.nitw.ac.in', 'home', '4-186',
'520001');
INSERT INTO cust_add VALUES ('cg22csb0b09@student.nitw.ac.in', 'office', '3-726',
'500001');
INSERT INTO cust_add VALUES ('ba22csb0b12@student.nitw.ac.in', 'office', '4-724',
'110001');
INSERT INTO cust_add VALUES ('os22csb0b11@student.nitw.ac.in', 'office', '6-567',
'560002');
INSERT INTO cust_add VALUES ('os22csb0b11@student.nitw.ac.in', 'other', '4-271',
'600001');
INSERT INTO cust_add VALUES ('pa22csb0c08@student.nitw.ac.in', 'other', '5-872',
'400001');
INSERT INTO cuust_add VALUES ('cg22csb0b09@student.nitw.ac.in', 'other', '7-723',
'700001');
INSERT INTO cust_add VALUES ('rr22csb0c15@student.nitw.ac.in', 'office', '2-373',
'560002');
INSERT INTO cust_add VALUES ('rr22csb0c15@student.nitw.ac.in', 'other', '5-238',
'400001');
INSERT INTO cust_add VALUES ('ba22csb0b12@student.nitw.ac.in', 'other', '8-824',
'380001');
INSERT INTO cust_add VALUES ('kp22csb0c30@student.nitw.ac.in', 'office', '2-895',
'560002');
INSERT INTO cust_add VALUES ('kp22csb0c30@student.nitw.ac.in', 'other', '8-585',
'411001');
INSERT INTO cust_add VALUES ('tl22csb0c16@student.nitw.ac.in', 'office', '6-829',
'400001');
INSERT INTO cust_add VALUES ('tl22csb0c16@student.nitw.ac.in', 'other', '2-868',
'700001');
INSERT INTO cust_add VALUES ('lv22csb0c33@student.nitw.ac.in', 'home', '3-828',
'302001');
INSERT INTO cust_add VALUES ('lv22csb0c33@student.nitw.ac.in', 'other', '2-153',
'110001');
INSERT INTO cust_add VALUES ('ks22csb0c11@student.nitw.ac.in', 'office', '4-924',
'400001');
INSERT INTO cust_add VALUES ('ks22csb0c11@student.nitw.ac.in', 'other', '6-289',
'560002');

#5. MENU_ITEM
CREATE TABLE `food_delivery_system`.`menu_item` (
`hotel_id` INT NOT NULL,
`item_name` VARCHAR(45) NOT NULL,
`cost` INT NOT NULL,
`rating` INT NULL DEFAULT '0',
`item_type` ENUM('Veg', 'Non-Veg') NULL DEFAULT NULL,
PRIMARY KEY (`hotel_id`, `item_name`),
CONSTRAINT `FK_hotel`
FOREIGN KEY (`hotel_id`)
REFERENCES `food_delivery_system`.`restaurant` (`hotel_id`)
ON DELETE CASCADE
ON UPDATE CASCADE);
CREATE INDEX menu_item_index ON food_delivery_system.menu_item (item_name,
hotel_id);

#Data:
INSERT INTO menu_item VALUES ('1', 'Paneer Biryani', '180', '4', 'Veg');
INSERT INTO menu_item VALUES ('1', 'Chicken Biryani', '200', '4', 'Non-Veg');
INSERT INTO menu_item VALUES ('2', 'Chicken Dry', '400', '4', 'Non-Veg');
INSERT INTO menu_item VALUES ('3', 'Mushroom 65', '250', '4', 'Veg');
INSERT INTO menu_item VALUES ('5', 'Chicken Dry', '380', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('6', 'Chicken Biryani', '180', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('6', 'Chicken 65', '220', '0', 'Non-Veg');
INSERT INTO menu_item VALUES ('7', 'Tandoori Chicken', '500', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('8', 'Chicken Dry', '480', '4', 'Non-Veg');
INSERT INTO menu_item VALUES ('8', 'Chilli Gobi', '220', '5', 'Veg');
INSERT INTO menu_item VALUES ('9', 'Chicken Biryani', '250', '4', 'Non-Veg');
INSERT INTO menu_item VALUES ('10', 'Kadai Mushroom', '290', '4', 'Veg');
INSERT INTO menu_item VALUES ('11', 'Chicken 65', '290', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('12', 'Chicken Biryani', '220', '4', 'Non-Veg');
INSERT INTO menu_item VALUES ('12', 'Mushroom Chilli', '390', '4', 'Veg');
INSERT INTO menu_item VALUES ('13', 'Gobi 65', '180', '4', 'Veg');
INSERT INTO menu_item VALUES ('14', 'Chicken Dry', '420', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('14', 'Chicken 65', '250', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('15', 'Chicken Dry', '510', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('16', 'Chilli Chicken', '350', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('17', 'Paneer Biryani', '220', '4', 'Veg');
INSERT INTO menu_item VALUES ('17', 'Chicken 65', '280', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('18', 'Chilli Gobi', '250', '4', 'Veg');
INSERT INTO menu_item VALUES ('18', 'Tandoori Chicken', '480', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('19', 'Chicken 65', '260', '3', 'Non-Veg');
INSERT INTO menu_item VALUES ('20', 'Mushroom Chilli', '300', '3', 'Veg');

#6. CART_ITEM
CREATE TABLE `food_delivery_system`.`cart_item` (
`hotel_id` INT NOT NULL,
`item_name` VARCHAR(45) NOT NULL,
`quantity` INT NOT NULL,
`specifications` VARCHAR(500) NULL DEFAULT NULL,
`cust_id` VARCHAR(45) NOT NULL,
`cart_id` INT NOT NULL,
PRIMARY KEY (`hotel_id`, `item_name`),
INDEX `FK_cust_id_idx` (`cust_id` ASC) VISIBLE,
CONSTRAINT `FK_cart_item`
FOREIGN KEY (`hotel_id` , `item_name`)
REFERENCES `food_delivery_system`.`menu_item` (`hotel_id` , `item_name`)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT `FK_cust_id`
FOREIGN KEY (`cust_id`)
REFERENCES `food_delivery_system`.`customer` (`email_id`)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO cart_item VALUES ('1', 'Paneer biryani', '1', NULL,
'lv22csb0c33@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('2', 'Chicken Dry', '1', NULL,
'kp22csb0c30@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('3', 'Mushroom 65', '1', 'Fried',
'rr22csb0c15@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('12', 'Chicken biryani', '2', 'Spicy',
'os22csb0b11@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('18', 'Tandoori Chicken', '2', NULL,
'pa22csb0c08@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('10', 'Kadai Mushroom', '2', 'Gravy',
'cg22csb0b09@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('17', 'Chicken 65', '1', 'Juicy',
'ba22csb0b12@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('18', 'Chilli Gobi', '1', NULL,
'ks22csb0c11@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('16', 'Chilli Chicken', '2', NULL,
'tl22csb0c16@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('20', 'Mushroom Chilli', '1', NULL,
'rr22csb0c15@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('13', 'Gobi 65', '2', NULL,
'cg22csb0b09@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('10', 'Kadai Mushroom', '1', NULL,
'lv22csb0c33@student.nitw.ac.in');
INSERT INTO cart_item VALUES ('9', 'Chicken Biryani', '1', NULL,
'tl22csb0c16@student.nitw.ac.in');

#7. ORDER
CREATE TABLE `food_delivery_system`.`order` (
`order_id` INT NOT NULL,
`hotel_id` INT NOT NULL,
`cust_id` VARCHAR(45) NOT NULL,
`order_status` VARCHAR(45) NULL DEFAULT NULL,
`order_time` TIMESTAMP NOT NULL,
PRIMARY KEY (`order_id`),
UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
INDEX `FK_customer_order_idx` (`cust_id` ASC) VISIBLE,
INDEX `FK_hotel_order_idx` (`hotel_id` ASC) VISIBLE,
CONSTRAINT `FK_customer_order`
FOREIGN KEY (`cust_id`)
REFERENCES `food_delivery_system`.`customer` (`email_id`)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT `FK_hotel_order`
FOREIGN KEY (`hotel_id`)
REFERENCES `food_delivery_system`.`restaurant` (`hotel_id`)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO `food_delivery_system`.`order` (`order_id`, `hotel_id`, `cust_id`,
`order_status`, `order_time`) VALUES ('1', '20', 'rr22csb0c15@student.nitw.ac.in', 'Order
received', '2024-03-26 10:30:00');
INSERT INTO `food_delivery_system`.`order` (`order_id`, `hotel_id`, `cust_id`,
`order_status`, `order_time`) VALUES ('2', '12', 'os22csb0b11@student.nitw.ac.in',
'Order packed', '2024-03-25 14:30:00');
INSERT INTO `food_delivery_system`.`order` (`order_id`, `hotel_id`, `cust_id`,
`order_status`, `order_time`) VALUES ('3', '13', 'cg22csb0b09@student.nitw.ac.in',
'Order received', '2024-03-27 09:45:00');
INSERT INTO `food_delivery_system`.`order` (`order_id`, `hotel_id`, `cust_id`,
`order_status`, `order_time`) VALUES ('4', '2', 'kp22csb0c30@student.nitw.ac.in', 'Order
delivered', '2024-03-26 17:30:00');
INSERT INTO `food_delivery_system`.`order` (`order_id`, `hotel_id`, `cust_id`,
`order_status`, `order_time`) VALUES ('5', '17', 'ba22csb0b12@student.nitw.ac.in',
'Order shipped', '2024-03-26 08:36:00');

#8. ORDER_ITEM
CREATE TABLE food_delivery_system.order_item (
order_item_id INT NOT NULL,
item_name VARCHAR(45) NOT NULL,
hotel_id INT NOT NULL,
quantity INT NOT NULL,
specifications VARCHAR(200) NULL,
order_id INT NULL,
PRIMARY KEY (order_item_id),
INDEX FK_order_id_idx (order_id ASC) VISIBLE,
INDEX FK_order_menu_idx (item_name ASC, hotel_id ASC) VISIBLE,
CONSTRAINT FK_order
FOREIGN KEY (order_id)
REFERENCES food_delivery_system.order (order_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_order_menu
FOREIGN KEY (item_name , hotel_id)
REFERENCES food_delivery_system.menu_item (item_name , hotel_id)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO `food_delivery_system`.`order_item` (`order_item_id`, `item_name`,
`hotel_id`, `quantity`, `order_id`) VALUES ('1', 'Mushroom Chilli', '20', '1', '1');
INSERT INTO `food_delivery_system`.`order_item` (`order_item_id`, `item_name`,
`hotel_id`, `quantity`, `order_id`) VALUES ('2', 'Gobi 65', '13', '2', '3');
INSERT INTO `food_delivery_system`.`order_item` (`order_item_id`, `item_name`,
`hotel_id`, `quantity`, `order_id`) VALUES ('3', 'Chicken Dry', '2', '1', '4');
INSERT INTO `food_delivery_system`.`order_item` (`order_item_id`, `item_name`,
`hotel_id`, `quantity`, `specifications`, `order_id`) VALUES ('4', 'Chicken biryani', '12', '2',
'Spicy', '2');
INSERT INTO `food_delivery_system`.`order_item` (`order_item_id`, `item_name`,
`hotel_id`, `quantity`, `order_id`) VALUES ('5', 'Chicken 65', '17', '1', '5');

#9. DISCOUNTS
CREATE TABLE `food_delivery_system`.`discount` (
`discount_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`min_amount` INT NULL DEFAULT NULL,
`percentage` FLOAT NOT NULL,
PRIMARY KEY (`discount_id`),
UNIQUE INDEX `discount_id_UNIQUE` (`discount_id` ASC) VISIBLE);

#Data:
INSERT INTO food_delivery_system.discount (discount_id, name, min_amount,
percentage) VALUES ('1', 'SummerOffer', '200', '5');
INSERT INTO food_delivery_system.discount (discount_id, name, min_amount,
percentage) VALUES ('2', 'FestiveOffer', '250', '7');
INSERT INTO food_delivery_system.discount (discount_id, name, min_amount,
percentage) VALUES ('3', 'SummerCoolOffer', '250', '6');
INSERT INTO food_delivery_system.discount (discount_id, name, min_amount,
percentage) VALUES ('4', 'HolidayOffer', '400', '10');

#10. PAYMENTS
CREATE TABLE `food_delivery_system`.`payment` (
`payment_id` INT NOT NULL AUTO_INCREMENT,
`order_id` INT NOT NULL,
`payment_mode` VARCHAR(45) NOT NULL,
`tip` INT NULL DEFAULT '0',
`discount_id` INT NULL,
PRIMARY KEY (`payment_id`),
UNIQUE INDEX `payment_id_UNIQUE` (`payment_id` ASC) VISIBLE,
INDEX `Fk_order_id_idx` (`order_id` ASC) VISIBLE,
INDEX `Fk_discount_id_idx` (`discount_id` ASC) VISIBLE,
CONSTRAINT `Fk_discount_id`
FOREIGN KEY (`discount_id`)
REFERENCES `food_delivery_system`.`discount` (`discount_id`)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT `Fk_order_id`
FOREIGN KEY (`order_id`)
REFERENCES `food_delivery_system`.`order` (`order_id`)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO `food_delivery_system`.`payment` (`payment_id`, `order_id`,
`payment_mode`, `tip`, `discount_id`) VALUES ('1', '1', 'BHIM', '15', '3');
INSERT INTO `food_delivery_system`.`payment` (`payment_id`, `order_id`,
`payment_mode`, `discount_id`) VALUES ('2', '2', 'Phonepe', '2');
INSERT INTO `food_delivery_system`.`payment` (`payment_id`, `order_id`,
`payment_mode`, `tip`, `discount_id`) VALUES ('3', '4', 'Debit card', '20', '4');
INSERT INTO `food_delivery_system`.`payment` (`payment_id`, `order_id`,
`payment_mode`, `discount_id`) VALUES ('4', '3', 'UPI', '1');
INSERT INTO `food_delivery_system`.`payment` (`payment_id`, `order_id`,
`payment_mode`, `tip`, `discount_id`) VALUES ('5', '5', 'Credit card', '10', '2');

#11. DELIVERY_AGENT
CREATE TABLE `food_delivery_system`.`delivery_agent` (
`d_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`phone_num` VARCHAR(45) NOT NULL,
`rating` INT NULL DEFAULT '0',
PRIMARY KEY (`d_id`));

#Data:
INSERT INTO delivery_agent VALUES ('Flex', '+919876543210', '4');
INSERT INTO delivery_agent VALUES ('Parcel', '+918765432109', '4');
INSERT INTO delivery_agent VALUES ('Eagle', '+917654321098', '4');
INSERT INTO delivery_agent VALUES ('24Seven', '+919012345678', '5');
INSERT INTO delivery_agent VALUES ('Pack', '+918765432187', '3');
INSERT INTO delivery_agent VALUES ('ASAP', '+917890123456', '5');
INSERT INTO delivery_agent VALUES ('DoorDash', '+918901234567', '4');
INSERT INTO delivery_agent VALUES ('Postmates', '+919098765432', '3');
INSERT INTO delivery_agent VALUES ('Instacart', '+917890123890', '4');
INSERT INTO delivery_agent VALUES ('Gopuff', '+919076543210', '3');

#12. DELIVERY
CREATE TABLE `food_delivery_system`.`delivery` (
`order_id` INT NOT NULL,
`d_id` INT NOT NULL,
`status` VARCHAR(45) NOT NULL,
`loc` VARCHAR(45) NOT NULL,
`delivery_rating` INT NULL DEFAULT '0',
PRIMARY KEY (`order_id`, `d_id`),
INDEX `FK_deliv_id_idx` (`d_id` ASC) VISIBLE,
CONSTRAINT `Fk_deliv_id`
FOREIGN KEY (`d_id`)
REFERENCES `food_delivery_system`.`delivery_agent` (`d_id`)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT `Fk_del_order_id`
FOREIGN KEY (`order_id`)
REFERENCES `food_delivery_system`.`order` (`order_id`)
ON DELETE CASCADE
ON UPDATE CASCADE);

#Data:
INSERT INTO `food_delivery_system`.`delivery` (`order_id`, `d_id`, `status`, `loc`,
`delivery_rating`) VALUES ('1', '3', 'Order received', 'Under processing', '4');
INSERT INTO `food_delivery_system`.`delivery` (`order_id`, `d_id`, `status`, `loc`,
`delivery_rating`) VALUES ('2', '6', 'Order packed', 'At the restaurant', '3');
INSERT INTO `food_delivery_system`.`delivery` (`order_id`, `d_id`, `status`, `loc`,
`delivery_rating`) VALUES ('3', '7', 'Order delivered', 'Destination reached', '4');
INSERT INTO `food_delivery_system`.`delivery` (`order_id`, `d_id`, `status`, `loc`,
`delivery_rating`) VALUES ('4', '2', 'Order shipped', '5 km to destination', '4');
INSERT INTO `food_delivery_system`.`delivery` (`order_id`, `d_id`, `status`, `loc`,
`delivery_rating`) VALUES ('5', '8', 'Order packed', 'At the restaurant', '3');
