--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 12.10

-- Started on 2022-04-01 18:57:19 UTC

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
-- TOC entry 204 (class 1259 OID 16401)
-- Name: cashback; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.cashback (
    cashback_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    amount numeric(8,2)
);


ALTER TABLE public.cashback OWNER TO $POSTGRESQL_USER;

--
-- TOC entry 205 (class 1259 OID 16416)
-- Name: cashback_id_seq; Type: SEQUENCE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE SEQUENCE public.cashback_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cashback_id_seq OWNER TO $POSTGRESQL_USER;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 205
-- Name: cashback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER SEQUENCE public.cashback_id_seq OWNED BY public.cashback.cashback_id;


--
-- TOC entry 202 (class 1259 OID 16386)
-- Name: customer; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status character varying(25) NOT NULL
);


ALTER TABLE public.customer OWNER TO $POSTGRESQL_USER;

--
-- TOC entry 203 (class 1259 OID 16391)
-- Name: expense; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.expense (
    sale_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    amount numeric(8,2) NOT NULL,
    date timestamp without time zone NOT NULL,
    cashback_id bigint
);


ALTER TABLE public.expense OWNER TO $POSTGRESQL_USER;

--
-- TOC entry 2824 (class 2604 OID 16418)
-- Name: cashback cashback_id; Type: DEFAULT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.cashback ALTER COLUMN cashback_id SET DEFAULT nextval('public.cashback_id_seq'::regclass);


--
-- TOC entry 2830 (class 2606 OID 16405)
-- Name: cashback cashback_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.cashback
    ADD CONSTRAINT cashback_pkey PRIMARY KEY (cashback_id);


--
-- TOC entry 2826 (class 2606 OID 16390)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2828 (class 2606 OID 16395)
-- Name: expense sale_id_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT sale_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 2832 (class 2606 OID 16411)
-- Name: expense cashback_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT cashback_fkey FOREIGN KEY (cashback_id) REFERENCES public.cashback(cashback_id) NOT VALID;


--
-- TOC entry 2831 (class 2606 OID 16396)
-- Name: expense customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 2833 (class 2606 OID 16406)
-- Name: cashback customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.cashback
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


-- Completed on 2022-04-01 18:57:19 UTC

--
-- PostgreSQL database dump complete
--
