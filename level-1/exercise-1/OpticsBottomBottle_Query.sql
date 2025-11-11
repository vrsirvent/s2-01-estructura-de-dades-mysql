-- Llista el total de compres d’un client/a.
SELECT customer.name AS customer_Name, SUM(saledetails.quantity * saledetails.unit_price) AS total_purchase
FROM customer
JOIN saleheader ON customer.id_customer = saleheader.id_customer
JOIN saledetails ON saleheader.id_sale = saledetails.id_sale
WHERE customer.name = 'Juan Garcia'
GROUP BY customer.id_customer
ORDER BY total_purchase DESC;


-- Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT employee.name AS employee_name, glasses.id_glasses, glasses.frame_type,
		glasses.frame_color, glasses.price, SUM(saledetails.quantity) AS total_sold
FROM employee
JOIN saleheader ON employee.id_employee = saleheader.id_employee
JOIN saledetails ON saleheader.id_sale = saledetails.id_sale
JOIN glasses ON saledetails.id_glasses = glasses.id_glasses
WHERE employee.name = 'Benito' AND saleheader.sale_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY glasses.id_glasses
ORDER BY total_sold DESC;


-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT supplier.id_supplier, supplier.name
FROM supplier
JOIN glassesbrand ON supplier.id_supplier = glassesbrand.id_suplier
JOIN glasses ON glassesbrand.id_brand = glasses.id_brand
JOIN saledetails ON glasses.id_glasses = saledetails.id_glasses
WHERE saledetails.quantity > 0;



