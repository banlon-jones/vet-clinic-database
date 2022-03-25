/* Populate database with sample data. */

insert into animals(id, name, date_of_birth, nuetered, weight_kg) VALUES (1,'Agumon','2020-02-03', 0, TRUE, 10.23);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2,'Gabumon','2018-10-15', 2, TRUE, 8);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3,'Pikachu','2021-01-07', 1, FALSE, 15.04);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4,'Devimon','2017-05-12', 5, TRUE, 11);
insert into animals(id, name, date_of_birth, escape_attempts, nuetered, weight_kg) 
    VALUES (5,'Charmander','2020-02-08', 0, false, -11),
        (6,'Plantmon','2021-11-15', 2, true, -5.7), 
        (7, 'Squirtle', '1993-04-02', 3, false, -12.13),
        (8, 'Angemon', '2005-05-12', 1, true, -45),
        (9, 'Boarmon', '2005-05-07', 7, true, 20.4),
        (10, 'Blossom', '1998-10-13', 3, true, 17),
        (11, 'Ditto', '2022-05-14', 4, true, 22);
insert into owners(full_name, age) 
    VALUES ('Sam Smith', 34),
        ('Jennifer Orwell', 19),
        ('Bob', 45),
        ('Melody Pond', 77),
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38);

insert into species(name) 
    VALUES ('Pokemon'),
        ('Digimon');

update animals set species_id=2 where name LIKE '%mon%';

update animals set species_id=1 where not name LIKE '%mon%';

update animals set owner_id=1 where name = 'Agumon';

update animals set owner_id=2 where id = 2 or id = 7;

update animals set owner_id=3 where id= 3 or id = 4;

update animals set owner_id=4 where id = 8 or id = 9 or id = 10;

update animals set owner_id=5 where id = 5 or id = 6;

-- inserting data in to the vet table

insert into vets(name, age, date_of_graduction) 
    VALUES ('William Tatcher', 45, '2000-04-23'),
        (' Maisy Smith', 26, '2019-01-17'),
        ('Stephanie Mendez', 64, '1981-05-04'),
        ('Jack Harkness', 38, '2008-06-08');

-- inserting data in to specializtions table

insert into specializations(vets_id, species_id) 
    VALUES (1,1),
        (3,1),
        (3,2),
        (4,2);

INSERT INTO visits (animals_id, vets_id, date_of_visit) 
    VALUES
    (
        (SELECT id FROM animals WHERE name = 'Gabumon'), 
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), 
        '2021-2-2'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Pikachu'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2020-1-5'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Pikachu'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2020-3-8'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Pikachu'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2020-5-14'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Devimon'), 
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), 
        '2021-5-4'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Charmander'), 
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), 
        '2021-2-24'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Plantmon'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2019-12-21'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Plantmon'), 
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), 
        '2020-8-10'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Plantmon'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2021-4-7'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Squirtle'), 
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), 
        '2019-9-29'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Angemon'), 
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), 
        '2020-10-3'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Angemon'), 
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), 
        '2020-11-4'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Boarmon'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2019-1-24'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Boarmon'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2019-5-15'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Boarmon'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2020-2-27'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Boarmon'), 
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
        '2020-8-3'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Blossom'), 
        (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
        '2020-5-24'
    ),
    (
        (SELECT id FROM animals WHERE name = 'Blossom'), 
        (SELECT id FROM vets WHERE name = 'William Tatcher'), 
        '2021-1-11'
    ); 

