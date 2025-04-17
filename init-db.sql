-- log in to the database as the superuser
-- docker exec -it 9b7524f6d7f5 psql -U dw_user -d dw 
-- docker exec -it 2466cf0a5a99 psql -U dw_user -d dw; 
-- command <\l> - list all databases in terminal
-- Create the dw_user
CREATE ROLE dw_user WITH LOGIN PASSWORD 'dw_password';

-- Create the dw database
CREATE DATABASE dw WITH OWNER dw_user;

-- Grant privileges to dw_user on the dw database
GRANT ALL PRIVILEGES ON DATABASE dw TO dw_user;

-- Connect to the dw database and set up schema privileges
\connect dw
GRANT ALL ON SCHEMA public TO dw_user;
