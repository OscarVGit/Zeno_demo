/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T4-ma-select.sql

--Student ID:
--Student Name:

/* Comments for your marker:

Customer

P *cust_no
*cust_name
*cust_street
*cust_town
*cust_pcode
*cust_phone

CUSTOMER currently owns VEHICLE

CUSTOMER books SERVICE
Vehicle

P *veh_vin
*veh_rego
*veh_year
*veh_make
*Veh_model
F *cust_no

VEHICLE requires SERVICE
Pay_Mode

P *pay_mode_code
*pay_mode_description

PAY_MODE codes SERVICE
SERVICE

P *serv_no
*serv_date
*serv_drop_off
*serv_req_pickup
serv_ready_pickup
*serv_kms
serv_labour_cost
serv_parts_cost
*serv_instructions
F *pay_mode_code
F *veh_vin
F *cust_no

SERVICE consists of SERVICE_JOB
SERVICE_JOB

PF *serv_no
P *sj_job_no
*sj_task_description

SERVICE_JOB incurs PART_CHARGE
PART_CHARGE

P *part_charge_no
*pc_quantity
*pc_linecost
UF*serv_no
UF*sj_job_no
UF*part_code

PART_CHARGE charged to PART
PART

P *part_code
*part_description
*part_unit_cost
*part_stock
F*vendor_id

VENDOR supplies PART
VENDOR

P *vendor_id
U *vendor_name
*vendor_address
*vendor_phone


*/

/* (a) */
-- Report the service number, vehicle vin, registration number, make, the service job numbers and service job descriptions for all services which have been completed. 
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT s.serv_no, v.veh_vin, v.veh_rego, v.veh_make, sj.sj_job_no, sj.sj_task_description
FROM SERVICE s
JOIN VEHICLE v ON s.veh_vin = v.veh_vin
JOIN SERVICE_JOB sj ON s.serv_no = sj.serv_no
WHERE s.serv_ready_pickup IS NOT NULL;


/* (b) */
-- For every part stocked by Monash Automotive list the part code, description, vendor ID and vendor name in a single VENDOR column separated by—(see below), the current stock held by MA and the total value of the parts stock currently held. 

-- The output should be in part code order. 

-- The stock value should be output in the form $123.45.
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Heading for the output will be: PART_CODE, PART_DESCRIPTION, VENDOR, PART_STOCK, STOCK_VALUE

-- SELECT p.part_code, p.part_description, p.vendor_id, CONCAT(TO_CHAR(v.vendor_id) '-', v.vendor_name) AS vendor, p.part_stock, CONCAT('$', p.part_stock * p.part_unit_cost) AS total_value
-- FROM PART p
-- JOIN VENDOR v ON p.vendor_id = v.vendor_id
-- WHERE p.part_stock > 0
-- ORDER BY p.part_code;

SELECT 
    p.part_code, 
    p.part_description, 
    p.vendor_id, 
    TO_CHAR(v.vendor_id) || '-' || v.vendor_name AS vendor, 
    p.part_stock, 
    '$' || TO_CHAR(p.part_stock * p.part_unit_cost) AS STOCK_VALUE
FROM 
    PART p
JOIN 
    VENDOR v ON p.vendor_id = v.vendor_id
WHERE 
    p.part_stock > 0
ORDER BY 
    p.part_code;

/* (c) */
-- For every part stocked by Monash Automotive list the part code, the part description, the name of the vendor who supplies the part,
-- and an indicator if the part has been used (or not used) in a service. The indicator should say 'Used in at least one service' or 'Not used in any service'. 

-- The output should be in part code order. 

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Heading for the output will be: PART_CODE, PART_DESCRIPTION, VENDOR_NAME, PARTUSAGE

SELECT p.part_code, p.part_description, v.vendor_name,
CASE
    WHEN EXISTS (SELECT * FROM PART_CHARGE pc WHERE pc.part_code = p.part_code) THEN 'Used in at least one service'
    ELSE 'Not used in any service'
END AS PARTUSAGE
FROM PART p
JOIN VENDOR v ON p.vendor_id = v.vendor_id
ORDER BY p.part_code;

/* (d) */
-- For every part stocked by Monash Automotive list the part code, part description, the quantity of these items which have been charged out via a part charge and the total amount of such charges. In arriving at your solution, it is important to note that the current unit cost listed in the part table may not be the price the item was charged out at due to part price variations. 

-- Your output should be listed with the part which has been used the most times first. 
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT p.part_code, p.part_description, SUM(pc.pc_quantity) AS quantity, CONCAT('$', SUM(pc.pc_quantity * p.part_unit_cost)) AS total_amount
FROM PART p
JOIN PART_CHARGE pc ON p.part_code = pc.part_code
GROUP BY p.part_code, p.part_description
ORDER BY quantity DESC;


/* (e) */
-- For all completed services in which the vehicle was ready for pickup later than the customer's requested pickup time, list the customer number, customer name, the service number, the required pickup time, the time the vehicle was ready for pickup and how late the delivery was in hours and minutes in the form 1 hr 15 mins. 

