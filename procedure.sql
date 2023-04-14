--procedure for email verification
DELIMITER $$

CREATE PROCEDURE verify_email()
BEGIN 
-- DECLARE email VARCHAR(50);
-- SET email = "@gmail.com"
UPDATE customer SET email_id = NULL WHERE email_id NOT REGEXP '^[^@]+@[^@]+\.[^@]{2,}$';
/* setting the email_id attribute value as NULL for those email_id which don't follow standard naming
 convention*/
END$$
DELIMITER ;


CALL verify_email();
SELECT * from Customer;