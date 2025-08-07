------------ Customers --------------

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO customers (first_name, last_name, email, phone_number) 
VALUES 
('Sophia', 'Reynolds', 'sophia.reynolds@email.com', '5551234567'), 
('Liam', 'Henderson', 'liam.henderson@email.com', '5559876543'),
('Ava', 'Martinez', 'ava.martinez@email.com', '5552468135'),
('Noah', 'Kim', 'noah.kim@email.com', '5551357924'),
('Isabella', 'Thompson', 'isabella.thompson@email.com', '5558642097'),
('Ethan', 'Patel', 'ethan.patel@email.com', '5551029384'),
('Zoe', 'Parker', 'zoe.parker@email.com', '5556879204'),
('Luna', 'Ward', 'luna.ward@email.com', '5558091426'),
('Avery', 'Long', 'avery.long@email.com', '5550213648');


----------- Employees -------------

CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    position VARCHAR(200) NOT NULL
);

INSERT INTO employees (first_name, last_name, email, phone_number, dob, position) 
VALUES 
('Olivia', 'Miller', 'olivia.miller@email.com', '5551324769', '1988-04-12', 'salesperson'), 
('James', 'Anderson', 'james.anderson@email.com', '5552435860', '1992-09-05', 'mechanic'),
('Emma', 'Wilson', 'emma.wilson@email.com', '5553546971', '1987-12-19', 'salesperson'),
('Benjamin', 'Brown', 'benjamin.brown@email.com', '5554657082', '1993-07-08', 'mechanic'),
('Sophia', 'Davis', 'sophia.davis@email.com', '5555768193', '1989-01-27', 'salesperson'),
('Lucas', 'Garcia', 'lucas.garcia@email.com', '5556879204', '1995-05-11', 'mechanic');

------------ Cars -------------

CREATE TABLE cars (
    id INTEGER PRIMARY KEY,
    make VARCHAR(200) NOT NULL,
    model VARCHAR(200) NOT NULL,
    year INTEGER NOT NULL,
    color VARCHAR(200) NOT NULL,
    car_type VARCHAR(200) NOT NULL,
    serial_number INTEGER NOT NULL UNIQUE
);

INSERT INTO cars (make, model, year, color, car_type, serial_number)
VALUES
('Toyota', 'Camry', 2021, 'silver', 'sedan', 100001),
('Honda', 'Civic', 2020, 'blue', 'sedan', 100002),
('Audi', 'Q5', 2020, 'white', 'suv', 100003),
('Mercedes-Benz', 'C-Class', 2022, 'blue', 'sedan', 100004),
('BMW', 'X5', 2021, 'gray', 'suv', 100005),
('Tesla', 'Model 3', 2023, 'gray', 'electric', 100006),
('Subaru', 'Outback', 2019, 'silver', 'wagon', 100007),
('Jeep', 'Wrangler', 2021, 'green', 'suv', 100008),
('Chevrolet', 'Tahoe', 2019, 'black', 'suv', 100009);


-------------- Invoice -------------

CREATE TABLE invoices (
    id INTEGER PRIMARY KEY,
    sold_by_id INTEGER NOT NULL,
    sold_to_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    sale_total INTEGER NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (sold_by_id) REFERENCES employees(id),
    FOREIGN KEY (sold_to_id) REFERENCES customers(id),
    FOREIGN KEY (car_id) REFERENCES cars(id)
);

INSERT INTO invoices (sold_by_id, sold_to_id, car_id, sale_total, sale_date) 
VALUES
(1, 1, 1, 25000, '2023-06-15'),
(3, 2, 2, 22000, '2023-07-22'),
(5, 3, 3, 38000, '2023-08-10'),
(1, 4, 4, 41000, '2023-08-30'),
(3, 5, 5, 47000, '2023-09-12'),
(5, 6, 6, 53000, '2023-10-01'),
(1, 7, 7, 27000, '2023-11-19'),
(3, 8, 8, 32000, '2023-12-05'),
(5, 9, 9, 45000, '2024-01-17');



---------------- Services ----------------

CREATE TABLE services (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    service_type VARCHAR(1000) NOT NULL,
    cost INTEGER NOT NULL,
    customer_comments VARCHAR(1000),
    employee_comments VARCHAR(1000),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (car_id) REFERENCES cars(id)
);

INSERT INTO services (customer_id, car_id, service_type, cost, customer_comments, employee_comments)
VALUES
(1, 1, 'oil change', 80, 'routine maintenance', 'oil and filter replaced'),
(2, 2, 'brake replacement', 350, 'squeaky brakes', 'pads and rotors replaced'),
(3, 3, 'tire rotation and alignment', 120, 'steering felt off', 'alignment adjusted'),
(4, 4, 'battery replacement', 200, 'car won''t start', 'new battery installed'),
(5, 5, 'engine diagnostics', 150, 'check engine light', 'misfire detected, recommended tune up'),
(6, 6, 'air conditioning repair', 300, 'not cooling', 'replaced compressor and recharged system'),
(7, 7, 'transmission fluid change', 180, 'rough shift', 'fluid replaced'),
(8, 8, 'headlight replacement', 100, 'one headlight out', 'bulb replaced'),
(9, 9, 'detailing service', 250, 'full interior and exterior clean', 'completed');

CREATE TABLE service_mechanics (
    id INTEGER PRIMARY KEY,
    service_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
    
);

INSERT INTO service_mechanics (service_id, employee_id)
VALUES 
(1, 2),
(2, 4),
(3, 2),
(3, 6),
(4, 6),
(5, 4),
(6, 6),
(6, 4),
(7, 4),
(8, 2),
(9, 6);

