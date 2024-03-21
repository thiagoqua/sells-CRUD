--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: Products; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public."Products" (
    "Id" bigint NOT NULL,
    "Name" text NOT NULL,
    "Price" double precision NOT NULL,
    "Description" text NOT NULL
);


ALTER TABLE public."Products" OWNER TO test;

--
-- Name: Products_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

ALTER TABLE public."Products" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Products_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SellDetails; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public."SellDetails" (
    "Id" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "SellId" bigint NOT NULL,
    "Quantity" integer NOT NULL,
    "UnitaryPrice" double precision NOT NULL,
    "Total" double precision NOT NULL
);


ALTER TABLE public."SellDetails" OWNER TO test;

--
-- Name: SellDetails_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

ALTER TABLE public."SellDetails" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SellDetails_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Sells; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public."Sells" (
    "Id" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    "Total" double precision NOT NULL
);


ALTER TABLE public."Sells" OWNER TO test;

--
-- Name: Sells_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

ALTER TABLE public."Sells" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Sells_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Users; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public."Users" (
    "Id" bigint NOT NULL,
    "Name" text NOT NULL,
    "DNI" text NOT NULL
);


ALTER TABLE public."Users" OWNER TO test;

--
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

ALTER TABLE public."Users" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO test;

--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public."Products" ("Id", "Name", "Price", "Description") FROM stdin;
\.


--
-- Data for Name: SellDetails; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public."SellDetails" ("Id", "ProductId", "SellId", "Quantity", "UnitaryPrice", "Total") FROM stdin;
\.


--
-- Data for Name: Sells; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public."Sells" ("Id", "UserId", date, "Total") FROM stdin;
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public."Users" ("Id", "Name", "DNI") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20240320212546_init     8.0.3
20240320214012_init     8.0.3
\.


--
-- Name: Products_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public."Products_Id_seq"', 1, false);


--
-- Name: SellDetails_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public."SellDetails_Id_seq"', 1, false);


--
-- Name: Sells_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public."Sells_Id_seq"', 1, false);


--
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 1, false);


--
-- Name: Products PK_Products; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "PK_Products" PRIMARY KEY ("Id");


--
-- Name: SellDetails PK_SellDetails; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."SellDetails"
    ADD CONSTRAINT "PK_SellDetails" PRIMARY KEY ("Id");


--
-- Name: Sells PK_Sells; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."Sells"
    ADD CONSTRAINT "PK_Sells" PRIMARY KEY ("Id");


--
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_SellDetails_ProductId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_SellDetails_ProductId" ON public."SellDetails" USING btree ("ProductId");


--
-- Name: IX_SellDetails_SellId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_SellDetails_SellId" ON public."SellDetails" USING btree ("SellId");


--
-- Name: IX_Sells_UserId; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX "IX_Sells_UserId" ON public."Sells" USING btree ("UserId");


--
-- Name: SellDetails FK_SellDetails_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."SellDetails"
    ADD CONSTRAINT "FK_SellDetails_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- Name: SellDetails FK_SellDetails_Sells_SellId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."SellDetails"
    ADD CONSTRAINT "FK_SellDetails_Sells_SellId" FOREIGN KEY ("SellId") REFERENCES public."Sells"("Id") ON DELETE CASCADE;


--
-- Name: Sells FK_Sells_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public."Sells"
    ADD CONSTRAINT "FK_Sells_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--