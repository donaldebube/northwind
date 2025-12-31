-- -----------------------------------------------------
-- Table `northwind`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.customer`
(
id	NUMBER,
company	STRING,
last_name	STRING,
first_name	STRING,
email_address	STRING,
job_title	STRING,
business_phone	STRING,
home_phone	STRING,
mobile_phone	STRING,
fax_number	STRING,
address	STRING,
city	STRING,
state_province	STRING,
zip_postal_code	STRING,
country_region	STRING,
web_page	STRING,
notes	STRING,
attachments	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.employees`
(
id	NUMBER,
company	STRING,
last_name	STRING,
first_name	STRING,
email_address	STRING,
job_title	STRING,
business_phone	STRING,
home_phone	STRING,
mobile_phone	STRING,
fax_number	STRING,
address	STRING,
city	STRING,
state_province	STRING,
zip_postal_code	STRING,
country_region	STRING,
web_page	STRING,
notes	STRING,
attachments	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`privileges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.privileges`
(
id	NUMBER,
privilege_name	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`employee_privileges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.employee_privileges`
(
employee_id	NUMBER,
privilege_id	NUMBER
)
;
-- -----------------------------------------------------
-- Table `northwind`.`inventory_transaction_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.inventory_transaction_types`
(
id	NUMBER,
type_name	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`shippers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.shippers`
(
id	NUMBER,
company	STRING,
last_name	STRING,
first_name	STRING,
email_address	STRING,
job_title	STRING,
business_phone	STRING,
home_phone	STRING,
mobile_phone	STRING,
fax_number	STRING,
address	STRING,
city	STRING,
state_province	STRING,
zip_postal_code	STRING,
country_region	STRING,
web_page	STRING,
notes	STRING,
attachments	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`orders_tax_status`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `dl_northwind.orders_tax_status`
(
id	NUMBER,
tax_status_name	STRING
)
;

-- -----------------------------------------------------
-- Table `northwind`.`orders_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.orders_status`
(
id	NUMBER,
status_name	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.orders`
(
id	NUMBER,
employee_id	NUMBER,
customer_id	NUMBER,
order_date	DATETIME,
shipped_date	DATETIME,
shipper_id	NUMBER,
ship_name	STRING,
ship_address	STRING,
ship_city	STRING,
ship_state_province	STRING,
ship_zip_postal_code	STRING,
ship_country_region	STRING,
shipping_fee	FLOAT,
taxes	FLOAT,
payment_type	STRING,
paid_date	DATETIME,
notes	STRING,
tax_rate	FLOAT,
tax_status_id	NUMBER,
status_id	NUMBER
)
;
-- -----------------------------------------------------
-- Table `northwind`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.products`
(
supplier_ids	STRING,
id	NUMBER,
product_code	STRING,
product_name	STRING,
description	STRING,
standard_cost	FLOAT,
list_price	FLOAT,
reorder_level	NUMBER,
target_level	NUMBER,
quantity_per_unit	STRING,
discontinued	NUMBER,
minimum_reorder_quantity	NUMBER,
category	STRING,
attachments	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`purchase_order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.purchase_order_status`
(
id	NUMBER,
status	STRING
)
;

-- -----------------------------------------------------
-- Table `northwind`.`suppliers`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `dl_northwind.suppliers`
(
id	NUMBER,
company	STRING,
last_name	STRING,
first_name	STRING,
email_address	STRING,
job_title	STRING,
business_phone	STRING,
home_phone	STRING,
mobile_phone	STRING,
fax_number	STRING,
address	STRING,
city	STRING,
state_province	STRING,
zip_postal_code	STRING,
country_region	STRING,
web_page	STRING,
notes	STRING,
attachments	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`purchase_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.purchase_orders`
(
id	NUMBER,
supplier_id	NUMBER,
created_by	NUMBER,
submitted_date	DATETIME,
creation_date	DATETIME,
status_id	NUMBER,
expected_date	DATETIME,
shipping_fee	FLOAT,
taxes	FLOAT,
payment_date	DATETIME,
payment_amount	FLOAT,
payment_method	STRING,
notes	STRING,
approved_by	NUMBER,
approved_date	DATETIME,
submitted_by	NUMBER
)
;
-- -----------------------------------------------------
-- Table `northwind`.`inventory_transactions`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `dl_northwind.inventory_transactions`
(
id	NUMBER,
transaction_type	NUMBER,
transaction_created_date	DATETIME,
transaction_modified_date	DATETIME,
product_id	NUMBER,
quantity	NUMBER,
purchase_order_id	NUMBER,
customer_order_id	NUMBER,
comments	STRING
)
;

-- -----------------------------------------------------
-- Table `northwind`.`invoices`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `dl_northwind.invoices`
(
id	NUMBER,
order_id	NUMBER,
invoice_date	DATETIME,
due_date	DATETIME,
tax	FLOAT,
shipping	FLOAT,
amount_due	FLOAT
)
;
-- -----------------------------------------------------
-- Table `northwind`.`order_details_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.order_details_status`
(
id	NUMBER,
status	STRING
)
;
-- -----------------------------------------------------
-- Table `northwind`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.order_details`
(
id	NUMBER,
order_id	NUMBER,
product_id	NUMBER,
quantity	FLOAT,
unit_price	FLOAT,
discount	FLOAT,
status_id	NUMBER,
date_allocated	DATETIME,
purchase_order_id	NUMBER,
inventory_id	NUMBER
)
;
-- -----------------------------------------------------
-- Table `northwind`.`purchase_order_details`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `dl_northwind.purchase_order_details`
(
id	NUMBER,
purchase_order_id	NUMBER,
product_id	NUMBER,
quantity	FLOAT,
unit_cost	FLOAT,
date_received	DATETIME,
posted_to_inventory	NUMBER,
inventory_id	NUMBER
)
;


-- -----------------------------------------------------
-- Table `northwind`.`sales_reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dl_northwind.sales_reports` (
  group_by STRING,
  display STRING,
  title STRING,
  filter_row_source STRING,
  `default` STRING
)
;



CREATE TABLE IF NOT EXISTS `dl_northwind.strings`
(
string_id NUMBER,
string_data STRING
)
;


/*
dl_northwind = raw data above script 
stg_northwind = select * from dl 
dwh_northwind = dim and fact star schema 
dm_northwind = one big table 

*/