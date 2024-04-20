/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
-- T2-ma-insert.sql

-- Student ID:
-- Student Name:

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

-- Please ensure EACH insert statement you add is formatted
-- and includes a semicolon

-- INSERTING into SERVICE
-- We want to insert the following data into the SERVICE table, the entire ERD is provided above
-- 10 SERVICEs entries

--    Carried out on at least 6 different vehicles
--    Have at least 2 service entries that involve more than one job
--    Have at least 2 service entries that were ready for pickup before the requested pickup date/time and at least 2 that were ready after the requested pickup day/time

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (1, '2023-01-01', '2023-01-01 08:00:00', '2023-01-01 17:00:00', '2023-01-01 17:00:00', 125223, 120, 58.99, ' Regular Service', 'C', 'WBAWR33598P984354', 1000), (2, '2023-01-15', '2023-01-15 09:30:00', '2023-01-15 13:00:00', '2023-01-15 16:00:00', 221523, 250, 128, 'Broken Oil Filter', 'S', 'WAUVFAFH4AN857561', 1010),
-- (3, '2023-02-01', '2023-02-01 08:00:00', '2023-02-01 17:00:00', '2023-02-01 16:00:00', 34002, 310, 54.99, 'Air conditionining broken', 'C', 'WAUGFAFC8FN843179', 1020),
-- (4, '2023-02-15', '2023-02-15 08:00:00', '2023-02-15 17:00:00', '2023-02-15 16:00:00', 9000, 320, 22.99, 'Air cleaner hose broken', 'E', 'JN1CV6EK6FM569421', 1030),
-- (5, '2023-03-01', '2023-03-01 08:00:00', '2023-03-01 17:00:00', '2023-03-01 16:00:00', 150223, 440, 43.85*2, 'Regular Service', 'S', '5XXGM4A74DG668202', 1040),
-- (6, '2023-03-15', '2023-03-15 08:00:00', '2023-03-15 17:00:00', '2023-03-15 16:00:00', 122000, 680, 43.85+158, 'Regular Service', 'C', '4T1BK3DB4CU320186', 1050),
-- (7, '2023-04-01', '2023-04-01 08:00:00', '2023-04-01 17:00:00', '2023-04-01 16:00:00', 110292, 220, 60.99, 'Brakes acting up', 'E', 'WA1CGCFE6BD111395', 1040),
-- (8, '2023-04-15', '2023-04-15 08:00:00', '2023-04-15 17:00:00', '2023-04-15 16:00:00', 192341, 120, 12.99, 'Battery inconsistent', 'C', '19UYA42792A297253', 1060),
-- (9, '2023-05-01', '2023-05-01 08:00:00', '2023-06-01 17:00:00', '2023-07-01 11:00:00', 144231, 950, 75.99*2+107+23.45+13*2, 'General Service', 'S', '19XFB2E59DE245929', 1070),
-- (10, '2023-05-15', '2023-05-15 08:00:00', '2023-05-15 17:00:00', '2023-05-15 16:00:00', 154223, 110, 10.6+71.72, 'General Service', 'E', 'WA1DGAFE9CD490452', 1080);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 125223, 120, 58.99, 'Regular Service', 'C', 'WBAWR33598P984354', 1000);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (2, '2023-01-15', '2023-01-15 09:30:00', '2023-01-15 13:00:00', '2023-01-15 16:00:00', 221523, 250, 128, 'Broken Oil Filter', 'S', 'WAUVFAFH4AN857561', 1010);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (3, '2023-02-01', '2023-02-01 08:00:00', '2023-02-01 17:00:00', '2023-02-01 16:00:00', 34002, 310, 54.99, 'Air conditionining broken', 'C', 'WAUGFAFC8FN843179', 1020);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (4, '2023-02-15', '2023-02-15 08:00:00', '2023-02-15 17:00:00', '2023-02-15 16:00:00', 9000, 320, 22.99, 'Air cleaner hose broken', 'E', 'JN1CV6EK6FM569421', 1030);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (5, '2023-03-01', '2023-03-01 08:00:00', '2023-03-01 17:00:00', '2023-03-01 16:00:00', 150223, 440, 87.7, 'Regular Service', 'S', '5XXGM4A74DG668202', 1040);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (6, '2023-03-15', '2023-03-15 08:00:00', '2023-03-15 17:00:00', '2023-03-15 16:00:00', 122000, 680, 43.85, 'Regular Service', 'C', '4T1BK3DB4CU320186', 1050);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (7, '2023-04-01', '2023-04-01 08:00:00', '2023-04-01 17:00:00', '2023-04-01 16:00:00', 110292, 220, 60.99, 'Brakes acting up', 'E', 'WA1CGCFE6BD111395', 1040);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (8, '2023-04-15', '2023-04-15 08:00:00', '2023-04-15 17:00:00', '2023-04-15 16:00:00', 192341, 120, 12.99, 'Battery inconsistent', 'C', '19UYA42792A297253', 1060);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (9, '2023-05-01', '2023-05-01 08:00:00', '2023-06-01 17:00:00', '2023-07-01 11:00:00', 144231, 950, 75.99*2+107+23.45+13*2, 'General Service', 'S', '19XFB2E59DE245929', 1070);

-- INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
-- VALUES (10, '2023-05-15', '2023-05-15 08:00:00', '2023-05-15 17:00:00', '2023-05-15 16:00:00', 154223, 110, 10.6+71.72, 'General Service', 'E', 'WA1DGAFE9CD490452', 1080);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 125223, 120, 58.99, 'Regular Service', 'C', 'WBAWR33598P984354', 1000);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (2, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-15 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 221523, 250, 128, 'Broken Oil Filter', 'S', 'WAUVFAFH4AN857561', 1010);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (3, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 34002, 310, 54.99, 'Air conditionining broken', 'C', 'WAUGFAFC8FN843179', 1020);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (4, TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9000, 320, 22.99, 'Air cleaner hose broken', 'E', 'JN1CV6EK6FM569421', 1030);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (5, TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 150223, 440, 87.7, 'Regular Service', 'S', '5XXGM4A74DG668202', 1040);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (6, TO_DATE('2023-03-15', 'YYYY-MM-DD'), TO_DATE('2023-03-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 122000, 680, 43.85, 'Regular Service', 'C', '4T1BK3DB4CU320186', 1050);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (7, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 110292, 220, 60.99, 'Brakes acting up', 'E', 'WA1CGCFE6BD111395', 1040);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (8, TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 192341, 120, 12.99, 'Battery inconsistent', 'C', '19UYA42792A297253', 1060);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (9, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 144231, 950, 75.99*2+107+23.45+13*2, 'General Service', 'S', '19XFB2E59DE245929', 1070);

INSERT INTO SERVICE (serv_no, serv_date, serv_drop_off, serv_req_pickup, serv_ready_pickup, serv_kms, serv_labour_cost, serv_parts_cost, serv_instructions, pay_mode_code, veh_vin, cust_no)
VALUES (10, TO_DATE('2023-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 154223, 110, 10.6+71.72, 'General Service', 'E', 'WA1DGAFE9CD490452', 1080);




-- INSERTING into SERVICE_JOB
--15 SERVICE_JOBs entries
-- We must take into account the fact that at least 2 service entries involve more than one job

-- INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
-- VALUES (1, 1, 'Replace broken tail light with part GEN123'),
-- (2, 2, 'Replace oil filter with part WR2419'),
-- (3, 3, 'Replace air filter with part WA5045'),
-- (4, 4, 'Replace air cleaner hose with part ACFD22'),
-- (5, 5, 'Replace wiper blade with part TRB025 x 2'),
-- (6, 6, 'Change engine oil with part 341490'),
-- (6, 7, 'Replace coolant with part ONE2-5'),
-- (7, 8, 'Replace brake shoes with part N32780'),
-- (8, 9, 'Replace spark plug with part FR8HDC'),
-- (9, 10, 'Replace timing belt with part T23000 x 2'),
-- (9, 11, 'Replace injector pump with part CTG009'),
-- (9, 12, 'Replace exhaust manifold gasket with part EMS697'),
-- (9, 13, 'Replace spark plug with part NKR6T1 x 2'),
-- (10, 14, 'Replace fuel filter with part R2132P'),
-- (10, 15, 'Replace brake pad set with part DB1849');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (1, 1, 'Replace broken tail light with part GEN123');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (2, 2, 'Replace oil filter with part WR2419');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (3, 3, 'Replace air filter with part WA5045');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (4, 4, 'Replace air cleaner hose with part ACFD22');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (5, 5, 'Replace wiper blade with part TRB025 x 2');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (6, 6, 'Change engine oil with part 341490');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (6, 7, 'Replace coolant with part ONE2-5');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (7, 8, 'Replace brake shoes with part N32780');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (8, 9, 'Replace spark plug with part FR8HDC');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (9, 10, 'Replace timing belt with part T23000 x 2');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (9, 11, 'Replace injector pump with part CTG009');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (9, 12, 'Replace exhaust manifold gasket with part EMS697');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (9, 13, 'Replace spark plug with part NKR6T1 x 2');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (10, 14, 'Replace fuel filter with part R2132P');

INSERT INTO SERVICE_JOB (serv_no, sj_job_no, sj_task_description)
VALUES (10, 15, 'Replace brake pad set with part DB1849');


--  INSERTING into PART_CHARGE
-- 10 PART_CHARGEs entries
-- We want these part charge entries to be associated with service jobs that are associated with different services

-- INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code)
-- VALUES (1, 1, 58.99, 1, 1, 'WR2419'),
-- (2, 1, 128, 2, 2, 'WA5045'),
-- (3, 1, 54.99, 3, 3, 'ACFD22'),
-- (4, 1, 22.99, 4, 4, 'TRB025'),
-- (5, 2, 43.85*2, 5, 5, '341490'),
-- (6, 1, 43.85, 6, 6, '341490'),
-- (7, 1, 158, 6, 7, 'ONE2-5'),
-- (8, 1, 60.99, 7, 8, 'N32780'),
-- (9, 1, 12.99, 8, 9, 'FR8HDC'),
-- (10, 2, 75.99*2, 9, 10, 'T23000'),
-- (11, 1, 107, 9, 11, 'CTG009'),
-- (12, 1, 23.45, 9, 12, 'EMS697'),
-- (13, 2, 13*2, 9, 13, 'NKR6T1'),
-- (14, 1, 10.6, 10, 14, 'R2132P'),
-- (15, 1, 71.72, 10, 15, 'DB1849');

INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (1, 1, 58.99, 1, 1, 'WR2419');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (2, 1, 128, 2, 2, 'WA5045');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (3, 1, 54.99, 3, 3, 'ACFD22');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (4, 1, 22.99, 4, 4, 'TRB025');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (5, 2, 87.7, 5, 5, '341490');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (6, 1, 43.85, 6, 6, '341490');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (7, 1, 158, 6, 7, 'ONE2-5');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (8, 1, 60.99, 7, 8, 'N32780');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (9, 1, 12.99, 8, 9, 'FR8HDC');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (10, 2, 151.98, 9, 10, 'T23000');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (11, 1, 107, 9, 11, 'CTG009');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (12, 1, 23.45, 9, 12, 'EMS697');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (13, 2, 26, 9, 13, 'NKR6T1');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (14, 1, 10.6, 10, 14, 'R2132P');
INSERT INTO PART_CHARGE (part_charge_no, pc_quantity, pc_linecost, serv_no, sj_job_no, part_code) VALUES (15, 1, 71.72, 10, 15, 'DB1849');

