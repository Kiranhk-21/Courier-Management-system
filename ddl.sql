create database courier_management;

use courier_management
--customer table

create table Customer (cust_id varchar(15) not null,
fname varchar(10) not null,lname varchar(10) not null,email_id varchar(50)
,contact_no bigint not null,door_no int not null,street varchar(20) not null,locality varchar(20)not null
,city varchar(20) not null ,state_name varchar(20) not null,country varchar(10) not null,pincode int not null,
primary key(cust_id));

--package table

create table package(package_id varchar(10) not null,package_weight float
,package_info varchar(100),primary key(package_id));

--services table

create table services(service_id int not null,service_name_ varchar(15),service_type varchar(30),price int,
primary key(service_id));

--delivery agent table

create table delivery_agent(da_id varchar(10) not null,da_name varchar(20),contact_no bigint,vehicle_no varchar(20),
primary key(da_id));

--track table

create table track(cust_id varchar(15),package_id varchar(10),service_id int,da_id varchar(10),
delivery_date datetime,curr_loc varchar(100),
primary key(cust_id,package_id,service_id,da_id),
foreign key(cust_id) references customer(cust_id) on delete cascade,
foreign key(package_id) references package(package_id) on delete cascade,
foreign key(service_id) references services(service_id) on delete cascade,
foreign key(da_id) references delivery_agent(da_id) on delete cascade);