-- The output should show the longest delayed delivery first. 
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Heading for the output will be CUST_NO, CUSTOMER NAME, SERV_NO, REQUIRED PICKUP TIME, READY FOR PICKUP TIME, LATE DELIVERY
-- In addition, REQUIRED PICKUP TIME and READY FOR PICKUP TIME should be in the format of time only (e.g. 12:30 pm, 11 am, etc.)
-- LATE DELIVERY will be in the format of 1 hr 15 mins, 2 hr 30 mins, etc.

-- SELECT c.cust_no AS 'CUST_NO', c.cust_name AS 'CUSTOMER NAME', s.serv_no AS 'SERV_NO', 
-- DATE_FORMAT(s.serv_req_pickup, '%h:%i %p') AS 'REQUIRED PICKUP TIME', 
-- DATE_FORMAT(s.serv_ready_pickup, '%h:%i %p') AS 'READY FOR PICKUP TIME',
-- CONCAT(FLOOR((TIME_TO_SEC(TIMEDIFF(s.serv_ready_pickup, s.serv_req_pickup)) / 3600)), ' hr ',
-- FLOOR((TIME_TO_SEC(TIMEDIFF(s.serv_ready_pickup, s.serv_req_pickup)) % 3600) / 60), ' mins') AS 'LATE DELIVERY'
-- FROM CUSTOMER c
-- JOIN SERVICE s ON c.cust_no = s.cust_no
-- WHERE s.serv_ready_pickup > s.serv_req_pickup
-- ORDER BY delay DESC;

-- SELECT 
--     c.cust_no AS CUST_NO, 
--     c.cust_name AS CUSTOMER_NAME, 
--     s.serv_no AS SERV_NO,
--     TO_CHAR(s.serv_req_pickup, 'HH:MI AM') AS REQUIRED_PICKUP_TIME,
--     TO_CHAR(s.serv_ready_pickup, 'HH:MI AM') AS READY_FOR_PICKUP_TIME,
--     EXTRACT(HOUR FROM (s.serv_ready_pickup - s.serv_req_pickup)) || ' hr ' ||
--     EXTRACT(MINUTE FROM (s.serv_ready_pickup - s.serv_req_pickup)) || ' mins' AS LATE_DELIVERY
-- FROM 
--     CUSTOMER c
-- JOIN 
--     SERVICE s ON c.cust_no = s.cust_no
-- WHERE 
--     s.serv_ready_pickup > s.serv_req_pickup
-- ORDER BY 
--     LATE_DELIVERY DESC;

SELECT 
    c.cust_no AS CUST_NO, 
    c.cust_name AS CUSTOMER_NAME, 
    s.serv_no AS SERV_NO,
    TO_CHAR(s.serv_req_pickup, 'HH:MI AM') AS REQUIRED_PICKUP_TIME,
    TO_CHAR(s.serv_ready_pickup, 'HH:MI AM') AS READY_FOR_PICKUP_TIME,
    FLOOR((s.serv_ready_pickup - s.serv_req_pickup) * 24) || ' hr ' ||
    FLOOR(MOD((s.serv_ready_pickup - s.serv_req_pickup) * 1440, 60)) || ' mins' AS LATE_DELIVERY
FROM 
    CUSTOMER c
JOIN 
    SERVICE s ON c.cust_no = s.cust_no
WHERE 
    s.serv_ready_pickup > s.serv_req_pickup
ORDER BY 
    LATE_DELIVERY DESC;


/* (f) */
-- List the customer number, customer name and total amount they have been charged for parts across all their completed services where the amount they have been charged is greater than the average amount charged for parts across all completed services for all customers.

-- For example, on average customers may have been charged $234.56 for all part charges across all their services.

-- This report will then list those customers whose total part charges across all their services exceeds $234.56 
-- (note these figures are quite small here due to the small amount of data in our model system). 
-- The customer with the highest part charges should be listed first. Where two customers have been charged the same total parts charge, order them by the customer's name. 

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- SELECT c.cust_no, c.cust_name, SUM(pc.pc_quantity * p.part_unit_cost) AS 'TOTAL_PART_PAYMENT'
-- FROM CUSTOMER c
-- JOIN SERVICE s ON c.cust_no = s.cust_no
-- JOIN PART_CHARGE pc ON s.serv_no = pc.serv_no
-- JOIN PART p ON pc.part_code = p.part_code
-- GROUP BY c.cust_no, c.cust_name
-- HAVING SUM(pc.pc_quantity * p.part_unit_cost) > (SELECT AVG(pc_quantity * part_unit_cost) FROM PART_CHARGE)
-- ORDER BY total_amount DESC, c.cust_name;

WITH avg_part_payment AS (
    SELECT AVG(PC_LINECOST) AS avg_payment
    FROM PART_CHARGE
)
SELECT
    c.cust_no,
    c.cust_name,
    SUM(pc.pc_quantity * p.part_unit_cost) AS TOTAL_PART_PAYMENT
FROM
    CUSTOMER c
JOIN
    SERVICE s ON c.cust_no = s.cust_no
JOIN
    PART_CHARGE pc ON s.serv_no = pc.serv_no
JOIN
    PART p ON pc.part_code = p.part_code
CROSS JOIN
    avg_part_payment
GROUP BY
    c.cust_no, c.cust_name, avg_part_payment.avg_payment
HAVING
    SUM(pc.pc_quantity * p.part_unit_cost) > avg_part_payment.avg_payment
ORDER BY
    TOTAL_PART_PAYMENT DESC, c.cust_name;



