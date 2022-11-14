--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: movie_platforms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_platforms (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    platform_id integer NOT NULL
);


--
-- Name: movie_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movie_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movie_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movie_platforms_id_seq OWNED BY public.movie_platforms.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    genre integer NOT NULL,
    created_at timestamp without time zone DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'BRT'::text) NOT NULL,
    platforms text[]
);


--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: platforms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.platforms (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


--
-- Name: platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.platforms_id_seq OWNED BY public.platforms.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    platform_id integer NOT NULL,
    comment text NOT NULL,
    stars integer,
    created_at timestamp without time zone DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'BRT'::text) NOT NULL
);


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: movie_platforms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_platforms ALTER COLUMN id SET DEFAULT nextval('public.movie_platforms_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: platforms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.platforms ALTER COLUMN id SET DEFAULT nextval('public.platforms_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genres VALUES (1, 'horror');
INSERT INTO public.genres VALUES (2, 'comedy');
INSERT INTO public.genres VALUES (3, 'action');
INSERT INTO public.genres VALUES (4, 'adventure');
INSERT INTO public.genres VALUES (5, 'drama');
INSERT INTO public.genres VALUES (6, 'fantasy');


--
-- Data for Name: movie_platforms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.movie_platforms VALUES (9, 30, 1);
INSERT INTO public.movie_platforms VALUES (10, 30, 2);
INSERT INTO public.movie_platforms VALUES (11, 31, 3);
INSERT INTO public.movie_platforms VALUES (12, 32, 1);
INSERT INTO public.movie_platforms VALUES (13, 32, 4);
INSERT INTO public.movie_platforms VALUES (14, 33, 1);
INSERT INTO public.movie_platforms VALUES (15, 33, 2);
INSERT INTO public.movie_platforms VALUES (16, 34, 1);
INSERT INTO public.movie_platforms VALUES (17, 34, 3);
INSERT INTO public.movie_platforms VALUES (18, 34, 2);
INSERT INTO public.movie_platforms VALUES (19, 34, 4);
INSERT INTO public.movie_platforms VALUES (20, 35, 1);
INSERT INTO public.movie_platforms VALUES (21, 36, 1);
INSERT INTO public.movie_platforms VALUES (22, 36, 3);
INSERT INTO public.movie_platforms VALUES (23, 36, 4);
INSERT INTO public.movie_platforms VALUES (24, 37, 4);
INSERT INTO public.movie_platforms VALUES (25, 38, 4);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.movies VALUES (30, 'TOP GUN: MAVERICK', 3, '2022-11-13 22:20:55.432976', '{1,2}');
INSERT INTO public.movies VALUES (31, 'THE BATMAN', 3, '2022-11-13 22:21:07.810659', '{3}');
INSERT INTO public.movies VALUES (32, 'HAPPENING', 4, '2022-11-13 22:22:02.069063', '{1,4}');
INSERT INTO public.movies VALUES (33, 'X', 5, '2022-11-13 22:22:13.868613', '{1,2}');
INSERT INTO public.movies VALUES (34, 'ANNABELLE', 1, '2022-11-13 22:22:25.433979', '{1,2,3,4}');
INSERT INTO public.movies VALUES (35, 'HATCHING', 1, '2022-11-13 22:22:32.310858', '{1}');
INSERT INTO public.movies VALUES (36, 'NOPE', 6, '2022-11-13 22:22:42.369301', '{1,3,4}');
INSERT INTO public.movies VALUES (37, 'BOKU NO HERO ACADEMY', 4, '2022-11-13 22:23:06.867677', '{4}');
INSERT INTO public.movies VALUES (38, 'BELLE', 4, '2022-11-13 22:23:28.416512', '{4}');


--
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.platforms VALUES (1, 'Netflix');
INSERT INTO public.platforms VALUES (2, 'Disney+');
INSERT INTO public.platforms VALUES (3, 'Amazon Prime');
INSERT INTO public.platforms VALUES (4, 'CrunchyRoll');


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_seq', 6, true);


--
-- Name: movie_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movie_platforms_id_seq', 25, true);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movies_id_seq', 38, true);


--
-- Name: platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.platforms_id_seq', 4, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: movie_platforms movie_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_platforms
    ADD CONSTRAINT movie_platforms_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: platforms platforms_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_name_key UNIQUE (name);


--
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: movie_platforms movie_platforms_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_platforms
    ADD CONSTRAINT movie_platforms_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- Name: movie_platforms movie_platforms_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_platforms
    ADD CONSTRAINT movie_platforms_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id);


--
-- Name: movies movies_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_genre_fkey FOREIGN KEY (genre) REFERENCES public.genres(id);


--
-- Name: reviews reviews_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- Name: reviews reviews_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id);


--
-- PostgreSQL database dump complete
--

