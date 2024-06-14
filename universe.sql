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
    age_in_millions_of_years integer NOT NULL,
    speed integer NOT NULL,
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
    distance_million_light_years double precision,
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
    age_in_millions_of_years integer NOT NULL,
    surface_temperature integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    details text
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
    mass numeric NOT NULL,
    diameter numeric,
    orbital_period numeric,
    moons_count integer NOT NULL,
    rings_count integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    has_rings boolean DEFAULT false
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
    type character varying(50) DEFAULT 'Unknown'::character varying,
    mass numeric NOT NULL,
    diameter numeric,
    luminosity numeric,
    age_in_millions_of_years integer NOT NULL,
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

INSERT INTO public.comet VALUES (1, 'Comet Hale-Bopp', 2533, 450000000000000, 40, 4500, 157, true, 'One of the most widely observed comets of the 20th century.');
INSERT INTO public.comet VALUES (2, 'Comet McNaught', 920, 31000000000000, 25, 4500, 44, true, 'A comet that became visible to the naked eye for a brief period in 2007.');
INSERT INTO public.comet VALUES (3, 'Comet Encke', 3.3, 32000000000000, 4.8, 4500, 64, true, 'A periodic comet that orbits the sun once every 3.3 years.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'The galaxy that contains our Solar System.', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537, 'The nearest spiral galaxy to the Milky Way.', 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000, 'A member of the Local Group of galaxies.', 12000);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral', 11700, 'Located in the constellation Ursa Major.', 11500);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000, 'Known for its interaction with its companion galaxy.', 500);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Elliptical', 29000, 'Named for its appearance resembling a sombrero.', 8900);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 0.0123, 0.273, 27.3, 4500, 220, false, true, 'The only natural satellite of Earth.');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.0000000010659, 0.0151, 0.319, 4500, -40, false, true, 'One of the two moons of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0.000000000147, 0.008, 1.263, 4500, -40, false, true, 'One of the two moons of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 3, 0.015, 0.285, 1.769, 4500, -143, false, true, 'The innermost of the four Galilean moons of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 0.008, 0.245, 3.551, 4500, -160, false, true, 'The smallest of the four Galilean moons of Jupiter.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 0.025, 0.413, 7.154, 4500, -121, false, true, 'The largest moon of Jupiter and in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 0.018, 0.378, 16.689, 4500, -139, false, true, 'The second-largest moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Titan', 4, 0.0225, 0.404, 15.945, 4500, -179, false, true, 'The largest moon of Saturn.');
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 0.0000314, 0.119, 4.518, 4500, -174, false, true, 'The second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 0.0000183, 0.115, 79.321, 4500, -147, false, true, 'The third-largest moon of Saturn.');
INSERT INTO public.moon VALUES (11, 'Dione', 4, 0.0000163, 0.112, 2.737, 4500, -186, false, true, 'The fourth-largest moon of Saturn.');
INSERT INTO public.moon VALUES (12, 'Ariel', 5, 0.0000039, 0.058, 2.52, 4500, -213, false, true, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (13, 'Umbriel', 5, 0.0000043, 0.058, 4.144, 4500, -214, false, true, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (14, 'Titania', 5, 0.0000352, 0.158, 8.706, 4500, -209, false, true, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (15, 'Oberon', 5, 0.0000352, 0.152, 13.463, 4500, -202, false, true, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (16, 'Miranda', 5, 0.000000661, 0.034, 1.413, 4500, -187, false, true, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Triton', 6, 0.0036, 0.272, 5.877, 4500, -235, false, true, 'The largest moon of Neptune.');
INSERT INTO public.moon VALUES (18, 'Nereid', 6, 0.0000003, 0.034, 360.13, 4500, -220, false, true, 'A moon of Neptune.');
INSERT INTO public.moon VALUES (19, 'Proteus', 6, 0.0000044, 0.042, 1.122, 4500, -210, false, true, 'A moon of Neptune.');
INSERT INTO public.moon VALUES (21, 'Charon', 7, 0.000254, 0.121, 6.387, 4500, -220, false, true, 'The largest moon of Pluto.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1, 1, 365.25, 1, 0, true, true, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 0.107, 0.532, 687, 2, 0, false, true, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 317.8, 11.21, 4333, 79, 4, false, true, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 95.2, 9.45, 10759, 82, 7, false, true, true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Ice Giant', 14.5, 4.01, 30687, 27, 13, false, true, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Ice Giant', 17.1, 3.88, 60190, 14, 5, false, true, true);
INSERT INTO public.planet VALUES (7, 'Proxima b', 5, 'Terrestrial', 1.27, 1.07, 11.2, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 6, 'Terrestrial', 1.1, 1.08, 3.24, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Super-Earth', 2.4, 2.38, 290, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 2, 'Super-Earth', 3.1, 1.5, 37, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (11, 'Kepler-69c', 3, 'Super-Earth', 2.2, 1.71, 242, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (12, 'HD 10180 g', 3, 'Neptune-like', 21.4, 3.8, 600, 0, 0, false, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1, 1, 1, 4600, true, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'Red Supergiant', 20, 1000, 126000, 8000, false, true);
INSERT INTO public.star VALUES (3, 'Rigel', 2, 'Blue Supergiant', 21, 79, 120000, 8000, false, true);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'Main Sequence', 2.1, 1.71, 25.4, 300, false, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'Red Dwarf', 0.123, 0.141, 0.0017, 4500, false, true);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 1, 'Binary', 2.18, 1.22, 1.519, 5500, false, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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