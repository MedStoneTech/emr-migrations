CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    reference_number VARCHAR(50) NOT NULL UNIQUE,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending',
    total_amount DECIMAL(10,2) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_orders_reference ON orders(reference_number);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders(status);