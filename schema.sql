 CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2) 
);
ALTER TABLE animals ADD COLUMN species VARCHAR(255);