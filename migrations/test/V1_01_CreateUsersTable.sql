-- Migration: V1_01_CreateUsersTable
-- Author: TestUser
-- Date: 2025-05-05
-- Description: Crea la tabla inicial de usuarios

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'users'
    ) THEN
        CREATE TABLE users (
            id SERIAL PRIMARY KEY,
            username VARCHAR(50) NOT NULL,
            email VARCHAR(100) NOT NULL,
            password_hash VARCHAR(255) NOT NULL,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
        );
        
        -- Crear índices
        CREATE UNIQUE INDEX idx_users_username ON users(username);
        CREATE UNIQUE INDEX idx_users_email ON users(email);
        
        -- Comentario de tabla
        COMMENT ON TABLE users IS 'Tabla que almacena información de usuarios del sistema';
    END IF;
END $$;