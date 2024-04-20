/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T3-ma-dml.sql

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

-- Please ensure EACH SQL statement you add is formatted
-- and includes a semicolon

/* (a) */
-- Create a set of sequences that will allow you to enter data into the SERVICE and PART_CHARGE tables—all such sequences must start at 1000 and go up in steps of 10 (i.e. the first value is 1000, the next 1010 etc.).

CREATE SEQUENCE service_seq
    START WITH 1000
    INCREMENT BY 10
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE part_charge_seq
    START WITH 1000
    INCREMENT BY 10
    NOCACHE
    NOCYCLE;


/* (b) */
-- (b) The customer with phone number '6715573197', has called in and informed Monash Automotive that they have changed the registration number of the sole vehicle they own to 'GDD132'. 
--     You may assume that no other customer has this phone number.

UPDATE VEHICLE
SET veh_rego = 'GDD132'
WHERE cust_no = (
    SELECT cust_no
    FROM CUSTOMER
    WHERE cust_phone = '6715573197'
);

/* (c) */
-- Customer number 1030, Farrel Grazier has brought her Mazda CX-5 in for a service (the date should be treated as 21 March 2024). She brought it in at 8:30 am and required the vehicle back by 12 noon. The vehicle has completed 12,000 km and she will be paying by 'cash' if any charges are involved (this may be a warranty repair). 
--Her reason for bringing the vehicle in is that the 'Rear seat belts are not properly retracting'. You may assume that Farrel Grazier only owns one Mazda CX-5

INSERT INTO Service (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (service_seq.NEXTVAL, TO_DATE('21-MAR-2024', 'DD-MON-YYYY'), TO_DATE('21-MAR-2024 08:30', 'DD-MON-YYYY HH24:MI'), TO_DATE('21-MAR-2024 12:00', 'DD-MON-YYYY HH24:MI'), NULL, 12000, 0, 0, 'Rear seat belts are not properly retracting', 'C', 
    (SELECT veh_vin
    FROM VEHICLE
    WHERE cust_no = 1030),
    1030
);


/* (d) */
-- One of the MA mechanics starts the service job for the service in (c) above, they determine that the retraction issue was due to the belt mechanism being jammed. 
-- They remove the material causing the jam, so no parts are required.
-- MA decides, in the interests of customer goodwill, that there will be no labour cost. The vehicle is ready to be picked up at 9:10 am.

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES ((SELECT serv_no
        FROM SERVICE
        WHERE cust_no = 1030
        AND serv_date = TO_DATE('21-MAR-2024', 'DD-MON-YYYY')), 1, 'Remove material causing jam');

/* (e) */
-- Monash Automotive have decided that they no longer wish to source any parts from 'Australian Automotive Parts'. 
-- An audit of MA's part usage shows that although they have several different Australian Automotive Parts items in stock, they have never been used for any service. They will return these items to the vendor and thus remove them from the MA part stock.

DELETE FROM PART
WHERE vendor_id = (
    SELECT vendor_id
    FROM VENDOR
    WHERE vendor_name = 'Australian Automotive Parts'
);