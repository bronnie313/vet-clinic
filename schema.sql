 CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2) 
);
ALTER TABLE animals ADD COLUMN species VARCHAR(255);
CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);
CREATE TABLE species (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL
);
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id BIGSERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);
CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE 
);
CREATE TABLE specializations (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
);
CREATE TABLE visits (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    animals_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visit_date DATE
);