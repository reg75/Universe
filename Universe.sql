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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(48) NOT NULL,
    nasa_abbrev character varying(12),
    meaning text,
    brightest_star character varying(32),
    contstraint name
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(64) NOT NULL,
    no_stars character varying(48),
    etymology text,
    constellation_id integer,
    distance_kpc numeric(10,1),
    galaxy_id integer NOT NULL
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
    name character varying(64),
    mean_radius_km integer NOT NULL,
    orb_period_days numeric(10,3),
    year_discovered integer,
    discovered_by character varying(32),
    satt_of character varying(32),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moond_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moond_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moond_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moond_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moond_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(72) NOT NULL,
    type character varying(32),
    day_length_hrs integer,
    year_length_days integer,
    known_moons integer NOT NULL,
    known_life boolean NOT NULL,
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
    name character varying(48) NOT NULL,
    system character varying(48),
    distance double precision,
    known_planets boolean,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moond_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Orio', 'Orion (mythical hunter)', 'Rigel', NULL);
INSERT INTO public.constellation VALUES (2, 'Gemini', 'Gemi', 'twins', 'Pollux', NULL);
INSERT INTO public.constellation VALUES (3, 'Taurus', 'Taur', 'bull', 'Aldebaran', NULL);
INSERT INTO public.constellation VALUES (4, 'Saggitarius', 'Sgtr', 'archer', 'Kaus Australis', NULL);
INSERT INTO public.constellation VALUES (5, 'Andromeda', 'Andr', 'Andromeda (mythical princess)', 'Alpheratz', NULL);
INSERT INTO public.constellation VALUES (6, 'Canis Major', 'CMaj', 'Greater Dog', 'Sirius', NULL);
INSERT INTO public.constellation VALUES (7, 'Leo', 'Leon', 'lion', 'Regulus', NULL);
INSERT INTO public.constellation VALUES (8, 'Triangulum', 'Tria', 'triangle', 'Beta Trianguli', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('The Milky Way', '100 billion', 'from Latin via lactae (milky way', 4, 8.0, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', '1 trillion', 'Andromeda (mythical princess) - from constellation it appears in', 5, 765.0, 2);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf Galaxy', '1 billion', 'Greater Dog - from the constellation it appears in', 6, 1.5, 3);
INSERT INTO public.galaxy VALUES ('Segue 1', '1000', 'Named after SEGUE - Sloan Extension for Galactic Understanding and Exploration', 7, 23.0, 4);
INSERT INTO public.galaxy VALUES ('Saggitarious Dwarf Spheroidal Galaxy', NULL, 'archer - named from its shape and constellation it appears in', 4, 20.0, 5);
INSERT INTO public.galaxy VALUES ('Triangulum', '40 billion', 'triangle - from the constellation it appears in', 8, 970.0, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, 27.320, NULL, NULL, 'Earth', 3);
INSERT INTO public.moon VALUES (2, 'Io', 1821, 1.769, 1610, 'Galileo', 'Jupiter', 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634, 7.115, 1610, 'Galileo', 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 2410, 1.769, 1610, 'Galileo', 'Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Europa', 1560, 3.551, 1610, 'Galileo', 'Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Phobos', 11, 0.319, 1877, 'Hall', 'Mars', 4);
INSERT INTO public.moon VALUES (8, 'Deimos', 6, 1.262, 1877, 'Hall', 'Mars', 4);
INSERT INTO public.moon VALUES (9, 'Triton', 1353, 5.877, 1846, 'Lassell', 'Neptune', 8);
INSERT INTO public.moon VALUES (10, 'Titan', 2574, 15.950, 1655, 'Huygens', 'Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 763, 4.518, 1672, 'Cassini', 'Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 735, 79.330, 1671, 'Cassini', 'Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Dione', 561, 2.737, 1684, 'Cassini', 'Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 533, 1.888, 1684, 'Cassini', 'Saturn', 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', 252, 1.370, 1789, 'Herschel', 'Saturn', 6);
INSERT INTO public.moon VALUES (16, 'Tatania', 788, 8.706, 1787, 'Herschel', 'Uranus', 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 761, 13.460, 1787, 'Herschel', 'Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 584, 4.144, 1851, 'Lassell', 'Uranus', 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 579, 2.520, 1851, 'Lassell', 'Uranus', 7);
INSERT INTO public.moon VALUES (20, 'Miranda', 236, 1.413, 1948, 'Kuiper', 'Uranus', 7);
INSERT INTO public.moon VALUES (21, 'Proteus', 210, 1.122, 1989, 'Synnott', 'Neptune', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', 1408, 88, 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', 5832, 225, 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', 24, 365, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', 25, 687, 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 10, 4333, 92, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 11, 10759, 83, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Neptunian', 17, 30687, 27, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptunian', 16, 60190, 14, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima D', 'terrestrial', NULL, 11, 0, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima B', 'terrestrial', NULL, 5, 0, false, 2);
INSERT INTO public.planet VALUES (11, 'Aegir', 'Gas Giant', NULL, 2775, 0, false, 3);
INSERT INTO public.planet VALUES (12, 'Lallande B', 'Super-Earth', NULL, 13, 0, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'The Solar System', 1.9e-05, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Cenrauri', 'Alpha Centauri', 4.25, true, 1);
INSERT INTO public.star VALUES (3, 'Ran', NULL, 10.47, true, 1);
INSERT INTO public.star VALUES (4, 'Barnards Star', NULL, 5.96, false, 1);
INSERT INTO public.star VALUES (5, 'Lallande 21185', NULL, 8.3, true, 1);
INSERT INTO public.star VALUES (6, 'Rigil Kentaurus', 'Alpha Centauri', 4.34, true, 1);
INSERT INTO public.star VALUES (7, 'Toliman', 'Alpha Centauri', 4.34, true, 1);
INSERT INTO public.star VALUES (8, 'Alpha Andromedae', NULL, 97, false, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moond_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moond_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_contstraint_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_contstraint_key UNIQUE (contstraint);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_nasa_abbrev_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_nasa_abbrev_key UNIQUE (nasa_abbrev);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
