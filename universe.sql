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
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric,
    num_stars integer,
    age_in_millions_of_years integer,
    unique_name character varying(255)
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
    name character varying(255) NOT NULL,
    is_spherical boolean,
    planet_id integer,
    diameter_km integer,
    orbital_period_days integer,
    unique_name character varying(255)
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
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    star_id integer,
    distance_from_star_au integer,
    num_moons integer,
    unique_name character varying(255)
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
    name character varying(255) NOT NULL,
    is_spherical boolean,
    galaxy_id integer,
    temperature_kelvin integer,
    luminosity_solar_units integer,
    unique_name character varying(255)
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(255) NOT NULL,
    temperature_kelvin numeric,
    radius_km integer,
    galaxy_id integer,
    unique_name character varying(255)
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0, NULL, NULL, 'G-1');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy', 2.537, NULL, NULL, 'G-2');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 3.073, NULL, NULL, 'G-3');
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Our home galaxy', 0, NULL, NULL, 'G-4');
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'Spiral galaxy', 2.537, NULL, NULL, 'G-5');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Small spiral galaxy', 3.073, NULL, NULL, 'G-6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, NULL, NULL, 'M-1');
INSERT INTO public.moon VALUES (2, 'Phobos', true, 2, NULL, NULL, 'M-2');
INSERT INTO public.moon VALUES (3, 'Ganymede', true, 3, NULL, NULL, 'M-3');
INSERT INTO public.moon VALUES (24, 'Moon', true, 1, NULL, NULL, 'M-24');
INSERT INTO public.moon VALUES (25, 'Phobos', true, 2, NULL, NULL, 'M-25');
INSERT INTO public.moon VALUES (26, 'Ganymede', true, 3, NULL, NULL, 'M-26');
INSERT INTO public.moon VALUES (27, 'Io', true, 4, NULL, NULL, 'M-27');
INSERT INTO public.moon VALUES (28, 'Europa', true, 5, NULL, NULL, 'M-28');
INSERT INTO public.moon VALUES (29, 'Callisto', true, 6, NULL, NULL, 'M-29');
INSERT INTO public.moon VALUES (30, 'Titan', true, 7, NULL, NULL, 'M-30');
INSERT INTO public.moon VALUES (31, 'Enceladus', true, 8, NULL, NULL, 'M-31');
INSERT INTO public.moon VALUES (32, 'Triton', true, 9, NULL, NULL, 'M-32');
INSERT INTO public.moon VALUES (33, 'Charon', true, 10, NULL, NULL, 'M-33');
INSERT INTO public.moon VALUES (34, 'Deimos', true, 11, NULL, NULL, 'M-34');
INSERT INTO public.moon VALUES (35, 'Ceres', true, 12, NULL, NULL, 'M-35');
INSERT INTO public.moon VALUES (36, 'Moon', true, 1, NULL, NULL, 'M-36');
INSERT INTO public.moon VALUES (37, 'Phobos', true, 2, NULL, NULL, 'M-37');
INSERT INTO public.moon VALUES (38, 'Ganymede', true, 3, NULL, NULL, 'M-38');
INSERT INTO public.moon VALUES (39, 'Io', true, 4, NULL, NULL, 'M-39');
INSERT INTO public.moon VALUES (40, 'Europa', true, 5, NULL, NULL, 'M-40');
INSERT INTO public.moon VALUES (41, 'Callisto', true, 6, NULL, NULL, 'M-41');
INSERT INTO public.moon VALUES (42, 'Titan', true, 7, NULL, NULL, 'M-42');
INSERT INTO public.moon VALUES (43, 'Enceladus', true, 8, NULL, NULL, 'M-43');
INSERT INTO public.moon VALUES (44, 'Triton', true, 9, NULL, NULL, 'M-44');
INSERT INTO public.moon VALUES (45, 'Charon', true, 10, NULL, NULL, 'M-45');
INSERT INTO public.moon VALUES (46, 'Deimos', true, 11, NULL, NULL, 'M-46');
INSERT INTO public.moon VALUES (47, 'Ceres', true, 12, NULL, NULL, 'M-47');
INSERT INTO public.moon VALUES (48, 'Oberon', true, 1, NULL, NULL, 'M-48');
INSERT INTO public.moon VALUES (49, 'Miranda', true, 2, NULL, NULL, 'M-49');
INSERT INTO public.moon VALUES (50, 'Phoebe', true, 3, NULL, NULL, 'M-50');
INSERT INTO public.moon VALUES (51, 'Hyperion', true, 4, NULL, NULL, 'M-51');
INSERT INTO public.moon VALUES (52, 'Rhea', true, 5, NULL, NULL, 'M-52');
INSERT INTO public.moon VALUES (53, 'Dione', true, 6, NULL, NULL, 'M-53');
INSERT INTO public.moon VALUES (54, 'Ariel', true, 7, NULL, NULL, 'M-54');
INSERT INTO public.moon VALUES (55, 'Titania', true, 8, NULL, NULL, 'M-55');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, true, 1, NULL, NULL, 'P-1');
INSERT INTO public.planet VALUES (2, 'Mars', 4500, false, 1, NULL, NULL, 'P-2');
INSERT INTO public.planet VALUES (3, 'Jupiter', 4500, false, 1, NULL, NULL, 'P-3');
INSERT INTO public.planet VALUES (4, 'Earth', 4500, true, 1, NULL, NULL, 'P-4');
INSERT INTO public.planet VALUES (5, 'Mars', 4500, false, 1, NULL, NULL, 'P-5');
INSERT INTO public.planet VALUES (6, 'Jupiter', 4500, false, 1, NULL, NULL, 'P-6');
INSERT INTO public.planet VALUES (7, 'Venus', 4500, false, 1, NULL, NULL, 'P-7');
INSERT INTO public.planet VALUES (8, 'Mercury', 4500, false, 1, NULL, NULL, 'P-8');
INSERT INTO public.planet VALUES (9, 'Saturn', 4500, false, 1, NULL, NULL, 'P-9');
INSERT INTO public.planet VALUES (10, 'Neptune', 4500, false, 1, NULL, NULL, 'P-10');
INSERT INTO public.planet VALUES (11, 'Uranus', 4500, false, 1, NULL, NULL, 'P-11');
INSERT INTO public.planet VALUES (12, 'Pluto', 4500, false, 1, NULL, NULL, 'P-12');
INSERT INTO public.planet VALUES (13, 'Mars Moon 1', 4500, false, 1, NULL, NULL, 'P-13');
INSERT INTO public.planet VALUES (14, 'Mars Moon 2', 4500, false, 1, NULL, NULL, 'P-14');
INSERT INTO public.planet VALUES (15, 'Jupiter Moon 1', 4500, false, 1, NULL, NULL, 'P-15');
INSERT INTO public.planet VALUES (16, 'Jupiter Moon 2', 4500, false, 1, NULL, NULL, 'P-16');
INSERT INTO public.planet VALUES (17, 'Jupiter Moon 3', 4500, false, 1, NULL, NULL, 'P-17');
INSERT INTO public.planet VALUES (18, 'Jupiter Moon 4', 4500, false, 1, NULL, NULL, 'P-18');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 1, NULL, NULL, 'S-1');
INSERT INTO public.star VALUES (2, 'Betelgeuse', true, 1, NULL, NULL, 'S-2');
INSERT INTO public.star VALUES (3, 'Sirius', true, 1, NULL, NULL, 'S-3');
INSERT INTO public.star VALUES (4, 'Sun', true, 1, NULL, NULL, 'S-4');
INSERT INTO public.star VALUES (5, 'Betelgeuse', true, 1, NULL, NULL, 'S-5');
INSERT INTO public.star VALUES (6, 'Sirius', true, 1, NULL, NULL, 'S-6');


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun', 5778, 696340, 1, 'Sun-1');
INSERT INTO public.sun VALUES (2, 'Alpha Centauri A', 5790, 695700, 2, 'Sun-2');
INSERT INTO public.sun VALUES (3, 'Sirius', 9940, 1189640, 3, 'Sun-3');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 55, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name_key UNIQUE (unique_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name_key UNIQUE (unique_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name_key UNIQUE (unique_name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: sun sun_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_unique_name_key UNIQUE (unique_name);


--
-- Name: sun unique_sun_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT unique_sun_name UNIQUE (name);


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
-- Name: sun sun_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

