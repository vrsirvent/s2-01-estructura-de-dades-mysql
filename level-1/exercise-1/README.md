# S2-01-estructura_de_dades_mysql
**Description** MySQL data structure
Level 1 - Exercise 1

# (Òptica) OpticsBottomBottle 

An optics, called “Cul d’Ampolla”, wants to computerize the management of customers and glasses sales.

First of all, optics wants to know which is the supplier of each of the glasses. Specifically, you want to know from 
each supplier: The name, the address (street, number, floor, door, city, postal code and country), telephone, fax, NIF.

The optics purchasing policy is based on the fact that the glasses of a brand will be bought from a single supplier 
(thus you can get better prices), but you can buy glasses of several brands from a supplier. From the glasses 
you want to know: The brand, the graduation of each of the glasses, the type of mount (floating, pasta or metal), 
the color of the mount, the color of each glass, the price.

From customers you want to store: The name, the postal address, the telephone number, the email, the registration date.
When a new customer arrives, store the customer who has recommended the establishment (as long as someone has 
recommended it). Our system must indicate who has been the employee who has sold each goggle. Defines a sales time period.

/exercise-1
    |
    ├── OpticsBottomBottle_Query.sql    # Query file.sql
    ├── OpticsBottomBottle.sql          # Schema OpticsBottomBottle file.sql
    └── OpticsBottomBottle.png          # EER Diagram file.png (image)
    └── README.md                       # Exercise documentation     

# Table Descriptions
The database schemas are separated from left to right by name, type, and description.

### Supplier
|---------------|--------------|---------------------|
| `id_supplier` | INT          | Unique identifier   |
| `name`        | VARCHAR(100) | Supplier name       |
| `addr_street` | VARCHAR(75)  | Street              |
| `addr_number` | VARCHAR(12)  | Number              |
| `addr_floor`  | VARCHAR(12)  | Floor               |
| `addr_door`   | VARCHAR(12)  | Door                |
| `city`        | VARCHAR(40)  | City                |
| `postal_code` | VARCHAR(12)  | Postal code         |
| `country`     | VARCHAR(40)  | Country             |
| `num_phone`   | VARCHAR(15)  | Phone number        |
| `num_fax`     | VARCHAR(15)  | FAX number          |
| `tax_code`    | VARCHAR(25)  | Tax code            |

### Customer
|---------------------|--------------|--------------------------------------------------------------------|
| `id_customer`       | INT          | Unique identifier                                                  |
| `name`              | VARCHAR(100) | Customer name                                                      |
| `addr_postal`       | VARCHAR(150) | Postal address                                                     |
| `num_phone`         | VARCHAR(15)  | Phone number                                                       |
| `email`             | VARCHAR(75)  | email                                                              |
| `registration_date` | DATE         | Registration date                                                  |
| `id_referred`       | INT          | Identifier of a customer of the “recommender” optician (optional)  |

- NOTE: The `id_referred` attribute of the `Customer` entity will be an existing `id_customer` attribute, 
        which is already registered with the optical company.

### GlassesBrand
| `id_brand`   | INT          | Unique identifier                                  |
| `name`       | VARCHAR(100) | Brand name                                         |
| `id_suplier` | INT          | Foreign key referenced to the supplier table (FK)  |

### Glasses
|---------------------------|--------------|-------------------------------------------|
| `id_glasses`              | INT          | Unique identifier                         |
| `id_brand`                | INT          | Eyeglass brand identifier                 |
| `prescription_right_lens` | FLOAT        | Right lens prescription                   |
| `prescription_left_lens`  | FLOAT        | Left lens prescription                    |
| `frame_type`              | ENUM         | Frame type (metallic, plastic, floating)  |
| `frame_color`             | VARCHAR(40)  | Frame color                               |
| `color_right_lens`        | VARCHAR(40)  | Right lens color                          |
| `color_left_lens`         | VARCHAR(40)  | Left lens color                           |
| `price`                   | FLOAT        | Unit price                                |

### Employee
|---------------|--------------|--------------------|
| `id_employee` | INT          | Unique identifier  |
| `name`        | VARCHAR(100) | Employee name      |

### SaleHeader
|-----------------|--------------|----------------------------------------------|
| `id_sale`       | INT          | Unique identifier                            |
| `id_customer`   | INT          | Customer identifier from the customer table  |
| `id_employee`   | INT          | Employee identifier from the employee table  |
| `sale_date`     | DATE         | Sale date                                    |
| `sale_period`   | VARCHAR(45)  | Sale period                                  |

- NOTE: The `sale_period` attribute of the `SaleHeader` entity, because it is not clear to me if it is a date.
        I have assigned it the `VARCHAR()` type, to indicate, for example: Sales, Black Friday, etc. 

### SaleDetails
|----------------|---------|--------------------------------------------------|
| `id_detail`    | INT     | Unique identifier                                |
| `id_sale`      | INT     | Sale identifier from the SaleHeader table        |
| `id_glasses`   | INT     | Identifier for the glasses in the table Glasses  |
| `quantity`     | INT     | Quantity                                         |
| `unit_price`   | FLOAT   | Unit price                                       |


# Table Relationships

### Supplier to GlassesBrand (id_suplier `1:N`) 
Each eyewear brand is associated with a single supplier, and a supplier may have multiple brands.

### GlassesBrand to Glasses (id_brand `1:N`) 
Each type of glasses must belong to a brand of glasses, and a brand can have several types of glasses.

### Customer to SaleHeader (id_customer `1:N`) 
A customer can make multiple sales.

### Employee to SaleHeader (id_employee `1:N`) 
An employee can manage multiple sales.

### SaleHeader to SaleDetails (id_sale `1:N`) 
Each sales header can have multiple sales lines, representing different items.

### SaleDetails to Glasses (id_glasses `N:1`) 
Each detail or sales line refers to a specific type of glasses and may include several pairs of glasses per sale.


# Technologies 

- MySQL server
- phpMyAdmin
- MySQL Workbench (software used to manage the schema of this database)



