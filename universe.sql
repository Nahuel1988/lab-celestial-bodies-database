--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    composition text NOT NULL,
    tail_length_km integer,
    is_periodic boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars integer,
    is_spherical boolean,
    has_life boolean,
    diameter_in_light_years numeric(10,2),
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_days integer,
    crater_count integer,
    is_tidally_locked boolean,
    has_atmosphere boolean,
    radius_km numeric(10,2),
    composition text NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    orbital_period_days integer,
    has_life boolean,
    is_spherical boolean,
    radius_km numeric(10,2),
    planet_type text NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    temperature_in_kelvin integer,
    mass_in_solar_masses integer,
    is_visible boolean,
    is_stable boolean,
    luminosity numeric(10,4),
    classification text NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'ice-dust', 24, true);
INSERT INTO public.comet VALUES (2, 'Encke', 'ice-rock', 15, true);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 'ice-dust', 50, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, true, false, 105000.50, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, true, false, 120000.00, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, NULL, true, false, 60000.25, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', NULL, NULL, true, false, 50000.10, 'Galaxy with bright nucleus');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', NULL, NULL, true, false, 76000.80, 'Famous spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', NULL, NULL, true, false, 170000.00, 'Large face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 5000, true, false, 1737.40, 'rock', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 1000, true, false, 11.00, 'rock', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 500, true, false, 6.20, 'rock', 2);
INSERT INTO public.moon VALUES (4, 'Europa', 85, 200, true, true, 1560.80, 'ice', 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 172, 300, true, true, 2634.10, 'ice-rock', 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 400, 500, true, false, 2410.30, 'ice-rock', 3);
INSERT INTO public.moon VALUES (7, 'Io', 42, 100, true, false, 1821.60, 'sulfur', 3);
INSERT INTO public.moon VALUES (8, 'Sirius Moon 1', 50, 200, true, false, 1500.00, 'rock', 4);
INSERT INTO public.moon VALUES (9, 'Sirius Moon 2', 60, 300, true, false, 1600.00, 'rock', 5);
INSERT INTO public.moon VALUES (10, 'AlphaC Moon 1', 40, 150, true, false, 1400.00, 'rock', 6);
INSERT INTO public.moon VALUES (11, 'AlphaC Moon 2', 45, 180, true, false, 1450.00, 'rock', 7);
INSERT INTO public.moon VALUES (12, 'Andromeda Moon 1', 100, 400, true, false, 1700.00, 'rock', 8);
INSERT INTO public.moon VALUES (13, 'Andromeda Moon 2', 120, 450, true, false, 1750.00, 'rock', 9);
INSERT INTO public.moon VALUES (14, 'Triangulum Moon 1', 130, 500, true, false, 1800.00, 'rock', 10);
INSERT INTO public.moon VALUES (15, 'Whirlpool Moon 1', 200, 600, true, false, 1900.00, 'rock', 11);
INSERT INTO public.moon VALUES (16, 'Whirlpool Moon 2', 210, 650, true, false, 1950.00, 'rock', 11);
INSERT INTO public.moon VALUES (17, 'Whirlpool Moon 3', 220, 700, true, false, 2000.00, 'rock', 12);
INSERT INTO public.moon VALUES (18, 'Whirlpool Moon 4', 230, 750, true, false, 2050.00, 'rock', 12);
INSERT INTO public.moon VALUES (19, 'Whirlpool Moon 5', 240, 800, true, false, 2100.00, 'rock', 12);
INSERT INTO public.moon VALUES (20, 'Whirlpool Moon 6', 250, 850, true, false, 2150.00, 'rock', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0, 365, true, true, 6371.00, 'terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 78, 687, false, true, 3389.50, 'terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 628, 4333, false, true, 69911.00, 'gas giant', 1);
INSERT INTO public.planet VALUES (4, 'Sirius Planet 1', 9000, 500, false, true, 5000.00, 'terrestrial', 2);
INSERT INTO public.planet VALUES (5, 'Sirius Planet 2', 12000, 800, false, true, 7000.00, 'gas giant', 2);
INSERT INTO public.planet VALUES (6, 'AlphaC Planet 1', 4, 300, false, true, 6500.00, 'terrestrial', 3);
INSERT INTO public.planet VALUES (7, 'AlphaC Planet 2', 5, 450, false, true, 7000.00, 'gas giant', 3);
INSERT INTO public.planet VALUES (8, 'Andromeda Planet 1', 2500000, 600, false, true, 8000.00, 'terrestrial', 4);
INSERT INTO public.planet VALUES (9, 'Andromeda Planet 2', 2500000, 900, false, true, 9000.00, 'gas giant', 4);
INSERT INTO public.planet VALUES (10, 'Triangulum Planet 1', 3000000, 700, false, true, 6000.00, 'terrestrial', 5);
INSERT INTO public.planet VALUES (11, 'Whirlpool Planet 1', 23000000, 1000, false, true, 10000.00, 'gas giant', 6);
INSERT INTO public.planet VALUES (12, 'Whirlpool Planet 2', 23000000, 1200, false, true, 12000.00, 'gas giant', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, true, true, 1.0000, 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, NULL, true, true, 25.4000, 'A-type', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', NULL, NULL, true, true, 1.5190, 'G-type', 1);
INSERT INTO public.star VALUES (4, 'Andromeda Star 1', NULL, NULL, true, true, 3.2000, 'F-type', 2);
INSERT INTO public.star VALUES (5, 'Triangulum Star 1', NULL, NULL, true, true, 2.1000, 'K-type', 3);
INSERT INTO public.star VALUES (6, 'Whirlpool Star 1', NULL, NULL, true, true, 4.5000, 'B-type', 5);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

