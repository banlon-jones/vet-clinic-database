/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name CHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
);

ALTER TABLE animals ADD COLUMN species char(50);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name CHAR(50) NOT NULL,
    age INT NOT NULL,
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name CHAR(50) 
)

ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals DROP COLUMN species;

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name CHAR(50),
	age INT,
	date_of_graduction DATE
);

CREATE TABLE specializations (
	species_id INT NOT NULL,
	vets_id INT NOT NULL,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
	PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits (
	animals_id INT NOT NULL,
	vets_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT fk_animal FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
	PRIMARY KEY (animals_id, vets_id)
);
