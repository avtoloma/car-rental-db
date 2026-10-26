-- ============================================
-- База данных для проката автомобилей
-- ============================================

DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Category;

CREATE TABLE Category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price_per_day DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    passport_num VARCHAR(20) NOT NULL
);

CREATE TABLE Car (
    id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES Category(id),
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    license_plate VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Rental (
    id SERIAL PRIMARY KEY,
    car_id INTEGER NOT NULL REFERENCES Car(id),
    client_id INTEGER NOT NULL REFERENCES Client(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost DECIMAL(10, 2),
    status VARCHAR(20) NOT NULL DEFAULT 'OPEN'
);

-- Тестовые данные
INSERT INTO Category (name, price_per_day) VALUES
('Эконом', 1500.00),
('Бизнес', 3500.00),
('Внедорожник', 5000.00);

INSERT INTO Client (first_name, last_name, phone, passport_num) VALUES
('Иван', 'Иванов', '+79001112233', '4500 123456'),
('Анна', 'Петрова', '+79004445566', '4500 654321');

INSERT INTO Car (category_id, brand, model, license_plate) VALUES
(1, 'Hyundai', 'Solaris', 'А111АА777'),
(2, 'BMW', 'X5', 'В222ВВ777'),
(3, 'Toyota', 'Land Cruiser', 'Е333ЕЕ777');

INSERT INTO Rental (car_id, client_id, start_date, end_date, total_cost, status) VALUES
(1, 1, '2026-10-26', '2026-10-30', 6000.00, 'OPEN'),
(2, 2, '2026-10-26', '2026-11-02', 24500.00, 'OPEN');