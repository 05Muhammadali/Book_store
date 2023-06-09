--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO saeed;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO saeed;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO saeed;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO saeed;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO saeed;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO saeed;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: books_book; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.books_book (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    sales_price integer NOT NULL,
    best_seller boolean NOT NULL,
    pub_year integer,
    page_size integer NOT NULL,
    file character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    lang character varying(50) NOT NULL,
    author_id bigint NOT NULL,
    category_id bigint NOT NULL,
    slug character varying(50),
    CONSTRAINT books_book_page_size_check CHECK ((page_size >= 0)),
    CONSTRAINT books_book_pub_year_check CHECK ((pub_year >= 0)),
    CONSTRAINT books_book_sales_price_check CHECK ((sales_price >= 0))
);


ALTER TABLE public.books_book OWNER TO saeed;

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.books_book ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: books_bookauthor; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.books_bookauthor (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer
);


ALTER TABLE public.books_author OWNER TO saeed;

--
-- Name: books_bookauthor_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.books_author ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.books_bookauthor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: books_category; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.books_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50)
);


ALTER TABLE public.books_category OWNER TO saeed;

--
-- Name: books_category_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.books_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.books_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO saeed;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO saeed;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO saeed;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: saeed
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: saeed
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO saeed;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add book author	7	add_bookauthor
26	Can change book author	7	change_bookauthor
27	Can delete book author	7	delete_bookauthor
28	Can view book author	7	view_bookauthor
29	Can add category	8	add_category
30	Can change category	8	change_category
31	Can delete category	8	delete_category
32	Can view category	8	view_category
33	Can add book	9	add_book
34	Can change book	9	change_book
35	Can delete book	9	delete_book
36	Can view book	9	view_book
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$600000$kbco1uCwI83jYNWvyCVDch$TAZEq2cS+z8k48vwc5sVL2ROWHcQJjlY4PQpUCE1S/g=	2023-04-05 18:05:24.156534+05	t	saydullo			tukhtasinov@hotmail.com	t	t	2023-04-05 18:04:58.918945+05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: books_book; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.books_book (id, title, description, price, sales_price, best_seller, pub_year, page_size, file, image, lang, author_id, category_id, slug) FROM stdin;
1	Молхона	Жорж Оруэлл (ингл. George Orwell, ҳақиқий исми-шарифи Эрик Артур Блэр) — инглиз ёзувчиси бўлиб, ғайрихаёлий «1984» романи  ва «Молхона» ривоят-қиссасининг муаллифидир. \r\nЖорж Оруэлл «Молхона» асарини 1943 йил ноябридан то 1944  йил февралигача ёзган ва 1945 йил августида эълон қилган. Китобни ҳар бир инсон ўқиши ва мулоҳаза қилиши лозим: нега бу дунёмиз шундай, у аслида қандай бўлиши керак...  \r\n"Молхона“ жаҳон адабиёти тарихидаги энг муваффақиятли ва баҳсли асарлардан бири ҳисобланади. Асар ғоясидан келиб чиқиб асосий намуна сифатида СССР олинганлигини фараз қилиш мумкин.	45000	40000	t	2019	100	photo4.webp	photo4_up6xv6o.webp	uzbek	1	1	badiy-molxona
2	Катта ўйин. Икки империя тўқнашуви	«Питер Ҳопкирк қўл урадиган ҳар бир ҳикоя бутунлай ўзига жалб қилади»\r\n— The Washington Post газетаси\r\n\r\nМарказий Осиёнинг бугунги харитасини чизиб берган «Катта ўйин» ҳақида эшитганмисиз? Бу минтақадаги хонликларни ўзига вассал ва мустамлакага айлантириш учун икки қудратли империя — Чор Россияси ва Британия ўртасида кечган кураш «Катта ўйин»га асос бўлди.	50000	45000	f	2022	744	photo3.webp	photo3_mKwF6uQ.webp	uzbek	1	1	badiy-katta-oyin
3	Мамлакатлар таназзули сабаблари: қудрат, фаровонлик ва камбағаллик манбалари	Ажойиб ва қизиқарли ёзилган «Мамлакатлар таназзули сабаблари» асари асрлар давомида мутахассисларни ҳайратда қолдирган саволга ишончли ва изчил асосланган янги назария билан жавоб беради: Нега баъзи мамлакатлар бой ва бошқалар камбағал, бойлик ва қашшоқлик, соғлиқ ва касаллик, озиқ-овқат ва очарчилик бўйича бўлинган?	100000	90000	f	2021	672	photo2.webp	photo2_hO3dC5H.webp	uzbek	1	1	badiy-mamlakat-tannazul-sabablari
4	Латте омили. Молиявий мустақиллик ва эркин ҳаёт сари	Бадавлат бўлмай туриб ҳам бой яшаш мумкинми? Албатта, мумкин. Бунинг учун маошингизни оширишларини, лотереяга ютуқ чиқиши ёки кутилмаган хазина топиб олишни кутишга ҳожат йўқ.\r\n\r\nКўпчилик бир умр бошқаларни бой қилиш учун ишлаганини жуда кеч тушунади. Натижада ўзини ҳеч қачон бадавлат бўлолмайдиган муҳтож одамдек ҳис этиб, барча истакларини ноаниқ муддатга ортга суради...\r\n\r\nУшбу китоб қаҳрамони ҳам "Қурбим етмайди" дея кўп нарсада, ҳатто орзуларида ҳам ўзига чекловлар қўйган. У тасодифан танишиб қолган кекса бариста эса қизга ўзи ўйлаганидан анча бадавлатроқ эканини тушунтириб беради.	110000	100000	t	2022	236	photo1.webp	photo1_R46h99m.webp	uzbek	1	1	badiy-latte-omili
\.


