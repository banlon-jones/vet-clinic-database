/*Queries that provide answers to the questions from all projects.*/

select * from animals where name LIKE '%mon%';
select name from animals where date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
select name from animals where neutered=TRUE AND escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = TRUE;
select * from animals where NOT name='Gabumon';
select * from animals where weight_kg BETWEEN 10.4 AND 17.3;
begin;
update animals set species='unspecified';
rollback;

begin;
update animals set species='digimon' where name LIKE '%mon%';
commit;

begin;
update animals set species='pokemon' where NOT name LIKE '%mon%';
commit;

begin;
delete from animals;
rollback;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint Ditto;
update animals set weight_kg=weight_kg*-1;
rollback to savepoint Ditto;
update animals set weight_kg=weight_kg*-1 where weight_kg < 0;
commit;

select count(name) from animals;
select count(name) from animals where escape_attempts=0;
select avg(weight_kg) from animals;
select neutered, max(escape_attempts) from animals group by neutered;
select species, max(weight_kg), min(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' group by species;

SELECT animals.name FROM animals INNER JOIN owners ON owner_id = owners.id where owners.full_name = 'Melody Pond';

SELECT animals.*, species.name FROM animals JOIN species ON species_id = species.id where species.name = 'Pokemon';

SELECT animals.name, owners.fulL_name from owners LEFT JOIN animals on owners.id = animals.owners_id;

SELECT species.name, COUNT(*) from animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name, owners.full_name, species.name from animals JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owners_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT * from animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) as num_animals from owners LEFT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY num_animals DESC;
