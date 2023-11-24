--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_m numeric,
    is_near_earth boolean,
    is_metallic boolean,
    rotation_period_in_hr integer,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    has_planetry_system boolean,
    contain_blackhole boolean,
    description text,
    galactic_age_in_million_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric,
    is_geologically_active boolean,
    has_gravity boolean,
    orbital_period integer,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km numeric,
    has_moon boolean,
    is_habitable boolean,
    orbital_period integer,
    description text,
    surface_temp_in_kelvin integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_solar_masses numeric,
    is_binary_star boolean,
    is_supernova_candidate boolean,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Andromeda', 390, false, true, 10, 'ASTEROID');
INSERT INTO public.asteroid VALUES (2, 'LANDA', 209, false, true, 21, 'ASTEROID');
INSERT INTO public.asteroid VALUES (3, 'LAVENDER', 230, false, true, 24, 'ASTERIOD');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milki Way', 100000, true, false, 'This is a beautiful galaxy', 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromed', 200000, true, true, 'Beautiful galaxy', 140000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 300000, true, false, 'Beautiful galaxy', 11000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 5500000, true, true, 'Beautifull galaxy', 13000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 200000, true, false, 'Beautiful Galaxy', 12000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 150000, false, true, 'Beautiful Galaxy);
', 12000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 3476, true, false, 27, 'MOON', 41);
INSERT INTO public.moon VALUES (22, 'Phobos', 33.4, false, false, 0, 'MOON', 42);
INSERT INTO public.moon VALUES (23, 'Io', 3643, true, false, 2, 'MOON', 43);
INSERT INTO public.moon VALUES (24, 'Titan', 5150, true, false, 16, 'MOON', 34);
INSERT INTO public.moon VALUES (25, 'Deimos', 12.5, false, false, 1, 'MOON', 40);
INSERT INTO public.moon VALUES (26, 'Ariel', 1157, true, false, 3, 'MOON', 36);
INSERT INTO public.moon VALUES (27, 'Callisto', 4800, false, false, 17, 'MOON', 41);
INSERT INTO public.moon VALUES (28, 'Ganymade', 5268, true, false, 7, 'MOON', 36);
INSERT INTO public.moon VALUES (29, 'Europa', 3121, true, false, 4, 'MOOM', 35);
INSERT INTO public.moon VALUES (30, 'Enceladus', 504.2, true, false, 1, 'MOON', 34);
INSERT INTO public.moon VALUES (31, 'Oberon', 1522, false, false, 14, 'MOON', 36);
INSERT INTO public.moon VALUES (32, 'Mims', 369, false, false, 1, 'MOON', 40);
INSERT INTO public.moon VALUES (33, 'Miranda', 471.6, true, false, 1, 'MOON', 36);
INSERT INTO public.moon VALUES (34, 'Charon', 1208, false, false, 6, 'MOON', 39);
INSERT INTO public.moon VALUES (35, 'Rhea', 1527, false, false, 5, 'MOON', 34);
INSERT INTO public.moon VALUES (36, 'Titania', 1578, true, false, 9, 'MOON', 36);
INSERT INTO public.moon VALUES (37, 'Nereid', 340, false, false, -360, 'MOON', 35);
INSERT INTO public.moon VALUES (38, 'Triton', 2706, true, false, -6, 'MOON', 35);
INSERT INTO public.moon VALUES (39, 'Proteus', 436, false, false, 1, 'MOON', 35);
INSERT INTO public.moon VALUES (40, 'Land', 234.2, false, false, 3, 'MOON', 38);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (34, 'Earth', 12742, true, true, 365, 'PLANET', NULL, 1);
INSERT INTO public.planet VALUES (35, 'Mars', 6779, true, false, 687, 'PLANET', NULL, 2);
INSERT INTO public.planet VALUES (36, 'Jupiter', 139820, true, false, 4331, 'PLANET', NULL, 3);
INSERT INTO public.planet VALUES (37, 'Saturn', 116460, true, false, 10747, 'PLANET', NULL, 4);
INSERT INTO public.planet VALUES (38, 'Napture', 49528, true, false, 60190, 'PLAANET', NULL, 5);
INSERT INTO public.planet VALUES (39, 'Mercury', 4879, false, false, 88, 'PLANET', NULL, 6);
INSERT INTO public.planet VALUES (40, 'Uranus', 50724, true, false, 30660, 'PLANET', NULL, 7);
INSERT INTO public.planet VALUES (41, 'Venus', 12104, false, false, 225, 'PLANET', NULL, 8);
INSERT INTO public.planet VALUES (42, 'Pluto', 2370, true, false, 90560, 'PLANET', NULL, 9);
INSERT INTO public.planet VALUES (43, 'Kepler-186f', 11430, true, true, 130, 'PLANET', NULL, 1);
INSERT INTO public.planet VALUES (44, 'Gliese 581g', 24750, true, true, 37, 'PLANET', NULL, 2);
INSERT INTO public.planet VALUES (45, 'Proxima Centauri b', 8000, false, true, 11, 'PLANET', NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, false, false, 'star', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, true, true, 'star', 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1.1, true, false, 'star', 1);
INSERT INTO public.star VALUES (4, 'Arcturus', 1.08, false, false, 'star', 1);
INSERT INTO public.star VALUES (5, 'Vega', 2.135, true, true, 'star', 2);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 20, true, true, 'star', 3);
INSERT INTO public.star VALUES (7, 'Rigel', 21, false, true, 'star', 4);
INSERT INTO public.star VALUES (8, 'Antares', 15, true, true, 'star', 5);
INSERT INTO public.star VALUES (9, 'Pollux', 1.6, false, false, 'star', 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 33, true);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 6, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 63, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 45, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 9, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uique_name UNIQUE (name);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

