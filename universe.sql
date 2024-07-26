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
    name character varying(100) NOT NULL,
    description text NOT NULL,
    mass numeric(20,2) NOT NULL,
    discovered boolean,
    habitable_planets integer,
    age_in_millions_of_years integer,
    is_active boolean
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
    planet_id integer NOT NULL,
    description text NOT NULL,
    mass numeric(40,2) NOT NULL,
    discovered boolean,
    is_ice_moon boolean,
    orbit_period_days integer,
    age_in_millions_of_years integer
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
    star_id integer NOT NULL,
    description text NOT NULL,
    mass numeric(40,2) NOT NULL,
    discovered boolean,
    moons integer,
    is_gas_giant boolean,
    orbit_period_days integer,
    age_in_millions_of_years integer
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
-- Name: relationships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relationships (
    relationships_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    source_table character varying(50) NOT NULL,
    source_id integer,
    target_table character varying(50) NOT NULL,
    target_id integer
);


ALTER TABLE public.relationships OWNER TO freecodecamp;

--
-- Name: relationships_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.relationships_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationships_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: relationships_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.relationships_relationship_id_seq OWNED BY public.relationships.relationships_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    mass numeric(40,2) NOT NULL,
    discovered boolean,
    temperature integer,
    is_dwarf boolean,
    age_in_millions_of_years integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: relationships relationships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships ALTER COLUMN relationships_id SET DEFAULT nextval('public.relationships_relationship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy with a central bulge and a flat disk', 1500000000000.00, true, 10, 13000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way', 1230000000000.00, true, 15, 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy in our local group', 50000000000.00, false, 5, 3000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy known for its bright arms', 1800000000000.00, true, 8, 13000, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'An enormous elliptical galaxy with a supermassive black hole', 2400000000000.00, true, 8, 13000, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Famous for its bright central bulge and dust lane', 871000000000.00, false, 3, 10000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s only natural satellite.', 73420000000000000000000.00, true, false, 27, 4600);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'One of Mars''s two small moons, with a heavily cratered surface.', 10720000000000000.00, true, false, 0, 4600);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Mars''s second moon, with a smooth surface.', 1480000000000000.00, true, false, 1, 4600);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'One of Jupiter''s largest moons, known for its volcanic activity.', 89300000000000000000000.00, true, false, 2, 4600);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'A moon of Jupiter with a subsurface ocean.', 48000000000000000000000.00, true, true, 4, 4600);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the Solar System.', 148000000000000000000000.00, true, false, 7, 4600);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'A heavily cratered moon of Jupiter.', 108000000000000000000000.00, true, false, 17, 4600);
