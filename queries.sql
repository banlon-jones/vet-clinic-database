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


SELECT owners.full_name, COUNT(animals.name) from owners 
LEFT JOIN animals ON owners.id = animals.owner_id 
GROUP BY owners.full_name
ORDER BY COUNT(animals.name) DESC;

-- last animal visited by william Tatcher

select animals.name as name, vets.name as vet from vets 
JOIN visits on vets.id = vets_id 
JOIN animals on animals.id = animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT COUNT(*) from vets 
JOIN visits on vets.id = vets_id 
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name, species.name as specialty from vets
LEFT JOIN specializations on vets.id = vets_id
LEFT JOIN species on species.id = species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name as animals, visits.date_of_visit from animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

-- What animal has the most visits to vets?

SELECT animals.name, COUNT(*) from animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name ORDER BY count DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name as vet, visits.date_of_visit as date, animals.name as animal from visits 
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT date_of_visit, animals.date_of_birth, animals.escape_attempts, animals.weight_kg, vets.name, vets.age
from visits
JOIN animals ON animals.id = animals_id
JOIN vets ON vets.id = vets_id
ORDER BY date_of_visit
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(*) as visits FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE NOT animals.species_id = specializations.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name as species, COUNT(*) from visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;
