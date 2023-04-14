--function for checking status of the delivery as of '20-03-2022 23:59:59'
DELIMITER $$

CREATE FUNCTION add_status(usr_id VARCHAR(10),del_date DATETIME)
RETURNS VARCHAR(50)

BEGIN
    DECLARE status_p VARCHAR(50);
    DECLARE st INT;
    IF (DATE(del_date) > DATE('2022-03-20')) THEN
        SET status_p = "Package not yet delivered";
    ELSEIF (DATE(del_date) = DATE('2022-03-20') AND TIME(del_date) > TIME('23:59:59')) THEN
        SET status_p = "Package not yet delivered";
    ELSE
        SET status_p = "Package Successfully delivered";
    END IF;

    RETURN status_p;
END;
$$

DELIMITER ;
SELECT *,add_status(cust_id,delivery_date) AS Delivery_status FROM track;
