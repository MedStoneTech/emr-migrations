CREATE TABLE IF NOT EXISTS ordr (
    ordr_id SERIAL PRIMARY KEY,
    reference_number VARCHAR(50) NOT NULL UNIQUE,
    ordr_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending',
    total_amount DECIMAL(10,2) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_ordr_reference ON ordr(reference_number);
CREATE INDEX IF NOT EXISTS idx_ordr_status ON ordr(status);