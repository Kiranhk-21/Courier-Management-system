--JOIN
-- 1.Printing the details of customer who haven't received the package yet
SELECT cust_id,fname,lname,curr_loc FROM customer NATURAL JOIN track WHERE curr_loc <> "NULL";

-- 2.Printing the details and current location of all the delivery agents
SELECT delivery_agent.da_id,da_name,contact_no,vehicle_no,curr_loc FROM delivery_agent LEFT JOIN 
track ON delivery_agent.da_id = track.da_id;

-- 3.Printing the details of delivery agent who are not delivering the package
SELECT * FROM delivery_agent WHERE NOT EXISTS(
    SELECT track.da_id FROM track WHERE delivery_agent.da_id = track.da_id AND curr_loc <> "NULL");

-- 4.Printing details of package which are ordered by customer Sheldon 
SELECT track.package_id,package_weight,package_info FROM package,track WHERE EXISTS(
    SELECT cust_id,fname,lname FROM Customer WHERE package.package_id = track.package_id AND 
    customer.cust_id = track.cust_id AND fname = "Sheldon");

-- 5.Printing the details of customer who have availed the service type as Parcel service
SELECT customer.cust_id,fname,lname FROM customer JOIN track ON customer.cust_id = track.cust_id WHERE 
service_id IN (SELECT service_id FROM services WHERE service_type = "Parcel Service");

-- 6.Printing the details of services which is not availed by customer Albert Einstein
SELECT service_id,service_name_,service_type,price,cust_id FROM services NATURAL JOIN 
track WHERE cust_id NOT IN (SELECT cust_id FROM customer WHERE fname="Albert" AND lname = "Einstein"); 

--AGGREGATE
-- 1. Find the total count of customers who have availed the same as service as cust_45
SELECT service_id,count(service_id) AS no_of_customers FROM customer NATURAL JOIN
track GROUP BY service_id HAVING service_id IN 
(SELECT service_id FROM track WHERE cust_id = "cust_45");

-- 2. Find the total amount spent by each customer in ordering a package
SELECT cust_id,sum(price) AS total_amount FROM track NATURAL JOIN services GROUP BY cust_id;

--SET 
-- 1.Printing details of customers who stay in countries other than India
SELECT * FROM customer EXCEPT (SELECT * FROM customer WHERE country = "India"); 

-- 2.Printing details of delivery agent,delivery package which have opted for service number 3 & 2
(SELECT * FROM delivery_agent WHERE da_id IN (SELECT da_id FROM track WHERE service_id = 2)) 
INTERSECT (SELECT * FROM delivery_agent WHERE da_id IN (SELECT da_id FROM track WHERE service_id = 3));