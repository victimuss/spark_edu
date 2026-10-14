--
-- PostgreSQL database dump
--

-- \restrict umuVgEIKFhNk7MggLDMJYDhSwSZDU8TrKBc35aIZtRBcsZfwDuj6oqfFrodSzsc

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO admin;

--
-- Name: lesson_likes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lesson_likes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lesson_likes OWNER TO admin;

--
-- Name: lesson_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lesson_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lesson_likes_id_seq OWNER TO admin;

--
-- Name: lesson_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lesson_likes_id_seq OWNED BY public.lesson_likes.id;


--
-- Name: lesson_rank; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lesson_rank (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL,
    rank double precision NOT NULL
);


ALTER TABLE public.lesson_rank OWNER TO admin;

--
-- Name: lesson_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lesson_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lesson_rank_id_seq OWNER TO admin;

--
-- Name: lesson_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lesson_rank_id_seq OWNED BY public.lesson_rank.id;


--
-- Name: lesson_sheets; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lesson_sheets (
    id integer NOT NULL,
    author_id integer NOT NULL,
    content_id integer NOT NULL,
    "sheetType" character varying(50) NOT NULL,
    sheet_header character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    description_for_video_or_picture character varying(50),
    video_url character varying,
    picture_url character varying,
    image_public_id character varying,
    question_text character varying(30),
    quiz_options json,
    "timeToRead" integer NOT NULL,
    content_danger character varying(75),
    content_advice character varying(75),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.lesson_sheets OWNER TO admin;

--
-- Name: lesson_sheets_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lesson_sheets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lesson_sheets_id_seq OWNER TO admin;

--
-- Name: lesson_sheets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lesson_sheets_id_seq OWNED BY public.lesson_sheets.id;


--
-- Name: lesson_tags; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lesson_tags (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    tag character varying(50) NOT NULL
);


ALTER TABLE public.lesson_tags OWNER TO admin;

--
-- Name: lesson_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lesson_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lesson_tags_id_seq OWNER TO admin;

--
-- Name: lesson_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lesson_tags_id_seq OWNED BY public.lesson_tags.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    lesson_name character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(255),
    type character varying(50) NOT NULL,
    level character varying(50) NOT NULL,
    rank double precision NOT NULL,
    rank_count integer NOT NULL,
    likes integer NOT NULL,
    author_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.lessons OWNER TO admin;

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_id_seq OWNER TO admin;

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: registed_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.registed_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.registed_users OWNER TO admin;

--
-- Name: registed_users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.registed_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registed_users_id_seq OWNER TO admin;

--
-- Name: registed_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.registed_users_id_seq OWNED BY public.registed_users.id;


--
-- Name: user_lessons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_lessons (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL,
    status character varying(50) NOT NULL,
    completed_steps integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_lessons OWNER TO admin;

--
-- Name: user_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_lessons_id_seq OWNER TO admin;

--
-- Name: user_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_lessons_id_seq OWNED BY public.user_lessons.id;


--
-- Name: user_progress; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_progress (
    id integer NOT NULL,
    user_id integer NOT NULL,
    slide_id integer NOT NULL,
    selected_answer character varying(255),
    is_correct boolean NOT NULL,
    answered_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_progress OWNER TO admin;

--
-- Name: user_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_progress_id_seq OWNER TO admin;

--
-- Name: user_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_progress_id_seq OWNED BY public.user_progress.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(50) NOT NULL,
    description character varying(255),
    tag character varying(255) NOT NULL,
    hashed_password character varying(255) NOT NULL,
    avatar character varying(255),
    site character varying(255),
    telegram character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    public_key character varying
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_skills; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users_skills (
    id integer NOT NULL,
    user_id integer NOT NULL,
    skill_name character varying(255) NOT NULL,
    level character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users_skills OWNER TO admin;

--
-- Name: users_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_skills_id_seq OWNER TO admin;

--
-- Name: users_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_skills_id_seq OWNED BY public.users_skills.id;


--
-- Name: lesson_likes id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_likes ALTER COLUMN id SET DEFAULT nextval('public.lesson_likes_id_seq'::regclass);


--
-- Name: lesson_rank id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_rank ALTER COLUMN id SET DEFAULT nextval('public.lesson_rank_id_seq'::regclass);


--
-- Name: lesson_sheets id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_sheets ALTER COLUMN id SET DEFAULT nextval('public.lesson_sheets_id_seq'::regclass);


--
-- Name: lesson_tags id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_tags ALTER COLUMN id SET DEFAULT nextval('public.lesson_tags_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: registed_users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.registed_users ALTER COLUMN id SET DEFAULT nextval('public.registed_users_id_seq'::regclass);


--
-- Name: user_lessons id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_lessons ALTER COLUMN id SET DEFAULT nextval('public.user_lessons_id_seq'::regclass);


--
-- Name: user_progress id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_progress ALTER COLUMN id SET DEFAULT nextval('public.user_progress_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_skills id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users_skills ALTER COLUMN id SET DEFAULT nextval('public.users_skills_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.alembic_version (version_num) FROM stdin;
836bafbc1a38
\.


--
-- Data for Name: lesson_likes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.lesson_likes (id, user_id, lesson_id) FROM stdin;
\.


--
-- Data for Name: lesson_rank; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.lesson_rank (id, user_id, lesson_id, rank) FROM stdin;
\.


--
-- Data for Name: lesson_sheets; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.lesson_sheets (id, author_id, content_id, "sheetType", sheet_header, content, description_for_video_or_picture, video_url, picture_url, image_public_id, question_text, quiz_options, "timeToRead", content_danger, content_advice, created_at, updated_at) FROM stdin;
1	1	12	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:33:13.045115	2026-05-02 12:33:13.045121
2	1	14	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:35:59.379084	2026-05-02 12:35:59.379087
3	1	16	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:36:21.658495	2026-05-02 12:36:21.6585
4	1	17	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:36:38.442603	2026-05-02 12:36:38.442606
5	1	19	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:36:58.632803	2026-05-02 12:36:58.632806
6	1	20	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:37:16.062405	2026-05-02 12:37:16.062409
7	1	22	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:37:54.608061	2026-05-02 12:37:54.608064
8	1	23	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:38:39.320758	2026-05-02 12:38:39.320761
9	1	24	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:39:01.574006	2026-05-02 12:39:01.574009
10	1	25	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:39:26.314493	2026-05-02 12:39:26.314498
11	1	27	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 12:39:59.497587	2026-05-02 12:39:59.497593
12	1	29	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 13:03:06.201568	2026-05-02 13:03:06.201571
13	1	31	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 13:04:07.316327	2026-05-02 13:04:07.316331
14	1	33	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 13:17:01.79761	2026-05-02 13:17:01.797615
15	1	35	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 13:30:27.390179	2026-05-02 13:30:27.390182
16	1	37	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-02 13:39:56.258172	2026-05-02 13:39:56.258176
18	50	39	THEORY	jdjfj	nxncnc				\N		[]	0			2026-05-03 09:21:40.014872	2026-05-03 09:21:40.014874
19	50	40	THEORY	jfjfjf	nc cnc				\N		[]	0			2026-05-03 09:27:34.074332	2026-05-03 09:27:34.074338
17	50	38	PICTURE	¦-¦-¦-TÎTÇ¦¬¦¦ TÅTÃ¦¦					\N		[]	0			2026-05-03 08:28:10.594715	2026-05-03 09:28:16.88829
20	50	42	PICTURE	¦¬¦¬TÌ¦¬¦¬				\N	\N		[]	0			2026-05-03 09:31:13.778973	2026-05-03 09:35:52.262754
21	1	45	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-03 12:28:01.900595	2026-05-03 12:28:01.900599
22	1	47	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-03 12:36:14.541705	2026-05-03 12:36:14.541708
23	1	49	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-03 15:27:12.637916	2026-05-03 15:27:12.63792
24	87	51	THEORY	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦	¦Ø¦+¦¬¦-TÂTË	\N	\N	\N	\N	\N	\N	1	\N	\N	2026-05-03 15:59:21.438556	2026-05-03 15:59:21.43856
\.


--
-- Data for Name: lesson_tags; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.lesson_tags (id, lesson_id, tag) FROM stdin;
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.lessons (id, lesson_name, status, description, type, level, rank, rank_count, likes, author_id, created_at, updated_at, is_active) FROM stdin;
12	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 411bb4	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:33:13.024592	2026-05-02 12:33:13.024596	t
13	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 68574b	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:35:50.176845	2026-05-02 12:35:50.176849	t
14	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 96ad84	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:35:59.360372	2026-05-02 12:35:59.360377	t
15	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ ec84cf	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:36:21.589813	2026-05-02 12:36:21.589818	t
16	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 0d308a	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:36:21.64409	2026-05-02 12:36:21.644094	t
17	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 4f3239	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:36:38.423039	2026-05-02 12:36:38.423044	t
18	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ a4c973	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:36:58.568353	2026-05-02 12:36:58.568357	t
19	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ e8d7e8	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:36:58.619161	2026-05-02 12:36:58.619165	t
20	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 897c75	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:37:16.044352	2026-05-02 12:37:16.044357	t
21	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 724c8e	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:37:54.540748	2026-05-02 12:37:54.540753	t
22	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 413c3d	rejected	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:37:54.592974	2026-05-02 12:37:54.665034	t
23	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ a182c4	rejected	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:38:39.303197	2026-05-02 12:38:39.380346	t
24	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ e961b0	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:39:01.556212	2026-05-02 12:39:01.634507	t
25	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 9f8c24	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:39:26.296758	2026-05-02 12:39:26.374251	t
26	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ fe33f2	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:39:59.407057	2026-05-02 12:39:59.407063	t
27	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 3fcda8	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 12:39:59.475586	2026-05-02 12:39:59.561444	t
28	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ a58a0a	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:03:06.140741	2026-05-02 13:03:06.140745	t
29	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ e3b10b	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:03:06.188846	2026-05-02 13:03:06.24841	t
30	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ bdd30d	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:04:07.249196	2026-05-02 13:04:07.249203	t
31	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 14ed55	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:04:07.302833	2026-05-02 13:04:07.365144	t
32	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ bb3a7e	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:17:01.698716	2026-05-02 13:17:01.698723	t
33	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 6dde9f	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:17:01.77511	2026-05-02 13:17:01.860543	t
34	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 17c8dd	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:30:27.32623	2026-05-02 13:30:27.326234	t
35	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ f02c87	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:30:27.376569	2026-05-02 13:30:27.441652	t
36	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 72e036	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:39:56.180561	2026-05-02 13:39:56.180566	t
37	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ a2f849	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-02 13:39:56.243211	2026-05-02 13:39:56.323734	t
42	TÈ¦¦¦¬¦¦	DRAFT	¦¬¦-¦¬¦¦¦¦	code	Beginner	0	0	0	50	2026-05-03 09:30:58.021142	2026-05-03 09:30:58.021147	t
40	jdjfj	DRAFT	krkrkrk	language	Intermediate	0	0	0	50	2026-05-03 09:25:13.358495	2026-05-03 09:27:35.026418	t
44	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 39abb8	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-03 12:28:01.646628	2026-05-03 12:28:01.646631	t
39	Dorj	ACTIVE	zkkr	code	Beginner	0	0	0	50	2026-05-03 09:21:35.373056	2026-05-03 09:24:51.302425	t
38	Test	REJECTED	Test	code	Beginner	0	0	0	50	2026-05-03 08:27:55.448908	2026-05-03 09:28:18.80053	t
41	¦¬¦-TÌ¦¬¦-	DRAFT	¦-¦+¦-¦¦¦¦¦-	language	Beginner	0	0	0	50	2026-05-03 09:30:43.094909	2026-05-03 09:30:43.094912	t
45	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 59658f	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-03 12:28:01.835854	2026-05-03 12:28:02.052279	t
46	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ ee0217	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-03 12:36:14.293824	2026-05-03 12:36:14.293827	t
47	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 7392c9	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-03 12:36:14.478075	2026-05-03 12:36:14.670969	t
48	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 58fe11	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-03 15:27:12.353808	2026-05-03 15:27:12.353812	t
49	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 068015	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	1	2026-05-03 15:27:12.567721	2026-05-03 15:27:12.789223	t
50	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 576201	DRAFT	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	86	2026-05-03 15:59:21.162694	2026-05-03 15:59:21.162698	t
51	¦Ú¦-¦¦ ¦-¦¬¦¬¦-¦-¦-TÂTÌ ¦-¦-¦-¦¦ 746177	REJECTED	¦ß¦-TÈ¦-¦¦¦-¦-TË¦¦ TÂTÃTÂ¦-TÀ¦¬¦-¦¬ ¦¬¦- ¦¦TÀ¦-¦¦¦¦ ¦+¦¦¦-¦¦¦¦. ¦ÒTÁ¦¦ ¦-¦-¦¦TÀTÃ¦¦ ¦¬¦+¦¬¦-TÂTË!	Code	Beginner	0	0	0	87	2026-05-03 15:59:21.368341	2026-05-03 15:59:21.577034	t
\.


--
-- Data for Name: registed_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.registed_users (id, user_id, lesson_id) FROM stdin;
1	99	39
\.


--
-- Data for Name: user_lessons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_lessons (id, user_id, lesson_id, status, completed_steps, created_at, updated_at) FROM stdin;
1	99	39	IN_PROGRESS	1	2026-05-05 13:34:34.162217	2026-05-05 13:34:34.16222
\.


--
-- Data for Name: user_progress; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_progress (id, user_id, slide_id, selected_answer, is_correct, answered_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, user_name, email, role, description, tag, hashed_password, avatar, site, telegram, created_at, updated_at, is_active, public_key) FROM stdin;
1	test_	test_e@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ		$2b$12$GupxgOSy54SkfcciibVCDu3iAaCEdwB.sZcBo3Q.fo/R/WIJD98O6				2026-05-02 10:28:02.865327	2026-05-02 10:28:02.86533	t	\N
13	test_user_9b914f	test_new_9b914f@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@728b05	$2b$12$P2LZhpqseEiXD.oFy2l0oOvwCbqd2YqZhxNFEDigPaqmVl991zT0K				2026-05-02 10:42:58.37298	2026-05-02 10:42:58.372983	t	\N
14	test_login_9c695a	test_login_9c695a@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@05675b	$2b$12$SK4iwaA92pk0N0TKIOg8cOQSRvRoLAthu52sgQrIO8ydgCKwupRQi				2026-05-02 10:43:23.005182	2026-05-02 10:43:23.005186	t	\N
15	test_user_0869f3	test_new_0869f3@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@f0b114	$2b$12$yelw7RH9drOHufhmigNu4.VW7RGelnyLwH3c/RSflLs2sa4CvgBYW				2026-05-02 10:44:25.319387	2026-05-02 10:44:25.31939	t	\N
16	test_login_34b0e2	test_login_34b0e2@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@3d48c5	$2b$12$M0IFbyHHChD9y4SHJhoLAeQud7mbN3Hzl4GXUsA8VPMuKM9.QdOh.				2026-05-02 10:44:25.512327	2026-05-02 10:44:25.51233	t	\N
17	test_dup_1f9aaa	test_dup_1f9aaa@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@9cfbba	$2b$12$KCdzTnMEikFJ8wyOovMvku0SHqO5jMmOk6iTMtS2F/0hJ0Qs6CT2y				2026-05-02 10:44:25.907996	2026-05-02 10:44:25.907999	t	\N
19	test_login_00d459	test_login_00d459@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@58e905	$2b$12$hSXUrv0DS7Eo2EfLO78WeulLK.F6AbuZW9M4GeeGZtyTHbhj.X03e				2026-05-02 10:44:28.670884	2026-05-02 10:44:28.670887	t	\N
20	test_dup_359e64	test_dup_359e64@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@415553	$2b$12$tcFBbiAUZdJRQpK.OeIP4urxw0MvvyS5oRZ6vYIatiTdjAIvtjBOC				2026-05-02 10:44:32.485462	2026-05-02 10:44:32.485465	t	\N
22	test_user_29a2cb	test_new_29a2cb@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@2b5c99	$2b$12$qDnE6uyFSh.VrUT7xXZd8eu9irL65gJVQmz.ammgxmSBVt22oHj.a				2026-05-02 10:45:41.738418	2026-05-02 10:45:41.738422	t	\N
23	test_login_3bc3aa	test_login_3bc3aa@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@702c86	$2b$12$SdoeetW0Brau4OOhrCfBH.0YzgVPxrC4HjAlYMQ/ClHAGzovz8FH2				2026-05-02 10:45:41.930826	2026-05-02 10:45:41.93083	t	\N
24	test_dup_9f6aa5	test_dup_9f6aa5@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@e924e4	$2b$12$yOi/OcWEYc2l6fQ18yhe6eAxMM8o13FIqC4BX2ovHPuojpf9m6MCm				2026-05-02 10:45:42.313413	2026-05-02 10:45:42.313417	t	\N
26	test_user_ec1f91	test_new_ec1f91@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@d7b7bc	$2b$12$Dtw.zfwAmQmYLRgix3B14e0IvOn/qDQ2.rKsdFBoHfnDree6Nt3nS				2026-05-02 11:49:55.830668	2026-05-02 11:49:55.830672	t	\N
27	test_login_0b44f0	test_login_0b44f0@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@41274f	$2b$12$18nEXmBRBM4rsM/Ue0t./evf3dtRVTKKK5NaipvnrUpoul5WkL/QO				2026-05-02 11:49:56.023577	2026-05-02 11:49:56.02358	t	\N
28	test_dup_2c3fb1	test_dup_2c3fb1@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@176659	$2b$12$PfyLowJ9zkCYBDaOdLTWau4OHKc8ZKvC9yxrOt8jjUQpVMg4W2vyO				2026-05-02 11:49:56.40508	2026-05-02 11:49:56.405083	t	\N
30	test_user_956268	test_new_956268@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@44a2e0	$2b$12$Qfnfwjrp0gxk2Q4b098Xfut35KrBXHjHoGp1dpEIcAq8Z.SyUYeZe				2026-05-02 12:08:41.715858	2026-05-02 12:08:41.715861	t	\N
31	test_login_b25bbd	test_login_b25bbd@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@8fdf6c	$2b$12$iTfMP/KCs0RbVYp5CYYjpO1GH2vH52cd3HjRKfDOL01L5q4k8IDey				2026-05-02 12:08:41.908386	2026-05-02 12:08:41.908389	t	\N
32	test_dup_924ecc	test_dup_924ecc@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@5d9a9d	$2b$12$UcXtdgeZHf/hkXKYd0qbWem.j2Y0hI/m0YJOP9XnyOwY7zNC2BwHS				2026-05-02 12:08:42.288463	2026-05-02 12:08:42.288466	t	\N
34	test_user_941fce	test_new_941fce@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@c09d5f	$2b$12$2bklSYB3bJrxNfSqs722n.tl1MMY/1aJoRcqAJND8TBb2ymqCup/W				2026-05-02 12:39:59.808298	2026-05-02 12:39:59.808302	t	\N
35	test_login_05a0be	test_login_05a0be@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@7b9155	$2b$12$YrulduaM6HY0U1sRS1s3Jub7v3zyZpkUVztwiJVgWiYOH8/E4lbBu				2026-05-02 12:40:00.001804	2026-05-02 12:40:00.001807	t	\N
36	test_dup_c15f44	test_dup_c15f44@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@ce78f4	$2b$12$VyMoTj4sEeFPDOmq6IQRwObaeecUeqaa7.31eboXz15vZdv7dR.wW				2026-05-02 12:40:00.388285	2026-05-02 12:40:00.388288	t	\N
38	test_user_d437fa	test_new_d437fa@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@e14654	$2b$12$sAsKP/usIw5miLLOHSRDeOSI7zyTV4FUFFc3p9jIwlGwU4cV4b8s2				2026-05-02 13:17:02.113132	2026-05-02 13:17:02.113136	t	\N
39	test_login_3c0224	test_login_3c0224@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@9cd85e	$2b$12$NideTR6wPAIgc3awmiabSuGQHmes0N4tN3qYAqMGdEAWtJFumyKEK				2026-05-02 13:17:02.306501	2026-05-02 13:17:02.306504	t	\N
40	test_dup_79d14a	test_dup_79d14a@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@7e3f9b	$2b$12$4JotrHkUmbXtQEPzE0f/qud9QMaitnvo0smOwSln9CjlwAxT5Nhy6				2026-05-02 13:17:02.694842	2026-05-02 13:17:02.694846	t	\N
12	test_login_c55806	test_login_c55806@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@36aebc	$2b$12$7DsSxrFh269PzuS7fGL8yOkotnI2DIKNmpMQO0Y.wekPUbjlp2/jK				2026-05-02 10:42:53.76496	2026-05-02 10:42:53.764964	t	13245235125435
42	test_user_8bc101	test_new_8bc101@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@d07a3a	$2b$12$5uZmQpNCTlTvv35palmWLeHZlRFWwCP30FL4C4F3CM0ypF4zfVQ0W				2026-05-02 13:30:27.687578	2026-05-02 13:30:27.687583	t	\N
43	test_login_8a3cb5	test_login_8a3cb5@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@6949bf	$2b$12$leav4aDnZ0Tvm54gGjF35.ObG3pcmYwjiJylDUOMZO6AcpU/.smFe				2026-05-02 13:30:27.879133	2026-05-02 13:30:27.879137	t	\N
44	test_dup_f834db	test_dup_f834db@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@77c182	$2b$12$jXswb4WW31aViFd/jgP/2.qgrSdbOPb/cOUN26DamdRw3XYugQ1Yy				2026-05-02 13:30:28.260494	2026-05-02 13:30:28.260497	t	\N
46	test_user_b4bc4b	test_new_b4bc4b@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@64fb90	$2b$12$4n6n0cqsQaU20UcfMhvyZeOTukFGckjfhBTadJ5PLlDvPvEvp2KBa				2026-05-02 13:39:56.593938	2026-05-02 13:39:56.593942	t	\N
47	test_login_cb334a	test_login_cb334a@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@b3dc50	$2b$12$7BxTpcyLSxIswCnEi0cnYO5Fc14hmTpDbq9sYOlxxr1rkcaB8pqUa				2026-05-02 13:39:56.794239	2026-05-02 13:39:56.794242	t	\N
48	test_dup_76c159	test_dup_76c159@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@38d19e	$2b$12$dBdjyw/ZOz7cqkC926iXUuK59QkMR52zieU3N86B9clYE9AmK2EZW				2026-05-02 13:39:57.194235	2026-05-02 13:39:57.194238	t	\N
50	sd 	chane.pe2016@yandex.ru	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@a31aa1	$2b$12$vv9xCMmH7NJ/hqCFZrBpwOlB62tt0QAyc/CMY/O/jEiPXjENsu0ru				2026-05-03 08:10:39.157046	2026-05-03 08:10:39.15705	t	\N
11	test_user_b10226	test_new_b10226@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@db4718	$2b$12$QKuvBiAMCGvpAk6TDqGFeOYq1OEn47gnYcQ6YfTSgkZVz.iYdqley				2026-05-02 10:42:03.419224	2026-05-02 10:42:03.419228	t	82375826357236
51	test	[EMAIL_ADDRESS]	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@78b21e	[PASSWORD]				2026-05-03 12:28:01.583609	2026-05-03 12:28:01.583613	t	\N
52	test1	[EMAIL_ADDRESS]1	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@8194ed	[PASSWORD]				2026-05-03 12:28:01.776389	2026-05-03 12:28:01.776392	t	\N
53	test_user_1ff365	test_new_1ff365@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@75dbc7	$2b$12$8foZ02WMpCLobvXKUHhyv.AJjHWQDwgtTuhiHazLQWuOQPqa3WpFC				2026-05-03 12:28:02.31755	2026-05-03 12:28:02.317553	t	\N
54	test_login_c80cb7	test_login_c80cb7@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@e82e09	$2b$12$utdTbr8XR36RdkqIHT7Yl.g//3.e1PASv4ygbvsC/Kcm23VuTI9TW				2026-05-03 12:28:02.559543	2026-05-03 12:28:02.559546	t	\N
55	test_dup_e73df1	test_dup_e73df1@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@4d1189	$2b$12$KCUTbAWmti5F.P.PZGbG0OwO26.RqLFhJJyWX4HjVMurBWvZM6Eqe				2026-05-03 12:28:03.023845	2026-05-03 12:28:03.023848	t	\N
59	test_user_21af4e	test_new_21af4e@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@722ce2	$2b$12$KSUuT1gc.t8KVHNtbTnodej8zwVkMKMxtOSiscWiT4i/c58dr9w0m				2026-05-03 12:33:35.775845	2026-05-03 12:33:35.775848	t	\N
60	test_login_573e3f	test_login_573e3f@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@ed16c0	$2b$12$P8r7zTI6CAuMvI4aNIQjsunX8zRsveG7MlWxGEU5E9m5TtJY3.VMq				2026-05-03 12:33:36.019455	2026-05-03 12:33:36.019459	t	\N
61	test_dup_113cef	test_dup_113cef@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@0cbe0c	$2b$12$kdfpzqw.TusmiJP7iwE8WOXthj7z6W1iWfI.HWIVsC8DQAtFzIdy.				2026-05-03 12:33:36.486614	2026-05-03 12:33:36.486617	t	\N
67	test_user_c35743	test_new_c35743@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@ed013b	$2b$12$dgm0tCn9kXty1TcyrnJB.OlO6h3c3UL94vjehkf923Kd0Mr2I8mOO				2026-05-03 12:34:25.169156	2026-05-03 12:34:25.169159	t	\N
68	test_login_d5612c	test_login_d5612c@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@f94f64	$2b$12$Z6VkJewfyTCR.CC1oi0Ed.xT/YaC5Z5BMzTIPZfZqgkedpU1s63Nq				2026-05-03 12:34:25.417198	2026-05-03 12:34:25.417202	t	\N
69	test_dup_6732d7	test_dup_6732d7@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@a6172e	$2b$12$Y5DWVfWIg1t5XSCsD1OMiePoT2uL1avZSiqFRKYtEOoG3dRSVkml6				2026-05-03 12:34:25.882074	2026-05-03 12:34:25.882077	t	\N
71	test_ee0217	test_new_ee0217@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@e9368f	[PASSWORD]				2026-05-03 12:36:14.231906	2026-05-03 12:36:14.231909	t	\N
72	test1_7392c9	test_new_7392c9@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@e98bf7	[PASSWORD]				2026-05-03 12:36:14.419496	2026-05-03 12:36:14.4195	t	\N
74	pilot-c11b3f	pilot-c11b3f@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@30301b					2026-05-03 15:26:20.656316	2026-05-03 15:26:20.656321	t	c11b3f778908505c55e628b76d744f9ef243e98c6f84efb5bf8845f3eefdd19d
75	pilot-d3c89c	pilot-d3c89c@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@27e03d					2026-05-03 15:26:48.649727	2026-05-03 15:26:48.649732	t	d3c89c4ea9c2616dada2f3818c637acd252f2cf35e0160525ff043aed62f7183
76	test_58fe11	test_new_58fe11@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@2f7530	[PASSWORD]				2026-05-03 15:27:12.282514	2026-05-03 15:27:12.282519	t	\N
77	test1_068015	test_new_068015@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@52ba2a	[PASSWORD]				2026-05-03 15:27:12.500947	2026-05-03 15:27:12.50095	t	\N
78	test_user_653033	test_new_653033@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@ddd9ff	$2b$12$x0JTzcDPz4ito20NSxvhyOLp.uzoaYzdSGtrNHU5rDK6Fsuy6J2JK				2026-05-03 15:27:13.074704	2026-05-03 15:27:13.074708	t	\N
79	test_login_16ebfe	test_login_16ebfe@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@aadee7	$2b$12$qUGC6b/50MFKfNly.2wGD.1slW352Tn7kTEDwJuhxAburp4xoL/ru				2026-05-03 15:27:13.324723	2026-05-03 15:27:13.324726	t	\N
80	test_dup_7d2736	test_dup_7d2736@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@0c6930	$2b$12$zAlKmHFZ.zEYzyJlVoBjXunl27WxBHao9k3FpIXekQxPHZI2f3hdW				2026-05-03 15:27:13.801896	2026-05-03 15:27:13.801899	t	\N
82	pilot-2ca1ed	pilot-2ca1ed@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@502058					2026-05-03 15:29:57.417538	2026-05-03 15:29:57.417543	t	2ca1ed480b2bba176606d5871328f417f4978ec2967d7504b5ca180661503435
83	pilot-fdbf53	pilot-fdbf53@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@fe945b					2026-05-03 15:33:05.475218	2026-05-03 15:33:05.475223	t	fdbf534aedafb4aac4f18720b81a1574f0740cfb1ddf52b4601d03114bc18103
84	pilot-6ff571	pilot-6ff571@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@1cfbc0					2026-05-03 15:33:49.086273	2026-05-03 15:33:49.086278	t	6ff571392f8a0288118c6137312f2047d10d990ff060a510146e47dbc5b64ba2
85	pilot-a2bf66	pilot-a2bf66@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@cd4d0c					2026-05-03 15:47:30.066776	2026-05-03 15:47:30.066781	t	a2bf662f36cc48327026eddc2f8e794edda62c7b8e71ead5387e378fff22829e
86	test_576201	test_new_576201@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@4c93bb	[PASSWORD]				2026-05-03 15:59:21.091947	2026-05-03 15:59:21.091951	t	\N
87	test1_746177	test_new_746177@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@0753ac	[PASSWORD]				2026-05-03 15:59:21.302318	2026-05-03 15:59:21.302322	t	\N
88	test_user_fdd3e8	test_new_fdd3e8@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@1f90ba	$2b$12$1RhqiUpQMmU.631BmbIeBew9UcodtckUDFq3WfNLkP0zaUnUq.B9i				2026-05-03 15:59:21.857404	2026-05-03 15:59:21.857413	t	\N
89	test_login_32e242	test_login_32e242@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@837dce	$2b$12$QpPt2yvoF6NZHHbfVQ2z5OAUbyqPIWeDA/0tF3gPi5eWo0Zh9APli				2026-05-03 15:59:22.109616	2026-05-03 15:59:22.109619	t	\N
90	test_dup_faf87a	test_dup_faf87a@gmail.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@504397	$2b$12$EgdXVlLSUHb8bDZUlQiBu.c99iaHRXl.E8aVaCA5EeTirAPtPnHfW				2026-05-03 15:59:22.587111	2026-05-03 15:59:22.587115	t	\N
92	test_pilot	test@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@test12	test_password				2026-05-05 12:55:14.433837	2026-05-05 12:55:14.433841	t	test_public_key_123
95	pilot-0xe46C	pilot-0xe46C@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@78ea01					2026-05-05 13:13:55.265558	2026-05-05 13:13:55.265562	t	0xe46C8eA157aa8961E3ea092acd82ce642922705A
96	pilot-0x8fBA	pilot-0x8fBA@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@43b534					2026-05-05 13:15:20.846224	2026-05-05 13:15:20.846228	t	0x8fBA016EAc8d3ff9eB6B8a81BcC17FBDeC145670
97	pilot-944f93	pilot-944f93@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@204345					2026-05-05 13:17:31.374294	2026-05-05 13:17:31.374298	t	0x944f93145E45588726D1DfAC65dFb247169d9728
98	pilot-Ff3668	pilot-Ff3668@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@a686a8					2026-05-05 13:31:17.654979	2026-05-05 13:31:17.654983	t	0xFf366866cdFA8b23B191B66A1a449B346E88e2A8
99	pilot-8DDa7f	pilot-8DDa7f@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@e60e25					2026-05-05 13:32:20.599374	2026-05-05 13:32:20.599378	t	0x8DDa7f64B6ea16e93eCa25041a5d465e90351d24
100	pilot-9F8FaE	pilot-9F8FaE@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@deb60c					2026-05-05 14:07:50.990861	2026-05-05 14:07:50.990866	t	0x9F8FaE24F081Dd4F78b4a8BB61FFc66d48487D21
101	pilot-8C7637	pilot-8C7637@pilot.com	user	¦Ý¦¦TÂ ¦-¦¬¦¬TÁ¦-¦-¦¬TÏ	@8e939f					2026-05-05 18:45:07.166237	2026-05-05 18:45:07.166244	t	0x8C763736309c76dD6BD23051dFb631e094f3E106
\.


--
-- Data for Name: users_skills; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users_skills (id, user_id, skill_name, level, created_at, updated_at) FROM stdin;
\.


--
-- Name: lesson_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lesson_likes_id_seq', 1, false);


--
-- Name: lesson_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lesson_rank_id_seq', 1, false);


--
-- Name: lesson_sheets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lesson_sheets_id_seq', 24, true);


--
-- Name: lesson_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lesson_tags_id_seq', 1, false);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lessons_id_seq', 51, true);


--
-- Name: registed_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.registed_users_id_seq', 1, true);


--
-- Name: user_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_lessons_id_seq', 1, true);


--
-- Name: user_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_progress_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 101, true);


--
-- Name: users_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_skills_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: lesson_likes lesson_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_likes
    ADD CONSTRAINT lesson_likes_pkey PRIMARY KEY (id);


--
-- Name: lesson_rank lesson_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_rank
    ADD CONSTRAINT lesson_rank_pkey PRIMARY KEY (id);


--
-- Name: lesson_sheets lesson_sheets_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_sheets
    ADD CONSTRAINT lesson_sheets_pkey PRIMARY KEY (id);


--
-- Name: lesson_tags lesson_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_tags
    ADD CONSTRAINT lesson_tags_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_lesson_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_lesson_name_key UNIQUE (lesson_name);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: registed_users registed_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.registed_users
    ADD CONSTRAINT registed_users_pkey PRIMARY KEY (id);


--
-- Name: user_lessons user_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_lessons
    ADD CONSTRAINT user_lessons_pkey PRIMARY KEY (id);


--
-- Name: user_progress user_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_progress
    ADD CONSTRAINT user_progress_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_public_key_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_public_key_key UNIQUE (public_key);


--
-- Name: users_skills users_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users_skills
    ADD CONSTRAINT users_skills_pkey PRIMARY KEY (id);


--
-- Name: users users_tag_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_tag_key UNIQUE (tag);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: lesson_likes lesson_likes_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_likes
    ADD CONSTRAINT lesson_likes_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: lesson_likes lesson_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_likes
    ADD CONSTRAINT lesson_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: lesson_rank lesson_rank_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_rank
    ADD CONSTRAINT lesson_rank_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: lesson_rank lesson_rank_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_rank
    ADD CONSTRAINT lesson_rank_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: lesson_sheets lesson_sheets_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_sheets
    ADD CONSTRAINT lesson_sheets_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: lesson_sheets lesson_sheets_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_sheets
    ADD CONSTRAINT lesson_sheets_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.lessons(id);


--
-- Name: lesson_tags lesson_tags_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lesson_tags
    ADD CONSTRAINT lesson_tags_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: lessons lessons_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: registed_users registed_users_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.registed_users
    ADD CONSTRAINT registed_users_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: registed_users registed_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.registed_users
    ADD CONSTRAINT registed_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_lessons user_lessons_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_lessons
    ADD CONSTRAINT user_lessons_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: user_lessons user_lessons_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_lessons
    ADD CONSTRAINT user_lessons_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_progress user_progress_slide_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_progress
    ADD CONSTRAINT user_progress_slide_id_fkey FOREIGN KEY (slide_id) REFERENCES public.lesson_sheets(id);


--
-- Name: user_progress user_progress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_progress
    ADD CONSTRAINT user_progress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_skills users_skills_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users_skills
    ADD CONSTRAINT users_skills_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict umuVgEIKFhNk7MggLDMJYDhSwSZDU8TrKBc35aIZtRBcsZfwDuj6oqfFrodSzsc

