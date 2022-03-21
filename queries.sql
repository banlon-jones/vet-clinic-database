/*Queries that provide answers to the questions from all projects.*/

select * from animals where name LIKE '%mon%';
select name from animals where date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
select name from animals where neutered=TRUE AND escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = TRUE;
select * from animals where NOT name='Gabumon';
select * from animals where weight_kg BETWEEN 10.4 AND 17.3;
