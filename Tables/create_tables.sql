CREATE TABLE "Customer" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE "Seller" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE "Product" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
	seller_id INTEGER NOT NULL,
	FOREIGN KEY (seller_id) REFERENCES "Seller"(id)
);

CREATE TABLE "Cart" (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES "Customer"(id)
);

CREATE TABLE "CartItem" (
    id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES "Cart"(id),
    FOREIGN KEY (product_id) REFERENCES "Product"(id)
);

CREATE TABLE "Transaction" (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    seller_id INTEGER NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES "Customer"(id),
    FOREIGN KEY (seller_id) REFERENCES "Seller"(id)
);

CREATE TABLE "TransactionItem" (
    id SERIAL PRIMARY KEY,
    transaction_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES "Transaction"(id),
    FOREIGN KEY (product_id) REFERENCES "Product"(id)
);

CREATE TABLE "Courier" (
    id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE "Delivery" (
    id SERIAL PRIMARY KEY,
    transaction_id INTEGER NOT NULL,
    courier_id INTEGER NOT NULL,
    delivery_date TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES "Transaction"(id),
    FOREIGN KEY (courier_id) REFERENCES "Courier"(id)
);


DROP TABLE "Delivery";
DROP TABLE "Courier";
DROP TABLE "TransactionItem";
DROP TABLE "Transaction";
DROP TABLE "CartItem";
DROP TABLE "Cart";
DROP TABLE "Product";
DROP TABLE "Seller";
DROP TABLE "Customer";