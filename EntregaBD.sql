--
-- PostgreSQL database dump
--

\restrict FGMoPdVvNYhiWPokylkyUhvbx39u8jdShPAtXKW9HUSvoyXAeCzp9qB0a5h3FoV

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-19 15:03:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 230 (class 1259 OID 16764)
-- Name: clase_grupal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase_grupal (
    id_clase integer NOT NULL,
    nombre character varying(50) NOT NULL,
    dia_semana character varying(15) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    id_entrenador integer NOT NULL,
    estado character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_estado_clase CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[]))),
    CONSTRAINT clase_grupal_cupo_check CHECK ((cupo > 0))
);


ALTER TABLE public.clase_grupal OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16763)
-- Name: clase_grupal_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clase_grupal_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clase_grupal_id_clase_seq OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 229
-- Name: clase_grupal_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clase_grupal_id_clase_seq OWNED BY public.clase_grupal.id_clase;


--
-- TOC entry 224 (class 1259 OID 16706)
-- Name: entrenador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenador (
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100) NOT NULL,
    correo character varying(100) NOT NULL
);


ALTER TABLE public.entrenador OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16705)
-- Name: entrenador_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenador_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenador_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 223
-- Name: entrenador_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenador_id_entrenador_seq OWNED BY public.entrenador.id_entrenador;


--
-- TOC entry 226 (class 1259 OID 16719)
-- Name: ficha_medica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ficha_medica (
    id_ficha integer NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(4,2) NOT NULL,
    lesiones text,
    id_socio integer NOT NULL,
    CONSTRAINT ficha_medica_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT ficha_medica_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.ficha_medica OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16718)
-- Name: ficha_medica_id_ficha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ficha_medica_id_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ficha_medica_id_ficha_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 225
-- Name: ficha_medica_id_ficha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ficha_medica_id_ficha_seq OWNED BY public.ficha_medica.id_ficha;


--
-- TOC entry 232 (class 1259 OID 16783)
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion (
    id_inscripcion integer NOT NULL,
    fecha_inscripcion date NOT NULL,
    id_socio integer NOT NULL,
    id_clase integer NOT NULL
);


ALTER TABLE public.inscripcion OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16782)
-- Name: inscripcion_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripcion_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripcion_id_inscripcion_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 231
-- Name: inscripcion_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_id_inscripcion_seq OWNED BY public.inscripcion.id_inscripcion;


--
-- TOC entry 228 (class 1259 OID 16741)
-- Name: membresia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresia (
    id_membresia integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    id_socio integer NOT NULL,
    id_plan integer NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT membresia_check CHECK ((fecha_fin >= fecha_inicio)),
    CONSTRAINT membresia_fecha_fin_check CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT membresia_valor_pagado_check CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresia OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16740)
-- Name: membresia_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresia_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresia_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 227
-- Name: membresia_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresia_id_membresia_seq OWNED BY public.membresia.id_membresia;


--
-- TOC entry 234 (class 1259 OID 24706)
-- Name: ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ocupacion_clases AS
 SELECT c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.id_inscripcion) AS inscritos
   FROM (public.clase_grupal c
     LEFT JOIN public.inscripcion i ON ((c.id_clase = i.id_clase)))
  WHERE ((c.estado)::text = 'activa'::text)
  GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.ocupacion_clases OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16691)
-- Name: plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan (
    id_plan integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion_meses integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT plan_duracion_meses_check CHECK ((duracion_meses > 0)),
    CONSTRAINT plan_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.plan OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16690)
-- Name: plan_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plan_id_plan_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 221
-- Name: plan_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_id_plan_seq OWNED BY public.plan.id_plan;


--
-- TOC entry 220 (class 1259 OID 16676)
-- Name: socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socio (
    id_socio integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    correo character varying(100),
    acepta_whatsapp boolean DEFAULT false NOT NULL
);


ALTER TABLE public.socio OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16675)
-- Name: socio_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socio_id_socio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socio_id_socio_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 219
-- Name: socio_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socio_id_socio_seq OWNED BY public.socio.id_socio;


--
-- TOC entry 233 (class 1259 OID 24701)
-- Name: socios_vencidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.socios_vencidos AS
 SELECT s.nombre AS socio,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS ultima_fecha_fin
   FROM (public.socio s
     JOIN public.membresia m ON ((s.id_socio = m.id_socio)))
  GROUP BY s.id_socio, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.socios_vencidos OWNER TO postgres;

