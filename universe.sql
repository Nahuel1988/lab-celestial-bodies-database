DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\connect universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  galaxy_type VARCHAR(100),
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC(12,2)
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC(12,2),
  star_id INT NOT NULL REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  planet_id INT NOT NULL REFERENCES planet(planet_id)
);

CREATE TABLE comet (
  comet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  period_in_years NUMERIC(8,2),
  is_periodic BOOLEAN
);

INSERT INTO galaxy (name, description, galaxy_type, age_in_millions_of_years, distance_from_earth) VALUES
('Milky Way', 'Nuestra galaxia hogar', 'Spiral', 13600, 0.00),
('Andromeda', 'Galaxia espiral mas cercana grande', 'Spiral', 10000, 2537000.00),
('Triangulum', 'Galaxia del grupo local', 'Spiral', 12000, 3000000.00),
('Whirlpool', 'Galaxia con estructura espiral definida', 'Spiral', 400, 23000000.00),
('Sombrero', 'Galaxia con bulbo brillante', 'Elliptical', 13000, 31100000.00),
('Messier 87', 'Galaxia eliptica gigante', 'Elliptical', 13000, 53000000.00);

INSERT INTO star (name, description, is_spherical, age_in_millions_of_years, galaxy_id) VALUES
('Sun', 'Estrella del sistema solar', TRUE, 4600, 1),
('Proxima Centauri', 'Enana roja cercana', TRUE, 4850, 1),
('Sirius', 'Estrella brillante del cielo nocturno', TRUE, 242, 1),
('Alpheratz', 'Estrella de Andromeda', TRUE, 60, 2),
('M33-V19', 'Cefeida en Triangulum', TRUE, 10, 3),
('M87-Star-1', 'Estrella de referencia en M87', TRUE, 1000, 6);

INSERT INTO planet (name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, star_id) VALUES
('Mercury', 'Planeta rocoso interior', FALSE, TRUE, 4500, 77.30, 1),
('Venus', 'Planeta con atmosfera densa', FALSE, TRUE, 4500, 41.40, 1),
('Earth', 'Planeta azul con vida conocida', TRUE, TRUE, 4540, 0.00, 1),
('Mars', 'Planeta rojo', FALSE, TRUE, 4500, 78.30, 1),
('Jupiter', 'Gigante gaseoso', FALSE, TRUE, 4500, 628.70, 1),
('Saturn', 'Gigante gaseoso con anillos', FALSE, TRUE, 4500, 1275.00, 1),
('Uranus', 'Gigante helado', FALSE, TRUE, 4500, 2724.00, 1),
('Neptune', 'Gigante helado lejano', FALSE, TRUE, 4500, 4351.00, 1),
('Proxima b', 'Exoplaneta rocoso', FALSE, TRUE, 4850, 4.24, 2),
('Sirius b-1', 'Planeta hipotetico', FALSE, TRUE, 242, 8.60, 3),
('Andromeda I', 'Planeta de ejemplo en Andromeda', FALSE, TRUE, 1000, 2537000.00, 4),
('Triangulum Prime', 'Planeta de ejemplo en Triangulum', FALSE, TRUE, 500, 3000000.00, 5);

INSERT INTO moon (name, description, is_spherical, age_in_millions_of_years, planet_id) VALUES
('Moon', 'Satelite natural de la Tierra', TRUE, 4500, 3),
('Phobos', 'Luna de Marte', FALSE, 4500, 4),
('Deimos', 'Luna de Marte', FALSE, 4500, 4),
('Io', 'Luna volcanica de Jupiter', TRUE, 4500, 5),
('Europa', 'Luna helada de Jupiter', TRUE, 4500, 5),
('Ganymede', 'La luna mas grande del sistema solar', TRUE, 4500, 5),
('Callisto', 'Luna exterior de Jupiter', TRUE, 4500, 5),
('Titan', 'Luna grande de Saturno', TRUE, 4500, 6),
('Enceladus', 'Luna helada de Saturno', TRUE, 4500, 6),
('Mimas', 'Luna pequena de Saturno', TRUE, 4500, 6),
('Rhea', 'Luna de Saturno', TRUE, 4500, 6),
('Iapetus', 'Luna bicolor de Saturno', TRUE, 4500, 6),
('Titania', 'Luna de Urano', TRUE, 4500, 7),
('Oberon', 'Luna de Urano', TRUE, 4500, 7),
('Miranda', 'Luna de Urano', TRUE, 4500, 7),
('Triton', 'Luna principal de Neptuno', TRUE, 4500, 8),
('Nereid', 'Luna externa de Neptuno', FALSE, 4500, 8),
('Proteus', 'Luna irregular de Neptuno', FALSE, 4500, 8),
('Proxima b-I', 'Luna hipotetica de Proxima b', TRUE, 100, 9),
('Andromeda I-a', 'Luna de ejemplo', TRUE, 900, 11);

INSERT INTO comet (name, period_in_years, is_periodic) VALUES
('Halley', 75.32, TRUE),
('Hale-Bopp', 2533.00, TRUE),
('NEOWISE', 6766.00, TRUE);
