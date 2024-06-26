CREATE DATABASE beauty;

USE beauty;

###########################################################
##################### CREATING TABLES #####################

CREATE TABLE business(
business_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
business_name VARCHAR(50) NOT NULL UNIQUE,
town VARCHAR(55) NOT NULL,
phone_number VARCHAR(55),
business_email VARCHAR(55) NOT NULL,
website VARCHAR(500),
emergency_appointments BOOLEAN DEFAULT TRUE
);

CREATE TABLE categories (
    cat_id INT PRIMARY KEY NOT NULL,
    cat_name VARCHAR(55) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    business_id INT NOT NULL,
    service_name VARCHAR(55) NOT NULL,
    duration DECIMAL(3,2) NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (business_id) REFERENCES business(business_id)
);

CREATE TABLE service_categories (
    service_id INT NOT NULL,
    cat_id INT NOT NULL,
    PRIMARY KEY (service_id, cat_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
    );
    
CREATE TABLE address(
address_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
business_id INT NOT NULL,
street VARCHAR(100) NOT NULL,
town VARCHAR(50) NOT NULL,
postcode VARCHAR(10) NOT NULL,
FOREIGN KEY (business_id) REFERENCES business(business_id)
);

CREATE TABLE business_hours(
business_id INT NOT NULL,
week_day VARCHAR(10) NOT NULL,
is_open BOOLEAN DEFAULT TRUE,
opening_time TIME,
closing_time TIME,
PRIMARY KEY (business_id, week_day),
FOREIGN KEY (business_id) REFERENCES business(business_id)
);

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
username VARCHAR(50) UNIQUE NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
user_email VARCHAR(100),
phone_number VARCHAR(20),
date_of_birth DATE
);

