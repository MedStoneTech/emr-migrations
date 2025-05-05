DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'products'
    ) THEN
        CREATE TABLE products (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            price DECIMAL(10,2) NOT NULL,
            -- Error de sintaxis deliberado - falta la coma
            description TEXT
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
        );
        
        -- Índice
        CREATE INDEX idx_products_name ON products(name);
        
        -- Comentario
        COMMENT ON TABLE products IS 'Tabla que almacena productos disponibles';
    END IF;
END $$;