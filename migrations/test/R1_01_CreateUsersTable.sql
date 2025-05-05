-- Migration: R1_01_CreateUsersTable
-- Author: TestUser
-- Date: 2025-05-05
-- Description: Rollback para la creación de la tabla de usuarios

-- Garantiza idempotencia al eliminar la tabla de usuarios
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'users'
    ) THEN
        -- Eliminar índices primero (aunque DROP TABLE CASCADE los eliminaría)
        DROP INDEX IF EXISTS idx_users_username;
        DROP INDEX IF EXISTS idx_users_email;
        
        -- Eliminar la tabla
        DROP TABLE users CASCADE;
    END IF;
END $$;