CREATE TABLE reviews(
review_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
business_id INT NOT NULL,
user_id INT,
rating INT NOT NULL,
review_text TEXT,
timestamp DATETIME NOT NULL,
FOREIGN KEY (business_id) REFERENCES business(business_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);


###########################################################
##################### INSERTING DATA ######################

INSERT INTO business (business_name, town, phone_number, business_email, website, emergency_appointments)
VALUES
    ('hairbyb', 'thamesmead', '02012345678', 'hbb@mail.com', 'www.hairbyb.com', TRUE),
    ('nailedbyn', 'camden', '02098765432', 'nbn@mail.com', 'www.nailedbyn.com', FALSE),
    ('kaysstudio', 'hackney', '02055555555', 'kaysstudio@mail.com', 'www.kaysstudio.com', TRUE),
    ('jcutz', 'bexleyheath', '07433333333', 'jc@mail.com', 'www.jcutz.com', TRUE),
    ('beckybraidedit', 'romford', '07924444444', 'bbi@mail.com', 'www.beckybraidedit.com', TRUE),
    ('thenailbar', 'eltham', '02033335666', 'tnb@mail.com', 'www.thenailbar.com', FALSE),
    ('lashedgalour', 'stratford', '02077777777', 'lashedgalour@mail.com', 'www.lashedgalour.com', TRUE),
    ('gracesglamour', 'wood green', '07434343434', 'graceg@mail.com', 'www.gracesglamour.com', TRUE),
    ('fghair', 'hackney', '02077773776', 'fghair@mail.com', 'www.fghair.com', TRUE),
    ('facesbydan', 'thamesmead', '02055554444', 'facesbydan@mail.com', 'www.facesbydan.com', TRUE);
    
INSERT INTO categories (cat_id, cat_name)
VALUES
    (1, 'Hair'),
    (2, 'Nails'),
    (3, 'Makeup'),
    (4, 'Lashes'),
    (5, 'Barber');
    
INSERT INTO services (business_id, service_name, duration, price)
VALUES
    (4, 'trim', 0.5, 25.00),
    (1, 'wig install', 2.0, 80.00),
    (3, 'wig install', 2.0, 100.00),
    (5, 'knotless braids', 3.5, 90.00),
    (5, 'feed in braids', 1.5, 45.00),
    (9, 'sew in', 2.25, 75.00),
    (2, 'full set simple', 1.5, 40.00),
    (6, 'full set complex', 2.0, 60.00),
    (2, 'pedicure', 0.75, 30.00),
    (10, 'natural glam', 1.25, 55.00),
    (8, 'full glam', 2.0, 75.00),
    (7, 'hybrid set', 2.0, 40.00),
    (7, 'brow lamination', 1.0, 55.00);
    
INSERT INTO address (business_id, street, town, postcode)
VALUES
    (1, '123 High Street', 'Thamesmead', 'SE28 8PU'),
    (2, '456 Camden Road', 'Camden', 'NW1 9AA'),
    (3, '789 Hackney Road', 'Hackney', 'E8 4AA'),
    (4, '101 Bexleyheath Broadway', 'Bexleyheath', 'DA6 7ES'),
    (5, '234 Romford Lane', 'Romford', 'RM1 3PT'),
    (6, '567 Eltham High Street', 'Eltham', 'SE9 1AA'),
    (7, '890 Stratford Road', 'Stratford', 'E15 1BB'),
    (8, '123 Wood Green Avenue', 'Wood Green', 'N22 6DC'),
    (9, '456 Hackney Central Square', 'Hackney', 'E9 5BB'),
    (10, '789 Thamesmead Road', 'Thamesmead', 'SE2 0AB');
    
INSERT INTO business_hours (business_id, week_day, is_open, opening_time, closing_time)
VALUES
	# Business 1
    (1, 'Monday', TRUE, '09:00:00', '18:00:00'),
    (1, 'Tuesday', TRUE, '09:00:00', '18:00:00'),
    (1, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (1, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (1, 'Friday', TRUE, '09:00:00', '18:00:00'),
    (1, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (1, 'Sunday', FALSE, NULL, NULL),

    # Business 2
    (2, 'Monday', FALSE, NULL, NULL),
    (2, 'Tuesday', TRUE, '09:00:00', '17:00:00'),
    (2, 'Wednesday', FALSE, NULL, NULL),
    (2, 'Thursday', TRUE, '09:00:00', '17:00:00'),
    (2, 'Friday', TRUE, '09:00:00', '17:00:00'),
    (2, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (2, 'Sunday', FALSE, NULL, NULL),
    
    # Business 3
    (3, 'Monday', FALSE, NULL, NULL),
    (3, 'Tuesday', TRUE, '09:00:00', '18:00:00'),
    (3, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (3, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (3, 'Friday', TRUE, '09:00:00', '18:00:00'),
    (3, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (3, 'Sunday', TRUE, '10:00:00', '16:00:00'),

    # Business 4
    (4, 'Monday', FALSE, NULL, NULL),
    (4, 'Tuesday', FALSE, NULL, NULL),
    (4, 'Wednesday', FALSE, NULL, NULL),
    (4, 'Thursday', FALSE, NULL, NULL),
    (4, 'Friday', TRUE, '09:00:00', '20:00:00'),
    (4, 'Saturday', TRUE, '09:00:00', '20:00:00'),
    (4, 'Sunday', TRUE, '10:00:00', '18:00:00'),

    # Business 5
    (5, 'Monday', TRUE, '09:00:00', '18:00:00'),
    (5, 'Tuesday', TRUE, '09:00:00', '18:00:00'),
    (5, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (5, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (5, 'Friday', TRUE, '09:00:00', '18:00:00'),
    (5, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (5, 'Sunday', FALSE, NULL, NULL),

    # Business 6
    (6, 'Monday', TRUE, '09:00:00', '18:00:00'),
    (6, 'Tuesday', TRUE, '09:00:00', '18:00:00'),
    (6, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (6, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (6, 'Friday', FALSE, NULL, NULL),
    (6, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (6, 'Sunday', TRUE, '10:00:00', '16:00:00'),

    # Business 7
    (7, 'Monday', TRUE, '09:00:00', '18:00:00'),
    (7, 'Tuesday', FALSE, NULL, NULL),
    (7, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (7, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (7, 'Friday', TRUE, '09:00:00', '16:00:00'),
    (7, 'Saturday', TRUE, '11:00:00', '19:00:00'),
    (7, 'Sunday', FALSE, NULL, NULL),

    # Business 8
    (8, 'Monday', TRUE, '09:00:00', '18:00:00'),
    (8, 'Tuesday', TRUE, '09:00:00', '18:00:00'),
    (8, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (8, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (8, 'Friday', TRUE, '09:00:00', '18:00:00'),
    (8, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (8, 'Sunday', FALSE, NULL, NULL),

    # Business 9
    (9, 'Monday', TRUE, '09:00:00', '18:00:00'),
    (9, 'Tuesday', TRUE, '09:00:00', '18:00:00'),
    (9, 'Wednesday', TRUE, '09:00:00', '18:00:00'),
    (9, 'Thursday', TRUE, '09:00:00', '18:00:00'),
    (9, 'Friday', TRUE, '09:00:00', '18:00:00'),
    (9, 'Saturday', TRUE, '10:00:00', '16:00:00'),
    (9, 'Sunday', TRUE, '10:00:00', '16:00:00'),
    
     # Business 10
    (10, 'Monday', TRUE, '09:00:00', '19:00:00'),
    (10, 'Tuesday', TRUE, '09:00:00', '19:00:00'),
    (10, 'Wednesday', TRUE, '09:00:00', '15:00:00'),
    (10, 'Thursday', TRUE, '09:00:00', '17:00:00'),
    (10, 'Friday', TRUE, '09:00:00', '17:00:00'),
    (10, 'Saturday', TRUE, '10:00:00', '15:00:00'),
    (10, 'Sunday', FALSE, NULL, NULL);
    
INSERT INTO users (username, user_email, first_name, last_name, phone_number, date_of_birth)
VALUES
    ('john101', 'john@mail.com', 'John', 'a', '3958', NULL),
    ('ruth_e', 'ruth@mail.com', 'Ruth', 'b', NULL, NULL),
    ('delilah', NULL, 'Delilah', 'c', NULL, NULL),
    ('solomon', NULL, 'Solomon', 'd', NULL, '1972-06-01'),
    ('sarahhhh', 'sarah@mail.com', 'Sarah', 'e', NULL, NULL),
    ('ab1ga1l', 'abi@mail.com', 'Abigail', 'f', NULL, NULL),
    ('p_drizzle', 'precious@mail.com', 'Precious', 'g', NULL, NULL),
    ('tttessy', 'tess@mail.com', 'Theresa', 'h', '7890', '2003-10-04'),
    ('h3nriee', 'henr.ie1@mail.com', 'Henrie', 'i', '5542', NULL),
    ('eve', 'eve@mail.com', 'Eve', 'j', NULL, NULL),
    ('han_nah', 'hannah@mail.com', 'Hannah', 'k', NULL, NULL),
    ('l.eah', 'leah@mail.com', 'Leah', 'l', NULL, '1999-08-15'),
    ('keziah', 'kzh@mail.com', 'Keziah', 'm', '73339', NULL),
    ('mary_n', 'mary@mail.com', 'Mary', 'n', '1112', '2000-10-10');
    
INSERT INTO reviews (business_id, user_id, rating, review_text, timestamp)
VALUES
    (9, 1, 5, 'Great service and friendly stylist!', '2024-04-06 10:00:56'),
    (5, 2, 4, 'Love my braids, but a bit pricey.', '2024-04-10 11:30:03'),
    (2, 3, 3, 'Average experience, could be better.', '2024-04-10 14:45:21'),
    (10, 14, 5, 'Absolutely loved my makeup!', '2024-04-11 09:15:30'),
    (4, 4, 4, 'Great barber, but sometimes crowded.', '2024-04-16 12:00:17'),
    (1, 6, 5, 'Obsessed with my hair. Definitely coming back!', '2024-04-16 15:30:09'),
    (2, 7, 3, 'Decent French tip, but could have been neater, cheap.', '2024-04-17 10:45:46');


###########################################################
############## USING JOINS TO CREATE A VIEW ###############

-- A view that combines information about businesses (their name, town, phone number,
-- and whether they provide emergency appointments)
-- with information about the services they offer (service name and price).
-- Used CASE to change the boolean parameter to read Yes/No in the view.

CREATE VIEW business_services AS
SELECT b.business_name, b.town, b.phone_number,
       s.service_name, s.price,
       CASE 
       WHEN b.emergency_appointments = TRUE THEN 'Yes'
       ELSE 'No'
       END AS emergency_appts_accepted
FROM business b
JOIN services s ON b.business_id = s.business_id;


###########################################################
##################### STORED FUNCTION #####################

--  This function converts the duration (which is in hours (decimal data type)) 
-- into a human-readable format. 
-- It is then applied in a query to format the durations stored in the services table.

DELIMITER //
CREATE FUNCTION DurationToString(duration DECIMAL(5, 2))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE duration_string VARCHAR(100);
    
	SET duration_string = CONCAT(
	FLOOR(duration), ' hour', 
	IF(FLOOR(duration) > 1, 's ', ' '), 
	ROUND((duration - FLOOR(duration)) * 60), ' minutes'
    );

    RETURN duration_string;
END//
DELIMITER ;

# Function applied to query:
SELECT 
    service_id,
    service_name,
    DurationToString(duration) AS duration1,
    price
FROM 
    services;


###########################################################
################# QUERY WITH A SUBQUERY ###################

-- Main query retrieves business name, town, service name and price, 
-- The subquery filters these results based on whether 'braid' service is offered. 

SELECT
    b.business_name,
    b.town,
    s.service_name,
    s.price
FROM 
    business b
JOIN 
    services s ON b.business_id = s.business_id
WHERE 
    b.business_id IN (
    SELECT DISTINCT business_id
    FROM services 
    WHERE service_name LIKE '%braid%'
    );
    

###########################################################
################### STORED PROCEDURE ######################

-- The stored procedure searches for businesses offering the service input provided 
-- and returns information about those businesses.

DELIMITER //

CREATE PROCEDURE FindService(
    IN service_name VARCHAR(100)
)
BEGIN
    SELECT 
        b.business_id,
        b.business_name,
        b.town,
        s.service_name,
        s.price
    FROM 
        business b
    JOIN 
        services s ON b.business_id = s.business_id
    WHERE 
        s.service_name LIKE CONCAT('%', service_name, '%');
END //

DELIMITER ;

CALL FindService('glam');


###########################################################
######################## TRIGGER ##########################

-- Trigger removes related records from
-- other tables when a business record is deleted from the business table.

DELIMITER //

CREATE TRIGGER deleteLinkedData
BEFORE DELETE ON business
FOR EACH ROW
BEGIN
	DELETE FROM services WHERE business_id = OLD.business_id;
    DELETE FROM business_hours WHERE business_id = OLD.business_id;
    DELETE FROM reviews WHERE business_id = OLD.business_id;
    DELETE FROM address WHERE business_id = OLD.business_id;
END//
DELIMITER ;

-- **Side note: Since the business id is on auto increment, once a row has been deleted, the id is
-- 				also gone and not replaced. so to re-run the code we would have to change the id 
-- 				to 13 (and subsequent numbers) when we test the trigger.
-- 				 *** In the future I could also just remove the auto increment feature to alleviate this issue.
# Testing
INSERT INTO business (business_name, town, phone_number, business_email, website, emergency_appointments)
VALUES ('Sample Business', 'Town', '123456789', 'sample@example.com', 'www.sample.com', TRUE);

INSERT INTO services (business_id, service_name, duration, price)
VALUES (12, 'Service A', 1.5, 50.00);

INSERT INTO address (business_id, street, town, postcode)
VALUES (12, 'Sample street', 'Sample Town', 'SMPL3');

# BEFORE DELETION
SELECT * FROM services WHERE business_id = 12;
SELECT * FROM address WHERE business_id = 12;

DELETE FROM business WHERE business_id = 12;

# AFTER DELETION
SELECT * FROM services WHERE business_id = 12;
SELECT * FROM address WHERE business_id = 12;


###########################################################
######################### EVENT ###########################

DELIMITER //
CREATE EVENT delete_old_reviews
    ON SCHEDULE EVERY 1 WEEK
    DO
    BEGIN
        DELETE FROM reviews
        WHERE timestamp < NOW() - INTERVAL 1 YEAR;
    END //
DELIMITER ;

###########################################################
######################### EVENT ###########################

-- A reccuring event which deletes records that are over a year old from the reviews
-- table weekly, to ensure that only recent reviews are retained in the database. 

DELIMITER //
CREATE EVENT delete_old_reviews
    ON SCHEDULE EVERY 1 WEEK
    DO
    BEGIN
        DELETE FROM reviews
        WHERE timestamp < NOW() - INTERVAL 1 YEAR;
    END //
DELIMITER ;


###########################################################
################ VIEW WITH 3 BASE TABLES ##################

-- This view retrieves a list of reviews along with associated business
-- and user info (using the tables: business, reviews and users),
-- ordered by business name and review timestamp.

CREATE VIEW business_reviews AS
SELECT 
    b.business_name,
    b.town,
    u.username,
    r.rating,
    r.review_text,
    r.timestamp
FROM 
    business b
JOIN 
    reviews r ON b.business_id = r.business_id
JOIN 
    users u ON r.user_id = u.user_id
ORDER BY 
    b.business_name, r.timestamp DESC;

###########################################################
############### GROUP BY AND HAVING QUERY #################

-- This query retrieves information for businesses with an average rating greater than 3.

SELECT
    b.business_name,
    b.town,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM 
    business b
LEFT JOIN 
    reviews r ON b.business_id = r.business_id
GROUP BY 
    b.business_id, b.business_name, b.town
HAVING 
    average_rating > 3
ORDER BY 
    average_rating DESC;
