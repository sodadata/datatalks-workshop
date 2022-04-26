#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  <<-EOF

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


EOF
