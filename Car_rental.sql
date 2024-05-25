create database carrental;
use car rental;

create table customers (
customer_id varchar(100) primary key,
customer_fname varchar(100) not null,
customer_lname varchar(100) not null,
customer_pnumber varchar(100) not null,
customer_email varchar(100) not null,
customer_address varchar(100) not null
);

create table location(
location_id varchar(100) primary key,
location_name varchar(100) not null,
location_address varchar(255) not null,
location_phonenumber varchar(100) not null
);

create table category(
category_name varchar(100) primary key,
category_costperday int not null,
category_latehourfee int not null
);

create table cars(
car_id varchar(100) primary key,
car_make varchar(100) not null,
car_model varchar(100) not null,
car_year int not null,
category_name varchar(100),
location_id varchar(100),
car_milage int not null,
foreign key(category_name) references category(category_name),
foreign key(location_id) references location(location_id)
);

create table booking(
booking_id int primary key auto_increment,
booking_fromdate date not null,
booking_todate date not null,
location_pickupid varchar(100),
location_dropid varchar(100),
customer_id varchar(100),
car_id varchar(100),
booking_status varchar(100) not null,
foreign key(location_pickupid) references location(location_id),
foreign key(location_dropid) references location(location_id),
foreign key(customer_id) references customers(customer_id),
foreign key(car_id) references cars(car_id)
);

create table billing(
bill_id varchar(100) not null,
bill_date date not null,
bill_amount varchar(100) not null,
booking_id int not null,
bill_paymentmethod varchar(100) not null,
foreign key(booking_id) references booking(booking_id)
);