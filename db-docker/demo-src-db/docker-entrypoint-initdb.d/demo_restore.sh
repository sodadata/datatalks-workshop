#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  <<-EOF

	CREATE TABLE account(
		account_key int PRIMARY KEY NOT NULL,
		parent_account_key int NULL,
		account_code_alternate_key int NULL,
		parent_account_code_alternate_key int NULL,
		account_description varchar(50) NULL,
		account_type varchar(50) NULL,
		operator varchar(50) NULL,
		custom_members varchar(300) NULL,
		value_type varchar(50) NULL,
		custom_member_options varchar(200) NULL
	) ;


	CREATE TABLE customer(
		customer_key int PRIMARY KEY NOT NULL,
		geography_key int NULL,
		customer_alternate_key varchar(15) NOT NULL,
		title varchar(8) NULL,
		first_name varchar(50) NULL,
		middle_name varchar(50) NULL,
		last_name varchar(50) NULL,
		name_style bit NULL,
		birth_date date NULL,
		marital_status nchar(1) NULL,
		suffix varchar(10) NULL,
		gender varchar(1) NULL,
		email_address varchar(50) NULL,
		yearly_income money NULL,
		total_children int NULL,
		number_children_at_home int NULL,
		english_education varchar(40) NULL,
		spanish_education varchar(40) NULL,
		french_education varchar(40) NULL,
		english_occupation varchar(100) NULL,
		spanish_occupation varchar(100) NULL,
		french_occupation varchar(100) NULL,
		house_owner_flag nchar(1) NULL,
		number_cars_owned int NULL,
		address_line1 varchar(120) NULL,
		address_line2 varchar(120) NULL,
		phone varchar(20) NULL,
		date_first_purchase date NULL,
		commute_distance varchar(15) NULL
	) ;

	CREATE TABLE organization(
		organization_key int PRIMARY KEY NOT NULL,
		parent_organization_key int NULL,
		percentage_of_ownership varchar(16) NULL,
		organization_name varchar(50) NULL,
		currency_key int NULL
	) ;

	CREATE TABLE product(
		product_key int PRIMARY KEY NOT NULL,
		product_alternate_key varchar(25) NULL,
		product_subcategory_key int NULL,
		weight_unit_measure_code nchar(3) NULL,
		size_unit_measure_code nchar(3) NULL,
		english_product_name varchar(100) NOT NULL,
		spanish_product_name varchar(100) NULL,
		french_product_name varchar(100) NULL,
		standard_cost money NULL,
		finished_goods_flag bit NOT NULL,
		color varchar(15) NOT NULL,
		safety_stock_level smallint NULL,
		reorder_point smallint NULL,
		list_price money NULL,
		size varchar(50) NULL,
		size_range varchar(50) NULL,
		weight float NULL,
		days_to_manufacture int NULL,
		product_line nchar(2) NULL,
		dealer_price money NULL,
		class nchar(2) NULL,
		style nchar(2) NULL,
		model_name varchar(50) NULL,
		large_photo BYTEA NULL,
		english_description text NULL,
		french_description text NULL,
		chinese_description text NULL,
		arabic_description text NULL,
		hebrew_description text NULL,
		thai_description text NULL,
		german_description text NULL,
		japanese_description text NULL,
		turkish_description text NULL,
		start_date timestamp NULL,
		end_date timestamp NULL,
		status varchar(7) NULL
	)

EOF
