--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: match; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match (
    id integer NOT NULL,
    viewer_id integer NOT NULL,
    viewee_id integer NOT NULL,
    week_id integer NOT NULL,
    view_time timestamp without time zone NOT NULL
);


ALTER TABLE public.match OWNER TO postgres;

--
-- Name: match_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_id_seq OWNER TO postgres;

--
-- Name: match_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_id_seq OWNED BY public.match.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill (
    id integer NOT NULL,
    viewer_id integer,
    viewee_id integer,
    skill integer NOT NULL
);


ALTER TABLE public.skill OWNER TO postgres;

--
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skill_id_seq OWNER TO postgres;

--
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_id_seq OWNED BY public.skill.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT '2023-10-23 23:09:41.878174'::timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: viewee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewee (
    viewee_id integer NOT NULL,
    user_id integer NOT NULL,
    level integer NOT NULL,
    description text DEFAULT 'Default Description'::text NOT NULL,
    viewee_name text DEFAULT 'Default Name'::text NOT NULL
);


ALTER TABLE public.viewee OWNER TO postgres;

--
-- Name: COLUMN viewee.level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viewee.level IS '1:entry 2:junior 3:mid 4:senior';


--
-- Name: viewee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.viewee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.viewee_id_seq OWNER TO postgres;

--
-- Name: viewee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.viewee_id_seq OWNED BY public.viewee.viewee_id;


--
-- Name: viewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewer (
    viewer_id integer NOT NULL,
    user_id integer NOT NULL,
    level integer NOT NULL,
    accept_count integer NOT NULL,
    description text DEFAULT 'Default Description'::text NOT NULL,
    viewer_name text DEFAULT 'Default Name'::text NOT NULL
);


ALTER TABLE public.viewer OWNER TO postgres;

--
-- Name: COLUMN viewer.level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viewer.level IS '1:entry 2:junior 3:mid 4:senior';


--
-- Name: viewer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.viewer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.viewer_id_seq OWNER TO postgres;

--
-- Name: viewer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.viewer_id_seq OWNED BY public.viewer.viewer_id;


--
-- Name: match id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match ALTER COLUMN id SET DEFAULT nextval('public.match_id_seq'::regclass);


--
-- Name: skill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill ALTER COLUMN id SET DEFAULT nextval('public.skill_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: viewee viewee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewee ALTER COLUMN viewee_id SET DEFAULT nextval('public.viewee_id_seq'::regclass);


--
-- Name: viewer viewer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewer ALTER COLUMN viewer_id SET DEFAULT nextval('public.viewer_id_seq'::regclass);


--
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match (id, viewer_id, viewee_id, week_id, view_time) FROM stdin;
1	1	1	1	2023-10-24 15:30:00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
1	f
\.


--
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skill (id, viewer_id, viewee_id, skill) FROM stdin;
1	1	\N	4
2	\N	1	4
3	1	\N	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, name, created_at) FROM stdin;
1	yale918@gmail.com	12345	yale	2023-10-23 23:09:41.878174
2	node@gmail.com	12345	node	2023-10-23 23:09:41.878174
\.


--
-- Data for Name: viewee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewee (viewee_id, user_id, level, description, viewee_name) FROM stdin;
1	2	1	this is viewee node	node
\.


--
-- Data for Name: viewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewer (viewer_id, user_id, level, accept_count, description, viewer_name) FROM stdin;
1	1	2	0	this is yale	yale
\.


--
-- Name: match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_id_seq', 1, true);


--
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: viewee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.viewee_id_seq', 1, true);


--
-- Name: viewer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.viewer_id_seq', 1, true);


--
-- Name: match match_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: viewee viewee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewee
    ADD CONSTRAINT viewee_pkey PRIMARY KEY (viewee_id);


--
-- Name: viewer viewer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewer
    ADD CONSTRAINT viewer_pkey PRIMARY KEY (viewer_id);


--
-- Name: match match_viewee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_viewee_id_fkey FOREIGN KEY (viewee_id) REFERENCES public.viewee(viewee_id);


--
-- Name: match match_viewer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_viewer_id_fkey FOREIGN KEY (viewer_id) REFERENCES public.viewer(viewer_id);


--
-- Name: skill skill_viewee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_viewee_id_fkey FOREIGN KEY (viewee_id) REFERENCES public.viewee(viewee_id);


--
-- Name: skill skill_viewer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_viewer_id_fkey FOREIGN KEY (viewer_id) REFERENCES public.viewer(viewer_id);


--
-- Name: viewee viewee_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewee
    ADD CONSTRAINT viewee_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: viewer viewer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewer
    ADD CONSTRAINT viewer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

