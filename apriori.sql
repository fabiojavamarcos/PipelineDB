--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2020-01-29 22:39:41 MST

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
-- TOC entry 209 (class 1259 OID 16833)
-- Name: apriori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apriori (
    pr integer NOT NULL,
    java character varying NOT NULL,
    general character varying NOT NULL
);


ALTER TABLE public.apriori OWNER TO postgres;

--
-- TOC entry 3155 (class 0 OID 16833)
-- Dependencies: 209
-- Data for Name: apriori; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3028 (class 2606 OID 16840)
-- Name: apriori apriori_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apriori
    ADD CONSTRAINT apriori_pk PRIMARY KEY (pr, java, general);


-- Completed on 2020-01-29 22:39:41 MST

--
-- PostgreSQL database dump complete
--

