/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T6-ma-json.sql


--Student ID:
--Student Name:


/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT 
    JSON_OBJECT(
        KEY 'customer' VALUE JSON_OBJECT(
            KEY 'custno' VALUE c.cust_no,
            KEY 'name' VALUE c.cust_name,
            KEY 'phone' VALUE c.cust_phone
        ),
        KEY 'rego_number' VALUE v.veh_rego,
        KEY 'make' VALUE v.veh_make,
        KEY 'model' VALUE v.veh_model,
        KEY 'year' VALUE v.veh_year,
        KEY 'noservices' VALUE noservices,
        KEY 'booked_services' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                KEY 'servno' VALUE s.serv_no,
                KEY 'servdate' VALUE TO_CHAR(s.serv_date, 'DD-Mon-YYYY'),
                KEY 'labour cost' VALUE s.serv_labour_cost,
                KEY 'partcost' VALUE s.serv_parts_cost,
                KEY 'totalcost' VALUE (s.serv_labour_cost + s.serv_parts_cost)
            ) ORDER BY s.serv_date
        )
    ) AS vehicle_json
FROM 
    CUSTOMER c
JOIN 
    VEHICLE v ON c.cust_no = v.cust_no
JOIN 
    (
        SELECT veh_vin, COUNT(serv_no) AS noservices
        FROM SERVICE
        GROUP BY veh_vin
    ) s_count ON v.veh_vin = s_count.veh_vin
JOIN 
    SERVICE s ON v.veh_vin = s.veh_vin
GROUP BY 
    c.cust_no, c.cust_name, c.cust_phone, v.veh_rego, v.veh_make, v.veh_model, v.veh_year, v.veh_vin, noservices;
