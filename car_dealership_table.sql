CREATE TABLE customer(
	customer_id serial PRIMARY KEY,
	customer_first_name varchar(45),
	customer_last_name varchar(45),
	customer_address varchar(45),
	customer_billing_info varchar(45),
	customer_phone_number varchar(45),
	customer_email varchar(45)

);

CREATE TABLE sales_rep(
	rep_id serial PRIMARY KEY,
	rep_first_name varchar(45),
	rep_last_name varchar(45), 
	rep_address varchar(145),
	rep_phone_number varchar(45),
	rep_pay_scale float

);

CREATE TABLE car(
	serial_number serial PRIMARY KEY,
	rep_id integer REFERENCES sales_rep(rep_id),
	customer_id integer,
	"year" integer,
	make varchar(45),
	model varchar(45),
	color varchar(45)

);

CREATE TABLE invoice(
	invoice_id serial PRIMARY KEY,
	customer_id integer,
	serial_number integer REFERENCES car(serial_number),
	amount float,
	"date" timestamp,
	rep_id integer,
	ticket_id integer

);

CREATE TABLE service_ticket(
	ticket_id serial PRIMARY KEY,
	serial_number integer REFERENCES car(serial_number),
	service_description varchar(1000),
	car_mileage float,
	service_date timestamp

);

CREATE TABLE ticket_deployment(
	deplyment_id serial PRIMARY KEY,
	ticket_id integer REFERENCES ticket_deployment(deplyment_id),
	mechanic_id integer REFERENCES mechanic(mechanic_id),
	service_date timestamp

);

CREATE TABLE mechanic(
	mechanic_id serial PRIMARY KEY,
	mechanic_first_name varchar(45),
	mechanic_lastLname varchar(45),
	mechanic_address varchar(255),
	mechanic_email varchar(50),
	mechanic_payscale float
	

);

