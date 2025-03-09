--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

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
-- Name: address; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    street character varying(255),
    city character varying(100),
    locality character varying(100),
    country character varying(100),
    cod_postal character varying(20)
);


ALTER TABLE public.address OWNER TO flavia;

--
-- Name: client; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    name character varying(255),
    phone character varying(20),
    email character varying(255),
    client_type character varying(50),
    address_id integer
);


ALTER TABLE public.client OWNER TO flavia;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    employment_date date,
    function character varying(100),
    salary numeric(10,2)
);


ALTER TABLE public.employee OWNER TO flavia;

--
-- Name: material; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.material (
    material_id integer NOT NULL,
    name character varying(255),
    uom character varying(50),
    price_unit numeric(10,2),
    supplier_id integer
);


ALTER TABLE public.material OWNER TO flavia;

--
-- Name: order_material; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.order_material (
    id integer NOT NULL,
    quantity integer,
    unit_price numeric(10,2),
    order_id integer,
    material_id integer
);


ALTER TABLE public.order_material OWNER TO flavia;

--
-- Name: order_warehouse; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.order_warehouse (
    id integer NOT NULL,
    warehouse_id integer,
    order_id integer
);


ALTER TABLE public.order_warehouse OWNER TO flavia;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    state character varying(50),
    estimated_date date
);


ALTER TABLE public.orders OWNER TO flavia;

--
-- Name: project; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.project (
    project_id integer NOT NULL,
    name character varying(255),
    description text,
    start_date date,
    end_date date,
    state character varying(50),
    client_id integer,
    address_id integer,
    profit numeric(10,2)
);


ALTER TABLE public.project OWNER TO flavia;

--
-- Name: project_employee; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.project_employee (
    id integer NOT NULL,
    hours_worked integer,
    project_id integer,
    employee_id integer
);


ALTER TABLE public.project_employee OWNER TO flavia;

--
-- Name: project_material; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.project_material (
    id integer NOT NULL,
    quantity_utilized integer,
    purchase_date date,
    project_id integer,
    material_id integer
);


ALTER TABLE public.project_material OWNER TO flavia;

--
-- Name: project_order; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.project_order (
    id integer NOT NULL,
    total_price numeric(10,2),
    project_id integer,
    order_id integer
);


ALTER TABLE public.project_order OWNER TO flavia;

--
-- Name: supplier; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    name character varying(255),
    phone character varying(20),
    email character varying(255),
    address_id integer
);


ALTER TABLE public.supplier OWNER TO flavia;

--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.warehouse (
    warehouse_id integer NOT NULL,
    name character varying(255),
    is_full boolean,
    address_id integer
);


ALTER TABLE public.warehouse OWNER TO flavia;

--
-- Name: warehouse_material; Type: TABLE; Schema: public; Owner: flavia
--

CREATE TABLE public.warehouse_material (
    id integer NOT NULL,
    quantity_available integer,
    warehouse_id integer,
    material_id integer
);


