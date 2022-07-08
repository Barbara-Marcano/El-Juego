--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: cargos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargos (
    id_cargos integer NOT NULL,
    nombre_cargo character varying(20)
);


--
-- Name: cargos_id_cargos_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cargos_id_cargos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargos_id_cargos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cargos_id_cargos_seq OWNED BY public.cargos.id_cargos;


--
-- Name: demo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo (
    id integer NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    hint text DEFAULT ''::text NOT NULL
);


--
-- Name: demo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;


--
-- Name: empleados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empleados (
    id_empleados integer NOT NULL,
    nombre character varying(20),
    sexo character varying(20),
    edad integer NOT NULL,
    id_cargo integer NOT NULL,
    id_sede integer NOT NULL
);


--
-- Name: empleados_id_empleados_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.empleados_id_empleados_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empleados_id_empleados_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.empleados_id_empleados_seq OWNED BY public.empleados.id_empleados;


--
-- Name: jugador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jugador (
    id_jugador integer NOT NULL,
    nombre character varying(20),
    sexo character varying(20),
    edad integer,
    estatus character varying(20),
    id_empleado_encargado integer NOT NULL,
    id_sede integer NOT NULL
);


--
-- Name: jugador_id_jugador_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jugador_id_jugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jugador_id_jugador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jugador_id_jugador_seq OWNED BY public.jugador.id_jugador;


--
-- Name: jugadores_eliminados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jugadores_eliminados (
    id_jugador_eliminado integer NOT NULL,
    id_empleado_eliminacion integer NOT NULL,
    fecha_eliminacion date,
    id_sede_eliminacion integer NOT NULL
);


--
-- Name: jugadores_eliminados_id_jugador_eliminado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jugadores_eliminados_id_jugador_eliminado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jugadores_eliminados_id_jugador_eliminado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jugadores_eliminados_id_jugador_eliminado_seq OWNED BY public.jugadores_eliminados.id_jugador_eliminado;


--
-- Name: sede; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sede (
    id_sede integer NOT NULL,
    nombre_sede character varying(20),
    localizacion_sede character varying(20)
);


--
-- Name: sede_id_sede_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sede_id_sede_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sede_id_sede_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sede_id_sede_seq OWNED BY public.sede.id_sede;


--
-- Name: cargos id_cargos; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargos ALTER COLUMN id_cargos SET DEFAULT nextval('public.cargos_id_cargos_seq'::regclass);


--
-- Name: demo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);


--
-- Name: empleados id_empleados; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empleados ALTER COLUMN id_empleados SET DEFAULT nextval('public.empleados_id_empleados_seq'::regclass);


--
-- Name: jugador id_jugador; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jugador ALTER COLUMN id_jugador SET DEFAULT nextval('public.jugador_id_jugador_seq'::regclass);


--
-- Name: jugadores_eliminados id_jugador_eliminado; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jugadores_eliminados ALTER COLUMN id_jugador_eliminado SET DEFAULT nextval('public.jugadores_eliminados_id_jugador_eliminado_seq'::regclass);


--
-- Name: sede id_sede; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sede ALTER COLUMN id_sede SET DEFAULT nextval('public.sede_id_sede_seq'::regclass);


--
-- Name: cargos cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id_cargos);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);


--
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleados);


--
-- Name: jugador jugador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jugador
    ADD CONSTRAINT jugador_pkey PRIMARY KEY (id_jugador);


--
-- Name: jugadores_eliminados jugadores_eliminados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jugadores_eliminados
    ADD CONSTRAINT jugadores_eliminados_pkey PRIMARY KEY (id_jugador_eliminado);


--
-- Name: sede sede_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (id_sede);


--
-- PostgreSQL database dump complete
--

