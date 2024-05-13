-- Shokhrukh Abdusaidov B - Variant

-- Exercise 1

CREATE DATABASE new_db;

-- Exercise 2
CREATE SEQUENCE student_id_sequence
start 1
minvalue 1
increment 2
maxvalue 2000
cycle;


-- exercise 3

CREATE TABLE Student(
    ID int primary key not null,
    first_name varchar(50),
    last_name varchar(50),
    age int not null ,
    email varchar(30) unique,
    created_at timestamptz not null default current_timestamp,
    is_liked boolean


);

-- Exercise 4

ALTER TABLE Student
Add column phone_number varchar(20);

insert into Student(id, first_name, last_name, age, email, created_at, phone_number)
values
        (nextval('student_id_sequence'), 'John', 'Carter', 42, 'johnc@gmail.com', '2024-01-01', '+998991234567'),
        (nextval('student_id_sequence'), 'Abduvali', 'Shamsiyev', 32, 'vali@gmail.com', '2024-07-01', '+998985153434554'),
        (nextval('student_id_sequence'), 'Cristiano', 'Ronaldo', 39, 'ronaldo@gmail.com', '2024-08-09', '+9989176543210'),
        (nextval('student_id_sequence'), 'Lionel', 'Messi', 42, 'messi@gmail.com', '2024-05-01', '+998957894666'),
        (nextval('student_id_sequence'), 'Micah', 'Christenson', 45, 'micah@gmail.com', '2023-08-01', '+998995453435'),
        (nextval('student_id_sequence'), 'Yuji', 'Nishida', 39, 'yuji@gmail.com', '2024-05-05', '+998993548484'),
        (nextval('student_id_sequence'), 'Yuki', 'Ishikawa', 42, 'yuki@gmail.com', '2024-09-15', '+998983131121'),
        (nextval('student_id_sequence'), 'Pavel', 'Durov', 22, 'durov@gmail.com', '2022-01-01', '+998991111111'),
        (nextval('student_id_sequence'), 'Alex', 'Ferguson', 69, 'alex@gmail.com', '2023-11-01', '+998997777777'),
        (nextval('student_id_sequence'), 'Selena', 'Gomez', 31, 'selena@gmail.com', '2024-08-08', '+998990012233'),
        (nextval('student_id_sequence'), 'Munisa', 'Rizayeva', 34, 'munisa@gmail.com', '2024-05-06', '+998994567891'),
        (nextval('student_id_sequence'), 'Irina', 'Sheikh', 45, 'Irina@gmail.com', '2024-05-08', '+9989900112288');

insert into Student(id, first_name, last_name, age, email, created_at, phone_number)
values
        (nextval('student_id_sequence'), 'Shokhrukh', 'Abdusaidov', 17, 'Shox@gmail.com', '2024-07-07', '+998977777777');

-- Exercise 5


select *
from student
where length(first_name) > 5 and age < 18;

-- Exercise 6

CREATE TABLE Customers(
    customer_id serial primary key,
    customer_name varchar(30) not null ,
    customer_email varchar(20)
);

CREATE TABLE Products(
    product_id serial primary key,
    product_name varchar(50) not null unique ,
    price float not null
);

CREATE TABLE Orders(
    order_id serial primary key,
    order_date date,
    quantity int not null,
    customer_id int references Customers(customer_id),
    product_id int references Products(product_id)

);

INSERT INTO Customers(customer_name, customer_email)
values ('Ilhom Turgunov', 'ilhom@gmail.com'),
       ('Umar Shamsiyev', 'umar@gmail.com'),
       ('Javohir Berdiyev', 'Javohir@gmail.com'),
       ('Xalil Rustamov', 'xalil@gmail.com'),
       ('Soibjon Pardayev', 'soibjon@gmail.com');

INSERT INTO Products(product_name, price) VALUES
                                              ('Galaxy S22', 10.000),
                                              ('LG TV', 2.000),
                                              ('KIA K5', 15.000),
                                              ('HP Envy', 5.000),
                                              ('Coca-Cola', 0.25);

INSERT INTO Orders(order_date, quantity, customer_id, product_id) VALUES ('2020-01-05', 50, 3, 4),
                                                                         ('2024-05-06', 67, 2, 1),
                                                                         ('2023-04-12', 970, 5, 5),
                                                                         ('2023-10-17', 89, 4, 3),
                                                                         ('2020-02-20', 45, 1, 2 );

-- Exercise 7

select c.customer_name, p.product_name, p.price, o.order_date , o.quantity
from Orders o
inner join Customers c on o.customer_id = C.customer_id
inner join products p on o.product_id = p.product_id
order by c.customer_name;




-- Exercise 8

select *
from Customers
where customer_name like '%ev'
order by customer_email;