ALTER TABLE public.warehouse_material OWNER TO flavia;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.address (address_id, street, city, locality, country, cod_postal) FROM stdin;
1	Strada Mihai Eminescu 10	Bucuresti	Sector 1	Romania	010011
2	Bulevardul Unirii 20	Bucuresti	Sector 3	Romania	030123
3	Strada Avram Iancu 15	Cluj-Napoca	Manastur	Romania	400500
4	Calea Dumbravii 8	Sibiu	Centru	Romania	550324
5	Strada Alexandru Ioan Cuza 25	Iasi	Copou	Romania	700100
6	Bulevardul Eroilor 33	Brasov	Centrul Vechi	Romania	500101
7	Strada Victoriei 5	Timisoara	Fabric	Romania	300020
8	Strada Gheorghe Doja 12	Ploiesti	Nord	Romania	100123
9	Strada Republicii 7	Constanta	Faleza Nord	Romania	900550
10	Strada Stefan cel Mare 45	Oradea	Rogerius	Romania	410210
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.client (client_id, name, phone, email, client_type, address_id) FROM stdin;
1	Ion Popescu	0721000001	ion.popescu@gmail.com	Individual	1
2	Maria Ionescu	0722000002	maria.ionescu@yahoo.com	Individual	2
3	SC Constructor SRL	0723000003	office@constructor.ro	Company	3
4	Andrei Vlad	0724000004	andrei.vlad@gmail.com	Individual	4
5	SC Dezvoltator SRL	0725000005	contact@dezvoltator.ro	Company	5
6	Elena Georgescu	0726000006	elena.georgescu@gmail.com	Individual	6
7	SC Electrician SRL	0727000007	info@electrician.ro	Company	7
8	Cristian Marinescu	0728000008	cristian.marinescu@gmail.com	Individual	8
9	SC Instalator SRL	0729000009	office@instalator.ro	Company	9
10	Ana Dumitrescu	0721000010	ana.dumitrescu@gmail.com	Individual	10
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.employee (employee_id, name, surname, employment_date, function, salary) FROM stdin;
1	George	Popa	2020-01-15	Manager	6000.00
2	Vlad	Ionescu	2019-03-01	Inginer	4500.00
3	Mihai	Radu	2021-06-20	Arhitect	5000.00
4	Ana	Dobre	2018-10-30	Secretar	3000.00
5	Ioana	Enache	2022-02-10	Tehnician	3500.00
6	Maria	Nistor	2020-08-25	Contabil	4000.00
7	Alex	Tudor	2017-11-05	Sofer	3200.00
8	Cristina	Stan	2023-01-01	Resurse Umane	3800.00
9	Dragos	Marin	2021-09-15	Consultant	4200.00
10	Florin	Iliescu	2016-04-18	Tehnician	3600.00
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.material (material_id, name, uom, price_unit, supplier_id) FROM stdin;
1	Ciment	Sac	25.50	1
2	Caramida	Bucata	3.20	2
3	Beton	Metru cub	350.00	3
4	Fier Beton	Kilogram	4.50	4
5	Vopsea	Litru	15.00	5
6	Lemn	Metru cub	550.00	6
7	Granit	Metru patrat	120.00	7
8	Sticla	Metru patrat	80.00	8
9	Tigla	Bucata	5.00	9
10	Panouri Termoizolante	Metru patrat	250.00	10
\.


--
-- Data for Name: order_material; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.order_material (id, quantity, unit_price, order_id, material_id) FROM stdin;
1	100	25.50	1	1
2	2000	3.20	2	2
3	50	350.00	3	3
4	300	4.50	4	4
5	20	15.00	5	5
6	10	550.00	6	6
7	40	120.00	7	7
8	30	80.00	8	8
9	500	5.00	9	9
10	25	250.00	10	10
\.