INSERT INTO public.moon VALUES (8, 'Titan', 9, 'Saturn''s largest moon, with a thick atmosphere.', 134520000000000000000000.00, true, true, 16, 4600);
INSERT INTO public.moon VALUES (9, 'Rhea', 9, 'One of Saturn''s moons with a bright surface.', 2314800000000000000000.00, true, false, 5, 4600);
INSERT INTO public.moon VALUES (10, 'Iapetus', 9, 'Known for its two-tone coloration.', 1805200000000000000000.00, true, false, 79, 4600);
INSERT INTO public.moon VALUES (11, 'Enceladus', 9, 'A moon of Saturn with icy geysers.', 108270000000000000000.00, true, true, 1, 4600);
INSERT INTO public.moon VALUES (12, 'Tethys', 9, 'One of Saturn''s moons with a large impact crater.', 617430000000000000000.00, true, false, 2, 4600);
INSERT INTO public.moon VALUES (13, 'Mimas', 9, 'Known for its resemblance to the Death Star.', 37493000000000000000.00, true, false, 1, 4600);
INSERT INTO public.moon VALUES (14, 'Miranda', 10, 'A moon of Uranus with a highly irregular surface.', 60200000000000000000.00, true, false, 1, 4600);
INSERT INTO public.moon VALUES (15, 'Ariel', 10, 'One of Uranus''s moons with a varied surface.', 135000000000000000000.00, true, false, 3, 4600);
INSERT INTO public.moon VALUES (16, 'Umbriel', 10, 'A dark moon of Uranus.', 117000000000000000000.00, true, false, 4, 4600);
INSERT INTO public.moon VALUES (17, 'Titania', 10, 'The largest moon of Uranus.', 349000000000000000000.00, true, false, 9, 4600);
INSERT INTO public.moon VALUES (18, 'Oberon', 10, 'Another large moon of Uranus.', 307000000000000000000.00, true, false, 13, 4600);
INSERT INTO public.moon VALUES (19, 'Triton', 11, 'Neptune''s  largest moon, with geysers of nitrogen.', 21400000000000000000000.00, true, true, 6, 4600);
INSERT INTO public.moon VALUES (20, 'Proteus', 11, 'A small and irregularly shaped moon of Neptune.', 49000000000000000000.00, true, false, 1, 4600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The closest planet to the Sun, with a very thin atmosphere.', 328500000000000000000000.00, true, 0, false, 88, 4600);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Similar in size and composition to Earth but with a thick, toxic atmosphere.', 4867000000000000000000000.00, true, 0, false, 225, 4600);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet, with abundant water and a diverse climate.', 5972000000000000000000000.00, true, 1, false, 365, 4600);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Known as the Red Planet due to its iron oxide surface.', 639000000000000000000000.00, true, 2, false, 687, 4600);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in the Solar System with a strong magnetic field.', 1898000000000000000000000000.00, true, 79, true, 4333, 4600);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Famous for its prominent ring system.', 568300000000000000000000000.00, true, 82, true, 10759, 4600);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'A gas giant with an unusual tilt on its axis.', 86810000000000000000000000.00, true, 27, true, 30687, 4600);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Known for its strong winds and deep blue color.', 102400000000000000000000000.00, true, 14, true, 60190, 4600);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'An exoplanet orbiting Proxima Centauri.', 1173000000000000000000000.00, true, 0, false, 11, 4500);
INSERT INTO public.planet VALUES (10, 'Betelgeuse b', 3, 'A hypothetical planet orbiting Betelgeuse.', 22000000000000000000000000.00, true, 1, false, 15, 100000);
INSERT INTO public.planet VALUES (11, 'Rigel b', 4, 'A hypothetical planet orbiting Rigel.', 340000000000000000000000000.00, true, 0, false, 23, 80000);
INSERT INTO public.planet VALUES (12, 'Vega b', 5, 'A hypothetical planet orbiting Vega.', 150000000000000000000000000.00, false, 1, false, 17, 455);


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relationships VALUES (1, 'Earth-Sun Relationship', 'Earth orbits the Sun', 'planet', 1, 'star', 1);
INSERT INTO public.relationships VALUES (2, 'Mars-Sun Relationship', 'Mars orbits the Sun', 'planet', 2, 'star', 1);
INSERT INTO public.relationships VALUES (3, 'Jupiter-Sun Relationship', 'Jupiter orbits the Sun', 'planet', 3, 'star', 1);
INSERT INTO public.relationships VALUES (4, 'Saturn-Sun Relationship', 'Saturn orbits the Sun', 'planet', 4, 'star', 1);
INSERT INTO public.relationships VALUES (5, 'Titan-Saturn Relationship', 'Titan orbits Saturn', 'moon', 8, 'planet', 4);
INSERT INTO public.relationships VALUES (6, 'Rhea-Saturn Relationship', 'Rhea orbits Saturn', 'moon', 9, 'planet', 4);
INSERT INTO public.relationships VALUES (7, 'Io-Jupiter Relationship', 'Io orbits Jupiter', 'moon', 4, 'planet', 3);
INSERT INTO public.relationships VALUES (8, 'Europa-Jupiter Relationship', 'Europa orbits Jupiter', 'moon', 5, 'planet', 3);
INSERT INTO public.relationships VALUES (9, 'Ganymede-Jupiter Relationship', 'Ganymede orbits Jupiter', 'moon', 6, 'planet', 3);
INSERT INTO public.relationships VALUES (10, 'Callisto-Jupiter Relationship', 'Callisto orbits Jupiter', 'moon', 7, 'planet', 3);
INSERT INTO public.relationships VALUES (11, 'Phobos-Mars Relationship', 'Phobos orbits Mars', 'moon', 2, 'planet', 2);
INSERT INTO public.relationships VALUES (12, 'Deimos-Mars Relationship', 'Deimos orbits Mars', 'moon', 3, 'planet', 2);
INSERT INTO public.relationships VALUES (13, 'Enceladus-Saturn Relationship', 'Enceladus orbits Saturn', 'moon', 12, 'planet', 4);
INSERT INTO public.relationships VALUES (14, 'Mimas-Saturn Relationship', 'Mimas orbits Saturn', 'moon', 13, 'planet', 4);
INSERT INTO public.relationships VALUES (15, 'Miranda-Uranus Relationship', 'Miranda orbits Uranus', 'moon', 14, 'planet', 10);
INSERT INTO public.relationships VALUES (16, 'Ariel-Uranus Relationship', 'Ariel orbits Uranus', 'moon', 15, 'planet', 10);
INSERT INTO public.relationships VALUES (17, 'Triton-Neptune Relationship', 'Triton orbits Neptune', 'moon', 20, 'planet', 11);
INSERT INTO public.relationships VALUES (18, 'Proteus-Neptune Relationship', 'Proteus orbits Neptune', 'moon', 21, 'planet', 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our solar system', 1989000000000000000000000000000.00, true, 5778, false, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'The closest known star to the Sun.', 244600000000000000000000000000.00, true, 3050, true, 4500);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 'A red supergiant star in the constellation Orion.', 24000000000000000000000000000000.00, true, 3500, false, 100000);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 'A blue supergiant star in the constellation Orion.', 35600000000000000000000000000000.00, true, 12000, false, 80000);
INSERT INTO public.star VALUES (5, 'Vega', 3, 'A bright star in the constellation Lyra.', 4100000000000000000000000000000.00, false, 9600, false, 455);
INSERT INTO public.star VALUES (6, 'Sirius', 4, 'The brightest star in the night sky.', 4018000000000000000000000000000.00, true, 9940, false, 200);


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
-- Name: relationships_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.relationships_relationship_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: relationships relationships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_name_key UNIQUE (name);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (relationships_id);


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
-- Name: relationships unique_relationship; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT unique_relationship UNIQUE (source_table, source_id, target_table, target_id);


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


