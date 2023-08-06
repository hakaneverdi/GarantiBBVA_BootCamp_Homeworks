-- 1. 


-- Country table
CREATE TABLE Country(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- League table
CREATE TABLE League(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    id_country INT REFERENCES Country(id)
);

-- Team table
CREATE TABLE Team(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    id_league INT REFERENCES League(id),
    foundation_year INT NOT NULL,
    goals_scored INT NOT NULL,
    goals_conceded INT NOT NULL,
    points INT NOT NULL,
    level INT NOT NULL
);

-- Player table
CREATE TABLE Player(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    id_team INT REFERENCES Team(id),
    id_country INT REFERENCES Country(id),
    goals_scored INT NOT NULL
);

-- 2. 

-- Insert into Country table
INSERT INTO Country(name) VALUES('Turkey');
INSERT INTO Country(name) VALUES('Spain');
INSERT INTO Country(name) VALUES('England');
INSERT INTO Country(name) VALUES('Germany');

-- Insert into League table
INSERT INTO League(name, id_country) VALUES('Super Lig', 1);
INSERT INTO League(name, id_country) VALUES('La Liga', 2);
INSERT INTO League(name, id_country) VALUES('Premier League', 3);
INSERT INTO League(name, id_country) VALUES('Bundesliga', 4);

-- Insert into Team table without league
INSERT INTO Team(name, id_league, foundation_year, goals_scored, goals_conceded, points, level)
VALUES('Lig Dışı Takım', NULL, 1950, 0, 0, 0, 1);
INSERT INTO Team(name, id_league, foundation_year, goals_scored, goals_conceded, points, level)
VALUES('Free Team', NULL, 2000, 10, 15, 5, 2);

-- Insert into Team table with league
INSERT INTO Team(name, id_league, foundation_year, goals_scored, goals_conceded, points, level)
VALUES('Galatasaray', 1, 1905, 80, 30, 70, 1);
INSERT INTO Team(name, id_league, foundation_year, goals_scored, goals_conceded, points, level)
VALUES('Real Madrid', 2, 1902, 85, 35, 75, 1);
INSERT INTO Team(name, id_league, foundation_year, goals_scored, goals_conceded, points, level)
VALUES('Liverpool', 3, 1892, 80, 30, 70, 1);
INSERT INTO Team(name, id_league, foundation_year, goals_scored, goals_conceded, points, level)
VALUES('Bayern Munich', 4, 1900, 90, 25, 80, 1);

-- Insert into Player table
INSERT INTO Player(first_name, last_name, id_team, id_country, goals_scored)
VALUES('Metin', 'Tekin', 2, 1, 15);
INSERT INTO Player(first_name, last_name, id_team, id_country, goals_scored)
VALUES('Cristiano', 'Ronaldo', 4, 2, 30);
INSERT INTO Player(first_name, last_name, id_team, id_country, goals_scored)
VALUES('Mohamed', 'Salah', 5, 3, 25);
INSERT INTO Player(first_name, last_name, id_team, id_country, goals_scored)
VALUES('Robert', 'Lewandowski', 6, 4, 35);


-- 3. 

SELECT name FROM Leauge
INNER JOIN Country ON Leauge.id = Country.id
WHERE name_country = ‘Turkey';


-- 4. 

SELECT name FROM Team
INNER JOIN Country ON League.id_country = Country.id
WHERE Country.name = 'Turkey';

--- 5. 

SELECT name FROM Leauge
INNER JOIN Country ON Leauge.id_country = Country.id
WHERE name_country = 'Turkey'
ORDER BY Team.points DESC;

-- 6. 

SELECT AVG(point) FROM Team
WHERE id = 1;

-- 7. 

SELECT first_name, last_name, MAX(goals_scored) FROM Player 
GROUP BY first_name, last_name;

-- 8.

SELECT * FROM Team
WHERE goals_scored < goals_conceded;

-- 9. 

SELECT Team.name, Team.goals_scored, SUM(Player.goals_scored)
FROM Team
JOIN Player ON Team.id = Player.id_team
GROUP BY Team.name, Team.goals_scored;
