--
-- Data for Name: order_warehouse; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.order_warehouse (id, warehouse_id, order_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.orders (order_id, state, estimated_date) FROM stdin;
1	In procesare	2023-12-20
2	Finalizata	2023-11-15
3	In asteptare	2024-01-10
4	Anulata	2023-10-01
5	In procesare	2023-12-25
6	Finalizata	2023-11-01
7	In procesare	2024-02-15
8	In asteptare	2024-03-01
9	Anulata	2023-09-01
10	Finalizata	2023-10-20
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.project (project_id, name, description, start_date, end_date, state, client_id, address_id, profit) FROM stdin;
1	Constructie Bloc	Proiect de construire a unui bloc cu 10 etaje.	2023-01-10	2024-12-15	In desfasurare	3	1	500000.00
2	Amenajare Parcare	Amenajarea unei parcari de 100 de locuri.	2022-09-01	2023-07-30	Finalizat	4	2	120000.00
3	Renovare Apartament	Renovare completa a unui apartament de 3 camere.	2023-03-01	2023-06-30	Finalizat	1	3	45000.00
4	Reabilitare Scoala	Proiect de reabilitare a unei scoli generale.	2023-04-15	2025-01-20	In desfasurare	2	4	300000.00
5	Constructie Pensiune	Constructie pensiune turistica in zona montana.	2022-10-01	2024-05-30	In desfasurare	5	5	200000.00
6	Modernizare Drum	Modernizarea unui drum judetean.	2023-06-10	2024-09-01	In desfasurare	6	6	400000.00
7	Extindere Fabrica	Extinderea unei fabrici de productie.	2022-12-01	2023-11-30	Finalizat	7	7	150000.00
8	Construire Piscina	Construirea unei piscine olimpice.	2023-02-01	2023-12-15	In desfasurare	8	8	250000.00
9	Renovare Hotel	Renovare completa a unui hotel de 5 stele.	2023-05-01	2024-06-01	In desfasurare	9	9	350000.00
10	Constructie Depozit	Proiect de construire a unui depozit modern.	2023-07-01	2024-08-15	In desfasurare	10	10	180000.00
\.


--
-- Data for Name: project_employee; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.project_employee (id, hours_worked, project_id, employee_id) FROM stdin;
1	200	1	1
2	150	2	2
3	100	3	3
4	250	4	4
5	180	5	5
6	120	6	6
7	220	7	7
8	140	8	8
9	190	9	9
10	160	10	10
\.


--
-- Data for Name: project_material; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.project_material (id, quantity_utilized, purchase_date, project_id, material_id) FROM stdin;
1	100	2023-01-15	1	1
2	500	2023-03-01	2	2
3	300	2023-05-10	3	3
4	200	2023-07-20	4	4
5	50	2023-09-25	5	5
6	70	2023-11-10	6	6
7	80	2023-12-05	7	7
8	90	2024-01-15	8	8
9	120	2024-02-10	9	9
10	130	2024-03-05	10	10
\.


--
-- Data for Name: project_order; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.project_order (id, total_price, project_id, order_id) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.supplier (supplier_id, name, phone, email, address_id) FROM stdin;
1	SC Furnizor Materiale SRL	0741000011	contact@furnizormateriale.ro	1
2	SC Constructii Rapid SRL	0742000012	info@constructiirapid.ro	2
3	SC Materiale Lemn SRL	0743000013	lemn@materialelemn.ro	3
4	SC Otelul SRL	0744000014	otelul@gmail.com	4
5	SC Electro Sistem SRL	0745000015	office@electrosistem.ro	5
6	SC Beton Rapid SRL	0746000016	beton@betonrapid.ro	6
7	SC Sticla Plus SRL	0747000017	sticla@sticlaplus.ro	7
8	SC Ceramica SRL	0748000018	office@ceramica.ro	8
9	SC Vopsea SRL	0749000019	info@vopsea.ro	9
10	SC Instalatii SRL	0750000020	contact@instalatii.ro	10
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.warehouse (warehouse_id, name, is_full, address_id) FROM stdin;
1	Depozit Central Bucuresti	f	1
2	Depozit Cluj-Napoca	t	2
3	Depozit Sibiu	f	3
4	Depozit Brasov	t	4
5	Depozit Constanta	f	5
6	Depozit Iasi	f	6
7	Depozit Timisoara	t	7
8	Depozit Ploiesti	f	8
9	Depozit Oradea	f	9
10	Depozit Galati	t	10
\.


--
-- Data for Name: warehouse_material; Type: TABLE DATA; Schema: public; Owner: flavia
--

COPY public.warehouse_material (id, quantity_available, warehouse_id, material_id) FROM stdin;
1	1000	1	1
2	5000	2	2
3	300	3	3
4	1500	4	4
5	200	5	5
6	400	6	6
7	800	7	7
8	600	8	8
9	2000	9	9
10	700	10	10
\.


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (material_id);


--
-- Name: order_material order_material_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.order_material
    ADD CONSTRAINT order_material_pkey PRIMARY KEY (id);


--
-- Name: order_warehouse order_warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.order_warehouse
    ADD CONSTRAINT order_warehouse_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: project_employee project_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_employee
    ADD CONSTRAINT project_employee_pkey PRIMARY KEY (id);


--
-- Name: project_material project_material_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_material
    ADD CONSTRAINT project_material_pkey PRIMARY KEY (id);


--
-- Name: project_order project_order_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_order
    ADD CONSTRAINT project_order_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_id);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- Name: warehouse_material warehouse_material_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.warehouse_material
    ADD CONSTRAINT warehouse_material_pkey PRIMARY KEY (id);


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);


--
-- Name: client client_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: material material_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- Name: order_material order_material_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.order_material
    ADD CONSTRAINT order_material_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(material_id);


--
-- Name: order_material order_material_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.order_material
    ADD CONSTRAINT order_material_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_warehouse order_warehouse_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.order_warehouse
    ADD CONSTRAINT order_warehouse_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_warehouse order_warehouse_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.order_warehouse
    ADD CONSTRAINT order_warehouse_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: project project_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: project project_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- Name: project_employee project_employee_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_employee
    ADD CONSTRAINT project_employee_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: project_employee project_employee_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_employee
    ADD CONSTRAINT project_employee_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id);


--
-- Name: project_material project_material_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_material
    ADD CONSTRAINT project_material_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(material_id);


--
-- Name: project_material project_material_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_material
    ADD CONSTRAINT project_material_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id);


--
-- Name: project_order project_order_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_order
    ADD CONSTRAINT project_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: project_order project_order_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.project_order
    ADD CONSTRAINT project_order_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id);


--
-- Name: supplier supplier_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: warehouse warehouse_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: warehouse_material warehouse_material_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.warehouse_material
    ADD CONSTRAINT warehouse_material_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(material_id);


--
-- Name: warehouse_material warehouse_material_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flavia
--

ALTER TABLE ONLY public.warehouse_material
    ADD CONSTRAINT warehouse_material_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- PostgreSQL database dump complete
--

