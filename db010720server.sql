--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Ubuntu 11.6-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.6 (Ubuntu 11.6-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: adjustment_stock_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adjustment_stock_details (
    id bigint NOT NULL,
    adjustment_stock_id integer NOT NULL,
    stock_awal_id integer,
    stock_transaction_id integer NOT NULL,
    item_id integer NOT NULL,
    previous_qty integer DEFAULT 0 NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    previous_expired_date date,
    expired_date date,
    lokasi_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.adjustment_stock_details OWNER TO postgres;

--
-- Name: adjustment_stock_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adjustment_stock_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjustment_stock_details_id_seq OWNER TO postgres;

--
-- Name: adjustment_stock_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adjustment_stock_details_id_seq OWNED BY public.adjustment_stock_details.id;


--
-- Name: adjustment_stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adjustment_stocks (
    id bigint NOT NULL,
    date date NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.adjustment_stocks OWNER TO postgres;

--
-- Name: adjustment_stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adjustment_stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjustment_stocks_id_seq OWNER TO postgres;

--
-- Name: adjustment_stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adjustment_stocks_id_seq OWNED BY public.adjustment_stocks.id;


--
-- Name: assesment_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assesment_details (
    id bigint NOT NULL,
    assesment_id integer NOT NULL,
    disease_id integer,
    cure character varying(200),
    last_checkup_date date,
    pain_location character varying(200),
    is_other_pain_type integer DEFAULT 0 NOT NULL,
    pain_type character varying(70),
    pain_duration character varying(70),
    emergence_time character varying(70),
    side_effect character varying(170),
    is_unknown integer DEFAULT 0 NOT NULL,
    is_allergy_history integer DEFAULT 0 NOT NULL,
    is_disease_history integer DEFAULT 0 NOT NULL,
    is_family_disease_history integer DEFAULT 0 NOT NULL,
    is_pain_history integer DEFAULT 0 NOT NULL,
    is_pain_cure_history integer DEFAULT 0 NOT NULL,
    is_kid_history integer DEFAULT 0 NOT NULL,
    is_pregnant_week_age integer DEFAULT 0 NOT NULL,
    kid_order integer DEFAULT 0 NOT NULL,
    partus_year integer DEFAULT 0 NOT NULL,
    partus_location character varying(100),
    pregnant_month_age integer DEFAULT 0 NOT NULL,
    pregnant_week_age integer DEFAULT 0 NOT NULL,
    birth_type character varying(30),
    birth_helper character varying(80),
    birth_obstacle character varying(150),
    baby_gender character varying(255),
    weight integer DEFAULT 0 NOT NULL,
    long integer DEFAULT 0 NOT NULL,
    komplikasi_nifas character varying(150),
    is_imunisasi_history integer DEFAULT 0 NOT NULL,
    is_other_imunisasi integer DEFAULT 0 NOT NULL,
    imunisasi_year_age integer DEFAULT 0 NOT NULL,
    imunisasi_month_age integer DEFAULT 0 NOT NULL,
    is_imunisasi_month_age integer DEFAULT 0 NOT NULL,
    imunisasi character varying(150),
    reaksi_imunisasi character varying(300),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT assesment_details_baby_gender_check CHECK (((baby_gender)::text = ANY (ARRAY[('PRIA'::character varying)::text, ('WANITA'::character varying)::text])))
);


ALTER TABLE public.assesment_details OWNER TO postgres;

--
-- Name: assesment_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assesment_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assesment_details_id_seq OWNER TO postgres;

--
-- Name: assesment_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assesment_details_id_seq OWNED BY public.assesment_details.id;


--
-- Name: assesments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assesments (
    id bigint NOT NULL,
    step integer DEFAULT 0 NOT NULL,
    date date NOT NULL,
    registration_id integer NOT NULL,
    patient_id integer NOT NULL,
    created_by integer,
    updated_by integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_disturb integer DEFAULT 0 NOT NULL,
    pain_score integer DEFAULT 0 NOT NULL,
    pain_description character varying(255),
    fallen integer DEFAULT 0 NOT NULL,
    fallen_description text,
    secondary_diagnose integer DEFAULT 0 NOT NULL,
    secondary_diagnose_description text,
    helper integer DEFAULT 0 NOT NULL,
    helper_description text,
    infus integer DEFAULT 0 NOT NULL,
    infus_description text,
    walking integer DEFAULT 0 NOT NULL,
    walking_description text,
    mental integer DEFAULT 0 NOT NULL,
    mental_description text,
    risk_level integer DEFAULT 0 NOT NULL,
    risk_level_status character varying(25),
    risk_level_description character varying(200),
    menarche_age integer DEFAULT 1 NOT NULL,
    siklus_haid character varying(200),
    jumlah_pemakaian_pembalut integer DEFAULT 0 NOT NULL,
    lama_pemakaian_pembalut character varying(200),
    is_tidy integer DEFAULT 0 NOT NULL,
    hpht date,
    haid_complaint text,
    marriage_status text,
    marriage_duration character varying(200),
    is_pernah_kb integer DEFAULT 0 NOT NULL,
    kb_item character varying(200),
    kb_start_time character varying(200),
    kb_complaint text,
    gravida integer DEFAULT 0 NOT NULL,
    partus integer DEFAULT 0 NOT NULL,
    abortus integer DEFAULT 0 NOT NULL,
    imunisasi_tt character varying(200),
    pada_usia_kehamilan integer DEFAULT 0 NOT NULL,
    pemakaian_obat_saat_kehamilan character varying(200),
    keluhan_saat_kehamilan character varying(200),
    general_condition text,
    gigi_tumbuh_pertama character varying(100),
    long double precision DEFAULT '0'::double precision NOT NULL,
    weight double precision DEFAULT '0'::double precision NOT NULL,
    blood_pressure character varying(7) DEFAULT '0'::double precision NOT NULL,
    pulse character varying(20) DEFAULT '0'::character varying NOT NULL,
    temperature double precision DEFAULT '0'::double precision NOT NULL,
    breath_frequency character varying(20) DEFAULT '0'::character varying NOT NULL,
    prebirth_weight double precision DEFAULT '0'::double precision NOT NULL,
    postbirth_weight double precision DEFAULT '0'::double precision NOT NULL,
    birth_long double precision DEFAULT '0'::double precision NOT NULL,
    birth_weight double precision DEFAULT '0'::double precision NOT NULL,
    head_size double precision DEFAULT '0'::double precision NOT NULL,
    arm_size double precision DEFAULT '0'::double precision NOT NULL,
    berguling_usia double precision DEFAULT '0'::double precision NOT NULL,
    duduk_usia double precision DEFAULT '0'::double precision NOT NULL,
    merangkak_usia double precision DEFAULT '0'::double precision NOT NULL,
    berdiri_usia double precision DEFAULT '0'::double precision NOT NULL,
    berjalan_usia double precision DEFAULT '0'::double precision NOT NULL,
    bicara_usia double precision DEFAULT '0'::double precision NOT NULL,
    main_complaint text
);


ALTER TABLE public.assesments OWNER TO postgres;

--
-- Name: assesments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assesments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assesments_id_seq OWNER TO postgres;

--
-- Name: assesments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assesments_id_seq OWNED BY public.assesments.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    province_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type character varying(15) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    code character varying(200),
    email character varying(200),
    name character varying(200) NOT NULL,
    civil_code character varying(50),
    pin character varying(50),
    gender character varying(255),
    blood_type character varying(255),
    agency_type character varying(255),
    job character varying(255),
    religion character varying(255),
    address character varying(500),
    postal_code character varying(15),
    phone character varying(30),
    fax character varying(30),
    account_id integer,
    start_date date,
    birth_date date,
    age integer DEFAULT 0 NOT NULL,
    province_id integer,
    city_id integer,
    district_id integer,
    village_id integer,
    patient_type character varying(255),
    is_active integer DEFAULT 1 NOT NULL,
    is_contact integer DEFAULT 0 NOT NULL,
    is_agency integer DEFAULT 0 NOT NULL,
    is_patient integer DEFAULT 0 NOT NULL,
    is_supplier integer DEFAULT 0 NOT NULL,
    is_nurse integer DEFAULT 0 NOT NULL,
    is_employee integer DEFAULT 0 NOT NULL,
    is_doctor integer DEFAULT 0 NOT NULL,
    is_family integer DEFAULT 0 NOT NULL,
    is_nurse_helper integer DEFAULT 0 NOT NULL,
    specialization_id integer,
    family_id integer,
    polyclinic_id integer,
    contact_id integer,
    group_user_id integer,
    supplier_id integer,
    supplier_disc_percent integer DEFAULT 0 NOT NULL,
    pharmacy_disc_percent integer DEFAULT 0 NOT NULL,
    lab_sender_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    lab_refer_sender_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    xray_sender_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    xray_read_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    usg_sender_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    usg_read_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    ecg_sender_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    ecg_read_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    medical_action_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    consultation_fee_value double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    birth_place character varying(60),
    marriage_status character varying(255),
    registration_id integer,
    created_by integer,
    updated_by integer,
    medical_record_id integer,
    assesment_id integer,
    CONSTRAINT contacts_agency_type_check CHECK (((agency_type)::text = ANY (ARRAY[('INSTANSI'::character varying)::text, ('ASURANSI'::character varying)::text]))),
    CONSTRAINT contacts_blood_type_check CHECK (((blood_type)::text = ANY (ARRAY[('A'::character varying)::text, ('AB'::character varying)::text, ('B'::character varying)::text, ('O'::character varying)::text]))),
    CONSTRAINT contacts_gender_check CHECK (((gender)::text = ANY (ARRAY[('PRIA'::character varying)::text, ('WANITA'::character varying)::text]))),
    CONSTRAINT contacts_job_check CHECK (((job)::text = ANY (ARRAY[('PNS'::character varying)::text, ('SWASTA'::character varying)::text, ('WIRASWASTA'::character varying)::text, ('TNI/POLRI'::character varying)::text, ('PETANI'::character varying)::text, ('NELAYAN'::character varying)::text, ('PTT'::character varying)::text, ('IBU RTGA'::character varying)::text]))),
    CONSTRAINT contacts_marriage_status_check CHECK (((marriage_status)::text = ANY (ARRAY[('MENIKAH'::character varying)::text, ('BELUM MENIKAH'::character varying)::text, ('DUDA'::character varying)::text, ('JANDA'::character varying)::text]))),
    CONSTRAINT contacts_patient_type_check CHECK (((patient_type)::text = ANY (ARRAY[('ANAK'::character varying)::text, ('NYONYA'::character varying)::text, ('NONA'::character varying)::text, ('TUAN'::character varying)::text]))),
    CONSTRAINT contacts_religion_check CHECK (((religion)::text = ANY (ARRAY[('ISLAM'::character varying)::text, ('KRISTEN'::character varying)::text, ('KATOLIK'::character varying)::text, ('HINDU'::character varying)::text, ('BUDHA'::character varying)::text, ('KONGHUCU'::character varying)::text, ('LAINNYA'::character varying)::text])))
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id bigint NOT NULL,
    code character varying(30) NOT NULL,
    name character varying(200) NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    type character varying(255) DEFAULT 'PROMO'::character varying NOT NULL,
    description character varying(255),
    disc_percent integer DEFAULT 0 NOT NULL,
    disc_value double precision DEFAULT '0'::double precision NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT discounts_type_check CHECK (((type)::text = ANY (ARRAY[('PROMO'::character varying)::text, ('PAKET'::character varying)::text])))
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_id_seq OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    city_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_id_seq OWNER TO postgres;

--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: formula_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formula_details (
    id bigint NOT NULL,
    formula_id integer NOT NULL,
    item_id integer NOT NULL,
    lokasi_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    stock_id integer NOT NULL,
    stock_transaction_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.formula_details OWNER TO postgres;

--
-- Name: formula_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formula_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formula_details_id_seq OWNER TO postgres;

--
-- Name: formula_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formula_details_id_seq OWNED BY public.formula_details.id;


--
-- Name: formulas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formulas (
    id bigint NOT NULL,
    date date NOT NULL,
    medical_record_id integer NOT NULL,
    registration_detail_id integer NOT NULL,
    invoice_id integer,
    is_approve integer DEFAULT 0 NOT NULL,
    updated_by integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.formulas OWNER TO postgres;

--
-- Name: formulas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formulas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formulas_id_seq OWNER TO postgres;

--
-- Name: formulas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formulas_id_seq OWNED BY public.formulas.id;


--
-- Name: invoice_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_details (
    id bigint NOT NULL,
    invoice_id integer NOT NULL,
    item_id integer,
    qty integer DEFAULT 0 NOT NULL,
    disc_percent integer DEFAULT 0 NOT NULL,
    debet double precision DEFAULT '0'::double precision NOT NULL,
    credit double precision DEFAULT '0'::double precision NOT NULL,
    total_debet double precision DEFAULT '0'::double precision NOT NULL,
    total_credit double precision DEFAULT '0'::double precision NOT NULL,
    grandtotal double precision DEFAULT '0'::double precision NOT NULL,
    invoice_detail_id integer,
    is_item integer DEFAULT 0 NOT NULL,
    is_discount integer DEFAULT 0 NOT NULL,
    is_promo integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_discount_total integer DEFAULT 0 NOT NULL,
    reduksi integer DEFAULT 0 NOT NULL,
    is_reduksi integer DEFAULT 0 NOT NULL,
    is_profit_sharing integer DEFAULT 0 NOT NULL,
    is_asuransi integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.invoice_details OWNER TO postgres;

--
-- Name: invoice_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_details_id_seq OWNER TO postgres;

--
-- Name: invoice_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_details_id_seq OWNED BY public.invoice_details.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id bigint NOT NULL,
    registration_id integer NOT NULL,
    code character varying(40),
    date date NOT NULL,
    is_nota_rawat_jalan integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    gross double precision DEFAULT '0'::double precision NOT NULL,
    discount double precision DEFAULT '0'::double precision NOT NULL,
    netto double precision DEFAULT '0'::double precision NOT NULL,
    paid double precision DEFAULT '0'::double precision NOT NULL,
    balance double precision DEFAULT '0'::double precision NOT NULL,
    discount_id integer,
    payment_type character varying(255) NOT NULL,
    payment_method character varying(255) NOT NULL,
    description text,
    promo_description text,
    paid_at timestamp(0) without time zone,
    paid_by integer,
    created_by integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_nota_pengobatan integer DEFAULT 0 NOT NULL,
    reduksi double precision DEFAULT '0'::double precision NOT NULL,
    asuransi_percentage integer DEFAULT 0 NOT NULL,
    asuransi_value integer DEFAULT 0 NOT NULL,
    discount_total_value double precision DEFAULT '0'::double precision NOT NULL,
    discount_total_percentage double precision DEFAULT '0'::double precision NOT NULL,
    is_nota_pemeriksaan integer DEFAULT 0 NOT NULL,
    invoice_amandemen_id integer,
    CONSTRAINT invoices_payment_method_check CHECK (((payment_method)::text = ANY (ARRAY[('TUNAI'::character varying)::text, ('KREDIT'::character varying)::text, ('TT'::character varying)::text, ('VISA'::character varying)::text, ('MASTER'::character varying)::text]))),
    CONSTRAINT invoices_payment_type_check CHECK (((payment_type)::text = ANY (ARRAY[('BAYAR SENDIRI'::character varying)::text, ('ASURANSI SWASTA'::character varying)::text])))
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    code character varying(45) NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    price double precision DEFAULT '0'::double precision NOT NULL,
    category_id integer,
    is_active integer DEFAULT 1 NOT NULL,
    is_category integer DEFAULT 0 NOT NULL,
    is_disease integer DEFAULT 0 NOT NULL,
    is_administration integer DEFAULT 0 NOT NULL,
    is_inspection integer DEFAULT 0 NOT NULL,
    is_standard integer DEFAULT 0 NOT NULL,
    is_radiology integer DEFAULT 0 NOT NULL,
    is_anatomy integer DEFAULT 0 NOT NULL,
    is_packet integer DEFAULT 0 NOT NULL,
    is_pharmacy integer DEFAULT 0 NOT NULL,
    is_laboratory integer DEFAULT 0 NOT NULL,
    piece_id integer,
    is_cure integer DEFAULT 0 NOT NULL,
    is_bhp integer DEFAULT 0 NOT NULL,
    additional text DEFAULT '{}'::text NOT NULL,
    purchase_piece_id integer,
    purchase_price double precision DEFAULT '0'::double precision NOT NULL,
    supplier_price double precision DEFAULT '0'::double precision NOT NULL,
    minimal_stock integer DEFAULT 0 NOT NULL,
    ratio integer DEFAULT 0 NOT NULL,
    is_alkes_disposible integer DEFAULT 0 NOT NULL,
    is_alkes_non_disposible integer DEFAULT 0 NOT NULL,
    is_umum integer DEFAULT 0 NOT NULL,
    is_inventaris integer DEFAULT 0 NOT NULL,
    is_non_cure integer DEFAULT 0 NOT NULL,
    is_medical_item integer DEFAULT 0 NOT NULL,
    is_classification integer DEFAULT 0 NOT NULL,
    is_subclassification integer DEFAULT 0 NOT NULL,
    is_generic integer DEFAULT 0 NOT NULL,
    classification_id integer DEFAULT 0,
    subclassification_id integer DEFAULT 0,
    generic_id integer DEFAULT 0,
    current_stock integer DEFAULT 0 NOT NULL,
    has_stock integer DEFAULT 0 NOT NULL,
    is_treatment_group integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: laboratory_treatments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory_treatments (
    id bigint NOT NULL,
    price_id integer NOT NULL,
    laboratory_type_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.laboratory_treatments OWNER TO postgres;

--
-- Name: laboratory_treatments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laboratory_treatments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.laboratory_treatments_id_seq OWNER TO postgres;

--
-- Name: laboratory_treatments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laboratory_treatments_id_seq OWNED BY public.laboratory_treatments.id;


--
-- Name: laboratory_type_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory_type_details (
    id bigint NOT NULL,
    laboratory_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.laboratory_type_details OWNER TO postgres;

--
-- Name: laboratory_type_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laboratory_type_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.laboratory_type_details_id_seq OWNER TO postgres;

--
-- Name: laboratory_type_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laboratory_type_details_id_seq OWNED BY public.laboratory_type_details.id;


--
-- Name: laboratory_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory_types (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.laboratory_types OWNER TO postgres;

--
-- Name: laboratory_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laboratory_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.laboratory_types_id_seq OWNER TO postgres;

--
-- Name: laboratory_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laboratory_types_id_seq OWNED BY public.laboratory_types.id;


--
-- Name: letters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.letters (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    option character varying(20),
    medical_record_id integer NOT NULL,
    doctor_id integer NOT NULL,
    created_by integer NOT NULL,
    updated_by integer,
    date date NOT NULL,
    review_date date,
    start_date date,
    end_date date,
    duration integer,
    duration_type character varying(255),
    age integer,
    age_type character varying(255),
    description text,
    additional text DEFAULT '{}'::text NOT NULL,
    is_cuti_hamil integer DEFAULT 0 NOT NULL,
    is_keterangan_dokter integer DEFAULT 0 NOT NULL,
    is_keterangan_sehat integer DEFAULT 0 NOT NULL,
    is_layak_terbang integer DEFAULT 0 NOT NULL,
    is_pengantar_mrs integer DEFAULT 0 NOT NULL,
    is_rujukan_pasien integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_persetujuan_tindakan_medis integer DEFAULT 0 NOT NULL,
    CONSTRAINT letters_age_type_check CHECK (((age_type)::text = ANY (ARRAY[('MINGGU'::character varying)::text, ('BULAN'::character varying)::text]))),
    CONSTRAINT letters_duration_type_check CHECK (((duration_type)::text = ANY (ARRAY[('MINGGU'::character varying)::text, ('BULAN'::character varying)::text])))
);


ALTER TABLE public.letters OWNER TO postgres;

--
-- Name: letters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.letters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.letters_id_seq OWNER TO postgres;

--
-- Name: letters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.letters_id_seq OWNED BY public.letters.id;


--
-- Name: medical_record_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medical_record_details (
    id bigint NOT NULL,
    medical_record_id integer NOT NULL,
    disease_id integer,
    cure character varying(200),
    last_checkup_date date,
    pain_location character varying(200),
    is_other_pain_type integer DEFAULT 0 NOT NULL,
    pain_type character varying(70),
    pain_duration character varying(70),
    emergence_time character varying(70),
    side_effect character varying(170),
    is_unknown integer DEFAULT 0 NOT NULL,
    is_allergy_history integer DEFAULT 0 NOT NULL,
    is_disease_history integer DEFAULT 0 NOT NULL,
    is_family_disease_history integer DEFAULT 0 NOT NULL,
    is_pain_history integer DEFAULT 0 NOT NULL,
    is_pain_cure_history integer DEFAULT 0 NOT NULL,
    is_kid_history integer DEFAULT 0 NOT NULL,
    is_pregnant_week_age integer DEFAULT 0 NOT NULL,
    kid_order integer DEFAULT 0 NOT NULL,
    partus_year integer DEFAULT 0 NOT NULL,
    partus_location character varying(100),
    pregnant_month_age integer DEFAULT 0 NOT NULL,
    pregnant_week_age integer DEFAULT 0 NOT NULL,
    birth_type character varying(30),
    birth_helper character varying(80),
    birth_obstacle character varying(150),
    baby_gender character varying(255),
    weight integer DEFAULT 0 NOT NULL,
    long integer DEFAULT 0 NOT NULL,
    komplikasi_nifas character varying(150),
    is_imunisasi_history integer DEFAULT 0 NOT NULL,
    is_other_imunisasi integer DEFAULT 0 NOT NULL,
    is_imunisasi_month_age integer DEFAULT 0 NOT NULL,
    imunisasi character varying(150),
    reaksi_imunisasi character varying(300),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    imunisasi_year_age integer DEFAULT 0 NOT NULL,
    imunisasi_month_age integer DEFAULT 0 NOT NULL,
    disease_name character varying(200),
    name character varying(200),
    duration integer DEFAULT 0 NOT NULL,
    is_ginekologi_history integer DEFAULT 0 NOT NULL,
    is_other_ginekologi integer DEFAULT 0 NOT NULL,
    is_obgyn_disease_history integer DEFAULT 0 NOT NULL,
    is_obgyn_family_disease_history integer DEFAULT 0 NOT NULL,
    is_kb_history integer DEFAULT 0 NOT NULL,
    is_komplikasi_kb_history integer DEFAULT 0 NOT NULL,
    is_diagnostic integer DEFAULT 0 NOT NULL,
    is_drug integer DEFAULT 0 NOT NULL,
    is_treatment integer DEFAULT 0 NOT NULL,
    item_id integer DEFAULT 0 NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    reduksi integer DEFAULT 0 NOT NULL,
    date date,
    is_other integer DEFAULT 1 NOT NULL,
    description text,
    type character varying(50),
    is_diagnose_history integer DEFAULT 0 NOT NULL,
    signa1 integer,
    signa2 integer,
    result_date date,
    is_schedule integer DEFAULT 0 NOT NULL,
    is_radiology integer DEFAULT 0 NOT NULL,
    is_laboratory integer DEFAULT 0 NOT NULL,
    is_pathology integer DEFAULT 0 NOT NULL,
    lokasi_id integer,
    is_bhp integer DEFAULT 0 NOT NULL,
    is_sewa_alkes integer DEFAULT 0 NOT NULL,
    is_sewa_ruangan integer DEFAULT 0 NOT NULL,
    saran text,
    kesimpulan text,
    kanan text,
    kiri text,
    additional text DEFAULT '{}'::text NOT NULL,
    stock_id integer,
    is_treatment_group integer DEFAULT 0 NOT NULL,
    CONSTRAINT medical_record_details_baby_gender_check CHECK (((baby_gender)::text = ANY (ARRAY[('PRIA'::character varying)::text, ('WANITA'::character varying)::text])))
);


ALTER TABLE public.medical_record_details OWNER TO postgres;

--
-- Name: medical_record_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medical_record_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_record_details_id_seq OWNER TO postgres;

--
-- Name: medical_record_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medical_record_details_id_seq OWNED BY public.medical_record_details.id;


--
-- Name: medical_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medical_records (
    id bigint NOT NULL,
    code character varying(30) NOT NULL,
    date character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    patient_type character varying(255),
    patient_id integer NOT NULL,
    created_by integer,
    updated_by integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    main_complaint text,
    step integer DEFAULT 0 NOT NULL,
    is_disturb integer DEFAULT 0 NOT NULL,
    pain_score integer DEFAULT 0 NOT NULL,
    pain_description character varying(255),
    fallen integer DEFAULT 0 NOT NULL,
    fallen_description text,
    secondary_diagnose integer DEFAULT 0 NOT NULL,
    secondary_diagnose_description text,
    helper integer DEFAULT 0 NOT NULL,
    helper_description text,
    infus integer DEFAULT 0 NOT NULL,
    infus_description text,
    walking integer DEFAULT 0 NOT NULL,
    walking_description text,
    mental integer DEFAULT 0 NOT NULL,
    mental_description text,
    risk_level integer DEFAULT 0 NOT NULL,
    risk_level_status character varying(25),
    risk_level_description character varying(200),
    menarche_age integer DEFAULT 1 NOT NULL,
    siklus_haid character varying(200),
    jumlah_pemakaian_pembalut integer DEFAULT 0 NOT NULL,
    lama_pemakaian_pembalut character varying(200),
    is_tidy integer DEFAULT 0 NOT NULL,
    hpht date,
    haid_complaint text,
    marriage_status text,
    marriage_duration character varying(200),
    is_pernah_kb integer DEFAULT 0 NOT NULL,
    kb_item character varying(200),
    kb_start_time character varying(200),
    kb_complaint text,
    gravida integer DEFAULT 0 NOT NULL,
    partus integer DEFAULT 0 NOT NULL,
    abortus integer DEFAULT 0 NOT NULL,
    imunisasi_tt character varying(200),
    pada_usia_kehamilan integer DEFAULT 0 NOT NULL,
    pemakaian_obat_saat_kehamilan character varying(200),
    keluhan_saat_kehamilan character varying(200),
    general_condition text,
    gigi_tumbuh_pertama character varying(100),
    long double precision DEFAULT '0'::double precision NOT NULL,
    weight double precision DEFAULT '0'::double precision NOT NULL,
    blood_pressure character varying(7) DEFAULT '0'::double precision NOT NULL,
    pulse character varying(20) DEFAULT '0'::character varying NOT NULL,
    temperature double precision DEFAULT '0'::double precision NOT NULL,
    breath_frequency character varying(20) DEFAULT '0'::character varying NOT NULL,
    prebirth_weight double precision DEFAULT '0'::double precision NOT NULL,
    postbirth_weight double precision DEFAULT '0'::double precision NOT NULL,
    birth_long double precision DEFAULT '0'::double precision NOT NULL,
    birth_weight double precision DEFAULT '0'::double precision NOT NULL,
    head_size double precision DEFAULT '0'::double precision NOT NULL,
    arm_size double precision DEFAULT '0'::double precision NOT NULL,
    berguling_usia double precision DEFAULT '0'::double precision NOT NULL,
    duduk_usia double precision DEFAULT '0'::double precision NOT NULL,
    merangkak_usia double precision DEFAULT '0'::double precision NOT NULL,
    berdiri_usia double precision DEFAULT '0'::double precision NOT NULL,
    berjalan_usia double precision DEFAULT '0'::double precision NOT NULL,
    bicara_usia double precision DEFAULT '0'::double precision NOT NULL,
    registration_detail_id integer NOT NULL,
    registration_id integer NOT NULL,
    current_disease text,
    psiko_sosial text,
    operasi text,
    obgyn_main_complaint text,
    obgyn_current_disease text,
    obgyn_operasi text,
    physique text,
    ekg text,
    usg text,
    head_description text,
    breast_description text,
    rectum_description text,
    reduksi integer DEFAULT 0 NOT NULL,
    refer_doctor_id integer,
    additional text DEFAULT '{}'::text NOT NULL,
    CONSTRAINT medical_records_patient_type_check CHECK (((patient_type)::text = ANY (ARRAY[('UMUM'::character varying)::text, ('ASURANSI SWASTA'::character varying)::text])))
);


ALTER TABLE public.medical_records OWNER TO postgres;

--
-- Name: medical_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medical_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_records_id_seq OWNER TO postgres;

--
-- Name: medical_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medical_records_id_seq OWNED BY public.medical_records.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: movement_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movement_details (
    id bigint NOT NULL,
    movement_id integer NOT NULL,
    stock_awal_id integer,
    stock_transaction_source_id integer NOT NULL,
    stock_transaction_destination_id integer NOT NULL,
    item_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    lokasi_awal_id integer NOT NULL,
    lokasi_akhir_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.movement_details OWNER TO postgres;

--
-- Name: movement_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movement_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movement_details_id_seq OWNER TO postgres;

--
-- Name: movement_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movement_details_id_seq OWNED BY public.movement_details.id;


--
-- Name: movements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movements (
    id bigint NOT NULL,
    date date NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.movements OWNER TO postgres;

--
-- Name: movements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movements_id_seq OWNER TO postgres;

--
-- Name: movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movements_id_seq OWNED BY public.movements.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    route character varying(100) NOT NULL,
    param character varying(100) DEFAULT '[]'::character varying NOT NULL,
    stock_id integer,
    is_read integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: periodical_stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periodical_stocks (
    id bigint NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    stock_id integer NOT NULL,
    item_id integer NOT NULL,
    lokasi_id integer NOT NULL,
    expired_date date,
    gross integer DEFAULT 0 NOT NULL,
    netto integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.periodical_stocks OWNER TO postgres;

--
-- Name: periodical_stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.periodical_stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periodical_stocks_id_seq OWNER TO postgres;

--
-- Name: periodical_stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.periodical_stocks_id_seq OWNED BY public.periodical_stocks.id;


--
-- Name: permission_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_role (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permission_role OWNER TO postgres;

--
-- Name: permission_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_role_id_seq OWNER TO postgres;

--
-- Name: permission_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_role_id_seq OWNED BY public.permission_role.id;


--
-- Name: permission_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_user (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permission_user OWNER TO postgres;

--
-- Name: permission_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_user_id_seq OWNER TO postgres;

--
-- Name: permission_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_user_id_seq OWNED BY public.permission_user.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255),
    model character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_active integer DEFAULT 1 NOT NULL,
    is_permission integer DEFAULT 0 NOT NULL,
    is_grup_nota integer DEFAULT 0 NOT NULL,
    roles text DEFAULT '{}'::text NOT NULL,
    is_signa integer DEFAULT 0 NOT NULL,
    is_lokasi integer DEFAULT 0 NOT NULL,
    is_gudang_farmasi integer DEFAULT 0 NOT NULL,
    is_keadaan_umum integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: pieces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pieces (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pieces OWNER TO postgres;

--
-- Name: pieces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pieces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pieces_id_seq OWNER TO postgres;

--
-- Name: pieces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pieces_id_seq OWNED BY public.pieces.id;


--
-- Name: pivot_medical_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pivot_medical_records (
    id bigint NOT NULL,
    medical_record_id integer NOT NULL,
    registration_detail_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_referenced integer DEFAULT 0 NOT NULL,
    is_ruang_tindakan integer DEFAULT 0 NOT NULL,
    is_radiology integer DEFAULT 0 NOT NULL,
    is_laboratory integer DEFAULT 0 NOT NULL,
    medical_record_detail_id integer,
    additional json DEFAULT '{}'::json NOT NULL,
    is_laboratory_treatment integer DEFAULT 0 NOT NULL,
    parent_id integer,
    is_chemoterapy integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.pivot_medical_records OWNER TO postgres;

--
-- Name: pivot_medical_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pivot_medical_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pivot_medical_records_id_seq OWNER TO postgres;

--
-- Name: pivot_medical_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pivot_medical_records_id_seq OWNED BY public.pivot_medical_records.id;


--
-- Name: polyclinics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polyclinics (
    id bigint NOT NULL,
    code character varying(30) NOT NULL,
    name character varying(200) NOT NULL,
    index integer DEFAULT 0 NOT NULL,
    cost_center character varying(30),
    is_active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.polyclinics OWNER TO postgres;

--
-- Name: polyclinics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polyclinics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polyclinics_id_seq OWNER TO postgres;

--
-- Name: polyclinics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polyclinics_id_seq OWNED BY public.polyclinics.id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    item_id integer NOT NULL,
    grup_nota_id integer NOT NULL,
    destination character varying(25),
    polyclinic_id integer,
    is_registration integer DEFAULT 0 NOT NULL,
    qty integer DEFAULT 1 NOT NULL,
    custom_price double precision DEFAULT '0'::double precision NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    is_default integer DEFAULT 1 NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    percentage integer DEFAULT 0 NOT NULL,
    is_sewa_ruangan integer DEFAULT 0 NOT NULL,
    is_sewa_alkes integer DEFAULT 0 NOT NULL,
    laboratory_group character varying(70),
    is_treatment integer DEFAULT 0 NOT NULL,
    is_diagnostic integer DEFAULT 0 NOT NULL,
    radiology_group integer,
    is_chemoterapy integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_id_seq OWNER TO postgres;

--
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinces_id_seq OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- Name: purchase_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_order_details (
    id bigint NOT NULL,
    purchase_order_id integer NOT NULL,
    item_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    received_qty integer DEFAULT 0 NOT NULL,
    leftover_qty integer DEFAULT 0 NOT NULL,
    purchase_price integer DEFAULT 0 NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purchase_order_details OWNER TO postgres;

--
-- Name: purchase_order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_details_id_seq OWNER TO postgres;

--
-- Name: purchase_order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_order_details_id_seq OWNED BY public.purchase_order_details.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_orders (
    id bigint NOT NULL,
    date date NOT NULL,
    code character varying(35) NOT NULL,
    purchase_request_id integer NOT NULL,
    supplier_id integer NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    description text,
    is_receipt_completed integer DEFAULT 0 NOT NULL,
    is_used integer DEFAULT 0 NOT NULL,
    created_by integer NOT NULL,
    additional text DEFAULT '{}'::text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purchase_orders OWNER TO postgres;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_orders_id_seq OWNER TO postgres;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_orders_id_seq OWNED BY public.purchase_orders.id;


--
-- Name: purchase_request_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_request_details (
    id bigint NOT NULL,
    purchase_request_id integer NOT NULL,
    item_id integer NOT NULL,
    supplier_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    purchase_price integer DEFAULT 0 NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purchase_request_details OWNER TO postgres;

--
-- Name: purchase_request_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_request_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_request_details_id_seq OWNER TO postgres;

--
-- Name: purchase_request_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_request_details_id_seq OWNED BY public.purchase_request_details.id;


--
-- Name: purchase_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_requests (
    id bigint NOT NULL,
    date date NOT NULL,
    code character varying(35) NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    description text,
    is_approve integer DEFAULT 0 NOT NULL,
    created_by integer NOT NULL,
    additional text DEFAULT '{}'::text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purchase_requests OWNER TO postgres;

--
-- Name: purchase_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_requests_id_seq OWNER TO postgres;

--
-- Name: purchase_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_requests_id_seq OWNED BY public.purchase_requests.id;


--
-- Name: radiology_type_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radiology_type_details (
    id bigint NOT NULL,
    radiology_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.radiology_type_details OWNER TO postgres;

--
-- Name: radiology_type_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.radiology_type_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radiology_type_details_id_seq OWNER TO postgres;

--
-- Name: radiology_type_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.radiology_type_details_id_seq OWNED BY public.radiology_type_details.id;


--
-- Name: radiology_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radiology_types (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.radiology_types OWNER TO postgres;

--
-- Name: radiology_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.radiology_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radiology_types_id_seq OWNER TO postgres;

--
-- Name: radiology_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.radiology_types_id_seq OWNED BY public.radiology_types.id;


--
-- Name: receipt_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_details (
    id bigint NOT NULL,
    receipt_id integer NOT NULL,
    purchase_order_detail_id integer NOT NULL,
    stock_transaction_id integer,
    item_id integer NOT NULL,
    expired_date date,
    qty integer DEFAULT 0 NOT NULL,
    purchase_price integer DEFAULT 0 NOT NULL,
    hna integer DEFAULT 0 NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.receipt_details OWNER TO postgres;

--
-- Name: receipt_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_details_id_seq OWNER TO postgres;

--
-- Name: receipt_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_details_id_seq OWNED BY public.receipt_details.id;


--
-- Name: receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipts (
    id bigint NOT NULL,
    date date NOT NULL,
    code character varying(35) NOT NULL,
    purchase_order_id integer NOT NULL,
    supplier_id integer NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    description text,
    is_receipt_order integer DEFAULT 0 NOT NULL,
    created_by integer NOT NULL,
    additional text DEFAULT '{}'::text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.receipts OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipts_id_seq OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipts_id_seq OWNED BY public.receipts.id;


--
-- Name: registration_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_details (
    id bigint NOT NULL,
    registration_id integer NOT NULL,
    destination character varying(25) NOT NULL,
    polyclinic_id integer,
    doctor_id integer,
    "time" time(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status integer DEFAULT 0 NOT NULL,
    medical_record_refer_id integer
);


ALTER TABLE public.registration_details OWNER TO postgres;

--
-- Name: registration_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_details_id_seq OWNER TO postgres;

--
-- Name: registration_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_details_id_seq OWNED BY public.registration_details.id;


--
-- Name: registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrations (
    id bigint NOT NULL,
    patient_type character varying(255),
    family_type character varying(255),
    code character varying(30) NOT NULL,
    insurance_code character varying(30),
    insurance_owner_name character varying(130),
    plafon double precision DEFAULT '0'::double precision NOT NULL,
    date date NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    patient_id integer,
    pic_id integer,
    assesment_id integer,
    medical_record_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by integer,
    updated_by integer,
    CONSTRAINT registrations_family_type_check CHECK (((family_type)::text = ANY (ARRAY[('ORANG TUA'::character varying)::text, ('DIRI SENDIRI'::character varying)::text, ('SUAMI/ISTRI'::character varying)::text, ('KELUARGA'::character varying)::text]))),
    CONSTRAINT registrations_patient_type_check CHECK (((patient_type)::text = ANY (ARRAY[('UMUM'::character varying)::text, ('ASURANSI SWASTA'::character varying)::text])))
);


ALTER TABLE public.registrations OWNER TO postgres;

--
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registrations_id_seq OWNER TO postgres;

--
-- Name: registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registrations_id_seq OWNED BY public.registrations.id;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_user (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_user OWNER TO postgres;

--
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_id_seq OWNER TO postgres;

--
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_user_id_seq OWNED BY public.role_user.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255),
    level integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    content text DEFAULT '{}'::text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: side_effect_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.side_effect_details (
    id bigint NOT NULL,
    side_effect_id integer NOT NULL,
    name character varying(200) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.side_effect_details OWNER TO postgres;

--
-- Name: side_effect_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.side_effect_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.side_effect_details_id_seq OWNER TO postgres;

--
-- Name: side_effect_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.side_effect_details_id_seq OWNED BY public.side_effect_details.id;


--
-- Name: side_effects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.side_effects (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    is_active character varying(200) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.side_effects OWNER TO postgres;

--
-- Name: side_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.side_effects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.side_effects_id_seq OWNER TO postgres;

--
-- Name: side_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.side_effects_id_seq OWNED BY public.side_effects.id;


--
-- Name: specializations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specializations (
    id bigint NOT NULL,
    code character varying(40) NOT NULL,
    name character varying(100) NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    doctor_roles text DEFAULT '{}'::text NOT NULL,
    nurse_roles text DEFAULT '{}'::text NOT NULL,
    grup_nota_roles text DEFAULT '[]'::text NOT NULL
);


ALTER TABLE public.specializations OWNER TO postgres;

--
-- Name: specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specializations_id_seq OWNER TO postgres;

--
-- Name: specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specializations_id_seq OWNED BY public.specializations.id;


--
-- Name: stock_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_transactions (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    date date NOT NULL,
    stock_id integer,
    item_id integer NOT NULL,
    supplier_id integer,
    expired_date date,
    lokasi_id integer NOT NULL,
    receipt_detail_id integer,
    in_qty integer DEFAULT 0 NOT NULL,
    out_qty integer DEFAULT 0 NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    description text,
    is_adjustment integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.stock_transactions OWNER TO postgres;

--
-- Name: stock_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_transactions_id_seq OWNER TO postgres;

--
-- Name: stock_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_transactions_id_seq OWNED BY public.stock_transactions.id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    item_id integer NOT NULL,
    lokasi_id integer NOT NULL,
    expired_date date,
    qty integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: treatment_group_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_group_details (
    id bigint NOT NULL,
    treatment_group_id integer NOT NULL,
    item_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.treatment_group_details OWNER TO postgres;

--
-- Name: treatment_group_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treatment_group_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treatment_group_details_id_seq OWNER TO postgres;

--
-- Name: treatment_group_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treatment_group_details_id_seq OWNED BY public.treatment_group_details.id;


--
-- Name: treatment_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_groups (
    id bigint NOT NULL,
    item_id integer NOT NULL,
    percentage integer DEFAULT 0 NOT NULL,
    grup_nota_id integer NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.treatment_groups OWNER TO postgres;

--
-- Name: treatment_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treatment_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treatment_groups_id_seq OWNER TO postgres;

--
-- Name: treatment_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treatment_groups_id_seq OWNED BY public.treatment_groups.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    oauth_provider character varying(255),
    oauth_provider_id character varying(255),
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(60) NOT NULL,
    avatar character varying(255),
    email_verified character varying(255) DEFAULT '0'::character varying NOT NULL,
    email_verification_code character varying(60),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    username character varying(255) NOT NULL,
    group_user_id integer,
    code character varying(30) NOT NULL,
    fullname character varying(255),
    is_admin integer DEFAULT 0 NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    contact_id integer,
    CONSTRAINT users_email_verified_check CHECK (((email_verified)::text = ANY (ARRAY[('1'::character varying)::text, ('0'::character varying)::text])))
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
-- Name: villages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villages (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    district_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.villages OWNER TO postgres;

--
-- Name: villages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.villages_id_seq OWNER TO postgres;

--
-- Name: villages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villages_id_seq OWNED BY public.villages.id;


--
-- Name: adjustment_stock_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stock_details ALTER COLUMN id SET DEFAULT nextval('public.adjustment_stock_details_id_seq'::regclass);


--
-- Name: adjustment_stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stocks ALTER COLUMN id SET DEFAULT nextval('public.adjustment_stocks_id_seq'::regclass);


--
-- Name: assesment_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesment_details ALTER COLUMN id SET DEFAULT nextval('public.assesment_details_id_seq'::regclass);


--
-- Name: assesments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesments ALTER COLUMN id SET DEFAULT nextval('public.assesments_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);


--
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: formula_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details ALTER COLUMN id SET DEFAULT nextval('public.formula_details_id_seq'::regclass);


--
-- Name: formulas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formulas ALTER COLUMN id SET DEFAULT nextval('public.formulas_id_seq'::regclass);


--
-- Name: invoice_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_details ALTER COLUMN id SET DEFAULT nextval('public.invoice_details_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: laboratory_treatments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_treatments ALTER COLUMN id SET DEFAULT nextval('public.laboratory_treatments_id_seq'::regclass);


--
-- Name: laboratory_type_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_type_details ALTER COLUMN id SET DEFAULT nextval('public.laboratory_type_details_id_seq'::regclass);


--
-- Name: laboratory_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_types ALTER COLUMN id SET DEFAULT nextval('public.laboratory_types_id_seq'::regclass);


--
-- Name: letters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters ALTER COLUMN id SET DEFAULT nextval('public.letters_id_seq'::regclass);


--
-- Name: medical_record_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_record_details ALTER COLUMN id SET DEFAULT nextval('public.medical_record_details_id_seq'::regclass);


--
-- Name: medical_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records ALTER COLUMN id SET DEFAULT nextval('public.medical_records_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: movement_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details ALTER COLUMN id SET DEFAULT nextval('public.movement_details_id_seq'::regclass);


--
-- Name: movements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movements ALTER COLUMN id SET DEFAULT nextval('public.movements_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: periodical_stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodical_stocks ALTER COLUMN id SET DEFAULT nextval('public.periodical_stocks_id_seq'::regclass);


--
-- Name: permission_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role ALTER COLUMN id SET DEFAULT nextval('public.permission_role_id_seq'::regclass);


--
-- Name: permission_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user ALTER COLUMN id SET DEFAULT nextval('public.permission_user_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: pieces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pieces ALTER COLUMN id SET DEFAULT nextval('public.pieces_id_seq'::regclass);


--
-- Name: pivot_medical_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pivot_medical_records ALTER COLUMN id SET DEFAULT nextval('public.pivot_medical_records_id_seq'::regclass);


--
-- Name: polyclinics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polyclinics ALTER COLUMN id SET DEFAULT nextval('public.polyclinics_id_seq'::regclass);


--
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- Name: purchase_order_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details ALTER COLUMN id SET DEFAULT nextval('public.purchase_order_details_id_seq'::regclass);


--
-- Name: purchase_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.purchase_orders_id_seq'::regclass);


--
-- Name: purchase_request_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_request_details ALTER COLUMN id SET DEFAULT nextval('public.purchase_request_details_id_seq'::regclass);


--
-- Name: purchase_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_requests ALTER COLUMN id SET DEFAULT nextval('public.purchase_requests_id_seq'::regclass);


--
-- Name: radiology_type_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radiology_type_details ALTER COLUMN id SET DEFAULT nextval('public.radiology_type_details_id_seq'::regclass);


--
-- Name: radiology_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radiology_types ALTER COLUMN id SET DEFAULT nextval('public.radiology_types_id_seq'::regclass);


--
-- Name: receipt_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_details ALTER COLUMN id SET DEFAULT nextval('public.receipt_details_id_seq'::regclass);


--
-- Name: receipts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts ALTER COLUMN id SET DEFAULT nextval('public.receipts_id_seq'::regclass);


--
-- Name: registration_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_details ALTER COLUMN id SET DEFAULT nextval('public.registration_details_id_seq'::regclass);


--
-- Name: registrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations ALTER COLUMN id SET DEFAULT nextval('public.registrations_id_seq'::regclass);


--
-- Name: role_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user ALTER COLUMN id SET DEFAULT nextval('public.role_user_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: side_effect_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.side_effect_details ALTER COLUMN id SET DEFAULT nextval('public.side_effect_details_id_seq'::regclass);


--
-- Name: side_effects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.side_effects ALTER COLUMN id SET DEFAULT nextval('public.side_effects_id_seq'::regclass);


--
-- Name: specializations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations ALTER COLUMN id SET DEFAULT nextval('public.specializations_id_seq'::regclass);


--
-- Name: stock_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions ALTER COLUMN id SET DEFAULT nextval('public.stock_transactions_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: treatment_group_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_group_details ALTER COLUMN id SET DEFAULT nextval('public.treatment_group_details_id_seq'::regclass);


--
-- Name: treatment_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_groups ALTER COLUMN id SET DEFAULT nextval('public.treatment_groups_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: villages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villages ALTER COLUMN id SET DEFAULT nextval('public.villages_id_seq'::regclass);


--
-- Data for Name: adjustment_stock_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adjustment_stock_details (id, adjustment_stock_id, stock_awal_id, stock_transaction_id, item_id, previous_qty, qty, previous_expired_date, expired_date, lokasi_id, created_at, updated_at) FROM stdin;
1	1	3	5	9	4	80	2020-03-25	2020-04-15	49	2020-03-15 09:50:04	2020-03-15 09:50:04
\.


--
-- Data for Name: adjustment_stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adjustment_stocks (id, date, created_by, created_at, updated_at) FROM stdin;
1	2020-03-15	43	2020-03-15 09:50:04	2020-03-15 09:50:04
\.


--
-- Data for Name: assesment_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assesment_details (id, assesment_id, disease_id, cure, last_checkup_date, pain_location, is_other_pain_type, pain_type, pain_duration, emergence_time, side_effect, is_unknown, is_allergy_history, is_disease_history, is_family_disease_history, is_pain_history, is_pain_cure_history, is_kid_history, is_pregnant_week_age, kid_order, partus_year, partus_location, pregnant_month_age, pregnant_week_age, birth_type, birth_helper, birth_obstacle, baby_gender, weight, long, komplikasi_nifas, is_imunisasi_history, is_other_imunisasi, imunisasi_year_age, imunisasi_month_age, is_imunisasi_month_age, imunisasi, reaksi_imunisasi, created_at, updated_at) FROM stdin;
165	15	\N	\N	\N	perut bagian atas	0	MENUSUK	hilang timbul	\N	\N	0	0	0	0	1	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	0	0	\N	\N	2020-06-11 07:58:48	2020-06-11 07:58:48
166	15	\N	udang	\N	\N	0	\N	\N	\N	gatal gatal	0	1	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	0	0	\N	\N	2020-06-11 07:58:48	2020-06-11 07:58:48
\.


--
-- Data for Name: assesments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assesments (id, step, date, registration_id, patient_id, created_by, updated_by, created_at, updated_at, is_disturb, pain_score, pain_description, fallen, fallen_description, secondary_diagnose, secondary_diagnose_description, helper, helper_description, infus, infus_description, walking, walking_description, mental, mental_description, risk_level, risk_level_status, risk_level_description, menarche_age, siklus_haid, jumlah_pemakaian_pembalut, lama_pemakaian_pembalut, is_tidy, hpht, haid_complaint, marriage_status, marriage_duration, is_pernah_kb, kb_item, kb_start_time, kb_complaint, gravida, partus, abortus, imunisasi_tt, pada_usia_kehamilan, pemakaian_obat_saat_kehamilan, keluhan_saat_kehamilan, general_condition, gigi_tumbuh_pertama, long, weight, blood_pressure, pulse, temperature, breath_frequency, prebirth_weight, postbirth_weight, birth_long, birth_weight, head_size, arm_size, berguling_usia, duduk_usia, merangkak_usia, berdiri_usia, berjalan_usia, bicara_usia, main_complaint) FROM stdin;
15	0	2020-06-11	18	269	43	43	2020-06-11 07:48:07	2020-06-11 07:58:41	1	6	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	15	30 hari	5	7-10 hari	1	2020-05-28	-	belum menikah	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	CM	\N	160	65	120/80	100	36.7999999999999972	20	0	0	0	0	0	0	0	0	0	0	0	0	nyeri perut
16	0	2020-06-12	19	271	43	\N	2020-06-12 03:48:27	2020-06-12 03:48:27	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
17	0	2020-06-12	20	250	43	\N	2020-06-12 04:04:46	2020-06-12 04:04:46	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
18	0	2020-06-30	21	281	43	\N	2020-06-30 04:17:08	2020-06-30 04:17:08	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
19	0	2020-06-30	22	283	43	\N	2020-06-30 04:22:37	2020-06-30 04:22:37	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
20	0	2020-06-30	23	286	43	\N	2020-06-30 09:37:18	2020-06-30 09:37:18	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
21	0	2020-06-30	24	265	43	\N	2020-06-30 10:41:28	2020-06-30 10:41:28	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
22	0	2020-06-30	25	286	43	\N	2020-06-30 10:57:50	2020-06-30 10:57:50	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
23	0	2020-07-01	26	265	43	\N	2020-07-01 07:23:17	2020-07-01 07:23:17	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
24	0	2020-07-01	27	288	43	\N	2020-07-01 09:33:17	2020-07-01 09:33:17	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
7	0	2020-03-08	10	240	43	\N	2020-03-08 03:54:01	2020-03-08 03:54:01	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
25	0	2020-07-01	28	290	43	\N	2020-07-01 09:34:12	2020-07-01 09:34:12	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
26	0	2020-07-01	29	240	43	\N	2020-07-01 09:36:29	2020-07-01 09:36:29	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
2	0	2020-03-06	5	240	43	\N	2020-03-06 03:44:46	2020-03-06 03:44:46	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
3	0	2020-03-06	6	252	43	\N	2020-03-06 05:12:36	2020-03-06 05:12:36	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
4	0	2020-03-06	7	240	43	\N	2020-03-06 06:43:17	2020-03-06 06:43:17	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
5	0	2020-03-06	8	240	43	\N	2020-03-06 06:44:34	2020-03-06 06:44:34	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
6	0	2020-03-08	9	240	43	\N	2020-03-08 03:40:08	2020-03-08 03:40:08	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
8	0	2020-03-12	11	240	43	\N	2020-03-12 09:47:24	2020-03-12 09:47:24	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
9	0	2020-03-12	12	240	43	\N	2020-03-12 09:53:32	2020-03-12 09:53:32	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
10	0	2020-03-13	13	240	43	\N	2020-03-13 03:10:59	2020-03-13 03:10:59	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
11	0	2020-03-14	14	240	43	\N	2020-03-14 17:29:32	2020-03-14 17:29:32	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
12	0	2020-03-19	15	264	43	\N	2020-03-19 06:18:57	2020-03-19 06:18:57	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
13	0	2020-03-19	16	265	43	\N	2020-03-19 06:23:27	2020-03-19 06:23:27	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
14	0	2020-03-19	17	264	43	\N	2020-03-19 06:28:45	2020-03-19 06:28:45	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, province_id, name, type, created_at, updated_at) FROM stdin;
1	1	Aceh Barat	kabupaten	\N	\N
2	1	Aceh Barat Daya	kabupaten	\N	\N
3	1	Aceh Besar	kabupaten	\N	\N
4	1	Aceh Jaya	kabupaten	\N	\N
5	1	Aceh Selatan	kabupaten	\N	\N
6	1	Aceh Singkil	kabupaten	\N	\N
7	1	Aceh Tamiang	kabupaten	\N	\N
8	1	Aceh Tengah	kabupaten	\N	\N
9	1	Aceh Tenggara	kabupaten	\N	\N
10	1	Aceh Timur	kabupaten	\N	\N
11	1	Aceh Utara	kabupaten	\N	\N
12	1	Bener Meriah	kabupaten	\N	\N
13	1	Bireuen	kabupaten	\N	\N
14	1	Gayo Luwes	kabupaten	\N	\N
15	1	Nagan Raya	kabupaten	\N	\N
16	1	Pidie	kabupaten	\N	\N
17	1	Pidie Jaya	kabupaten	\N	\N
18	1	Simeulue	kabupaten	\N	\N
19	1	Banda Aceh	kota	\N	\N
20	1	Langsa	kota	\N	\N
21	1	Lhokseumawe	kota	\N	\N
22	1	Sabang	kota	\N	\N
23	1	Subulussalam	kota	\N	\N
24	2	Asahan	kabupaten	\N	\N
25	2	Batubara	kabupaten	\N	\N
26	2	Dairi	kabupaten	\N	\N
27	2	Deli Serdang	kabupaten	\N	\N
28	2	Humbang Hasundutan	kabupaten	\N	\N
29	2	Karo	kabupaten	\N	\N
30	2	Labuhan Batu	kabupaten	\N	\N
31	2	Labuhanbatu Selatan	kabupaten	\N	\N
32	2	Labuhanbatu Utara	kabupaten	\N	\N
33	2	Langkat	kabupaten	\N	\N
34	2	Mandailing Natal	kabupaten	\N	\N
35	2	Nias	kabupaten	\N	\N
36	2	Nias Barat	kabupaten	\N	\N
37	2	Nias Selatan	kabupaten	\N	\N
38	2	Nias Utara	kabupaten	\N	\N
39	2	Padang Lawas	kabupaten	\N	\N
40	2	Padang Lawas Utara	kabupaten	\N	\N
41	2	Pakpak Barat	kabupaten	\N	\N
42	2	Samosir	kabupaten	\N	\N
43	2	Serdang Bedagai	kabupaten	\N	\N
44	2	Simalungun	kabupaten	\N	\N
45	2	Tapanuli Selatan	kabupaten	\N	\N
46	2	Tapanuli Tengah	kabupaten	\N	\N
47	2	Tapanuli Utara	kabupaten	\N	\N
48	2	Toba Samosir	kabupaten	\N	\N
49	2	Binjai	kota	\N	\N
50	2	Gunung Sitoli	kota	\N	\N
51	2	Medan	kota	\N	\N
52	2	Padangsidempuan	kota	\N	\N
53	2	Pematang Siantar	kota	\N	\N
54	2	Sibolga	kota	\N	\N
55	2	Tanjung Balai	kota	\N	\N
56	2	Tebing Tinggi	kota	\N	\N
57	3	Agam	kabupaten	\N	\N
58	3	Dharmas Raya	kabupaten	\N	\N
59	3	Kepulauan Mentawai	kabupaten	\N	\N
60	3	Lima Puluh Kota	kabupaten	\N	\N
61	3	Padang Pariaman	kabupaten	\N	\N
62	3	Pasaman	kabupaten	\N	\N
63	3	Pasaman Barat	kabupaten	\N	\N
64	3	Pesisir Selatan	kabupaten	\N	\N
65	3	Sijunjung	kabupaten	\N	\N
66	3	Solok	kabupaten	\N	\N
67	3	Solok Selatan	kabupaten	\N	\N
68	3	Tanah Datar	kabupaten	\N	\N
69	3	Bukittinggi	kota	\N	\N
70	3	Padang	kota	\N	\N
71	3	Padang Panjang	kota	\N	\N
72	3	Pariaman	kota	\N	\N
73	3	Payakumbuh	kota	\N	\N
74	3	Sawah Lunto	kota	\N	\N
75	3	Solok	kota	\N	\N
76	4	Bengkalis	kabupaten	\N	\N
77	4	Indragiri Hilir	kabupaten	\N	\N
78	4	Indragiri Hulu	kabupaten	\N	\N
79	4	Kampar	kabupaten	\N	\N
80	4	Kuantan Singingi	kabupaten	\N	\N
81	4	Meranti	kabupaten	\N	\N
82	4	Pelalawan	kabupaten	\N	\N
83	4	Rokan Hilir	kabupaten	\N	\N
84	4	Rokan Hulu	kabupaten	\N	\N
85	4	Siak	kabupaten	\N	\N
86	4	Dumai	kota	\N	\N
87	4	Pekanbaru	kota	\N	\N
88	5	Bintan	kabupaten	\N	\N
89	5	Karimun	kabupaten	\N	\N
90	5	Kepulauan Anambas	kabupaten	\N	\N
91	5	Lingga	kabupaten	\N	\N
92	5	Natuna	kabupaten	\N	\N
93	5	Batam	kota	\N	\N
94	5	Tanjung Pinang	kota	\N	\N
95	6	Bangka	kabupaten	\N	\N
96	6	Bangka Barat	kabupaten	\N	\N
97	6	Bangka Selatan	kabupaten	\N	\N
98	6	Bangka Tengah	kabupaten	\N	\N
99	6	Belitung	kabupaten	\N	\N
100	6	Belitung Timur	kabupaten	\N	\N
101	6	Pangkal Pinang	kota	\N	\N
102	7	Kerinci	kabupaten	\N	\N
103	7	Merangin	kabupaten	\N	\N
104	7	Sarolangun	kabupaten	\N	\N
105	7	Batang Hari	kabupaten	\N	\N
106	7	Muaro Jambi	kabupaten	\N	\N
107	7	Tanjung Jabung Timur	kabupaten	\N	\N
108	7	Tanjung Jabung Barat	kabupaten	\N	\N
109	7	Tebo	kabupaten	\N	\N
110	7	Bungo	kabupaten	\N	\N
111	7	Jambi	kota	\N	\N
112	7	Sungai Penuh	kota	\N	\N
113	8	Bengkulu Selatan	kabupaten	\N	\N
114	8	Bengkulu Tengah	kabupaten	\N	\N
115	8	Bengkulu Utara	kabupaten	\N	\N
116	8	Kaur	kabupaten	\N	\N
117	8	Kepahiang	kabupaten	\N	\N
118	8	Lebong	kabupaten	\N	\N
119	8	Mukomuko	kabupaten	\N	\N
120	8	Rejang Lebong	kabupaten	\N	\N
121	8	Seluma	kabupaten	\N	\N
122	8	Bengkulu	kota	\N	\N
123	9	Banyuasin	kabupaten	\N	\N
124	9	Empat Lawang	kabupaten	\N	\N
125	9	Lahat	kabupaten	\N	\N
126	9	Muara Enim	kabupaten	\N	\N
127	9	Musi Banyu Asin	kabupaten	\N	\N
128	9	Musi Rawas	kabupaten	\N	\N
129	9	Ogan Ilir	kabupaten	\N	\N
130	9	Ogan Komering Ilir	kabupaten	\N	\N
131	9	Ogan Komering Ulu	kabupaten	\N	\N
132	9	Ogan Komering Ulu Se	kabupaten	\N	\N
133	9	Ogan Komering Ulu Ti	kabupaten	\N	\N
134	9	Lubuklinggau	kota	\N	\N
135	9	Pagar Alam	kota	\N	\N
136	9	Palembang	kota	\N	\N
137	9	Prabumulih	kota	\N	\N
138	10	Lampung Barat	kabupaten	\N	\N
139	10	Lampung Selatan	kabupaten	\N	\N
140	10	Lampung Tengah	kabupaten	\N	\N
141	10	Lampung Timur	kabupaten	\N	\N
142	10	Lampung Utara	kabupaten	\N	\N
143	10	Mesuji	kabupaten	\N	\N
144	10	Pesawaran	kabupaten	\N	\N
145	10	Pringsewu	kabupaten	\N	\N
146	10	Tanggamus	kabupaten	\N	\N
147	10	Tulang Bawang	kabupaten	\N	\N
148	10	Tulang Bawang Barat	kabupaten	\N	\N
149	10	Way Kanan	kabupaten	\N	\N
150	10	Bandar Lampung	kota	\N	\N
151	10	Metro	kota	\N	\N
152	11	Lebak	kabupaten	\N	\N
153	11	Pandeglang	kabupaten	\N	\N
154	11	Serang	kabupaten	\N	\N
155	11	Tangerang	kabupaten	\N	\N
156	11	Cilegon	kota	\N	\N
157	11	Serang	kota	\N	\N
158	11	Tangerang	kota	\N	\N
159	11	Tangerang Selatan	kota	\N	\N
160	12	Adm. Kepulauan Serib	kabupaten	\N	\N
161	12	Jakarta Barat	kota	\N	\N
162	12	Jakarta Pusat	kota	\N	\N
163	12	Jakarta Selatan	kota	\N	\N
164	12	Jakarta Timur	kota	\N	\N
165	12	Jakarta Utara	kota	\N	\N
166	13	Bandung	kabupaten	\N	\N
167	13	Bandung Barat	kabupaten	\N	\N
168	13	Bekasi	kabupaten	\N	\N
169	13	Bogor	kabupaten	\N	\N
170	13	Ciamis	kabupaten	\N	\N
171	13	Cianjur	kabupaten	\N	\N
172	13	Cirebon	kabupaten	\N	\N
173	13	Garut	kabupaten	\N	\N
174	13	Indramayu	kabupaten	\N	\N
175	13	Karawang	kabupaten	\N	\N
176	13	Kuningan	kabupaten	\N	\N
177	13	Majalengka	kabupaten	\N	\N
178	13	Purwakarta	kabupaten	\N	\N
179	13	Subang	kabupaten	\N	\N
180	13	Sukabumi	kabupaten	\N	\N
181	13	Sumedang	kabupaten	\N	\N
182	13	Tasikmalaya	kabupaten	\N	\N
183	13	Bandung	kota	\N	\N
184	13	Banjar	kota	\N	\N
185	13	Bekasi	kota	\N	\N
186	13	Bogor	kota	\N	\N
187	13	Cimahi	kota	\N	\N
188	13	Cirebon	kota	\N	\N
189	13	Depok	kota	\N	\N
190	13	Sukabumi	kota	\N	\N
191	13	Tasikmalaya	kota	\N	\N
192	14	Banjarnegara	kabupaten	\N	\N
193	14	Banyumas	kabupaten	\N	\N
194	14	Batang	kabupaten	\N	\N
195	14	Blora	kabupaten	\N	\N
196	14	Boyolali	kabupaten	\N	\N
197	14	Brebes	kabupaten	\N	\N
198	14	Cilacap	kabupaten	\N	\N
199	14	Demak	kabupaten	\N	\N
200	14	Grobogan	kabupaten	\N	\N
201	14	Jepara	kabupaten	\N	\N
202	14	Karanganyar	kabupaten	\N	\N
203	14	Kebumen	kabupaten	\N	\N
204	14	Kendal	kabupaten	\N	\N
205	14	Klaten	kabupaten	\N	\N
206	14	Kota Tegal	kabupaten	\N	\N
207	14	Kudus	kabupaten	\N	\N
208	14	Magelang	kabupaten	\N	\N
209	14	Pati	kabupaten	\N	\N
210	14	Pekalongan	kabupaten	\N	\N
211	14	Pemalang	kabupaten	\N	\N
212	14	Purbalingga	kabupaten	\N	\N
213	14	Purworejo	kabupaten	\N	\N
214	14	Rembang	kabupaten	\N	\N
215	14	Semarang	kabupaten	\N	\N
216	14	Sragen	kabupaten	\N	\N
217	14	Sukoharjo	kabupaten	\N	\N
218	14	Temanggung	kabupaten	\N	\N
219	14	Wonogiri	kabupaten	\N	\N
220	14	Wonosobo	kabupaten	\N	\N
221	14	Magelang	kota	\N	\N
222	14	Pekalongan	kota	\N	\N
223	14	Salatiga	kota	\N	\N
224	14	Semarang	kota	\N	\N
225	14	Surakarta	kota	\N	\N
226	14	Tegal	kota	\N	\N
227	15	Bantul	kabupaten	\N	\N
228	15	Gunung Kidul	kabupaten	\N	\N
229	15	Kulon Progo	kabupaten	\N	\N
230	15	Sleman	kabupaten	\N	\N
231	15	Yogyakarta	kota	\N	\N
232	16	Bangkalan	kabupaten	\N	\N
233	16	Banyuwangi	kabupaten	\N	\N
234	16	Blitar	kabupaten	\N	\N
235	16	Bojonegoro	kabupaten	\N	\N
236	16	Bondowoso	kabupaten	\N	\N
237	16	Gresik	kabupaten	\N	\N
238	16	Jember	kabupaten	\N	\N
239	16	Jombang	kabupaten	\N	\N
240	16	Kediri	kabupaten	\N	\N
241	16	Lamongan	kabupaten	\N	\N
242	16	Lumajang	kabupaten	\N	\N
243	16	Madiun	kabupaten	\N	\N
244	16	Magetan	kabupaten	\N	\N
245	16	Malang	kabupaten	\N	\N
246	16	Mojokerto	kabupaten	\N	\N
247	16	Nganjuk	kabupaten	\N	\N
248	16	Ngawi	kabupaten	\N	\N
249	16	Pacitan	kabupaten	\N	\N
250	16	Pamekasan	kabupaten	\N	\N
251	16	Pasuruan	kabupaten	\N	\N
252	16	Ponorogo	kabupaten	\N	\N
253	16	Probolinggo	kabupaten	\N	\N
254	16	Sampang	kabupaten	\N	\N
255	16	Sidoarjo	kabupaten	\N	\N
256	16	Situbondo	kabupaten	\N	\N
257	16	Sumenep	kabupaten	\N	\N
258	16	Trenggalek	kabupaten	\N	\N
259	16	Tuban	kabupaten	\N	\N
260	16	Tulungagung	kabupaten	\N	\N
261	16	Batu	kota	\N	\N
262	16	Blitar	kota	\N	\N
263	16	Kediri	kota	\N	\N
264	16	Madiun	kota	\N	\N
265	16	Malang	kota	\N	\N
266	16	Mojokerto	kota	\N	\N
267	16	Pasuruan	kota	\N	\N
268	16	Probolinggo	kota	\N	\N
269	16	Surabaya	kota	\N	\N
270	17	Badung	kabupaten	\N	\N
271	17	Bangli	kabupaten	\N	\N
272	17	Buleleng	kabupaten	\N	\N
273	17	Gianyar	kabupaten	\N	\N
274	17	Jembrana	kabupaten	\N	\N
275	17	Karang Asem	kabupaten	\N	\N
276	17	Klungkung	kabupaten	\N	\N
277	17	Tabanan	kabupaten	\N	\N
278	17	Denpasar	kota	\N	\N
279	18	Bima	kabupaten	\N	\N
280	18	Dompu	kabupaten	\N	\N
281	18	Lombok Barat	kabupaten	\N	\N
282	18	Lombok Tengah	kabupaten	\N	\N
283	18	Lombok Timur	kabupaten	\N	\N
284	18	Lombok Utara	kabupaten	\N	\N
285	18	Sumbawa	kabupaten	\N	\N
286	18	Sumbawa Barat	kabupaten	\N	\N
287	18	Bima	kota	\N	\N
288	18	Mataram	kota	\N	\N
289	19	Alor	kabupaten	\N	\N
290	19	Belu	kabupaten	\N	\N
291	19	Ende	kabupaten	\N	\N
292	19	Flores Timur	kabupaten	\N	\N
293	19	Kupang	kabupaten	\N	\N
294	19	Lembata	kabupaten	\N	\N
295	19	Manggarai	kabupaten	\N	\N
296	19	Manggarai Barat	kabupaten	\N	\N
297	19	Manggarai Timur	kabupaten	\N	\N
298	19	Nagekeo	kabupaten	\N	\N
299	19	Ngada	kabupaten	\N	\N
300	19	Rote Ndao	kabupaten	\N	\N
301	19	Sabu Raijua	kabupaten	\N	\N
302	19	Sikka	kabupaten	\N	\N
303	19	Sumba Barat	kabupaten	\N	\N
304	19	Sumba Barat Daya	kabupaten	\N	\N
305	19	Sumba Tengah	kabupaten	\N	\N
306	19	Sumba Timur	kabupaten	\N	\N
307	19	Timor Tengah Selatan	kabupaten	\N	\N
308	19	Timor Tengah Utara	kabupaten	\N	\N
309	19	Kupang	kota	\N	\N
310	20	Bengkayang	kabupaten	\N	\N
311	20	Kapuas Hulu	kabupaten	\N	\N
312	20	Kayong Utara	kabupaten	\N	\N
313	20	Ketapang	kabupaten	\N	\N
314	20	Kubu Raya	kabupaten	\N	\N
315	20	Landak	kabupaten	\N	\N
316	20	Melawi	kabupaten	\N	\N
317	20	Pontianak	kabupaten	\N	\N
318	20	Sambas	kabupaten	\N	\N
319	20	Sanggau	kabupaten	\N	\N
320	20	Sekadau	kabupaten	\N	\N
321	20	Sintang	kabupaten	\N	\N
322	20	Pontianak	kota	\N	\N
323	20	Singkawang	kota	\N	\N
324	21	Barito Selatan	kabupaten	\N	\N
325	21	Barito Timur	kabupaten	\N	\N
326	21	Barito Utara	kabupaten	\N	\N
327	21	Gunung Mas	kabupaten	\N	\N
328	21	Kapuas	kabupaten	\N	\N
329	21	Katingan	kabupaten	\N	\N
330	21	Kotawaringin Barat	kabupaten	\N	\N
331	21	Kotawaringin Timur	kabupaten	\N	\N
332	21	Lamandau	kabupaten	\N	\N
333	21	Murung Raya	kabupaten	\N	\N
334	21	Pulang Pisau	kabupaten	\N	\N
335	21	Seruyan	kabupaten	\N	\N
336	21	Sukamara	kabupaten	\N	\N
337	21	Palangkaraya	kota	\N	\N
338	22	Balangan	kabupaten	\N	\N
339	22	Banjar	kabupaten	\N	\N
340	22	Barito Kuala	kabupaten	\N	\N
341	22	Hulu Sungai Selatan	kabupaten	\N	\N
342	22	Hulu Sungai Tengah	kabupaten	\N	\N
343	22	Hulu Sungai Utara	kabupaten	\N	\N
344	22	Kota Baru	kabupaten	\N	\N
345	22	Tabalong	kabupaten	\N	\N
346	22	Tanah Bumbu	kabupaten	\N	\N
347	22	Tanah Laut	kabupaten	\N	\N
348	22	Tapin	kabupaten	\N	\N
349	22	Banjar Baru	kota	\N	\N
350	22	Banjarmasin	kota	\N	\N
351	23	Berau	kabupaten	\N	\N
352	23	Bulongan	kabupaten	\N	\N
353	23	Kutai Barat	kabupaten	\N	\N
354	23	Kutai Kartanegara	kabupaten	\N	\N
355	23	Kutai Timur	kabupaten	\N	\N
356	23	Malinau	kabupaten	\N	\N
357	23	Nunukan	kabupaten	\N	\N
358	23	Paser	kabupaten	\N	\N
359	23	Penajam Paser Utara	kabupaten	\N	\N
360	23	Tana Tidung	kabupaten	\N	\N
361	23	Balikpapan	kota	\N	\N
362	23	Bontang	kota	\N	\N
363	23	Samarinda	kota	\N	\N
364	23	Tarakan	kota	\N	\N
365	24	Boalemo	kabupaten	\N	\N
366	24	Bone Bolango	kabupaten	\N	\N
367	24	Gorontalo	kabupaten	\N	\N
368	24	Gorontalo Utara	kabupaten	\N	\N
369	24	Pohuwato	kabupaten	\N	\N
370	24	Gorontalo	kota	\N	\N
371	25	Bantaeng	kabupaten	\N	\N
372	25	Barru	kabupaten	\N	\N
373	25	Bone	kabupaten	\N	\N
374	25	Bulukumba	kabupaten	\N	\N
375	25	Enrekang	kabupaten	\N	\N
376	25	Gowa	kabupaten	\N	\N
377	25	Jeneponto	kabupaten	\N	\N
378	25	Luwu	kabupaten	\N	\N
379	25	Luwu Timur	kabupaten	\N	\N
380	25	Luwu Utara	kabupaten	\N	\N
381	25	Maros	kabupaten	\N	\N
382	25	Pangkajene Kepulauan	kabupaten	\N	\N
383	25	Pinrang	kabupaten	\N	\N
384	25	Selayar	kabupaten	\N	\N
385	25	Sidenreng Rappang	kabupaten	\N	\N
386	25	Sinjai	kabupaten	\N	\N
387	25	Soppeng	kabupaten	\N	\N
388	25	Takalar	kabupaten	\N	\N
389	25	Tana Toraja	kabupaten	\N	\N
390	25	Toraja Utara	kabupaten	\N	\N
391	25	Wajo	kabupaten	\N	\N
392	25	Makassar	kota	\N	\N
393	25	Palopo	kota	\N	\N
394	25	Pare-pare	kota	\N	\N
395	26	Bombana	kabupaten	\N	\N
396	26	Buton	kabupaten	\N	\N
397	26	Buton Utara	kabupaten	\N	\N
398	26	Kolaka	kabupaten	\N	\N
399	26	Kolaka Utara	kabupaten	\N	\N
400	26	Konawe	kabupaten	\N	\N
401	26	Konawe Selatan	kabupaten	\N	\N
402	26	Konawe Utara	kabupaten	\N	\N
403	26	Muna	kabupaten	\N	\N
404	26	Wakatobi	kabupaten	\N	\N
405	26	Bau-bau	kota	\N	\N
406	26	Kendari	kota	\N	\N
407	27	Banggai	kabupaten	\N	\N
408	27	Banggai Kepulauan	kabupaten	\N	\N
409	27	Buol	kabupaten	\N	\N
410	27	Donggala	kabupaten	\N	\N
411	27	Morowali	kabupaten	\N	\N
412	27	Parigi Moutong	kabupaten	\N	\N
413	27	Poso	kabupaten	\N	\N
414	27	Sigi	kabupaten	\N	\N
415	27	Tojo Una-Una	kabupaten	\N	\N
416	27	Toli Toli	kabupaten	\N	\N
417	27	Palu	kota	\N	\N
418	28	Bolaang Mangondow	kabupaten	\N	\N
419	28	Bolaang Mangondow Se	kabupaten	\N	\N
420	28	Bolaang Mangondow Ti	kabupaten	\N	\N
421	28	Bolaang Mangondow Ut	kabupaten	\N	\N
422	28	Kepulauan Sangihe	kabupaten	\N	\N
423	28	Kepulauan Siau Tagul	kabupaten	\N	\N
424	28	Kepulauan Talaud	kabupaten	\N	\N
425	28	Minahasa	kabupaten	\N	\N
426	28	Minahasa Selatan	kabupaten	\N	\N
427	28	Minahasa Tenggara	kabupaten	\N	\N
428	28	Minahasa Utara	kabupaten	\N	\N
429	28	Bitung	kota	\N	\N
430	28	Kotamobagu	kota	\N	\N
431	28	Manado	kota	\N	\N
432	28	Tomohon	kota	\N	\N
433	29	Majene	kabupaten	\N	\N
434	29	Mamasa	kabupaten	\N	\N
435	29	Mamuju	kabupaten	\N	\N
436	29	Mamuju Utara	kabupaten	\N	\N
437	29	Polewali Mandar	kabupaten	\N	\N
438	30	Buru	kabupaten	\N	\N
439	30	Buru Selatan	kabupaten	\N	\N
440	30	Kepulauan Aru	kabupaten	\N	\N
441	30	Maluku Barat Daya	kabupaten	\N	\N
442	30	Maluku Tengah	kabupaten	\N	\N
443	30	Maluku Tenggara	kabupaten	\N	\N
444	30	Maluku Tenggara Bara	kabupaten	\N	\N
445	30	Seram Bagian Barat	kabupaten	\N	\N
446	30	Seram Bagian Timur	kabupaten	\N	\N
447	30	Ambon	kota	\N	\N
448	30	Tual	kota	\N	\N
449	31	Halmahera Barat	kabupaten	\N	\N
450	31	Halmahera Selatan	kabupaten	\N	\N
451	31	Halmahera Tengah	kabupaten	\N	\N
452	31	Halmahera Timur	kabupaten	\N	\N
453	31	Halmahera Utara	kabupaten	\N	\N
454	31	Kepulauan Sula	kabupaten	\N	\N
455	31	Pulau Morotai	kabupaten	\N	\N
456	31	Ternate	kota	\N	\N
457	31	Tidore Kepulauan	kota	\N	\N
458	32	Fakfak	kabupaten	\N	\N
459	32	Kaimana	kabupaten	\N	\N
460	32	Manokwari	kabupaten	\N	\N
461	32	Maybrat	kabupaten	\N	\N
462	32	Raja Ampat	kabupaten	\N	\N
463	32	Sorong	kabupaten	\N	\N
464	32	Sorong Selatan	kabupaten	\N	\N
465	32	Tambrauw	kabupaten	\N	\N
466	32	Teluk Bintuni	kabupaten	\N	\N
467	32	Teluk Wondama	kabupaten	\N	\N
468	32	Sorong	kota	\N	\N
469	33	Merauke	kabupaten	\N	\N
470	33	Jayawijaya	kabupaten	\N	\N
471	33	Nabire	kabupaten	\N	\N
472	33	Kepulauan Yapen	kabupaten	\N	\N
473	33	Biak Numfor	kabupaten	\N	\N
474	33	Paniai	kabupaten	\N	\N
475	33	Puncak Jaya	kabupaten	\N	\N
476	33	Mimika	kabupaten	\N	\N
477	33	Boven Digoel	kabupaten	\N	\N
478	33	Mappi	kabupaten	\N	\N
479	33	Asmat	kabupaten	\N	\N
480	33	Yahukimo	kabupaten	\N	\N
481	33	Pegunungan Bintang	kabupaten	\N	\N
482	33	Tolikara	kabupaten	\N	\N
483	33	Sarmi	kabupaten	\N	\N
484	33	Keerom	kabupaten	\N	\N
485	33	Waropen	kabupaten	\N	\N
486	33	Jayapura	kabupaten	\N	\N
487	33	Deiyai	kabupaten	\N	\N
488	33	Dogiyai	kabupaten	\N	\N
489	33	Intan Jaya	kabupaten	\N	\N
490	33	Lanny Jaya	kabupaten	\N	\N
491	33	Mamberamo Raya	kabupaten	\N	\N
492	33	Mamberamo Tengah	kabupaten	\N	\N
493	33	Nduga	kabupaten	\N	\N
494	33	Puncak	kabupaten	\N	\N
495	33	Supiori	kabupaten	\N	\N
496	33	Yalimo	kabupaten	\N	\N
497	33	Jayapura	kota	\N	\N
498	34	Bulungan	kabupaten	\N	\N
499	34	Malinau	kabupaten	\N	\N
500	34	Nunukan	kabupaten	\N	\N
501	16	Wahyudi	kota	\N	\N
502	21	Kotawaringin Timur	kabupaten	\N	\N
503	23	Tanjungredep	kabupaten	\N	\N
505	11	Cimone - Cibitung	kabupaten	\N	\N
506	13	Kota Cikarang	kota	\N	\N
507	4	rrrfdsfs	kabupaten	2019-12-18 08:28:36	2019-12-18 08:28:36
508	4	dsddsaaa	kabupaten	2019-12-18 08:30:13	2019-12-18 08:30:13
513	3	cdsfds	kabupaten	2019-12-18 08:45:32	2019-12-18 08:45:32
514	16	surabaya	kabupaten	2020-03-19 06:18:57	2020-03-19 06:18:57
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, code, email, name, civil_code, pin, gender, blood_type, agency_type, job, religion, address, postal_code, phone, fax, account_id, start_date, birth_date, age, province_id, city_id, district_id, village_id, patient_type, is_active, is_contact, is_agency, is_patient, is_supplier, is_nurse, is_employee, is_doctor, is_family, is_nurse_helper, specialization_id, family_id, polyclinic_id, contact_id, group_user_id, supplier_id, supplier_disc_percent, pharmacy_disc_percent, lab_sender_fee_value, lab_refer_sender_fee_value, xray_sender_fee_value, xray_read_fee_value, usg_sender_fee_value, usg_read_fee_value, ecg_sender_fee_value, ecg_read_fee_value, medical_action_fee_value, consultation_fee_value, created_at, updated_at, birth_place, marriage_status, registration_id, created_by, updated_by, medical_record_id, assesment_id) FROM stdin;
112	R9002	\N	BPJS	\N	\N	\N	\N	ASURANSI	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	1	0	0	0	0	0	0	0	\N	\N	\N	171	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2019-12-08 04:36:45	2019-12-08 04:36:45	\N	\N	\N	43	\N	\N	\N
113	P02011	admin@indofarma.com	PT. Indofarma Global Medika	\N	\N	\N	\N	\N	\N	\N	Jl. Margorejo Indah No.137/58	611023	\N	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	1	0	0	0	0	0	\N	\N	\N	231	\N	\N	20	0	0	0	0	0	0	0	0	0	0	0	2020-01-03 02:53:45	2020-01-03 02:53:45	\N	\N	\N	43	\N	\N	\N
64	D-0004	\N	dr. Lia Amalia	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	4	\N	9	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 07:58:10	2020-01-09 04:51:28	\N	\N	\N	43	43	\N	\N
63	D-0003	\N	dr. Puspita Dyah Ardyani Isnanto Putri	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	4	\N	9	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 07:57:43	2020-01-09 04:51:40	\N	\N	\N	43	43	\N	\N
65	D-0005	\N	dr. Niken Wening Suryanti, SpOG	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	11	\N	10	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 07:58:46	2020-01-09 04:52:09	\N	\N	\N	43	43	\N	\N
61	D-0001	\N	dr. Sahar Bawazeer, Sp.B	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	5	\N	8	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 07:55:55	2020-01-09 04:52:37	\N	\N	\N	43	43	\N	\N
251	\N	\N	Strata Fabianisa	\N	\N	\N	\N	\N	SWASTA	\N	Medokan Asri Barat X no 11	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-09 07:06:53	2020-01-09 07:06:53	\N	\N	\N	60	\N	\N	\N
62	D-0002	\N	dr. Merlyna Savitri, Sp.PD	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	13	\N	13	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 07:57:16	2020-01-10 03:31:03	\N	\N	\N	43	43	\N	\N
254	\N	\N	Aan	\N	\N	\N	\N	\N	SWASTA	\N	Gubeng	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-10 04:04:17	2020-01-10 04:04:17	\N	\N	\N	43	\N	\N	\N
256	\N	\N	Deni Supri	\N	\N	\N	\N	\N	SWASTA	\N	Suraba	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-13 09:59:40	2020-01-13 09:59:40	\N	\N	\N	43	\N	\N	\N
255	\N	\N	Deni Supri	\N	\N	PRIA	\N	\N	\N	\N	Suraba	\N	32326566	\N	\N	\N	1998-01-01	22	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	256	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-13 09:59:40	2020-01-15 02:08:31	\N	\N	\N	43	43	\N	\N
259	\N	\N	Afid	\N	\N	\N	\N	\N	SWASTA	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-02-17 04:55:33	2020-02-17 04:55:33	\N	\N	\N	43	\N	\N	\N
260	D-0009	\N	dr. Joni	\N	\N	\N	\N	\N	\N	\N	\N	\N	083120381	\N	\N	\N	\N	0	\N	269	\N	\N	\N	0	0	0	0	0	0	0	1	0	0	4	\N	9	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-02-18 12:26:43	2020-02-18 12:27:58	\N	\N	\N	43	43	\N	\N
66	D-0006	\N	dr. Een Hendarsih, Sp.PD-KHOM	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	13	\N	13	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 07:59:48	2020-02-19 03:40:10	\N	\N	\N	43	43	\N	\N
252	\N	\N	Aan	\N	\N	WANITA	\N	\N	\N	\N	Gubeng	\N	\N	\N	\N	\N	2000-01-01	20	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	254	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-10 03:23:30	2020-03-06 05:12:36	\N	\N	\N	43	43	\N	3
262	\N	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-15 09:13:57	2020-03-15 09:13:57	\N	\N	\N	43	\N	\N	\N
263	S001	\N	PT Kalbe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2	\N	\N	\N	1	0	0	0	1	0	0	0	0	0	\N	\N	\N	262	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-15 09:13:57	2020-03-15 09:13:57	\N	\N	\N	43	\N	\N	\N
266	\N	\N	Faizul	\N	\N	\N	\N	\N	WIRASWASTA	\N	Jln diponegoro no 21	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-19 06:23:27	2020-03-19 06:23:27	\N	\N	\N	43	\N	\N	\N
268	\N	\N	fahd balbaid	\N	\N	\N	\N	\N	SWASTA	\N	johor no.27	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-19 06:28:45	2020-03-19 06:28:45	\N	\N	\N	43	\N	\N	\N
264	\N	\N	amira cholid bawazeer	\N	\N	WANITA	\N	\N	\N	\N	johor no. 27	\N	081331500042	\N	\N	\N	1984-04-21	36	16	514	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	268	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-19 06:18:57	2020-03-19 06:28:45	\N	\N	\N	43	43	\N	14
270	\N	\N	Aan Febrianti	\N	\N	\N	\N	\N	SWASTA	\N	Ngagel Jaya Utara IV / 7	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-11 07:48:07	2020-06-11 07:48:07	\N	\N	\N	43	\N	\N	\N
269	\N	\N	Aan Febrianti	\N	\N	WANITA	\N	\N	\N	\N	Ngagel Jaya Utara IV / 7	\N	\N	\N	\N	\N	2000-02-17	20	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	270	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-11 07:48:07	2020-06-11 07:48:07	\N	\N	\N	43	43	\N	15
272	\N	\N	Strata Fabianisa	\N	\N	\N	\N	\N	SWASTA	\N	Bronggalan Sawah II no 9	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-12 03:48:27	2020-06-12 03:48:27	\N	\N	\N	43	\N	\N	\N
250	\N	\N	Strata Fabianisa	\N	\N	WANITA	\N	\N	\N	\N	Medokan Asri Barat X no 11	\N	081216169232	\N	\N	\N	1982-02-16	38	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	251	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-09 07:06:53	2020-06-12 04:04:46	\N	\N	\N	60	43	\N	17
261	D-0010	\N	dr. Andi	\N	\N	\N	\N	\N	\N	\N	\N	\N	12321039021	\N	\N	\N	\N	0	\N	269	\N	\N	\N	0	0	0	0	0	0	0	1	0	0	15	\N	9	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-08 03:39:23	2020-06-30 06:34:25	\N	\N	\N	43	43	\N	\N
67	D-0007	\N	dr Santi Septika, Sp.Rad	\N	\N	\N	\N	\N	\N	\N	\N	\N	+62 31 3000 9009	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	2	\N	12	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-08 08:01:17	2020-06-30 06:35:54	\N	\N	\N	43	43	\N	\N
249	D-0008	\N	dr. Septria Elritarini SpA	\N	\N	\N	\N	\N	\N	\N	Raya Gubeng no 11	\N	30303030	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	12	\N	14	249	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-09 06:47:11	2020-06-30 06:36:17	\N	\N	\N	43	43	\N	\N
265	\N	\N	Faizul	\N	\N	PRIA	\N	\N	\N	\N	Jln diponegoro no 21	\N	0892132131	\N	\N	\N	2011-03-24	9	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	266	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-19 06:23:27	2020-07-01 07:23:17	\N	\N	\N	43	43	\N	23
240	\N	\N	Afid Kurniawan	\N	\N	PRIA	\N	\N	\N	\N	Semolowaru	\N	3333333333	\N	\N	\N	1993-01-01	27	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	259	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-01-09 06:07:08	2020-07-01 09:36:29	\N	\N	\N	43	43	\N	26
271	\N	\N	Strata Fabianisa	\N	\N	WANITA	\N	\N	\N	\N	Bronggalan Sawah II no 9	\N	081216169232	\N	\N	\N	1982-02-16	38	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	272	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-12 03:48:27	2020-06-12 03:48:27	\N	\N	\N	43	43	\N	16
273	\N	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:08:04	2020-06-26 08:08:04	\N	\N	\N	43	\N	\N	\N
274	Rad126062020	\N	Sismey	\N	12345	WANITA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	1	0	0	0	\N	\N	\N	273	67	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:08:04	2020-06-26 08:08:04	\N	MENIKAH	\N	43	\N	\N	\N
275	\N	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:09:33	2020-06-26 08:09:33	\N	\N	\N	43	\N	\N	\N
277	\N	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:10:20	2020-06-26 08:10:20	\N	\N	\N	43	\N	\N	\N
278	kas126062020	\N	yaniar	\N	12345	WANITA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	1	0	0	0	\N	\N	\N	277	22	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:10:20	2020-06-26 08:10:20	\N	BELUM MENIKAH	\N	43	\N	\N	\N
279	\N	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	0	0	0	0	0	0	0	0	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:11:32	2020-06-26 08:11:32	\N	\N	\N	43	\N	\N	\N
280	far26062020	\N	maya	\N	12345	WANITA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	1	0	0	0	\N	\N	\N	279	74	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:11:32	2020-06-26 08:11:32	\N	BELUM MENIKAH	\N	43	\N	\N	\N
276	Lab126062020	\N	fuadah	\N	12345	WANITA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	1	0	0	0	\N	\N	\N	275	76	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-26 08:09:33	2020-06-29 02:42:11	\N	MENIKAH	\N	43	43	\N	\N
282	\N	\N	amira	\N	\N	\N	\N	\N	SWASTA	\N	johor 29	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 04:17:08	2020-06-30 04:17:08	\N	\N	\N	43	\N	\N	\N
281	\N	\N	nabila	\N	\N	WANITA	\N	\N	\N	\N	Raya gubeng no 11	\N	08155059260	\N	\N	\N	1995-06-06	25	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	282	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 04:17:08	2020-06-30 04:17:08	\N	\N	\N	43	43	\N	18
284	\N	\N	retno	\N	\N	\N	\N	\N	SWASTA	\N	raya manyar no 9	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 04:22:37	2020-06-30 04:22:37	\N	\N	\N	43	\N	\N	\N
283	\N	\N	Fitri	\N	\N	WANITA	\N	\N	\N	\N	raya manyar no 9	\N	\N	\N	\N	\N	2009-06-16	11	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	284	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 04:22:37	2020-06-30 04:22:37	\N	\N	\N	43	43	\N	19
285	D-0011	\N	dr Hartatiek Nila SpOG	\N	\N	\N	\N	\N	\N	\N	\N	\N	0899 011 8008	\N	\N	\N	\N	0	\N	269	\N	\N	\N	1	0	0	0	0	0	0	1	0	0	11	\N	10	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 06:38:47	2020-06-30 06:38:47	\N	\N	\N	43	\N	\N	\N
287	\N	\N	firda	\N	\N	\N	\N	\N	\N	\N	manyar sabrangan no 5	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 09:37:18	2020-06-30 09:37:18	\N	\N	\N	43	\N	\N	\N
286	\N	\N	firda	\N	\N	WANITA	\N	\N	\N	\N	manyar sabrangan no 5	\N	\N	\N	\N	\N	2009-05-14	11	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	287	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30 09:37:18	2020-06-30 10:57:50	\N	\N	\N	43	43	\N	22
289	\N	\N	yaniar	\N	\N	\N	\N	\N	\N	\N	gubeng	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-07-01 09:33:17	2020-07-01 09:33:17	\N	\N	\N	43	\N	\N	\N
288	\N	\N	yaniar	\N	\N	WANITA	\N	\N	\N	\N	gubeng	\N	\N	\N	\N	\N	1990-07-10	30	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	289	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-07-01 09:33:17	2020-07-01 09:33:17	\N	\N	\N	43	43	\N	24
291	\N	\N	noviana	\N	\N	\N	\N	\N	\N	\N	manyar	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	1	0	0	0	0	0	0	1	0	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-07-01 09:34:12	2020-07-01 09:34:12	\N	\N	\N	43	\N	\N	\N
290	\N	\N	noviana	\N	\N	WANITA	\N	\N	\N	\N	manyar	\N	\N	\N	\N	\N	1993-07-01	27	\N	269	\N	\N	\N	1	0	0	1	0	0	0	0	0	0	\N	\N	\N	291	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	2020-07-01 09:34:12	2020-07-01 09:34:12	\N	\N	\N	43	43	\N	25
\.


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discounts (id, code, name, date_start, date_end, type, description, disc_percent, disc_value, is_active, created_by, created_at, updated_at) FROM stdin;
1	R9890	Promo A	2019-12-01	2020-02-26	PROMO	PROMO	15	11000	1	43	2019-12-06 23:58:32	2020-01-13 17:40:18
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (id, name, city_id, created_at, updated_at) FROM stdin;
1	Pakis	245	2019-11-25 23:42:04	2019-11-25 23:42:04
3	Kebomas	238	2019-11-26 00:38:45	2019-11-26 00:38:45
4	Waru	255	2019-11-26 23:22:35	2019-11-26 23:22:35
5	Waru	255	2019-11-26 23:22:35	2019-11-26 23:22:35
9	Surajaya	37	2019-11-28 23:11:28	2019-11-28 23:11:28
10	Driyorejo	237	2019-12-01 02:14:58	2019-12-01 02:14:58
11	Basalusik	90	2019-12-02 03:51:08	2019-12-02 03:51:08
12	Rungkut	269	2020-01-08 02:08:38	2020-01-08 02:08:38
13	Bubutan	269	2020-01-08 02:13:41	2020-01-08 02:13:41
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: formula_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_details (id, formula_id, item_id, lokasi_id, qty, stock_id, stock_transaction_id, created_at, updated_at) FROM stdin;
1	1	9	49	0	3	6	2020-06-30 09:30:21	2020-06-30 09:30:21
\.


--
-- Data for Name: formulas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formulas (id, date, medical_record_id, registration_detail_id, invoice_id, is_approve, updated_by, created_at, updated_at) FROM stdin;
1	2020-06-30	19	22	30	1	79	2020-06-30 09:30:21	2020-07-01 08:23:30
\.


--
-- Data for Name: invoice_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_details (id, invoice_id, item_id, qty, disc_percent, debet, credit, total_debet, total_credit, grandtotal, invoice_detail_id, is_item, is_discount, is_promo, created_at, updated_at, is_discount_total, reduksi, is_reduksi, is_profit_sharing, is_asuransi) FROM stdin;
107	30	9	0	0	4600	0	0	0	0	\N	1	0	0	2020-07-01 08:23:30	2020-07-01 08:23:30	0	0	0	0	0
108	31	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-07-01 09:38:06	2020-07-01 09:38:06	0	0	0	0	0
4	2	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-02-17 04:55:57	2020-02-17 04:55:57	0	0	0	0	0
5	2	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-02-17 04:55:57	2020-02-17 04:55:57	0	0	0	0	0
109	31	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-07-01 09:38:06	2020-07-01 09:38:06	0	0	0	0	0
10	3	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-02-19 03:42:03	2020-02-19 03:42:03	0	0	0	0	0
11	3	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-02-19 03:42:03	2020-02-19 03:42:03	0	0	0	0	0
14	4	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-02-19 04:08:11	2020-02-19 04:08:11	0	0	0	0	0
15	4	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-02-19 04:08:11	2020-02-19 04:08:11	0	0	0	0	0
18	5	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-06 03:46:08	2020-03-06 03:46:08	0	0	0	0	0
19	5	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-06 03:46:08	2020-03-06 03:46:08	0	0	0	0	0
20	6	10	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-06 04:38:17	2020-03-06 04:38:17	0	0	0	1	0
21	6	\N	1	0	0	0	0	0	0	20	0	0	0	2020-03-06 04:38:17	2020-03-06 04:38:17	0	0	1	0	0
26	7	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-06 05:18:47	2020-03-06 05:18:47	0	0	0	0	0
27	7	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-06 05:18:47	2020-03-06 05:18:47	0	0	0	0	0
28	8	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-06 06:43:50	2020-03-06 06:43:50	0	0	0	0	0
29	8	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-06 06:43:50	2020-03-06 06:43:50	0	0	0	0	0
32	9	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-06 06:45:11	2020-03-06 06:45:11	0	0	0	0	0
33	9	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-06 06:45:11	2020-03-06 06:45:11	0	0	0	0	0
36	10	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-08 03:41:30	2020-03-08 03:41:30	0	0	0	0	0
37	10	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-08 03:41:30	2020-03-08 03:41:30	0	0	0	0	0
40	11	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-08 03:54:20	2020-03-08 03:54:20	0	0	0	0	0
41	11	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-08 03:54:20	2020-03-08 03:54:20	0	0	0	0	0
44	12	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-12 09:48:05	2020-03-12 09:48:05	0	0	0	0	0
45	12	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-12 09:48:05	2020-03-12 09:48:05	0	0	0	0	0
48	13	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-12 09:53:57	2020-03-12 09:53:57	0	0	0	0	0
49	13	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-12 09:53:57	2020-03-12 09:53:57	0	0	0	0	0
52	14	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-13 03:11:18	2020-03-13 03:11:18	0	0	0	0	0
53	14	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-13 03:11:18	2020-03-13 03:11:18	0	0	0	0	0
56	15	2	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-14 17:29:50	2020-03-14 17:29:50	0	0	0	0	0
57	15	1	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-14 17:29:50	2020-03-14 17:29:50	0	0	0	0	0
60	16	30	1	0	300000	0	300000	0	300000	\N	1	0	0	2020-03-19 03:53:25	2020-03-19 03:53:25	0	0	0	0	0
61	18	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-19 06:23:37	2020-03-19 06:23:37	0	0	0	0	0
62	18	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-19 06:23:37	2020-03-19 06:23:37	0	0	0	0	0
75	19	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-03-19 07:34:05	2020-03-19 07:34:05	0	0	0	0	0
76	19	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-03-19 07:34:05	2020-03-19 07:34:05	0	0	0	0	0
81	20	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-06-11 07:52:27	2020-06-11 07:52:27	0	0	0	0	0
82	20	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-06-11 07:52:27	2020-06-11 07:52:27	0	0	0	0	0
87	22	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-06-12 04:06:46	2020-06-12 04:06:46	0	0	0	0	0
88	22	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-06-12 04:06:46	2020-06-12 04:06:46	0	0	0	0	0
89	24	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-06-30 04:22:47	2020-06-30 04:22:47	0	0	0	0	0
90	24	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-06-30 04:22:47	2020-06-30 04:22:47	0	0	0	0	0
93	26	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-06-30 09:37:59	2020-06-30 09:37:59	0	0	0	0	0
94	26	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-06-30 09:37:59	2020-06-30 09:37:59	0	0	0	0	0
97	27	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-06-30 10:42:01	2020-06-30 10:42:01	0	0	0	0	0
98	27	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-06-30 10:42:01	2020-06-30 10:42:01	0	0	0	0	0
101	28	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-06-30 11:01:28	2020-06-30 11:01:28	0	0	0	0	0
102	28	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-06-30 11:01:28	2020-06-30 11:01:28	0	0	0	0	0
105	29	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-07-01 07:27:42	2020-07-01 07:27:42	0	0	0	0	0
106	29	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-07-01 07:27:42	2020-07-01 07:27:42	0	0	0	0	0
118	32	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-07-01 09:42:10	2020-07-01 09:42:10	0	0	0	0	0
119	32	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-07-01 09:42:10	2020-07-01 09:42:10	0	0	0	0	0
120	33	32	1	0	50000	0	50000	0	50000	\N	1	0	0	2020-07-01 09:45:35	2020-07-01 09:45:35	0	0	0	0	0
121	33	33	1	0	250000	0	250000	0	250000	\N	1	0	0	2020-07-01 09:45:35	2020-07-01 09:45:35	0	0	0	0	0
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, registration_id, code, date, is_nota_rawat_jalan, status, qty, gross, discount, netto, paid, balance, discount_id, payment_type, payment_method, description, promo_description, paid_at, paid_by, created_by, created_at, updated_at, is_nota_pengobatan, reduksi, asuransi_percentage, asuransi_value, discount_total_value, discount_total_percentage, is_nota_pemeriksaan, invoice_amandemen_id) FROM stdin;
23	21	NJ-3006-00004	2020-06-30	1	1	0	0	0	0	0	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	43	2020-06-30 04:18:23	2020-06-30 04:18:23	0	0	0	0	0	0	0	\N
30	22	NJ-0107-00002	2020-07-01	0	1	1	0	0	0	0	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	79	2020-07-01 08:23:30	2020-07-01 08:23:30	0	0	0	0	0	0	1	\N
5	5	NJ-0603-00001	2020-03-06	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-06 03:46:08	43	43	2020-03-06 03:44:57	2020-03-06 03:46:08	0	0	0	0	0	0	0	\N
10	9	NJ-0803-00006	2020-03-08	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-08 03:41:29	43	43	2020-03-08 03:40:23	2020-03-08 03:41:30	0	0	0	0	0	0	0	\N
24	22	NJ-3006-00005	2020-06-30	1	1	2	300000	0	300000	0	300000	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	43	2020-06-30 04:22:47	2020-06-30 04:22:47	0	0	0	0	0	0	0	\N
25	22	NJ-3006-00006	2020-06-30	0	1	0	0	0	0	0	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	68	2020-06-30 09:30:21	2020-06-30 09:30:21	0	0	0	0	0	0	1	\N
6	5	NJ-0603-00002	2020-03-06	0	1	1	50000	0	50000	0	50000	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	43	2020-03-06 04:38:17	2020-03-06 04:38:17	1	0	0	0	0	0	0	\N
2	2	NJ-1702-00001	2020-02-17	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-02-17 04:55:57	43	43	2020-02-17 04:55:38	2020-02-17 04:55:57	0	0	0	0	0	0	0	\N
31	29	NJ-0107-00003	2020-07-01	1	1	2	300000	0	300000	0	300000	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	43	2020-07-01 09:38:06	2020-07-01 09:38:06	0	0	0	0	0	0	0	\N
15	14	NJ-1403-00011	2020-03-14	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-14 17:29:49	43	43	2020-03-14 17:29:37	2020-03-14 17:29:50	0	0	0	0	0	0	0	\N
19	17	NJ-1903-00015	2020-03-19	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-19 06:29:24	43	43	2020-03-19 06:28:56	2020-03-19 07:34:05	0	0	0	0	0	0	0	\N
11	10	NJ-0803-00007	2020-03-08	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-08 03:54:20	43	43	2020-03-08 03:54:06	2020-03-08 03:54:20	0	0	0	0	0	0	0	\N
16	14	NJ-1903-00012	2020-03-19	0	3	1	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-19 03:53:25	43	43	2020-03-19 03:42:03	2020-03-19 03:53:25	0	0	0	0	0	0	1	\N
17	15	NJ-1903-00013	2020-03-19	1	1	0	0	0	0	0	0	\N	ASURANSI SWASTA	TUNAI	\N	\N	\N	\N	43	2020-03-19 06:19:35	2020-03-19 06:19:35	0	0	0	0	0	0	0	\N
26	23	NJ-3006-00007	2020-06-30	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-06-30 09:37:59	43	43	2020-06-30 09:37:38	2020-06-30 09:37:59	0	0	0	0	0	0	0	\N
7	6	NJ-0603-00003	2020-03-06	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-06 05:13:39	43	43	2020-03-06 05:13:28	2020-03-06 05:18:47	0	0	0	0	0	0	0	\N
3	3	NJ-1902-00002	2020-02-19	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	abcdseegvfhg	\N	2020-02-19 03:40:41	43	43	2020-02-19 03:39:59	2020-02-19 03:42:03	0	0	0	0	0	0	0	\N
18	16	NJ-1903-00014	2020-03-19	1	1	2	300000	0	300000	0	300000	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	43	2020-03-19 06:23:37	2020-03-19 06:23:37	0	0	0	0	0	0	0	\N
12	11	NJ-1203-00008	2020-03-12	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-12 09:48:05	43	43	2020-03-12 09:47:52	2020-03-12 09:48:05	0	0	0	0	0	0	0	\N
8	7	NJ-0603-00004	2020-03-06	1	1	2	300000	0	300000	0	300000	\N	BAYAR SENDIRI	TUNAI	\N	\N	\N	\N	43	2020-03-06 06:43:50	2020-03-06 06:43:50	0	0	0	0	0	0	0	\N
4	4	NJ-1902-00003	2020-02-19	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-02-19 04:08:11	43	43	2020-02-19 04:07:56	2020-02-19 04:08:11	0	0	0	0	0	0	0	\N
20	18	NJ-1106-00001	2020-06-11	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TT	\N	\N	2020-06-11 07:50:25	43	43	2020-06-11 07:49:49	2020-06-11 07:52:27	0	0	0	0	0	0	0	\N
21	19	NJ-1206-00002	2020-06-12	1	3	0	0	0	0	0	0	\N	BAYAR SENDIRI	TUNAI	usg payudara	\N	2020-06-12 03:50:35	43	43	2020-06-12 03:49:21	2020-06-12 03:50:35	0	0	0	0	0	0	0	\N
27	24	NJ-3006-00008	2020-06-30	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-06-30 10:42:01	43	43	2020-06-30 10:41:35	2020-06-30 10:42:01	0	0	0	0	0	0	0	\N
13	12	NJ-1203-00009	2020-03-12	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-12 09:53:57	43	43	2020-03-12 09:53:40	2020-03-12 09:53:57	0	0	0	0	0	0	0	\N
9	8	NJ-0603-00005	2020-03-06	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-06 06:45:11	43	43	2020-03-06 06:44:50	2020-03-06 06:45:11	0	0	0	0	0	0	0	\N
28	25	NJ-3006-00009	2020-06-30	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-06-30 11:01:27	43	43	2020-06-30 11:00:57	2020-06-30 11:01:28	0	0	0	0	0	0	0	\N
14	13	NJ-1303-00010	2020-03-13	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-03-13 03:11:18	43	43	2020-03-13 03:11:04	2020-03-13 03:11:18	0	0	0	0	0	0	0	\N
22	20	NJ-1206-00003	2020-06-12	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	apa aja	\N	2020-06-12 04:05:58	43	43	2020-06-12 04:05:23	2020-06-12 04:06:46	0	0	0	0	0	0	0	\N
29	26	NJ-0107-00001	2020-07-01	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-07-01 07:27:42	43	43	2020-07-01 07:23:53	2020-07-01 07:27:42	0	0	0	0	0	0	0	\N
32	28	NJ-0107-00004	2020-07-01	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-07-01 09:41:38	43	43	2020-07-01 09:38:10	2020-07-01 09:42:10	0	0	0	0	0	0	0	\N
33	27	NJ-0107-00005	2020-07-01	1	3	2	300000	0	300000	300000	0	\N	BAYAR SENDIRI	TUNAI	\N	\N	2020-07-01 09:40:32	43	43	2020-07-01 09:38:13	2020-07-01 09:45:35	0	0	0	0	0	0	0	\N
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, created_at, updated_at, code, name, description, price, category_id, is_active, is_category, is_disease, is_administration, is_inspection, is_standard, is_radiology, is_anatomy, is_packet, is_pharmacy, is_laboratory, piece_id, is_cure, is_bhp, additional, purchase_piece_id, purchase_price, supplier_price, minimal_stock, ratio, is_alkes_disposible, is_alkes_non_disposible, is_umum, is_inventaris, is_non_cure, is_medical_item, is_classification, is_subclassification, is_generic, classification_id, subclassification_id, generic_id, current_stock, has_stock, is_treatment_group) FROM stdin;
1	2020-01-08 08:30:52	2020-01-08 08:30:52	2001993	Registrasi	\N	50000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	0
2	2020-01-08 08:33:03	2020-01-08 08:33:03	2001951	Konsultasi	\N	250000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	0
3	2020-01-10 03:50:10	2020-01-10 03:50:10	AB001	Abdomen	\N	0	\N	1	1	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	0
4	2020-01-10 03:50:24	2020-01-10 03:50:24	SP001	Sakit Perut	\N	0	3	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	0
5	\N	\N	01	Oral	\N	0	\N	1	1	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
6	\N	\N	01	Analgesik	\N	0	5	1	0	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0
7	\N	\N	01	Analgesik Non Opiod	\N	0	\N	1	0	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	1	0	6	0	0	0	0	0
27	2020-03-14 17:35:01	2020-03-18 06:13:57	2003331	USG Mammae	\N	0	\N	0	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
30	2020-03-18 06:14:29	2020-03-18 06:14:29	2003697	Hematologi	\N	300000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
33	2020-03-19 06:22:36	2020-03-19 06:22:36	200331	Konsultasi	\N	250000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
36	2020-03-19 09:52:17	2020-03-19 09:52:43	2003159	Mammografi (Promo)	\N	640000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
8	\N	\N	001	Asam Mefenamat	\N	0	\N	1	0	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	1	0	7	0	0	0	0
10	2020-03-06 04:21:20	2020-03-06 04:21:20	2003555	Injeksi	\N	50000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
11	2020-03-06 04:23:37	2020-03-06 04:23:37	2003042337UJx	Influenza	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
12	2020-03-06 04:49:48	2020-03-06 04:49:48	2003044948Hiy	Influenza	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
13	2020-03-06 04:50:04	2020-03-06 04:50:04	2003045004pIh	Influenza	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
14	2020-03-06 04:50:04	2020-03-06 04:50:04	2003045004wlN	Flu	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
15	2020-03-06 04:50:37	2020-03-06 04:50:37	2003045037PHF	Influenza	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
16	2020-03-06 04:50:37	2020-03-06 04:50:37	2003045037Umc	Flu	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
17	2020-03-06 05:24:20	2020-03-06 05:24:20	2003052420ofU	ISPA	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
18	2020-03-06 06:47:11	2020-03-06 06:47:11	2003794	Bedah ringan	\N	250000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
19	2020-03-06 06:55:02	2020-03-06 06:55:02	2003610	USG Mammae	\N	500000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
28	2020-03-14 17:36:44	2020-03-18 06:14:00	200322	Hematologi	\N	0	\N	0	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
20	\N	\N	2	Digestive	\N	0	\N	1	1	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
21	\N	\N	3	Cardiovascular	\N	0	\N	1	1	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
22	\N	\N	4	Skeletal	\N	0	\N	1	1	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
23	\N	\N	1	Antiseptics	\N	0	20	1	0	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0
24	\N	\N	2	Mood stabilizaer	\N	0	22	1	0	0	0	0	0	0	0	0	0	0	\N	1	0	{}	\N	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0
31	2020-03-19 06:07:05	2020-03-19 06:07:05	2003703	Registrasi	\N	50000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
34	2020-03-19 07:13:59	2020-03-19 07:13:59	2003071359ysT	gastritis akut	\N	0	\N	1	0	1	0	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
9	2020-03-03 07:40:14	2020-03-15 09:17:18	001	Lapistan 500mg	\N	4600	5	1	0	0	0	0	0	0	0	0	1	0	10	1	0	{"margin":"15","hna":"7000"}	10	4000	0	0	0	0	0	0	0	0	0	0	0	0	6	7	8	82	1	0
25	2020-03-08 03:34:59	2020-03-08 03:34:59	2003654	Hematologi	\N	300000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
26	2020-03-08 03:35:17	2020-03-08 03:35:17	2003410	Faal Hati	\N	250000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
29	2020-03-15 09:19:48	2020-03-18 06:14:03	2003422	Cek tensi	\N	0	\N	0	0	0	1	0	0	0	0	0	0	0	1	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
32	2020-03-19 06:21:09	2020-03-19 06:21:09	2003796	Registrasi	\N	50000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
35	2020-03-19 09:15:04	2020-03-19 09:15:04	2003316	USG Mammae	\N	250000	\N	1	0	0	1	0	0	0	0	0	0	0	\N	0	0	{}	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Data for Name: laboratory_treatments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratory_treatments (id, price_id, laboratory_type_id, created_at, updated_at) FROM stdin;
1	11	1	2020-03-14 17:39:28	2020-03-14 17:39:28
5	13	1	2020-03-19 03:39:49	2020-03-19 03:39:49
\.


--
-- Data for Name: laboratory_type_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratory_type_details (id, laboratory_type_id, name, created_at, updated_at) FROM stdin;
4	1	LED	2020-03-19 03:39:21	2020-03-19 03:39:21
5	1	Retikulosit	2020-03-19 03:39:21	2020-03-19 03:39:21
6	1	Hapusan Darah Tepi	2020-03-19 03:39:21	2020-03-19 03:39:21
16	2	Urine Lengkap	2020-03-19 07:21:26	2020-03-19 07:21:26
\.


--
-- Data for Name: laboratory_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratory_types (id, name, is_active, created_at, updated_at) FROM stdin;
1	Hematologi	1	2020-03-14 17:39:07	2020-03-14 17:39:07
2	Urinologi	1	2020-03-19 07:18:43	2020-03-19 07:20:01
\.


--
-- Data for Name: letters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.letters (id, code, option, medical_record_id, doctor_id, created_by, updated_by, date, review_date, start_date, end_date, duration, duration_type, age, age_type, description, additional, is_cuti_hamil, is_keterangan_dokter, is_keterangan_sehat, is_layak_terbang, is_pengantar_mrs, is_rujukan_pasien, created_at, updated_at, is_persetujuan_tindakan_medis) FROM stdin;
5	001/SKD/MDC/03/2020	\N	3	63	43	\N	2020-03-06	\N	2020-03-06	2020-03-13	\N	BULAN	7	MINGGU	ispa	{}	0	1	0	0	0	0	2020-03-06 06:28:41	2020-03-06 06:28:41	0
6	001/PRJ/MDC/03/2020	\N	3	63	43	\N	2020-03-06	\N	\N	\N	\N	\N	\N	\N	isolasi	{"hospital":"RS Manyar Medical Centre (MMC)","hospital_address":"Jln.Raya manyar No 9","td":"120","gcs":"456","diagnose":"ispa","therapy":"lapifed","rr":"20","n":"20"}	0	0	0	0	0	1	2020-03-06 06:32:20	2020-03-06 06:32:20	0
8	001/MDC/03/2020	SEHAT	3	63	43	\N	2020-03-19	\N	\N	\N	\N	\N	\N	\N	pasien sehat	{"td":"90-120","sh":"100","bb":"50","tb":"150","n":"20","rr":"35","buta_warna":"TIDAK","eye_diagnose":"normal","ear_diagnose":"normal"}	0	0	1	0	0	0	2020-03-19 06:00:34	2020-03-19 06:00:34	0
9	001/SLT/MDC/03/2020	LAYAK	3	63	43	\N	2020-03-19	\N	\N	\N	\N	\N	32	MINGGU	Boleh Terbang	{"destination":"Jakarta"}	0	0	0	1	0	0	2020-03-19 06:01:36	2020-03-19 06:01:36	0
10	001/MRS/MDC/03/2020	\N	3	63	43	\N	2020-03-19	2020-03-26	\N	\N	\N	\N	\N	MINGGU	operasi ringan sayat kecil	{"time":"13:00","hospital":"RSBS","type":"MRS","diagnose":"Cek MRS","operation_type":"ringan","operation_treatment":"sayat kecil"}	0	0	0	0	1	0	2020-03-19 06:02:42	2020-03-19 06:02:42	0
11	002/SPM/MDC/03/2020	\N	3	63	43	\N	2020-03-19	\N	\N	\N	\N	\N	\N	\N	Operasi ringan	{"name":"Strata","address":"Medokan Ayu","identitas_diri":"123120421401"}	0	0	0	0	0	0	2020-03-19 06:04:03	2020-03-19 06:04:03	1
7	001/SCH/MDC/03/2020	\N	3	63	43	80	2020-03-06	2020-03-13	2020-03-10	2020-06-10	3	BULAN	32	MINGGU	\N	[]	1	0	0	0	0	0	2020-03-06 07:05:29	2020-07-01 07:51:01	0
\.


--
-- Data for Name: medical_record_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_record_details (id, medical_record_id, disease_id, cure, last_checkup_date, pain_location, is_other_pain_type, pain_type, pain_duration, emergence_time, side_effect, is_unknown, is_allergy_history, is_disease_history, is_family_disease_history, is_pain_history, is_pain_cure_history, is_kid_history, is_pregnant_week_age, kid_order, partus_year, partus_location, pregnant_month_age, pregnant_week_age, birth_type, birth_helper, birth_obstacle, baby_gender, weight, long, komplikasi_nifas, is_imunisasi_history, is_other_imunisasi, is_imunisasi_month_age, imunisasi, reaksi_imunisasi, created_at, updated_at, imunisasi_year_age, imunisasi_month_age, disease_name, name, duration, is_ginekologi_history, is_other_ginekologi, is_obgyn_disease_history, is_obgyn_family_disease_history, is_kb_history, is_komplikasi_kb_history, is_diagnostic, is_drug, is_treatment, item_id, qty, reduksi, date, is_other, description, type, is_diagnose_history, signa1, signa2, result_date, is_schedule, is_radiology, is_laboratory, is_pathology, lokasi_id, is_bhp, is_sewa_alkes, is_sewa_ruangan, saran, kesimpulan, kanan, kiri, additional, stock_id, is_treatment_group) FROM stdin;
82	16	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-12 03:59:00	2020-06-12 04:00:48	0	0	\N	usg payudara	0	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-12	1	200612035900VUn3lj.jpeg	\N	0	\N	\N	2020-06-13	0	1	0	0	\N	0	0	0	gpp	gpp	gpp	gpp	{}	\N	0
83	16	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-12 04:01:46	2020-06-12 04:01:46	0	0	\N	usg payudara	0	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-12	1	200612040146jtYlR1.jpeg	\N	0	\N	\N	2020-06-13	0	1	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
84	18	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-30 09:02:26	2020-06-30 09:02:26	0	0	\N	USG Payudara	0	0	0	0	0	0	0	0	0	0	0	0	0	2020-06-30	1	200630090226hVL3an.jpeg	\N	0	\N	\N	2020-06-30	0	1	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
85	19	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-30 09:20:09	2020-06-30 09:20:09	0	0	\N	\N	0	0	0	0	0	0	0	0	1	0	9	0	0	2020-06-30	1	\N	\N	0	78	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
86	19	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-30 09:23:51	2020-06-30 09:23:51	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	2020-07-08	1	\N	\N	0	\N	\N	\N	1	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
20	2	11	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 04:50:37	2020-03-06 04:50:37	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	UTAMA	1	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
21	2	15	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 04:50:37	2020-03-06 04:50:37	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	UTAMA	1	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
22	2	16	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 04:50:37	2020-03-06 04:50:37	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	UTAMA	1	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
23	2	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 04:50:37	2020-03-06 04:50:37	0	0	\N	\N	0	0	0	0	0	0	0	0	0	1	10	1	0	2020-03-06	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
24	2	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 04:50:37	2020-03-06 04:50:37	0	0	\N	\N	0	0	0	0	0	0	0	0	1	0	9	10	0	2020-03-06	1	\N	\N	0	52	54	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
28	5	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 06:47:27	2020-03-06 06:47:27	0	0	\N	\N	0	0	0	0	0	0	0	0	0	1	18	0	0	2020-03-06	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
29	3	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 06:53:42	2020-03-06 06:53:42	0	0	\N	Thorax	0	0	0	0	0	0	0	0	0	0	0	0	0	2020-03-07	1	200306065342U6Atsa.gif	\N	0	\N	\N	2020-03-07	0	1	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
34	4	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-06 07:04:28	2020-03-06 07:04:28	0	0	\N	\N	0	0	0	0	0	0	0	0	0	1	19	0	0	2020-03-06	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
35	6	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-08 03:43:26	2020-03-08 03:43:26	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	25	1	0	2020-03-08	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
36	7	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-08 03:54:55	2020-03-08 03:54:55	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	19	1	0	2020-03-08	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
46	3	17	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-09 04:34:12	2020-03-09 04:34:12	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	UTAMA	1	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
47	3	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-09 04:34:12	2020-03-09 04:34:12	0	0	\N	\N	0	0	0	0	0	0	0	0	0	1	19	0	0	2020-03-06	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
48	3	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-09 04:34:12	2020-03-09 04:34:12	0	0	\N	\N	0	0	0	0	0	0	0	0	0	1	25	21	0	2020-03-09	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
49	3	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-09 04:34:12	2020-03-09 04:34:12	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	25	1	0	2020-03-09	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
50	3	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-09 04:34:12	2020-03-09 04:34:12	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	18	21	0	2020-03-09	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
51	3	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-09 04:34:12	2020-03-09 04:34:12	0	0	\N	\N	0	0	0	0	0	0	0	0	1	0	9	10	0	2020-03-06	1	\N	\N	0	63	64	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
55	9	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-12 09:54:20	2020-03-12 09:54:20	0	0	\N	\N	0	0	0	0	0	0	0	0	0	1	19	1	0	2020-03-12	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
68	11	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-19 03:40:25	2020-03-19 03:40:25	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	30	1	0	2020-03-19	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
77	14	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-03-19 09:15:31	2020-03-19 09:15:31	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	35	1	0	2020-03-19	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
78	14	34	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-12 03:35:39	2020-06-12 03:35:39	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	4	0	0	\N	1	\N	\N	1	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
79	14	\N	antasida	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	1	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-12 03:35:39	2020-06-12 03:35:39	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
80	14	\N	antasida	\N	\N	0	\N	\N	\N	\N	0	0	1	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-12 03:35:39	2020-06-12 03:35:39	0	0	gastritis	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
81	14	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	1	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-12 03:35:39	2020-06-12 03:35:39	0	0	-	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
88	20	\N	paracetamol	\N	\N	0	\N	\N	5 hari yang lalu	\N	0	0	0	0	0	1	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-06-30 09:54:42	2020-06-30 09:54:42	0	0	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
89	10	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	\N	0	0	\N	\N	\N	\N	0	0	\N	0	0	0	\N	\N	2020-07-01 09:28:20	2020-07-01 09:28:20	0	0	\N	\N	0	0	0	0	0	0	0	1	0	0	30	1	0	2020-07-01	1	\N	\N	0	\N	\N	\N	0	0	0	0	\N	0	0	0	\N	\N	\N	\N	{}	\N	0
\.


--
-- Data for Name: medical_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_records (id, code, date, status, patient_type, patient_id, created_by, updated_by, created_at, updated_at, main_complaint, step, is_disturb, pain_score, pain_description, fallen, fallen_description, secondary_diagnose, secondary_diagnose_description, helper, helper_description, infus, infus_description, walking, walking_description, mental, mental_description, risk_level, risk_level_status, risk_level_description, menarche_age, siklus_haid, jumlah_pemakaian_pembalut, lama_pemakaian_pembalut, is_tidy, hpht, haid_complaint, marriage_status, marriage_duration, is_pernah_kb, kb_item, kb_start_time, kb_complaint, gravida, partus, abortus, imunisasi_tt, pada_usia_kehamilan, pemakaian_obat_saat_kehamilan, keluhan_saat_kehamilan, general_condition, gigi_tumbuh_pertama, long, weight, blood_pressure, pulse, temperature, breath_frequency, prebirth_weight, postbirth_weight, birth_long, birth_weight, head_size, arm_size, berguling_usia, duduk_usia, merangkak_usia, berdiri_usia, berjalan_usia, bicara_usia, registration_detail_id, registration_id, current_disease, psiko_sosial, operasi, obgyn_main_complaint, obgyn_current_disease, obgyn_operasi, physique, ekg, usg, head_description, breast_description, rectum_description, reduksi, refer_doctor_id, additional) FROM stdin;
12	20.03.0003	2020-03-19	1	\N	264	43	\N	2020-03-19 06:19:35	2020-03-19 06:19:35	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
9	20.03.0001	2020-03-12	1	\N	240	43	43	2020-03-12 09:53:40	2020-03-19 03:58:43	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	12	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":"","blood_pressure":"120\\/90","medical_checkup_weight":"0","medical_checkup_long":"0","medical_checkup_temperature":"0","medical_checkup_pulse":"0"}
18	20.06.0004	2020-06-30	1	\N	281	43	43	2020-06-30 04:18:23	2020-06-30 09:02:26	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	21	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
21	20.03.0004	2020-06-30	1	\N	265	43	\N	2020-06-30 10:41:35	2020-06-30 10:41:35	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	24	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
2	20.03.0001	2020-03-06	1	\N	240	43	43	2020-03-06 03:44:57	2020-03-06 04:38:21	Batuk pilek	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	CM baik	\N	170	70	90/110	90	38	20	0	0	0	0	0	0	0	0	0	0	0	0	5	5	batuk selama beberapa hari	\N	\N	\N	\N	\N	normal	\N	-	\N	\N	\N	50	\N	{"histopatologi_terapi":"Lapistan 500mg sebanyak 10 Kaplet"}
5	20.03.0001	2020-03-06	1	\N	240	43	43	2020-03-06 06:44:50	2020-03-19 05:58:16	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	150	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	8	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70	\N	{"histopatologi_terapi":"","medical_checkup_long":""}
13	20.03.0004	2020-03-19	1	\N	265	43	\N	2020-03-19 06:23:37	2020-03-19 06:23:37	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
7	20.03.0001	2020-03-08	1	\N	240	43	43	2020-03-08 03:54:06	2020-03-08 04:02:07	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	120/90	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50	\N	{"histopatologi_terapi":"","medical_checkup_long":"","blood_pressure":""}
8	20.03.0001	2020-03-12	1	\N	240	43	43	2020-03-12 09:47:52	2020-03-12 09:48:39	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	11	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
3	20.03.0002	2020-03-06	1	\N	252	43	43	2020-03-06 05:13:28	2020-03-06 05:34:54	demam	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	cm	\N	160	50	120/80	100	38	20	0	0	0	0	0	0	0	0	0	0	0	0	6	6	pasien demam sejak 3 hari yang lalu, batuk (+), pilek (+)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50	\N	{"histopatologi_terapi":"Lapistan 500mg sebanyak 10 Kaplet"}
6	20.03.0001	2020-03-08	1	\N	240	43	43	2020-03-08 03:40:23	2020-03-08 03:43:26	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	9	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
4	20.03.0001	2020-03-06	1	\N	240	43	43	2020-03-06 06:43:50	2020-03-06 07:04:22	hgcdhjgfdghc	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	7	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
15	20.06.0001	2020-06-11	1	\N	269	43	\N	2020-06-11 07:49:49	2020-06-11 07:58:41	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	CM	\N	160	65	120/80	100	36.7999999999999972	20	0	0	0	0	0	0	0	0	0	0	0	0	18	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
16	20.06.0002	2020-06-12	1	\N	271	43	43	2020-06-12 03:49:21	2020-06-12 03:59:00	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	19	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
17	20.06.0003	2020-06-12	1	\N	250	43	\N	2020-06-12 04:05:23	2020-06-12 04:05:23	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	20	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
11	20.03.0001	2020-03-14	1	\N	240	43	43	2020-03-14 17:29:37	2020-03-15 10:14:16	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	2020-03-10	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	14	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
10	20.03.0001	2020-03-13	1	\N	240	43	43	2020-03-13 03:11:04	2020-03-19 03:57:55	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	13	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
14	20.03.0003	2020-03-19	1	\N	264	43	43	2020-03-19 06:28:56	2020-03-19 08:08:20	\N	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	baik	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17	17	sejak 2 hari yang lalu, awalnya dr uluhati skr sdh menjalar ke perut kanan dan bagian belakang. sudah minum obat antasida	suka makan pedas	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{"histopatologi_terapi":""}
20	20.06.0006	2020-06-30	1	\N	286	43	68	2020-06-30 09:37:38	2020-06-30 09:54:36	panas	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	130	35	100/70	80	36	20	0	0	0	0	0	0	0	0	0	0	0	0	23	23	ibu pasien mengatakan anak panas kurang lebih sejak 5 hari yang lalu. panas naik turun. sudah minum obat panas 3x sehari.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	{"histopatologi_terapi":""}
22	20.06.0006	2020-06-30	1	\N	286	43	\N	2020-06-30 11:00:57	2020-06-30 11:00:57	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	25	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
24	20.03.0001	2020-07-01	1	\N	240	43	\N	2020-07-01 09:38:06	2020-07-01 09:38:06	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	29	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
26	20.07.0004	2020-07-01	1	\N	288	43	\N	2020-07-01 09:38:13	2020-07-01 09:38:13	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	27	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
23	20.03.0004	2020-07-01	1	\N	265	43	\N	2020-07-01 07:23:53	2020-07-01 07:23:53	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	26	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
25	20.07.0003	2020-07-01	1	\N	290	43	\N	2020-07-01 09:38:10	2020-07-01 09:38:10	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	\N	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	28	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	{}
19	20.06.0005	2020-06-30	1	\N	283	43	68	2020-06-30 04:22:47	2020-06-30 09:20:09	batuk pilek	0	0	0	Tidak ada rasa nyeri / normal	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	Tidak beresiko	Perawatan dasar	1	\N	0	\N	0	\N	\N	\N	\N	0	\N	\N	\N	0	0	0	\N	0	\N	\N	\N	\N	0	0	100/70	80	37	18	3500	40	0	0	0	0	0	0	0	0	0	0	22	22	ibu pasien mengatakan anak batuk dan pilek sudah sejak 3 hari yang lalu, tidak ada demam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	{"pb_lahir":"55","pb_sekarang":"135","histopatologi_terapi":"Lapistan 500mg sebanyak 0 Kaplet"}
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
303	2020_02_24_143651_medical_record_referenced	1
329	2020_02_25_015951_treatment_group_in_prices	2
330	2020_02_26_021413_create_laboratory_types_table	2
331	2020_02_26_021513_create_laboratory_type_details_table	2
332	2020_02_26_023508_laboratory_setting	2
333	2020_02_26_162525_create_laboratory_treatments_table	2
334	2020_02_27_030443_create_purchase_requests_table	2
335	2020_02_27_030949_create_purchase_request_details_table	2
336	2020_02_29_165914_create_stock_transactions_table	2
337	2020_02_29_170130_create_stocks_table	2
338	2020_03_01_151541_create_purchase_orders_table	2
339	2020_03_01_151605_create_purchase_order_details_table	2
340	2020_03_01_185433_create_receipts_table	2
341	2020_03_02_171737_create_receipt_details_table	2
342	2020_03_02_185602_current_stock_item_and_gudang_farmasi	2
343	2020_03_02_193001_create_periodical_stocks_table	2
344	2020_03_02_211744_medical_record_detail_stock	2
345	2020_03_05_082125_create_movements_table	2
346	2020_03_05_173509_create_movement_details_table	2
347	2020_03_05_195725_create_adjustment_stocks_table	2
348	2020_03_05_195750_create_adjustment_stock_details_table	2
349	2020_03_09_173213_create_formulas_table	2
350	2020_03_09_173540_create_formula_details_table	2
351	2020_03_10_060254_notif_type10	2
352	2020_03_11_180206_nota_pemeriksaan_invoice	2
353	2020_03_11_194420_create_notifications_table	2
354	2020_03_14_112113_is_laboratory_referenced	2
355	2020_03_15_085337_is_adjustment_stock_transaction	3
356	2020_03_17_042821_diagnostic_and_treatment_in_price	3
357	2020_03_18_075845_item_is_treatment_group	4
358	2020_03_18_080156_create_treatment_groups_table	4
359	2020_03_18_080408_create_treatment_group_details_table	4
360	2020_03_18_154304_medical_record_is_treatment_group	4
361	2020_03_25_171404_create_radiology_types_table	5
362	2020_03_25_171457_create_radiology_type_details_table	5
363	2020_03_25_181137_integer_radiology_price	5
364	2020_03_26_174838_is_chemoterapy_price	5
365	2020_03_26_175431_is_chemoterapy_pivot_medical_record	5
366	2020_04_05_063055_create_side_effects_table	5
367	2020_04_05_063111_create_side_effect_details_table	5
368	2020_04_05_134630_is_keadaan_umum	5
369	2020_06_07_200254_amandemen_invoice	6
370	2020_06_23_165843_init_doctor_role	7
\.


--
-- Data for Name: movement_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movement_details (id, movement_id, stock_awal_id, stock_transaction_source_id, stock_transaction_destination_id, item_id, qty, lokasi_awal_id, lokasi_akhir_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movements (id, date, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, title, description, route, param, stock_id, is_read, created_at, updated_at) FROM stdin;
1	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 10 hari lagi	pharmacy.report.history	[]	3	0	2020-03-15 09:16:55	2020-03-15 09:16:55
2	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 31 hari lagi	pharmacy.report.history	[]	5	0	2020-03-15 09:50:06	2020-03-15 09:50:06
3	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 9 hari lagi	pharmacy.report.history	[]	3	0	2020-03-16 14:15:21	2020-03-16 14:15:21
4	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 30 hari lagi	pharmacy.report.history	[]	5	0	2020-03-16 14:15:21	2020-03-16 14:15:21
5	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 8 hari lagi	pharmacy.report.history	[]	3	0	2020-03-17 04:37:20	2020-03-17 04:37:20
7	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 7 hari lagi	pharmacy.report.history	[]	3	0	2020-03-18 06:13:11	2020-03-18 06:13:11
8	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 28 hari lagi	pharmacy.report.history	[]	5	1	2020-03-18 06:13:11	2020-03-18 06:24:36
6	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 29 hari lagi	pharmacy.report.history	[]	5	1	2020-03-17 04:37:20	2020-03-18 06:27:22
10	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 27 hari lagi	pharmacy.report.history	[]	5	0	2020-03-19 03:33:47	2020-03-19 03:33:47
9	43	Ada obat yang akan kadaluarsa	Lapistan 500mg akan kadaluarsa dalam waktu 6 hari lagi	pharmacy.report.history	[]	3	1	2020-03-19 03:33:47	2020-03-19 06:10:02
11	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-04-23 09:08:27	2020-04-23 09:08:27
12	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-04-23 09:08:27	2020-04-23 09:08:27
13	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-09 04:38:24	2020-06-09 04:38:24
14	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-09 04:38:24	2020-06-09 04:38:24
15	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-11 07:25:52	2020-06-11 07:25:52
16	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-11 07:25:52	2020-06-11 07:25:52
17	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-12 03:34:25	2020-06-12 03:34:25
18	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-12 03:34:25	2020-06-12 03:34:25
19	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-15 06:34:00	2020-06-15 06:34:00
20	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-15 06:34:00	2020-06-15 06:34:00
21	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-17 15:56:06	2020-06-17 15:56:06
22	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-17 15:56:06	2020-06-17 15:56:06
23	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-18 08:05:24	2020-06-18 08:05:24
24	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-18 08:05:24	2020-06-18 08:05:24
25	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-19 00:47:55	2020-06-19 00:47:55
26	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-19 00:47:55	2020-06-19 00:47:55
27	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-24 05:40:44	2020-06-24 05:40:44
28	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-24 05:40:44	2020-06-24 05:40:44
29	68	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-24 08:51:36	2020-06-24 08:51:36
30	68	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-24 08:51:36	2020-06-24 08:51:36
31	73	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-24 09:15:04	2020-06-24 09:15:04
32	73	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-24 09:15:04	2020-06-24 09:15:04
33	74	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-24 09:26:14	2020-06-24 09:26:14
34	74	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-24 09:26:14	2020-06-24 09:26:14
35	75	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-24 10:17:16	2020-06-24 10:17:16
36	75	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-24 10:17:16	2020-06-24 10:17:16
37	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-26 04:14:06	2020-06-26 04:14:06
38	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-26 04:14:06	2020-06-26 04:14:06
39	74	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-26 04:20:05	2020-06-26 04:20:05
40	74	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-26 04:20:05	2020-06-26 04:20:05
41	75	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-26 04:20:16	2020-06-26 04:20:16
42	75	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-26 04:20:16	2020-06-26 04:20:16
43	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-28 07:27:02	2020-06-28 07:27:02
44	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-28 07:27:02	2020-06-28 07:27:02
45	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-29 02:23:01	2020-06-29 02:23:01
47	77	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-29 02:42:21	2020-06-29 02:42:21
48	77	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-29 02:42:21	2020-06-29 02:42:21
49	80	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-29 10:20:56	2020-06-29 10:20:56
50	80	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-29 10:20:56	2020-06-29 10:20:56
46	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	1	2020-06-29 02:23:01	2020-06-29 11:54:18
51	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-30 02:17:55	2020-06-30 02:17:55
52	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-30 02:17:55	2020-06-30 02:17:55
53	68	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-30 04:52:52	2020-06-30 04:52:52
54	68	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-30 04:52:52	2020-06-30 04:52:52
55	79	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-30 07:15:09	2020-06-30 07:15:09
56	79	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-30 07:15:09	2020-06-30 07:15:09
57	80	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-06-30 08:44:58	2020-06-30 08:44:58
58	80	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-06-30 08:44:58	2020-06-30 08:44:58
59	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-07-01 02:22:19	2020-07-01 02:22:19
60	43	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-07-01 02:22:19	2020-07-01 02:22:19
61	68	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-07-01 02:29:35	2020-07-01 02:29:35
62	68	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-07-01 02:29:35	2020-07-01 02:29:35
63	79	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-07-01 04:02:41	2020-07-01 04:02:41
64	79	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-07-01 04:02:41	2020-07-01 04:02:41
65	80	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-07-01 07:38:27	2020-07-01 07:38:27
66	80	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-07-01 07:38:27	2020-07-01 07:38:27
67	61	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-07-01 09:29:45	2020-07-01 09:29:45
68	61	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-07-01 09:29:45	2020-07-01 09:29:45
69	73	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 15 April 2020	pharmacy.report.history	[]	5	0	2020-07-01 10:11:13	2020-07-01 10:11:13
70	73	Ada obat yang sudah kadaluarsa	Lapistan 500mg sudah kadaluarsa pada tanggal 25 Maret 2020	pharmacy.report.history	[]	3	0	2020-07-01 10:11:13	2020-07-01 10:11:13
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: periodical_stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periodical_stocks (id, year, month, stock_id, item_id, lokasi_id, expired_date, gross, netto, created_at, updated_at) FROM stdin;
3	2020	3	3	9	49	2020-03-25	4	4	\N	\N
4	2020	3	4	9	49	2020-11-25	2	2	\N	\N
5	2020	3	5	9	49	2020-04-15	76	76	\N	\N
6	2020	7	3	9	49	2020-03-25	0	0	\N	\N
\.


--
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (id, permission_id, role_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permission_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_user (id, permission_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, slug, description, model, created_at, updated_at, is_active, is_permission, is_grup_nota, roles, is_signa, is_lokasi, is_gudang_farmasi, is_keadaan_umum) FROM stdin;
44	Ditaruh dibawah lidah	jvhVmTTNRM0H3baJditaruh_dibawah_lidah	signa2	\N	2019-12-16 03:28:10	2019-12-16 03:28:10	1	0	0	{}	1	0	0	0
6	Purchasing Staff	purchasing_staff	Mengurus pembelian bahan baku	\N	2019-11-17 02:54:19	2019-11-17 07:54:01	1	0	0	{}	0	0	0	0
43	3 x 1 Tetes	9hr3_x1_tetes	signa1	\N	2019-12-16 03:24:00	2019-12-16 03:32:45	1	0	0	[]	1	0	0	0
48	Poli 1	x9y90D7w6goHmryApoli1	dada	\N	2019-12-21 10:23:20	2019-12-21 10:23:20	1	0	0	{}	0	1	0	0
3	Keuangan	keuangan	Menghitung keuangan	\N	2019-11-17 02:34:04	2019-11-17 08:08:27	1	0	0	{}	0	0	0	0
5	Supervisor	supervisor	fsd	\N	2019-11-17 02:53:18	2019-11-17 08:08:43	0	0	0	{}	0	0	0	0
4	Satpam	satpam	Penjaga keamanan	\N	2019-11-17 02:35:53	2019-11-17 08:21:10	0	0	0	{}	0	0	0	0
2	Direktur	direktur	-	\N	2019-11-17 02:30:06	2019-11-17 08:21:23	1	0	0	{}	0	0	0	0
52	2 x 1 sehari sebelum makan	f1oPQ0hdddLg9oMT2_x1_sehari_sebelum_makan	signa1	\N	2020-01-08 16:07:37	2020-01-08 16:07:37	1	0	0	{}	1	0	0	0
17	Business Analyst	business_analyst	x.lllldddd	\N	2019-11-19 10:38:08	2019-11-19 13:46:22	1	0	0	{}	0	0	0	0
16	Project manager	project_manager	managemen proyek	\N	2019-11-19 10:37:18	2019-11-19 13:47:33	1	0	0	{}	0	0	0	0
18	Accounting Analyst	accounting_analyst	fdssdfsvvv	\N	2019-11-19 13:48:34	2019-11-19 13:48:34	1	0	0	{}	0	0	0	0
19	Akuntan	akuntan	Bertanggung jawab atas penjurnalan	\N	2019-12-03 14:32:26	2019-12-03 14:32:26	1	1	0	{}	0	0	0	0
21	Tindakan operasi	PO	\N	\N	2019-12-03 14:37:55	2019-12-03 14:37:55	1	0	1	{}	0	0	0	0
54	Ditelan	JU5pj51lv0dUpKmnditelan	signa2	\N	2020-01-08 16:08:57	2020-01-08 16:08:57	1	0	0	{}	1	0	0	0
20	Administrasi	ADM	Biaya awal registrasi	\N	2019-12-03 14:32:52	2019-12-03 16:05:11	1	0	1	{}	0	0	0	0
23	Pemeriksaan patologi anatomi	PA	\N	\N	2019-12-04 02:40:50	2019-12-04 02:40:50	1	0	1	{}	0	0	0	0
24	Jasa / tindakan medis	TM	\N	\N	2019-12-04 02:41:19	2019-12-04 02:41:19	1	0	1	{}	0	0	0	0
29	Admin pasien	admin_pasien	\N	\N	2019-12-12 03:47:08	2019-12-13 03:01:48	1	1	0	{}	0	0	0	0
31	3 x 1 tetes	3_x1_tetes	signa1	\N	2019-12-16 03:13:09	2019-12-16 03:13:09	1	0	0	{}	0	0	0	0
28	Customer service	customer_service	\N	\N	2019-12-12 00:55:03	2019-12-12 01:38:28	1	1	0	{}	0	0	0	0
57	Dikunyah	rMzC6g6IL871qbL9dikunyah	signa2	\N	2020-01-08 16:14:54	2020-01-08 16:14:54	1	0	0	{}	1	0	0	0
58	1 x 1 sehari sebelum tidur	6IlCHEdSuCinxO1l1_x1_sehari_sebelum_tidur	signa1	\N	2020-01-08 16:15:35	2020-01-08 16:15:35	1	0	0	{}	1	0	0	0
53	Ditelan	6ISditelan	signa2	\N	2020-01-08 16:07:37	2020-01-09 04:46:48	0	0	0	{}	1	0	0	0
55	Ditelan	CYwditelan	signa2	\N	2020-01-08 16:08:57	2020-01-09 04:46:52	0	0	0	{}	1	0	0	0
56	2 x 1 sehari sebelum makan	Fdr2_x1_sehari_sebelum_makan	signa1	\N	2020-01-08 16:14:54	2020-01-09 04:47:00	0	0	0	{}	1	0	0	0
59	Manajemen	up4DG0qAamnvmHwgmanajemen	\N	\N	2020-01-09 06:48:52	2020-01-09 06:48:52	1	1	0	{"setting":"1","setting.price":"1","setting.price.create":"1","setting.price.edit":"1","setting.price.show":"1","setting.price.activate":"1","setting.price.destroy":"1","setting.discount":"1","setting.discount.create":"1","setting.discount.edit":"1","setting.discount.show":"1","setting.discount.activate":"1","setting.discount.destroy":"1","master":"1","master.patient":"1","master.medical_worker":"1","master.employee":"1","registration":"1","cashier":"1","polyclinic":"1"}	0	0	0	0
60	Administrasi	ADM01	\N	\N	2020-01-09 07:25:07	2020-01-09 07:25:07	1	0	1	{}	0	0	0	0
62	Obat	MED	\N	\N	2020-02-14 07:47:13	2020-02-14 07:47:13	1	0	1	{}	0	0	0	0
63	1x1	DVZXX9nF50q0yeyy1x1	signa1	\N	2020-03-06 05:34:54	2020-03-06 05:34:54	1	0	0	{}	1	0	0	0
64	ditelan	PL18dDKsrMg50vPCditelan	signa2	\N	2020-03-06 05:34:54	2020-03-06 05:34:54	1	0	0	{}	1	0	0	0
65	Radiologi	RD	\N	\N	2020-03-08 03:34:16	2020-03-08 03:34:16	1	0	1	{}	0	0	0	0
66	Laboratorium	LB	\N	\N	2020-03-08 03:34:28	2020-03-08 03:34:28	1	0	1	{}	0	0	0	0
22	Kasir	MTBkasir	Bertanggung jawab atas pembayaran	\N	2019-12-03 14:38:15	2020-06-24 10:04:19	1	1	0	{"cashier.show":"1","cashier.edit":"1","registration.create":"1","registration.edit":"1","registration.show":"1","registration.attend":"1","registration.destroy":"1","cashier":"1","registration":"1"}	0	0	0	0
67	Radiografer	a2lradiografer	Radiografer dan Fisikawan medis	\N	2020-06-12 03:43:27	2020-06-29 02:34:15	1	1	0	{"radiology":"1","radiology.edit":"1","radiology.finish":"1","radiology.show":"1"}	0	0	0	0
49	Poli 2	dcW66qUXBoHvWeDEpoli2	dasdsa	\N	2019-12-21 10:23:34	2019-12-21 10:23:34	1	0	0	{}	0	1	1	0
68	Dokter Poliklinik	dokter_poliklinik	\N	\N	\N	\N	1	1	0	{"polyclinic":"1","polyclinic.show":"1","polyclinic.edit":"1","polyclinic.finish":"1"}	0	0	0	0
69	Dokter Radiologi	dokter_radiologi	\N	\N	\N	\N	1	1	0	{"radiology":"1","radiology.show":"1","radiology.edit":"1","radiology.finish":"1"}	0	0	0	0
70	Dokter Laboratorium	dokter_laboratorium	\N	\N	\N	\N	1	1	0	{"laboratory":"1","laboratory.show":"1","laboratory.edit":"1","laboratory.finish":"1"}	0	0	0	0
71	Dokter Ruang Tindakan	dokter_ruang_tindakan	\N	\N	\N	\N	1	1	0	{"ruang_tindakan":"1","ruang_tindakan.show":"1","ruang_tindakan.edit":"1","ruang_tindakan.finish":"1"}	0	0	0	0
72	Dokter Kemoterapi	dokter_kemoterapi	\N	\N	\N	\N	1	1	0	{"chemoterapy":"1","chemoterapy.show":"1","chemoterapy.edit":"1","chemoterapy.finish":"1"}	0	0	0	0
73	Dokter Medical Checkup	dokter_medical_checkup	\N	\N	\N	\N	1	1	0	{"medical_checkup":"1","medical_checkup.show":"1","medical_checkup.edit":"1","medical_checkup.finish":"1"}	0	0	0	0
75	Perawat Poli	cDjperawat_poli	\N	\N	2020-06-29 02:26:42	2020-06-29 02:37:38	1	1	0	{"master.medical_item":"1","master.medical_item.create":"1","master.medical_item.edit":"1","master.medical_item.show":"1","master.medical_item.activate":"1","master.medical_item.destroy":"1","master.obat":"1","master.obat.create":"1","master.obat.edit":"1","master.obat.show":"1","master.obat.activate":"1","master.obat.destroy":"1","master.lokasi":"1","master.lokasi.create":"1","master.lokasi.edit":"1","master.lokasi.activate":"1","master.lokasi.destroy":"1","master.piece":"1","master.piece.create":"1","master.piece.edit":"1","master.piece.activate":"1","master.piece.destroy":"1","master.disease":"1","master.disease.create":"1","master.disease.edit":"1","master.disease.show1":"1","master.disease.activate":"1","master.disease.destroy":"1","registration.attend":"1","registration.destroy":"1","registration.show":"1","polyclinic.finish":"1","polyclinic.show":"1","polyclinic.edit":"1","polyclinic":"1","laboratory":"0","laboratory.edit":"0","laboratory.show":"1","radiology.show":"1","chemoterapy.show":"1","ruang_tindakan.show":"1","medical_checkup.show":"1","surat":"1","surat.cuti_hamil":"1","surat.cuti_hamil.create":"1","surat.cuti_hamil.edit":"1","surat.cuti_hamil.show":"1","surat.cuti_hamil.destroy":"1","surat.keterangan_dokter":"1","surat.keterangan_dokter.create":"1","surat.keterangan_dokter.edit":"1","surat.keterangan_dokter.show":"1","surat.keterangan_dokter.destroy":"1","surat.keterangan_sehat":"1","surat.keterangan_sehat.create":"1","surat.keterangan_sehat.edit":"1","surat.keterangan_sehat.show":"1","surat.keterangan_sehat.destroy":"1","surat.layak_terbang":"1","surat.layak_terbang.create":"1","surat.layak_terbang.edit":"1","surat.layak_terbang.show":"1","surat.layak_terbang.destroy":"1","surat.pengantar_mrs":"1","surat.pengantar_mrs.create":"1","surat.pengantar_mrs.edit":"1","surat.pengantar_mrs.show":"1","surat.pengantar_mrs.destroy":"1","surat.rujukan_pasien.create":"1","surat.rujukan_pasien":"1","surat.rujukan_pasien.edit":"1","surat.rujukan_pasien.show":"1","surat.rujukan_pasien.destroy":"1","surat.persetujuan_tindakan_medis":"1","surat.persetujuan_tindakan_medis.create":"1","surat.persetujuan_tindakan_medis.edit":"1","surat.persetujuan_tindakan_medis.show":"1","surat.persetujuan_tindakan_medis.destroy":"1","radiology":"0","radiology.edit":"0","radiology.finish":"0","laboratory.finish":"0","chemoterapy":"1","chemoterapy.edit":"1","chemoterapy.finish":"1","ruang_tindakan":"1","ruang_tindakan.edit":"1","ruang_tindakan.finish":"1","medical_checkup":"1","medical_checkup.edit":"1","medical_checkup.finish":"1"}	0	0	0	0
76	Analis Lab	XyAanalis_lab	\N	\N	2020-06-29 02:40:29	2020-06-29 06:52:29	1	1	0	{"laboratory":"1","laboratory.edit":"1","laboratory.show":"1","laboratory.finish":"1","master":"0"}	0	0	0	0
77	Dokter Obgyn	gN1OztQhcPcG3iiqdokter_obgyn	Konsultasi dan tindakan kehamilan dan ginekologi	\N	2020-06-30 07:08:54	2020-06-30 07:08:54	1	1	0	{"polyclinic":"1","polyclinic.edit":"1","polyclinic.show":"1","radiology.show":"1","laboratory.show":"1","chemoterapy.show":"1","surat.cuti_hamil":"1","surat.cuti_hamil.create":"1","surat.cuti_hamil.show":"1","surat.cuti_hamil.destroy":"1","surat.keterangan_dokter.create":"1","surat.keterangan_dokter.edit":"1","surat.keterangan_dokter.show":"1","surat.keterangan_dokter.destroy":"1","surat.keterangan_sehat":"1","surat.keterangan_sehat.create":"1","surat.keterangan_sehat.edit":"1","surat.keterangan_sehat.show":"1","surat.keterangan_sehat.destroy":"1","surat.layak_terbang":"1","surat.layak_terbang.create":"1","surat.layak_terbang.show":"1","surat.layak_terbang.edit":"1","surat.layak_terbang.destroy":"1","surat.pengantar_mrs":"1","surat.pengantar_mrs.create":"1","surat.pengantar_mrs.edit":"1","surat.pengantar_mrs.show":"1","surat.pengantar_mrs.destroy":"1","surat.rujukan_pasien":"1","surat.rujukan_pasien.create":"1","surat.rujukan_pasien.edit":"1","surat.rujukan_pasien.show":"1","surat.rujukan_pasien.destroy":"1"}	0	0	0	0
78	2x1	BcGFVW138ZyZh8y72x1	signa1	\N	2020-06-30 09:20:09	2020-06-30 09:20:09	1	0	0	{}	1	0	0	0
74	Farmasi	3oCfarmasi	\N	\N	2020-06-24 08:57:42	2020-07-01 10:16:33	1	1	0	{"master.obat":"1","master.medical_item":"1","master.medical_item.create":"1","master.medical_item.edit":"1","master.medical_item.show":"1","master.medical_item.activate":"1","master.medical_item.destroy":"1","setting.price":"0","setting.price.create":"0","setting.price.edit":"0","setting.price.show":"0","setting.price.activate":"0","setting.price.destroy":"0","master.obat.create":"1","master.obat.edit":"1","master.obat.show":"1","master.obat.activate":"1","master.obat.destroy":"1","master.lokasi":"1","master.lokasi.edit":"1","master.lokasi.create":"1","master.lokasi.activate":"1","master.lokasi.destroy":"1","master.piece":"1","master.piece.create":"1","master.piece.edit":"1","master.piece.activate":"1","master.piece.destroy":"1","pharmacy":"1","pharmacy.purchase_request":"1","pharmacy.purchase_request.create":"1","pharmacy.purchase_request.edit":"1","pharmacy.purchase_request.show":"1","pharmacy.purchase_request.destroy":"1","pharmacy.purchase_order":"1","pharmacy.purchase_order.edit":"1","pharmacy.purchase_order.show":"1","pharmacy.receipt":"1","pharmacy.receipt.create":"1","pharmacy.receipt.show":"1","master.supplier":"1","master.supplier.create":"1","master.supplier.edit":"1","master.supplier.show":"1","master.supplier.activate":"1","master.supplier.destroy":"1","master":"1","pharmacy.purchase_request.update":"1","pharmacy.purchase_request.approve":"1","pharmacy.purchase_order.update":"1"}	0	0	0	0
\.


--
-- Data for Name: pieces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pieces (id, name, is_active, created_at, updated_at) FROM stdin;
2	kgm	1	2019-11-20 10:59:27	2019-11-20 11:00:25
3	cm3	0	2019-11-20 11:00:09	2019-11-20 11:00:52
1	kg	1	2019-11-20 10:58:24	2019-11-20 11:01:27
4	ons	0	2019-11-20 11:01:11	2019-12-02 03:53:26
5	item	1	2019-12-11 07:15:50	2019-12-11 07:15:50
6	box	1	2019-12-11 07:15:58	2019-12-11 07:15:58
7	lusin	1	2019-12-21 13:23:20	2019-12-21 13:23:20
8	butir	1	2019-12-21 13:23:20	2019-12-21 14:23:20
10	Kaplet	1	2020-02-14 07:39:34	2020-02-14 07:39:34
11	Tablet	1	2020-02-14 07:39:41	2020-02-14 07:39:41
\.


--
-- Data for Name: pivot_medical_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pivot_medical_records (id, medical_record_id, registration_detail_id, created_at, updated_at, is_referenced, is_ruang_tindakan, is_radiology, is_laboratory, medical_record_detail_id, additional, is_laboratory_treatment, parent_id, is_chemoterapy) FROM stdin;
38	3	3	2020-02-19 03:39:59	2020-02-19 03:39:59	0	0	0	0	\N	{}	0	\N	0
39	4	4	2020-02-19 04:07:56	2020-02-19 04:07:56	0	0	0	0	\N	{}	0	\N	0
40	2	5	2020-03-06 03:44:57	2020-03-06 03:44:57	0	0	0	0	\N	{}	0	\N	0
41	3	6	2020-03-06 05:13:28	2020-03-06 05:13:28	0	0	0	0	\N	{}	0	\N	0
42	4	7	2020-03-06 06:43:50	2020-03-06 06:43:50	0	0	0	0	\N	{}	0	\N	0
43	5	8	2020-03-06 06:44:50	2020-03-06 06:44:50	0	0	0	0	\N	{}	0	\N	0
48	7	10	\N	2020-03-08 03:55:53	0	0	0	0	\N	{}	0	\N	0
50	3	6	\N	\N	0	0	0	0	\N	{}	0	\N	0
51	8	11	2020-03-12 09:47:52	2020-03-12 09:47:52	0	0	0	0	\N	{}	0	\N	0
52	9	12	2020-03-12 09:53:40	2020-03-12 09:53:40	0	0	0	0	\N	{}	0	\N	0
53	10	13	2020-03-13 03:11:04	2020-03-13 03:11:04	0	0	0	0	\N	{}	0	\N	0
54	11	14	2020-03-14 17:29:37	2020-03-14 17:29:37	0	0	0	0	\N	{}	0	\N	0
71	14	17	\N	\N	1	0	1	0	77	{}	0	\N	0
72	15	18	2020-06-11 07:49:49	2020-06-11 07:49:49	0	0	0	0	\N	{}	0	\N	0
73	16	19	2020-06-12 03:49:21	2020-06-12 03:49:21	0	0	0	0	\N	{}	0	\N	0
65	11	14	\N	\N	1	0	0	0	68	{}	1	64	0
74	17	20	2020-06-12 04:05:23	2020-06-12 04:05:23	0	0	0	0	\N	{}	0	\N	0
75	18	21	2020-06-30 04:18:23	2020-06-30 04:18:23	0	0	0	0	\N	{}	0	\N	0
64	11	14	\N	2020-03-19 03:40:34	1	0	0	1	68	{"treatment":[{"id":1,"name":"Hematologi","detail":[{"id":4,"name":"LED","is_active":1},{"id":5,"name":"Retikulosit","is_active":1},{"id":6,"name":"Hapusan Darah Tepi","is_active":1}]}]}	0	\N	0
66	12	15	2020-03-19 06:19:35	2020-03-19 06:19:35	0	0	0	0	\N	{}	0	\N	0
67	13	16	2020-03-19 06:23:37	2020-03-19 06:23:37	0	0	0	0	\N	{}	0	\N	0
68	14	17	2020-03-19 06:28:56	2020-03-19 06:28:56	0	0	0	0	\N	{}	0	\N	0
44	5	8	\N	\N	0	0	0	0	\N	{}	0	\N	0
45	6	9	2020-03-08 03:40:23	2020-03-08 03:40:23	0	0	0	0	\N	{}	0	\N	0
76	19	22	2020-06-30 04:22:47	2020-06-30 04:22:47	0	0	0	0	\N	{}	0	\N	0
46	6	9	\N	2020-03-08 03:43:54	0	0	0	0	\N	{}	0	\N	0
47	7	10	2020-03-08 03:54:06	2020-03-08 03:54:06	0	0	0	0	\N	{}	0	\N	0
77	20	23	2020-06-30 09:37:38	2020-06-30 09:37:38	0	0	0	0	\N	{}	0	\N	0
78	21	24	2020-06-30 10:41:35	2020-06-30 10:41:35	0	0	0	0	\N	{}	0	\N	0
79	22	25	2020-06-30 11:00:57	2020-06-30 11:00:57	0	0	0	0	\N	{}	0	\N	0
80	23	26	2020-07-01 07:23:53	2020-07-01 07:23:53	0	0	0	0	\N	{}	0	\N	0
82	10	13	\N	\N	1	0	0	0	89	{}	1	81	0
81	10	13	\N	2020-07-01 09:28:29	1	0	0	1	89	{"treatment":[{"id":1,"name":"Hematologi","detail":[{"id":4,"name":"LED","is_active":1},{"id":5,"name":"Retikulosit","is_active":1},{"id":6,"name":"Hapusan Darah Tepi","is_active":1}]}]}	0	\N	0
83	24	29	2020-07-01 09:38:06	2020-07-01 09:38:06	0	0	0	0	\N	{}	0	\N	0
84	25	28	2020-07-01 09:38:10	2020-07-01 09:38:10	0	0	0	0	\N	{}	0	\N	0
85	26	27	2020-07-01 09:38:13	2020-07-01 09:38:13	0	0	0	0	\N	{}	0	\N	0
\.


--
-- Data for Name: polyclinics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polyclinics (id, code, name, index, cost_center, is_active, created_at, updated_at) FROM stdin;
8	BD001	Bedah	0	\N	1	2020-01-08 07:12:35	2020-01-08 07:12:35
9	UM001	Umum	0	\N	1	2020-01-08 07:12:43	2020-01-08 07:12:43
10	OB001	Obgyn	0	\N	1	2020-01-08 07:12:53	2020-01-08 07:12:53
11	ON001	Onkologi	0	\N	1	2020-01-08 07:13:16	2020-01-08 07:13:16
12	RD001	Radiologi	0	\N	1	2020-01-08 07:13:40	2020-01-08 07:13:40
13	PD001	Penyakit Dalam	0	\N	1	2020-01-08 07:56:48	2020-01-08 07:56:48
14	ANA	Anak	0	\N	1	2020-01-10 03:21:06	2020-01-10 03:21:06
15	ANA1	Anak	0	\N	0	2020-01-10 03:21:06	2020-01-10 03:21:14
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (id, item_id, grup_nota_id, destination, polyclinic_id, is_registration, qty, custom_price, is_active, is_default, created_by, created_at, updated_at, percentage, is_sewa_ruangan, is_sewa_alkes, laboratory_group, is_treatment, is_diagnostic, radiology_group, is_chemoterapy) FROM stdin;
1	2	60	\N	\N	1	1	250000	1	1	43	2020-01-08 08:33:03	2020-01-09 07:25:49	80	0	0	\N	0	0	\N	0
2	1	60	\N	\N	1	1	50000	1	1	43	2020-01-08 08:30:52	2020-01-09 07:26:01	0	0	0	\N	0	0	\N	0
4	9	62	\N	\N	0	1	0	1	1	43	2020-03-03 07:40:14	2020-03-03 07:40:14	0	0	0	\N	0	0	\N	0
5	10	24	POLIKLINIK	9	0	1	50000	1	1	43	2020-03-06 04:21:20	2020-03-06 04:21:20	80	0	0	\N	0	0	\N	0
6	18	24	RUANG TINDAKAN	\N	0	1	250000	1	1	43	2020-03-06 06:47:11	2020-03-06 06:47:11	80	0	0	\N	0	0	\N	0
8	25	66	LABORATORIUM	\N	0	1	300000	0	1	43	2020-03-08 03:34:59	2020-03-14 17:34:28	0	0	0	\N	0	0	\N	0
9	26	66	LABORATORIUM	\N	0	1	250000	0	1	43	2020-03-08 03:35:17	2020-03-14 17:34:32	0	0	0	\N	0	0	\N	0
7	19	24	RADIOLOGI	\N	0	1	500000	0	1	43	2020-03-06 06:55:02	2020-03-14 17:34:36	0	0	0	\N	0	0	\N	0
10	27	65	RADIOLOGI	\N	0	1	90000	0	1	43	2020-03-14 17:35:01	2020-03-18 06:13:57	80	0	0	\N	0	0	\N	0
11	28	66	LABORATORIUM	\N	0	1	0	0	1	43	2020-03-14 17:36:44	2020-03-18 06:14:00	0	0	0	\N	0	0	\N	0
12	29	23	POLIKLINIK	9	0	4	45000	0	1	43	2020-03-15 09:19:48	2020-03-18 06:14:03	2	0	0	\N	0	0	\N	0
13	30	66	LABORATORIUM	\N	0	1	300000	1	1	43	2020-03-18 06:14:29	2020-03-18 06:15:18	0	0	0	\N	0	1	\N	0
14	31	20	\N	\N	1	1	50000	1	1	43	2020-03-19 06:07:05	2020-03-19 06:07:05	0	0	0	\N	0	0	\N	0
15	32	20	POLIKLINIK	\N	1	1	50000	1	1	43	2020-03-19 06:21:09	2020-03-19 06:21:09	0	0	0	\N	0	0	\N	0
16	33	20	POLIKLINIK	\N	1	1	250000	1	1	43	2020-03-19 06:22:36	2020-03-19 06:22:36	80	0	0	\N	0	0	\N	0
18	36	24	RUANG TINDAKAN	\N	0	1	640000	1	1	43	2020-03-19 09:52:17	2020-03-19 09:52:43	0	0	0	\N	1	0	\N	0
17	35	65	RADIOLOGI	\N	0	1	250000	1	1	43	2020-03-19 09:15:04	2020-06-15 06:51:30	0	0	0	\N	0	1	1	0
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, name, created_at, updated_at) FROM stdin;
1	Nanggroe Aceh Darussalam	\N	\N
2	Sumatera Utara	\N	\N
3	Sumatera Barat	\N	\N
4	Riau	\N	\N
5	Kepulauan Riau	\N	\N
6	Kepulauan Bangka-Belitung	\N	\N
7	Jambi	\N	\N
8	Bengkulu	\N	\N
9	Sumatera Selatan	\N	\N
10	Lampung	\N	\N
11	Banten	\N	\N
12	DKI Jakarta	\N	\N
13	Jawa Barat	\N	\N
14	Jawa Tengah	\N	\N
15	Daerah Istimewa Yogyakarta  	\N	\N
16	Jawa Timur	\N	\N
17	Bali	\N	\N
18	Nusa Tenggara Barat	\N	\N
19	Nusa Tenggara Timur	\N	\N
20	Kalimantan Barat	\N	\N
21	Kalimantan Tengah	\N	\N
22	Kalimantan Selatan	\N	\N
23	Kalimantan Timur	\N	\N
24	Gorontalo	\N	\N
25	Sulawesi Selatan	\N	\N
26	Sulawesi Tenggara	\N	\N
27	Sulawesi Tengah	\N	\N
28	Sulawesi Utara	\N	\N
29	Sulawesi Barat	\N	\N
30	Maluku	\N	\N
31	Maluku Utara	\N	\N
32	Papua Barat	\N	\N
33	Papua	\N	\N
34	Kalimantan Utara	\N	\N
\.


--
-- Data for Name: purchase_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_order_details (id, purchase_order_id, item_id, qty, received_qty, leftover_qty, purchase_price, discount, created_at, updated_at) FROM stdin;
1	1	9	3	0	3	2000	5	2020-03-15 09:15:46	2020-03-15 09:15:46
2	2	9	6	6	0	4000	4	2020-03-15 09:15:46	2020-03-15 09:17:18
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_orders (id, date, code, purchase_request_id, supplier_id, date_start, date_end, description, is_receipt_completed, is_used, created_by, additional, created_at, updated_at) FROM stdin;
1	2020-03-15	PO-2003-00001	2	113	2020-02-01	2020-02-29	-	0	0	43	{}	2020-03-15 09:15:46	2020-03-15 09:15:46
2	2020-03-15	PO-2003-00002	2	263	2020-02-01	2020-02-29	-	0	1	43	{}	2020-03-15 09:15:46	2020-03-15 09:15:46
\.


--
-- Data for Name: purchase_request_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_request_details (id, purchase_request_id, item_id, supplier_id, qty, purchase_price, discount, created_at, updated_at) FROM stdin;
2	2	9	113	3	2000	5	2020-03-15 09:15:29	2020-03-15 09:15:29
3	2	9	263	6	4000	4	2020-03-15 09:15:29	2020-03-15 09:15:29
\.


--
-- Data for Name: purchase_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_requests (id, date, code, date_start, date_end, description, is_approve, created_by, additional, created_at, updated_at) FROM stdin;
2	2020-03-15	PP-2003-00001	2020-02-01	2020-02-29	-	1	43	{}	2020-03-15 09:15:29	2020-03-15 09:15:46
\.


--
-- Data for Name: radiology_type_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radiology_type_details (id, radiology_type_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: radiology_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radiology_types (id, name, is_active, created_at, updated_at) FROM stdin;
1	Umum	1	2020-06-15 06:49:55	2020-06-15 06:49:55
\.


--
-- Data for Name: receipt_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_details (id, receipt_id, purchase_order_detail_id, stock_transaction_id, item_id, expired_date, qty, purchase_price, hna, discount, created_at, updated_at) FROM stdin;
1	3	2	3	9	2020-03-25	4	4000	8000	4	2020-03-15 09:16:54	2020-03-15 09:16:54
2	6	2	4	9	2020-11-25	2	4000	7000	4	2020-03-15 09:17:18	2020-03-15 09:17:18
\.


--
-- Data for Name: receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipts (id, date, code, purchase_order_id, supplier_id, date_start, date_end, description, is_receipt_order, created_by, additional, created_at, updated_at) FROM stdin;
3	2020-03-15	TF-2003-00001	2	263	2020-02-01	2020-02-29	-	0	43	{}	2020-03-15 09:16:54	2020-03-15 09:16:54
6	2020-03-15	TF-2003-00002	2	263	2020-02-01	2020-02-29	-	0	43	{}	2020-03-15 09:17:18	2020-03-15 09:17:18
\.


--
-- Data for Name: registration_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration_details (id, registration_id, destination, polyclinic_id, doctor_id, "time", created_at, updated_at, status, medical_record_refer_id) FROM stdin;
2	2	POLIKLINIK	9	64	12:00:00	2020-02-17 04:55:33	2020-02-17 04:55:33	0	\N
3	3	POLIKLINIK	10	65	10:30:00	2020-02-19 03:39:26	2020-02-19 03:39:26	0	\N
4	4	RADIOLOGI	\N	67	11:30:00	2020-02-19 04:07:51	2020-02-19 04:07:51	0	\N
5	5	POLIKLINIK	9	63	10:30:00	2020-03-06 03:44:46	2020-03-06 04:38:18	1	\N
6	6	POLIKLINIK	9	63	12:30:00	2020-03-06 05:12:36	2020-03-06 05:12:36	0	\N
7	7	RUANG TINDAKAN	\N	63	13:30:00	2020-03-06 06:43:17	2020-03-06 06:43:17	0	\N
8	8	POLIKLINIK	9	63	13:44:00	2020-03-06 06:44:34	2020-03-06 06:44:34	0	\N
9	9	LABORATORIUM	\N	261	10:40:00	2020-03-08 03:40:08	2020-03-08 03:40:08	0	\N
10	10	RADIOLOGI	\N	67	10:54:00	2020-03-08 03:54:01	2020-03-08 03:54:01	0	\N
11	11	LABORATORIUM	\N	261	16:46:00	2020-03-12 09:47:24	2020-03-12 09:47:24	0	\N
12	12	POLIKLINIK	9	64	16:53:00	2020-03-12 09:53:32	2020-03-12 09:53:32	0	\N
13	13	POLIKLINIK	9	64	10:10:00	2020-03-13 03:10:59	2020-03-13 03:10:59	0	\N
14	14	POLIKLINIK	9	63	08:00:00	2020-03-14 17:29:32	2020-03-19 03:42:03	1	\N
15	15	POLIKLINIK	8	61	13:13:00	2020-03-19 06:18:57	2020-03-19 06:18:57	0	\N
16	16	POLIKLINIK	8	61	13:23:00	2020-03-19 06:23:27	2020-03-19 06:23:27	0	\N
17	17	POLIKLINIK	8	61	13:22:00	2020-03-19 06:28:45	2020-03-19 06:28:45	0	\N
18	18	POLIKLINIK	9	63	15:00:00	2020-06-11 07:48:07	2020-06-11 07:48:07	0	\N
19	19	RADIOLOGI	\N	67	10:48:00	2020-06-12 03:48:27	2020-06-12 03:48:27	0	\N
20	20	POLIKLINIK	8	61	11:04:00	2020-06-12 04:04:46	2020-06-12 04:04:46	0	\N
21	21	RADIOLOGI	\N	67	12:00:00	2020-06-30 04:17:08	2020-06-30 04:17:08	0	\N
22	22	POLIKLINIK	14	249	11:45:00	2020-06-30 04:22:37	2020-06-30 09:30:21	1	\N
23	23	POLIKLINIK	14	249	16:45:00	2020-06-30 09:37:18	2020-06-30 09:37:18	0	\N
24	24	POLIKLINIK	14	249	17:40:00	2020-06-30 10:41:28	2020-06-30 10:41:28	0	\N
25	25	POLIKLINIK	14	249	18:00:00	2020-06-30 10:57:50	2020-06-30 10:57:50	0	\N
26	26	POLIKLINIK	14	249	14:22:00	2020-07-01 07:23:17	2020-07-01 07:23:17	0	\N
27	27	POLIKLINIK	8	61	16:45:00	2020-07-01 09:33:17	2020-07-01 09:33:17	0	\N
28	28	POLIKLINIK	10	65	17:00:00	2020-07-01 09:34:12	2020-07-01 09:34:12	0	\N
29	29	POLIKLINIK	9	63	17:15:00	2020-07-01 09:36:29	2020-07-01 09:36:29	0	\N
\.


--
-- Data for Name: registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registrations (id, patient_type, family_type, code, insurance_code, insurance_owner_name, plafon, date, status, patient_id, pic_id, assesment_id, medical_record_id, created_at, updated_at, created_by, updated_by) FROM stdin;
2	UMUM	DIRI SENDIRI	RJ-200200001	\N	\N	0	2020-02-17	2	240	\N	\N	2	2020-02-17 04:55:33	2020-02-17 04:55:38	43	43
3	UMUM	DIRI SENDIRI	RJ-200200002	\N	\N	0	2020-02-19	2	250	\N	\N	3	2020-02-19 03:39:26	2020-02-19 03:39:59	43	43
4	UMUM	DIRI SENDIRI	RJ-200200003	\N	\N	0	2020-02-19	2	240	\N	\N	4	2020-02-19 04:07:51	2020-02-19 04:07:56	43	43
5	UMUM	DIRI SENDIRI	RJ-200300001	\N	\N	0	2020-03-06	2	240	\N	\N	2	2020-03-06 03:44:46	2020-03-06 03:44:57	43	43
6	UMUM	DIRI SENDIRI	RJ-200300002	\N	\N	0	2020-03-06	2	252	\N	\N	3	2020-03-06 05:12:36	2020-03-06 05:13:28	43	43
7	UMUM	DIRI SENDIRI	RJ-200300003	\N	\N	0	2020-03-06	2	240	\N	\N	4	2020-03-06 06:43:17	2020-03-06 06:43:50	43	43
8	UMUM	DIRI SENDIRI	RJ-200300004	\N	\N	0	2020-03-06	2	240	\N	\N	5	2020-03-06 06:44:34	2020-03-06 06:44:50	43	43
9	UMUM	DIRI SENDIRI	RJ-200300005	\N	\N	0	2020-03-08	2	240	\N	\N	6	2020-03-08 03:40:08	2020-03-08 03:40:23	43	43
10	UMUM	DIRI SENDIRI	RJ-200300006	\N	\N	0	2020-03-08	2	240	\N	\N	7	2020-03-08 03:54:01	2020-03-08 03:54:06	43	43
11	UMUM	DIRI SENDIRI	RJ-200300007	\N	\N	0	2020-03-12	2	240	\N	\N	8	2020-03-12 09:47:24	2020-03-12 09:47:52	43	43
12	UMUM	DIRI SENDIRI	RJ-200300008	\N	\N	0	2020-03-12	2	240	\N	\N	9	2020-03-12 09:53:32	2020-03-12 09:53:40	43	43
13	UMUM	DIRI SENDIRI	RJ-200300009	\N	\N	0	2020-03-13	2	240	\N	\N	10	2020-03-13 03:10:59	2020-03-13 03:11:04	43	43
14	UMUM	DIRI SENDIRI	RJ-200300010	\N	\N	0	2020-03-15	2	240	\N	\N	11	2020-03-14 17:29:32	2020-03-14 17:29:37	43	43
15	ASURANSI SWASTA	SUAMI/ISTRI	RJ-200300011	01010101010101	amira cholid bawazeer	0	2020-03-19	2	264	\N	\N	12	2020-03-19 06:18:57	2020-03-19 06:19:35	43	43
16	UMUM	DIRI SENDIRI	RJ-200300012	\N	\N	0	2020-03-19	2	265	\N	\N	13	2020-03-19 06:23:27	2020-03-19 06:23:37	43	43
17	UMUM	SUAMI/ISTRI	RJ-200300013	\N	\N	0	2020-03-19	2	264	\N	\N	14	2020-03-19 06:28:45	2020-03-19 06:28:56	43	43
18	UMUM	DIRI SENDIRI	RJ-200600001	\N	\N	0	2020-06-11	2	269	\N	\N	15	2020-06-11 07:48:07	2020-06-11 07:49:49	43	43
19	UMUM	DIRI SENDIRI	RJ-200600002	\N	\N	0	2020-06-12	2	271	\N	\N	16	2020-06-12 03:48:27	2020-06-12 03:49:21	43	43
20	UMUM	DIRI SENDIRI	RJ-200600003	\N	\N	0	2020-06-12	2	250	\N	\N	17	2020-06-12 04:04:46	2020-06-12 04:05:23	43	43
21	UMUM	KELUARGA	RJ-200600004	\N	\N	0	2020-06-30	2	281	\N	\N	18	2020-06-30 04:17:08	2020-06-30 04:18:23	43	43
22	UMUM	ORANG TUA	RJ-200600005	\N	\N	0	2020-06-30	2	283	\N	\N	19	2020-06-30 04:22:37	2020-06-30 04:22:47	43	43
23	UMUM	DIRI SENDIRI	RJ-200600006	\N	\N	0	2020-06-30	2	286	\N	\N	20	2020-06-30 09:37:18	2020-06-30 09:37:38	43	43
24	UMUM	DIRI SENDIRI	RJ-200600007	\N	\N	0	2020-06-30	2	265	\N	\N	21	2020-06-30 10:41:28	2020-06-30 10:41:35	43	43
25	UMUM	DIRI SENDIRI	RJ-200600008	\N	\N	0	2020-06-30	2	286	\N	\N	22	2020-06-30 10:57:50	2020-06-30 11:00:57	43	43
26	UMUM	DIRI SENDIRI	RJ-200700001	\N	\N	0	2020-07-01	2	265	\N	\N	23	2020-07-01 07:23:17	2020-07-01 07:23:53	43	43
29	UMUM	DIRI SENDIRI	RJ-200700004	\N	\N	0	2020-07-01	2	240	\N	\N	24	2020-07-01 09:36:29	2020-07-01 09:38:06	43	43
28	UMUM	DIRI SENDIRI	RJ-200700003	\N	\N	0	2020-07-01	2	290	\N	\N	25	2020-07-01 09:34:12	2020-07-01 09:38:10	43	43
27	UMUM	DIRI SENDIRI	RJ-200700002	\N	\N	0	2020-07-01	2	288	\N	\N	26	2020-07-01 09:33:17	2020-07-01 09:38:13	43	43
\.


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_user (id, role_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, slug, description, level, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, name, content, created_at, updated_at) FROM stdin;
2	medical_record_roles	[{"name":"Anamnesa","child":[{"name":"anamnesa","label":"Anamnesa"},{"name":"anamnesa_obgyn","label":"Anamnesa(Obgyn)"}]},{"name":"Pemeriksaan fisik","child":[{"name":"umum","label":"Umum"},{"name":"children","label":"Anak"},{"name":"surgical","label":"Bedah"},{"name":"kepala","label":"Kepala & leher"},{"name":"breast","label":"Breast(Payudata)"},{"name":"rectum","label":"Rectum & anal canal"}]},{"name":"Medical Checkup","child":[{"name":"medical_checkup","label":"Medical Checkup"}]},{"name":"Terapi","child":[{"name":"tindakan","label":"Tindakan"},{"name":"diagnostik","label":"Diagnostik"},{"name":"obat","label":"Obat"}]},{"name":"BHP, Sewa ruang, & Alkes","child":[{"name":"bhp","label":"BHP"},{"name":"sewa_alkes","label":"Sewa alkes"},{"name":"sewa_ruangan","label":"Sewa ruangan"}]},{"name":"Permintaan","child":[{"name":"fnab","label":"FNAB"},{"name":"histopatologi","label":"Histopatologi"},{"name":"papsmear","label":"Papsmear"},{"name":"sitologi","label":"Sitologi"}]},{"name":"Radiologi","child":[{"name":"radiologi","label":"Radiologi"}]},{"name":"Laboratorium","child":[{"name":"laboratorium","label":"Laboratorium"}]},{"name":"Patologi & anatomi","child":[{"name":"patologi","label":"Patologi & anatomi"}]},{"name":"Jadwal kontrol","child":[{"name":"jadwal_kontrol","label":"Jadwal kontrol"}]},{"name":"Resume medis","child":[{"name":"resume_medis","label":"Resume medis"}]},{"name":"Riwayat Assesment","child":[{"name":"assesment","label":"Riwayat Assesment"}]}]	\N	\N
3	finance	{"asuransi_rate_percentage":"10"}	\N	2020-01-09 06:07:48
1	company	{"name":"Medicelle","address":"Jalan Raya Gubeng no. 11","phone_number":"+62 31 3000 8008","fax":"+62 31 3000 9009","logo":"20191225012458DwHUs.png","city":"Surabaya","email":"info@medicelle.co.id","website":"http:\\/\\/medicelle.co.id","whatsapp_number":"+62 895 2614 0900","logo2":"20200315090953zsaUu.png"}	2019-12-23 09:15:13	2020-03-15 09:09:53
9	laboratory	{"grid_amount":4}	\N	2020-07-01 09:24:05
\.


--
-- Data for Name: side_effect_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.side_effect_details (id, side_effect_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: side_effects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.side_effects (id, name, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: specializations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specializations (id, code, name, is_active, created_at, updated_at, doctor_roles, nurse_roles, grup_nota_roles) FROM stdin;
3	FARK	Kemoterapi	1	2019-11-19 17:49:17	2019-12-31 07:00:02	{"umum":1,"kepala":1,"breast":1,"rectum":1,"diagnostik":1,"anamnesa":1,"anamnesa_obgyn":1}	[]	[]
1	FAR	Farmasi	1	2019-11-19 17:48:13	2020-01-04 13:07:37	{"anamnesa":0,"anamnesa_obgyn":0,"umum":0,"kepala":0,"breast":0,"rectum":0,"diagnostik":0,"obat":1,"tindakan":0,"sewa_alkes":1,"sewa_ruangan":0,"bhp":1,"jadwal_kontrol":1,"medical_checkup":1}	{"anamnesa":1,"anamnesa_obgyn":1,"umum":1}	[]
2	RAD1	Radiologi	1	2019-11-19 17:48:38	2020-01-10 04:05:54	{"radiologi":1,"radiologi_editable":1}	[]	[]
15	LB	Laboratorium	1	2020-03-08 03:38:40	2020-03-08 03:38:40	{"anamnesa":1,"anamnesa_editable":1,"anamnesa_obgyn":1,"anamnesa_obgyn_editable":1,"umum":1,"umum_editable":1,"children":1,"children_editable":1,"surgical":1,"surgical_editable":1,"kepala":1,"kepala_editable":1,"breast":1,"breast_editable":1,"rectum":1,"rectum_editable":1,"medical_checkup":1,"medical_checkup_editable":1,"tindakan":1,"tindakan_editable":1,"diagnostik":1,"diagnostik_editable":1,"obat":1,"obat_editable":1,"bhp":1,"bhp_editable":1,"sewa_alkes":1,"sewa_alkes_editable":1,"sewa_ruangan":1,"sewa_ruangan_editable":1,"fnab":1,"fnab_editable":1,"histopatologi":1,"histopatologi_editable":1,"papsmear":1,"papsmear_editable":1,"sitologi":1,"sitologi_editable":1,"radiologi":1,"radiologi_editable":1,"laboratorium":1,"laboratorium_editable":1,"patologi":1,"patologi_editable":1,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"resume_medis":1,"resume_medis_editable":1,"assesment":1,"assesment_editable":1}	[]	[0,null,"LABORATORIUM"]
16	PER	Perawat Poli	1	2020-06-30 08:28:27	2020-06-30 08:41:06	[]	{"anamnesa_editable":1,"anamnesa_obgyn_editable":1,"umum_editable":0,"bhp_editable":1,"sewa_alkes_editable":1,"sewa_ruangan_editable":1,"jadwal_kontrol_editable":1,"resume_medis_editable":1,"assesment_editable":1,"children_editable":0}	[]
11	OBG	Obgyn	1	2020-01-09 04:49:02	2020-07-01 02:49:49	{"anamnesa":0,"anamnesa_editable":0,"anamnesa_obgyn":1,"anamnesa_obgyn_editable":1,"umum":1,"umum_editable":1,"kepala":0,"kepala_editable":0,"breast":0,"breast_editable":0,"rectum":0,"rectum_editable":0,"medical_checkup":0,"medical_checkup_editable":0,"tindakan":1,"tindakan_editable":1,"diagnostik":1,"diagnostik_editable":1,"obat":1,"obat_editable":1,"bhp":1,"bhp_editable":1,"sewa_alkes":0,"sewa_alkes_editable":0,"sewa_ruangan":0,"sewa_ruangan_editable":0,"radiologi":0,"radiologi_editable":0,"laboratorium":0,"laboratorium_editable":0,"patologi":0,"patologi_editable":0,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"resume_medis":1,"resume_medis_editable":1,"fnab_editable":1,"histopatologi_editable":1,"papsmear_editable":1,"sitologi_editable":1,"sitologi":1,"papsmear":1,"histopatologi":1,"fnab":1,"assesment":1}	[]	[]
12	ANA	Anak	1	2020-01-09 06:45:47	2020-07-01 02:37:47	{"anamnesa":0,"anamnesa_editable":1,"anamnesa_obgyn":0,"anamnesa_obgyn_editable":0,"umum":0,"umum_editable":1,"kepala":0,"kepala_editable":0,"breast":0,"breast_editable":0,"rectum":0,"rectum_editable":0,"medical_checkup":0,"medical_checkup_editable":0,"tindakan":0,"tindakan_editable":1,"diagnostik":0,"diagnostik_editable":1,"obat":0,"obat_editable":1,"bhp":0,"bhp_editable":1,"sewa_alkes":1,"sewa_alkes_editable":0,"sewa_ruangan":1,"sewa_ruangan_editable":0,"radiologi":1,"radiologi_editable":0,"laboratorium":1,"laboratorium_editable":0,"patologi":0,"patologi_editable":0,"jadwal_kontrol":0,"jadwal_kontrol_editable":1,"resume_medis":0,"resume_medis_editable":1,"children":0,"children_editable":1,"assesment":1,"assesment_editable":0}	[]	[]
13	PEN	Penyakit Dalam	1	2020-01-10 03:30:45	2020-07-01 02:58:37	{"anamnesa":1,"anamnesa_editable":1,"anamnesa_obgyn":0,"anamnesa_obgyn_editable":0,"umum":1,"umum_editable":1,"kepala":0,"kepala_editable":0,"breast":0,"breast_editable":0,"rectum":0,"rectum_editable":0,"medical_checkup":0,"medical_checkup_editable":0,"tindakan":1,"tindakan_editable":1,"diagnostik":1,"diagnostik_editable":1,"obat":1,"obat_editable":1,"bhp":1,"bhp_editable":1,"sewa_alkes":0,"sewa_alkes_editable":0,"sewa_ruangan":0,"sewa_ruangan_editable":0,"radiologi":0,"radiologi_editable":0,"laboratorium":0,"laboratorium_editable":0,"patologi":0,"patologi_editable":0,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"resume_medis":1,"resume_medis_editable":1,"fnab":1,"fnab_editable":1,"histopatologi_editable":1,"histopatologi":1,"sitologi":1,"sitologi_editable":1,"assesment":1}	[]	[]
4	UM	Umum	1	2019-12-31 07:06:05	2020-07-01 03:03:55	{"anamnesa":1,"umum":1,"kepala":0,"anamnesa_editable":1,"anamnesa_obgyn":1,"anamnesa_obgyn_editable":0,"umum_editable":1,"kepala_editable":0,"breast":0,"breast_editable":0,"rectum":0,"rectum_editable":0,"medical_checkup":1,"medical_checkup_editable":1,"tindakan":1,"tindakan_editable":1,"diagnostik":1,"diagnostik_editable":1,"obat":1,"obat_editable":1,"bhp":1,"bhp_editable":1,"sewa_alkes":0,"sewa_alkes_editable":0,"sewa_ruangan":0,"sewa_ruangan_editable":0,"radiologi":0,"radiologi_editable":0,"laboratorium":0,"laboratorium_editable":0,"patologi":0,"patologi_editable":0,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"resume_medis":1,"resume_medis_editable":1,"children_editable":1,"children":1,"assesment":1}	{"anamnesa_obgyn":1,"umum":1,"kepala":0,"breast":0,"anamnesa":1,"anamnesa_editable":0,"anamnesa_obgyn_editable":0,"children":1,"medical_checkup":1,"bhp":1,"bhp_editable":1,"sewa_alkes_editable":1,"sewa_alkes":1,"sewa_ruangan":1,"sewa_ruangan_editable":1,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"assesment":1,"assesment_editable":1}	[]
5	BD	Bedah	1	2020-01-08 18:02:19	2020-07-01 02:48:23	{"umum":1,"anamnesa":1,"anamnesa_editable":1,"anamnesa_obgyn":0,"anamnesa_obgyn_editable":0,"umum_editable":1,"kepala":1,"kepala_editable":1,"breast":1,"breast_editable":1,"rectum":1,"rectum_editable":1,"medical_checkup":0,"medical_checkup_editable":0,"tindakan":1,"tindakan_editable":1,"diagnostik":1,"diagnostik_editable":1,"obat":1,"obat_editable":1,"bhp":1,"bhp_editable":1,"sewa_alkes":0,"sewa_alkes_editable":0,"sewa_ruangan":0,"sewa_ruangan_editable":0,"radiologi":0,"radiologi_editable":0,"laboratorium":0,"laboratorium_editable":0,"patologi":0,"patologi_editable":0,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"resume_medis":1,"resume_medis_editable":1,"surgical":1,"surgical_editable":1,"fnab":1,"fnab_editable":1,"histopatologi":1,"histopatologi_editable":1,"sitologi":1,"sitologi_editable":1,"assesment":1,"assesment_editable":0}	{"anamnesa":1,"anamnesa_editable":1,"anamnesa_obgyn":0,"anamnesa_obgyn_editable":0,"umum":1,"umum_editable":0,"children":0,"children_editable":0,"surgical":1,"surgical_editable":0,"kepala":1,"kepala_editable":0,"breast":1,"breast_editable":0,"rectum":1,"rectum_editable":0,"medical_checkup":0,"medical_checkup_editable":0,"tindakan":1,"tindakan_editable":0,"diagnostik":1,"diagnostik_editable":0,"obat":1,"obat_editable":0,"bhp":1,"bhp_editable":1,"sewa_alkes":1,"sewa_alkes_editable":1,"sewa_ruangan":1,"sewa_ruangan_editable":1,"fnab":1,"fnab_editable":0,"histopatologi":1,"histopatologi_editable":0,"papsmear":0,"papsmear_editable":0,"sitologi":1,"sitologi_editable":0,"radiologi":0,"radiologi_editable":0,"laboratorium":0,"laboratorium_editable":0,"patologi":1,"patologi_editable":1,"jadwal_kontrol":1,"jadwal_kontrol_editable":1,"resume_medis":1,"resume_medis_editable":1,"assesment":1,"assesment_editable":1}	[]
\.


--
-- Data for Name: stock_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_transactions (id, created_at, updated_at, date, stock_id, item_id, supplier_id, expired_date, lokasi_id, receipt_detail_id, in_qty, out_qty, amount, description, is_adjustment) FROM stdin;
3	2020-03-15 09:16:54	2020-03-15 09:16:54	2020-03-15	3	9	263	2020-03-25	49	\N	4	0	4	Penerimaan Barang	0
4	2020-03-15 09:17:18	2020-03-15 09:17:18	2020-03-15	4	9	263	2020-11-25	49	\N	2	0	2	Penerimaan Barang	0
5	2020-03-15 09:50:04	2020-03-15 09:50:04	2020-03-15	5	9	\N	2020-04-15	49	\N	76	0	76	Stok opname	0
6	2020-07-01 08:23:30	2020-07-01 08:23:30	2020-07-01	3	9	\N	2020-03-25	49	\N	0	0	4	Penggunaan Resep Obat	0
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (id, item_id, lokasi_id, expired_date, qty, created_at, updated_at) FROM stdin;
4	9	49	2020-11-25	2	2020-03-15 09:17:18	2020-03-15 09:17:18
5	9	49	2020-04-15	76	2020-03-15 09:50:04	2020-03-15 09:50:04
3	9	49	2020-03-25	4	2020-03-15 09:16:54	2020-07-01 08:23:30
\.


--
-- Data for Name: treatment_group_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_group_details (id, treatment_group_id, item_id, qty, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: treatment_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_groups (id, item_id, percentage, grup_nota_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, oauth_provider, oauth_provider_id, name, email, password, avatar, email_verified, email_verification_code, remember_token, created_at, updated_at, username, group_user_id, code, fullname, is_admin, is_active, contact_id) FROM stdin;
43	\N	\N	Administrator	admin@gmail.com	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	\N	0	\N	\N	\N	\N	admin	\N	AD0001	Administrator	1	1	\N
64	\N	\N	dr. Lia Amalia	dr._lia_amalia@email.com	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	\N	0	\N	\N	2020-01-08 07:58:10	2020-01-09 04:51:28	drlia	\N	D-0004	dr. Lia Amalia	0	1	64
66	\N	\N	dr. Een Hendarsih, Sp.PD-KHOM	dr._een_hendarsih,_sp.pd-khom@email.com	$2y$10$4L67/qdMqEwJjg2ad97DJ.ZobpTluMLj0vVx.sXKj.pOXoYuJlD86	\N	0	\N	\N	2020-01-08 07:59:48	2020-01-09 04:51:56	dreen	\N	D-0006	dr. Een Hendarsih, Sp.PD-KHOM	0	1	66
60	\N	\N	Amira Cholid Bawazeer	amira@gmail.com	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	20200108070859rqe4L.png	0	\N	\N	2020-01-08 07:08:59	2020-01-08 07:08:59	amira	59	MG001	Amira Cholid Bawazeer	0	1	\N
70	\N	\N	dr. Joni	dr._joni@email.com	$2y$10$J2LfK2uHFEFshCjRNNzIfuuSWGzAAvO4C5wBNqGBgvEEKLAYpsUX.	\N	0	\N	\N	2020-02-18 12:26:43	2020-02-18 12:26:43	dr._joni	\N	D-0009	dr. Joni	0	1	260
71	\N	\N	dr. Andi	dr._andi@email.com	$2y$10$lpkDEEr8lveKtuvFJYBeqOaNkaMkMpV1iQLCTX2MwL1/OPXMe4bYG	\N	0	\N	\N	2020-03-08 03:39:23	2020-03-08 03:39:23	dr._andi	\N	D-0010	dr. Andi	0	1	261
72	\N	\N	Amira	acbawazeer@gmail.com	$2y$10$PPTpBTvPLw2ot1e2Q116TemxWLh1v7epbJgOYfiHRqRjvE2ATnrMK		0	\N	\N	2020-06-12 03:42:15	2020-06-12 03:42:15	AmiraD	59	001	Amira Cholid Bawazeer	0	1	\N
76	\N	\N	Sismey	sismey@email.com	$2y$10$3ybzXdOqVTaRvIEtJndjiOhxnYeurtp/hfSz1RSeIjrw645z4Jx4a	\N	0	\N	\N	2020-06-26 08:08:04	2020-06-26 08:08:04	sismey	67	Rad126062020	Sismey	0	1	274
78	\N	\N	yaniar	yaniar@email.com	$2y$10$rmM2FVhdFLtJMDdfiD/Fe.oV7dw4PEau8CXCqLTsZca.2Sre28VyS	\N	0	\N	\N	2020-06-26 08:10:20	2020-06-26 08:10:20	yaniar	22	kas126062020	yaniar	0	1	278
79	\N	\N	maya	maya@email.com	$2y$10$H0yKE7G.R7ftA1QY1cKzDOdG.fiFpoFGAzQY2PPoGOdiMmgwSicJi	\N	0	\N	\N	2020-06-26 08:11:33	2020-06-26 08:11:33	maya	74	far26062020	maya	0	1	280
80	\N	\N	aan	aanppni@gmail.com	$2y$10$ZBwUgE/Ye96i5AWORvh/0OMigr84udT2NzRWMjy6TGR5I3.iei6Bi	20200629102041ov3Y8.png	0	\N	\N	2020-06-29 10:20:41	2020-06-30 08:44:47	aan	75	per26062020	febriyanti	0	1	\N
77	\N	\N	fuadah	fuadah@email.com	$2y$10$LEu0vBezCcy2yYFEx.ol8etKrs9gfeXzoV5vX//RnJSPXbajD0oDm	\N	0	\N	\N	2020-06-26 08:09:33	2020-06-29 02:42:11	fuadah	76	Lab126062020	Fuadah	0	1	276
73	\N	\N	Noviana	farmasi@medicelle.co.i	$2y$10$MvAnWvzgaqx7RR3aAFTRqed.mu1TlKHON/O5wMMH29NRswUhk1xqq		0	\N	\N	2020-06-24 09:03:16	2020-06-29 10:17:44	farmasi	74	24092020	Noviana	0	1	\N
75	\N	\N	radiologi	radiologi@medicelle.co.id	$2y$10$gmWGK0jsn4W83fFeLzBOc.1l.eJF4ZlnC5iyC.OA/ww2wthgCXLCm	20200624101551GNshk.png	0	\N	\N	2020-06-24 10:15:51	2020-06-29 10:17:57	radiologi	67	26062020	radiologi	0	0	\N
81	\N	\N	dr Hartatiek Nila SpOG	dr_hartatiek_nila_spog@email.com	$2y$10$XCZEbFF1aqRMk75d9Ni4IO5jBNQ.Vq6PC23IeFoR4SKOU4at0BHJ6	\N	0	\N	\N	2020-06-30 06:38:48	2020-07-01 08:52:35	dr_hartatiek_nila_spog	\N	D-0011	dr Hartatiek Nila SpOG	0	0	285
67	\N	\N	dr Santi Septika, Sp.Rad	dr.alvitatriwulaningsarisp.rad@email.com	$2y$10$4XkImiD1h8aa6DFa9PeoY.d/deXWoM22t9uC8OL8ZFO7IpLFi312a	\N	0	\N	\N	2020-01-08 08:01:17	2020-06-30 06:35:54	dralvita	\N	D-0007	dr. Alvita Triwulaning Sari, Sp.Rad	0	1	67
74	\N	\N	kasir	kasir@medicelle.co.id	$2y$10$St3XA5PJLCS0CpLvIHpJo.gQR8/Rq6U5DzMopv0c3wLkALfDg0Yea	20200624092252mCzZP.png	0	\N	\N	2020-06-24 09:22:52	2020-07-01 08:55:50	kasir	22	25062020	kasir	0	0	\N
68	\N	\N	dr. Septria Elritarini SpA	dr._septria_elritarini@email.com	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	\N	0	\N	\N	2020-01-09 06:47:11	2020-06-30 08:23:46	drseptria	68	D-0008	dr. Septria Elritarini	0	1	249
61	\N	\N	dr. Sahar Bawazeer, Sp.B	stratafabianisa@gmail.com	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	20200108070859rqe4L.png	0	\N	\N	2020-01-08 07:55:55	2020-07-01 09:13:43	drsahar	68	D-0001	dr. Sahar Bawazeer, Sp.B	0	1	61
62	\N	\N	dr. Merlyna Savitri, Sp.PD	marketing@medicelle.co.id	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	\N	0	\N	\N	2020-01-08 07:57:16	2020-07-01 09:17:17	drmerlyna	68	D-0002	dr. Merlyna Savitri, Sp.PD	0	1	62
63	\N	\N	dr. Puspita Dyah Ardyani Isnanto Putri	hrdmedika@medicelle.co.id	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	20200701091850XJha7.png	0	\N	\N	2020-01-08 07:57:43	2020-07-01 09:18:50	drpuspita	68	D-0003	dr. Puspita Dyah Ardyani Isnanto Putri	0	1	63
65	\N	\N	dr. Niken Wening Suryanti, SpOG	info@medicelle.co.id	$2y$10$Jl7E/NqNtQiIwnCxLzRjye1PMfsbMwH6zQXDDQQ.yb7pT7NvTtj.W	\N	0	\N	\N	2020-01-08 07:58:46	2020-07-01 09:21:43	drniken	68	D-0005	dr. Niken Wening Suryanti, SpOG	0	1	65
\.


--
-- Data for Name: villages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villages (id, name, district_id, created_at, updated_at) FROM stdin;
1	Karangrejo	1	2019-11-25 23:42:04	2019-11-25 23:42:04
2	Kedanyang	3	2019-11-26 00:38:45	2019-11-26 00:38:45
3	Bohar	4	2019-11-26 23:22:35	2019-11-26 23:22:35
4	Bohar	5	2019-11-26 23:22:35	2019-11-26 23:22:35
5	Bulakbanteng	9	2019-11-28 23:11:28	2019-11-28 23:11:28
6	Driyorejo makmur	10	2019-12-01 02:14:58	2019-12-01 02:14:58
7	Inam	11	2019-12-02 03:51:08	2019-12-02 03:51:08
8	Kalirungkut	12	2020-01-08 02:08:38	2020-01-08 02:08:38
9	Jepara	13	2020-01-08 02:13:41	2020-01-08 02:13:41
10	Bubutan	13	2020-01-08 02:16:03	2020-01-08 02:16:03
\.


--
-- Name: adjustment_stock_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adjustment_stock_details_id_seq', 1, true);


--
-- Name: adjustment_stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adjustment_stocks_id_seq', 1, true);


--
-- Name: assesment_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assesment_details_id_seq', 166, true);


--
-- Name: assesments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assesments_id_seq', 26, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 514, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 291, true);


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_id_seq', 2, true);


--
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.districts_id_seq', 13, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: formula_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_details_id_seq', 1, true);


--
-- Name: formulas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formulas_id_seq', 1, true);


--
-- Name: invoice_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_details_id_seq', 121, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 33, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 36, true);


--
-- Name: laboratory_treatments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laboratory_treatments_id_seq', 5, true);


--
-- Name: laboratory_type_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laboratory_type_details_id_seq', 16, true);


--
-- Name: laboratory_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laboratory_types_id_seq', 2, true);


--
-- Name: letters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.letters_id_seq', 11, true);


--
-- Name: medical_record_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medical_record_details_id_seq', 89, true);


--
-- Name: medical_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medical_records_id_seq', 26, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 370, true);


--
-- Name: movement_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movement_details_id_seq', 1, false);


--
-- Name: movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movements_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 70, true);


--
-- Name: periodical_stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.periodical_stocks_id_seq', 6, true);


--
-- Name: permission_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_role_id_seq', 1, false);


--
-- Name: permission_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_user_id_seq', 1, false);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 78, true);


--
-- Name: pieces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pieces_id_seq', 11, true);


--
-- Name: pivot_medical_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pivot_medical_records_id_seq', 85, true);


--
-- Name: polyclinics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polyclinics_id_seq', 9, true);


--
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prices_id_seq', 18, true);


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);


--
-- Name: purchase_order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_order_details_id_seq', 2, true);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 2, true);


--
-- Name: purchase_request_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_request_details_id_seq', 3, true);


--
-- Name: purchase_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_requests_id_seq', 2, true);


--
-- Name: radiology_type_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.radiology_type_details_id_seq', 1, false);


--
-- Name: radiology_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.radiology_types_id_seq', 1, true);


--
-- Name: receipt_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_details_id_seq', 2, true);


--
-- Name: receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipts_id_seq', 8, true);


--
-- Name: registration_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registration_details_id_seq', 29, true);


--
-- Name: registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registrations_id_seq', 29, true);


--
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_user_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 9, true);


--
-- Name: side_effect_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.side_effect_details_id_seq', 1, false);


--
-- Name: side_effects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.side_effects_id_seq', 1, false);


--
-- Name: specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specializations_id_seq', 16, true);


--
-- Name: stock_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_transactions_id_seq', 6, true);


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_id_seq', 5, true);


--
-- Name: treatment_group_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treatment_group_details_id_seq', 1, false);


--
-- Name: treatment_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treatment_groups_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 81, true);


--
-- Name: villages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villages_id_seq', 10, true);


--
-- Name: adjustment_stock_details adjustment_stock_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stock_details
    ADD CONSTRAINT adjustment_stock_details_pkey PRIMARY KEY (id);


--
-- Name: adjustment_stocks adjustment_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stocks
    ADD CONSTRAINT adjustment_stocks_pkey PRIMARY KEY (id);


--
-- Name: assesment_details assesment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesment_details
    ADD CONSTRAINT assesment_details_pkey PRIMARY KEY (id);


--
-- Name: assesments assesments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesments
    ADD CONSTRAINT assesments_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_code_unique UNIQUE (code);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: formula_details formula_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details
    ADD CONSTRAINT formula_details_pkey PRIMARY KEY (id);


--
-- Name: formulas formulas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formulas
    ADD CONSTRAINT formulas_pkey PRIMARY KEY (id);


--
-- Name: invoice_details invoice_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_details
    ADD CONSTRAINT invoice_details_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: laboratory_treatments laboratory_treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_treatments
    ADD CONSTRAINT laboratory_treatments_pkey PRIMARY KEY (id);


--
-- Name: laboratory_type_details laboratory_type_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_type_details
    ADD CONSTRAINT laboratory_type_details_pkey PRIMARY KEY (id);


--
-- Name: laboratory_types laboratory_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_types
    ADD CONSTRAINT laboratory_types_pkey PRIMARY KEY (id);


--
-- Name: letters letters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT letters_pkey PRIMARY KEY (id);


--
-- Name: medical_record_details medical_record_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_record_details
    ADD CONSTRAINT medical_record_details_pkey PRIMARY KEY (id);


--
-- Name: medical_records medical_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: movement_details movement_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_pkey PRIMARY KEY (id);


--
-- Name: movements movements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT movements_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: periodical_stocks periodical_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodical_stocks
    ADD CONSTRAINT periodical_stocks_pkey PRIMARY KEY (id);


--
-- Name: permission_role permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (id);


--
-- Name: permission_user permission_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_slug_unique UNIQUE (slug);


--
-- Name: pieces pieces_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pieces
    ADD CONSTRAINT pieces_name_unique UNIQUE (name);


--
-- Name: pieces pieces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pieces
    ADD CONSTRAINT pieces_pkey PRIMARY KEY (id);


--
-- Name: pivot_medical_records pivot_medical_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pivot_medical_records
    ADD CONSTRAINT pivot_medical_records_pkey PRIMARY KEY (id);


--
-- Name: polyclinics polyclinics_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polyclinics
    ADD CONSTRAINT polyclinics_code_unique UNIQUE (code);


--
-- Name: polyclinics polyclinics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polyclinics
    ADD CONSTRAINT polyclinics_pkey PRIMARY KEY (id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_details purchase_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_code_unique UNIQUE (code);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: purchase_request_details purchase_request_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_request_details
    ADD CONSTRAINT purchase_request_details_pkey PRIMARY KEY (id);


--
-- Name: purchase_requests purchase_requests_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_requests
    ADD CONSTRAINT purchase_requests_code_unique UNIQUE (code);


--
-- Name: purchase_requests purchase_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_requests
    ADD CONSTRAINT purchase_requests_pkey PRIMARY KEY (id);


--
-- Name: radiology_type_details radiology_type_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radiology_type_details
    ADD CONSTRAINT radiology_type_details_pkey PRIMARY KEY (id);


--
-- Name: radiology_types radiology_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radiology_types
    ADD CONSTRAINT radiology_types_pkey PRIMARY KEY (id);


--
-- Name: receipt_details receipt_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_details
    ADD CONSTRAINT receipt_details_pkey PRIMARY KEY (id);


--
-- Name: receipts receipts_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_code_unique UNIQUE (code);


--
-- Name: receipts receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: registration_details registration_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_details
    ADD CONSTRAINT registration_details_pkey PRIMARY KEY (id);


--
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles roles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_slug_unique UNIQUE (slug);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: side_effect_details side_effect_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.side_effect_details
    ADD CONSTRAINT side_effect_details_pkey PRIMARY KEY (id);


--
-- Name: side_effects side_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.side_effects
    ADD CONSTRAINT side_effects_pkey PRIMARY KEY (id);


--
-- Name: specializations specializations_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_code_unique UNIQUE (code);


--
-- Name: specializations specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


--
-- Name: stock_transactions stock_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT stock_transactions_pkey PRIMARY KEY (id);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: treatment_group_details treatment_group_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_group_details
    ADD CONSTRAINT treatment_group_details_pkey PRIMARY KEY (id);


--
-- Name: treatment_groups treatment_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_groups
    ADD CONSTRAINT treatment_groups_pkey PRIMARY KEY (id);


--
-- Name: users users_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_code_unique UNIQUE (code);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: villages villages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villages
    ADD CONSTRAINT villages_pkey PRIMARY KEY (id);


--
-- Name: adjustment_stock_details_adjustment_stock_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_adjustment_stock_id_index ON public.adjustment_stock_details USING btree (adjustment_stock_id);


--
-- Name: adjustment_stock_details_expired_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_expired_date_index ON public.adjustment_stock_details USING btree (expired_date);


--
-- Name: adjustment_stock_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_item_id_index ON public.adjustment_stock_details USING btree (item_id);


--
-- Name: adjustment_stock_details_lokasi_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_lokasi_id_index ON public.adjustment_stock_details USING btree (lokasi_id);


--
-- Name: adjustment_stock_details_previous_expired_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_previous_expired_date_index ON public.adjustment_stock_details USING btree (previous_expired_date);


--
-- Name: adjustment_stock_details_previous_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_previous_qty_index ON public.adjustment_stock_details USING btree (previous_qty);


--
-- Name: adjustment_stock_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_qty_index ON public.adjustment_stock_details USING btree (qty);


--
-- Name: adjustment_stock_details_stock_awal_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_stock_awal_id_index ON public.adjustment_stock_details USING btree (stock_awal_id);


--
-- Name: adjustment_stock_details_stock_transaction_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stock_details_stock_transaction_id_index ON public.adjustment_stock_details USING btree (stock_transaction_id);


--
-- Name: adjustment_stocks_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stocks_created_by_index ON public.adjustment_stocks USING btree (created_by);


--
-- Name: adjustment_stocks_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX adjustment_stocks_date_index ON public.adjustment_stocks USING btree (date);


--
-- Name: assesment_details_assesment_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_assesment_id_index ON public.assesment_details USING btree (assesment_id);


--
-- Name: assesment_details_cure_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_cure_index ON public.assesment_details USING btree (cure);


--
-- Name: assesment_details_disease_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_disease_id_index ON public.assesment_details USING btree (disease_id);


--
-- Name: assesment_details_emergence_time_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_emergence_time_index ON public.assesment_details USING btree (emergence_time);


--
-- Name: assesment_details_imunisasi_month_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_imunisasi_month_age_index ON public.assesment_details USING btree (imunisasi_month_age);


--
-- Name: assesment_details_imunisasi_year_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_imunisasi_year_age_index ON public.assesment_details USING btree (imunisasi_year_age);


--
-- Name: assesment_details_is_allergy_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_allergy_history_index ON public.assesment_details USING btree (is_allergy_history);


--
-- Name: assesment_details_is_disease_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_disease_history_index ON public.assesment_details USING btree (is_disease_history);


--
-- Name: assesment_details_is_family_disease_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_family_disease_history_index ON public.assesment_details USING btree (is_family_disease_history);


--
-- Name: assesment_details_is_imunisasi_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_imunisasi_history_index ON public.assesment_details USING btree (is_imunisasi_history);


--
-- Name: assesment_details_is_imunisasi_month_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_imunisasi_month_age_index ON public.assesment_details USING btree (is_imunisasi_month_age);


--
-- Name: assesment_details_is_kid_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_kid_history_index ON public.assesment_details USING btree (is_kid_history);


--
-- Name: assesment_details_is_other_imunisasi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_other_imunisasi_index ON public.assesment_details USING btree (is_other_imunisasi);


--
-- Name: assesment_details_is_pain_cure_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_pain_cure_history_index ON public.assesment_details USING btree (is_pain_cure_history);


--
-- Name: assesment_details_is_pain_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_pain_history_index ON public.assesment_details USING btree (is_pain_history);


--
-- Name: assesment_details_is_pregnant_week_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_pregnant_week_age_index ON public.assesment_details USING btree (is_pregnant_week_age);


--
-- Name: assesment_details_is_unknown_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_is_unknown_index ON public.assesment_details USING btree (is_unknown);


--
-- Name: assesment_details_kid_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_kid_order_index ON public.assesment_details USING btree (kid_order);


--
-- Name: assesment_details_last_checkup_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_last_checkup_date_index ON public.assesment_details USING btree (last_checkup_date);


--
-- Name: assesment_details_long_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_long_index ON public.assesment_details USING btree (long);


--
-- Name: assesment_details_pain_duration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_pain_duration_index ON public.assesment_details USING btree (pain_duration);


--
-- Name: assesment_details_pain_location_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_pain_location_index ON public.assesment_details USING btree (pain_location);


--
-- Name: assesment_details_pain_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_pain_type_index ON public.assesment_details USING btree (pain_type);


--
-- Name: assesment_details_partus_year_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_partus_year_index ON public.assesment_details USING btree (partus_year);


--
-- Name: assesment_details_pregnant_month_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_pregnant_month_age_index ON public.assesment_details USING btree (pregnant_month_age);


--
-- Name: assesment_details_pregnant_week_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_pregnant_week_age_index ON public.assesment_details USING btree (pregnant_week_age);


--
-- Name: assesment_details_side_effect_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_side_effect_index ON public.assesment_details USING btree (side_effect);


--
-- Name: assesment_details_weight_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesment_details_weight_index ON public.assesment_details USING btree (weight);


--
-- Name: assesments_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesments_date_index ON public.assesments USING btree (date);


--
-- Name: assesments_gigi_tumbuh_pertama_long_weight_blood_pressure_pulse; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesments_gigi_tumbuh_pertama_long_weight_blood_pressure_pulse ON public.assesments USING btree (gigi_tumbuh_pertama, long, weight, blood_pressure, pulse, temperature, breath_frequency, prebirth_weight, postbirth_weight, birth_long, birth_weight, head_size, arm_size, berguling_usia, duduk_usia, merangkak_usia, berdiri_usia, berjalan_usia, bicara_usia);


--
-- Name: assesments_main_complaint_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesments_main_complaint_index ON public.assesments USING btree (main_complaint);


--
-- Name: assesments_step_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assesments_step_index ON public.assesments USING btree (step);


--
-- Name: cities_province_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cities_province_id_index ON public.cities USING btree (province_id);


--
-- Name: contacts_account_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_account_id_index ON public.contacts USING btree (account_id);


--
-- Name: contacts_address_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_address_index ON public.contacts USING btree (address);


--
-- Name: contacts_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_age_index ON public.contacts USING btree (age);


--
-- Name: contacts_agency_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_agency_type_index ON public.contacts USING btree (agency_type);


--
-- Name: contacts_assesment_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_assesment_id_index ON public.contacts USING btree (assesment_id);


--
-- Name: contacts_birth_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_birth_date_index ON public.contacts USING btree (birth_date);


--
-- Name: contacts_blood_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_blood_type_index ON public.contacts USING btree (blood_type);


--
-- Name: contacts_city_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_city_id_index ON public.contacts USING btree (city_id);


--
-- Name: contacts_civil_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_civil_code_index ON public.contacts USING btree (civil_code);


--
-- Name: contacts_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_code_index ON public.contacts USING btree (code);


--
-- Name: contacts_contact_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_id_index ON public.contacts USING btree (contact_id);


--
-- Name: contacts_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_created_by_index ON public.contacts USING btree (created_by);


--
-- Name: contacts_district_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_district_id_index ON public.contacts USING btree (district_id);


--
-- Name: contacts_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_email_index ON public.contacts USING btree (email);


--
-- Name: contacts_family_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_family_id_index ON public.contacts USING btree (family_id);


--
-- Name: contacts_fax_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_fax_index ON public.contacts USING btree (fax);


--
-- Name: contacts_gender_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_gender_index ON public.contacts USING btree (gender);


--
-- Name: contacts_group_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_group_user_id_index ON public.contacts USING btree (group_user_id);


--
-- Name: contacts_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_active_index ON public.contacts USING btree (is_active);


--
-- Name: contacts_is_agency_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_agency_index ON public.contacts USING btree (is_agency);


--
-- Name: contacts_is_contact_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_contact_index ON public.contacts USING btree (is_contact);


--
-- Name: contacts_is_doctor_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_doctor_index ON public.contacts USING btree (is_doctor);


--
-- Name: contacts_is_employee_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_employee_index ON public.contacts USING btree (is_employee);


--
-- Name: contacts_is_family_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_family_index ON public.contacts USING btree (is_family);


--
-- Name: contacts_is_nurse_helper_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_nurse_helper_index ON public.contacts USING btree (is_nurse_helper);


--
-- Name: contacts_is_nurse_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_nurse_index ON public.contacts USING btree (is_nurse);


--
-- Name: contacts_is_patient_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_patient_index ON public.contacts USING btree (is_patient);


--
-- Name: contacts_is_supplier_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_is_supplier_index ON public.contacts USING btree (is_supplier);


--
-- Name: contacts_job_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_job_index ON public.contacts USING btree (job);


--
-- Name: contacts_marriage_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_marriage_status_index ON public.contacts USING btree (marriage_status);


--
-- Name: contacts_medical_record_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_medical_record_id_index ON public.contacts USING btree (medical_record_id);


--
-- Name: contacts_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_name_index ON public.contacts USING btree (name);


--
-- Name: contacts_patient_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_patient_type_index ON public.contacts USING btree (patient_type);


--
-- Name: contacts_phone_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_phone_index ON public.contacts USING btree (phone);


--
-- Name: contacts_pin_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_pin_index ON public.contacts USING btree (pin);


--
-- Name: contacts_polyclinic_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_polyclinic_id_index ON public.contacts USING btree (polyclinic_id);


--
-- Name: contacts_postal_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_postal_code_index ON public.contacts USING btree (postal_code);


--
-- Name: contacts_province_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_province_id_index ON public.contacts USING btree (province_id);


--
-- Name: contacts_registration_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_registration_id_index ON public.contacts USING btree (registration_id);


--
-- Name: contacts_religion_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_religion_index ON public.contacts USING btree (religion);


--
-- Name: contacts_specialization_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_specialization_id_index ON public.contacts USING btree (specialization_id);


--
-- Name: contacts_start_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_start_date_index ON public.contacts USING btree (start_date);


--
-- Name: contacts_supplier_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_supplier_id_index ON public.contacts USING btree (supplier_id);


--
-- Name: contacts_updated_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_updated_by_index ON public.contacts USING btree (updated_by);


--
-- Name: contacts_village_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_village_id_index ON public.contacts USING btree (village_id);


--
-- Name: discounts_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX discounts_created_by_index ON public.discounts USING btree (created_by);


--
-- Name: discounts_date_start_date_end_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX discounts_date_start_date_end_index ON public.discounts USING btree (date_start, date_end);


--
-- Name: discounts_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX discounts_is_active_index ON public.discounts USING btree (is_active);


--
-- Name: discounts_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX discounts_name_index ON public.discounts USING btree (name);


--
-- Name: discounts_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX discounts_type_index ON public.discounts USING btree (type);


--
-- Name: districts_city_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX districts_city_id_index ON public.districts USING btree (city_id);


--
-- Name: districts_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX districts_name_index ON public.districts USING btree (name);


--
-- Name: formula_details_formula_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formula_details_formula_id_index ON public.formula_details USING btree (formula_id);


--
-- Name: formula_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formula_details_item_id_index ON public.formula_details USING btree (item_id);


--
-- Name: formula_details_lokasi_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formula_details_lokasi_id_index ON public.formula_details USING btree (lokasi_id);


--
-- Name: formula_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formula_details_qty_index ON public.formula_details USING btree (qty);


--
-- Name: formula_details_stock_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formula_details_stock_id_index ON public.formula_details USING btree (stock_id);


--
-- Name: formula_details_stock_transaction_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formula_details_stock_transaction_id_index ON public.formula_details USING btree (stock_transaction_id);


--
-- Name: formulas_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formulas_date_index ON public.formulas USING btree (date);


--
-- Name: formulas_invoice_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formulas_invoice_id_index ON public.formulas USING btree (invoice_id);


--
-- Name: formulas_is_approve_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formulas_is_approve_index ON public.formulas USING btree (is_approve);


--
-- Name: formulas_medical_record_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formulas_medical_record_id_index ON public.formulas USING btree (medical_record_id);


--
-- Name: formulas_registration_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formulas_registration_detail_id_index ON public.formulas USING btree (registration_detail_id);


--
-- Name: formulas_updated_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX formulas_updated_by_index ON public.formulas USING btree (updated_by);


--
-- Name: insurance_owner_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX insurance_owner_name ON public.registrations USING btree (insurance_code);


--
-- Name: invoice_details_credit_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_credit_index ON public.invoice_details USING btree (credit);


--
-- Name: invoice_details_debet_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_debet_index ON public.invoice_details USING btree (debet);


--
-- Name: invoice_details_disc_percent_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_disc_percent_index ON public.invoice_details USING btree (disc_percent);


--
-- Name: invoice_details_grandtotal_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_grandtotal_index ON public.invoice_details USING btree (grandtotal);


--
-- Name: invoice_details_invoice_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_invoice_detail_id_index ON public.invoice_details USING btree (invoice_detail_id);


--
-- Name: invoice_details_invoice_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_invoice_id_index ON public.invoice_details USING btree (invoice_id);


--
-- Name: invoice_details_is_asuransi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_asuransi_index ON public.invoice_details USING btree (is_asuransi);


--
-- Name: invoice_details_is_discount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_discount_index ON public.invoice_details USING btree (is_discount);


--
-- Name: invoice_details_is_discount_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_discount_total_index ON public.invoice_details USING btree (is_discount_total);


--
-- Name: invoice_details_is_item_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_item_index ON public.invoice_details USING btree (is_item);


--
-- Name: invoice_details_is_profit_sharing_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_profit_sharing_index ON public.invoice_details USING btree (is_profit_sharing);


--
-- Name: invoice_details_is_promo_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_promo_index ON public.invoice_details USING btree (is_promo);


--
-- Name: invoice_details_is_reduksi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_is_reduksi_index ON public.invoice_details USING btree (is_reduksi);


--
-- Name: invoice_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_item_id_index ON public.invoice_details USING btree (item_id);


--
-- Name: invoice_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_qty_index ON public.invoice_details USING btree (qty);


--
-- Name: invoice_details_reduksi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_reduksi_index ON public.invoice_details USING btree (reduksi);


--
-- Name: invoice_details_total_credit_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_total_credit_index ON public.invoice_details USING btree (total_credit);


--
-- Name: invoice_details_total_debet_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoice_details_total_debet_index ON public.invoice_details USING btree (total_debet);


--
-- Name: invoices_asuransi_percentage_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_asuransi_percentage_index ON public.invoices USING btree (asuransi_percentage);


--
-- Name: invoices_asuransi_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_asuransi_value_index ON public.invoices USING btree (asuransi_value);


--
-- Name: invoices_balance_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_balance_index ON public.invoices USING btree (balance);


--
-- Name: invoices_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_code_index ON public.invoices USING btree (code);


--
-- Name: invoices_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_created_by_index ON public.invoices USING btree (created_by);


--
-- Name: invoices_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_date_index ON public.invoices USING btree (date);


--
-- Name: invoices_discount_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_discount_id_index ON public.invoices USING btree (discount_id);


--
-- Name: invoices_discount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_discount_index ON public.invoices USING btree (discount);


--
-- Name: invoices_gross_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_gross_index ON public.invoices USING btree (gross);


--
-- Name: invoices_invoice_amandemen_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_invoice_amandemen_id_index ON public.invoices USING btree (invoice_amandemen_id);


--
-- Name: invoices_is_nota_pemeriksaan_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_is_nota_pemeriksaan_index ON public.invoices USING btree (is_nota_pemeriksaan);


--
-- Name: invoices_is_nota_pengobatan_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_is_nota_pengobatan_index ON public.invoices USING btree (is_nota_pengobatan);


--
-- Name: invoices_is_nota_rawat_jalan_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_is_nota_rawat_jalan_index ON public.invoices USING btree (is_nota_rawat_jalan);


--
-- Name: invoices_netto_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_netto_index ON public.invoices USING btree (netto);


--
-- Name: invoices_paid_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_paid_at_index ON public.invoices USING btree (paid_at);


--
-- Name: invoices_paid_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_paid_by_index ON public.invoices USING btree (paid_by);


--
-- Name: invoices_paid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_paid_index ON public.invoices USING btree (paid);


--
-- Name: invoices_payment_type_payment_method_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_payment_type_payment_method_index ON public.invoices USING btree (payment_type, payment_method);


--
-- Name: invoices_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_qty_index ON public.invoices USING btree (qty);


--
-- Name: invoices_reduksi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_reduksi_index ON public.invoices USING btree (reduksi);


--
-- Name: invoices_registration_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_registration_id_index ON public.invoices USING btree (registration_id);


--
-- Name: invoices_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invoices_status_index ON public.invoices USING btree (status);


--
-- Name: is_group_nota; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX is_group_nota ON public.permissions USING btree (is_permission);


--
-- Name: items_category_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_category_id_index ON public.items USING btree (category_id);


--
-- Name: items_classification_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_classification_id_index ON public.items USING btree (classification_id);


--
-- Name: items_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_code_index ON public.items USING btree (code);


--
-- Name: items_current_stock_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_current_stock_index ON public.items USING btree (current_stock);


--
-- Name: items_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_description_index ON public.items USING btree (description);


--
-- Name: items_generic_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_generic_id_index ON public.items USING btree (generic_id);


--
-- Name: items_has_stock_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_has_stock_index ON public.items USING btree (has_stock);


--
-- Name: items_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_active_index ON public.items USING btree (is_active);


--
-- Name: items_is_alkes_disposible_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_alkes_disposible_index ON public.items USING btree (is_alkes_disposible);


--
-- Name: items_is_alkes_non_disposible_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_alkes_non_disposible_index ON public.items USING btree (is_alkes_non_disposible);


--
-- Name: items_is_bhp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_bhp_index ON public.items USING btree (is_bhp);


--
-- Name: items_is_classification_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_classification_index ON public.items USING btree (is_classification);


--
-- Name: items_is_cure_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_cure_index ON public.items USING btree (is_cure);


--
-- Name: items_is_generic_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_generic_index ON public.items USING btree (is_generic);


--
-- Name: items_is_inventaris_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_inventaris_index ON public.items USING btree (is_inventaris);


--
-- Name: items_is_laboratory_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_laboratory_index ON public.items USING btree (is_laboratory);


--
-- Name: items_is_medical_item_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_medical_item_index ON public.items USING btree (is_medical_item);


--
-- Name: items_is_non_cure_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_non_cure_index ON public.items USING btree (is_non_cure);


--
-- Name: items_is_pharmacy_is_category_is_disease_is_administration_is_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_pharmacy_is_category_is_disease_is_administration_is_i ON public.items USING btree (is_pharmacy, is_category, is_disease, is_administration, is_inspection, is_standard, is_radiology, is_anatomy, is_packet, is_pharmacy);


--
-- Name: items_is_subclassification_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_subclassification_index ON public.items USING btree (is_subclassification);


--
-- Name: items_is_treatment_group_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_treatment_group_index ON public.items USING btree (is_treatment_group);


--
-- Name: items_is_umum_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_is_umum_index ON public.items USING btree (is_umum);


--
-- Name: items_minimal_stock_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_minimal_stock_index ON public.items USING btree (minimal_stock);


--
-- Name: items_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_name_index ON public.items USING btree (name);


--
-- Name: items_piece_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_piece_id_index ON public.items USING btree (piece_id);


--
-- Name: items_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_price_index ON public.items USING btree (price);


--
-- Name: items_purchase_piece_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_purchase_piece_id_index ON public.items USING btree (purchase_piece_id);


--
-- Name: items_purchase_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_purchase_price_index ON public.items USING btree (purchase_price);


--
-- Name: items_ratio_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_ratio_index ON public.items USING btree (ratio);


--
-- Name: items_subclassification_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_subclassification_id_index ON public.items USING btree (subclassification_id);


--
-- Name: items_supplier_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX items_supplier_price_index ON public.items USING btree (supplier_price);


--
-- Name: laboratory_treatments_laboratory_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX laboratory_treatments_laboratory_type_id_index ON public.laboratory_treatments USING btree (laboratory_type_id);


--
-- Name: laboratory_treatments_price_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX laboratory_treatments_price_id_index ON public.laboratory_treatments USING btree (price_id);


--
-- Name: laboratory_type_details_laboratory_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX laboratory_type_details_laboratory_type_id_index ON public.laboratory_type_details USING btree (laboratory_type_id);


--
-- Name: laboratory_types_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX laboratory_types_is_active_index ON public.laboratory_types USING btree (is_active);


--
-- Name: laboratory_types_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX laboratory_types_name_index ON public.laboratory_types USING btree (name);


--
-- Name: letters_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_code_index ON public.letters USING btree (code);


--
-- Name: letters_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_created_by_index ON public.letters USING btree (created_by);


--
-- Name: letters_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_date_index ON public.letters USING btree (date);


--
-- Name: letters_doctor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_doctor_id_index ON public.letters USING btree (doctor_id);


--
-- Name: letters_end_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_end_date_index ON public.letters USING btree (end_date);


--
-- Name: letters_is_cuti_hamil_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_cuti_hamil_index ON public.letters USING btree (is_cuti_hamil);


--
-- Name: letters_is_keterangan_dokter_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_keterangan_dokter_index ON public.letters USING btree (is_keterangan_dokter);


--
-- Name: letters_is_keterangan_sehat_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_keterangan_sehat_index ON public.letters USING btree (is_keterangan_sehat);


--
-- Name: letters_is_layak_terbang_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_layak_terbang_index ON public.letters USING btree (is_layak_terbang);


--
-- Name: letters_is_pengantar_mrs_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_pengantar_mrs_index ON public.letters USING btree (is_pengantar_mrs);


--
-- Name: letters_is_persetujuan_tindakan_medis_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_persetujuan_tindakan_medis_index ON public.letters USING btree (is_persetujuan_tindakan_medis);


--
-- Name: letters_is_rujukan_pasien_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_is_rujukan_pasien_index ON public.letters USING btree (is_rujukan_pasien);


--
-- Name: letters_medical_record_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_medical_record_id_index ON public.letters USING btree (medical_record_id);


--
-- Name: letters_option_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_option_index ON public.letters USING btree (option);


--
-- Name: letters_review_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_review_date_index ON public.letters USING btree (review_date);


--
-- Name: letters_start_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_start_date_index ON public.letters USING btree (start_date);


--
-- Name: letters_updated_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX letters_updated_by_index ON public.letters USING btree (updated_by);


--
-- Name: medical_record_details_cure_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_cure_index ON public.medical_record_details USING btree (cure);


--
-- Name: medical_record_details_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_date_index ON public.medical_record_details USING btree (date);


--
-- Name: medical_record_details_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_description_index ON public.medical_record_details USING btree (description);


--
-- Name: medical_record_details_disease_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_disease_id_index ON public.medical_record_details USING btree (disease_id);


--
-- Name: medical_record_details_disease_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_disease_name_index ON public.medical_record_details USING btree (disease_name);


--
-- Name: medical_record_details_duration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_duration_index ON public.medical_record_details USING btree (duration);


--
-- Name: medical_record_details_emergence_time_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_emergence_time_index ON public.medical_record_details USING btree (emergence_time);


--
-- Name: medical_record_details_is_allergy_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_allergy_history_index ON public.medical_record_details USING btree (is_allergy_history);


--
-- Name: medical_record_details_is_bhp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_bhp_index ON public.medical_record_details USING btree (is_bhp);


--
-- Name: medical_record_details_is_diagnose_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_diagnose_history_index ON public.medical_record_details USING btree (is_diagnose_history);


--
-- Name: medical_record_details_is_diagnostic_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_diagnostic_index ON public.medical_record_details USING btree (is_diagnostic);


--
-- Name: medical_record_details_is_disease_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_disease_history_index ON public.medical_record_details USING btree (is_disease_history);


--
-- Name: medical_record_details_is_drug_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_drug_index ON public.medical_record_details USING btree (is_drug);


--
-- Name: medical_record_details_is_family_disease_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_family_disease_history_index ON public.medical_record_details USING btree (is_family_disease_history);


--
-- Name: medical_record_details_is_ginekologi_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_ginekologi_history_index ON public.medical_record_details USING btree (is_ginekologi_history);


--
-- Name: medical_record_details_is_imunisasi_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_imunisasi_history_index ON public.medical_record_details USING btree (is_imunisasi_history);


--
-- Name: medical_record_details_is_imunisasi_month_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_imunisasi_month_age_index ON public.medical_record_details USING btree (is_imunisasi_month_age);


--
-- Name: medical_record_details_is_kb_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_kb_history_index ON public.medical_record_details USING btree (is_kb_history);


--
-- Name: medical_record_details_is_kid_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_kid_history_index ON public.medical_record_details USING btree (is_kid_history);


--
-- Name: medical_record_details_is_komplikasi_kb_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_komplikasi_kb_history_index ON public.medical_record_details USING btree (is_komplikasi_kb_history);


--
-- Name: medical_record_details_is_obgyn_disease_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_obgyn_disease_history_index ON public.medical_record_details USING btree (is_obgyn_disease_history);


--
-- Name: medical_record_details_is_obgyn_family_disease_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_obgyn_family_disease_history_index ON public.medical_record_details USING btree (is_obgyn_family_disease_history);


--
-- Name: medical_record_details_is_other_ginekologi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_other_ginekologi_index ON public.medical_record_details USING btree (is_other_ginekologi);


--
-- Name: medical_record_details_is_other_imunisasi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_other_imunisasi_index ON public.medical_record_details USING btree (is_other_imunisasi);


--
-- Name: medical_record_details_is_other_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_other_index ON public.medical_record_details USING btree (is_other);


--
-- Name: medical_record_details_is_pain_cure_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_pain_cure_history_index ON public.medical_record_details USING btree (is_pain_cure_history);


--
-- Name: medical_record_details_is_pain_history_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_pain_history_index ON public.medical_record_details USING btree (is_pain_history);


--
-- Name: medical_record_details_is_pregnant_week_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_pregnant_week_age_index ON public.medical_record_details USING btree (is_pregnant_week_age);


--
-- Name: medical_record_details_is_radiology_is_laboratory_is_pathology_; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_radiology_is_laboratory_is_pathology_ ON public.medical_record_details USING btree (is_radiology, is_laboratory, is_pathology);


--
-- Name: medical_record_details_is_sewa_alkes_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_sewa_alkes_index ON public.medical_record_details USING btree (is_sewa_alkes);


--
-- Name: medical_record_details_is_sewa_ruangan_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_sewa_ruangan_index ON public.medical_record_details USING btree (is_sewa_ruangan);


--
-- Name: medical_record_details_is_treatment_group_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_treatment_group_index ON public.medical_record_details USING btree (is_treatment_group);


--
-- Name: medical_record_details_is_treatment_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_treatment_index ON public.medical_record_details USING btree (is_treatment);


--
-- Name: medical_record_details_is_unknown_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_is_unknown_index ON public.medical_record_details USING btree (is_unknown);


--
-- Name: medical_record_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_item_id_index ON public.medical_record_details USING btree (item_id);


--
-- Name: medical_record_details_kid_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_kid_order_index ON public.medical_record_details USING btree (kid_order);


--
-- Name: medical_record_details_last_checkup_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_last_checkup_date_index ON public.medical_record_details USING btree (last_checkup_date);


--
-- Name: medical_record_details_lokasi_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_lokasi_id_index ON public.medical_record_details USING btree (lokasi_id);


--
-- Name: medical_record_details_long_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_long_index ON public.medical_record_details USING btree (long);


--
-- Name: medical_record_details_medical_record_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_medical_record_id_index ON public.medical_record_details USING btree (medical_record_id);


--
-- Name: medical_record_details_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_name_index ON public.medical_record_details USING btree (name);


--
-- Name: medical_record_details_pain_duration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_pain_duration_index ON public.medical_record_details USING btree (pain_duration);


--
-- Name: medical_record_details_pain_location_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_pain_location_index ON public.medical_record_details USING btree (pain_location);


--
-- Name: medical_record_details_pain_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_pain_type_index ON public.medical_record_details USING btree (pain_type);


--
-- Name: medical_record_details_partus_year_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_partus_year_index ON public.medical_record_details USING btree (partus_year);


--
-- Name: medical_record_details_pregnant_month_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_pregnant_month_age_index ON public.medical_record_details USING btree (pregnant_month_age);


--
-- Name: medical_record_details_pregnant_week_age_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_pregnant_week_age_index ON public.medical_record_details USING btree (pregnant_week_age);


--
-- Name: medical_record_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_qty_index ON public.medical_record_details USING btree (qty);


--
-- Name: medical_record_details_reduksi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_reduksi_index ON public.medical_record_details USING btree (reduksi);


--
-- Name: medical_record_details_result_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_result_date_index ON public.medical_record_details USING btree (result_date);


--
-- Name: medical_record_details_side_effect_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_side_effect_index ON public.medical_record_details USING btree (side_effect);


--
-- Name: medical_record_details_signa1_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_signa1_index ON public.medical_record_details USING btree (signa1);


--
-- Name: medical_record_details_signa2_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_signa2_index ON public.medical_record_details USING btree (signa2);


--
-- Name: medical_record_details_stock_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_stock_id_index ON public.medical_record_details USING btree (stock_id);


--
-- Name: medical_record_details_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_type_index ON public.medical_record_details USING btree (type);


--
-- Name: medical_record_details_weight_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_record_details_weight_index ON public.medical_record_details USING btree (weight);


--
-- Name: medical_records_breast_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_breast_description_index ON public.medical_records USING btree (breast_description);


--
-- Name: medical_records_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_code_index ON public.medical_records USING btree (code);


--
-- Name: medical_records_current_disease_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_current_disease_index ON public.medical_records USING btree (current_disease);


--
-- Name: medical_records_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_date_index ON public.medical_records USING btree (date);


--
-- Name: medical_records_ekg_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_ekg_index ON public.medical_records USING btree (ekg);


--
-- Name: medical_records_gigi_tumbuh_pertama_long_weight_blood_pressure_; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_gigi_tumbuh_pertama_long_weight_blood_pressure_ ON public.medical_records USING btree (gigi_tumbuh_pertama, long, weight, blood_pressure, pulse, temperature, breath_frequency, prebirth_weight, postbirth_weight, birth_long, birth_weight, head_size, arm_size, berguling_usia, duduk_usia, merangkak_usia, berdiri_usia, berjalan_usia, bicara_usia);


--
-- Name: medical_records_head_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_head_description_index ON public.medical_records USING btree (head_description);


--
-- Name: medical_records_obgyn_current_disease_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_obgyn_current_disease_index ON public.medical_records USING btree (obgyn_current_disease);


--
-- Name: medical_records_obgyn_main_complaint_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_obgyn_main_complaint_index ON public.medical_records USING btree (obgyn_main_complaint);


--
-- Name: medical_records_obgyn_operasi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_obgyn_operasi_index ON public.medical_records USING btree (obgyn_operasi);


--
-- Name: medical_records_operasi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_operasi_index ON public.medical_records USING btree (operasi);


--
-- Name: medical_records_patient_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_patient_type_index ON public.medical_records USING btree (patient_type);


--
-- Name: medical_records_physique_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_physique_index ON public.medical_records USING btree (physique);


--
-- Name: medical_records_psiko_sosial_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_psiko_sosial_index ON public.medical_records USING btree (psiko_sosial);


--
-- Name: medical_records_rectum_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_rectum_description_index ON public.medical_records USING btree (rectum_description);


--
-- Name: medical_records_refer_doctor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_refer_doctor_id_index ON public.medical_records USING btree (refer_doctor_id);


--
-- Name: medical_records_registration_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_registration_detail_id_index ON public.medical_records USING btree (registration_detail_id);


--
-- Name: medical_records_registration_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_registration_id_index ON public.medical_records USING btree (registration_id);


--
-- Name: medical_records_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_status_index ON public.medical_records USING btree (status);


--
-- Name: medical_records_step_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_step_index ON public.medical_records USING btree (step);


--
-- Name: medical_records_usg_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medical_records_usg_index ON public.medical_records USING btree (usg);


--
-- Name: movement_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_item_id_index ON public.movement_details USING btree (item_id);


--
-- Name: movement_details_lokasi_akhir_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_lokasi_akhir_id_index ON public.movement_details USING btree (lokasi_akhir_id);


--
-- Name: movement_details_lokasi_awal_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_lokasi_awal_id_index ON public.movement_details USING btree (lokasi_awal_id);


--
-- Name: movement_details_movement_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_movement_id_index ON public.movement_details USING btree (movement_id);


--
-- Name: movement_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_qty_index ON public.movement_details USING btree (qty);


--
-- Name: movement_details_stock_awal_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_stock_awal_id_index ON public.movement_details USING btree (stock_awal_id);


--
-- Name: movement_details_stock_transaction_destination_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_stock_transaction_destination_id_index ON public.movement_details USING btree (stock_transaction_destination_id);


--
-- Name: movement_details_stock_transaction_source_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movement_details_stock_transaction_source_id_index ON public.movement_details USING btree (stock_transaction_source_id);


--
-- Name: movements_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movements_created_by_index ON public.movements USING btree (created_by);


--
-- Name: movements_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX movements_date_index ON public.movements USING btree (date);


--
-- Name: notifications_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_description_index ON public.notifications USING btree (description);


--
-- Name: notifications_is_read_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_is_read_index ON public.notifications USING btree (is_read);


--
-- Name: notifications_param_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_param_index ON public.notifications USING btree (param);


--
-- Name: notifications_route_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_route_index ON public.notifications USING btree (route);


--
-- Name: notifications_stock_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_stock_id_index ON public.notifications USING btree (stock_id);


--
-- Name: notifications_title_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_title_index ON public.notifications USING btree (title);


--
-- Name: notifications_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_user_id_index ON public.notifications USING btree (user_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: password_resets_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_token_index ON public.password_resets USING btree (token);


--
-- Name: periodical_stocks_expired_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_expired_date_index ON public.periodical_stocks USING btree (expired_date);


--
-- Name: periodical_stocks_gross_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_gross_index ON public.periodical_stocks USING btree (gross);


--
-- Name: periodical_stocks_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_item_id_index ON public.periodical_stocks USING btree (item_id);


--
-- Name: periodical_stocks_lokasi_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_lokasi_id_index ON public.periodical_stocks USING btree (lokasi_id);


--
-- Name: periodical_stocks_month_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_month_index ON public.periodical_stocks USING btree (month);


--
-- Name: periodical_stocks_netto_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_netto_index ON public.periodical_stocks USING btree (netto);


--
-- Name: periodical_stocks_stock_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_stock_id_index ON public.periodical_stocks USING btree (stock_id);


--
-- Name: periodical_stocks_year_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX periodical_stocks_year_index ON public.periodical_stocks USING btree (year);


--
-- Name: permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_permission_id_index ON public.permission_role USING btree (permission_id);


--
-- Name: permission_role_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_role_id_index ON public.permission_role USING btree (role_id);


--
-- Name: permission_user_permission_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_user_permission_id_index ON public.permission_user USING btree (permission_id);


--
-- Name: permission_user_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_user_user_id_index ON public.permission_user USING btree (user_id);


--
-- Name: permissions_is_lokasi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permissions_is_lokasi_index ON public.permissions USING btree (is_lokasi);


--
-- Name: permissions_is_signa_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permissions_is_signa_index ON public.permissions USING btree (is_signa);


--
-- Name: pieces_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pieces_is_active_index ON public.pieces USING btree (is_active);


--
-- Name: pivot_medical_records_is_chemoterapy_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_is_chemoterapy_index ON public.pivot_medical_records USING btree (is_chemoterapy);


--
-- Name: pivot_medical_records_is_laboratory_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_is_laboratory_index ON public.pivot_medical_records USING btree (is_laboratory);


--
-- Name: pivot_medical_records_is_laboratory_treatment_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_is_laboratory_treatment_index ON public.pivot_medical_records USING btree (is_laboratory_treatment);


--
-- Name: pivot_medical_records_is_radiology_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_is_radiology_index ON public.pivot_medical_records USING btree (is_radiology);


--
-- Name: pivot_medical_records_is_referenced_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_is_referenced_index ON public.pivot_medical_records USING btree (is_referenced);


--
-- Name: pivot_medical_records_is_ruang_tindakan_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_is_ruang_tindakan_index ON public.pivot_medical_records USING btree (is_ruang_tindakan);


--
-- Name: pivot_medical_records_medical_record_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_medical_record_detail_id_index ON public.pivot_medical_records USING btree (medical_record_detail_id);


--
-- Name: pivot_medical_records_medical_record_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_medical_record_id_index ON public.pivot_medical_records USING btree (medical_record_id);


--
-- Name: pivot_medical_records_parent_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_parent_id_index ON public.pivot_medical_records USING btree (parent_id);


--
-- Name: pivot_medical_records_registration_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pivot_medical_records_registration_detail_id_index ON public.pivot_medical_records USING btree (registration_detail_id);


--
-- Name: polyclinics_cost_center_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX polyclinics_cost_center_index ON public.polyclinics USING btree (cost_center);


--
-- Name: polyclinics_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX polyclinics_is_active_index ON public.polyclinics USING btree (is_active);


--
-- Name: polyclinics_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX polyclinics_name_index ON public.polyclinics USING btree (name);


--
-- Name: prices_custom_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_custom_price_index ON public.prices USING btree (custom_price);


--
-- Name: prices_destination_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_destination_index ON public.prices USING btree (destination);


--
-- Name: prices_is_chemoterapy_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_is_chemoterapy_index ON public.prices USING btree (is_chemoterapy);


--
-- Name: prices_is_diagnostic_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_is_diagnostic_index ON public.prices USING btree (is_diagnostic);


--
-- Name: prices_is_registration_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_is_registration_is_active_index ON public.prices USING btree (is_registration, is_active);


--
-- Name: prices_is_sewa_alkes_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_is_sewa_alkes_index ON public.prices USING btree (is_sewa_alkes);


--
-- Name: prices_is_sewa_ruangan_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_is_sewa_ruangan_index ON public.prices USING btree (is_sewa_ruangan);


--
-- Name: prices_is_treatment_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_is_treatment_index ON public.prices USING btree (is_treatment);


--
-- Name: prices_item_id_grup_nota_id_polyclinic_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_item_id_grup_nota_id_polyclinic_id_index ON public.prices USING btree (item_id, grup_nota_id, polyclinic_id);


--
-- Name: prices_laboratory_group_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_laboratory_group_index ON public.prices USING btree (laboratory_group);


--
-- Name: prices_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_qty_index ON public.prices USING btree (qty);


--
-- Name: prices_radiology_group_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prices_radiology_group_index ON public.prices USING btree (radiology_group);


--
-- Name: provinces_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX provinces_name_index ON public.provinces USING btree (name);


--
-- Name: purchase_order_details_discount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_discount_index ON public.purchase_order_details USING btree (discount);


--
-- Name: purchase_order_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_item_id_index ON public.purchase_order_details USING btree (item_id);


--
-- Name: purchase_order_details_leftover_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_leftover_qty_index ON public.purchase_order_details USING btree (leftover_qty);


--
-- Name: purchase_order_details_purchase_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_purchase_order_id_index ON public.purchase_order_details USING btree (purchase_order_id);


--
-- Name: purchase_order_details_purchase_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_purchase_price_index ON public.purchase_order_details USING btree (purchase_price);


--
-- Name: purchase_order_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_qty_index ON public.purchase_order_details USING btree (qty);


--
-- Name: purchase_order_details_received_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_order_details_received_qty_index ON public.purchase_order_details USING btree (received_qty);


--
-- Name: purchase_orders_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_created_by_index ON public.purchase_orders USING btree (created_by);


--
-- Name: purchase_orders_date_end_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_date_end_index ON public.purchase_orders USING btree (date_end);


--
-- Name: purchase_orders_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_date_index ON public.purchase_orders USING btree (date);


--
-- Name: purchase_orders_date_start_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_date_start_index ON public.purchase_orders USING btree (date_start);


--
-- Name: purchase_orders_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_description_index ON public.purchase_orders USING btree (description);


--
-- Name: purchase_orders_is_receipt_completed_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_is_receipt_completed_index ON public.purchase_orders USING btree (is_receipt_completed);


--
-- Name: purchase_orders_is_used_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_is_used_index ON public.purchase_orders USING btree (is_used);


--
-- Name: purchase_orders_purchase_request_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_purchase_request_id_index ON public.purchase_orders USING btree (purchase_request_id);


--
-- Name: purchase_orders_supplier_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_orders_supplier_id_index ON public.purchase_orders USING btree (supplier_id);


--
-- Name: purchase_request_details_discount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_request_details_discount_index ON public.purchase_request_details USING btree (discount);


--
-- Name: purchase_request_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_request_details_item_id_index ON public.purchase_request_details USING btree (item_id);


--
-- Name: purchase_request_details_purchase_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_request_details_purchase_price_index ON public.purchase_request_details USING btree (purchase_price);


--
-- Name: purchase_request_details_purchase_request_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_request_details_purchase_request_id_index ON public.purchase_request_details USING btree (purchase_request_id);


--
-- Name: purchase_request_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_request_details_qty_index ON public.purchase_request_details USING btree (qty);


--
-- Name: purchase_request_details_supplier_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_request_details_supplier_id_index ON public.purchase_request_details USING btree (supplier_id);


--
-- Name: purchase_requests_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_requests_created_by_index ON public.purchase_requests USING btree (created_by);


--
-- Name: purchase_requests_date_end_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_requests_date_end_index ON public.purchase_requests USING btree (date_end);


--
-- Name: purchase_requests_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_requests_date_index ON public.purchase_requests USING btree (date);


--
-- Name: purchase_requests_date_start_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_requests_date_start_index ON public.purchase_requests USING btree (date_start);


--
-- Name: purchase_requests_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_requests_description_index ON public.purchase_requests USING btree (description);


--
-- Name: purchase_requests_is_approve_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_requests_is_approve_index ON public.purchase_requests USING btree (is_approve);


--
-- Name: radiology_type_details_radiology_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radiology_type_details_radiology_type_id_index ON public.radiology_type_details USING btree (radiology_type_id);


--
-- Name: radiology_types_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radiology_types_is_active_index ON public.radiology_types USING btree (is_active);


--
-- Name: radiology_types_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX radiology_types_name_index ON public.radiology_types USING btree (name);


--
-- Name: receipt_details_discount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_discount_index ON public.receipt_details USING btree (discount);


--
-- Name: receipt_details_expired_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_expired_date_index ON public.receipt_details USING btree (expired_date);


--
-- Name: receipt_details_hna_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_hna_index ON public.receipt_details USING btree (hna);


--
-- Name: receipt_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_item_id_index ON public.receipt_details USING btree (item_id);


--
-- Name: receipt_details_purchase_order_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_purchase_order_detail_id_index ON public.receipt_details USING btree (purchase_order_detail_id);


--
-- Name: receipt_details_purchase_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_purchase_price_index ON public.receipt_details USING btree (purchase_price);


--
-- Name: receipt_details_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_qty_index ON public.receipt_details USING btree (qty);


--
-- Name: receipt_details_receipt_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_receipt_id_index ON public.receipt_details USING btree (receipt_id);


--
-- Name: receipt_details_stock_transaction_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_details_stock_transaction_id_index ON public.receipt_details USING btree (stock_transaction_id);


--
-- Name: receipts_created_by_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_created_by_index ON public.receipts USING btree (created_by);


--
-- Name: receipts_date_end_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_date_end_index ON public.receipts USING btree (date_end);


--
-- Name: receipts_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_date_index ON public.receipts USING btree (date);


--
-- Name: receipts_date_start_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_date_start_index ON public.receipts USING btree (date_start);


--
-- Name: receipts_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_description_index ON public.receipts USING btree (description);


--
-- Name: receipts_is_receipt_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_is_receipt_order_index ON public.receipts USING btree (is_receipt_order);


--
-- Name: receipts_purchase_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_purchase_order_id_index ON public.receipts USING btree (purchase_order_id);


--
-- Name: receipts_supplier_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipts_supplier_id_index ON public.receipts USING btree (supplier_id);


--
-- Name: registration_details_medical_record_refer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_details_medical_record_refer_id_index ON public.registration_details USING btree (medical_record_refer_id);


--
-- Name: registration_details_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_details_status_index ON public.registration_details USING btree (status);


--
-- Name: registrations_assesment_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_assesment_id_index ON public.registrations USING btree (assesment_id);


--
-- Name: registrations_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_code_index ON public.registrations USING btree (code);


--
-- Name: registrations_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_date_index ON public.registrations USING btree (date);


--
-- Name: registrations_family_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_family_type_index ON public.registrations USING btree (family_type);


--
-- Name: registrations_medical_record_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_medical_record_id_index ON public.registrations USING btree (medical_record_id);


--
-- Name: registrations_patient_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_patient_id_index ON public.registrations USING btree (patient_id);


--
-- Name: registrations_patient_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_patient_type_index ON public.registrations USING btree (patient_type);


--
-- Name: registrations_pic_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_pic_id_index ON public.registrations USING btree (pic_id);


--
-- Name: registrations_plafon_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_plafon_index ON public.registrations USING btree (plafon);


--
-- Name: registrations_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registrations_status_index ON public.registrations USING btree (status);


--
-- Name: role_user_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX role_user_role_id_index ON public.role_user USING btree (role_id);


--
-- Name: role_user_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX role_user_user_id_index ON public.role_user USING btree (user_id);


--
-- Name: settings_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_name_index ON public.settings USING btree (name);


--
-- Name: side_effect_details_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX side_effect_details_name_index ON public.side_effect_details USING btree (name);


--
-- Name: side_effect_details_side_effect_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX side_effect_details_side_effect_id_index ON public.side_effect_details USING btree (side_effect_id);


--
-- Name: side_effects_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX side_effects_is_active_index ON public.side_effects USING btree (is_active);


--
-- Name: side_effects_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX side_effects_name_index ON public.side_effects USING btree (name);


--
-- Name: specializations_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX specializations_name_index ON public.specializations USING btree (name);


--
-- Name: stock_transactions_amount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_amount_index ON public.stock_transactions USING btree (amount);


--
-- Name: stock_transactions_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_date_index ON public.stock_transactions USING btree (date);


--
-- Name: stock_transactions_description_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_description_index ON public.stock_transactions USING btree (description);


--
-- Name: stock_transactions_expired_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_expired_date_index ON public.stock_transactions USING btree (expired_date);


--
-- Name: stock_transactions_in_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_in_qty_index ON public.stock_transactions USING btree (in_qty);


--
-- Name: stock_transactions_is_adjustment_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_is_adjustment_index ON public.stock_transactions USING btree (is_adjustment);


--
-- Name: stock_transactions_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_item_id_index ON public.stock_transactions USING btree (item_id);


--
-- Name: stock_transactions_lokasi_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_lokasi_id_index ON public.stock_transactions USING btree (lokasi_id);


--
-- Name: stock_transactions_out_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_out_qty_index ON public.stock_transactions USING btree (out_qty);


--
-- Name: stock_transactions_receipt_detail_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_receipt_detail_id_index ON public.stock_transactions USING btree (receipt_detail_id);


--
-- Name: stock_transactions_stock_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_stock_id_index ON public.stock_transactions USING btree (stock_id);


--
-- Name: stock_transactions_supplier_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transactions_supplier_id_index ON public.stock_transactions USING btree (supplier_id);


--
-- Name: stocks_expired_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stocks_expired_date_index ON public.stocks USING btree (expired_date);


--
-- Name: stocks_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stocks_item_id_index ON public.stocks USING btree (item_id);


--
-- Name: stocks_lokasi_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stocks_lokasi_id_index ON public.stocks USING btree (lokasi_id);


--
-- Name: stocks_qty_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stocks_qty_index ON public.stocks USING btree (qty);


--
-- Name: treatment_group_details_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX treatment_group_details_item_id_index ON public.treatment_group_details USING btree (item_id);


--
-- Name: treatment_group_details_treatment_group_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX treatment_group_details_treatment_group_id_index ON public.treatment_group_details USING btree (treatment_group_id);


--
-- Name: treatment_groups_grup_nota_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX treatment_groups_grup_nota_id_index ON public.treatment_groups USING btree (grup_nota_id);


--
-- Name: treatment_groups_is_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX treatment_groups_is_active_index ON public.treatment_groups USING btree (is_active);


--
-- Name: treatment_groups_item_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX treatment_groups_item_id_index ON public.treatment_groups USING btree (item_id);


--
-- Name: type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX type ON public.cities USING btree (name);


--
-- Name: updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX updated_by ON public.medical_records USING btree (created_by);


--
-- Name: users_contact_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_contact_id_index ON public.users USING btree (contact_id);


--
-- Name: users_fullname_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_fullname_index ON public.users USING btree (fullname);


--
-- Name: villages_district_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX villages_district_id_index ON public.villages USING btree (district_id);


--
-- Name: villages_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX villages_name_index ON public.villages USING btree (name);


--
-- Name: adjustment_stock_details adjustment_stock_details_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stock_details
    ADD CONSTRAINT adjustment_stock_details_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: adjustment_stock_details adjustment_stock_details_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stock_details
    ADD CONSTRAINT adjustment_stock_details_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: adjustment_stock_details adjustment_stock_details_stock_awal_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stock_details
    ADD CONSTRAINT adjustment_stock_details_stock_awal_id_foreign FOREIGN KEY (stock_awal_id) REFERENCES public.stocks(id) ON DELETE RESTRICT;


--
-- Name: adjustment_stock_details adjustment_stock_details_stock_transaction_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stock_details
    ADD CONSTRAINT adjustment_stock_details_stock_transaction_id_foreign FOREIGN KEY (stock_transaction_id) REFERENCES public.stock_transactions(id) ON DELETE RESTRICT;


--
-- Name: adjustment_stocks adjustment_stocks_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjustment_stocks
    ADD CONSTRAINT adjustment_stocks_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: assesment_details assesment_details_assesment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesment_details
    ADD CONSTRAINT assesment_details_assesment_id_foreign FOREIGN KEY (assesment_id) REFERENCES public.assesments(id) ON DELETE CASCADE;


--
-- Name: assesment_details assesment_details_disease_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesment_details
    ADD CONSTRAINT assesment_details_disease_id_foreign FOREIGN KEY (disease_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: assesments assesments_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesments
    ADD CONSTRAINT assesments_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: assesments assesments_patient_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesments
    ADD CONSTRAINT assesments_patient_id_foreign FOREIGN KEY (patient_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: assesments assesments_registration_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesments
    ADD CONSTRAINT assesments_registration_id_foreign FOREIGN KEY (registration_id) REFERENCES public.registrations(id) ON DELETE CASCADE;


--
-- Name: assesments assesments_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assesments
    ADD CONSTRAINT assesments_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: cities cities_province_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_province_id_foreign FOREIGN KEY (province_id) REFERENCES public.provinces(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_assesment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_assesment_id_foreign FOREIGN KEY (assesment_id) REFERENCES public.assesments(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.cities(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_group_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_group_user_id_foreign FOREIGN KEY (group_user_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_medical_record_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_medical_record_id_foreign FOREIGN KEY (medical_record_id) REFERENCES public.medical_records(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_province_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_province_id_foreign FOREIGN KEY (province_id) REFERENCES public.provinces(id) ON DELETE RESTRICT;


--
-- Name: contacts contacts_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: discounts discounts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: formula_details formula_details_formula_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details
    ADD CONSTRAINT formula_details_formula_id_foreign FOREIGN KEY (formula_id) REFERENCES public.formulas(id) ON DELETE CASCADE;


--
-- Name: formula_details formula_details_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details
    ADD CONSTRAINT formula_details_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: formula_details formula_details_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details
    ADD CONSTRAINT formula_details_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: formula_details formula_details_stock_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details
    ADD CONSTRAINT formula_details_stock_id_foreign FOREIGN KEY (stock_id) REFERENCES public.stocks(id) ON DELETE RESTRICT;


--
-- Name: formula_details formula_details_stock_transaction_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_details
    ADD CONSTRAINT formula_details_stock_transaction_id_foreign FOREIGN KEY (stock_transaction_id) REFERENCES public.stock_transactions(id) ON DELETE RESTRICT;


--
-- Name: formulas formulas_invoice_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formulas
    ADD CONSTRAINT formulas_invoice_id_foreign FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE SET NULL;


--
-- Name: formulas formulas_medical_record_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formulas
    ADD CONSTRAINT formulas_medical_record_id_foreign FOREIGN KEY (medical_record_id) REFERENCES public.medical_records(id) ON DELETE RESTRICT;


--
-- Name: formulas formulas_registration_detail_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formulas
    ADD CONSTRAINT formulas_registration_detail_id_foreign FOREIGN KEY (registration_detail_id) REFERENCES public.registration_details(id) ON DELETE RESTRICT;


--
-- Name: formulas formulas_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formulas
    ADD CONSTRAINT formulas_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: invoices invoices_invoice_amandemen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_invoice_amandemen_id_foreign FOREIGN KEY (invoice_amandemen_id) REFERENCES public.invoices(id) ON DELETE SET NULL;


--
-- Name: invoices invoices_registration_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_registration_id_foreign FOREIGN KEY (registration_id) REFERENCES public.registrations(id) ON DELETE RESTRICT;


--
-- Name: items items_piece_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_piece_id_foreign FOREIGN KEY (piece_id) REFERENCES public.pieces(id) ON DELETE RESTRICT;


--
-- Name: laboratory_treatments laboratory_treatments_laboratory_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_treatments
    ADD CONSTRAINT laboratory_treatments_laboratory_type_id_foreign FOREIGN KEY (laboratory_type_id) REFERENCES public.laboratory_types(id) ON DELETE RESTRICT;


--
-- Name: laboratory_treatments laboratory_treatments_price_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_treatments
    ADD CONSTRAINT laboratory_treatments_price_id_foreign FOREIGN KEY (price_id) REFERENCES public.prices(id) ON DELETE CASCADE;


--
-- Name: letters letters_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT letters_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: letters letters_medical_record_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT letters_medical_record_id_foreign FOREIGN KEY (medical_record_id) REFERENCES public.medical_records(id) ON DELETE RESTRICT;


--
-- Name: letters letters_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letters
    ADD CONSTRAINT letters_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: medical_record_details medical_record_details_disease_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_record_details
    ADD CONSTRAINT medical_record_details_disease_id_foreign FOREIGN KEY (disease_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: medical_record_details medical_record_details_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_record_details
    ADD CONSTRAINT medical_record_details_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: medical_record_details medical_record_details_medical_record_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_record_details
    ADD CONSTRAINT medical_record_details_medical_record_id_foreign FOREIGN KEY (medical_record_id) REFERENCES public.medical_records(id) ON DELETE CASCADE;


--
-- Name: medical_record_details medical_record_details_stock_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_record_details
    ADD CONSTRAINT medical_record_details_stock_id_foreign FOREIGN KEY (stock_id) REFERENCES public.stocks(id) ON DELETE RESTRICT;


--
-- Name: medical_records medical_records_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: medical_records medical_records_patient_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_patient_id_foreign FOREIGN KEY (patient_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: medical_records medical_records_refer_doctor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_refer_doctor_id_foreign FOREIGN KEY (refer_doctor_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: medical_records medical_records_registration_detail_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_registration_detail_id_foreign FOREIGN KEY (registration_detail_id) REFERENCES public.registration_details(id) ON DELETE CASCADE;


--
-- Name: medical_records medical_records_registration_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_registration_id_foreign FOREIGN KEY (registration_id) REFERENCES public.registrations(id) ON DELETE CASCADE;


--
-- Name: medical_records medical_records_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_records
    ADD CONSTRAINT medical_records_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: movement_details movement_details_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: movement_details movement_details_lokasi_akhir_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_lokasi_akhir_id_foreign FOREIGN KEY (lokasi_akhir_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: movement_details movement_details_lokasi_awal_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_lokasi_awal_id_foreign FOREIGN KEY (lokasi_awal_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: movement_details movement_details_stock_awal_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_stock_awal_id_foreign FOREIGN KEY (stock_awal_id) REFERENCES public.stocks(id) ON DELETE RESTRICT;


--
-- Name: movement_details movement_details_stock_transaction_destination_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_stock_transaction_destination_id_foreign FOREIGN KEY (stock_transaction_destination_id) REFERENCES public.stock_transactions(id) ON DELETE RESTRICT;


--
-- Name: movement_details movement_details_stock_transaction_source_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement_details
    ADD CONSTRAINT movement_details_stock_transaction_source_id_foreign FOREIGN KEY (stock_transaction_source_id) REFERENCES public.stock_transactions(id) ON DELETE RESTRICT;


--
-- Name: movements movements_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movements
    ADD CONSTRAINT movements_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: periodical_stocks periodical_stocks_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodical_stocks
    ADD CONSTRAINT periodical_stocks_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: periodical_stocks periodical_stocks_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodical_stocks
    ADD CONSTRAINT periodical_stocks_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: periodical_stocks periodical_stocks_stock_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodical_stocks
    ADD CONSTRAINT periodical_stocks_stock_id_foreign FOREIGN KEY (stock_id) REFERENCES public.stocks(id) ON DELETE RESTRICT;


--
-- Name: permission_role permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: permission_role permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: permission_user permission_user_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: permission_user permission_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pivot_medical_records pivot_medical_records_medical_record_detail_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pivot_medical_records
    ADD CONSTRAINT pivot_medical_records_medical_record_detail_id_foreign FOREIGN KEY (medical_record_detail_id) REFERENCES public.medical_record_details(id) ON DELETE CASCADE;


--
-- Name: pivot_medical_records pivot_medical_records_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pivot_medical_records
    ADD CONSTRAINT pivot_medical_records_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.pivot_medical_records(id) ON DELETE RESTRICT;


--
-- Name: prices prices_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: prices prices_grup_nota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_grup_nota_id_foreign FOREIGN KEY (grup_nota_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: prices prices_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: prices prices_polyclinic_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_polyclinic_id_foreign FOREIGN KEY (polyclinic_id) REFERENCES public.polyclinics(id) ON DELETE RESTRICT;


--
-- Name: purchase_order_details purchase_order_details_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: purchase_order_details purchase_order_details_purchase_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_purchase_order_id_foreign FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(id) ON DELETE CASCADE;


--
-- Name: purchase_orders purchase_orders_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: purchase_orders purchase_orders_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: purchase_request_details purchase_request_details_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_request_details
    ADD CONSTRAINT purchase_request_details_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: purchase_request_details purchase_request_details_purchase_request_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_request_details
    ADD CONSTRAINT purchase_request_details_purchase_request_id_foreign FOREIGN KEY (purchase_request_id) REFERENCES public.purchase_requests(id) ON DELETE CASCADE;


--
-- Name: purchase_request_details purchase_request_details_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_request_details
    ADD CONSTRAINT purchase_request_details_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: purchase_requests purchase_requests_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_requests
    ADD CONSTRAINT purchase_requests_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: radiology_type_details radiology_type_details_radiology_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.radiology_type_details
    ADD CONSTRAINT radiology_type_details_radiology_type_id_foreign FOREIGN KEY (radiology_type_id) REFERENCES public.radiology_types(id) ON DELETE CASCADE;


--
-- Name: receipts receipts_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: receipts receipts_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: registration_details registration_details_doctor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_details
    ADD CONSTRAINT registration_details_doctor_id_foreign FOREIGN KEY (doctor_id) REFERENCES public.contacts(id) ON DELETE SET NULL;


--
-- Name: registration_details registration_details_medical_record_refer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_details
    ADD CONSTRAINT registration_details_medical_record_refer_id_foreign FOREIGN KEY (medical_record_refer_id) REFERENCES public.medical_records(id) ON DELETE RESTRICT;


--
-- Name: registration_details registration_details_registration_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_details
    ADD CONSTRAINT registration_details_registration_id_foreign FOREIGN KEY (registration_id) REFERENCES public.registrations(id) ON DELETE CASCADE;


--
-- Name: registrations registrations_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: registrations registrations_patient_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_patient_id_foreign FOREIGN KEY (patient_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: registrations registrations_pic_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_pic_id_foreign FOREIGN KEY (pic_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: registrations registrations_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: role_user role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_user role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: stock_transactions stock_transactions_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT stock_transactions_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: stock_transactions stock_transactions_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT stock_transactions_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: stock_transactions stock_transactions_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT stock_transactions_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: stocks stocks_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: stocks stocks_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: treatment_group_details treatment_group_details_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_group_details
    ADD CONSTRAINT treatment_group_details_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: treatment_group_details treatment_group_details_treatment_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_group_details
    ADD CONSTRAINT treatment_group_details_treatment_group_id_foreign FOREIGN KEY (treatment_group_id) REFERENCES public.treatment_groups(id) ON DELETE CASCADE;


--
-- Name: treatment_groups treatment_groups_grup_nota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_groups
    ADD CONSTRAINT treatment_groups_grup_nota_id_foreign FOREIGN KEY (grup_nota_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- Name: treatment_groups treatment_groups_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_groups
    ADD CONSTRAINT treatment_groups_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE RESTRICT;


--
-- Name: users users_contact_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_contact_id_foreign FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE RESTRICT;


--
-- Name: users users_group_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_group_user_id_foreign FOREIGN KEY (group_user_id) REFERENCES public.permissions(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