--
-- Data for Name: books_bookauthor; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.books_author (id, name, user_id) FROM stdin;
1	Jorch	1
\.


--
-- Data for Name: books_category; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.books_category (id, name, slug) FROM stdin;
1	Badiy	badiy
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-04-06 15:26:45.351011+05	1	Badiy	1	[{"added": {}}]	8	1
2	2023-04-06 15:30:40.959888+05	1	BookAuthor object (1)	1	[{"added": {}}]	7	1
3	2023-04-06 15:31:10.5812+05	1	Молхона - Badiy	1	[{"added": {}}]	9	1
4	2023-04-06 15:34:40.449429+05	2	Катта ўйин. Икки империя тўқнашуви - Badiy	1	[{"added": {}}]	9	1
5	2023-04-06 15:37:04.569679+05	3	Мамлакатлар таназзули сабаблари: қудрат, фаровонлик ва камбағаллик манбалари - Badiy	1	[{"added": {}}]	9	1
6	2023-04-06 16:50:22.135377+05	4	Латте омили. Молиявий мустақиллик ва эркин ҳаёт сари - Badiy	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	books	bookauthor
8	books	category
9	books	book
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-04-05 16:40:51.612419+05
2	auth	0001_initial	2023-04-05 16:40:51.680412+05
3	admin	0001_initial	2023-04-05 16:40:51.707498+05
4	admin	0002_logentry_remove_auto_add	2023-04-05 16:40:51.720361+05
5	admin	0003_logentry_add_action_flag_choices	2023-04-05 16:40:51.740092+05
6	contenttypes	0002_remove_content_type_name	2023-04-05 16:40:51.759206+05
7	auth	0002_alter_permission_name_max_length	2023-04-05 16:40:51.766626+05
8	auth	0003_alter_user_email_max_length	2023-04-05 16:40:51.773351+05
9	auth	0004_alter_user_username_opts	2023-04-05 16:40:51.780048+05
10	auth	0005_alter_user_last_login_null	2023-04-05 16:40:51.786247+05
11	auth	0006_require_contenttypes_0002	2023-04-05 16:40:51.789622+05
12	auth	0007_alter_validators_add_error_messages	2023-04-05 16:40:51.79739+05
13	auth	0008_alter_user_username_max_length	2023-04-05 16:40:51.809367+05
14	auth	0009_alter_user_last_name_max_length	2023-04-05 16:40:51.815777+05
15	auth	0010_alter_group_name_max_length	2023-04-05 16:40:51.824265+05
16	auth	0011_update_proxy_permissions	2023-04-05 16:40:51.830654+05
17	auth	0012_alter_user_first_name_max_length	2023-04-05 16:40:51.837903+05
18	sessions	0001_initial	2023-04-05 16:40:51.852663+05
21	books	0001_initial	2023-04-06 15:24:18.721666+05
22	books	0002_book_slug	2023-04-06 15:24:18.739869+05
23	books	0003_category_slug_alter_book_slug	2023-04-06 15:26:36.054614+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: saeed
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wczy3pzzwpafquvwyqypofmxhncy2z4f	.eJxVjDkOwjAUBe_iGlle8CempOcM0d-MAyiR4qRC3B0ipYD2zcx7mR7XpfZr07kfxJyNN4ffjZAfOm5A7jjeJsvTuMwD2U2xO232Ook-L7v7d1Cx1W_N6uSoQbkwUO4SO5UEFMGjzwQ-Yiguh468d_kklEEBGCWWwJJSNO8PAcY4Wg:1pk2pI:Gw5DB7pdbeNJW6TIbf9NrqERL01eKunxgQqFKCQAXcM	2023-04-19 18:05:24.159615+05
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.books_book_id_seq', 4, true);


--
-- Name: books_bookauthor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.books_bookauthor_id_seq', 1, true);


--
-- Name: books_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.books_category_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 6, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saeed
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: books_book books_book_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_pkey PRIMARY KEY (id);


--
-- Name: books_book books_book_slug_key; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_slug_key UNIQUE (slug);


--
-- Name: books_bookauthor books_bookauthor_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_author
    ADD CONSTRAINT books_bookauthor_pkey PRIMARY KEY (id);


--
-- Name: books_category books_category_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_category
    ADD CONSTRAINT books_category_pkey PRIMARY KEY (id);


--
-- Name: books_category books_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_category
    ADD CONSTRAINT books_category_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: books_book_author_id_8b91747b; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX books_book_author_id_8b91747b ON public.books_book USING btree (author_id);


--
-- Name: books_book_category_id_406d8649; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX books_book_category_id_406d8649 ON public.books_book USING btree (category_id);


--
-- Name: books_book_slug_a38a79a6_like; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX books_book_slug_a38a79a6_like ON public.books_book USING btree (slug varchar_pattern_ops);


--
-- Name: books_bookauthor_user_id_8520ef80; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX books_bookauthor_user_id_8520ef80 ON public.books_author USING btree (user_id);


--
-- Name: books_category_slug_14cd9338_like; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX books_category_slug_14cd9338_like ON public.books_category USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: saeed
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book books_book_author_id_8b91747b_fk_books_bookauthor_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_author_id_8b91747b_fk_books_bookauthor_id FOREIGN KEY (author_id) REFERENCES public.books_author (id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_book books_book_category_id_406d8649_fk_books_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_category_id_406d8649_fk_books_category_id FOREIGN KEY (category_id) REFERENCES public.books_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: books_bookauthor books_bookauthor_user_id_8520ef80_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.books_author
    ADD CONSTRAINT books_bookauthor_user_id_8520ef80_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saeed
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--