--
-- TOC entry 4799 (class 2604 OID 16767)
-- Name: clase_grupal id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal ALTER COLUMN id_clase SET DEFAULT nextval('public.clase_grupal_id_clase_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 16709)
-- Name: entrenador id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenador ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenador_id_entrenador_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 16722)
-- Name: ficha_medica id_ficha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica ALTER COLUMN id_ficha SET DEFAULT nextval('public.ficha_medica_id_ficha_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 16786)
-- Name: inscripcion id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripcion_id_inscripcion_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 16744)
-- Name: membresia id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresia ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresia_id_membresia_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 16694)
-- Name: plan id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan ALTER COLUMN id_plan SET DEFAULT nextval('public.plan_id_plan_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16679)
-- Name: socio id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio ALTER COLUMN id_socio SET DEFAULT nextval('public.socio_id_socio_seq'::regclass);


--
-- TOC entry 5005 (class 0 OID 16764)
-- Dependencies: 230
-- Data for Name: clase_grupal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clase_grupal (id_clase, nombre, dia_semana, hora, cupo, id_entrenador, estado) FROM stdin;
1	Spinning Intenso	Lunes	07:00:00	15	1	activa
3	Rumba Aeróbica	Viernes	17:30:00	20	1	activa
4	Yoga Matutino Express	Sábado	09:00:00	3	2	activa
2	Yoga Restaurativo	Miércoles	18:00:00	12	2	suspendida
5	Pilates	Viernes	18:00:00	12	1	activa
\.


--
-- TOC entry 4999 (class 0 OID 16706)
-- Dependencies: 224
-- Data for Name: entrenador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenador (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Carlos Alberto Ruiz	Spinning y Cardio	carlos.ruiz@cuerpoactivo.com
2	Laura Cristina Vélez	Yoga y Pilates	laura.velez@cuerpoactivo.com
3	Jorge Iván Salazar	CrossFit y Funcional	jorge.salazar@cuerpoactivo.com
\.


--
-- TOC entry 5001 (class 0 OID 16719)
-- Dependencies: 226
-- Data for Name: ficha_medica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ficha_medica (id_ficha, peso, estatura, lesiones, id_socio) FROM stdin;
1	62.50	1.65	Ninguna	1
2	78.00	1.78	Esguince leve de tobillo derecho en 2024	2
3	55.20	1.60	\N	3
4	84.50	1.82	Lumbalgia crónica controlada	4
\.


--
-- TOC entry 5007 (class 0 OID 16783)
-- Dependencies: 232
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion (id_inscripcion, fecha_inscripcion, id_socio, id_clase) FROM stdin;
1	2026-11-02	1	1
2	2026-11-03	1	2
3	2026-11-04	1	4
4	2026-11-04	2	4
5	2026-11-05	3	4
6	2026-11-06	2	1
7	2026-11-07	3	3
8	2026-11-08	4	1
9	2026-11-09	4	3
10	2026-11-10	5	2
11	2026-11-05	3	1
12	2026-11-06	4	1
13	2026-11-07	5	1
14	2026-11-08	6	1
15	2026-11-19	1	5
\.


--
-- TOC entry 5003 (class 0 OID 16741)
-- Dependencies: 228
-- Data for Name: membresia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresia (id_membresia, fecha_inicio, fecha_fin, id_socio, id_plan, valor_pagado) FROM stdin;
1	2026-08-01	2026-09-01	1	1	80000.00
2	2026-11-01	2027-02-01	1	2	210000.00
3	2026-10-15	2026-11-15	2	1	70000.00
5	2026-05-01	2026-08-01	3	2	80000.00
6	2026-01-10	2027-01-10	4	3	210000.00
7	2026-11-05	2026-12-05	5	1	750000.00
8	2026-09-01	2026-12-01	6	2	80000.00
9	2026-09-15	2026-10-15	1	1	80000.00
10	2026-10-16	2026-11-16	1	1	80000.00
11	2026-09-01	2026-10-01	3	2	200000.00
12	2026-11-02	2026-12-02	4	1	80000.00
13	2026-11-10	2027-02-10	5	2	210000.00
14	2026-10-05	2026-11-05	6	1	75000.00
\.


--
-- TOC entry 4997 (class 0 OID 16691)
-- Dependencies: 222
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan (id_plan, nombre, duracion_meses, precio) FROM stdin;
1	Mensual	1	85000.00
2	Trimestral	3	225000.00
3	Anual	12	780000.00
\.


--
-- TOC entry 4995 (class 0 OID 16676)
-- Dependencies: 220
-- Data for Name: socio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socio (id_socio, numero_documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
2	1035892341	Andrés Felipe Gómez	3112345678	andres.gomez@correo.com	f
4	1017234561	Sebastián Toro	3156789012	sebastian.toro@correo.com	f
6	1040987123	Mateo Cardona	3187654321	\N	f
1	1020456789	Camila Restrepo	3009876543	camila.restrepo@correo.com	t
3	43987654	Mariana López	3209876543	mariana.lopez@correo.com	t
5	71345678	Valentina Mejía	3012349876	valentina.mejia@correo.com	t
15	1098765431	Laura Mendoza	3112223344	laura.m@correo.com	t
16	1098765432	Carlos Ruiz	3223334455	\N	f
\.


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 229
-- Name: clase_grupal_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clase_grupal_id_clase_seq', 5, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 223
-- Name: entrenador_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenador_id_entrenador_seq', 3, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 225
-- Name: ficha_medica_id_ficha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ficha_medica_id_ficha_seq', 6, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 231
-- Name: inscripcion_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_id_inscripcion_seq', 15, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 227
-- Name: membresia_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresia_id_membresia_seq', 14, true);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: plan_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_id_plan_seq', 3, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 219
-- Name: socio_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socio_id_socio_seq', 16, true);


--
-- TOC entry 4832 (class 2606 OID 24617)
-- Name: clase_grupal clase_grupal_id_entrenador_dia_semana_hora_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal
    ADD CONSTRAINT clase_grupal_id_entrenador_dia_semana_hora_key UNIQUE (id_entrenador, dia_semana, hora);


--
-- TOC entry 4834 (class 2606 OID 16776)
-- Name: clase_grupal clase_grupal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal
    ADD CONSTRAINT clase_grupal_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4822 (class 2606 OID 16717)
-- Name: entrenador entrenador_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenador
    ADD CONSTRAINT entrenador_correo_key UNIQUE (correo);


--
-- TOC entry 4824 (class 2606 OID 16715)
-- Name: entrenador entrenador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenador
    ADD CONSTRAINT entrenador_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4826 (class 2606 OID 16734)
-- Name: ficha_medica ficha_medica_id_socio_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica
    ADD CONSTRAINT ficha_medica_id_socio_key UNIQUE (id_socio);


--
-- TOC entry 4828 (class 2606 OID 16732)
-- Name: ficha_medica ficha_medica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica
    ADD CONSTRAINT ficha_medica_pkey PRIMARY KEY (id_ficha);


--
-- TOC entry 4836 (class 2606 OID 16794)
-- Name: inscripcion inscripcion_id_socio_id_clase_fecha_inscripcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_id_socio_id_clase_fecha_inscripcion_key UNIQUE (id_socio, id_clase, fecha_inscripcion);


--
-- TOC entry 4838 (class 2606 OID 16792)
-- Name: inscripcion inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_pkey PRIMARY KEY (id_inscripcion);


--
-- TOC entry 4830 (class 2606 OID 16752)
-- Name: membresia membresia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4818 (class 2606 OID 16704)
-- Name: plan plan_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_nombre_key UNIQUE (nombre);


--
-- TOC entry 4820 (class 2606 OID 16702)
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4812 (class 2606 OID 16689)
-- Name: socio socio_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_correo_key UNIQUE (correo);


--
-- TOC entry 4814 (class 2606 OID 16687)
-- Name: socio socio_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_numero_documento_key UNIQUE (numero_documento);


--
-- TOC entry 4816 (class 2606 OID 16685)
-- Name: socio socio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_pkey PRIMARY KEY (id_socio);


--
-- TOC entry 4842 (class 2606 OID 16777)
-- Name: clase_grupal clase_grupal_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal
    ADD CONSTRAINT clase_grupal_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenador(id_entrenador);


--
-- TOC entry 4839 (class 2606 OID 24618)
-- Name: ficha_medica ficha_medica_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica
    ADD CONSTRAINT ficha_medica_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socio(id_socio) ON DELETE CASCADE;


--
-- TOC entry 4843 (class 2606 OID 24628)
-- Name: inscripcion inscripcion_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clase_grupal(id_clase) ON DELETE CASCADE;


--
-- TOC entry 4844 (class 2606 OID 24623)
-- Name: inscripcion inscripcion_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socio(id_socio) ON DELETE CASCADE;


--
-- TOC entry 4840 (class 2606 OID 16758)
-- Name: membresia membresia_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.plan(id_plan);


--
-- TOC entry 4841 (class 2606 OID 16753)
-- Name: membresia membresia_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socio(id_socio);


-- Completed on 2026-11-19 15:03:59

--
-- PostgreSQL database dump complete
--

\unrestrict FGMoPdVvNYhiWPokylkyUhvbx39u8jdShPAtXKW9HUSvoyXAeCzp9qB0a5h3FoV

