CREATE TABLE wallets (
    id SERIAL PRIMARY KEY,
    address TEXT NOT NULL,
    balance NUMERIC DEFAULT 0,
    chain TEXT NOT NULL
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    wallet_id INTEGER REFERENCES wallets(id),
    amount NUMERIC NOT NULL,
    timestamp TIMESTAMP DEFAULT NOW()
);
