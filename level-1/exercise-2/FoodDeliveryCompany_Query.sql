-- Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat.	
SELECT SUM(orderproduct.quantity) AS total_drinks_sold 
FROM orderproduct 
JOIN product ON orderproduct.id_product = product.id_product 
JOIN `order` ON orderproduct.id_order = `order`.id_order 
JOIN customer ON `order`.id_customer = customer.id_customer 
WHERE product.type = 'Drink' AND customer.city = 'Barcelona';


-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT COUNT(`order`.id_order) AS total_orders
FROM `order`
JOIN delivery ON `order`.id_order = delivery.id_order
WHERE delivery.id_employee = 1;


