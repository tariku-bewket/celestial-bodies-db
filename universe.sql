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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period numeric NOT NULL,
    mass numeric,
    diameter numeric,
    has_tail boolean NOT NULL,
    description text NOT NULL
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
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_million_light_years numeric,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    mass numeric,
    diameter numeric,
    orbital_period numeric,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(50),
    mass numeric,
    diameter numeric,
    orbital_period numeric,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    mass numeric,
    diameter numeric,
    luminosity numeric,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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

INSERT INTO public.comet VALUES (1, 'Halley', 75.3, 220000000000000, 11, true, 'A short-period comet visible from Earth every 75-76 years.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533, 480000000000000, 60, true, 'One of the most widely observed comets of the 20th century.');
INSERT INTO public.comet VALUES (3, 'Borrelly', 6.9, 100000000000000, 4, true, 'A periodic comet with an orbital period of about 6.9 years.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 27.0, 'Our home galaxy.', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2530.0, 'The nearest spiral galaxy.', 10100);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000.0, 'A member of the Local Group.', 12000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000.0, 'Located in the constellation Canes Venatici.', 8000);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Spiral', 12000.0, 'Located in the constellation Ursa Major.', 11500);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 29000.0, 'Located in the constellation Virgo.', 9000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 73000000000000000000000, 3474.8, 27.3, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 10700000000000000, 22.4, 0.319, false, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1480000000000000, 12.4, 1.263, false, true);
INSERT INTO public.moon VALUES (4, 'Io', 3, 89000000000000000000000, 3642, 1.769, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 48000000000000000000000, 3121, 3.551, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 148000000000000000000000, 5268, 7.155, false, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 108000000000000000000000, 4821, 16.689, false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 135000000000000000000000, 5149, 15.945, true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 23000000000000000000000, 1528, 4.518, false, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 18000000000000000000000, 1469, 79.321, false, true);
INSERT INTO public.moon VALUES (11, 'Dione', 4, 11000000000000000000000, 1123, 2.737, false, true);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, 6000000000000000000000, 1060, 1.888, false, true);
INSERT INTO public.moon VALUES (13, 'Proxima b Moon 1', 5, 12000000000000000000000, 1400, 5.0, false, true);
INSERT INTO public.moon VALUES (14, 'Proxima b Moon 2', 5, 9000000000000000000000, 1000, 3.2, false, true);
INSERT INTO public.moon VALUES (15, 'Proxima c Moon 1', 6, 14000000000000000000000, 1600, 7.5, false, true);
INSERT INTO public.moon VALUES (16, 'Proxima c Moon 2', 6, 7000000000000000000000, 800, 4.8, false, true);
INSERT INTO public.moon VALUES (17, 'Sirius b Moon 1', 7, 11000000000000000000000, 1200, 2.4, false, true);
INSERT INTO public.moon VALUES (18, 'Sirius b Moon 2', 7, 8000000000000000000000, 950, 3.8, false, true);
INSERT INTO public.moon VALUES (19, 'Vega b Moon 1', 8, 16000000000000000000000, 1750, 5.9, false, true);
INSERT INTO public.moon VALUES (20, 'Betelgeuse b Moon 1', 9, 13000000000000000000000, 1550, 6.5, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 5970000000000000000000000, 12742, 365.25, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 642000000000000000000000, 6779, 687, false, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 1898000000000000000000000000, 139820, 4333, false, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 568300000000000000000000000, 116460, 10759, false, true);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 'Terrestrial', 1070000000000000000000000, 10240, 11.2, true, true);
INSERT INTO public.planet VALUES (6, 'Proxima c', 2, 'Gas Giant', 13500000000000000000000000, 51120, 1460, false, true);
INSERT INTO public.planet VALUES (7, 'Sirius b', 3, 'Terrestrial', 980000000000000000000000, 12500, 40, false, true);
INSERT INTO public.planet VALUES (8, 'Vega b', 4, 'Terrestrial', 1750000000000000000000000, 13500, 54, false, true);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 5, 'Gas Giant', 29500000000000000000000000, 142000, 120, false, true);
INSERT INTO public.planet VALUES (10, 'Rigel b', 6, 'Ice Giant', 10200000000000000000000000, 49000, 80, false, true);
INSERT INTO public.planet VALUES (11, 'Rigel c', 6, 'Ice Giant', 13500000000000000000000000, 53000, 90, false, true);
INSERT INTO public.planet VALUES (12, 'Rigel d', 6, 'Terrestrial', 500000000000000000000000, 9600, 45, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 1.0, 1391000, 1.0, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'M-type main-sequence', 0.12, 200000, 0.0017, false, true);
INSERT INTO public.star VALUES (3, 'Sirius', 3, 'A-type main-sequence', 2.1, 1711000, 25.4, false, true);
INSERT INTO public.star VALUES (4, 'Vega', 4, 'A-type main-sequence', 2.135, 2362000, 40.12, false, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 5, 'M-type supergiant', 20.0, 815400000, 126000, false, true);
INSERT INTO public.star VALUES (6, 'Rigel', 6, 'B-type supergiant', 21.0, 793600000, 120000, false, true);


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