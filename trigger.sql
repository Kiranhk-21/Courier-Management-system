--trigger for checking entered email id follows the standards or not so that we can avoid 
-- contacting them through emails
DELIMITER $$
CREATE TRIGGER check_email BEFORE INSERT ON customer FOR EACH ROW IF NEW.email_id
NOT REGEXP '^[^@]+@[^@]+\.[^@]{2,}$' THEN SET NEW.email_id = NULL; 
    END IF;
$$

--trigger for checking the updated curr_loc attribute should be allowed or not
DELIMITER $$
CREATE TRIGGER check_status BEFORE UPDATE ON track FOR EACH ROW IF date(OLD.delivery_date) < date('2022-03-20')
 THEN SET NEW.curr_loc = NULL; 
    END IF;
$$
DELIMITER ;