# S2-01-estructura_de_dades_mysql
**Description** MySQL data structure
Level 1 - Exercise 2

# (Pizzeria) FoodDeliveryCompany 

You have been hired to design a website that allows users to order food delivery online.

Keep the following guidelines in mind when modeling the project database:

For each customer, we store a unique identifier: first name, last name, address, zip code, city, state, and phone number.
A person can place multiple orders, but a single order can only be placed by one person. For each order, we store a 
unique identifier: date/time, whether the order is for home delivery or store pickup, the quantity of products selected 
for each type, and the total price. An order can consist of one or more products.

The products can be pizzas, hamburgers, and drinks. For each product, we store a unique identifier: name, description, image, price.

In the case of pizzas, there are several categories that may change names throughout the year. A pizza can only be in one category, 
but a category can have many pizzas. A unique identifier and a name are stored for each category. An order is managed by a single store, 
and a store can manage many orders. A unique identifier is stored for each store: address, zip code, city, province.

Many employees can work in a store, and an employee can only work in one store. A unique identifier is stored for each employee: first name, 
last name, tax ID number, phone number. Whether they work as a cook or delivery person. For home delivery orders, it is important to record 
who the delivery person is and the date/time of delivery.


# Table Descriptions
The database schemas are separated from left to right by name, type, and description.

### Customer 
|----------------|---------------|-------------------------------------| 
| `id_customer`  | INT           | Unique identifier (PK)              | 
| `first_name`   | VARCHAR(100)  | Customer first name                 | 
| `last_name`    | VARCHAR(100)  | Customer last name                  | 
| `addr_postal`  | VARCHAR(222)  | Full address                        | 
| `postal_code`  | VARCHAR(12)   | Postal code                         | 
| `city`         | VARCHAR(40)   | City                                | 
| `county`       | VARCHAR(40)   | County (In Spain, it's a province)  | 
| `num_phone`    | VARCHAR(12)   | Phone number                        | 

### Store 
|----------------|---------------|--------------------------------------------| 
| `id_store`     | INT           | Unique identifier (PK)                     | 
| `addr_postal`  | VARCHAR(222)  | Full address                               | 
| `postal_Code`  | VARCHAR(12)   | Postal code                                | 
| `city`         | VARCHAR(40)   | City                                       | 
| `county`       | VARCHAR(40)   | County County (In Spain, it's a province)  | 

### Employee 
|----------------|---------------|------------------------------------------------| 
| `id_employee`  | INT           | Unique identifier (PK)                         | 
| `id_store`     | INT           | Foreign key referenced to the Store table (FK) | 
| `first_name`   | VARCHAR(100)  | Employee first name                            | 
| `last_name`    | VARCHAR(100)  | Employee last name                             | 
| `nif`          | VARCHAR(20)   | Tax Identification                             | 
| `num_phone`    | VARCHAR(15)   | Phone number                                   | 
| `role`         | ENUM          | Employee role (Cook or Delivery)               | 

### Delivery 
|----------------------|-----------|----------------------------------------------------|
| `id_delivery`        | INT       | Unique identifier (PK)                             |
| `id_order`           | INT       | Delivered order (only if it's home delivery) (FK)  |
| `id_employee`        | INT       | Delivery employee who makes the delivery. (FK)     |
| `delivery_datetime`  | DATETIME  | Date and time of the delivery                      |

### Order 
|-----------------------|-----------|----------------------------------------------------| 
| `id_order`            | INT       | Unique identifier (PK)                             |
| `id_customer`         | INT       | Foreign key referenced to the Customer table (FK)  |
| `id_store`            | INT       | Foreign key referenced to the Store table (FK)     | 
| `date_time`           | DATETIME  | Date and time of order                             | 
| `delivery_type`       | ENUM      | Order type (Home delivery or Store pickup)         |
| `total_price`         | FLOAT     | Total price                                        | 

### OrderProduct 
|----------------|--------|---------------------------------------------------------------------------|
| `id_order`     | INT    | Unique identifier (PK). Foreign key referenced to the Order table (FK)    |
| `id_product`   | INT    | Unique identifier (PK). Foreign key referenced to the Product table (FK)  |
| `quantity`     | INT    | Quantity of the product in the order.                                     |

### Product 
|----------------|---------------|---------------------------------------------------------| 
| `id_product`   | INT           | Unique identifier (PK)                                  | 
| `id_category`  | INT           | Foreign key referenced to the PizzaCategory table (FK)  | 
| `name`         | VARCHAR(100)  | Product name                                            | 
| `description`  | TEXT          | Product description                                     | 
| `image`        | VARCHAR(444)  | URL or path to the product's image                      | 
| `unit_price`   | FLOAT         | Product unit price                                      | 
| `type`         | ENUM          | Product type (Pizza, Burger and Drink)                  | 

### PizzaCategory 
|----------------|---------------|-------------------------| 
| `id_category`  | INT           | Unique identifier (PK)  | 
| `name`         | VARCHAR(100)  | Category name           | 


## Table Relationships

### Customer to Order (id_customer `1:N`) 
Each order belongs to a single customer, and a customer can place many orders.

### Store to Order (id_store `1:N`) 
Each order is managed by one store, and a store can manage many orders.

### Store to Employee (id_store `1:N`) 
Each employee works in one store, and a store can have many employees. 

### Employee to Delivery (id_employee `1:N`) 
Each delivery is assigned to one employee, and a delivery employee can complete many deliveries.

### Order to Delivery (id_order `1:1`) 
The delivery is linked to the order, and each home delivery order has one delivery.

### Order to Product (id_order, id_product `N:M`) 
An order can include many products, and a product can be in many orders.
Managed via the OrderProduct table.

### PizzaCategory to Product (id_category `1:N`) 
Only pizza products can belong to a category.


# Technologies 

- MySQL server
- phpMyAdmin
- MySQL Workbench (software used to manage the schema of this database)


