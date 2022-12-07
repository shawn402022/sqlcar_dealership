--INSERT CUSTOMER
CREATE OR REPLACE PROCEDURE insertCustomer(_first_name varchar, _last_name varchar, _address varchar, 
							_billing varchar,_phone varchar,_email varchar)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO customer(customer_first_name, customer_last_name, customer_address, customer_billing_info, customer_phone_number, customer_email)
	VALUES
		(_first_name, _last_name, _address, _billing, _phone, _email);
END;
$$

--INSERT SALES REP
CREATE OR REPLACE PROCEDURE insertSalesRep(_first_name varchar,_last_name varchar, _address varchar, _phone varchar, _pay float)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO sales_rep(rep_first_name, rep_last_name, rep_address, rep_phone_number, rep_pay_scale)
	VALUES 
		(_first_name, _last_name, _address, _phone, _pay);
END;
$$

--INSERT CAR
CREATE OR REPLACE PROCEDURE insertCar(_rep_id integer, _customer_id integer, _year integer, _make varchar, _model varchar, _color varchar )
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO car(rep_id, customer_id, "year", make, model, color)
	VALUES
		(curval('sales_rep_rep_id_seq'::regclass), curval('customer_customer_id_seq'::regclass), "_year", _make, _model, _color);			
END;
$$

--INSERT SERVICE TICKET
CREATE OR REPLACE PROCEDURE insertServiceTicket( _service_description varchar, _car_mileage float, _service_date timestamp)
LANGUAGE plpgsql AS  $$
BEGIN 
	INSERT INTO service_ticket( serial_number, service_description, car_mileage, service_date)
	VALUES 
		(curval('car_serial_number_seq'::regclass), _service_description, _car_mileage, _service_date);
END;
$$

--INSERT INVOCE
CREATE OR REPLACE PROCEDURE insertInvoice(_amount float, _date timestamp)
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO invoice(customer_id, serial_number, amount, date, rep_id, ticket_id)
	VALUES 
		(curval('customer_customer_id_seq'::regclass), curval('car_serial_number_seq'::regclass), _amount, "_date", 
	curval('sales_rep_rep_id_seq'::regclass), curval('service_ticket_ticket_id_seq'::regclass));		
END;
$$

--INSERT MECHANIC
CREATE OR REPLACE PROCEDURE insertMechanic(_first_name varchar, _last_name varchar, _address varchar, _phone varchar, _email varchar)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO mechanic(mechanic_first_name, mechanic_last_name, mechanic_address, mechanic_phone_number, mechanic_email)
	VALUES
		(_first_name, _last_name, _address, _phone, _email);
END;
$$

--INSERT TICKET DEPLOYMENT
CREATE OR REPLACE PROCEDURE insertTicketDeployment(_service_date timestamp)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO ticket_deployment(ticket_id, mechanic_id, service_date)
	VALUES 
		(curval('service_ticket_ticket_id_seq'::regclass), curval('mechanic_mechanic_id_seq'::regclass), _service_date);
END;
$$
 


