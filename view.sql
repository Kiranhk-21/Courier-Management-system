-- Creating view to locate the current location of package for a given customer

CREATE OR REPLACE VIEW get_loc AS 
SELECT customer.cust_id,package_id,fname,lname,curr_loc FROM customer LEFT JOIN track 
ON customer.cust_id=track.cust_id;
