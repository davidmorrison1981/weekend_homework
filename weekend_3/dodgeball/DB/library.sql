DROP TABLE Matches;
DROP TABLE Teams;

CREATE TABLE Matches (
  id serial8 primary key,
  hometeam_id serial8,
  awayteam_id serial8,
  hometeam_score serial8,
  awayteam_score serial8
);

CREATE TABLE Teams (
  id serial8 primary key,
  name VARCHAR(255)
);