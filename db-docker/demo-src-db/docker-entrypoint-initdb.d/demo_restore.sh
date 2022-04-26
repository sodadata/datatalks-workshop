#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  <<-EOF

    create table country
    (
        id    integer,
        code2 varchar,
        code3 varchar
    );

    INSERT INTO country (id, code2, code3) VALUES (1, 'BE', 'BEL');
    INSERT INTO country (id, code2, code3) VALUES (2, 'NL', 'NED');
    INSERT INTO country (id, code2, code3) VALUES (3, 'US', 'USA');


    create table customers
    (
        id         varchar(255),
        size       double precision,
        sizetxt    varchar(255),
        distance   integer,
        pct        varchar(255),
        cat        varchar(255),
        country    varchar(255),
        zip        varchar(255),
        email      varchar(255),
        date       date,
        ts         timestamp,
        ts_with_tz timestamp with time zone
    );
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID1', 1, '1', 0, '- 28,42 %', 'HIGH', 'BE', '2360', 'john.doe@example.com', '2020-06-23', '2020-06-23 00:00:10.000000', '2020-06-23 00:00:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID2', 0.5, '.5', -999, '+22,75 %', 'HIGH', 'BE', '2361', 'JOE.SMOE@EXAMPLE.COM', '2020-06-23', '2020-06-23 00:01:10.000000', '2020-06-23 00:01:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID3', -1.2, '-1.2', 5, '.92 %', 'MEDIUM', 'BE', '2362', 'john.doe@example.com', '2020-06-23', '2020-06-23 00:02:10.000000', '2020-06-23 00:02:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID4', -0.4, '-.4', 10, '0.26 %', 'LOW', 'BE', '2363', 'john.doe@example.com', '2020-06-23', '2020-06-23 00:03:10.000000', '2020-06-23 00:03:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID5', -3, '-3', 999, '18,32%', null, 'BE', '2364', 'invalid@email', '2020-06-23', '2020-06-23 00:04:10.000000', '2020-06-23 00:04:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID6', 5, '5', 999, '18,32%', null, 'BE', '2365', null, '2020-06-23', '2020-06-23 00:05:10.000000', '2020-06-23 00:05:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID7', 6, '6', 999, 'error', null, 'NL', '2360', null, '2020-06-24', '2020-06-24 00:01:10.000000', '2020-06-24 00:01:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID8', null, null, 999, 'No value', null, 'NL', '2361', null, '2020-06-24', '2020-06-24 00:02:10.000000', '2020-06-24 00:02:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES ('ID9', null, null, 999, 'N/A', null, 'NL', '2362', null, '2020-06-24', '2020-06-24 00:03:10.000000', '2020-06-24 00:03:10.000000 +00:00');
    INSERT INTO customers (id, size, sizetxt, distance, pct, cat, country, zip, email, date, ts, ts_with_tz) VALUES (null, null, null, null, null, 'HIGH', 'NL', '2363', null, '2020-06-24', '2020-06-24 00:04:10.000000', '2020-06-24 00:04:10.000000 +00:00');

    create table orders
    (
        id               varchar(255),
        customer_id_nok  varchar(255),
        customer_id_ok   varchar(255),
        customer_country varchar(255),
        customer_zip     varchar(255),
        text             varchar(255),
        date             date,
        created_at       timestamp
    );

    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES ('O2', 'ID99', 'ID1', 'BE', '2360', 'two', '2022-02-10', '2022-02-24 11:25:31.000000');
    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES ('O3', 'ID1', 'ID2', 'BE', '2000', 'three', '2022-02-10', '2022-02-24 11:25:37.000000');
    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES ('O4', null, 'ID1', 'BE', null, 'four', '2022-02-10', '2022-02-24 12:25:39.000000');
    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES ('O1', 'ID1', 'ID1', 'BE', '2360', 'one', '2022-02-10', '2022-02-24 05:25:11.000000');
    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES (null, null, 'ID3', null, null, 'seven', '2022-02-10', '2022-02-24 16:25:52.000000');
    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES ('O5', 'ID98', 'ID4', null, '2360', 'five', '2022-02-10', '2022-02-24 13:25:44.000000');
    INSERT INTO orders (id, customer_id_nok, customer_id_ok, customer_country, customer_zip, text, date, created_at) VALUES ('O6', 'ID99', 'ID1', 'UK', '2360', 'six', '2022-02-10', '2022-02-24 15:25:48.000000');

    create table zip_codes
    (
        country varchar(255),
        zip     varchar(255)
    );
    INSERT INTO zip_codes (country, zip) VALUES ('BE', '2364');
    INSERT INTO zip_codes (country, zip) VALUES ('NL', '2361');
    INSERT INTO zip_codes (country, zip) VALUES ('BE', '2362');
    INSERT INTO zip_codes (country, zip) VALUES ('BE', '2360');
    INSERT INTO zip_codes (country, zip) VALUES ('NL', '2363');
    INSERT INTO zip_codes (country, zip) VALUES ('BE', '2365');
    INSERT INTO zip_codes (country, zip) VALUES ('BE', '2361');
    INSERT INTO zip_codes (country, zip) VALUES ('BE', '2363');
    INSERT INTO zip_codes (country, zip) VALUES ('NL', '2360');
    INSERT INTO zip_codes (country, zip) VALUES ('NL', '2362');

EOF
