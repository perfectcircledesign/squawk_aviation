--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: article_job_lookups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_job_lookups (
    id integer NOT NULL,
    job_id integer,
    airline_id integer,
    article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.article_job_lookups OWNER TO postgres;

--
-- Name: article_job_lookups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_job_lookups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_job_lookups_id_seq OWNER TO postgres;

--
-- Name: article_job_lookups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_job_lookups_id_seq OWNED BY public.article_job_lookups.id;


--
-- Name: aviation_certification_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aviation_certification_details (
    id integer NOT NULL,
    license_type character varying(255),
    license_number character varying(255),
    country_of_issue character varying(255),
    date_of_issue date,
    date_of_expiry date,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    license_authority character varying(255),
    mcc boolean DEFAULT false,
    dangerous_goods boolean DEFAULT false,
    crm boolean DEFAULT false,
    tcas_acas boolean DEFAULT false,
    lvo boolean DEFAULT false,
    rnav_gnss boolean DEFAULT false,
    rvsm boolean DEFAULT false,
    cfit_gpws boolean DEFAULT false,
    etops boolean DEFAULT false,
    file_id integer
);


ALTER TABLE public.aviation_certification_details OWNER TO postgres;

--
-- Name: aviation_certification_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aviation_certification_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aviation_certification_details_id_seq OWNER TO postgres;

--
-- Name: aviation_certification_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aviation_certification_details_id_seq OWNED BY public.aviation_certification_details.id;


--
-- Name: aviation_education_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aviation_education_details (
    id integer NOT NULL,
    program character varying(255),
    institution character varying(255),
    period character varying(255),
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    education_type character varying(255)
);


ALTER TABLE public.aviation_education_details OWNER TO postgres;

--
-- Name: aviation_education_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aviation_education_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aviation_education_details_id_seq OWNER TO postgres;

--
-- Name: aviation_education_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aviation_education_details_id_seq OWNED BY public.aviation_education_details.id;


--
-- Name: aviation_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aviation_records (
    id integer NOT NULL,
    employer character varying(255),
    aircraft character varying(255),
    start_date date,
    end_date date,
    ca character varying(255),
    fo character varying(255),
    total character varying(255),
    reason_for_leaving character varying(255),
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    current_work boolean DEFAULT false,
    notice_period character varying(255),
    position_held character varying(255)
);


ALTER TABLE public.aviation_records OWNER TO postgres;

--
-- Name: aviation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aviation_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aviation_records_id_seq OWNER TO postgres;

--
-- Name: aviation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aviation_records_id_seq OWNED BY public.aviation_records.id;


--
-- Name: cabin_certifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cabin_certifications (
    id integer NOT NULL,
    license_authority character varying(255),
    first_aid boolean,
    "CRM" boolean,
    "SEPT" boolean,
    "DG" boolean,
    "Ditching" boolean,
    "Fire_fighting" boolean,
    file_id integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cabin_certifications OWNER TO postgres;

--
-- Name: cabin_certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cabin_certifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cabin_certifications_id_seq OWNER TO postgres;

--
-- Name: cabin_certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cabin_certifications_id_seq OWNED BY public.cabin_certifications.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_cards (
    id integer NOT NULL,
    customer_id integer,
    bin character varying(255),
    last_digits character varying(255),
    holder character varying(255),
    exp_month character varying(255),
    exp_year character varying(255),
    brand character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    token character varying(255)
);


ALTER TABLE public.credit_cards OWNER TO postgres;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_cards_id_seq OWNER TO postgres;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourites (
    id integer NOT NULL,
    customer_id integer,
    airline_id integer,
    job_id integer,
    who_favourite character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.favourites OWNER TO postgres;

--
-- Name: favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favourites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favourites_id_seq OWNER TO postgres;

--
-- Name: favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favourites_id_seq OWNED BY public.favourites.id;


--
-- Name: flying_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flying_hours (
    id integer NOT NULL,
    mtow character varying(255),
    aircraft character varying(255),
    date_first_flown date,
    date_last_flown date,
    total character varying(255),
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    aircraft_id integer,
    ca double precision,
    fo double precision,
    cruise_only_pilot double precision
);


ALTER TABLE public.flying_hours OWNER TO postgres;

--
-- Name: flying_hours_cabins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flying_hours_cabins (
    id integer NOT NULL,
    aircraft_id integer,
    date_first_flown date,
    date_last_flown date,
    total_hours character varying(255),
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    flight_attendant integer,
    purser integer,
    chief_purser integer
);


ALTER TABLE public.flying_hours_cabins OWNER TO postgres;

--
-- Name: flying_hours_cabins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flying_hours_cabins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flying_hours_cabins_id_seq OWNER TO postgres;

--
-- Name: flying_hours_cabins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flying_hours_cabins_id_seq OWNED BY public.flying_hours_cabins.id;


--
-- Name: flying_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flying_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flying_hours_id_seq OWNER TO postgres;

--
-- Name: flying_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flying_hours_id_seq OWNED BY public.flying_hours.id;


--
-- Name: maintenance_certifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance_certifications (
    id integer NOT NULL,
    license_authority character varying(255),
    license_type character varying(255),
    customer_id integer,
    file_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.maintenance_certifications OWNER TO postgres;

--
-- Name: maintenance_certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_certifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintenance_certifications_id_seq OWNER TO postgres;

--
-- Name: maintenance_certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_certifications_id_seq OWNED BY public.maintenance_certifications.id;


--
-- Name: maintenance_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance_hours (
    id integer NOT NULL,
    aircraft_id integer,
    airframe boolean,
    power_plant boolean,
    fuel boolean,
    pneumatic boolean,
    hydraulics boolean,
    avionics boolean,
    electrical boolean,
    interiors boolean,
    total_hours integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.maintenance_hours OWNER TO postgres;

--
-- Name: maintenance_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintenance_hours_id_seq OWNER TO postgres;

--
-- Name: maintenance_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_hours_id_seq OWNED BY public.maintenance_hours.id;


--
-- Name: refinery_aircrafts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_aircrafts (
    id integer NOT NULL,
    name character varying(255),
    weight character varying(255),
    engine character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_aircrafts OWNER TO postgres;

--
-- Name: refinery_aircrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_aircrafts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_aircrafts_id_seq OWNER TO postgres;

--
-- Name: refinery_aircrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_aircrafts_id_seq OWNED BY public.refinery_aircrafts.id;


--
-- Name: refinery_airlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_airlines (
    id integer NOT NULL,
    name character varying(255),
    contact_number character varying(255),
    "position" integer,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    airline_name character varying(255),
    head_office_address text,
    logo_id integer,
    facebook character varying(255),
    twitter character varying(255),
    linkedin character varying(255),
    googleplus character varying(255),
    website character varying(255),
    description text,
    last_notification_id integer,
    views_count integer DEFAULT 0,
    valid_airline boolean DEFAULT false,
    company_size character varying(255),
    image1_id integer,
    image2_id integer,
    image3_id integer,
    image4_id integer,
    image5_id integer,
    sliver_id integer
);


ALTER TABLE public.refinery_airlines OWNER TO postgres;

--
-- Name: refinery_airlines_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_airlines_customers (
    id integer NOT NULL,
    customer_id integer,
    airline_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_airlines_customers OWNER TO postgres;

--
-- Name: refinery_airlines_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_airlines_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_airlines_customers_id_seq OWNER TO postgres;

--
-- Name: refinery_airlines_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_airlines_customers_id_seq OWNED BY public.refinery_airlines_customers.id;


--
-- Name: refinery_airlines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_airlines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_airlines_id_seq OWNER TO postgres;

--
-- Name: refinery_airlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_airlines_id_seq OWNED BY public.refinery_airlines.id;


--
-- Name: refinery_articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_articles (
    id integer NOT NULL,
    name character varying(255),
    body text,
    image_id integer,
    airline_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url character varying(255)
);


ALTER TABLE public.refinery_articles OWNER TO postgres;

--
-- Name: refinery_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_articles_id_seq OWNER TO postgres;

--
-- Name: refinery_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_articles_id_seq OWNED BY public.refinery_articles.id;


--
-- Name: refinery_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_banners (
    id integer NOT NULL,
    name character varying(255),
    title character varying(255),
    description character varying(255),
    image_id integer,
    url character varying(255),
    is_active boolean,
    start_date date,
    expiry_date date,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_banners OWNER TO postgres;

--
-- Name: refinery_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_banners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_banners_id_seq OWNER TO postgres;

--
-- Name: refinery_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_banners_id_seq OWNED BY public.refinery_banners.id;


--
-- Name: refinery_banners_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_banners_pages (
    page_id integer,
    banner_id integer
);


ALTER TABLE public.refinery_banners_pages OWNER TO postgres;

--
-- Name: refinery_blog_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_blog_categories (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cached_slug character varying(255),
    slug character varying(255)
);


ALTER TABLE public.refinery_blog_categories OWNER TO postgres;

--
-- Name: refinery_blog_categories_blog_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_blog_categories_blog_posts (
    id integer NOT NULL,
    blog_category_id integer,
    blog_post_id integer
);


ALTER TABLE public.refinery_blog_categories_blog_posts OWNER TO postgres;

--
-- Name: refinery_blog_categories_blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_blog_categories_blog_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_blog_categories_blog_posts_id_seq OWNER TO postgres;

--
-- Name: refinery_blog_categories_blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_blog_categories_blog_posts_id_seq OWNED BY public.refinery_blog_categories_blog_posts.id;


--
-- Name: refinery_blog_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_blog_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_blog_categories_id_seq OWNER TO postgres;

--
-- Name: refinery_blog_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_blog_categories_id_seq OWNED BY public.refinery_blog_categories.id;


--
-- Name: refinery_blog_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_blog_comments (
    id integer NOT NULL,
    blog_post_id integer,
    spam boolean,
    name character varying(255),
    email character varying(255),
    body text,
    state character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_blog_comments OWNER TO postgres;

--
-- Name: refinery_blog_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_blog_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_blog_comments_id_seq OWNER TO postgres;

--
-- Name: refinery_blog_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_blog_comments_id_seq OWNED BY public.refinery_blog_comments.id;


--
-- Name: refinery_blog_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_blog_posts (
    id integer NOT NULL,
    title character varying(255),
    body text,
    draft boolean,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    cached_slug character varying(255),
    custom_url character varying(255),
    custom_teaser text,
    source_url character varying(255),
    source_url_title character varying(255),
    access_count integer DEFAULT 0,
    slug character varying(255),
    image_id integer
);


ALTER TABLE public.refinery_blog_posts OWNER TO postgres;

--
-- Name: refinery_blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_blog_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_blog_posts_id_seq OWNER TO postgres;

--
-- Name: refinery_blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_blog_posts_id_seq OWNED BY public.refinery_blog_posts.id;


--
-- Name: refinery_businesses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_businesses (
    id integer NOT NULL,
    name character varying(255),
    description text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_businesses OWNER TO postgres;

--
-- Name: refinery_businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_businesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_businesses_id_seq OWNER TO postgres;

--
-- Name: refinery_businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_businesses_id_seq OWNED BY public.refinery_businesses.id;


--
-- Name: refinery_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_carts (
    id integer NOT NULL,
    customer_id integer,
    is_current boolean,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    coupon_id integer
);


ALTER TABLE public.refinery_carts OWNER TO postgres;

--
-- Name: refinery_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_carts_id_seq OWNER TO postgres;

--
-- Name: refinery_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_carts_id_seq OWNED BY public.refinery_carts.id;


--
-- Name: refinery_copywriting_phrase_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_copywriting_phrase_translations (
    id integer NOT NULL,
    refinery_copywriting_phrase_id integer,
    locale character varying(255),
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_copywriting_phrase_translations OWNER TO postgres;

--
-- Name: refinery_copywriting_phrase_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_copywriting_phrase_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_copywriting_phrase_translations_id_seq OWNER TO postgres;

--
-- Name: refinery_copywriting_phrase_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_copywriting_phrase_translations_id_seq OWNED BY public.refinery_copywriting_phrase_translations.id;


--
-- Name: refinery_copywriting_phrases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_copywriting_phrases (
    id integer NOT NULL,
    name character varying(255),
    "default" text,
    value text,
    scope character varying(255),
    page_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    phrase_type character varying(255),
    last_access_at date
);


ALTER TABLE public.refinery_copywriting_phrases OWNER TO postgres;

--
-- Name: refinery_copywriting_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_copywriting_phrases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_copywriting_phrases_id_seq OWNER TO postgres;

--
-- Name: refinery_copywriting_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_copywriting_phrases_id_seq OWNED BY public.refinery_copywriting_phrases.id;


--
-- Name: refinery_customer_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_customer_files (
    id integer NOT NULL,
    file_mime_type character varying(255),
    file_name character varying(255),
    file_size integer,
    file_uid character varying(255),
    file_ext character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id integer
);


ALTER TABLE public.refinery_customer_files OWNER TO postgres;

--
-- Name: refinery_customer_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_customer_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_customer_files_id_seq OWNER TO postgres;

--
-- Name: refinery_customer_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_customer_files_id_seq OWNED BY public.refinery_customer_files.id;


--
-- Name: refinery_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_customers (
    id integer NOT NULL,
    first_name character varying(255),
    surname character varying(255),
    contact_number character varying(255),
    fax_number character varying(255),
    is_company boolean DEFAULT true,
    company_name character varying(255),
    company_registration_number character varying(255),
    company_vat_number character varying(255),
    "position" integer,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    province character varying(255),
    sport character varying(255),
    register_for_wholesale boolean,
    is_wholesale boolean,
    dob character varying(255),
    age integer,
    nationality character varying(255),
    gender character varying(255),
    ppc_date date,
    ppc_expiry_date date,
    ir_date date,
    ir_expiry_date date,
    pass_12_months_hours_flown character varying(255),
    dual_nationality_details character varying(255),
    marital_period character varying(255),
    notice_period character varying(255),
    icao character varying(255),
    military_commitment boolean,
    previously_interviewed boolean,
    previously_employed boolean,
    any_aircraft_accident boolean,
    any_criminal_records boolean,
    current_position character varying(255),
    current_aircraft character varying(255),
    current_airline character varying(255),
    address text,
    customer_country character varying(255),
    interviewed_if_yes character varying(255),
    employed_if_yes character varying(255),
    accident_if_yes text,
    online_application_number character varying(255),
    profile_image_id integer,
    date_of_birth date,
    cover_letter text,
    p1 double precision,
    p2 double precision,
    p3 double precision,
    turbine boolean DEFAULT false,
    more_than boolean DEFAULT false,
    other_number character varying(255),
    phone_extension1 character varying(255),
    phone_extension2 character varying(255),
    last_notification_id integer,
    views_count integer DEFAULT 0,
    career_path character varying(255),
    total_flying_time integer,
    provider character varying(255),
    uid character varying(255),
    facebook_image_url character varying(255),
    small_facebook_image_url character varying(255),
    linkedin_image_url character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    agree_tc boolean,
    trial_start_at date,
    trial_end_at date,
    free_user boolean DEFAULT false
);


ALTER TABLE public.refinery_customers OWNER TO postgres;

--
-- Name: refinery_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_customers_id_seq OWNER TO postgres;

--
-- Name: refinery_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_customers_id_seq OWNED BY public.refinery_customers.id;


--
-- Name: refinery_customers_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_customers_languages (
    customer_id integer,
    language_id integer
);


ALTER TABLE public.refinery_customers_languages OWNER TO postgres;

--
-- Name: refinery_customers_routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_customers_routes (
    customer_id integer,
    route_experience_id integer
);


ALTER TABLE public.refinery_customers_routes OWNER TO postgres;

--
-- Name: refinery_employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_employers (
    id integer NOT NULL,
    name character varying(255),
    image_id integer,
    url character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_employers OWNER TO postgres;

--
-- Name: refinery_employers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_employers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_employers_id_seq OWNER TO postgres;

--
-- Name: refinery_employers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_employers_id_seq OWNED BY public.refinery_employers.id;


--
-- Name: refinery_faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_faqs (
    id integer NOT NULL,
    question text,
    answer text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_faqs OWNER TO postgres;

--
-- Name: refinery_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_faqs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_faqs_id_seq OWNER TO postgres;

--
-- Name: refinery_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_faqs_id_seq OWNED BY public.refinery_faqs.id;


--
-- Name: refinery_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_images (
    id integer NOT NULL,
    image_mime_type character varying(255),
    image_name character varying(255),
    image_size integer,
    image_width integer,
    image_height integer,
    image_uid character varying(255),
    image_ext character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_images OWNER TO postgres;

--
-- Name: refinery_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_images_id_seq OWNER TO postgres;

--
-- Name: refinery_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_images_id_seq OWNED BY public.refinery_images.id;


--
-- Name: refinery_inquiries_inquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_inquiries_inquiries (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    message text,
    spam boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_inquiries_inquiries OWNER TO postgres;

--
-- Name: refinery_inquiries_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_inquiries_inquiries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_inquiries_inquiries_id_seq OWNER TO postgres;

--
-- Name: refinery_inquiries_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_inquiries_inquiries_id_seq OWNED BY public.refinery_inquiries_inquiries.id;


--
-- Name: refinery_invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_invoices (
    id integer NOT NULL,
    invoice_number character varying(255),
    trans_number character varying(255),
    sub_type character varying(255),
    start_date character varying(255),
    end_date character varying(255),
    price_dollar character varying(255),
    price_rand character varying(255),
    card_last_digits character varying(255),
    customer_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_invoices OWNER TO postgres;

--
-- Name: refinery_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_invoices_id_seq OWNER TO postgres;

--
-- Name: refinery_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_invoices_id_seq OWNED BY public.refinery_invoices.id;


--
-- Name: refinery_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_jobs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    airline_id integer,
    benefits text,
    requirements text,
    active boolean,
    location character varying(255),
    salary character varying(255),
    published_date date,
    expiry_date date,
    career_path character varying(255),
    contract_type character varying(255)
);


ALTER TABLE public.refinery_jobs OWNER TO postgres;

--
-- Name: refinery_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_jobs_id_seq OWNER TO postgres;

--
-- Name: refinery_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_jobs_id_seq OWNED BY public.refinery_jobs.id;


--
-- Name: refinery_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_languages (
    id integer NOT NULL,
    name character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_languages OWNER TO postgres;

--
-- Name: refinery_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_languages_id_seq OWNER TO postgres;

--
-- Name: refinery_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_languages_id_seq OWNED BY public.refinery_languages.id;


--
-- Name: refinery_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_line_items (
    id integer NOT NULL,
    cart_id integer,
    product_id integer,
    quantity integer DEFAULT 1,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_line_items OWNER TO postgres;

--
-- Name: refinery_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_line_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_line_items_id_seq OWNER TO postgres;

--
-- Name: refinery_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_line_items_id_seq OWNED BY public.refinery_line_items.id;


--
-- Name: refinery_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_messages (
    id integer NOT NULL,
    message text,
    airline_id integer,
    customer_id integer,
    seen boolean,
    sender character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_messages OWNER TO postgres;

--
-- Name: refinery_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_messages_id_seq OWNER TO postgres;

--
-- Name: refinery_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_messages_id_seq OWNED BY public.refinery_messages.id;


--
-- Name: refinery_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_notifications (
    id integer NOT NULL,
    notification_type character varying(255),
    url character varying(255),
    receiver_id integer,
    receiver_class character varying(255),
    sender_id integer,
    sender_class character varying(255),
    seen boolean DEFAULT false,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_notifications OWNER TO postgres;

--
-- Name: refinery_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_notifications_id_seq OWNER TO postgres;

--
-- Name: refinery_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_notifications_id_seq OWNED BY public.refinery_notifications.id;


--
-- Name: refinery_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_order_items (
    id integer NOT NULL,
    product_name character varying(255),
    product_stock_code character varying(255),
    product_supplier_stock_code character varying(255),
    price numeric(10,2),
    order_id integer,
    quantity integer,
    total numeric(10,2),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_order_items OWNER TO postgres;

--
-- Name: refinery_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_order_items_id_seq OWNER TO postgres;

--
-- Name: refinery_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_order_items_id_seq OWNED BY public.refinery_order_items.id;


--
-- Name: refinery_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_orders (
    id integer NOT NULL,
    order_number character varying(255),
    customer_id integer,
    order_status character varying(255),
    grand_total numeric(10,2),
    address_line_1 character varying(255),
    address_line_2 character varying(255),
    suburb character varying(255),
    city character varying(255),
    postal_code character varying(255),
    payment_type character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    delivery_option_name character varying(255),
    delivery_cost numeric(10,2),
    delivery_waybill_number character varying(255)
);


ALTER TABLE public.refinery_orders OWNER TO postgres;

--
-- Name: refinery_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_orders_id_seq OWNER TO postgres;

--
-- Name: refinery_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_orders_id_seq OWNED BY public.refinery_orders.id;


--
-- Name: refinery_page_part_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_page_part_translations (
    id integer NOT NULL,
    refinery_page_part_id integer,
    locale character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_page_part_translations OWNER TO postgres;

--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_page_part_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_page_part_translations_id_seq OWNER TO postgres;

--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_page_part_translations_id_seq OWNED BY public.refinery_page_part_translations.id;


--
-- Name: refinery_page_parts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_page_parts (
    id integer NOT NULL,
    refinery_page_id integer,
    title character varying(255),
    body text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_page_parts OWNER TO postgres;

--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_page_parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_page_parts_id_seq OWNER TO postgres;

--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_page_parts_id_seq OWNED BY public.refinery_page_parts.id;


--
-- Name: refinery_page_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_page_translations (
    id integer NOT NULL,
    refinery_page_id integer,
    locale character varying(255),
    title character varying(255),
    custom_slug character varying(255),
    menu_title character varying(255),
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_page_translations OWNER TO postgres;

--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_page_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_page_translations_id_seq OWNER TO postgres;

--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_page_translations_id_seq OWNED BY public.refinery_page_translations.id;


--
-- Name: refinery_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_pages (
    id integer NOT NULL,
    parent_id integer,
    path character varying(255),
    slug character varying(255),
    show_in_menu boolean DEFAULT true,
    link_url character varying(255),
    menu_match character varying(255),
    deletable boolean DEFAULT true,
    draft boolean DEFAULT false,
    skip_to_first_child boolean DEFAULT false,
    lft integer,
    rgt integer,
    depth integer,
    view_template character varying(255),
    layout_template character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    footer boolean DEFAULT false
);


ALTER TABLE public.refinery_pages OWNER TO postgres;

--
-- Name: refinery_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_pages_id_seq OWNER TO postgres;

--
-- Name: refinery_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_pages_id_seq OWNED BY public.refinery_pages.id;


--
-- Name: refinery_pages_pods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_pages_pods (
    page_id integer,
    pod_id integer
);


ALTER TABLE public.refinery_pages_pods OWNER TO postgres;

--
-- Name: refinery_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_plans (
    id integer NOT NULL,
    name character varying(255),
    cost double precision,
    currency character varying(255),
    duration character varying(255),
    description text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_plans OWNER TO postgres;

--
-- Name: refinery_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_plans_id_seq OWNER TO postgres;

--
-- Name: refinery_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_plans_id_seq OWNED BY public.refinery_plans.id;


--
-- Name: refinery_pods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_pods (
    id integer NOT NULL,
    name character varying(255),
    body text,
    url character varying(255),
    image_id integer,
    pod_type character varying(255),
    portfolio_entry_id integer,
    video_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_pods OWNER TO postgres;

--
-- Name: refinery_pods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_pods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_pods_id_seq OWNER TO postgres;

--
-- Name: refinery_pods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_pods_id_seq OWNED BY public.refinery_pods.id;


--
-- Name: refinery_portfolio_galleries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_portfolio_galleries (
    id integer NOT NULL,
    title character varying(255),
    body text,
    parent_id integer,
    lft integer,
    rgt integer,
    depth integer,
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_portfolio_galleries OWNER TO postgres;

--
-- Name: refinery_portfolio_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_portfolio_galleries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_portfolio_galleries_id_seq OWNER TO postgres;

--
-- Name: refinery_portfolio_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_portfolio_galleries_id_seq OWNED BY public.refinery_portfolio_galleries.id;


--
-- Name: refinery_portfolio_gallery_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_portfolio_gallery_translations (
    id integer NOT NULL,
    refinery_portfolio_gallery_id integer,
    locale character varying(255),
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_portfolio_gallery_translations OWNER TO postgres;

--
-- Name: refinery_portfolio_gallery_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_portfolio_gallery_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_portfolio_gallery_translations_id_seq OWNER TO postgres;

--
-- Name: refinery_portfolio_gallery_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_portfolio_gallery_translations_id_seq OWNED BY public.refinery_portfolio_gallery_translations.id;


--
-- Name: refinery_portfolio_item_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_portfolio_item_translations (
    id integer NOT NULL,
    refinery_portfolio_item_id integer,
    locale character varying(255),
    title character varying(255),
    caption text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_portfolio_item_translations OWNER TO postgres;

--
-- Name: refinery_portfolio_item_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_portfolio_item_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_portfolio_item_translations_id_seq OWNER TO postgres;

--
-- Name: refinery_portfolio_item_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_portfolio_item_translations_id_seq OWNED BY public.refinery_portfolio_item_translations.id;


--
-- Name: refinery_portfolio_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_portfolio_items (
    id integer NOT NULL,
    title character varying(255),
    caption character varying(255),
    image_id integer NOT NULL,
    gallery_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.refinery_portfolio_items OWNER TO postgres;

--
-- Name: refinery_portfolio_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_portfolio_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_portfolio_items_id_seq OWNER TO postgres;

--
-- Name: refinery_portfolio_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_portfolio_items_id_seq OWNED BY public.refinery_portfolio_items.id;


--
-- Name: refinery_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_products (
    id integer NOT NULL,
    name character varying(255),
    description text,
    price double precision,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_products OWNER TO postgres;

--
-- Name: refinery_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_products_id_seq OWNER TO postgres;

--
-- Name: refinery_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_products_id_seq OWNED BY public.refinery_products.id;


--
-- Name: refinery_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_resources (
    id integer NOT NULL,
    file_mime_type character varying(255),
    file_name character varying(255),
    file_size integer,
    file_uid character varying(255),
    file_ext character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_resources OWNER TO postgres;

--
-- Name: refinery_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_resources_id_seq OWNER TO postgres;

--
-- Name: refinery_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_resources_id_seq OWNED BY public.refinery_resources.id;


--
-- Name: refinery_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_roles (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.refinery_roles OWNER TO postgres;

--
-- Name: refinery_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_roles_id_seq OWNER TO postgres;

--
-- Name: refinery_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_roles_id_seq OWNED BY public.refinery_roles.id;


--
-- Name: refinery_roles_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_roles_users (
    user_id integer,
    role_id integer
);


ALTER TABLE public.refinery_roles_users OWNER TO postgres;

--
-- Name: refinery_route_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_route_experiences (
    id integer NOT NULL,
    continent character varying(255),
    airport character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_route_experiences OWNER TO postgres;

--
-- Name: refinery_route_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_route_experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_route_experiences_id_seq OWNER TO postgres;

--
-- Name: refinery_route_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_route_experiences_id_seq OWNED BY public.refinery_route_experiences.id;


--
-- Name: refinery_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_settings (
    id integer NOT NULL,
    name character varying(255),
    value text,
    destroyable boolean DEFAULT true,
    scoping character varying(255),
    restricted boolean DEFAULT false,
    form_value_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_settings OWNER TO postgres;

--
-- Name: refinery_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_settings_id_seq OWNER TO postgres;

--
-- Name: refinery_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_settings_id_seq OWNED BY public.refinery_settings.id;


--
-- Name: refinery_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_subscriptions (
    id integer NOT NULL,
    customer_id integer,
    exp_date date,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    credit_card_id integer,
    plan_id integer,
    fail_payment_count integer,
    suspend boolean DEFAULT false
);


ALTER TABLE public.refinery_subscriptions OWNER TO postgres;

--
-- Name: refinery_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_subscriptions_id_seq OWNER TO postgres;

--
-- Name: refinery_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_subscriptions_id_seq OWNED BY public.refinery_subscriptions.id;


--
-- Name: refinery_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_transactions (
    id integer NOT NULL,
    unique_guid character varying(255),
    order_id integer,
    amount numeric(10,2),
    is_payment_successful boolean DEFAULT false,
    notes text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_transactions OWNER TO postgres;

--
-- Name: refinery_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_transactions_id_seq OWNER TO postgres;

--
-- Name: refinery_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_transactions_id_seq OWNED BY public.refinery_transactions.id;


--
-- Name: refinery_user_plugins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_user_plugins (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    "position" integer
);


ALTER TABLE public.refinery_user_plugins OWNER TO postgres;

--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_user_plugins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_user_plugins_id_seq OWNER TO postgres;

--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_user_plugins_id_seq OWNED BY public.refinery_user_plugins.id;


--
-- Name: refinery_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    encrypted_password character varying(255) NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    sign_in_count integer,
    remember_created_at timestamp without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_users OWNER TO postgres;

--
-- Name: refinery_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_users_id_seq OWNER TO postgres;

--
-- Name: refinery_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_users_id_seq OWNED BY public.refinery_users.id;


--
-- Name: refinery_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refinery_videos (
    id integer NOT NULL,
    name character varying(255),
    youtube_url character varying(255),
    body text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.refinery_videos OWNER TO postgres;

--
-- Name: refinery_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refinery_videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refinery_videos_id_seq OWNER TO postgres;

--
-- Name: refinery_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refinery_videos_id_seq OWNED BY public.refinery_videos.id;


--
-- Name: route_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route_experiences (
    id integer NOT NULL,
    continent_flown_to character varying(255),
    city_destinations text,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.route_experiences OWNER TO postgres;

--
-- Name: route_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.route_experiences_id_seq OWNER TO postgres;

--
-- Name: route_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.route_experiences_id_seq OWNED BY public.route_experiences.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: seo_meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seo_meta (
    id integer NOT NULL,
    seo_meta_id integer,
    seo_meta_type character varying(255),
    browser_title character varying(255),
    meta_keywords character varying(255),
    meta_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.seo_meta OWNER TO postgres;

--
-- Name: seo_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seo_meta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seo_meta_id_seq OWNER TO postgres;

--
-- Name: seo_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seo_meta_id_seq OWNED BY public.seo_meta.id;


--
-- Name: subscription_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_transactions (
    id integer NOT NULL,
    customer_id integer,
    subscription_id integer,
    credit_card_id integer,
    amount character varying(255),
    notes character varying(255),
    transaction_status character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subscription_transactions OWNER TO postgres;

--
-- Name: subscription_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_transactions_id_seq OWNER TO postgres;

--
-- Name: subscription_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_transactions_id_seq OWNED BY public.subscription_transactions.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying(255),
    tagger_id integer,
    tagger_type character varying(255),
    context character varying(255),
    created_at timestamp without time zone
);


ALTER TABLE public.taggings OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: trans_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trans_logs (
    id integer NOT NULL,
    subscription_transaction_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    request text,
    response text
);


ALTER TABLE public.trans_logs OWNER TO postgres;

--
-- Name: trans_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trans_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trans_logs_id_seq OWNER TO postgres;

--
-- Name: trans_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trans_logs_id_seq OWNED BY public.trans_logs.id;


--
-- Name: article_job_lookups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_job_lookups ALTER COLUMN id SET DEFAULT nextval('public.article_job_lookups_id_seq'::regclass);


--
-- Name: aviation_certification_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviation_certification_details ALTER COLUMN id SET DEFAULT nextval('public.aviation_certification_details_id_seq'::regclass);


--
-- Name: aviation_education_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviation_education_details ALTER COLUMN id SET DEFAULT nextval('public.aviation_education_details_id_seq'::regclass);


--
-- Name: aviation_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviation_records ALTER COLUMN id SET DEFAULT nextval('public.aviation_records_id_seq'::regclass);


--
-- Name: cabin_certifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabin_certifications ALTER COLUMN id SET DEFAULT nextval('public.cabin_certifications_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: favourites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites ALTER COLUMN id SET DEFAULT nextval('public.favourites_id_seq'::regclass);


--
-- Name: flying_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flying_hours ALTER COLUMN id SET DEFAULT nextval('public.flying_hours_id_seq'::regclass);


--
-- Name: flying_hours_cabins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flying_hours_cabins ALTER COLUMN id SET DEFAULT nextval('public.flying_hours_cabins_id_seq'::regclass);


--
-- Name: maintenance_certifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_certifications ALTER COLUMN id SET DEFAULT nextval('public.maintenance_certifications_id_seq'::regclass);


--
-- Name: maintenance_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_hours ALTER COLUMN id SET DEFAULT nextval('public.maintenance_hours_id_seq'::regclass);


--
-- Name: refinery_aircrafts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_aircrafts ALTER COLUMN id SET DEFAULT nextval('public.refinery_aircrafts_id_seq'::regclass);


--
-- Name: refinery_airlines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_airlines ALTER COLUMN id SET DEFAULT nextval('public.refinery_airlines_id_seq'::regclass);


--
-- Name: refinery_airlines_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_airlines_customers ALTER COLUMN id SET DEFAULT nextval('public.refinery_airlines_customers_id_seq'::regclass);


--
-- Name: refinery_articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_articles ALTER COLUMN id SET DEFAULT nextval('public.refinery_articles_id_seq'::regclass);


--
-- Name: refinery_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_banners ALTER COLUMN id SET DEFAULT nextval('public.refinery_banners_id_seq'::regclass);


--
-- Name: refinery_blog_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_categories ALTER COLUMN id SET DEFAULT nextval('public.refinery_blog_categories_id_seq'::regclass);


--
-- Name: refinery_blog_categories_blog_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_categories_blog_posts ALTER COLUMN id SET DEFAULT nextval('public.refinery_blog_categories_blog_posts_id_seq'::regclass);


--
-- Name: refinery_blog_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_comments ALTER COLUMN id SET DEFAULT nextval('public.refinery_blog_comments_id_seq'::regclass);


--
-- Name: refinery_blog_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_posts ALTER COLUMN id SET DEFAULT nextval('public.refinery_blog_posts_id_seq'::regclass);


--
-- Name: refinery_businesses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_businesses ALTER COLUMN id SET DEFAULT nextval('public.refinery_businesses_id_seq'::regclass);


--
-- Name: refinery_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_carts ALTER COLUMN id SET DEFAULT nextval('public.refinery_carts_id_seq'::regclass);


--
-- Name: refinery_copywriting_phrase_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_copywriting_phrase_translations ALTER COLUMN id SET DEFAULT nextval('public.refinery_copywriting_phrase_translations_id_seq'::regclass);


--
-- Name: refinery_copywriting_phrases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_copywriting_phrases ALTER COLUMN id SET DEFAULT nextval('public.refinery_copywriting_phrases_id_seq'::regclass);


--
-- Name: refinery_customer_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_customer_files ALTER COLUMN id SET DEFAULT nextval('public.refinery_customer_files_id_seq'::regclass);


--
-- Name: refinery_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_customers ALTER COLUMN id SET DEFAULT nextval('public.refinery_customers_id_seq'::regclass);


--
-- Name: refinery_employers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_employers ALTER COLUMN id SET DEFAULT nextval('public.refinery_employers_id_seq'::regclass);


--
-- Name: refinery_faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_faqs ALTER COLUMN id SET DEFAULT nextval('public.refinery_faqs_id_seq'::regclass);


--
-- Name: refinery_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_images ALTER COLUMN id SET DEFAULT nextval('public.refinery_images_id_seq'::regclass);


--
-- Name: refinery_inquiries_inquiries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_inquiries_inquiries ALTER COLUMN id SET DEFAULT nextval('public.refinery_inquiries_inquiries_id_seq'::regclass);


--
-- Name: refinery_invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_invoices ALTER COLUMN id SET DEFAULT nextval('public.refinery_invoices_id_seq'::regclass);


--
-- Name: refinery_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_jobs ALTER COLUMN id SET DEFAULT nextval('public.refinery_jobs_id_seq'::regclass);


--
-- Name: refinery_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_languages ALTER COLUMN id SET DEFAULT nextval('public.refinery_languages_id_seq'::regclass);


--
-- Name: refinery_line_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_line_items ALTER COLUMN id SET DEFAULT nextval('public.refinery_line_items_id_seq'::regclass);


--
-- Name: refinery_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_messages ALTER COLUMN id SET DEFAULT nextval('public.refinery_messages_id_seq'::regclass);


--
-- Name: refinery_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_notifications ALTER COLUMN id SET DEFAULT nextval('public.refinery_notifications_id_seq'::regclass);


--
-- Name: refinery_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_order_items ALTER COLUMN id SET DEFAULT nextval('public.refinery_order_items_id_seq'::regclass);


--
-- Name: refinery_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_orders ALTER COLUMN id SET DEFAULT nextval('public.refinery_orders_id_seq'::regclass);


--
-- Name: refinery_page_part_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_page_part_translations ALTER COLUMN id SET DEFAULT nextval('public.refinery_page_part_translations_id_seq'::regclass);


--
-- Name: refinery_page_parts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_page_parts ALTER COLUMN id SET DEFAULT nextval('public.refinery_page_parts_id_seq'::regclass);


--
-- Name: refinery_page_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_page_translations ALTER COLUMN id SET DEFAULT nextval('public.refinery_page_translations_id_seq'::regclass);


--
-- Name: refinery_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_pages ALTER COLUMN id SET DEFAULT nextval('public.refinery_pages_id_seq'::regclass);


--
-- Name: refinery_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_plans ALTER COLUMN id SET DEFAULT nextval('public.refinery_plans_id_seq'::regclass);


--
-- Name: refinery_pods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_pods ALTER COLUMN id SET DEFAULT nextval('public.refinery_pods_id_seq'::regclass);


--
-- Name: refinery_portfolio_galleries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_galleries ALTER COLUMN id SET DEFAULT nextval('public.refinery_portfolio_galleries_id_seq'::regclass);


--
-- Name: refinery_portfolio_gallery_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_gallery_translations ALTER COLUMN id SET DEFAULT nextval('public.refinery_portfolio_gallery_translations_id_seq'::regclass);


--
-- Name: refinery_portfolio_item_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_item_translations ALTER COLUMN id SET DEFAULT nextval('public.refinery_portfolio_item_translations_id_seq'::regclass);


--
-- Name: refinery_portfolio_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_items ALTER COLUMN id SET DEFAULT nextval('public.refinery_portfolio_items_id_seq'::regclass);


--
-- Name: refinery_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_products ALTER COLUMN id SET DEFAULT nextval('public.refinery_products_id_seq'::regclass);


--
-- Name: refinery_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_resources ALTER COLUMN id SET DEFAULT nextval('public.refinery_resources_id_seq'::regclass);


--
-- Name: refinery_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_roles ALTER COLUMN id SET DEFAULT nextval('public.refinery_roles_id_seq'::regclass);


--
-- Name: refinery_route_experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_route_experiences ALTER COLUMN id SET DEFAULT nextval('public.refinery_route_experiences_id_seq'::regclass);


--
-- Name: refinery_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_settings ALTER COLUMN id SET DEFAULT nextval('public.refinery_settings_id_seq'::regclass);


--
-- Name: refinery_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.refinery_subscriptions_id_seq'::regclass);


--
-- Name: refinery_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_transactions ALTER COLUMN id SET DEFAULT nextval('public.refinery_transactions_id_seq'::regclass);


--
-- Name: refinery_user_plugins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_user_plugins ALTER COLUMN id SET DEFAULT nextval('public.refinery_user_plugins_id_seq'::regclass);


--
-- Name: refinery_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_users ALTER COLUMN id SET DEFAULT nextval('public.refinery_users_id_seq'::regclass);


--
-- Name: refinery_videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_videos ALTER COLUMN id SET DEFAULT nextval('public.refinery_videos_id_seq'::regclass);


--
-- Name: route_experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_experiences ALTER COLUMN id SET DEFAULT nextval('public.route_experiences_id_seq'::regclass);


--
-- Name: seo_meta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seo_meta ALTER COLUMN id SET DEFAULT nextval('public.seo_meta_id_seq'::regclass);


--
-- Name: subscription_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_transactions ALTER COLUMN id SET DEFAULT nextval('public.subscription_transactions_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: trans_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_logs ALTER COLUMN id SET DEFAULT nextval('public.trans_logs_id_seq'::regclass);


--
-- Data for Name: article_job_lookups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_job_lookups (id, job_id, airline_id, article_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: aviation_certification_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aviation_certification_details (id, license_type, license_number, country_of_issue, date_of_issue, date_of_expiry, customer_id, created_at, updated_at, license_authority, mcc, dangerous_goods, crm, tcas_acas, lvo, rnav_gnss, rvsm, cfit_gpws, etops, file_id) FROM stdin;
1	Multi Engine CPL I.R + ATPL	\N	\N	\N	2021-10-14	4	2018-05-14 08:17:35.063198	2018-05-14 08:17:35.063198	ICAO	t	t	f	f	t	t	f	t	t	\N
\.


--
-- Data for Name: aviation_education_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aviation_education_details (id, program, institution, period, customer_id, created_at, updated_at, education_type) FROM stdin;
1	Masters	NMU	2003	4	2018-05-14 08:16:54.132323	2018-05-14 08:16:54.132323	\N
\.


--
-- Data for Name: aviation_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aviation_records (id, employer, aircraft, start_date, end_date, ca, fo, total, reason_for_leaving, customer_id, created_at, updated_at, current_work, notice_period, position_held) FROM stdin;
1	Jet Airline	\N	2014-05-14	\N	\N	\N	\N		4	2018-05-14 08:18:05.081792	2018-05-14 08:18:05.081792	t	60 Days	P1 - Captain
\.


--
-- Data for Name: cabin_certifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cabin_certifications (id, license_authority, first_aid, "CRM", "SEPT", "DG", "Ditching", "Fire_fighting", file_id, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: credit_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_cards (id, customer_id, bin, last_digits, holder, exp_month, exp_year, brand, created_at, updated_at, token) FROM stdin;
2	4	1	323	Testy McTestington	2020-05-14 10:14:18	2020-05-14 10:14:18	Mastercard	2018-05-14 10:14:18	2018-05-14 10:14:18	a1b2c1d2
\.


--
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (id, customer_id, airline_id, job_id, who_favourite, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flying_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flying_hours (id, mtow, aircraft, date_first_flown, date_last_flown, total, customer_id, created_at, updated_at, aircraft_id, ca, fo, cruise_only_pilot) FROM stdin;
1	\N	\N	\N	1985-03-29	\N	4	2018-05-14 08:18:38.5314	2018-05-14 08:18:38.5314	4	5000	\N	\N
\.


--
-- Data for Name: flying_hours_cabins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flying_hours_cabins (id, aircraft_id, date_first_flown, date_last_flown, total_hours, customer_id, created_at, updated_at, flight_attendant, purser, chief_purser) FROM stdin;
\.


--
-- Data for Name: maintenance_certifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance_certifications (id, license_authority, license_type, customer_id, file_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: maintenance_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance_hours (id, aircraft_id, airframe, power_plant, fuel, pneumatic, hydraulics, avionics, electrical, interiors, total_hours, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_aircrafts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_aircrafts (id, name, weight, engine, "position", created_at, updated_at) FROM stdin;
1	Airbus A310	\N	\N	0	2018-05-11 07:45:10.677893	2018-05-11 07:45:10.677893
2	Airbus A318	\N	\N	1	2018-05-11 07:45:24.407084	2018-05-11 07:45:24.407084
3	Airbus A319	\N	\N	2	2018-05-11 07:45:35.825182	2018-05-11 07:45:35.825182
4	Airbus A330-200	\N	\N	3	2018-05-11 07:46:18.432772	2018-05-11 07:46:18.432772
\.


--
-- Data for Name: refinery_airlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_airlines (id, name, contact_number, "position", email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, airline_name, head_office_address, logo_id, facebook, twitter, linkedin, googleplus, website, description, last_notification_id, views_count, valid_airline, company_size, image1_id, image2_id, image3_id, image4_id, image5_id, sliver_id) FROM stdin;
1	Qatar	\N	0	justin@icarative.com	$2a$10$Q9MqSzqeqZ46EUuVO0TAX.R0D6ScgIkxyxk.whG8nE2boiFE0iC7S	\N	\N	\N	0	\N	\N	\N	\N	2018-05-11 07:27:32.250903	2018-05-11 07:27:32.250903	Qatar Airlines	Qatar Airways Towers, Doha, Qatar	\N	https://www.facebook.com/qatarairways		https://www.linkedin.com/company/10834	https://www.youtube.com/user/qatarairways	http://www.qatarairways.com/	<p>Qatar Airways, the national carrier of the State of Qatar, is celebrating 20 years of Going Places Together with travellers across its more than 150 business and leisure destinations. The world’s fastest-growing airline will add a number of exciting new destinations to its growing network in 2017/18, including St. Petersburg, Russia; Chiang Mai, Thailand; Canberra, Australia and many more, flying passengers on board its modern fleet of more than 200 aircraft. A multiple award-winning airline, Qatar Airways was recently named ‘Airline of the Year’ by the 2017 World Airline Awards, managed by international air transport rating organisation Skytrax. It was also named ‘World’s Best Business Class,’ ‘Best Airline in the Middle East,’ and ‘World’s Best First Class Airline Lounge.’</p>	\N	0	t	24000	\N	\N	\N	\N	\N	\N
2	Lufthansa	\N	1	lufthansa@icarative.com	$2a$10$ipY0WxC7zx7UpPs9YBILV.SANgJKpInG1/pKJ/toa54ntg1yRJZxK	\N	\N	\N	3	2018-05-14 10:41:23.269913	2018-05-14 10:35:51.431436	127.0.0.1	127.0.0.1	2018-05-11 07:44:31.748262	2018-05-14 10:41:23.290494	Lufthansa Airlines	13 Granville Street,	2	https://www.facebook.com/Lufthansa/			https://plus.google.com/103784302321147335749	http://lufthansa.com/		\N	1	t	Icarative	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: refinery_airlines_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_airlines_customers (id, customer_id, airline_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_articles (id, name, body, image_id, airline_id, "position", created_at, updated_at, url) FROM stdin;
\.


--
-- Data for Name: refinery_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_banners (id, name, title, description, image_id, url, is_active, start_date, expiry_date, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_banners_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_banners_pages (page_id, banner_id) FROM stdin;
\.


--
-- Data for Name: refinery_blog_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_blog_categories (id, title, created_at, updated_at, cached_slug, slug) FROM stdin;
\.


--
-- Data for Name: refinery_blog_categories_blog_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_blog_categories_blog_posts (id, blog_category_id, blog_post_id) FROM stdin;
\.


--
-- Data for Name: refinery_blog_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_blog_comments (id, blog_post_id, spam, name, email, body, state, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_blog_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_blog_posts (id, title, body, draft, published_at, created_at, updated_at, user_id, cached_slug, custom_url, custom_teaser, source_url, source_url_title, access_count, slug, image_id) FROM stdin;
\.


--
-- Data for Name: refinery_businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_businesses (id, name, description, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_carts (id, customer_id, is_current, "position", created_at, updated_at, coupon_id) FROM stdin;
1	\N	t	\N	2018-04-25 20:15:19.768055	2018-04-25 20:15:19.768055	\N
2	\N	t	\N	2018-04-25 20:17:16.791393	2018-04-25 20:17:16.791393	\N
3	1	t	\N	2018-04-25 20:36:19.447994	2018-04-25 20:36:46.547956	\N
4	\N	t	\N	2018-04-25 20:37:55.431845	2018-04-25 20:37:55.431845	\N
5	\N	t	\N	2018-04-25 20:38:27.308635	2018-04-25 20:38:27.308635	\N
6	\N	t	\N	2018-04-25 20:38:32.292385	2018-04-25 20:38:32.292385	\N
7	\N	t	\N	2018-04-25 20:39:20.767577	2018-04-25 20:39:20.767577	\N
8	\N	t	\N	2018-04-25 21:14:31.369713	2018-04-25 21:14:31.369713	\N
9	\N	t	\N	2018-04-25 21:14:31.680973	2018-04-25 21:14:31.680973	\N
10	2	t	\N	2018-04-26 07:09:27.745008	2018-04-26 07:10:09.909693	\N
11	\N	t	\N	2018-04-26 15:35:33.602311	2018-04-26 15:35:33.602311	\N
12	\N	t	\N	2018-04-26 15:45:29.712801	2018-04-26 15:45:29.712801	\N
13	3	t	\N	2018-04-27 06:43:10.706511	2018-04-27 06:44:05.630383	\N
14	\N	t	\N	2018-04-27 06:45:39.897522	2018-04-27 06:45:39.897522	\N
15	\N	t	\N	2018-04-27 09:45:08.055367	2018-04-27 09:45:08.055367	\N
16	\N	t	\N	2018-04-27 09:48:18.108223	2018-04-27 09:48:18.108223	\N
17	\N	t	\N	2018-04-27 09:48:19.721932	2018-04-27 09:48:19.721932	\N
18	\N	t	\N	2018-04-27 09:48:19.915518	2018-04-27 09:48:19.915518	\N
19	\N	t	\N	2018-04-27 09:50:43.881912	2018-04-27 09:50:43.881912	\N
20	\N	t	\N	2018-04-27 09:51:39.688683	2018-04-27 09:51:39.688683	\N
21	\N	t	\N	2018-04-27 09:51:55.408364	2018-04-27 09:51:55.408364	\N
22	4	t	\N	2018-04-27 10:38:46.893113	2018-04-27 10:43:03.135939	\N
23	\N	t	\N	2018-04-27 10:43:59.351988	2018-04-27 10:43:59.351988	\N
24	\N	t	\N	2018-04-27 10:44:11.954578	2018-04-27 10:44:11.954578	\N
25	\N	t	\N	2018-04-27 10:44:21.36988	2018-04-27 10:44:21.36988	\N
26	\N	t	\N	2018-04-27 10:44:31.193506	2018-04-27 10:44:31.193506	\N
27	\N	t	\N	2018-04-29 12:55:01.071209	2018-04-29 12:55:01.071209	\N
28	\N	t	\N	2018-04-29 12:58:43.488039	2018-04-29 12:58:43.488039	\N
29	\N	t	\N	2018-05-10 10:34:17.438256	2018-05-10 10:34:17.438256	\N
30	\N	t	\N	2018-05-10 10:34:22.907326	2018-05-10 10:34:22.907326	\N
31	\N	t	\N	2018-05-10 10:34:36.00642	2018-05-10 10:34:36.00642	\N
32	\N	t	\N	2018-05-10 10:35:30.838233	2018-05-10 10:35:30.838233	\N
33	\N	t	\N	2018-05-10 10:36:44.862632	2018-05-10 10:36:44.862632	\N
34	\N	t	\N	2018-05-10 10:45:33.026083	2018-05-10 10:45:33.026083	\N
35	\N	t	\N	2018-05-10 11:34:07.853642	2018-05-10 11:34:07.853642	\N
36	\N	t	\N	2018-05-10 11:34:43.31268	2018-05-10 11:34:43.31268	\N
37	\N	t	\N	2018-05-11 07:16:14.370916	2018-05-11 07:16:14.370916	\N
38	\N	t	\N	2018-05-11 07:16:18.423924	2018-05-11 07:16:18.423924	\N
39	\N	t	\N	2018-05-14 08:11:06.361544	2018-05-14 08:11:06.361544	\N
40	\N	t	\N	2018-05-14 08:11:10.957284	2018-05-14 08:11:10.957284	\N
41	\N	t	\N	2018-05-14 08:11:39.338088	2018-05-14 08:11:39.338088	\N
42	\N	t	\N	2018-05-14 08:12:06.821801	2018-05-14 08:12:06.821801	\N
43	\N	t	\N	2018-05-14 08:15:55.444026	2018-05-14 08:15:55.444026	\N
44	\N	t	\N	2018-05-14 08:16:06.470305	2018-05-14 08:16:06.470305	\N
45	\N	t	\N	2018-05-14 08:20:03.85209	2018-05-14 08:20:03.85209	\N
46	\N	t	\N	2018-05-14 08:23:03.675092	2018-05-14 08:23:03.675092	\N
47	\N	t	\N	2018-05-14 08:23:13.480866	2018-05-14 08:23:13.480866	\N
48	\N	t	\N	2018-05-14 08:24:10.067647	2018-05-14 08:24:10.067647	\N
49	\N	t	\N	2018-05-14 08:24:21.386848	2018-05-14 08:24:21.386848	\N
50	\N	t	\N	2018-05-14 10:13:41.761187	2018-05-14 10:13:41.761187	\N
51	\N	t	\N	2018-05-14 10:13:47.355706	2018-05-14 10:13:47.355706	\N
52	\N	t	\N	2018-05-14 10:13:58.774312	2018-05-14 10:13:58.774312	\N
53	\N	t	\N	2018-05-14 10:14:18.249588	2018-05-14 10:14:18.249588	\N
54	\N	t	\N	2018-05-14 10:29:16.017457	2018-05-14 10:29:16.017457	\N
55	\N	t	\N	2018-05-14 10:29:29.488973	2018-05-14 10:29:29.488973	\N
56	\N	t	\N	2018-05-14 10:29:39.56882	2018-05-14 10:29:39.56882	\N
57	\N	t	\N	2018-05-14 10:40:17.178776	2018-05-14 10:40:17.178776	\N
58	\N	t	\N	2018-05-14 10:40:32.357962	2018-05-14 10:40:32.357962	\N
59	\N	t	\N	2018-05-14 10:40:40.155494	2018-05-14 10:40:40.155494	\N
60	\N	t	\N	2018-05-14 10:41:12.05273	2018-05-14 10:41:12.05273	\N
\.


--
-- Data for Name: refinery_copywriting_phrase_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_copywriting_phrase_translations (id, refinery_copywriting_phrase_id, locale, value, created_at, updated_at) FROM stdin;
1	1	en	\N	2018-04-25 20:15:52.83297	2018-04-25 20:15:52.83297
2	2	en	\N	2018-04-25 20:15:52.884	2018-04-25 20:15:52.884
3	3	en	\N	2018-04-25 20:15:53.000076	2018-04-25 20:15:53.000076
4	4	en	\N	2018-04-25 20:15:53.041491	2018-04-25 20:15:53.041491
5	5	en	\N	2018-04-25 20:15:53.156114	2018-04-25 20:15:53.156114
6	6	en	\N	2018-04-25 20:15:53.229732	2018-04-25 20:15:53.229732
7	7	en	\N	2018-04-25 20:15:53.351975	2018-04-25 20:15:53.351975
8	8	en	\N	2018-04-25 20:15:53.402091	2018-04-25 20:15:53.402091
9	9	en	\N	2018-04-25 20:15:53.522701	2018-04-25 20:15:53.522701
10	10	en	\N	2018-04-25 20:15:53.565459	2018-04-25 20:15:53.565459
11	11	en	\N	2018-04-25 20:15:53.687134	2018-04-25 20:15:53.687134
12	12	en	\N	2018-04-25 20:15:53.818136	2018-04-25 20:15:53.818136
13	13	en	\N	2018-04-25 20:15:53.85588	2018-04-25 20:15:53.85588
14	14	en	\N	2018-04-25 20:15:53.968149	2018-04-25 20:15:53.968149
15	15	en	\N	2018-04-25 20:15:54.227472	2018-04-25 20:15:54.227472
16	16	en	\N	2018-04-25 20:28:43.367774	2018-04-25 20:28:43.367774
17	17	en	\N	2018-04-25 20:28:43.490326	2018-04-25 20:28:43.490326
18	18	en	\N	2018-04-25 20:28:43.538951	2018-04-25 20:28:43.538951
\.


--
-- Data for Name: refinery_copywriting_phrases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_copywriting_phrases (id, name, "default", value, scope, page_id, created_at, updated_at, phrase_type, last_access_at) FROM stdin;
4	Update your Logbook	text here	\N	Stay Connected	\N	2018-04-25 20:15:53.033666	2018-05-14 08:11:08.434226	string	2018-05-14
5	Post your flying hours	text here	\N	Stay Connected	\N	2018-04-25 20:15:53.147875	2018-05-14 08:11:08.456156	string	2018-05-14
6	Stay in touch with Airlines	text here	\N	Stay Connected	\N	2018-04-25 20:15:53.219339	2018-05-14 08:11:08.484306	string	2018-05-14
7	Know first about new jobs	text here	\N	Stay Connected	\N	2018-04-25 20:15:53.343165	2018-05-14 08:11:08.56669	string	2018-05-14
8	Messenger App	text here	\N	Stay Connected	\N	2018-04-25 20:15:53.394904	2018-05-14 08:11:08.58891	string	2018-05-14
9	Track your credits	text here	\N	Stay Connected	\N	2018-04-25 20:15:53.514872	2018-05-14 08:11:08.66992	string	2018-05-14
10	Apple Store	#	\N	App	\N	2018-04-25 20:15:53.557233	2018-05-14 08:11:08.691725	string	2018-05-14
11	Google Play	#	\N	App	\N	2018-04-25 20:15:53.673896	2018-05-14 08:11:08.713001	string	2018-05-14
12	Facebook	#	\N	Social	\N	2018-04-25 20:15:53.809856	2018-05-14 08:11:09.44777	string	2018-05-14
13	Instagram	#	\N	Social	\N	2018-04-25 20:15:53.849108	2018-05-14 08:11:09.553734	string	2018-05-14
14	LinkedIn	#	\N	Social	\N	2018-04-25 20:15:53.959111	2018-05-14 08:11:09.582493	string	2018-05-14
15	Terms and Conditions	URL here	\N	Customer Reg	\N	2018-04-25 20:15:54.21888	2018-05-14 08:11:09.776434	string	2018-05-14
16	Aviation Network Airline	text here	\N	The modern way	\N	2018-04-25 20:28:43.339187	2018-05-14 10:12:31.594309	string	2018-05-14
17	Database with Candidates Airline	text here	\N	The modern way	\N	2018-04-25 20:28:43.482539	2018-05-14 10:12:31.700436	string	2018-05-14
18	Pilots to Cabin Crew Airline	text here	\N	The modern way	\N	2018-04-25 20:28:43.530132	2018-05-14 10:12:31.788075	string	2018-05-14
1	Aviation Network	text here	\N	The modern way	\N	2018-04-25 20:15:52.70373	2018-05-14 08:11:08.284181	string	2018-05-14
2	Get Headhunted	text here	\N	The modern way	\N	2018-04-25 20:15:52.874569	2018-05-14 08:11:08.331371	string	2018-05-14
3	Pilots to Cabin Crew	text here	\N	The modern way	\N	2018-04-25 20:15:52.991517	2018-05-14 08:11:08.359774	string	2018-05-14
\.


--
-- Data for Name: refinery_customer_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_customer_files (id, file_mime_type, file_name, file_size, file_uid, file_ext, "position", created_at, updated_at, customer_id) FROM stdin;
1	image/jpeg	\N	70364	2018/05/14/10_19_25_328_file	\N	\N	2018-05-14 08:19:25.351176	2018-05-14 08:19:25.351176	4
\.


--
-- Data for Name: refinery_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_customers (id, first_name, surname, contact_number, fax_number, is_company, company_name, company_registration_number, company_vat_number, "position", email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, province, sport, register_for_wholesale, is_wholesale, dob, age, nationality, gender, ppc_date, ppc_expiry_date, ir_date, ir_expiry_date, pass_12_months_hours_flown, dual_nationality_details, marital_period, notice_period, icao, military_commitment, previously_interviewed, previously_employed, any_aircraft_accident, any_criminal_records, current_position, current_aircraft, current_airline, address, customer_country, interviewed_if_yes, employed_if_yes, accident_if_yes, online_application_number, profile_image_id, date_of_birth, cover_letter, p1, p2, p3, turbine, more_than, other_number, phone_extension1, phone_extension2, last_notification_id, views_count, career_path, total_flying_time, provider, uid, facebook_image_url, small_facebook_image_url, linkedin_image_url, confirmation_token, confirmed_at, confirmation_sent_at, agree_tc, trial_start_at, trial_end_at, free_user) FROM stdin;
4	Testy	McTestington	0117240500	\N	t	\N	\N	\N	\N	test3@test.com	$2a$10$ai0y.UGOVNfpRg.P.PhR0.d45b0Yh7jc5/tU6pIbHfqGZxJlciwhe	\N	\N	\N	6	2018-05-14 10:29:39.711341	2018-05-14 10:14:18.920333	127.0.0.1	127.0.0.1	2018-04-27 10:43:02.540315	2018-05-14 10:36:32.615603	\N	\N	\N	\N	\N	0	ZA	Male	2018-05-14	2020-05-14	2018-05-14	2020-05-14	\N	ZA	\N	60 Days	Level 6 - Expert	\N	\N	\N	\N	\N	\N	\N	Jet Airline	\N	\N	\N	\N	\N	\N	\N	2018-04-27	This is a test cover letter	5000	0	0	f	f	\N	\N	\N	\N	1	Pilot	5000	\N	\N	\N	\N	\N	\N	2018-05-14 10:14:18	2018-05-14 09:14:18	t	2018-05-14	2019-05-14	f
3	Tester	Tester	1111111111	\N	t	\N	\N	\N	\N	test2@test.com	$2a$10$q7sn4/u8DM5LTjWrUFE7NOVVvl3ZlJY3Eh/zLEGEErkGmdfupM9Bu	\N	\N	\N	2	2018-04-29 12:58:44.270391	2018-04-27 06:44:05.506298	127.0.0.1	127.0.0.1	2018-04-27 06:44:05.410358	2018-04-29 12:58:44.314432	\N	\N	\N	\N	\N	0	ZA	Male	\N	\N	\N	\N	\N	ZA	\N	\N	Level 6 - Expert	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-04-27	\N	\N	\N	\N	f	f	\N	\N	\N	\N	0	Pilot	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	f
1	Justin	Slabbert	0825388390	\N	t	\N	\N	\N	\N	justinslabbert85@gmail.com	$2a$10$QhUy/C/l7s6DGNaymuyjW.WLS7DKYjZLflIFYVm5vY6U8OVD5bJki	\N	\N	\N	10	2018-05-10 11:34:43.567768	2018-05-10 10:45:33.791281	127.0.0.1	127.0.0.1	2018-04-25 20:36:46.136214	2018-05-10 11:34:44.131679	\N	\N	\N	\N	\N	33	ZA	Male	\N	\N	\N	\N	\N	ZA	\N	\N	Level 6 - Expert	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1985-03-29	\N	\N	\N	\N	f	f	\N	\N	\N	\N	0	Pilot	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t
2	Testy	McTestington	0821234567	\N	t	\N	\N	\N	\N	test@test.com	$2a$10$irBeDPLV/ZxhHTffBY4JO.4N1WH6OEgOLCcdRpeghYhSHDJAfueuW	\N	\N	\N	1	2018-04-26 07:10:07.630648	2018-04-26 07:10:07.630648	127.0.0.1	127.0.0.1	2018-04-26 07:10:07.505241	2018-05-14 08:15:13.468804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t
\.


--
-- Data for Name: refinery_customers_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_customers_languages (customer_id, language_id) FROM stdin;
\.


--
-- Data for Name: refinery_customers_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_customers_routes (customer_id, route_experience_id) FROM stdin;
4	1
4	2
4	5
4	8
4	9
4	4
\.


--
-- Data for Name: refinery_employers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_employers (id, name, image_id, url, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_faqs (id, question, answer, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_images (id, image_mime_type, image_name, image_size, image_width, image_height, image_uid, image_ext, created_at, updated_at) FROM stdin;
1	image/jpeg	qatarlogo.jpeg	6021	225	225	2018/05/11/09_26_14_829_qatarlogo.jpeg	\N	2018-05-11 07:26:14.842487	2018-05-11 07:26:14.842487
2	image/png	lufthansalogo.png	3140	225	225	2018/05/11/09_43_21_698_lufthansalogo.png	\N	2018-05-11 07:43:21.706312	2018-05-11 07:43:21.706312
\.


--
-- Data for Name: refinery_inquiries_inquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_inquiries_inquiries (id, name, email, phone, message, spam, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_invoices (id, invoice_number, trans_number, sub_type, start_date, end_date, price_dollar, price_rand, card_last_digits, customer_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_jobs (id, name, description, "position", created_at, updated_at, airline_id, benefits, requirements, active, location, salary, published_date, expiry_date, career_path, contract_type) FROM stdin;
\.


--
-- Data for Name: refinery_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_languages (id, name, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_line_items (id, cart_id, product_id, quantity, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_messages (id, message, airline_id, customer_id, seen, sender, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_notifications (id, notification_type, url, receiver_id, receiver_class, sender_id, sender_class, seen, "position", created_at, updated_at) FROM stdin;
1	AirlineView	/airlines/2	4	Refinery::Customers::Customer	2	Refinery::Airlines::Airline	f	\N	2018-05-14 10:36:32.643823	2018-05-14 10:36:32.643823
\.


--
-- Data for Name: refinery_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_order_items (id, product_name, product_stock_code, product_supplier_stock_code, price, order_id, quantity, total, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_orders (id, order_number, customer_id, order_status, grand_total, address_line_1, address_line_2, suburb, city, postal_code, payment_type, "position", created_at, updated_at, delivery_option_name, delivery_cost, delivery_waybill_number) FROM stdin;
\.


--
-- Data for Name: refinery_page_part_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_page_part_translations (id, refinery_page_part_id, locale, body, created_at, updated_at) FROM stdin;
5	5	en	<p>Get in touch with us. Just use the form below and we'll get back to you as soon as we can.</p>	2018-04-25 20:14:31.183833	2018-04-25 20:14:31.191696
6	6	en		2018-04-25 20:14:31.207286	2018-04-25 20:14:31.21117
7	7	en	<p>We've received your inquiry and will get back to you with a response shortly.</p><p><a href='/'>Return to the home page</a></p>	2018-04-25 20:14:31.456829	2018-04-25 20:14:31.460646
8	8	en	<p>We respect your privacy. We do not market, rent or sell our email list to any outside parties.</p><p>We need your e-mail address so that we can ensure that the people using our forms are bona fide. It also allows us to send you e-mail newsletters and other communications, if you opt-in. Your postal address is required in order to send you information and pricing, if you request it.</p><p>Please call us at 123 456 7890 if you have any questions or concerns.</p>	2018-04-25 20:14:31.73011	2018-04-25 20:14:31.733934
9	9	en	<p>Welcome to our site. This is just a place holder page while we gather our content.</p>	2018-04-25 20:14:32.095934	2018-04-25 20:14:32.100308
10	10	en	<p>This is another block of content over here.</p>	2018-04-25 20:14:32.119764	2018-04-25 20:14:32.123985
11	11	en	<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>	2018-04-25 20:14:32.381997	2018-04-25 20:14:32.386923
13	13	en	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>	2018-04-25 20:14:32.553908	2018-04-25 20:14:32.557633
4	4	en		2018-04-25 20:14:31.003157	2018-04-25 21:17:05.148805
3	3	en		2018-04-25 20:14:30.980383	2018-04-25 21:17:05.278013
26	26	en		2018-04-25 20:14:34.107832	2018-04-25 21:18:01.697928
27	27	en		2018-04-25 20:14:34.126236	2018-04-25 21:18:01.715073
44	44	en		2018-04-25 20:14:36.270386	2018-04-25 21:18:54.211874
45	45	en		2018-04-25 20:14:36.28442	2018-04-25 21:18:54.225666
43	43	en		2018-04-25 20:14:36.014063	2018-04-25 21:19:08.14519
42	42	en		2018-04-25 20:14:35.984889	2018-04-25 21:19:08.161889
40	40	en		2018-04-25 20:14:35.811307	2018-04-25 21:20:25.021757
41	41	en		2018-04-25 20:14:35.826798	2018-04-25 21:20:25.156826
28	28	en		2018-04-25 20:14:34.283854	2018-04-25 21:20:37.784628
29	29	en		2018-04-25 20:14:34.367281	2018-04-25 21:20:37.896496
34	34	en		2018-04-25 20:14:34.929103	2018-04-25 21:21:04.22834
35	35	en		2018-04-25 20:14:34.952143	2018-04-25 21:21:04.241488
14	14	en		2018-04-25 20:14:32.775639	2018-04-27 09:46:20.475231
15	15	en		2018-04-25 20:14:32.791565	2018-04-27 09:46:20.585884
16	16	en		2018-04-25 20:14:32.952105	2018-04-27 09:46:33.796936
17	17	en		2018-04-25 20:14:32.972434	2018-04-27 09:46:33.809511
20	20	en		2018-04-25 20:14:33.396497	2018-04-27 09:46:54.397656
21	21	en		2018-04-25 20:14:33.414976	2018-04-27 09:46:54.426878
18	18	en		2018-04-25 20:14:33.211822	2018-04-27 09:47:05.092061
19	19	en		2018-04-25 20:14:33.233854	2018-04-27 09:47:05.103619
22	22	en		2018-04-25 20:14:33.661836	2018-04-27 09:47:16.544128
23	23	en		2018-04-25 20:14:33.67808	2018-04-27 09:47:16.5622
12	12	en	<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus.\r\n\r\nInteger interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>	2018-04-25 20:14:32.536515	2018-04-27 09:47:27.56383
1	1	en		2018-04-25 20:14:30.713676	2018-04-27 09:47:38.911439
2	2	en		2018-04-25 20:14:30.758036	2018-04-27 09:47:39.023501
36	36	en		2018-04-25 20:14:35.367499	2018-04-27 09:49:24.423109
37	37	en		2018-04-25 20:14:35.389694	2018-04-27 09:49:24.437771
38	38	en		2018-04-25 20:14:35.549957	2018-04-27 09:49:37.603798
39	39	en		2018-04-25 20:14:35.566935	2018-04-27 09:49:37.617938
24	24	en		2018-04-25 20:14:33.84277	2018-04-27 09:49:56.809996
25	25	en		2018-04-25 20:14:33.929563	2018-04-27 09:49:56.822786
32	32	en		2018-04-25 20:14:34.69592	2018-04-27 09:50:08.608603
33	33	en		2018-04-25 20:14:34.780087	2018-04-27 09:50:08.621708
30	30	en		2018-04-25 20:14:34.524978	2018-04-27 09:51:19.106406
31	31	en		2018-04-25 20:14:34.544576	2018-04-27 09:51:19.121859
\.


--
-- Data for Name: refinery_page_parts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_page_parts (id, refinery_page_id, title, body, "position", created_at, updated_at) FROM stdin;
7	4	Body	<p>We've received your inquiry and will get back to you with a response shortly.</p><p><a href='/'>Return to the home page</a></p>	0	2018-04-25 20:14:31.454339	2018-04-25 20:14:31.454339
8	5	Body	<p>We respect your privacy. We do not market, rent or sell our email list to any outside parties.</p><p>We need your e-mail address so that we can ensure that the people using our forms are bona fide. It also allows us to send you e-mail newsletters and other communications, if you opt-in. Your postal address is required in order to send you information and pricing, if you request it.</p><p>Please call us at 123 456 7890 if you have any questions or concerns.</p>	0	2018-04-25 20:14:31.727864	2018-04-25 20:14:31.727864
9	6	Body	<p>Welcome to our site. This is just a place holder page while we gather our content.</p>	0	2018-04-25 20:14:32.092822	2018-04-25 20:14:32.092822
10	6	Side Body	<p>This is another block of content over here.</p>	1	2018-04-25 20:14:32.1163	2018-04-25 20:14:32.1163
11	7	Body	<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>	0	2018-04-25 20:14:32.379254	2018-04-25 20:14:32.379254
21	12	Side Body		1	2018-04-25 20:14:33.411287	2018-04-27 09:46:54.408216
18	11	Body		0	2018-04-25 20:14:33.209041	2018-04-27 09:47:05.086454
19	11	Side Body		1	2018-04-25 20:14:33.231105	2018-04-27 09:47:05.096777
22	13	Body		0	2018-04-25 20:14:33.659456	2018-04-27 09:47:16.537917
23	13	Side Body		1	2018-04-25 20:14:33.675849	2018-04-27 09:47:16.555539
12	8	Body	<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus.\r\n\r\nInteger interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>	0	2018-04-25 20:14:32.533699	2018-04-27 09:47:27.556984
43	23	Side Body		0	2018-04-25 20:14:36.011276	2018-04-25 21:19:08.137318
42	23	Body		1	2018-04-25 20:14:35.981955	2018-04-25 21:19:08.154558
13	8	Side Body	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>	1	2018-04-25 20:14:32.551166	2018-04-27 09:47:27.572886
1	1	Body		0	2018-04-25 20:14:30.710396	2018-04-27 09:47:38.905937
44	24	Body		0	2018-04-25 20:14:36.267355	2018-04-25 21:19:37.751319
45	24	Side Body		1	2018-04-25 20:14:36.281177	2018-04-25 21:19:37.866386
4	2	Side Body		0	2018-04-25 20:14:31.000405	2018-04-25 21:19:52.462385
3	2	Body		1	2018-04-25 20:14:30.977095	2018-04-25 21:19:52.471765
26	15	Body		0	2018-04-25 20:14:34.105632	2018-04-25 21:20:05.085599
27	15	Side Body		1	2018-04-25 20:14:34.122212	2018-04-25 21:20:05.096412
2	1	Side Body		1	2018-04-25 20:14:30.753827	2018-04-27 09:47:39.015683
5	3	Body	<p>Get in touch with us. Just use the form below and we'll get back to you as soon as we can.</p>	0	2018-04-25 20:14:31.179947	2018-04-27 09:48:50.423349
28	16	Body		0	2018-04-25 20:14:34.28148	2018-04-25 21:20:37.774883
29	16	Side Body		1	2018-04-25 20:14:34.363239	2018-04-25 21:20:37.887633
40	22	Body		0	2018-04-25 20:14:35.809021	2018-04-25 21:20:49.833538
41	22	Side Body		1	2018-04-25 20:14:35.824556	2018-04-25 21:20:49.844189
34	19	Body		0	2018-04-25 20:14:34.926952	2018-04-25 21:21:04.220868
35	19	Side Body		1	2018-04-25 20:14:34.94905	2018-04-25 21:21:04.235514
14	9	Body		0	2018-04-25 20:14:32.773288	2018-04-27 09:46:20.469236
15	9	Side Body		1	2018-04-25 20:14:32.789166	2018-04-27 09:46:20.57993
16	10	Body		0	2018-04-25 20:14:32.94989	2018-04-27 09:46:33.789921
17	10	Side Body		1	2018-04-25 20:14:32.970247	2018-04-27 09:46:33.802686
20	12	Body		0	2018-04-25 20:14:33.394089	2018-04-27 09:46:54.386245
6	3	Side Body		1	2018-04-25 20:14:31.20493	2018-04-27 09:48:50.433501
36	20	Body		0	2018-04-25 20:14:35.361895	2018-04-27 09:49:24.416868
37	20	Side Body		1	2018-04-25 20:14:35.387399	2018-04-27 09:49:24.431634
24	14	Body		0	2018-04-25 20:14:33.84014	2018-04-27 09:49:56.803843
25	14	Side Body		1	2018-04-25 20:14:33.92723	2018-04-27 09:49:56.816283
32	18	Body		0	2018-04-25 20:14:34.693774	2018-04-27 09:50:08.601639
33	18	Side Body		1	2018-04-25 20:14:34.777784	2018-04-27 09:50:08.614379
30	17	Body		0	2018-04-25 20:14:34.522341	2018-04-27 09:51:19.100746
31	17	Side Body		1	2018-04-25 20:14:34.542292	2018-04-27 09:51:19.113262
38	21	Body		0	2018-04-25 20:14:35.546671	2018-04-27 09:51:30.301795
39	21	Side Body		1	2018-04-25 20:14:35.564199	2018-04-27 09:51:30.312469
\.


--
-- Data for Name: refinery_page_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_page_translations (id, refinery_page_id, locale, title, custom_slug, menu_title, slug, created_at, updated_at) FROM stdin;
9	9	en	Employers	\N		employers	2018-04-25 20:14:32.576193	2018-04-27 09:46:20.449559
10	10	en	Jobs	\N		jobs	2018-04-25 20:14:32.811358	2018-04-27 09:46:33.781621
12	12	en	Businesses	\N		businesses	2018-04-25 20:14:33.258004	2018-04-27 09:46:54.363852
11	11	en	Products	\N		products	2018-04-25 20:14:33.068469	2018-04-27 09:47:05.077831
13	13	en	Customer Files	\N		customer-files	2018-04-25 20:14:33.521057	2018-04-27 09:47:16.528054
4	4	en	Thank You	\N	\N	thank-you	2018-04-25 20:14:31.225837	2018-04-25 20:14:31.242269
8	8	en	About	\N		about	2018-04-25 20:14:32.406617	2018-04-27 09:47:27.5438
5	5	en	Privacy Policy	\N	\N	privacy-policy	2018-04-25 20:14:31.579119	2018-04-25 20:14:31.598181
1	1	en	Videos	\N		videos	2018-04-25 20:14:29.953914	2018-04-27 09:47:38.897067
6	6	en	Home	\N	\N	home	2018-04-25 20:14:31.953443	2018-04-25 20:14:31.970818
3	3	en	Contact	\N		contact	2018-04-25 20:14:31.036801	2018-04-27 09:48:50.414176
7	7	en	Page not found	\N	\N	page-not-found	2018-04-25 20:14:32.143669	2018-04-25 20:14:32.159181
20	20	en	Faqs	\N		faqs	2018-04-25 20:14:34.985787	2018-04-27 09:49:24.407448
21	21	en	Pricing	\N		pricing	2018-04-25 20:14:35.410214	2018-04-27 09:49:37.468217
14	14	en	Aircrafts	\N		aircrafts	2018-04-25 20:14:33.699176	2018-04-27 09:49:56.795282
18	18	en	Languages	\N		languages	2018-04-25 20:14:34.566125	2018-04-27 09:50:08.591597
17	17	en	Messages	\N		messages	2018-04-25 20:14:34.391924	2018-04-27 09:51:19.092504
2	2	en	Portfolio	\N		portfolio	2018-04-25 20:14:30.786419	2018-04-25 21:17:05.12628
15	15	en	Airlines	\N		airlines-page	2018-04-25 20:14:33.952012	2018-04-25 21:18:01.674895
24	24	en	Invoices	\N		invoices	2018-04-25 20:14:36.040194	2018-04-25 21:18:54.193367
23	23	en	Blog	\N		blog	2018-04-25 20:14:35.850318	2018-04-25 21:19:08.127466
22	22	en	Route Experiences	\N		route-experiences	2018-04-25 20:14:35.597493	2018-04-25 21:20:25.005045
16	16	en	Articles	\N		articles-page	2018-04-25 20:14:34.153414	2018-04-25 21:20:37.764418
19	19	en	Notifications	\N		notifications	2018-04-25 20:14:34.802279	2018-04-25 21:21:04.210325
\.


--
-- Data for Name: refinery_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_pages (id, parent_id, path, slug, show_in_menu, link_url, menu_match, deletable, draft, skip_to_first_child, lft, rgt, depth, view_template, layout_template, created_at, updated_at, footer) FROM stdin;
13	\N	\N	customer-files	f	/customer_files	^/customer_files(/|/.+?|)$	f	f	f	25	26	0	\N	\N	2018-04-25 20:14:33.528094	2018-04-27 09:47:16.51367	f
8	\N	\N	about	f		\N	t	f	f	15	16	0	\N	\N	2018-04-25 20:14:32.413563	2018-04-27 09:47:27.536499	f
1	\N	\N	videos	f	/videos	^/videos(/|/.+?|)$	f	f	f	1	2	0	\N	\N	2018-04-25 20:14:30.002445	2018-04-27 09:47:38.890169	f
4	3	\N	thank-you	f	/contact/thank_you	^/(inquiries|contact)/thank_you$	f	f	f	6	7	1	\N	\N	2018-04-25 20:14:31.233451	2018-04-25 20:14:31.233451	f
3	\N	\N	contact	f	/contact	^/(inquiries|contact).*$	f	f	f	5	10	0	\N	\N	2018-04-25 20:14:31.044307	2018-04-27 09:48:50.307234	f
5	3	\N	privacy-policy	f	\N	\N	t	f	f	8	9	1	\N	\N	2018-04-25 20:14:31.590873	2018-04-25 20:14:31.590873	f
20	\N	\N	faqs	f	/faqs	^/faqs(/|/.+?|)$	f	f	f	39	40	0	\N	\N	2018-04-25 20:14:34.992872	2018-04-27 09:49:24.287839	f
6	\N	\N	home	t	/	^/$	f	f	f	11	14	0	\N	\N	2018-04-25 20:14:31.961749	2018-04-25 20:14:31.961749	f
7	6	\N	page-not-found	f	\N	^/404$	f	f	f	12	13	1	\N	\N	2018-04-25 20:14:32.151258	2018-04-25 20:14:32.151258	f
14	\N	\N	aircrafts	f	/aircrafts	^/aircrafts(/|/.+?|)$	f	f	f	27	28	0	\N	\N	2018-04-25 20:14:33.707648	2018-04-27 09:49:56.789266	f
18	\N	\N	languages	f	/languages	^/languages(/|/.+?|)$	f	f	f	35	36	0	\N	\N	2018-04-25 20:14:34.573391	2018-04-27 09:50:08.584571	f
17	\N	\N	messages	f	/messages	^/messages(/|/.+?|)$	f	f	f	33	34	0	\N	\N	2018-04-25 20:14:34.400163	2018-04-27 09:51:19.086159	f
21	\N	\N	pricing	t	/plans	^/plans(/|/.+?|)$	f	f	f	41	42	0	\N	\N	2018-04-25 20:14:35.420974	2018-04-27 09:51:30.28535	f
23	\N	\N	blog	f	/blog	^/blogs?(/|/.+?|)$	f	f	f	45	46	0	\N	\N	2018-04-25 20:14:35.857728	2018-04-25 21:19:08.119959	f
24	\N	\N	invoices	f	/invoices	^/invoices(/|/.+?|)$	f	f	f	47	48	0	\N	\N	2018-04-25 20:14:36.047751	2018-04-25 21:19:37.731766	f
2	\N	\N	portfolio	f	/portfolio	^/portfolio(/|/.+?|)$	f	f	f	3	4	0	\N	\N	2018-04-25 20:14:30.795296	2018-04-25 21:19:52.449036	f
15	\N	\N	airlines-page	f	/airlines	^/airlines(/|/.+?|)$	f	f	f	29	30	0	\N	\N	2018-04-25 20:14:33.959585	2018-04-25 21:20:05.069068	f
16	\N	\N	articles-page	f	/articles	^/articles(/|/.+?|)$	f	f	f	31	32	0	\N	\N	2018-04-25 20:14:34.161382	2018-04-25 21:20:37.753618	f
22	\N	\N	route-experiences	f	/route_experiences	^/route_experiences(/|/.+?|)$	f	f	f	43	44	0	\N	\N	2018-04-25 20:14:35.606337	2018-04-25 21:20:49.820687	f
19	\N	\N	notifications	f	/notifications	^/notifications(/|/.+?|)$	f	f	f	37	38	0	\N	\N	2018-04-25 20:14:34.810245	2018-04-25 21:21:04.202382	f
9	\N	\N	employers	f	/employers	^/employers(/|/.+?|)$	f	f	f	17	18	0	\N	\N	2018-04-25 20:14:32.652586	2018-04-27 09:46:20.439631	f
10	\N	\N	jobs	f	/jobs	^/jobs(/|/.+?|)$	f	f	f	19	20	0	\N	\N	2018-04-25 20:14:32.818472	2018-04-27 09:46:33.774155	f
12	\N	\N	businesses	f	/businesses	^/businesses(/|/.+?|)$	f	f	f	23	24	0	\N	\N	2018-04-25 20:14:33.264877	2018-04-27 09:46:54.35642	f
11	\N	\N	products	f	/products	^/products(/|/.+?|)$	f	f	f	21	22	0	\N	\N	2018-04-25 20:14:33.075597	2018-04-27 09:47:05.072004	f
\.


--
-- Data for Name: refinery_pages_pods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_pages_pods (page_id, pod_id) FROM stdin;
\.


--
-- Data for Name: refinery_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_plans (id, name, cost, currency, duration, description, "position", created_at, updated_at) FROM stdin;
1	Squawk Monthly	10	\N	1	<ul>\r\n<h4>Benefits</h4>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;All Alpha Benefits</li>\r\n<li class="plus-li text-center">Plus</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Full profile visible to airlines</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Direct job application</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Airline private messenger</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Training discount offers</li>\r\n</ul>\r\n\r\n\r\n	0	2018-05-11 07:19:31.542556	2018-05-11 07:19:31.542556
2	Squawk Annual	60	\N	12	<ul>\r\n<h4>Benefits</h4>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;All Alpha Benefits</li>\r\n<li class="plus-li text-center">Plus</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Full profile visible to airlines</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Direct job application</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Airline private messenger</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;Training discount offers</li>\r\n<li><img src="/system/images/BAhbBlsHOgZmSSIrMjAxNy8wNy8yOC8xMC8yOS81NC84ODYvdGlja193aGl0ZS5wbmcGOgZFVA/tick-white.png" title="Tick White" alt="Tick White" rel="225x255" width="20" height="16" />&#160;&#160;20% saving</li>\r\n</ul>\r\n	1	2018-05-11 07:20:27.334385	2018-05-11 07:20:27.334385
\.


--
-- Data for Name: refinery_pods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_pods (id, name, body, url, image_id, pod_type, portfolio_entry_id, video_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_portfolio_galleries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_portfolio_galleries (id, title, body, parent_id, lft, rgt, depth, slug, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_portfolio_gallery_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_portfolio_gallery_translations (id, refinery_portfolio_gallery_id, locale, title, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_portfolio_item_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_portfolio_item_translations (id, refinery_portfolio_item_id, locale, title, caption, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_portfolio_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_portfolio_items (id, title, caption, image_id, gallery_id, created_at, updated_at, "position") FROM stdin;
\.


--
-- Data for Name: refinery_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_products (id, name, description, price, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_resources (id, file_mime_type, file_name, file_size, file_uid, file_ext, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_roles (id, title) FROM stdin;
1	Refinery
2	Superuser
\.


--
-- Data for Name: refinery_roles_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_roles_users (user_id, role_id) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: refinery_route_experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_route_experiences (id, continent, airport, "position", created_at, updated_at) FROM stdin;
1	Middle east and Africa	Cape Town	0	2018-05-14 08:20:39.678544	2018-05-14 08:20:39.678544
2	Middle east and Africa	Johannesburg	1	2018-05-14 08:20:53.481082	2018-05-14 08:20:53.481082
3	Middle east and Africa	Port Elizabeth	2	2018-05-14 08:21:08.207428	2018-05-14 08:21:08.207428
4	Asia Pacific	Sydney	3	2018-05-14 08:21:29.052575	2018-05-14 08:21:29.052575
5	Asia Pacific	Melbourne	4	2018-05-14 08:21:37.884231	2018-05-14 08:21:37.884231
6	Europe	Heathrow	5	2018-05-14 08:21:49.485776	2018-05-14 08:21:49.485776
7	Europe	Gatwick	6	2018-05-14 08:22:02.47639	2018-05-14 08:22:02.47639
8	The Americas	Miami	7	2018-05-14 08:22:20.439793	2018-05-14 08:22:20.439793
9	The Americas	New York	8	2018-05-14 08:22:31.418411	2018-05-14 08:22:31.418411
10	North Asia	Moscow	9	2018-05-14 08:22:42.765227	2018-05-14 08:22:42.765227
11	North Asia	Hong Kong	10	2018-05-14 08:22:58.463689	2018-05-14 08:22:58.463689
\.


--
-- Data for Name: refinery_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_settings (id, name, value, destroyable, scoping, restricted, form_value_type, created_at, updated_at) FROM stdin;
1	inquiry_notification_subject	--- New inquiry from your website\n...\n	t	inquiries	f	text_area	2018-04-25 20:14:31.853687	2018-04-25 20:14:31.853687
2	inquiry_send_confirmation	--- 'true'\n	t	inquiries	f	text_area	2018-04-25 20:14:31.915437	2018-04-25 20:14:31.915437
3	new_airline_admin_emails	--- webadmin@perfectcirlce.co.za; info@squawkaviation.com\n...\n	t	\N	f	text_area	2018-05-11 07:27:35.189208	2018-05-11 07:27:35.189208
\.


--
-- Data for Name: refinery_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_subscriptions (id, customer_id, exp_date, "position", created_at, updated_at, credit_card_id, plan_id, fail_payment_count, suspend) FROM stdin;
1	4	2018-06-14	\N	2018-05-14 10:14:18	2018-05-14 10:14:18	2	1	0	f
\.


--
-- Data for Name: refinery_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_transactions (id, unique_guid, order_id, amount, is_payment_successful, notes, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refinery_user_plugins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_user_plugins (id, user_id, name, "position") FROM stdin;
101	1	aircrafts	0
102	1	airlines	1
103	1	articles	2
104	1	banners	3
105	1	refinerycms_blog	4
106	1	businesses	5
107	1	carts	6
108	1	refinerycms_copywriting	7
109	1	customer_files	8
110	1	customers	9
111	1	refinery_dashboard	10
112	1	faqs	11
113	1	refinery_files	12
114	1	refinery_images	13
115	1	refinerycms_inquiries	14
116	1	invoices	15
117	1	jobs	16
118	1	languages	17
119	1	messages	18
120	1	notifications	19
121	1	orders	20
122	1	refinery_pages	21
123	1	plans	22
124	1	pods	23
125	1	portfolio	24
126	1	products	25
127	1	route_experiences	26
128	1	refinery_settings	27
129	1	subscriptions	28
130	1	transactions	29
131	1	refinery_users	30
132	1	videos	31
133	1	refinery_core	32
134	1	refinery_dialogs	33
135	1	refinery_i18n	34
136	1	employers	35
\.


--
-- Data for Name: refinery_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_users (id, username, email, encrypted_password, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, sign_in_count, remember_created_at, reset_password_token, reset_password_sent_at, created_at, updated_at) FROM stdin;
1	jeslabbert	justin@icarative.com	$2a$10$dRmi6BRV06PLFf2xHNzxreHm72iJR01.wdLIgd6a5EgCnXjT8WkvO	2018-05-14 10:15:33.610787	2018-05-14 08:20:14.218825	127.0.0.1	127.0.0.1	14	\N	\N	\N	2018-04-25 20:15:40.56593	2018-05-14 10:15:33.613008
\.


--
-- Data for Name: refinery_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refinery_videos (id, name, youtube_url, body, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: route_experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route_experiences (id, continent_flown_to, city_destinations, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20180220091151
20160829070441
20160829070442
20160829070459
20160829070518
20160829070519
20160829070520
20160829070521
20160829070522
20160829070523
20160829070537
20160829070538
20160829070556
20160829070601
20160829070807
20160829070808
20160829070809
20160829070810
20160829070811
20160829093359
20160829093360
20160829093361
20160829093362
20160829093363
20160829101326
20160829125152
20160829125717
20160829132154
20160830100006
20160830100008
20160830100009
20160830100010
20160830100011
20160830100012
20160830100017
20160830100018
20160830100020
20160830100023
20160831072244
20160905073715
20160905073716
20160905080956
20160905095132
20160905102541
20160905121022
20160905121658
20160905121950
20160913095824
20160913100243
20160914090914
20160916131804
20160920091235
20160922143944
20160923095957
20160923111841
20160926081644
20160926100554
20170222133909
20170223130135
20170228082649
20170228104354
20170228125100
20170228135830
20170301090607
20170607151358
20170607161657
20170608085207
20170608090710
20170608094255
20170608130942
20170611122827
20170614143151
20170614144343
20170622091113
20170622091659
20170623085320
20170623130335
20170628160311
20170629153401
20170630115646
20170630130443
20170707130319
20170718082442
20170718134848
20170718151045
20170719153937
20170720073614
20170720093814
20170720140716
20170720142803
20170725080930
20170725091327
20170726103725
20170726130028
20170726130814
20170726133011
20170726133345
20170727152615
20170802093723
20170803143924
20170817131704
20170824080153
20170906122248
20170908070048
20170908080940
20170908081410
20170908092635
20170918095015
20170918125611
20170918125612
20170918125613
20170918125614
20170918125615
20170918125616
20170918125617
20170918125618
20170918125619
20170918125620
20170918130711
20170919080638
20170922085203
20170922095631
20171002122754
20171002131651
20171003093013
20180425190926
\.


--
-- Data for Name: seo_meta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seo_meta (id, seo_meta_id, seo_meta_type, browser_title, meta_keywords, meta_description, created_at, updated_at) FROM stdin;
4	4	Refinery::Page::Translation	\N	\N	\N	2018-04-25 20:14:31.229351	2018-04-25 20:14:31.229351
5	5	Refinery::Page::Translation	\N	\N	\N	2018-04-25 20:14:31.586445	2018-04-25 20:14:31.586445
6	6	Refinery::Page::Translation	\N	\N	\N	2018-04-25 20:14:31.958094	2018-04-25 20:14:31.958094
7	7	Refinery::Page::Translation	\N	\N	\N	2018-04-25 20:14:32.147476	2018-04-25 20:14:32.147476
2	2	Refinery::Page::Translation				2018-04-25 20:14:30.791482	2018-04-25 21:17:03.378855
15	15	Refinery::Page::Translation				2018-04-25 20:14:33.955793	2018-04-25 21:18:01.459417
24	24	Refinery::Page::Translation				2018-04-25 20:14:36.043884	2018-04-25 21:18:54.092038
23	23	Refinery::Page::Translation				2018-04-25 20:14:35.854539	2018-04-25 21:19:08.077421
22	22	Refinery::Page::Translation				2018-04-25 20:14:35.601989	2018-04-25 21:20:24.950993
16	16	Refinery::Page::Translation				2018-04-25 20:14:34.15779	2018-04-25 21:20:37.717734
19	19	Refinery::Page::Translation				2018-04-25 20:14:34.806135	2018-04-25 21:21:04.014074
9	9	Refinery::Page::Translation				2018-04-25 20:14:32.648052	2018-04-27 09:46:20.374562
10	10	Refinery::Page::Translation				2018-04-25 20:14:32.814894	2018-04-27 09:46:33.647087
12	12	Refinery::Page::Translation				2018-04-25 20:14:33.261717	2018-04-27 09:46:54.217817
11	11	Refinery::Page::Translation				2018-04-25 20:14:33.072253	2018-04-27 09:47:05.036236
13	13	Refinery::Page::Translation				2018-04-25 20:14:33.524827	2018-04-27 09:47:16.472521
8	8	Refinery::Page::Translation				2018-04-25 20:14:32.410219	2018-04-27 09:47:27.056482
1	1	Refinery::Page::Translation				2018-04-25 20:14:29.994087	2018-04-27 09:47:38.85752
3	3	Refinery::Page::Translation				2018-04-25 20:14:31.04061	2018-04-27 09:48:50.220153
20	20	Refinery::Page::Translation				2018-04-25 20:14:34.989221	2018-04-27 09:49:24.248746
21	21	Refinery::Page::Translation				2018-04-25 20:14:35.41592	2018-04-27 09:49:37.426947
14	14	Refinery::Page::Translation				2018-04-25 20:14:33.704351	2018-04-27 09:49:56.753565
18	18	Refinery::Page::Translation				2018-04-25 20:14:34.570073	2018-04-27 09:50:08.432612
17	17	Refinery::Page::Translation				2018-04-25 20:14:34.395521	2018-04-27 09:51:18.949374
\.


--
-- Data for Name: subscription_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_transactions (id, customer_id, subscription_id, credit_card_id, amount, notes, transaction_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggings (id, tag_id, taggable_id, taggable_type, tagger_id, tagger_type, context, created_at) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name) FROM stdin;
\.


--
-- Data for Name: trans_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trans_logs (id, subscription_transaction_id, created_at, updated_at, request, response) FROM stdin;
\.


--
-- Name: article_job_lookups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_job_lookups_id_seq', 1, false);


--
-- Name: aviation_certification_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aviation_certification_details_id_seq', 1, true);


--
-- Name: aviation_education_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aviation_education_details_id_seq', 1, true);


--
-- Name: aviation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aviation_records_id_seq', 1, true);


--
-- Name: cabin_certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cabin_certifications_id_seq', 1, false);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_cards_id_seq', 2, true);


--
-- Name: favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourites_id_seq', 1, false);


--
-- Name: flying_hours_cabins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flying_hours_cabins_id_seq', 1, false);


--
-- Name: flying_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flying_hours_id_seq', 1, true);


--
-- Name: maintenance_certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_certifications_id_seq', 1, false);


--
-- Name: maintenance_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_hours_id_seq', 1, false);


--
-- Name: refinery_aircrafts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_aircrafts_id_seq', 4, true);


--
-- Name: refinery_airlines_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_airlines_customers_id_seq', 1, false);


--
-- Name: refinery_airlines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_airlines_id_seq', 2, true);


--
-- Name: refinery_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_articles_id_seq', 1, false);


--
-- Name: refinery_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_banners_id_seq', 1, false);


--
-- Name: refinery_blog_categories_blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_blog_categories_blog_posts_id_seq', 1, false);


--
-- Name: refinery_blog_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_blog_categories_id_seq', 1, false);


--
-- Name: refinery_blog_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_blog_comments_id_seq', 1, false);


--
-- Name: refinery_blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_blog_posts_id_seq', 1, false);


--
-- Name: refinery_businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_businesses_id_seq', 1, false);


--
-- Name: refinery_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_carts_id_seq', 60, true);


--
-- Name: refinery_copywriting_phrase_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_copywriting_phrase_translations_id_seq', 18, true);


--
-- Name: refinery_copywriting_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_copywriting_phrases_id_seq', 18, true);


--
-- Name: refinery_customer_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_customer_files_id_seq', 1, true);


--
-- Name: refinery_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_customers_id_seq', 4, true);


--
-- Name: refinery_employers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_employers_id_seq', 1, false);


--
-- Name: refinery_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_faqs_id_seq', 1, false);


--
-- Name: refinery_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_images_id_seq', 2, true);


--
-- Name: refinery_inquiries_inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_inquiries_inquiries_id_seq', 1, false);


--
-- Name: refinery_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_invoices_id_seq', 1, false);


--
-- Name: refinery_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_jobs_id_seq', 1, false);


--
-- Name: refinery_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_languages_id_seq', 1, false);


--
-- Name: refinery_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_line_items_id_seq', 1, false);


--
-- Name: refinery_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_messages_id_seq', 1, false);


--
-- Name: refinery_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_notifications_id_seq', 1, true);


--
-- Name: refinery_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_order_items_id_seq', 1, false);


--
-- Name: refinery_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_orders_id_seq', 1, false);


--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_page_part_translations_id_seq', 45, true);


--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_page_parts_id_seq', 45, true);


--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_page_translations_id_seq', 24, true);


--
-- Name: refinery_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_pages_id_seq', 24, true);


--
-- Name: refinery_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_plans_id_seq', 2, true);


--
-- Name: refinery_pods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_pods_id_seq', 1, false);


--
-- Name: refinery_portfolio_galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_portfolio_galleries_id_seq', 1, false);


--
-- Name: refinery_portfolio_gallery_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_portfolio_gallery_translations_id_seq', 1, false);


--
-- Name: refinery_portfolio_item_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_portfolio_item_translations_id_seq', 1, false);


--
-- Name: refinery_portfolio_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_portfolio_items_id_seq', 1, false);


--
-- Name: refinery_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_products_id_seq', 1, false);


--
-- Name: refinery_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_resources_id_seq', 1, false);


--
-- Name: refinery_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_roles_id_seq', 2, true);


--
-- Name: refinery_route_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_route_experiences_id_seq', 11, true);


--
-- Name: refinery_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_settings_id_seq', 3, true);


--
-- Name: refinery_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_subscriptions_id_seq', 1, true);


--
-- Name: refinery_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_transactions_id_seq', 1, false);


--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_user_plugins_id_seq', 136, true);


--
-- Name: refinery_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_users_id_seq', 1, true);


--
-- Name: refinery_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refinery_videos_id_seq', 1, false);


--
-- Name: route_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_experiences_id_seq', 1, false);


--
-- Name: seo_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seo_meta_id_seq', 24, true);


--
-- Name: subscription_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_transactions_id_seq', 1, true);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggings_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Name: trans_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trans_logs_id_seq', 1, false);


--
-- Name: article_job_lookups article_job_lookups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_job_lookups
    ADD CONSTRAINT article_job_lookups_pkey PRIMARY KEY (id);


--
-- Name: aviation_certification_details aviation_certification_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviation_certification_details
    ADD CONSTRAINT aviation_certification_details_pkey PRIMARY KEY (id);


--
-- Name: aviation_education_details aviation_education_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviation_education_details
    ADD CONSTRAINT aviation_education_details_pkey PRIMARY KEY (id);


--
-- Name: aviation_records aviation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviation_records
    ADD CONSTRAINT aviation_records_pkey PRIMARY KEY (id);


--
-- Name: cabin_certifications cabin_certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabin_certifications
    ADD CONSTRAINT cabin_certifications_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: favourites favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (id);


--
-- Name: flying_hours_cabins flying_hours_cabins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flying_hours_cabins
    ADD CONSTRAINT flying_hours_cabins_pkey PRIMARY KEY (id);


--
-- Name: flying_hours flying_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flying_hours
    ADD CONSTRAINT flying_hours_pkey PRIMARY KEY (id);


--
-- Name: maintenance_certifications maintenance_certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_certifications
    ADD CONSTRAINT maintenance_certifications_pkey PRIMARY KEY (id);


--
-- Name: maintenance_hours maintenance_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_hours
    ADD CONSTRAINT maintenance_hours_pkey PRIMARY KEY (id);


--
-- Name: refinery_aircrafts refinery_aircrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_aircrafts
    ADD CONSTRAINT refinery_aircrafts_pkey PRIMARY KEY (id);


--
-- Name: refinery_airlines_customers refinery_airlines_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_airlines_customers
    ADD CONSTRAINT refinery_airlines_customers_pkey PRIMARY KEY (id);


--
-- Name: refinery_airlines refinery_airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_airlines
    ADD CONSTRAINT refinery_airlines_pkey PRIMARY KEY (id);


--
-- Name: refinery_articles refinery_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_articles
    ADD CONSTRAINT refinery_articles_pkey PRIMARY KEY (id);


--
-- Name: refinery_banners refinery_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_banners
    ADD CONSTRAINT refinery_banners_pkey PRIMARY KEY (id);


--
-- Name: refinery_blog_categories_blog_posts refinery_blog_categories_blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_categories_blog_posts
    ADD CONSTRAINT refinery_blog_categories_blog_posts_pkey PRIMARY KEY (id);


--
-- Name: refinery_blog_categories refinery_blog_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_categories
    ADD CONSTRAINT refinery_blog_categories_pkey PRIMARY KEY (id);


--
-- Name: refinery_blog_comments refinery_blog_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_comments
    ADD CONSTRAINT refinery_blog_comments_pkey PRIMARY KEY (id);


--
-- Name: refinery_blog_posts refinery_blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_blog_posts
    ADD CONSTRAINT refinery_blog_posts_pkey PRIMARY KEY (id);


--
-- Name: refinery_businesses refinery_businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_businesses
    ADD CONSTRAINT refinery_businesses_pkey PRIMARY KEY (id);


--
-- Name: refinery_carts refinery_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_carts
    ADD CONSTRAINT refinery_carts_pkey PRIMARY KEY (id);


--
-- Name: refinery_copywriting_phrase_translations refinery_copywriting_phrase_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_copywriting_phrase_translations
    ADD CONSTRAINT refinery_copywriting_phrase_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_copywriting_phrases refinery_copywriting_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_copywriting_phrases
    ADD CONSTRAINT refinery_copywriting_phrases_pkey PRIMARY KEY (id);


--
-- Name: refinery_customer_files refinery_customer_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_customer_files
    ADD CONSTRAINT refinery_customer_files_pkey PRIMARY KEY (id);


--
-- Name: refinery_customers refinery_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_customers
    ADD CONSTRAINT refinery_customers_pkey PRIMARY KEY (id);


--
-- Name: refinery_employers refinery_employers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_employers
    ADD CONSTRAINT refinery_employers_pkey PRIMARY KEY (id);


--
-- Name: refinery_faqs refinery_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_faqs
    ADD CONSTRAINT refinery_faqs_pkey PRIMARY KEY (id);


--
-- Name: refinery_images refinery_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_images
    ADD CONSTRAINT refinery_images_pkey PRIMARY KEY (id);


--
-- Name: refinery_inquiries_inquiries refinery_inquiries_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_inquiries_inquiries
    ADD CONSTRAINT refinery_inquiries_inquiries_pkey PRIMARY KEY (id);


--
-- Name: refinery_invoices refinery_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_invoices
    ADD CONSTRAINT refinery_invoices_pkey PRIMARY KEY (id);


--
-- Name: refinery_jobs refinery_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_jobs
    ADD CONSTRAINT refinery_jobs_pkey PRIMARY KEY (id);


--
-- Name: refinery_languages refinery_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_languages
    ADD CONSTRAINT refinery_languages_pkey PRIMARY KEY (id);


--
-- Name: refinery_line_items refinery_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_line_items
    ADD CONSTRAINT refinery_line_items_pkey PRIMARY KEY (id);


--
-- Name: refinery_messages refinery_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_messages
    ADD CONSTRAINT refinery_messages_pkey PRIMARY KEY (id);


--
-- Name: refinery_notifications refinery_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_notifications
    ADD CONSTRAINT refinery_notifications_pkey PRIMARY KEY (id);


--
-- Name: refinery_order_items refinery_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_order_items
    ADD CONSTRAINT refinery_order_items_pkey PRIMARY KEY (id);


--
-- Name: refinery_orders refinery_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_orders
    ADD CONSTRAINT refinery_orders_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_part_translations refinery_page_part_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_page_part_translations
    ADD CONSTRAINT refinery_page_part_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_parts refinery_page_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_page_parts
    ADD CONSTRAINT refinery_page_parts_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_translations refinery_page_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_page_translations
    ADD CONSTRAINT refinery_page_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_pages refinery_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_pages
    ADD CONSTRAINT refinery_pages_pkey PRIMARY KEY (id);


--
-- Name: refinery_plans refinery_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_plans
    ADD CONSTRAINT refinery_plans_pkey PRIMARY KEY (id);


--
-- Name: refinery_pods refinery_pods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_pods
    ADD CONSTRAINT refinery_pods_pkey PRIMARY KEY (id);


--
-- Name: refinery_portfolio_galleries refinery_portfolio_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_galleries
    ADD CONSTRAINT refinery_portfolio_galleries_pkey PRIMARY KEY (id);


--
-- Name: refinery_portfolio_gallery_translations refinery_portfolio_gallery_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_gallery_translations
    ADD CONSTRAINT refinery_portfolio_gallery_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_portfolio_item_translations refinery_portfolio_item_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_item_translations
    ADD CONSTRAINT refinery_portfolio_item_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_portfolio_items refinery_portfolio_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_portfolio_items
    ADD CONSTRAINT refinery_portfolio_items_pkey PRIMARY KEY (id);


--
-- Name: refinery_products refinery_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_products
    ADD CONSTRAINT refinery_products_pkey PRIMARY KEY (id);


--
-- Name: refinery_resources refinery_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_resources
    ADD CONSTRAINT refinery_resources_pkey PRIMARY KEY (id);


--
-- Name: refinery_roles refinery_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_roles
    ADD CONSTRAINT refinery_roles_pkey PRIMARY KEY (id);


--
-- Name: refinery_route_experiences refinery_route_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_route_experiences
    ADD CONSTRAINT refinery_route_experiences_pkey PRIMARY KEY (id);


--
-- Name: refinery_settings refinery_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_settings
    ADD CONSTRAINT refinery_settings_pkey PRIMARY KEY (id);


--
-- Name: refinery_subscriptions refinery_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_subscriptions
    ADD CONSTRAINT refinery_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: refinery_transactions refinery_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_transactions
    ADD CONSTRAINT refinery_transactions_pkey PRIMARY KEY (id);


--
-- Name: refinery_user_plugins refinery_user_plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_user_plugins
    ADD CONSTRAINT refinery_user_plugins_pkey PRIMARY KEY (id);


--
-- Name: refinery_users refinery_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_users
    ADD CONSTRAINT refinery_users_pkey PRIMARY KEY (id);


--
-- Name: refinery_videos refinery_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refinery_videos
    ADD CONSTRAINT refinery_videos_pkey PRIMARY KEY (id);


--
-- Name: route_experiences route_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_experiences
    ADD CONSTRAINT route_experiences_pkey PRIMARY KEY (id);


--
-- Name: seo_meta seo_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seo_meta
    ADD CONSTRAINT seo_meta_pkey PRIMARY KEY (id);


--
-- Name: subscription_transactions subscription_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_transactions
    ADD CONSTRAINT subscription_transactions_pkey PRIMARY KEY (id);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: trans_logs trans_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trans_logs
    ADD CONSTRAINT trans_logs_pkey PRIMARY KEY (id);


--
-- Name: index_2f72df747b84672dbcc6cb153c8031486c5de521; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_2f72df747b84672dbcc6cb153c8031486c5de521 ON public.refinery_portfolio_item_translations USING btree (refinery_portfolio_item_id);


--
-- Name: index_blog_categories_blog_posts_on_bc_and_bp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_blog_categories_blog_posts_on_bc_and_bp ON public.refinery_blog_categories_blog_posts USING btree (blog_category_id, blog_post_id);


--
-- Name: index_c8fbec01a288d0aef8ba987126084c4d06953304; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_c8fbec01a288d0aef8ba987126084c4d06953304 ON public.refinery_copywriting_phrase_translations USING btree (refinery_copywriting_phrase_id);


--
-- Name: index_copywriting_phrase_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_copywriting_phrase_translations_on_locale ON public.refinery_copywriting_phrase_translations USING btree (locale);


--
-- Name: index_copywriting_phrases_on_name_and_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_copywriting_phrases_on_name_and_scope ON public.refinery_copywriting_phrases USING btree (name, scope);


--
-- Name: index_d079468f88bff1c6ea81573a0d019ba8bf5c2902; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_d079468f88bff1c6ea81573a0d019ba8bf5c2902 ON public.refinery_page_translations USING btree (refinery_page_id);


--
-- Name: index_dacf6685c3221de568049c599f2a69d1c1f9dd25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dacf6685c3221de568049c599f2a69d1c1f9dd25 ON public.refinery_portfolio_gallery_translations USING btree (refinery_portfolio_gallery_id);


--
-- Name: index_f9716c4215584edbca2557e32706a5ae084a15ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_f9716c4215584edbca2557e32706a5ae084a15ef ON public.refinery_page_part_translations USING btree (refinery_page_part_id);


--
-- Name: index_refinery_airlines_customers_on_airline_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_airlines_customers_on_airline_id ON public.refinery_airlines_customers USING btree (airline_id);


--
-- Name: index_refinery_airlines_customers_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_airlines_customers_on_customer_id ON public.refinery_airlines_customers USING btree (customer_id);


--
-- Name: index_refinery_airlines_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_refinery_airlines_on_email ON public.refinery_airlines USING btree (email);


--
-- Name: index_refinery_airlines_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_refinery_airlines_on_reset_password_token ON public.refinery_airlines USING btree (reset_password_token);


--
-- Name: index_refinery_banners_pages_on_banner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_banners_pages_on_banner_id ON public.refinery_banners_pages USING btree (banner_id);


--
-- Name: index_refinery_banners_pages_on_page_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_banners_pages_on_page_id ON public.refinery_banners_pages USING btree (page_id);


--
-- Name: index_refinery_blog_categories_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_blog_categories_on_id ON public.refinery_blog_categories USING btree (id);


--
-- Name: index_refinery_blog_categories_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_blog_categories_on_slug ON public.refinery_blog_categories USING btree (slug);


--
-- Name: index_refinery_blog_comments_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_blog_comments_on_id ON public.refinery_blog_comments USING btree (id);


--
-- Name: index_refinery_blog_posts_on_access_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_blog_posts_on_access_count ON public.refinery_blog_posts USING btree (access_count);


--
-- Name: index_refinery_blog_posts_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_blog_posts_on_id ON public.refinery_blog_posts USING btree (id);


--
-- Name: index_refinery_blog_posts_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_blog_posts_on_slug ON public.refinery_blog_posts USING btree (slug);


--
-- Name: index_refinery_customers_languages_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_customers_languages_on_customer_id ON public.refinery_customers_languages USING btree (customer_id);


--
-- Name: index_refinery_customers_languages_on_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_customers_languages_on_language_id ON public.refinery_customers_languages USING btree (language_id);


--
-- Name: index_refinery_customers_on_confirmation_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_refinery_customers_on_confirmation_token ON public.refinery_customers USING btree (confirmation_token);


--
-- Name: index_refinery_customers_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_refinery_customers_on_email ON public.refinery_customers USING btree (email);


--
-- Name: index_refinery_customers_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_refinery_customers_on_reset_password_token ON public.refinery_customers USING btree (reset_password_token);


--
-- Name: index_refinery_customers_routes_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_customers_routes_on_customer_id ON public.refinery_customers_routes USING btree (customer_id);


--
-- Name: index_refinery_customers_routes_on_route_experience_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_customers_routes_on_route_experience_id ON public.refinery_customers_routes USING btree (route_experience_id);


--
-- Name: index_refinery_inquiries_inquiries_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_inquiries_inquiries_on_id ON public.refinery_inquiries_inquiries USING btree (id);


--
-- Name: index_refinery_page_part_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_page_part_translations_on_locale ON public.refinery_page_part_translations USING btree (locale);


--
-- Name: index_refinery_page_parts_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_page_parts_on_id ON public.refinery_page_parts USING btree (id);


--
-- Name: index_refinery_page_parts_on_refinery_page_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_page_parts_on_refinery_page_id ON public.refinery_page_parts USING btree (refinery_page_id);


--
-- Name: index_refinery_page_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_page_translations_on_locale ON public.refinery_page_translations USING btree (locale);


--
-- Name: index_refinery_pages_on_depth; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_on_depth ON public.refinery_pages USING btree (depth);


--
-- Name: index_refinery_pages_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_on_id ON public.refinery_pages USING btree (id);


--
-- Name: index_refinery_pages_on_lft; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_on_lft ON public.refinery_pages USING btree (lft);


--
-- Name: index_refinery_pages_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_on_parent_id ON public.refinery_pages USING btree (parent_id);


--
-- Name: index_refinery_pages_on_rgt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_on_rgt ON public.refinery_pages USING btree (rgt);


--
-- Name: index_refinery_pages_pods_on_page_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_pods_on_page_id ON public.refinery_pages_pods USING btree (page_id);


--
-- Name: index_refinery_pages_pods_on_pod_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pages_pods_on_pod_id ON public.refinery_pages_pods USING btree (pod_id);


--
-- Name: index_refinery_pods_on_image_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pods_on_image_id ON public.refinery_pods USING btree (image_id);


--
-- Name: index_refinery_pods_on_pod_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pods_on_pod_type ON public.refinery_pods USING btree (pod_type);


--
-- Name: index_refinery_pods_on_portfolio_entry_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pods_on_portfolio_entry_id ON public.refinery_pods USING btree (portfolio_entry_id);


--
-- Name: index_refinery_pods_on_video_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_pods_on_video_id ON public.refinery_pods USING btree (video_id);


--
-- Name: index_refinery_portfolio_gallery_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_portfolio_gallery_translations_on_locale ON public.refinery_portfolio_gallery_translations USING btree (locale);


--
-- Name: index_refinery_portfolio_item_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_portfolio_item_translations_on_locale ON public.refinery_portfolio_item_translations USING btree (locale);


--
-- Name: index_refinery_roles_users_on_role_id_and_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_roles_users_on_role_id_and_user_id ON public.refinery_roles_users USING btree (role_id, user_id);


--
-- Name: index_refinery_roles_users_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_roles_users_on_user_id_and_role_id ON public.refinery_roles_users USING btree (user_id, role_id);


--
-- Name: index_refinery_settings_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_settings_on_name ON public.refinery_settings USING btree (name);


--
-- Name: index_refinery_user_plugins_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_user_plugins_on_name ON public.refinery_user_plugins USING btree (name);


--
-- Name: index_refinery_user_plugins_on_user_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_refinery_user_plugins_on_user_id_and_name ON public.refinery_user_plugins USING btree (user_id, name);


--
-- Name: index_refinery_users_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refinery_users_on_id ON public.refinery_users USING btree (id);


--
-- Name: index_seo_meta_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_seo_meta_on_id ON public.seo_meta USING btree (id);


--
-- Name: index_seo_meta_on_seo_meta_id_and_seo_meta_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_seo_meta_on_seo_meta_id_and_seo_meta_type ON public.seo_meta USING btree (seo_meta_id, seo_meta_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

