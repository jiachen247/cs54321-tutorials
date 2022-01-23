-- CS5421 Tutorial 1 (1a)
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS cards CASCADE;
DROP TABLE IF EXISTS merchants CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TYPE IF EXISTS card_type;

CREATE TABLE customers (
    id TEXT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE cards (
    id TEXT PRIMARY KEY,
    card_type TEXT NOT NULL,
    customer_id TEXT,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
            REFERENCES customers(id)
);

CREATE TABLE merchants (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    card_id TEXT,
    merchant_id TEXT,
    date TIMESTAMP NOT NULL,
    amount INT NOT NULL,
    CONSTRAINT fk_cards
        FOREIGN KEY (card_id)
            REFERENCES cards(id),
    CONSTRAINT fk_merchant
        FOREIGN KEY (merchant_id)
            REFERENCES merchants(id)
);