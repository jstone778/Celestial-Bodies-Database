--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_count integer NOT NULL,
    distance_in_lightyears numeric(15,2),
    notable_feature text,
    has_life boolean,
    is_observable boolean
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
    name character varying(30),
    planet text NOT NULL,
    planet_id integer NOT NULL,
    size_km_diameter numeric(6,1)
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    galaxy_id integer NOT NULL,
    number_of_planets integer NOT NULL,
    galaxy_type text,
    name character varying(30),
    more_info_id integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star text NOT NULL,
    star_id integer NOT NULL,
    earth_mass numeric(3,1),
    has_atmosphere boolean
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
    galaxy text NOT NULL,
    galaxy_id integer NOT NULL,
    solar_mass numeric(3,1),
    color text
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000000000, 2537000.00, 'Spiral arms', true, true);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 300000000, 23000000.00, 'Active star formation', false, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 800000000, 290000000.00, 'Prominent dust ring', false, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 400000000, 3000000.00, 'Blue giant stars', true, true);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 100000000, 50000000.00, 'Ring structure', false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 1200000000, 53000000.00, 'Supermassive black hole', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Alpha-1a', 'Alpha-1', 1, 1200.0);
INSERT INTO public.moon VALUES (2, 'Alpha-1b', 'Alpha-1', 1, 800.0);
INSERT INTO public.moon VALUES (3, 'Whirlpool-2b-I', 'Whirlpool-2b', 2, 1500.0);
INSERT INTO public.moon VALUES (4, 'Whirlpool-2b-II', 'Whirlpool-2b', 2, 1100.0);
INSERT INTO public.moon VALUES (5, 'Sombrero-4a', 'Sombrero-4', 3, 500.0);
INSERT INTO public.moon VALUES (6, 'Triangulum-3a', 'Triangulum-3', 4, 600.0);
INSERT INTO public.moon VALUES (7, 'Carthweel-1a-I', 'Cartwheel-1a', 5, 1800.0);
INSERT INTO public.moon VALUES (8, 'Triangulum-3b', 'Triangulum-3', 4, 450.0);
INSERT INTO public.moon VALUES (9, 'Carthweel-1a-II', 'Cartwheel-1a', 5, 1000.0);
INSERT INTO public.moon VALUES (10, 'M87-Prime-I', 'M87-Prime', 6, 700.0);
INSERT INTO public.moon VALUES (11, 'Andromeda-5a', 'Andromeda-5', 7, 1300.0);
INSERT INTO public.moon VALUES (12, 'M87-Prime-II', 'M87-Prime', 6, 950.0);
INSERT INTO public.moon VALUES (13, 'Orion-Ba', 'Orion-B', 8, 2200.0);
INSERT INTO public.moon VALUES (14, 'Lyra-6d-I', 'Lyra-6d', 9, 300.0);
INSERT INTO public.moon VALUES (15, 'Scorpio-7c-I', 'Scorpio-7c', 10, 1600.0);
INSERT INTO public.moon VALUES (16, 'Lyra-6d-II', 'Lyra-6d', 9, 250.0);
INSERT INTO public.moon VALUES (17, 'AlphaCent-3a', 'AlphaCent-3', 11, 550.0);
INSERT INTO public.moon VALUES (18, 'Rigel-4a', 'Rigel-4', 12, 1400.0);
INSERT INTO public.moon VALUES (19, 'Rigel-4b', 'Rigel-4', 12, 950.0);
INSERT INTO public.moon VALUES (20, 'Rigel-4c', 'Rigel-4', 12, 800.0);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 10, 'Spiral', 'Andromeda', 1);
INSERT INTO public.more_info VALUES (2, 8, 'Spiral', 'Whirlpool', 2);
INSERT INTO public.more_info VALUES (3, 6, 'Spiral', 'Sombrero', 3);
INSERT INTO public.more_info VALUES (4, 7, 'Spiral', 'Triangulum', 4);
INSERT INTO public.more_info VALUES (5, 5, 'Ring', 'Cartwheel', 5);
INSERT INTO public.more_info VALUES (6, 4, 'Elliptical', 'Messier 87', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Alpha-1', 'Alpheratz', 1, 1.2, true);
INSERT INTO public.planet VALUES (2, 'Whirlpool-2b', 'M106-1', 2, 4.5, true);
INSERT INTO public.planet VALUES (3, 'Sombrero-4', 'Hatysa', 3, 0.8, false);
INSERT INTO public.planet VALUES (4, 'Triangulum-3', 'M33-Alpha', 4, 1.3, true);
INSERT INTO public.planet VALUES (5, 'Cartwheel-1a', 'Cartwheel A', 5, 5.1, true);
INSERT INTO public.planet VALUES (6, 'M87-Prime', 'M87-Vega', 6, 3.2, false);
INSERT INTO public.planet VALUES (7, 'Amdromeda-5', 'Alpheratz', 1, 2.4, true);
INSERT INTO public.planet VALUES (8, 'Orion-b', 'M106-1', 2, 9.7, true);
INSERT INTO public.planet VALUES (9, 'Lyra-6d', 'Hatysa', 3, 0.7, false);
INSERT INTO public.planet VALUES (10, 'Scorpio-7c', 'M33-Alpha', 4, 12.0, true);
INSERT INTO public.planet VALUES (11, 'AlphaCent-3', 'Cartwheel A', 5, 0.4, false);
INSERT INTO public.planet VALUES (12, 'Rigel-4', 'M87-Vega', 6, 8.2, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 'Andromeda', 1, 3.8, 'Blue-White');
INSERT INTO public.star VALUES (2, 'M106-1', 'Whirlpool', 2, 4.2, 'Yellow');
INSERT INTO public.star VALUES (3, 'Hatysa', 'Sombrero', 3, 5.6, 'White');
INSERT INTO public.star VALUES (4, 'M33-Alpha', 'Triangulum', 4, 1.5, 'Red Dwarf');
INSERT INTO public.star VALUES (5, 'Cartwheel A', 'Cartwheel', 5, 9.0, 'Orange');
INSERT INTO public.star VALUES (6, 'M87-Vega', 'Messier 87', 6, 7.1, 'Blue');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: more_info more_info_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_key UNIQUE (name);


--
-- Name: more_info more_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_id_key UNIQUE (more_info_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: star name_unique_2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique_2 UNIQUE (name);


--
-- Name: planet name_unique_3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique_3 UNIQUE (name);


--
-- Name: moon name_unique_4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique_4 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: more_info more_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

