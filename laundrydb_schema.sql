--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: pass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pass (
    id integer NOT NULL,
    range character varying(5) NOT NULL
);


ALTER TABLE public.pass OWNER TO postgres;

--
-- Name: pass_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pass_booking (
    id integer NOT NULL,
    date date NOT NULL,
    account_id integer NOT NULL,
    pass_schedule_id integer NOT NULL
);


ALTER TABLE public.pass_booking OWNER TO postgres;

--
-- Name: pass_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pass_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pass_booking_id_seq OWNER TO postgres;

--
-- Name: pass_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pass_booking_id_seq OWNED BY public.pass_booking.id;


--
-- Name: pass_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pass_id_seq OWNER TO postgres;

--
-- Name: pass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pass_id_seq OWNED BY public.pass.id;


--
-- Name: pass_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pass_lock (
    id integer NOT NULL,
    lock_start timestamp with time zone NOT NULL,
    pass_date date NOT NULL,
    account_id integer NOT NULL,
    pass_schedule_id integer NOT NULL
);


ALTER TABLE public.pass_lock OWNER TO postgres;

--
-- Name: pass_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pass_lock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pass_lock_id_seq OWNER TO postgres;

--
-- Name: pass_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pass_lock_id_seq OWNED BY public.pass_lock.id;


--
-- Name: pass_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pass_schedule (
    id integer NOT NULL,
    room integer NOT NULL,
    pass_id integer NOT NULL
);


ALTER TABLE public.pass_schedule OWNER TO postgres;

--
-- Name: pass_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pass_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pass_schedule_id_seq OWNER TO postgres;

--
-- Name: pass_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pass_schedule_id_seq OWNED BY public.pass_schedule.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    personal_number character varying(13) NOT NULL,
    email character varying(50) NOT NULL,
    privilege_id integer NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: privilege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilege (
    id integer NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE public.privilege OWNER TO postgres;

--
-- Name: privilege_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privilege_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privilege_id_seq OWNER TO postgres;

--
-- Name: privilege_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privilege_id_seq OWNED BY public.privilege.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: pass id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass ALTER COLUMN id SET DEFAULT nextval('public.pass_id_seq'::regclass);


--
-- Name: pass_booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_booking ALTER COLUMN id SET DEFAULT nextval('public.pass_booking_id_seq'::regclass);


--
-- Name: pass_lock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_lock ALTER COLUMN id SET DEFAULT nextval('public.pass_lock_id_seq'::regclass);


--
-- Name: pass_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_schedule ALTER COLUMN id SET DEFAULT nextval('public.pass_schedule_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: privilege id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege ALTER COLUMN id SET DEFAULT nextval('public.privilege_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, username, password, person_id) FROM stdin;
1	admin	$2b$12$cPQRsCuIGusulROMgPnf0.HoJ3wJfLrT8f4ogn26Fv3FJ4rl.Dp..	1
2	test	$2b$12$OJocHyWp/6MniP8Y56Z77egndOVVnTJFuHdvVtYpIpMBnsBfxi6Ru	2
4	test3	$2b$12$O2SX/fxmKgRCEx3MZtdsX.YFcbevU8Wjn9LfTMjO3wmrqr5hNPnYK	4
\.


--
-- Data for Name: pass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pass (id, range) FROM stdin;
2	12-17
3	17-22
1	07-12
\.


--
-- Data for Name: pass_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pass_booking (id, date, account_id, pass_schedule_id) FROM stdin;
\.


--
-- Data for Name: pass_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pass_lock (id, lock_start, pass_date, account_id, pass_schedule_id) FROM stdin;
\.


--
-- Data for Name: pass_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pass_schedule (id, room, pass_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, firstname, lastname, personal_number, email, privilege_id) FROM stdin;
1	adminFirst	adminLast	19800618-8679	admin@admin.se	1
2	testFirst	testLast	19670628-4525	test@test.se	2
4	testThird	testThird	19760817-5639	test3@test.se	2
\.


--
-- Data for Name: privilege; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilege (id, type) FROM stdin;
1	Administrator
2	Standard
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 4, true);


--
-- Name: pass_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pass_booking_id_seq', 1, false);


--
-- Name: pass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pass_id_seq', 3, true);


--
-- Name: pass_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pass_lock_id_seq', 1, false);


--
-- Name: pass_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pass_schedule_id_seq', 6, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- Name: privilege_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privilege_id_seq', 2, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: pass_booking pass_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_booking
    ADD CONSTRAINT pass_booking_pkey PRIMARY KEY (id);


--
-- Name: pass_lock pass_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_lock
    ADD CONSTRAINT pass_lock_pkey PRIMARY KEY (id);


--
-- Name: pass pass_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass
    ADD CONSTRAINT pass_pkey PRIMARY KEY (id);


--
-- Name: pass_schedule pass_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_schedule
    ADD CONSTRAINT pass_schedule_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: privilege privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT privilege_pkey PRIMARY KEY (id);


--
-- Name: pass_booking account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_booking
    ADD CONSTRAINT account_id FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: pass_lock account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_lock
    ADD CONSTRAINT account_id FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: pass_schedule pass_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_schedule
    ADD CONSTRAINT pass_id FOREIGN KEY (pass_id) REFERENCES public.pass(id);


--
-- Name: pass_booking pass_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_booking
    ADD CONSTRAINT pass_schedule_id FOREIGN KEY (pass_schedule_id) REFERENCES public.pass_schedule(id);


--
-- Name: pass_lock pass_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pass_lock
    ADD CONSTRAINT pass_schedule_id FOREIGN KEY (pass_schedule_id) REFERENCES public.pass_schedule(id);


--
-- Name: account person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: person privilege_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT privilege_id FOREIGN KEY (privilege_id) REFERENCES public.privilege(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

