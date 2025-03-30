SELECT COUNT(DISTINCT player.Player_ID) AS number_of_players FROM player JOIN club ON player.Club_ID = club.Club_ID;
SELECT COUNT(DISTINCT player.Player_ID) AS Player_Count FROM player JOIN club ON player.Club_ID = club.Club_ID;
SELECT DISTINCT T1.Club_Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Club_Name ASC;
SELECT DISTINCT Name FROM club ORDER BY Name ASC
SELECT M.Name, C.Name FROM club AS C JOIN player AS P ON C.Club_ID = P.Club_ID JOIN manager AS M ON P.Manager_ID = M.Manager_ID WHERE M.Manager_ID IS NOT NULL AND C.Club_ID IS NOT NULL;
SELECT T1.Manager, T1.Captain FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manufacturer != 'Nike'
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings = (SELECT MIN(Earnings) FROM player)
SELECT DISTINCT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1200000;
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1200000 GROUP BY T1.Country
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 GROUP BY T1.Club_ID ORDER BY SUM(T1.Earnings) DESC LIMIT 1
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 GROUP BY T1.Country ORDER BY COUNT(T1.Wins_count) DESC LIMIT 1
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT p.Name, c.Name FROM player AS p JOIN club AS c ON p.Club_ID = c.Club_ID
SELECT c.Name FROM club AS c JOIN player AS p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID HAVING COUNT(p.Wins_count) > 2;
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE Wins_count > 2
SELECT DISTINCT player.name FROM player JOIN club ON player.Club_ID = club.Club_ID JOIN player ON player.Player_ID = club.Manager JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce';
SELECT DISTINCT player.name FROM player JOIN club ON player.Club_ID = club.Club_ID JOIN player ON player.Player_ID = club.Manager WHERE club.Manager = 'Sam Allardyce';
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T1.Earnings) DESC
SELECT c.Name, AVG(p.Earnings) as Average_Earnings FROM club AS c JOIN player AS p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY Average_Earnings DESC;
SELECT DISTINCT T1.manufacturer, COUNT(T1.Club_ID) FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.manufacturer
SELECT manufacturer, COUNT(*) FROM club GROUP BY manufacturer
SELECT T1.manufacturer FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY COUNT(T1.Club_ID) DESC LIMIT 1
SELECT T1.manufacturer FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY COUNT(T1.Club_ID) DESC LIMIT 1
SELECT DISTINCT T1.manufacturer FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID HAVING COUNT(T2.Player_ID) > 1
SELECT T1.manufacturer, COUNT(T1.club_id) FROM club AS T1 JOIN player AS T2 ON T1.club_id = T2.club_id GROUP BY T1.manufacturer HAVING COUNT(T1.club_id) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country, COUNT(*) FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT DISTINCT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Club_ID IS NULL;
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count = 0
SELECT T1.Country, MAX(T2.Earnings) AS Max_Earnings FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 AND T1.Earnings < 1100000 GROUP BY T1.Country;
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings BETWEEN 1400000 AND 1100000 GROUP BY T1.Country HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Club_ID) FROM player;
SELECT COUNT(DISTINCT Club_ID) FROM player;
SELECT T1.Earnings FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id JOIN Shipments AS T4 ON T2.order_id = T4.order_id JOIN Shipment_Items AS T5 ON T4.shipment_id = T5.shipment_id WHERE T3.order_item_status_code = 'Out of Stock' AND T2.order_status_code IN ('Part Completed', 'Delivered') GROUP BY T1.customer_id, T1.customer_first_name, T1.customer_last_name HAVING COUNT(T3.order_item_id) >= 3 AND COUNT(T5.order_item_id) >= 3
error: No SQL found in the input string
SELECT O.order_id, O.order_status_code, COUNT(*) AS product_count FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id, O.order_status_code
SELECT Orders.order_id, COUNT(DISTINCT Orders.order_item_id) AS product_count, Orders.order_status_code, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Orders.order_status_code = 'Delivered' GROUP BY Orders.order_id, Orders.order_status_code, Orders.date_order_placed ORDER BY Orders.order_id, Orders.order_status_code, Orders.date_order_placed;
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_item_status_code = 'Out of Stock' ORDER BY T1.date_order_placed ASC LIMIT 1;
error: No SQL found in the input string
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name FROM Customers AS T1 WHERE T1.customer_id NOT IN ( SELECT T2.customer_id FROM Customers AS T2 JOIN Orders AS T3 ON T2.customer_id = T3.customer_id JOIN Order_Items AS T4 ON T3.order_id = T4.order_id JOIN Shipments AS T5 ON T4.shipment_id = T5.shipment_id WHERE T5.order_status_code = 'Cancelled' ) ORDER BY T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name;
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name FROM Customers AS T1 WHERE T1.customer_id NOT IN ( SELECT T2.customer_id FROM Customers AS T2 JOIN Orders AS T3 ON T2.customer_id = T3.customer_id JOIN Order_Items AS T4 ON T3.order_id = T4.order_id WHERE T4.product_id = 1 )
error: No SQL found in the input string
-- Corrected SQL Query SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 JOIN ( SELECT T2.product_id, COUNT(*) as order_count FROM Orders AS T2 GROUP BY T2.product_id HAVING order_count < 2 ) AS T2 ON T1.product_id = T2.product_id;
SELECT DISTINCT O.order_id, O.date_order_placed FROM Orders O JOIN ( SELECT O.order_id, COUNT(DISTINCT P.product_id) AS product_count FROM Order_Items O JOIN Products P ON O.product_id = P.product_id GROUP BY O.order_id HAVING product_count >= 2 ) AS PCT ON O.order_id = PCT.order_id ORDER BY O.date_order_placed;
SELECT T1.order_id, T1.order_status_code, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code, T1.date_order_placed HAVING COUNT(T2.product_id) >= 2;
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN ( SELECT product_id, COUNT(*) AS frequency FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Order_Items.shipment_id = Shipments.shipment_id WHERE Order_Items.product_id = T1.product_id GROUP BY product_id ) AS T2 ON T1.product_id = T2.product_id ORDER BY T2.frequency DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.invoice_number, SUM(T2.product_price * T2.product_quantity) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Shipments AS T3 ON T1.order_id = T3.order_id JOIN Products AS T4 ON T2.product_id = T4.product_id WHERE T1.customer_id = 1 -- Assuming the customer_id is 1 for simplicity GROUP BY T1.invoice_number ORDER BY total_cost ASC LIMIT 1;
SELECT T1.payment_method_code, COUNT(T1.customer_id) AS total_orders FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id JOIN Orders AS T3 ON T1.customer_id = T3.customer_id JOIN Order_Items AS T4 ON T3.order_id = T4.order_id JOIN Shipments AS T5 ON T3.order_id = T5.order_id JOIN Shipment_Items AS T6 ON T5.shipment_id = T6.shipment_id GROUP BY T1.customer_id ORDER BY total_orders DESC LIMIT 1;
error: No SQL found in the input string
SELECT Customers.gender_code AS gender_code, COUNT(DISTINCT Orders.order_id) AS number_of_products FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.order_id = Shipment_Items.order_item_id GROUP BY Customers.gender_code;
error: No SQL found in the input string
SELECT gender_code, COUNT(*) FROM Customers GROUP BY gender_code
error: No SQL found in the input string
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id;
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id;
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Shipments AS T3 ON T1.order_id = T3.order_id JOIN Shipment_Items AS T4 ON T3.shipment_id = T4.shipment_id JOIN Customers AS T5 ON T1.customer_id = T5.customer_id JOIN Products AS T6 ON T4.product_id = T6.product_id WHERE T5.customer_id = 'zsawayn' ORDER BY T1.invoice_date;
-- SQL query to verify the correctness of the corrected SQL query SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_tracking_number FROM Invoices AS T1 JOIN Orders AS T2 ON T1.order_id = T2.order_id JOIN Shipments AS T3 ON T1.shipment_id = T3.shipment_id WHERE T2.customer_id = (SELECT customer_id FROM Customers WHERE login_name = 'zsawayn') ORDER BY T1.invoice_status_code, T1.invoice_date;
error: No SQL found in the input string
SELECT T1.product_name, T2.shipping_date FROM Products AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T3.order_id = T2.order_id JOIN Invoices AS T4 ON T4.order_id = T3.order_id JOIN Orders AS T5 ON T5.order_id = T4.order_id JOIN Order_Items AS T6 ON T6.order_id = T5.order_id JOIN Shipments AS T7 ON T7.order_id = T6.order_id JOIN Shipment_Items AS T8 ON T8.order_item_id = T6.order_item_id JOIN Shipments AS T9 ON T9.shipment_id = T8.shipment_id WHERE T3.order_status_code = 'Delivered';
error: No SQL found in the input string
error: No SQL found in the input string
SELECT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Shipments AS S ON OI.order_id = S.order_id WHERE S.shipment_id IS NOT NULL;
SELECT T1.product_name, T1.product_color FROM Products AS T1 JOIN Shipments AS T2 ON T1.product_id = T2.product_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id JOIN Shipment_Items AS T4 ON T3.order_item_id = T4.order_item_id JOIN Invoices AS T5 ON T4.shipment_id = T5.shipment_id JOIN Orders AS T6 ON T5.order_id = T6.order_id WHERE T6.order_status_code = 'Delivered';
SELECT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Customers AS T2 ON T1.product_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id = T3.customer_id JOIN Orders AS T4 ON T2.customer_id = T4.customer_id JOIN Order_Items AS T5 ON T4.order_id = T5.order_id JOIN Customers AS T6 ON T5.customer_id = T6.customer_id JOIN Order_Items AS T7 ON T5.order_item_id = T7.order_item_id JOIN Shipments AS T8 ON T7.shipment_id = T8.shipment_id JOIN Shipment_Items AS T9 ON T8.shipment_id = T9.shipment_id JOIN Customers AS T10 ON T9.customer_id = T10.customer_id JOIN Customer_Payment_Methods AS T11 ON T10.customer_id = T11.customer_id JOIN Orders AS T12 ON T10.order_id = T12.order_id JOIN Order_Items AS T13 ON T12.order_item_id = T13.order_item_id JOIN Shipments AS T14 ON T13.shipment_id = T14.shipment_id JOIN Shipment_Items AS T15 ON T14.shipment_id = T15.shipment_id JOIN Products AS T16 ON T15.product_id = T16.product_id WHERE T6.gender_code = 'Female';
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.order_id, T1.date_order_placed, SUM(T2.product_price * T3.product_quantity) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Shipments AS T3 ON T1.order_id = T3.order_id GROUP BY T1.order_id, T1.date_order_placed ORDER BY T1.order_id, T1.date_order_placed;
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price * Order_Items.order_item_status_code) AS total_amount_paid FROM Orders JOIN Customer_Payment_Methods ON Orders.customer_id = Customer_Payment_Methods.customer_id JOIN Invoices ON Orders.order_id = Invoices.order_id JOIN Order_Items ON Invoices.invoice_number = Order_Items.invoice_number JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed ORDER BY Orders.order_id, Orders.date_order_placed;
SELECT COUNT(DISTINCT Customers.customer_id) AS num_customers FROM Orders JOIN Customer_Payment_Methods ON Orders.customer_id = Customer_Payment_Methods.customer_id JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) AS num_customers FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT Orders.order_id) AS item_states FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id;
error: No SQL found in the input string
SELECT COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) AS num_payment_methods FROM Customer_Payment_Methods;
SELECT COUNT(DISTINCT T1.payment_method_code) AS num_payment_methods FROM Customer_Payment_Methods AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.login_name, T1.login_password FROM Customers AS T1 JOIN Customers_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id JOIN Invoices AS T3 ON T1.customer_id = T3.customer_id JOIN Orders AS T4 ON T3.order_id = T4.order_id JOIN Order_Items AS T5 ON T4.order_id = T5.order_id JOIN Shipments AS T6 ON T5.order_item_id = T6.order_item_id JOIN Shipment_Items AS T7 ON T6.shipment_id = T7.shipment_id WHERE T3.invoice_number LIKE '%+12%' GROUP BY T1.login_name, T1.login_password HAVING COUNT(T5.order_id) > 0;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.product_size FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T2.product_name LIKE '%Dell%';
SELECT P.product_price, P.product_size FROM Products AS P WHERE P.product_price > (SELECT AVG(P.product_price) FROM Products AS P)
SELECT p.product_name, p.product_price, p.product_size FROM Products p WHERE p.product_price > ( SELECT AVG(product_price) FROM Products );
-- Execute the new SQL query SELECT COUNT(DISTINCT T1.product_id) AS num_products FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id JOIN Shipments AS T4 ON T3.order_item_id = T4.order_item_id JOIN Products AS T5 ON T4.shipment_id = T5.product_id WHERE T3.order_item_status_code = 'Out of Stock';
SELECT COUNT(*) FROM Orders WHERE order_status_code = 'Cancelled'
SELECT COUNT(DISTINCT customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(DISTINCT customer_id) FROM Customer_Payment_Methods
SELECT order_status_code FROM Orders;
SELECT T1.order_status_code, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code, T1.date_order_placed;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.customer_first_name, T1.product_name, T2.order_status_code FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id JOIN Shipments AS T4 ON T3.order_item_id = T4.order_item_id JOIN Products AS T5 ON T4.shipment_id = T5.product_id WHERE T4.shipment_tracking_number LIKE '9206';
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Orders.order_status_code = 'Delivered';
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(*) FROM Shipment_Items
error: No SQL found in the input string
SELECT AVG(T1.product_price) AS average_price FROM Products AS T1 JOIN (SELECT product_id, AVG(product_price) AS average_price FROM Products GROUP BY product_id) AS T2 ON T1.product_id = T2.product_id;
SELECT AVG(T1.product_price) AS average_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T3.order_id = T2.order_id WHERE T3.order_status_code = 'Delivered';
SELECT AVG(T1.product_price) AS average_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id GROUP BY T1.product_id
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN ( SELECT T2.customer_id, COUNT(T2.customer_id) AS gender_count FROM Customers AS T2 GROUP BY T2.customer_id ORDER BY gender_count DESC LIMIT 1 ) AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.email_address, T1.address_line_1, T1.town_city FROM Customers AS T1 JOIN ( SELECT T2.customer_id, COUNT(*) as order_count FROM Orders AS T2 JOIN Customer_Payment_Methods AS T3 ON T2.customer_id = T3.customer_id GROUP BY T2.customer_id ORDER BY order_count DESC ) AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_count < 2;
error: No SQL found in the input string
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id = T3.customer_id JOIN Invoices AS T4 ON T1.order_id = T4.order_id JOIN Order_Items AS T5 ON T4.order_id = T5.order_id JOIN Shipments AS T6 ON T4.order_id = T6.order_id JOIN Shipment_Items AS T7 ON T6.order_id = T7.order_item_id WHERE T3.payment_method_code IN ('Credit Card', 'Direct Debit', 'Cheque') GROUP BY T1.date_order_placed HAVING COUNT(T5.order_id) >= 2;
SELECT T1.order_status_code FROM Orders AS T1 JOIN ( SELECT T2.order_id, COUNT(*) AS order_count FROM Order_Items AS T2 GROUP BY T2.order_id ORDER BY order_count DESC LIMIT 1 ) AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY order_count DESC LIMIT 1;
SELECT T1.order_status_code FROM Orders AS T1 JOIN ( SELECT T2.order_id, COUNT(*) AS order_count FROM Order_Items AS T2 GROUP BY T2.order_id ORDER BY order_count DESC LIMIT 1 ) AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY order_count DESC LIMIT 1;
SELECT Products.product_id, Products.product_name FROM Products JOIN ( SELECT product_id, COUNT(*) as count FROM Order_Items GROUP BY product_id HAVING count > 3 ) as subquery ON Products.product_id = subquery.product_id;
error: No SQL found in the input string
-- List the invoice dates and ids of the invoices causing at least 2 shipments. SELECT T1.invoice_date, T1.invoice_id FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(DISTINCT T2.order_id) >= 2;
error: No SQL found in the input string
SELECT T1.shipment_tracking_number, T1.shipment_date FROM Orders O JOIN Order_Items IO ON O.order_id = IO.order_id JOIN Shipments S ON IO.order_item_id = S.order_item_id JOIN Shipment_Items SI ON S.shipment_id = SI.shipment_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.customer_id = (SELECT customer_id FROM Customers WHERE login_name = 'zsawayn') ORDER BY SI.shipment_id, SI.shipment_date;
SELECT T1.shipment_tracking_number, T1.shipment_date FROM Shipments AS T1 JOIN Orders AS T2 ON T1.order_id = T2.order_id GROUP BY T1.shipment_tracking_number, T1.shipment_date;
SELECT T1.product_color, T1.product_description, T1.product_size FROM Products AS T1 JOIN ( SELECT T2.product_id, MAX(T2.product_price) AS max_price FROM Products AS T2 GROUP BY T2.product_id ) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_price < T2.max_price;
SELECT T1.product_color, T1.product_description, T1.product_size FROM Products AS T1 WHERE T1.product_price < (SELECT MAX(T2.product_price) FROM Products AS T2);
SELECT Name FROM director WHERE Age > (SELECT AVG(age) FROM director)
SELECT director.Name FROM director JOIN director_admin ON director_admin.Director_ID = director.Director_ID JOIN channel ON channel.Channel_ID = director.Admin_Channel_ID WHERE director_admin.Is_first_director = 'F' ORDER BY director.Age DESC LIMIT 1;
SELECT COUNT(DISTINCT channel_id) FROM program WHERE channel_id IN (SELECT Channel_ID FROM channel WHERE Name = 'BBC')
SELECT COUNT(DISTINCT channel_id) FROM channel WHERE Analogue_terrestrial_channel = 'digital terrestrial'
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1;
SELECT director.Name, COUNT(DISTINCT channel.Channel_ID) AS Programs FROM director_admin JOIN director ON director_admin.Director_ID = director.Director_ID JOIN channel ON director_admin.Channel_ID = channel.Channel_ID JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY director.Name ORDER BY Programs DESC LIMIT 1;
SELECT director.Name, director.Age FROM director JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Title FROM program WHERE Start_Year = (SELECT MIN(Start_Year) FROM program)
SELECT T1.Analogue_terrestrial_channel, T1.Title FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN director_admin AS T3 ON T2.Director_ID = T3.Director_ID WHERE T3.Channel_ID IS NOT NULL GROUP BY T1.Channel_ID HAVING COUNT(DISTINCT T2.Title) > 1
SELECT channel.name, COUNT(program.Program_ID) AS num_of_programs FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.name
SELECT COUNT(DISTINCT channel_id) FROM program WHERE channel_id NOT IN (SELECT channel_id FROM director_admin)
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID JOIN director_admin ON program.Channel_ID = channel.Channel_ID WHERE program.Title = 'Dracula' ORDER BY director_age DESC LIMIT 1;
SELECT T1.Name, T2.Internet FROM channel AS T1 JOIN director AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN director_admin AS T3 ON T2.Director_ID = T3.Director_ID ORDER BY T3.Is_first_director DESC LIMIT 1
error: No SQL found in the input string
SELECT T1.Analogue_terrestrial_channel, T2.Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN program AS T3 ON T3.Channel_ID = T1.Channel_ID WHERE T2.Is_first_director = 'F' AND T2.Age > 40 AND T2.Age < 60 GROUP BY T1.Analogue_terrestrial_channel, T2.Name HAVING COUNT(DISTINCT T3.Title) >= 2 ORDER BY COUNT(DISTINCT T3.Title) DESC LIMIT 10;
SELECT T1.Channel_ID, T1.Channel_Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID WHERE T2.Name != 'Hank Baskett'
SELECT COUNT(DISTINCT Radio_ID) AS num_of_radios FROM city_channel_radio;
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name, original_airdate FROM tv_show
SELECT T1.Station_name FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID JOIN radio AS T3 ON T2.Radio_ID = T3.Radio_ID WHERE T3.Affiliation != 'ABC'
SELECT T2.Transmitter FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID WHERE T1 ERP_kW > 150 OR T1 ERP_kW < 30
SELECT T2.Transmitter FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID WHERE T2.ERP_kW = ( SELECT MAX(T2.ERP_kW) FROM city_channel_radio AS T2 )
SELECT AVG(ERP_kW) FROM city_channel_radio JOIN city_channel_tv_show ON city_channel_radio.Radio_ID = city_channel_tv_show.tv_show_ID WHERE city_channel_radio.City_channel_ID = city_channel_id AND city_channel_tv_show.Is_free = 'T';
SELECT DISTINCT T1.Affiliation, COUNT(T1.City_channel_ID) AS Number_of_Channels FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.City_channel_ID = T2.City_channel_ID JOIN city_channel_tv_show AS T3 ON T1.City_channel_ID = T3.City_channel_ID GROUP BY T1.Affiliation ORDER BY Number_of_Channels DESC;
SELECT T1.Affiliation, COUNT(*) AS Frequency FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID JOIN city_channel_tv_show AS T3 ON T2.City_channel_ID = T3.City_channel_ID GROUP BY T1.Affiliation ORDER BY Frequency DESC LIMIT 1;
-- List the affiliations shared by more than three city channels. SELECT DISTINCT T2.Affiliation FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.City_channel_ID = T2.City_channel_ID WHERE T1.City_channel_ID IN ( SELECT T1.City_channel_ID FROM city_channel_radio AS T2 WHERE T2.Is_online = 'T' GROUP BY T2.City_channel_ID HAVING COUNT(*) > 3 ) INTERSECT SELECT DISTINCT T2.Affiliation FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.City_channel_ID = T2.City_channel_ID WHERE T1.City_channel_ID IN ( SELECT T1.City_channel_ID FROM city_channel_radio AS T2 WHERE T2.Is_online = 'F' GROUP BY T2.City_channel_ID HAVING COUNT(*) > 3 );
SELECT DISTINCT T1.City, T1.Station_name FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID ORDER BY T2.Station_name ASC
error: No SQL found in the input string
SELECT T2.Transmitter, T1.Radio_MHz FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID ORDER BY T2.RNAG_MHz DESC;
-- Show the transmitters of the radios and the number of city channels they are associated with. SELECT T2.Transmitter, COUNT(T1.City_channel_ID) AS Number_of_Channels FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID JOIN city_channel_tv_show AS T3 ON T1.ID = T3.tv_show_ID WHERE T3.tv_show_name = 'Magic Mutt' GROUP BY T2.Transmitter ORDER BY Number_of_Channels DESC;
SELECT DISTINCT T1.Transmitter FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID WHERE T2.Is_free = 'T'
SELECT Model FROM vehicle WHERE Top_Speed > 6000 AND Power > 6400
SELECT T2.Model, T2.Top_Speed FROM vehicle AS T1 JOIN driver AS T2 ON T1.Vehicle_ID = T2.Driver_ID WHERE T1.Power > 6000 ORDER BY T2.Top_Speed DESC LIMIT 1;
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T1.Citizenship = 'United States'
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T1.Citizenship = 'United States'
SELECT COUNT(DISTINCT Driver_ID), Driver_ID FROM vehicle_driver GROUP BY Driver_ID ORDER BY COUNT(DISTINCT Driver_ID) DESC LIMIT 1
SELECT driver_id, COUNT(*) FROM vehicle_driver GROUP BY driver_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT MAX(T1.Power), AVG(T1.Power) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Citizenship = 'Zhuzhou'
SELECT MAX(T1.Power), AVG(T1.Power) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Citizenship = 'Zhuzhou';
error: No SQL found in the input string
SELECT T1.Vehicle_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(*) LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM driver)
SELECT Build_Year, Model, Builder FROM vehicle;
SELECT COUNT(DISTINCT driver_id) FROM vehicle_driver WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Build_Year = '2012')
SELECT COUNT(DISTINCT driver_id) FROM vehicle_driver WHERE Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle WHERE Build_Year = '2012' )
SELECT COUNT(DISTINCT driver_id) FROM vehicle_driver WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE racing_series = 'NASCAR')
SELECT COUNT(DISTINCT driver_id) FROM vehicle_driver WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE racing_series = 'NASCAR')
SELECT AVG(Top_Speed) FROM vehicle;
SELECT AVG(T2.Top_Speed) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Citizenship = 'United States';
SELECT DISTINCT driver.name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT DISTINCT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Citizenship = 'United States' AND T1.Total_Production > 100 OR T1.Top_Speed > 150;
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Power > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT T1.Model, T1.Build_Year FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T1.Model LIKE '%DJ%';
SELECT DISTINCT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
error: No SQL found in the input string
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IN ( SELECT driver_id FROM driver WHERE citizenship = 'Ziyang' ) OR v.Model IN ( SELECT model FROM vehicle WHERE Build_Year IN ( SELECT Build_Year FROM vehicle WHERE builder = 'Ziyang' ) ) GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT driver_id) <= 2;
SELECT v.Model, v.Build_Year FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID NOT IN ( SELECT driver_id FROM driver WHERE name = 'Jeff Gordon' ) GROUP BY v.Model, v.Build_Year HAVING COUNT(DISTINCT driver_id) > 2
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Citizenship = 'United States' AND Drivers_count > 2) OR v.Vehicle_ID = (SELECT Vehicle_ID FROM vehicle WHERE Name = 'Jeff Gordon') GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT Driver_ID) > 2;
SELECT COUNT(DISTINCT Vehicle_ID) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(DISTINCT Vehicle_ID) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID ORDER BY T1.Name
SELECT Name FROM driver ORDER BY Name
SELECT DISTINCT T1.Citizenship, COUNT(T2.Vehicle_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Citizenship
SELECT DISTINCT T1.Citizenship, COUNT(T2.Racing_Series) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Citizenship
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver
SELECT COUNT(DISTINCT Exam_ID) AS Exam_Count FROM Exams;
SELECT COUNT(*) FROM Exams;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code;
SELECT E.Exam_Name, E.Exam_Date FROM Exams AS E WHERE E.Subject_Code NOT IN ('Database');
SELECT DISTINCT Exams.Subject_Code, Exams.Exam_Date, Exams.Exam_Name FROM Exams WHERE Exams.Subject_Code != 'Database';
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT T1.Type_of_Question_Code, COUNT(*) FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code;
SELECT DISTINCT T1.S.Student_Answer_Text FROM Students AS T1 JOIN Questions AS T2 ON T1.Student_ID = T2.Student_ID JOIN Questions_in_Exams AS T3 ON T2.Question_ID = T3.Question_ID JOIN Valid_Answers AS T4 ON T3.Question_ID = T4.Question_ID JOIN Student_Answers AS T5 ON T3.Question_ID = T5.Question_ID JOIN Student_Assessments AS T6 ON T3.Question_ID = T6.Question_ID WHERE T6.Assessment = 'Excellent' AND T6.Satisfactory_YN = '1' GROUP BY T1.S.Student_Answer_Text;
SELECT DISTINCT T1.S.Student_Answer_Text FROM Questions AS Q JOIN Questions_in_Exams AS QI ON QI.Question_ID = Q.Question_ID JOIN Exams AS E ON E.Exam_ID = QI.Exam_ID JOIN Valid_Answers AS VA ON VA.Question_ID = QI.Question_ID JOIN Students AS S ON S.Student_ID = S.Student_ID WHERE VA.Satisfactory_YN = '1' AND VA.Comments = 'Normal';
SELECT COUNT(DISTINCT Student_Answers.Comments) AS Comment_Count FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID JOIN Valid_Answers ON Questions_in_Exams.Question_ID = Questions.Question_ID JOIN Student_Answers ON Questions_in_Exams.Question_ID = Questions.Question_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Email_Address, T2.Date_of_Answer FROM Students AS T1 JOIN Questions AS T2 ON T1.Student_ID = T2.Student_ID JOIN Questions_in_Exams AS T3 ON T2.Question_ID = T3.Question_ID JOIN Exams AS T4 ON T3.Exam_ID = T4.Exam_ID ORDER BY T2.Date_of_Answer DESC;
error: No SQL found in the input string
SELECT Assessment, COUNT(*) AS Count FROM Questions_in_Exams JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID JOIN Valid_Answers ON Questions_in_Exams.Question_ID = Questions.Question_ID JOIN Student_Answers ON Questions_in_Exams.Question_ID = Questions.Question_ID JOIN Student_Assessments ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Assessment ORDER BY Count DESC LIMIT 1;
SELECT Assessment FROM ( SELECT Assessment, COUNT(*) AS frequency FROM Questions_in_Exams GROUP BY Assessment ORDER BY frequency ASC LIMIT 1 ) AS subquery WHERE frequency = (SELECT MIN(frequency) FROM ( SELECT Assessment, COUNT(*) AS frequency FROM Questions_in_Exams GROUP BY Assessment ORDER BY frequency ASC LIMIT 1 ))
SELECT DISTINCT T1.First_Name FROM Students AS T1 JOIN Questions AS T2 ON T1.Student_ID = T2.Student_ID JOIN Questions_in_Exams AS T3 ON T2.Question_ID = T3.Question_ID JOIN Exams AS T4 ON T3.Exam_ID = T4.Exam_ID JOIN Questions AS T5 ON T3.Question_ID = T5.Question_ID JOIN Valid_Answers AS T6 ON T5.Question_ID = T6.Question_ID JOIN Student_Answers AS T7 ON T6.Question_ID = T7.Question_ID JOIN Students AS T8 ON T7.Student_ID = T8.Student_ID WHERE T8.Satisfactory_YN = '1' AND COUNT(DISTINCT T7.Satisfactory_YN) >= 2;
SELECT DISTINCT S.First_Name FROM Students S JOIN Questions_in_Exams QEI ON S.Student_ID = QEI.Student_ID JOIN Questions Q ON QEI.Question_ID = Q.Question_ID JOIN Valid_Answers VA ON QEI.Question_ID = VA.Question_ID WHERE VA.Satisfactory_YN = '1' AND VA.Satisfactory_YN = '1' OR VA.Satisfactory_YN = '1' OR VA.Satisfactory_YN = '1' GROUP BY S.First_Name;
error: No SQL found in the input string
SELECT T1.`Valid_Answer_Text` FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID JOIN Exams AS T3 ON T2.Exam_ID = T3.Exam_ID JOIN Valid_Answers AS T4 ON T2.Valid_Answer_ID = T4.Valid_Answer_ID JOIN Student_Answers AS T5 ON T4.Student_Answer_ID = T5.Student_Answer_ID GROUP BY T1.Question_ID ORDER BY COUNT(T4.Satisfactory_YN) DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Gender_MFU, COUNT(*) AS Number_of_students FROM Students GROUP BY Gender_MFU;
SELECT Gender_MFU, COUNT(*) AS Number_of_students FROM Students GROUP BY Gender_MFU;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.First_Name FROM Students AS T1 JOIN Questions AS T2 ON T1.Student_ID = T2.Student_ID JOIN Questions_in_Exams AS T3 ON T2.Question_ID = T3.Question_ID JOIN Exams AS T4 ON T3.Exam_ID = T4.Exam_ID JOIN Questions AS T5 ON T3.Question_ID = T5.Question_ID JOIN Valid_Answers AS T6 ON T5.Question_ID = T6.Question_ID WHERE T6.Satisfactory_YN = '0';
SELECT DISTINCT S.First_Name FROM Students S JOIN Questions_in_Exams QEI ON S.Student_ID = QEI.Student_ID JOIN Questions Q ON QEI.Question_ID = Q.Question_ID WHERE QEI.Question_ID NOT IN (SELECT QEI.Question_ID FROM Questions_in_Exams QEI WHERE Exam_ID = (SELECT Exam_ID FROM Exams WHERE Subject_Code = 'Database'))
error: No SQL found in the input string
error: No SQL found in the input string
-- Show the types of questions that have at least three questions. SELECT DISTINCT Type_of_Question_Code FROM Questions WHERE COUNT(*) >= 3;
SELECT DISTINCT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID JOIN Exams AS T3 ON T2.Exam_ID = T3.Exam_ID JOIN Valid_Answers AS T4 ON T3.Exam_Name = T4.Exam_Name WHERE T4.Satisfactory_YN = '1' AND T4.Question_ID IN ( SELECT T5.Question_ID FROM Questions AS T5 JOIN Questions_in_Exams AS T6 ON T5.Question_ID = T6.Question_ID JOIN Exams AS T7 ON T6.Exam_ID = T7.Exam_ID JOIN Valid_Answers AS T8 ON T7.Exam_Name = T8.Exam_Name WHERE T8.Satisfactory_YN = '1' AND T8.Question_ID IN ( SELECT T9.Question_ID FROM Questions AS T9 JOIN Questions_in_Exams AS T10 ON T9.Question_ID = T10.Question_ID JOIN Exams AS T11 ON T10.Exam_ID = T11.Exam_ID JOIN Valid_Answers AS T12 ON T11.Exam_Name = T12.Exam_Name WHERE T12.Satisfactory_YN = '1' ) )
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(address_id) FROM Addresses;
SELECT COUNT(address_id) FROM Addresses;
SELECT address_id, address_details FROM Addresses;
SELECT address_id, address_details FROM Addresses;
SELECT COUNT(*) FROM Products;
SELECT COUNT(*) FROM Products;
SELECT product_id, product_type_code, product_name FROM Products;
SELECT product_id, product_type_code, product_name FROM Products;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(Products.product_price), AVG(Products.product_price), MAX(Products.product_price) FROM Products;
SELECT min(Products.product_price), avg(Products.product_price), max(Products.product_price) FROM Products;
SELECT AVG(Products.product_price) FROM Products WHERE Products.product_type_code = 'Clothes';
SELECT AVG(Products.product_price) FROM Products
SELECT COUNT(DISTINCT Products.product_type_code) AS num_products FROM Products;
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware';
SELECT p.product_name FROM Products p WHERE p.product_price > (SELECT AVG(p.product_price) FROM Products p);
SELECT P.product_name FROM Products P JOIN ( SELECT product_id, AVG(product_price) as avg_price FROM Products GROUP BY product_id ) AS AvgP ON P.product_id = AvgP.product_id WHERE P.product_price > AvgP.avg_price;
SELECT T1.product_name FROM Products AS T1 JOIN ( SELECT product_id, AVG(product_price) as avg_price FROM Products GROUP BY product_id ) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' AND T2.avg_price > T1.product_price;
SELECT T1.product_name FROM Products AS T1 JOIN ( SELECT product_id, AVG(product_price) as avg_price FROM Products GROUP BY product_id ) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' AND T2.avg_price > (SELECT AVG(product_price) FROM Products)
error: No SQL found in the input string
SELECT T1.product_name, T1.product_price FROM Products AS T1 JOIN Customer_Orders AS T2 ON T1.product_id = T2.product_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id WHERE T3.product_id = (SELECT product_id FROM Customer_Orders WHERE customer_id = 'Twila') ORDER BY T1.product_price DESC LIMIT 1;
SELECT P.product_id, P.product_name FROM Products P JOIN ( SELECT product_id, MIN(product_price) AS min_price FROM Products GROUP BY product_id ) P2 ON P.product_id = P2.product_id WHERE P2.min_price = (SELECT MIN(product_price) FROM Products) ORDER BY P2.min_price ASC LIMIT 1;
error: No SQL found in the input string
SELECT product_name FROM Products ORDER BY product_price DESC;
SELECT Products.product_name, Products.product_price FROM Products ORDER BY Products.product_price DESC;
SELECT product_type_code, product_name, product_price FROM Products ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code;
error: No SQL found in the input string
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2;
SELECT DISTINCT T1.product_type_code FROM Products AS T1 JOIN ( SELECT product_id FROM Customer_Orders GROUP BY product_id HAVING COUNT(*) > 2 ) AS T2 ON T1.product_id = T2.product_id
SELECT product_type_code, COUNT(*) AS product_count FROM Products GROUP BY product_type_code ORDER BY product_count DESC LIMIT 1;
SELECT product_type_code, COUNT(*) AS frequency FROM Products GROUP BY product_type_code ORDER BY frequency DESC LIMIT 1;
SELECT COUNT(DISTINCT Customers.customer_id) AS num_customers FROM Customers
SELECT COUNT(DISTINCT Customers.customer_id) AS num_customers FROM Customers;
SELECT customer_id, customer_name FROM Customers;
SELECT customer_id, customer_name FROM Customers;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.payment_method_code, COUNT(T2.customer_id) AS customer_count FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY customer_count DESC;
SELECT payment_method_code, COUNT(DISTINCT customer_id) AS num_customers FROM Customers GROUP BY payment_method_code
SELECT T1.payment_method_code, COUNT(*) AS num_customers FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY num_customers DESC LIMIT 1;
SELECT T1.payment_method_code FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id ORDER BY COUNT(T3.product_id) DESC LIMIT 1
SELECT Customers.customer_name FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id, Customers.customer_name ORDER BY COUNT(DISTINCT Customer_Orders.order_id) ASC LIMIT 10;
SELECT Customers.customer_name FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id, Customers.customer_name ORDER BY COUNT(DISTINCT Order_Items.product_id) DESC LIMIT 10;
SELECT T1.payment_method_code, T1.customer_number FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id WHERE T1.customer_name = 'Jeromy';
SELECT T1.payment_method_code, T1.customer_number FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id WHERE T1.customer_name = 'Jeromy'
SELECT DISTINCT T1.payment_method_code FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id HAVING COUNT(T2.order_id) > 1
SELECT DISTINCT Payment_method_code FROM Customers;
SELECT Products.product_id, Products.product_type_code FROM Products ORDER BY Products.product_name;
SELECT DISTINCT T1.product_id, T1.product_type_code FROM Products AS T1 ORDER BY T1.product_name;
SELECT T1.product_type_code, COUNT(*) AS product_count FROM Products AS T1 JOIN ( SELECT product_id, COUNT(*) AS product_count FROM Order_Items GROUP BY product_id ORDER BY product_count DESC LIMIT 1 ) AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_type_code ORDER BY product_count ASC LIMIT 1;
SELECT DISTINCT T1.product_type_code FROM Products AS T1 JOIN ( SELECT product_type_code, COUNT(*) as count FROM Customer_Orders GROUP BY product_type_code ORDER BY count DESC LIMIT 1 ) AS T2 ON T1.product_type_code = T2.product_type_code
SELECT COUNT(DISTINCT Customers.customer_id) AS num_orders FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Orders_Items ON Customer_Orders.order_id = Orders_Items.order_id JOIN Products ON Orders_Items.product_id = Products.product_id;
SELECT COUNT(DISTINCT Customer_Orders.customer_id) AS Total_Orders FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Customers.customer_name, Customers.customer_id, COUNT(Order_Items.order_id) AS order_count FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id, Customers.customer_name ORDER BY order_count DESC;
SELECT Customers.customer_name, Customers.customer_id, COUNT(Order_Items.order_id) AS order_count FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id ORDER BY order_count DESC;
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1;
error: No SQL found in the input string
SELECT order_status_code, COUNT(order_id) FROM Order_Items GROUP BY order_status_code
SELECT order_status_code, COUNT(*) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY order_status_code
SELECT T2.order_status_code FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T2.order_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.order_status_code FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T2.order_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_status_code = 'Part';
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_status_code = 'Part';
SELECT DISTINCT Products.product_name FROM Products WHERE Products.product_id NOT IN (SELECT Product_id FROM Customer_Orders);
SELECT DISTINCT Products.product_name FROM Products JOIN Customer_Orders ON Products.product_id = Customer_Orders.product_id WHERE Customer_Orders.customer_id IS NULL;
SELECT COUNT(DISTINCT Products.product_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor';
SELECT SUM(CASE WHEN T1.product_id = 1 THEN T2.order_quantity ELSE 0 END) AS Total_Orders FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Products AS T3 ON T3.product_id = T2.product_id WHERE T3.product_type_code = 'Monitor';
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor';
SELECT COUNT(DISTINCT Customers.customer_id) AS Number_of_Customers FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_type_code = 'Monitor'
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Customers ON Order_Items.customer_id = Customers.customer_id;
SELECT DISTINCT Customers.customer_id FROM Customers WHERE Customers.customer_id NOT IN (SELECT Customer_Orders.customer_id FROM Customer_Orders);
SELECT DISTINCT Customers.customer_id FROM Customers WHERE Customers.customer_id NOT IN (SELECT DISTINCT Customer_Orders.customer_id FROM Customer_Orders)
SELECT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id WHERE T2.order_quantity > 6 OR T3.product_id IN (SELECT product_id FROM Order_Items WHERE order_quantity > 3)
SELECT T1.order_id, T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > 6 OR T2.product_id IN (SELECT product_id FROM Products WHERE product_id > 3) ORDER BY T1.order_date DESC;
SELECT COUNT(Building_ID) FROM building;
SELECT COUNT(*) FROM building;
SELECT Name FROM building ORDER BY Number_of_Stories ASC;
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC;
SELECT T1.Address FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID ORDER BY T2.Completed_Year DESC;
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year NOT BETWEEN 1980 AND 1983
SELECT MAX(Number_of_Stories) FROM building WHERE Region_ID = (SELECT Region_ID FROM building WHERE Year = 1980)
SELECT AVG(population) FROM region;
SELECT AVG(population) FROM region;
SELECT Name FROM region ORDER BY Name ASC
SELECT DISTINCT T1.Name FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID ORDER BY T1.Name;
SELECT T2.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID WHERE T2.Area > 10000
SELECT T2.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID WHERE T2.Area > 10000;
SELECT T2.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID ORDER BY T2.Population DESC LIMIT 1;
SELECT T1.Name, T1.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID ORDER BY T2.Population DESC LIMIT 1
SELECT Name FROM region WHERE Area IN (SELECT MAX(area) FROM region)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5;
SELECT b.Name, r.Name FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID
SELECT b.Name, r.Name FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID;
SELECT DISTINCT T1.Name FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(T2.Region_ID) > 1
SELECT Region_ID, Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(Region_ID) > 1)
SELECT T1.Name, T1.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name, T1.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(T2.Region_ID) DESC LIMIT 1
SELECT b.Address, r.Capital FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID;
SELECT b.Address, r.Name FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID
SELECT Number_of_Stories FROM building WHERE Name = 'Abruzzo'
SELECT Number_of_Stories FROM building WHERE Region_ID = (SELECT Region_ID FROM region WHERE Name = 'Abruzzo')
SELECT completed_year, COUNT(region_id) FROM region JOIN building ON region.Region_ID = building.Region_ID WHERE region_id IS NOT NULL GROUP BY completed_year;
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year
SELECT T1.Completed_Year FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Completed_Year FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Area IS NULL
SELECT T1.Completed_Year, T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID WHERE T1.Number_of_Stories > 20 OR T1.Number_of_Stories < 15
SELECT T1.Completed_Year, T2.Completed_Year FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID WHERE T1.Number_of_Stories > 20 AND T1.Number_of_Stories < 15 OR T2.Population > 1500000000;
SELECT DISTINCT Address FROM building;
SELECT DISTINCT building.Address FROM building;
SELECT T1.Completed_Year, COUNT(*) FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Completed_Year ORDER BY COUNT(*) DESC
SELECT T1.Name, T1.Completed_Year FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID ORDER BY T1.Number_of_Stories DESC, T2.Completed_Year DESC;
SELECT Channel_Details.`Channel_Name` FROM Channels ORDER BY Channel_Details.`Channel_Name` ASC;
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT COUNT(*) FROM Services
SELECT COUNT(*) FROM Services
error: No SQL found in the input string
SELECT DISTINCT T1.Analytical_Layer_Type_Code FROM Customers_and_Services AS T1 JOIN Integration_Platform AS T2 ON T1.Integration_Platform_ID = T2.Integration_Platform_ID JOIN Analytical_Layer AS T3 ON T1.Analytical_ID = T3.Analytical_ID GROUP BY T1.Analytical_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID = (SELECT Customers.Customer_ID FROM Customers WHERE Customers_Name = 'Hardy Kutch')
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID = (SELECT Customers.Customer_ID FROM Customers WHERE Customers_and_Services.Customer_ID = (SELECT Customers_and_Services_ID FROM Customers_and_Services WHERE Customer_ID = 'Hardy Kutch') LIMIT 1)
SELECT Services_and_Channels_Details.Service_Details, COUNT(*) AS Service_Count FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Services_and_Channels_Details.Service_Details HAVING Service_Count > 3
SELECT Services_and_Channels_Details.Service_Details, COUNT(*) AS Service_Count FROM Customers_and_Services JOIN Customers_interactions ON Customers_and_Services.Customer_ID = Customers_interactions.Customer_ID JOIN Integration_Platform ON Customers_interactions.Integration_Platform_ID = Integration_Platform.ID WHERE Customers_interactions.Status_Code = 'Open' GROUP BY Services_and_Channels_Details.Service_Details HAVING Service_Count > 3 ORDER BY Service_Count DESC;
SELECT Customers_and_Services_Details.Customer_Details, MAX(Customers_and_Services_Details.Status_Code) AS Max_Status_Code FROM Customers_and_Services JOIN Customers_and_Services_Details ON Customers_and_Services.Customer_ID = Customers_and_Services_Details.Customer_ID JOIN Integration_Platform ON Customers_and_Services_Details.Integration_Platform_ID = Integration_Platform.Integration_Platform_ID GROUP BY Customers_and_Services_Details.Customer_ID ORDER BY Max_Status_Code DESC LIMIT 1;
error: No SQL found in the input string
SELECT Customers_and_Services_Details.Customer_Details, MAX(Analytical_Layer_Type_Code) AS Max_Type FROM Customers_and_Services JOIN Customers_and_Services_Details ON Customers_and_Services.Customer_ID = Customers_and_Services_Details.Customer_ID JOIN Integration_Platform ON Customers_and_Services_Details.Integration_Platform_ID = Integration_Platform.ID JOIN Analytical_Layer ON Integration_Platform_ID = Analytical_Layer.ID GROUP BY Customers_and_Services_Details.Customer_ID ORDER BY Max_Type DESC LIMIT 1;
SELECT Customers_and_Services_Details.Customer_Details, MAX(Analytical_Layer_Type_Code) AS Max_Type FROM Customers_and_Services JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Customer_Interactions.Integration_Platform_ID = Integration_Platform.ID JOIN Analytical_Layer ON Integration_Platform.ID = Analytical_Layer.ID GROUP BY Customers_and_Services.Customer_ID ORDER BY Max_Type DESC LIMIT 1;
SELECT Customers_and_Services_Details.Customer_Details FROM Customers_and_Services INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers_and_Services.Customer_ID NOT IN (SELECT Customers_and_Services_ID FROM Customer_Interactions WHERE Status_Code = 'Open')
SELECT Customers_and_Services_Details.Customer_Details FROM Customers AND Services INNER JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers_and_Services_Details.Customer_ID IS NULL;
SELECT Customers_and_Services_Details.Customer_Details, Customers_and_Services_Details.Status_Code FROM Customers_and_Services JOIN Customers_and_Services_Details ON Customers_and_Services.Customer_ID = Customers_and_Services_Details.Customer_ID JOIN Integration_Platform ON Customers_and_Services_Details.Integration_Platform_ID = Integration_Platform.Integration_Platform_ID WHERE Integration_Platform.Analytical_Layer_Type_Code = 'Bottom' ORDER BY Status_Code DESC LIMIT 10;
SELECT DISTINCT Customers_and_Services_Details.Customer_Details, Customers_and_Services_Details.Status_Code FROM Customers_and_Services JOIN Customers_and_Services_Details ON Customers_and_Services.Customer_ID = Customers_and_Services_Details.Customer_ID JOIN Integration_Platform ON Customers_and_Services_Details.Integration_Platform_ID = Integration_Platform.ID JOIN Analytical_Layer ON Integration_Platform.ID = Analytical_Layer.ID WHERE Analytical_Layer.Analytical_Layer_Type_Code = 'Bottom' ORDER BY Customers_and_Services_Details.Status_Code DESC LIMIT 10;
SELECT COUNT(DISTINCT Customers_and_Services_Details) AS NumberOfDistinctCustomerAndServicesDetails FROM Customers_and_Services
SELECT COUNT(DISTINCT Customers_and_Services_ID) AS TotalCustomersAndServices FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID
SELECT Customers_Details.Name FROM Customers INNER JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details LIKE '%Kutch%'
SELECT Customers_and_Services_Details.Customer_Details, Customers_and_Services_Details.Status_Code FROM Customers_and_Services INNER JOIN Customers ON Customers_and_Services.Customers_and_Services_ID = Customers.Customers_ID WHERE Customers_and_Services_Details.Customer_Details LIKE '%Kutch%'
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID = 'Hardy Kutch' OR Services_and_Channels_Details.Status_Code = 'Good';
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID = 'Hardy Kutch' OR Services_and_Channels_Details.Status_Code = 'Good';
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID = 'Hardy Kutch' AND Services_and_Channels_Details.Status_Code = 'Bad';
SELECT Services_and_Channels_Details.Service_Details FROM Services AS Services JOIN Customers_and_Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers AS Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions AS Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform AS Integration_Platform ON Customer_Interactions.Channel_ID = Integration_Platform.Channel_ID JOIN Analytical_Layer AS Analytical_Layer ON Integration_Platform.Analytical_ID = Analytical_Layer.Analytical_ID WHERE Customers_and_Services.Soldiers_and_Services_Details.Soldiers_and_Services_ID = 'Hardy Kutch' AND Services_and_Channels_Details.Service_Details = 'bad' ORDER BY Services_and_Channels_Details.Service_Details ASC
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.`Service_ID` = Customers_and_Services.`Service_ID` INNER JOIN Customers ON Customers_and_Services.`Customer_ID` = Customers.`Customer_ID` WHERE Customers_and_Services.`Channel_ID` = '15 ij';
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Channels ON Customers_and_Services.Channel_ID = Channels.Channel_ID INNER JOIN Integration_Platform ON Integration_Platform.Customer_Interaction_ID = Customers_and_Services.Customer_Interaction_ID WHERE Channels.Channel_ID = '15 ij' AND Integration_Platform_Analytical_Layer.Analytical_Layer_Type_Code = 'Bottom'
SELECT Customers_and_Services_Details.Customer_Details, Integration_Platform_Details.Integration_Platform_details FROM Customers_and_Services JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Customer_Interactions.Integration_Platform_ID = Integration_Platform.Integration_Platform_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details.Integration_Platform_details = 'bad' GROUP BY Customers_and_Services_Details.Customer_Details, Integration_Platform_Details.Integration_Platform_details HAVING COUNT(*) = 1 ORDER BY Customers_and_Services_Details.Customer_Details ASC
SELECT Customers_and_Services_Details.Customer_Details, Integration_Platform_Details.Integration_Platform_details FROM Customers_and_Services JOIN Customers_and_Services_Details ON Customers_and_Services.Customer_ID = Customers_and_Services_Details.Customer_ID JOIN Integration_Platform ON Customers_and_Services_Details.Integration_Platform_ID = Integration_Platform.ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.ID JOIN Services ON Customer_Interactions.Service_ID = Services.ID JOIN Services AND Channels AND Integration_Platform ON Services.Service_ID = Integration_Platform.Service_ID WHERE Status_Code = 'Stuck' AND Integration_Platform_Details.Integration_Platform_details = 'bad' GROUP BY Customers_and_Services_Details.Customer_Details HAVING COUNT(*) = 1
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_ID = (SELECT Integration_Platform_ID FROM Integration_Platform WHERE Integration_Platform_ID IN (SELECT Integration_Platform_ID FROM Customer_Interactions WHERE Status_Code = 'Open'))
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details = 'Success'
SELECT Customers_and_Services_Details.Customer_Details, Integration_Platform_Details.Integration_Platform_Details FROM Integration_Platform JOIN Customers_and_Services ON Integration_Platform.Customer_Interaction_ID = Customers_and_Services.Customer_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Channels ON Integration_Platform.Channel_ID = Channels.Channel_ID JOIN Customers_and_Services_Details ON Integration_Platform.Customer_Interaction_ID = Customers_and_Services_Details.Customer_ID JOIN Services ON Integration_Platform.Service_ID = Services.Service_ID JOIN Services_Details ON Services.Service_ID = Services_Details.Service_Details JOIN Analytical_Layer ON Integration_Platform.Analytical_ID = Analytical_Layer.Analytical_ID WHERE Integration_Platform.Integration_Platform_Type_Code = 'Fail';
SELECT Customers_and_Services_Details.Customer_Details FROM Customers_and_Services INNER JOIN Integration_Platform ON Customers_and_Services.Integration_Platform_ID = Integration_Platform.ID WHERE Integration_Platform_Details = 'Fail';
SELECT s.Service_ID, s.Service_Details FROM Services s WHERE s.Service_ID NOT IN (SELECT cs.Service_ID FROM Customers_and_Services cs) ORDER BY s.Service_ID;
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID IS NULL ORDER BY Services_and_Channels_Details.Service_Details ASC;
SELECT DISTINCT T1.Analytical_Layer_Type_Code, COUNT(*) AS Usage_Count FROM Customers_and_Services AS T1 JOIN Customers_and_Services_Details AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Integration_Platform AS T3 ON T1.Integration_Platform_ID = T3.Integration_Platform_ID JOIN Analytical_Layer AS T4 ON T1.Analytical_ID = T4.Analytical_ID GROUP BY T1.Analytical_ID ORDER BY Usage_Count DESC;
error: No SQL found in the input string
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services_and_Channels_Details.Status_Code = 'Unsatisfied';
SELECT Services_and_Channels_Details.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services_and_Channels_Details.Status_Code = 'Unsatisfied';
SELECT COUNT(*) FROM Vehicles;
SELECT COUNT(*) FROM Vehicles;
SELECT T1.name FROM Vehicles AS T1 JOIN Customers AS T2 ON T1.id = T2.id ORDER BY T1.Model_year DESC;
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id JOIN Discount ON Renting_history.discount_id = Discount.id ORDER BY Vehicles.Model_year DESC;
SELECT DISTINCT Type_of_powertrain FROM Vehicles;
SELECT DISTINCT Type_of_powertrain FROM Vehicles;
SELECT T1.name, T1.type_of_powertrain, T3.Cost_per_25_miles FROM Vehicles AS T1 JOIN Model_year AS T2 ON T1.Model_year = T2.model_year JOIN Vehicles AS T3 ON T1.id = T3.id WHERE T2.year IN (2013, 2014);
SELECT T1.name, T1.type_of_powertrain, T3.Cost_per_25_miles FROM Vehicles AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.id JOIN Discount AS T3 ON T1.id = T3.id WHERE T1.Model_year IN (2013, 2014) ORDER BY T3.Cost_per_25_miles ASC LIMIT 1;
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Model_year BETWEEN 2014 AND 2013
SELECT T2.type_of_powertrain FROM Vehicles AS T1 JOIN Discount AS T2 ON T1.id = T2.discount_id WHERE T1.model_year BETWEEN 2013 AND 2014 AND T1.model_year BETWEEN 2013 AND 2014
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT T2.Type_of_powertrain, COUNT(*) FROM Vehicles AS T1 JOIN Discount AS T2 ON T1.id = T2.discount_id JOIN Customers AS T3 ON T1.customer_id = T3.id GROUP BY T2.Type_of_powertrain
SELECT T2.type_of_powertrain, COUNT(*) FROM Vehicles AS T1 JOIN Customers AS T2 ON T1.id = T2.customer_id GROUP BY T2.type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Type_of_powertrain FROM Vehicles AS T1 JOIN Discount AS T2 ON T1.id = T2.discount_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(Cost_per_25_miles), MAX(Cost_per_25_miles), AVG(Cost_per_25_miles) FROM Vehicles;
SELECT MIN(Cost_per_25_miles), MAX(Cost_per_25_miles), AVG(Cost_per_25_miles) FROM Vehicles;
SELECT T1.name, T2.model_year FROM Vehicles AS T1 JOIN Vehicles AS T2 ON T1.id = T2.vehicles_id JOIN Discount AS T3 ON T1.id = T3.id JOIN Vehicles AS T4 ON T2.id = T4.vehicles_id JOIN Discount AS T5 ON T4.id = T5.id WHERE T1.City_fuel_economy_rate <= T2.Highway_fuel_economy_rate;
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Vehicles AS T2 ON T1.Model_year = T2.Model_year WHERE T1.City_fuel_economy_rate <= T2.City_fuel_economy_rate;
error: No SQL found in the input string
SELECT T2.Type_of_powertrain, AVG(T3.Cost_per_25_miles) AS Average_Cost FROM Vehicles AS T1 JOIN Discount AS T2 ON T1.id = T2.id JOIN Vehicles AS T3 ON T1.id = T3.id WHERE T2.id IN ( SELECT T2.id FROM Discount AS T2 GROUP BY T2.id HAVING COUNT(T2.id) > 1 ) GROUP BY T2.id
SELECT Customers.name, Customers.age, Discount.membership_credit FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Discount ON Renting_history.discount_id = Discount.id
SELECT Customers.name, Customers.age, Customers.membership_credit FROM Customers;
SELECT Customers.name, Customers.age FROM Customers JOIN ( SELECT customer_id, MAX(membership_credit) as max_credit FROM Renting_history GROUP BY customer_id ) AS max_credit_customers ON Customers.id = max_credit_customers.customer_id JOIN Customers ON Customers.id = max_credit_customers.customer_id WHERE Customers.membership_credit = max_credit_customers.max_credit;
SELECT Customers.name, Customers.age FROM Customers JOIN ( SELECT customer_id, MAX(membership_credit) as max_credit FROM Renting_history GROUP BY customer_id ) as max_credit_customer ON Customers.id = max_credit_customer.customer_id ORDER BY max_credit_customer.max_credit DESC LIMIT 1;
SELECT AVG(Customers.age) FROM Customers WHERE Customers.membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT AVG(Customers.age) AS average_age FROM Customers WHERE Customers.age > (SELECT AVG(Age) FROM Customers)
error: No SQL found in the input string
SELECT Discount.name, Discount.membership_credit, Discount.id FROM Discount JOIN (SELECT id FROM Customers WHERE age = (SELECT MIN(age) FROM Customers)) AS min_age_customers ON Discount.customer_id = min_age_customers.id JOIN (SELECT id FROM Vehicles WHERE Model_year = (SELECT MIN(Model_year) FROM Vehicles)) AS min_model_year_vehicles ON Discount.vehicles_id = min_model_year_vehicles.id WHERE Discount.id IN (SELECT discount_id FROM Renting_history WHERE customer_id IN (SELECT id FROM Customers WHERE age = (SELECT MIN(age) FROM Customers)))
SELECT V.name, SUM(R.total_hours) FROM Vehicles AS V JOIN Renting_history AS R ON V.id = R.vehicles_id GROUP BY V.id
SELECT V.name, SUM(R.total_hours) AS total_rental_hours FROM Vehicles AS V JOIN Renting_history AS R ON V.id = R.vehicles_id JOIN Customers AS C ON R.customer_id = C.id GROUP BY V.name
SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id WHERE T2.discount_id IS NULL
SELECT Vehicles.name FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.customer_id IS NULL
SELECT Customers.name FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id GROUP BY Customers.id HAVING COUNT(*) >= 2
SELECT DISTINCT Customers.name FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id GROUP BY Customers.name HAVING COUNT(DISTINCT Vehicles.id) > 1;
SELECT V.name, V.Model_year FROM Vehicles V JOIN (SELECT discount_id, COUNT(*) as num_renting_history FROM Renting_history GROUP BY discount_id) AS T1 ON V.id = T1.discount_id ORDER BY T1.num_renting_history DESC LIMIT 1;
SELECT V.name, V.Model_year FROM Vehicles AS V JOIN (SELECT discount_id, COUNT(*) as total_rentals FROM Renting_history WHERE customer_id = V.id GROUP BY discount_id) AS T ON V.id = T.discount_id ORDER BY T.total_rentals DESC LIMIT 1;
SELECT V.name FROM Vehicles AS V JOIN Renting_history AS RH ON V.id = RH.vehicles_id JOIN Discount AS D ON RH.discount_id = D.id WHERE D.name = 'no discount' ORDER BY RH.total_hours DESC;
SELECT Vehicles.name, SUM(Vehicles.Cost_per_25_miles) AS Total_Rent FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Vehicles.name ORDER BY Total_Rent DESC;
SELECT T1.name, T1.notes FROM Customers AS T1 JOIN Discount AS T2 ON T1.id = T2.customer_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN ( SELECT discount_id, COUNT(*) as total_rental_history FROM Renting_history GROUP BY discount_id ORDER BY total_rental_history DESC LIMIT 1 ) AS most_rental_history ON Discount.id = most_rental_history.discount_id
SELECT T1.name, T2.type_of_powertrain FROM Vehicles AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.id JOIN Renting_history AS T3 ON T3.customer_id = T2.id AND T3.vehicles_id = T1.id JOIN Vehicles AS T4 ON T3.vehicles_id = T4.id WHERE T3.total_hours > 30 ORDER BY T1.id;
SELECT T1.name, T1.type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id WHERE T2.total_hours > 30;
SELECT AVG(Cost_per_25_miles), AVG(Highway_fuel_economy_rate) FROM Vehicles WHERE Type_of_powertrain = 'Electric'
SELECT T3.Type_of_powertrain, AVG(T1.City_fuel_economy_rate), AVG(T1.Highway_fuel_economy_rate) FROM Vehicles AS T1 JOIN Discount AS T2 ON T1.Model_year = T2.id JOIN Vehicles AS T3 ON T1.Model_year = T3.id WHERE T1.Type_of_powertrain IN ('Electric', 'hybrid', 'electric') GROUP BY T3.Type_of_powertrain;
SELECT AVG(amount_of_loan) AS average_loan_amount FROM Students_Addresses JOIN Students ON Students_Addresses.student_id = Students.student_id;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.student_details, T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id JOIN Transcripts AS T3 ON T2.student_id = T3.student_id WHERE T3.transcript_details LIKE '%data%' AND T1.student_id NOT IN ( SELECT T4.student_id FROM Students_Addresses AS T4 JOIN Classes AS T5 ON T4.student_id = T5.student_id JOIN Transcripts AS T6 ON T5.student_id = T6.student_id WHERE T6.transcript_details LIKE '%net%' )
error: No SQL found in the input string
SELECT T1.bio_data FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Detention AS T3 ON T2.student_id = T3.student_id JOIN Classes AS T4 ON T1.student_id = T4.student_id JOIN Students_Addresses AS T5 ON T4.student_id = T5.student_id JOIN Detention AS T6 ON T5.student_id = T6.student_id WHERE T6.detention_type_code = 'On break' OR T6.detention_type_code = 'Leave for illness' OR T6.detention_type_code = 'During lunchtime' OR T6.detention_type_code = 'After School';
SELECT T1.student_details, T1.bio_data FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Detention AS T3 ON T2.student_id = T3.student_id JOIN Classes AS T4 ON T3.student_id = T4.student_id JOIN Students_Addresses AS T5 ON T4.student_id = T5.student_id JOIN Detention AS T6 ON T5.student_id = T6.student_id JOIN Achievements AS T7 ON T6.student_id = T7.student_id WHERE T3.detention_type_code = 'On break' OR T3.detention_type_code = 'Leave for illness' OR T3.detention_type_code = 'During lunchtime' OR T3.detention_type_code = 'After School';
SELECT T1.student_id, T1.student_details, T1.date_of_transcript FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Classes AS T3 ON T2.address_id = T3.class_id JOIN Students_Addresses AS T4 ON T3.student_id = T4.student_id JOIN Detention AS T5 ON T4.student_id = T5.student_id JOIN Achievements AS T6 ON T5.detention_id = T6.detention_id WHERE T6.student_id IN ( SELECT T1.student_id FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Classes AS T3 ON T2.address_id = T3.class_id JOIN Students_Addresses AS T4 ON T3.student_id = T4.student_id JOIN Detention AS T5 ON T4.student_id = T5.student_id JOIN Achievements AS T6 ON T5.detention_id = T6.detention_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T6.detention_type_code) >= 2 )
SELECT T1.student_id, T1.date_of_loan FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Detention AS T3 ON T2.student_id = T3.student_id JOIN Achievements AS T4 ON T3.detention_id = T4.detention_id GROUP BY T1.student_id HAVING COUNT(T4.student_id) > 1;
SELECT T2.teacher_details, T1.teacher_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id, T1.teacher_id ORDER BY COUNT(*) DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.bio_data, T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id;
SELECT T1.bio_data, T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Students.bio_data, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id ORDER BY Students.bio_data;
error: No SQL found in the input string
-- What is the biographical information of the students who got the most common result for their behaviour monitoring details? SELECT T2.student_details FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Behaviour_Monitoring AS T3 ON T2.student_id = T3.student_id WHERE T3.student_id = (SELECT student_id FROM Students_Addresses WHERE address_type_code = 'Home' GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1)
-- Which students have gone through any event? List the students' biographical data and event date. SELECT Students.biography, Transcript.date_of_transcript FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Transcript ON Student_Events.event_id = Transcript.student_id WHERE Transcript.student_id IN ( SELECT event_id FROM Student_Events GROUP BY event_id HAVING COUNT(event_id) > 0 );
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.teacher_id AS teacher_id, COUNT(T2.teacher_id) AS num_teachers FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Classes AS T3 ON T2.address_id = T3.class_id JOIN Students_Addresses AS T4 ON T3.student_id = T4.student_id JOIN Detention AS T5 ON T4.student_id = T5.student_id JOIN Achievements AS T6 ON T5.detention_id = T6.detention_id WHERE T6.achievement_type_code = 'Scholastic' AND T1.student_id NOT IN ( SELECT T1.student_id FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Classes AS T3 ON T2.address_id = T3.class_id JOIN Students_Addresses AS T4 ON T3.student_id = T4.student_id JOIN Detention AS T5 ON T4.student_id = T5.student_id JOIN Achievements AS T6 ON T5.detention_id = T6.detention_id WHERE T6.achievement_type_code = 'Scholastic' AND T6.achievement_details = 'Gold' ) GROUP BY T2.teacher_id;
SELECT transcript_details, date_of_transcript FROM Transcripts;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.datetime_detention_start, T2.datetime_detention_end FROM Detention AS T2 JOIN Students_Addresses AS T3 ON T2.student_id = T3.student_id JOIN Classes AS T4 ON T3.student_id = T4.student_id JOIN Students AS T5 ON T4.student_id = T5.student_id JOIN Students_Addresses AS T6 ON T5.student_id = T6.student_id JOIN Addresses AS T7 ON T6.address_id = T7.address_id WHERE T3.address_type_code = 'Home' AND T2.detention_type_code = 'On break' ORDER BY T2.datetime_detention_start;
error: No SQL found in the input string
SELECT T1.bio_data FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id WHERE T2.address_type_code = 'Suite' AND T1.student_id IS NOT NULL;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.student_id, T1.student_details FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id WHERE T2.class_id = 'writing';
error: No SQL found in the input string
SELECT T2.teacher_id, COUNT(T2.teacher_id) AS num_courses FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id GROUP BY T2.student_id ORDER BY num_courses DESC LIMIT 1;
SELECT COUNT(DISTINCT Students.student_id) AS max_courses_taken, Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id ORDER BY COUNT(DISTINCT Students.student_id) DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Students.Addres_id, Students.Name FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Classes ON Students.student_id = Classes.student_id WHERE Classes.course_count = 2;
error: No SQL found in the input string
SELECT T2.detention_type_code, T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code = T2.detention_type_code GROUP BY T2.detention_type_code ORDER BY COUNT(*) DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(date_of_loan) FROM Student_Loans;
SELECT MIN(date_of_loan) FROM Student_Loans;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`date_of_transcript` FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id JOIN Behaviour_Monitoring AS T3 ON T2.student_id = T3.student_id JOIN Students_Addresses AS T4 ON T2.student_id = T4.student_id JOIN Addresses AS T5 ON T4.address_id = T5.address_id JOIN Ref_Event_Types AS T6 ON T2.event_type_code = T6.event_type_code JOIN Ref_Achievement_Type AS T7 ON T2.student_id = T7.student_id JOIN Ref_Detention_Type AS T8 ON T2.detention_type_code = T8.detention_type_code JOIN Students_Loans AS T9 ON T2.student_id = T9.student_id JOIN Classes AS T10 ON T9.student_id = T10.student_id JOIN Students_Addresses AS T11 ON T9.student_id = T11.student_id JOIN Detention AS T12 ON T9.detention_type_code = T12.detention_type_code JOIN Achievements AS T13 ON T9.student_id = T13.student_id WHERE T1.student_details = 'Max Loan' ORDER BY T1.student_id ASC LIMIT 1;
SELECT T1.transcript_details FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Detention AS T3 ON T2.student_id = T3.student_id JOIN Classes AS T4 ON T3.detention_type_code = T4.detention_type_code JOIN Ref_Detention_Type AS T5 ON T3.detention_type_code = T5.detention_type_code JOIN Ref_Address_Types AS T6 ON T4.address_type_code = T6.address_type_code JOIN Addresses AS T7 ON T6.address_type_code = T7.address_type_code JOIN Ref_Event_Types AS T8 ON T5.event_type_code = T8.event_type_code JOIN Ref_Achievement_Type AS T9 ON T8.event_type_code = T9.event_type_code JOIN Ref_Detention_Type AS T10 ON T8.detention_type_code = T10.detention_type_code JOIN Transcript AS T11 ON T2.student_id = T11.student_id WHERE T11.student_id = (SELECT student_id FROM Students WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM Students WHERE amount_of_loan > 0)) ORDER BY T11.transcript_details DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Students.student_id, SUM(Students_Addresses.date_from) AS total_loan FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id GROUP BY Students.student_id ORDER BY total_loan DESC;
SELECT Students.student_id, SUM(Students_Addresses.address_type_code) AS total_loan_amount FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id GROUP BY Students.student_id;
error: No SQL found in the input string
SELECT Students.student_id, Students.bio_data, COUNT(DISTINCT Students_Addresses.address_id) AS number_of_courses FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id GROUP BY Students.student_id;
SELECT COUNT(DISTINCT T2.student_id) AS num_students_with_detention FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id JOIN Behaviour_Monitoring AS T3 ON T1.student_id = T3.student_id JOIN Classes AS T4 ON T1.student_id = T4.student_id JOIN Students_Addresses AS T5 ON T1.student_id = T5.student_id JOIN Addresses AS T6 ON T5.address_id = T6.address_id JOIN Ref_Event_Types AS T7 ON T1.student_id = T7.student_id JOIN Ref_Detention_Type AS T8 ON T1.student_id = T8.student_id JOIN Ref_Achievement_Type AS T9 ON T1.student_id = T9.student_id WHERE T1.student_id IN ( SELECT T2.student_id FROM Transcripts AS T2 JOIN Behaviour_Monitoring AS T3 ON T2.student_id = T3.student_id WHERE T3.detention_type_code = 'On break' ) GROUP BY T1.student_id HAVING COUNT(DISTINCT T2.student_id) > 1;
SELECT COUNT(*) FROM Students WHERE student_id IN ( SELECT student_id FROM Students_Addresses WHERE address_type_code = 'Home' )
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.bio_data FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Addresses AS T3 ON T2.address_id = T3.address_id JOIN Detention AS T4 ON T3.address_type_code = T4.address_type_code WHERE T4.detention_id IS NULL;
SELECT T2.date_from, T2.date_to FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Transcripts AS T3 ON T1.student_id = T3.student_id WHERE T3.student_id IN ( SELECT T1.student_id FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Transcripts AS T3 ON T1.student_id = T3.student_id GROUP BY T1.student_id HAVING COUNT(T3.student_id) = 2 )
error: No SQL found in the input string
SELECT T1.student_id FROM Students AS T1 JOIN Student_Details AS T2 ON T1.student_id = T2.student_id JOIN Behaviour_Monitoring AS T3 ON T2.student_id = T3.student_id JOIN Addresses AS T4 ON T2.student_id = T4.student_id JOIN Ref_Event_Types AS T5 ON T2.student_id = T5.student_id JOIN Ref_Achievement_Type AS T6 ON T2.student_id = T6.student_id JOIN Ref_Address_Types AS T7 ON T2.student_id = T7.student_id JOIN Ref_Detention_Type AS T8 ON T2.student_id = T8.student_id JOIN Student_Events AS T9 ON T2.student_id = T9.student_id JOIN Teachers AS T10 ON T2.student_id = T10.teacher_id JOIN Student_Loans AS T11 ON T2.student_id = T11.student_id JOIN Classes AS T12 ON T2.student_id = T12.student_id JOIN Students_Addresses AS T13 ON T2.student_id = T13.student_id JOIN Detention AS T14 ON T2.student_id = T14.student_id WHERE T1.student_id = T3.student_id;
-- Verify the new SQL query against the database SELECT T1.student_address_id, T1.address_id, T1.student_id, T1.datetime_detention_start FROM Students_Addresses AS T1 JOIN Detention AS T2 ON T1.student_address_id = T2.student_address_id WHERE T2.detention_type_code = 'On break';
SELECT DISTINCT T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor = T2.Author ORDER BY T2.SalePrice DESC LIMIT 1;
SELECT DISTINCT Name FROM Author
SELECT DISTINCT Client.Name, Client.Address FROM Client;
SELECT DISTINCT Client.Name, Client.Address FROM Client;
SELECT Title, ISBN, SalePrice FROM Book
SELECT Title, ISBN, SalePrice FROM Book;
error: No SQL found in the input string
SELECT COUNT(*) FROM Author_Book
error: No SQL found in the input string
SELECT COUNT(DISTINCT Author.idAuthor) AS numAuthors FROM Author;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name, Address FROM Client ORDER BY Name;
SELECT DISTINCT T1.Name, T1.Address FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient ORDER BY T1.Name;
SELECT Title, Name FROM Book
SELECT T2.Title, T1.Name FROM Author AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author_Book AS T3 ON T1.ISBN = T3.ISBN JOIN Books_Order AS T4 ON T4.ISBN = T2.ISBN JOIN Orders AS T5 ON T4.IdOrder = T5.IdOrder WHERE T3.ISBN IS NOT NULL ORDER BY T1.Name ASC;
SELECT Orders.IdOrder, Orders.DateOrder FROM Orders JOIN Author ON Orders.IdAuthor = Author.idAuthor JOIN Book ON Orders.ISBN = Book.ISBN WHERE Author.Name = 'Jane Austin' ORDER BY Orders.DateOrder;
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Author ON Orders.Author = Author.idAuthor JOIN Book ON Orders.ISBN = Book.ISBN JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Client ON Author_Book.Author = Client.IdClient WHERE Client.Name IS NOT NULL ORDER BY Orders.DateOrder;
SELECT DISTINCT T1.Name, COUNT(T2.ISBN) AS BookCount FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor = T2.idAuthor JOIN Books_Order AS T3 ON T3.ISBN = T1.ISBN GROUP BY T1.idAuthor ORDER BY BookCount DESC;
SELECT DISTINCT T1.Name, COUNT(*) FROM Author AS T1 JOIN Author_Book AS T2 ON T1.IdAuthor = T2.Author JOIN Books_Order AS T3 ON T3.ISBN = T2.ISBN GROUP BY T1.IdAuthor
SELECT DISTINCT B.ISBN, COUNT(*) AS OrderCount FROM Author AS A JOIN Author_Book AS AB ON A.idAuthor = AB.idAuthor JOIN Book AS B ON A.idAuthor = B.idAuthor JOIN Books_Order AS BO ON B.ISBN = BO.ISBN GROUP BY B.ISBN ORDER BY OrderCount DESC;
SELECT TB3.ISBN AS BookISBN, COUNT(Orders.IdOrder) AS OrderCount FROM Author_Book AS TB1 JOIN Author AS TB2 ON TB1.Author = TB2.idAuthor JOIN Book AS TB3 ON TB1.ISBN = TB3.ISBN JOIN Orders AS TB4 ON TB4.ISBN = TB3.ISBN GROUP BY TB3.ISBN
SELECT DISTINCT T1.ISBN, SUM(T2.amount) AS TotalAmount FROM Author AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN JOIN Books_Order AS T3 ON T3.ISBN = T2.ISBN GROUP BY T1.ISBN ORDER BY TotalAmount DESC;
SELECT DISTINCT T1.ISBN, SUM(T2.amount) AS TotalAmount FROM Author AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN JOIN Books_Order AS T3 ON T3.ISBN = T2.ISBN GROUP BY T1.ISBN ORDER BY TotalAmount DESC;
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE amount = (SELECT MAX(amount) FROM Books_Order))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author = Book.Author ORDER BY Name DESC LIMIT 1)))) ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Title, T3.PurchasePrice FROM Author AS T1 JOIN Book AS T2 ON T1.idAuthor = T2.Author JOIN Books_Order AS T3 ON T2.ISBN = T3.ISBN GROUP BY T2.ISBN ORDER BY SUM(T3.amount) DESC LIMIT 1;
SELECT Title, PurchasePrice FROM Book WHERE ISBN = (SELECT ISBN FROM Books_Order WHERE amount = (SELECT MAX(amount) FROM Books_Order));
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Author_Book WHERE Author = 1))
SELECT DISTINCT Title FROM Book ORDER BY IdOrder DESC LIMIT 10;
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient HAVING COUNT(*) > 0
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient WHERE Orders.DateExped IS NULL
SELECT DISTINCT Client.Name, COUNT(Orders.IdOrder) FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.Name
SELECT DISTINCT T1.Name, COUNT(T2.IdOrder) FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.Name
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(T2.IdOrder) DESC LIMIT 1;
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(T2.IdOrder) DESC LIMIT 1
SELECT C.Name, SUM(O.amount) FROM Client AS C JOIN Orders AS O ON C.IdClient = O.IdClient JOIN Author AS A ON C.idAuthor = A.idAuthor JOIN Book AS B ON A.idBook = B.idBook JOIN Author_Book AS AB ON B.idAuthor = AB.idAuthor JOIN Books_Order AS BO ON B.idBook = BO.idBook GROUP BY C.IdClient
SELECT DISTINCT C.Name, SUM(O.amount) AS TotalAmount FROM Client AS C JOIN Orders AS O ON C.IdClient = O.IdClient JOIN Author AS A ON O.Author = A.IdAuthor JOIN Book AS B ON A.IdAuthor = B.Author GROUP BY C.IdClient ORDER BY TotalAmount DESC;
SELECT T1.Name FROM Client AS T1 JOIN Books_Order AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY SUM(T2.amount) DESC LIMIT 1;
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder JOIN Book AS T4 ON T3.ISBN = T4.ISBN JOIN Author_Book AS T5 ON T4.ISBN = T5.ISBN WHERE T5.Author = T1.Name ORDER BY MIN(T3.amount) DESC LIMIT 1;
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT DISTINCT Client.Name FROM Client WHERE Client.IdClient NOT IN (SELECT Orders.IdClient FROM Orders)
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient WHERE T2.IdOrder IS NULL;
SELECT MAX(Book.SalePrice), MIN(Book.SalePrice) FROM Book;
SELECT MAX(Book.SalePrice), MIN(Book.SalePrice) FROM Book
SELECT AVG(Book.PurchasePrice), AVG(Book.SalePrice) FROM Book
SELECT AVG(T1.SalePrice), AVG(T1.PurchasePrice) FROM Author AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN
SELECT MAX(Book.SalePrice - Book.PurchasePrice) AS max_difference FROM Book;
SELECT MAX(SalePrice - PurchasePrice) AS difference FROM Book;
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT T2.Title FROM Author AS T1 INNER JOIN Author_Book AS T2 ON T1.idAuthor = T2.author INNER JOIN Book AS T3 ON T3.ISBN = T2.ISBN WHERE T3.salePrice = (SELECT MIN(T3.salePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(Book.SalePrice) FROM Author AS Author_Book_Author JOIN Author_Book AS Book ON Author_Book_Author.Author = Book.Author JOIN Book ON Book.ISBN = Book.ISBN WHERE Author_Book_Author.Name = 'George Orwell';
SELECT AVG(Book.SalePrice) FROM Author AS BookAuthor JOIN Author_Book AS BookAuthorBook ON BookAuthor.BookID = BookAuthorBook.Author JOIN Books_Order AS BookOrder ON BookAuthorBook.ISBN = BookOrder.ISBN JOIN Book AS Book ON BookOrder.IdOrder = Book.IdOrder JOIN Author_Book AS AuthorBook ON BookAuthor.Author = Author.BookID WHERE Author.Name = 'George Orwell';
SELECT T3.SalePrice FROM Author AS T1 INNER JOIN Author_Book AS T2 ON T1.idAuthor = T2.author_id INNER JOIN Book AS T3 ON T3.ISBN = T2.ISBN WHERE T1.Name = 'Plato'
SELECT T2.sale_price FROM Author AS T1 INNER JOIN Book AS T2 ON T1.idAuthor = T2.author INNER JOIN Author_Book AS T3 ON T1.idAuthor = T3.author INNER JOIN Books_Order AS T4 ON T3.ISBN = T4.ISBN WHERE T1.Name = 'Plato';
SELECT Title FROM Book WHERE Author = (SELECT Author FROM Author WHERE Name = 'George Orwell') ORDER BY SalePrice ASC LIMIT 1
SELECT Title FROM Book WHERE Author = (SELECT Author FROM Author WHERE Name = 'George Orwell') ORDER BY SalePrice ASC LIMIT 1
SELECT T2.Title FROM Author AS T1 JOIN Book AS T2 ON T1.idAuthor = T2.Author WHERE T1.Name = 'Plato' GROUP BY T1.Name ORDER BY AVG(T2.SalePrice) ASC LIMIT 1;
SELECT T3.Title FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor = T2.author JOIN Book AS T3 ON T3.ISBN = T2.ISBN WHERE T3.SalePrice < (SELECT MIN(T3.SalePrice) FROM Book) GROUP BY T3.ISBN HAVING COUNT(T3.ISBN) = 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM Book WHERE Author = (SELECT Name FROM Author WHERE Name LIKE 'Plato')
SELECT Title FROM Book WHERE Author = (SELECT idAuthor FROM Author WHERE Name = 'Plato')
SELECT COUNT(*) FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Author_Book WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice'))
SELECT COUNT(*) FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Author_Book WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice'))
SELECT DISTINCT IdOrder FROM Orders WHERE Title IN ('Pride and Prejudice', 'The Little Prince')
SELECT DISTINCT O.IdOrder FROM Orders O JOIN Author A ON O.Author = A.idAuthor JOIN Book B ON O.ISBN = B.ISBN WHERE B.Title IN ('Pride and Prejudice', 'The Little Prince')
SELECT DISTINCT B.ISBN FROM Author AS A JOIN Book AS B ON A.Author = B.Author JOIN Author_Book AS AB ON A.Author = AB.Author JOIN Books_Order AS BO ON AB.ISBN = BO.ISBN JOIN Orders AS O ON BO.IdOrder = O.IdOrder JOIN Client AS C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' OR C.Name = 'James Smith' GROUP BY B.ISBN HAVING COUNT(*) > 1;
SELECT DISTINCT B.ISBN FROM Author AS A JOIN Book AS B ON A.ISBN = B.ISBN JOIN Author_Book AS AB ON A.ISBN = AB.Author JOIN Orders AS O ON AB.ISBN = O.ISBN JOIN Client AS C ON O.IdClient = C.IdClient WHERE C.Name IN ('Peter Doe', 'James Smith') ORDER BY B.SalePrice DESC LIMIT 1;
SELECT T2.Title FROM Author AS T1 INNER JOIN Book AS T2 ON T1.ISBN = T2.ISBN WHERE T1.Name = 'Peter Doe' AND T2.Author = 'James Smith' AND T1.Name != 'James Smith' AND T2.SalePrice IS NOT NULL
SELECT T2.Title FROM Orders AS T2 JOIN Author AS T3 ON T2.IdAuthor = T3.IdAuthor WHERE T3.Name = 'Peter Doe' AND T2.IdOrder NOT IN (SELECT T2.IdOrder FROM Orders AS T2 JOIN Author AS T3 ON T2.IdAuthor = T3.IdAuthor WHERE T3.Name = 'James Smith')
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Author ON Author.Book.Author = Orders.Book JOIN Author_Book ON Author.Book.ISBN = Author_Book.ISBN JOIN Book ON Author_Book.ISBN = Book.ISBN JOIN Author ON Book.Author = Author WHERE Book.Title = 'Pride and Prejudice' ORDER BY Client.Name ASC
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Author ON Author.Book.Author = Orders.Book.ISBN JOIN Author_Book ON Author_Book.ISBN = Author.Book.ISBN JOIN Book ON Book.ISBN = Author_Book.ISBN WHERE Book.Title = 'Pride and Prejudice';
SELECT COUNT(Book_ID) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT Book.Title, MAX(Chapters) AS Max_Chapters, MIN(Chapters) AS Min_Chapters FROM book GROUP BY Book.Title
SELECT Title FROM book WHERE Type != 'Poet'
SELECT AVG(Rating) FROM review
SELECT Title, Rating FROM book WHERE Book_ID IN (SELECT Book_ID FROM review GROUP BY Book_ID HAVING COUNT(*) > 1);
SELECT Rating FROM review WHERE Rank = (SELECT MAX(Rank) FROM review)
error: No SQL found in the input string
SELECT Title FROM book WHERE Rank = (SELECT MIN(Rank) FROM book)
SELECT AVG(Rank) FROM review WHERE Book_ID IN (SELECT Book_ID FROM book WHERE Type = 'Novel')
SELECT Type, COUNT(*) FROM book GROUP BY Type
SELECT Type FROM book GROUP BY Type ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT Type FROM book WHERE Book_ID IN ( SELECT Book_ID FROM ( SELECT Book_ID, COUNT(*) as count FROM review GROUP BY Book_ID HAVING count >= 3 ) AS subquery )
SELECT Title FROM book ORDER BY Rating ASC
SELECT Title, Audio FROM book ORDER BY (SELECT COUNT(*) FROM review) DESC
SELECT COUNT(DISTINCT book_id) FROM review
SELECT T1.Type FROM book AS T1 JOIN ( SELECT Book_ID, COUNT(*) AS chapters_count FROM review GROUP BY Book_ID HAVING COUNT(*) > 75 ) AS T2 ON T1.Book_ID = T2.Book_ID JOIN ( SELECT Book_ID, COUNT(*) AS chapters_count FROM review GROUP BY Book_ID HAVING COUNT(*) < 50 ) AS T3 ON T1.Book_ID = T3.Book_ID WHERE T2.chapters_count > T3.chapters_count;
SELECT COUNT(DISTINCT Type) FROM book
SELECT T1.Type, T1.Title FROM book AS T1 EXCEPT SELECT T2.Type, T2.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID
SELECT COUNT(DISTINCT customer_id) AS Total_Customers FROM customer;
SELECT COUNT(*) FROM customer;
SELECT Name FROM customer ORDER BY Level_of_Membership ASC;
SELECT Name FROM customer ORDER BY Level_of_Membership ASC;
SELECT Nationality, Card_Credit FROM customer
SELECT T1.Nationality, T1.Card_Credit FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID
SELECT DISTINCT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN branch AS T3 ON T2.Branch_ID = T3.Branch_ID WHERE T1.Nationality IN ('England', 'Australia')
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T1.Nationality IN ('England', 'Australia')
SELECT AVG(`Card_Credit`) FROM customer WHERE Level_of_Membership = 1
SELECT AVG(co.quantity) FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID JOIN branch AS b ON co.Branch_ID = b.Branch_ID WHERE c.Level_of_Membership = 2;
SELECT Card_Credit FROM customer WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer)
SELECT c.Name, c.Card_Credit FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID JOIN branch b ON co.Branch_ID = b.Branch_ID WHERE c.Level_of_Membership = (SELECT MIN(Level_of_Membership) FROM customer) ORDER BY c.Card_Credit DESC LIMIT 1;
SELECT T1.Nationality, COUNT(*) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Nationality
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT T1.Nationality, COUNT(*) AS Frequency FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Nationality ORDER BY Frequency DESC LIMIT 1;
SELECT T1.Nationality FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT T1.Nationality FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN branch AS T3 ON T2.Branch_ID = T3.Branch_ID WHERE T1.Card_Credit < 50 AND T1.Card_Credit > 75;
SELECT T1.Nationality FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T1.Card_Credit > 50 AND T1.Card_Credit < 75
SELECT c.Name, d.Dish_Name FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID JOIN branch AS b ON co.Branch_ID = b.Branch_ID JOIN dish AS d ON d.Dish_Name = co.Dish_Name;
SELECT c.Name, d.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID JOIN branch b ON c.Branch_ID = b.Branch_ID JOIN dish d ON co.Dish_Name = d.Dish_Name;
SELECT c.Name, d.Dish_Name FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID JOIN branch AS b ON co.Branch_ID = b.Branch_ID WHERE b.Branch_ID = (SELECT Branch_ID FROM customer ORDER BY Quantity DESC LIMIT 1) ORDER BY Quantity DESC;
SELECT c.Name, c.Dish_Name FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID JOIN branch AS b ON c.Branch_ID = b.Branch_ID WHERE b.Branch_ID = (SELECT Branch_ID FROM customer WHERE Name = 'Sid Barnes') ORDER BY co.Quantity DESC;
SELECT T1.Name, SUM(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID
SELECT c.Name, SUM(co.Quantity) AS Total_Dishes FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID
SELECT Name FROM customer WHERE Customer_ID IN ( SELECT Customer_ID FROM customer_order WHERE Quantity > 1 )
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID HAVING SUM(T2.Quantity) > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT manager FROM branch
SELECT DISTINCT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Quantity = 0
SELECT DISTINCT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Branch_ID IS NULL
error: No SQL found in the input string
SELECT Name FROM member ORDER BY Age ASC;
SELECT Name, nationality FROM member
SELECT DISTINCT member.name FROM member JOIN club ON member.Member_ID = club.Member_ID JOIN club_leader ON club_leader.Member_ID = member.Member_ID WHERE club_leader.Year_Join = (SELECT MIN(year_join) FROM club_leader) AND club_leader.Nationality != 'England';
SELECT Name FROM member WHERE Age IN (19, 20)
error: No SQL found in the input string
SELECT nationality, COUNT(*) FROM member GROUP BY nationality
SELECT nationality, COUNT(*) AS count FROM member GROUP BY nationality ORDER BY count DESC LIMIT 1
SELECT DISTINCT T1.Nationality FROM member AS T1 JOIN club AS T2 ON T1.Member_ID = T2.Member_ID JOIN club_leader AS T3 ON T2.Club_ID = T3.Club_ID WHERE T3.Year_Join IS NOT NULL AND T3.Club_ID = T2.Club_ID AND COUNT(T1.Member_ID) >= 2
SELECT T2.Club_Name, T1.Club_ID FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID = T2.Club_ID JOIN member AS T3 ON T2.Member_ID = T3.Member_ID
SELECT T1.Club_Name FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Year_Join > 100
SELECT T2.Club_Name, T1.Year_Join FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Year_Join < 2018;
SELECT T1.Team_Leader FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Club_Name = 'Houston'
SELECT DISTINCT member.name FROM member JOIN club_leader ON member.Member_ID = club_leader.Member_ID WHERE club_leader.Club_ID IS NULL
SELECT T1.Nationality FROM member AS T1 JOIN club AS T2 ON T1.Member_ID = T2.Member_ID WHERE T1.Age > 22 AND T1.Age < 19 AND T2.Team_Leader = 'No award given';
SELECT AVG(Age) FROM club_leader
SELECT T1.Club_Name FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Year_Join LIKE '%state%'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Collection_Name, T2.Collection_Description FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Top collection'
error: No SQL found in the input string
SELECT Document_Subset_Name FROM Document_Subsets
SELECT DISTINCT Document_Subset_Name FROM Document_Subsets
SELECT T1.`Document_Subset_Name`, T2.`Description` FROM Document_Subsets AS T1 JOIN Collection_Subsets AS T2 ON T1.`Collection_Subset_ID` = T2.`Collection_Subset_ID` JOIN Documents_in_Collections AS T3 ON T3.`Document_Object_ID` = T1.`Document_Object_ID` JOIN Documents_in_Collections AS T4 ON T4.`Document_Object_ID` = T3.`Document_Object_ID` JOIN Collection_Subset_Members AS T5 ON T5.`Collection_ID` = T4.`Collection_ID` JOIN Collections AS T6 ON T6.`Collection_ID` = T5.`Collection_ID` JOIN Document_Subsets AS T7 ON T7.`Document_Subset_ID` = T1.`Document_Subset_ID` WHERE T7.`Document_Subset_Name` = 'Best for 2000'
SELECT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Documents_in_Collections;
error: No SQL found in the input string
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Owner = 'Marlin' GROUP BY Document_Object_ID;
error: No SQL found in the input string
SELECT DISTINCT Owner FROM Collection_Subsets WHERE Collection_Name = 'Braeden Collection'
SELECT T1.Owner FROM Document_Objects AS T1 INNER JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID INNER JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID WHERE T3.Collection_Name = 'Braeden Collection' AND T1.Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Collection_Subsets WHERE Collection_Name = 'Braeden Collection') AND Related_Document_Object_ID IS NOT NULL)
error: No SQL found in the input string
SELECT Owner FROM Document_Objects WHERE Owner IN ('Ransom', 'Marlin', 'Braeden')
SELECT DISTINCT T1.Collection_Description FROM Documents_in_Collections AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_ID = T2.Collection_ID JOIN Collection_Subsets_Members AS T3 ON T2.Collection_Subset_ID = T3.Collection_Subset_ID JOIN Documents_in_Collections AS T4 ON T3.Document_Object_ID = T4.Document_Object_ID JOIN Collection_Subsets AS T5 ON T4.Collection_ID = T5.Collection_ID WHERE T5.Collection_Description = (SELECT MIN(Collection_Description) FROM Collection_Subsets)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT Owner) FROM Documents_in_Collections WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID NOT IN (SELECT Collection_ID FROM Collection_Subset_Members WHERE Related_Collection_ID IN (SELECT Collection_ID FROM Collection_Subset_Members WHERE Related_Collection_ID = Documents_in_Collections.Collection_ID))
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID NOT IN (SELECT Collection_ID FROM Collection_Subset_Members)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Collection_Name FROM Collection_Subsets AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.Collection_Description FROM Collection_Subsets AS T1 INNER JOIN Document_Subsets AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID WHERE T1.Collection_Description = 'Best'
error: No SQL found in the input string
SELECT DS2.Collection_Name FROM Documents_in_Collections AS DI JOIN Document_Objects AS DO ON DI.Document_Object_ID = DO.Document_Object_ID JOIN Document_Subsets AS DS ON DO.Document_Subset_ID = DS.Document_Subset_ID JOIN Collection_Subsets AS CS ON DS.Collection_ID = CS.Collection_ID JOIN Document_Subsets_Members AS DSM ON CS.Collection_Subset_ID = DSM.Document_Subset_ID JOIN Collection_Subsets_Members AS CMS ON DSM.Collection_ID = CMS.Collection_ID JOIN Document_Subsets AS DS2 ON CMS.Document_Subset_ID = DS2.Document_Subset_ID WHERE DI.Collection_ID = 'Nice' ORDER BY DS2.Collection_Name;
SELECT C.Collection_Name FROM Collection_Subsets AS CS JOIN Collection_Subset_Members AS CM ON CS.Collection_ID = CM.Collection_ID JOIN Collection_Subsets AS CSM ON CSM.Collection_ID = CM.Collection_ID WHERE CM.Collection_ID IS NULL ORDER BY CSM.Collection_ID;
SELECT DISTINCT T1.Collection_Name FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID WHERE T3.Collection_ID != T1.Collection_ID
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Document_Object_ID IN ( SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = ( SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2007' ) )
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Document_Object_ID IN (SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2007'))
SELECT COUNT(DISTINCT Collection_ID) FROM Collections WHERE Collection_Name = 'Best'
SELECT COUNT(DISTINCT Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN ( SELECT Collection_ID FROM Collection_Subsets WHERE Owner = 'Ransom' )
error: No SQL found in the input string
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS Collection_Count FROM Document_Subsets JOIN Collection_Subsets ON Document_Subsets.Document_Subset_ID = Collection_Subsets.Document_Subset_ID GROUP BY Collection_Subset_ID
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(DISTINCT Document_Object_ID) FROM Document_Subsets GROUP BY Collection_Subset_ID
SELECT Document_Object_ID, COUNT(*) FROM Documents_in_Collections GROUP BY Document_Object_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Document_Object_ID, COUNT(DISTINCT related_document_object_id) AS num_children FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID JOIN Document_Subsets ON Document_Objects.Document_Object_ID = Document_Subsets.Document_Object_ID JOIN Collection_Subsets ON Document_Subsets.Collection_ID = Collection_Subsets.Collection_ID JOIN Collections ON Collection_Subsets.Collection_ID = Collections.Collection_ID GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(DISTINCT Document_Object_ID) AS Related_Documents FROM Documents_in_Collections GROUP BY Document_Object_ID ORDER BY Related_Documents DESC LIMIT 1;
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Document_Object_ID, COUNT(*) FROM Documents_in_Collections GROUP BY Document_Object_ID HAVING COUNT(*) BETWEEN 2 AND 4
SELECT Documents_in_Collections.Document_Object_ID, COUNT(DISTINCT Document_Subsets.Document_Subset_ID) FROM Documents_in_Collections JOIN Document_Subsets ON Documents_in_Collections.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Collection_Subsets ON Documents_in_Collections.Collection_ID = Collection_Subsets.Collection_ID JOIN Document_Subsets ON Documents_in_Collections.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Documents_in_Collections.Collection_ID IN (SELECT Collection_ID FROM Collection_Subsets WHERE Collection_Subset_Name LIKE 'Best for %') GROUP BY Documents_in_Collections.Document_Object_ID HAVING COUNT(DISTINCT Document_Subsets.Document_Subset_ID) BETWEEN 2 AND 4;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS Document_Count FROM Document_Subsets GROUP BY Document_Subset_ID ORDER BY Document_Count DESC;
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS Document_Count FROM Document_Subsets GROUP BY Document_Subset_ID
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS Document_Count FROM Document_Subsets GROUP BY Document_Subset_ID ORDER BY Document_Count DESC LIMIT 1;
SELECT Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS Document_Count FROM Document_Subsets GROUP BY Document_Subset_Name ORDER BY Document_Count DESC LIMIT 1;
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best for 2000')
SELECT T1.Document_Subset_Name, T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID JOIN Collection_Subsets AS T3 ON T2.Collection_ID = T3.Collection_ID JOIN Collections AS T4 ON T3.Collection_ID = T4.Collection_ID WHERE T4.Collection_Name = 'Best';
SELECT Document_Subset_Name, Document_Subset_ID FROM Document_Subsets
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Collection_ID, COUNT(*) AS Document_Count FROM Documents_in_Collections GROUP BY Collection_ID
SELECT Document_Object_ID, COUNT(Collection_ID) AS Collection_Count FROM Documents_in_Collections GROUP BY Document_Object_ID;
SELECT COUNT(DISTINCT Document_Object_ID) FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT Document_Object_ID) FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID JOIN Collection_Subsets ON Documents_in_Collections.Collection_ID = Collection_Subsets.Collection_ID JOIN Collection_Subsets_Members ON Collection_Subsets.Collection_ID = Collection_Subsets_Members.Collection_ID JOIN Document_Subsets ON Collection_Subsets.Collection_ID = Collection_Subsets_Members.Collection_ID JOIN Document_Subsets_Members ON Document_Subsets.Collection_ID = Document_Subsets_Members.Collection_ID JOIN Collections ON Collection_Subsets_Members.Collection_ID = Collections.Collection_ID JOIN Document_Subsets ON Collection_Subsets.Collection_ID = Document_Subsets.Collection_ID JOIN Document_Subsets ON Document_Subsets_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Collection_Name = 'Best'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Description = 'Best for 2000')
SELECT DISTINCT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN ( SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best' AND Collection_Description = 'Best for 2000') ) UNION SELECT DISTINCT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN ( SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') )
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subsets WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') OR Document_Object_ID IN (SELECT Document_Object_ID FROM Documents_in_Collections WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Description = 'Best for 2000'))
SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') OR Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Description = 'Best for 2000')
SELECT DISTINCT T1.Collection_Name FROM Collection_Subset_Members AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID WHERE T3.Collection_Name = 'Best'
error: No SQL found in the input string
SELECT COUNT(DISTINCT Collection_ID) FROM Collections WHERE Collection_Name = 'Best';
SELECT COUNT(DISTINCT Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID IN ( SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best' )
SELECT T2.Collection_Name FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best'
SELECT DISTINCT Collection_Subset_ID FROM Collection_Subsets WHERE Collection_Name = 'Best'
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%';
SELECT name FROM songs ORDER BY name ASC
SELECT name, language FROM songs;
SELECT MAX(voice_sound_quality), MIN(voice_sound_quality) FROM performance_score;
SELECT T1.voice_sound_quality, T1.rhythm_tempo, T1.stage_presence FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id = T2.id WHERE T2.name = 'Freeway'
SELECT T1.id, T1.language, T1.original_artist FROM songs AS T1 JOIN performance_score AS T2 ON T1.id = T2.songs_id WHERE T1.name != 'Love'
SELECT s.name, s.original_artist FROM songs s JOIN performance_score ps ON s.id = ps.songs_id WHERE ps.voice_sound_quality = (SELECT MIN(voice_sound_quality) FROM performance_score) AND ps.rhythm_tempo = (SELECT MIN(rhythm_tempo) FROM performance_score) AND ps.rhythm_tempo = 'All the streets of love'
SELECT DISTINCT T1.stage_presence FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T2.language = 'English'
SELECT participants.id, participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id GROUP BY participants.id, participants.name HAVING COUNT(songs_id) >= 2
SELECT p.id, p.name, p.popularity FROM participants p JOIN ( SELECT participant_id, COUNT(*) as song_count FROM performance_score GROUP BY participant_id ORDER BY song_count DESC ) s ON p.id = s.participant_id ORDER BY s.song_count DESC;
SELECT T1.id, T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id = T2.participant_id WHERE T2.voice_sound_quality = 5 OR T2.rhythm_tempo = 5
SELECT T1.voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T2.name = 'The Balkan Girls' AND T2.language = 'English'
SELECT T1.id, T1.name FROM songs AS T1 JOIN performance_score AS T2 ON T1.id = T2.songs_id ORDER BY T2.voice_sound_quality DESC LIMIT 1;
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(*) FROM performance_score WHERE songs_id NOT IN (SELECT id FROM songs)
SELECT l.language, AVG(ps.rhythm_tempo) AS average_rhythm_tempo FROM songs s JOIN performance_score ps ON s.id = ps.songs_id JOIN language l ON s.language = l.language GROUP BY l.language
SELECT DISTINCT participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'English';
SELECT T1.name, T1.popularity FROM participants AS T1 JOIN ( SELECT id, name FROM participants WHERE original_artist = 'Urban Symphony' AND language = 'Croatian' GROUP BY id, name HAVING COUNT(*) > 1 ) AS T2 ON T1.id = T2.id JOIN ( SELECT id, name FROM participants WHERE original_artist = 'Urban Symphony' AND language = 'English' GROUP BY id, name HAVING COUNT(*) > 1 ) AS T3 ON T1.id = T3.id WHERE T2.name IN ('Todas as ruas do amor', 'This Is Our Night') AND T3.name IN ('Todas as ruas do amor', 'This Is Our Night')
SELECT DISTINCT T1.name FROM songs AS T1 JOIN performance_score AS T2 ON T1.id = T2.songs_id WHERE T2.voice_sound_quality >= 8.0 AND T2.rhythm_tempo >= 10.0
SELECT T1.original_artist, T2.voice_sound_quality FROM participants AS T1 JOIN songs AS T2 ON T1.id = T2.participant_id JOIN performance_score AS T3 ON T1.id = T3.participant_id WHERE T2.rhythm_tempo > 5 ORDER BY T3.voice_sound_quality DESC;
SELECT COUNT(city_code) FROM City;
SELECT COUNT(city_code) FROM City;
SELECT DISTINCT state FROM City;
SELECT DISTINCT state FROM City;
SELECT COUNT(DISTINCT country) AS num_countries FROM City;
SELECT COUNT(city_code) FROM City;
SELECT city_name, state, country FROM City;
SELECT city_name, city_code, state, country FROM City;
SELECT T1.latitude, T1.longitude FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.city1_code = 'Baltimore'
SELECT T1.latitude, T1.longitude FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.city1_code = 'Baltimore'
SELECT DISTINCT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code WHERE T1.state = 'PA';
SELECT DISTINCT city_name FROM City WHERE country = 'USA' AND state = 'PA'
SELECT COUNT(DISTINCT City_code) FROM City WHERE country = 'Canada'
SELECT COUNT(city_code) FROM City WHERE country = 'Canada'
SELECT DISTINCT T1.city_name, T1.latitude FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code ORDER BY T2.latitude;
SELECT DISTINCT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code ORDER BY T2.latitude;
SELECT state, COUNT(city_code) FROM City GROUP BY state
SELECT state, COUNT(city_code) FROM City GROUP BY state
SELECT country, COUNT(city_code) FROM City GROUP BY country
SELECT country, COUNT(city_code) FROM City GROUP BY country
SELECT DISTINCT T1.state FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.state HAVING COUNT(T2.city1_code) >= 2
SELECT DISTINCT T1.state FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.state HAVING COUNT(T2.city1_code) >= 2
SELECT T2.state FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.city_code ORDER BY COUNT(T1.city_code) DESC LIMIT 1
SELECT T2.state FROM City AS T1 JOIN Direct_distance AS T3 ON T1.city_code = T3.city2_code GROUP BY T1.city_code ORDER BY COUNT(T1.city_code) DESC LIMIT 1
SELECT T1.country FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.country ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.country FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.city_code ORDER BY COUNT(T2.city1_code) ASC LIMIT 1
SELECT T1.Fname, T1.Lname FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.state = 'MD'
SELECT T1.Fname, T1.Lname FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.state = 'MD' ORDER BY T1.Fname, T1.Lname
SELECT COUNT(*) FROM Student WHERE city_name = 'China'
SELECT COUNT(*) FROM Student WHERE city_code IN (SELECT city_code FROM City WHERE state = 'CHINA')
SELECT S.Fname, S.Major FROM Student AS S WHERE S.city_code = (SELECT city_code FROM City WHERE city_name = 'Baltimore')
SELECT T1.Fname, T1.Major FROM Student AS T1 JOIN Direct_distance AS D ON T1.city_code = D.city2_code JOIN City AS C ON D.city1_code = C.city_code WHERE T1.state = 'MD' AND T1.country = 'USA';
SELECT DISTINCT T1.country, COUNT(*) FROM Student AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.country
SELECT T1.country, COUNT(*) FROM Student AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.country
SELECT DISTINCT city_name, COUNT(*) FROM Student GROUP BY city_name;
SELECT DISTINCT T1.city_name, COUNT(*) FROM Student AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.city_name HAVING COUNT(*) > 1;
SELECT T1.state, COUNT(*) FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T1.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.country FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.country IS NULL ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.country FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.country IS NULL ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_code HAVING COUNT(T2.city_code) >= 3
SELECT DISTINCT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_code HAVING COUNT(T2.city_code) >= 3
SELECT DISTINCT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state HAVING COUNT(T1.city_code) > 5
SELECT DISTINCT T1.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.state IS NOT NULL AND T1.city_code IN (SELECT city_code FROM Direct_distance GROUP BY city_code HAVING COUNT(city_code) > 5)
SELECT DISTINCT Student.StuID FROM Student WHERE Student.city_code NOT IN ( SELECT DISTINCT Direct_distance.city2_code FROM Direct_distance WHERE Direct_distance.city1_code = Student.city_code )
SELECT DISTINCT Student.StuID FROM Student WHERE Student.city_code NOT IN ( SELECT DISTINCT Direct_distance.city2_code FROM Direct_distance WHERE Direct_distance.city1_code = Student.city_code AND Direct_distance.city2_code = 'USA' )
SELECT DISTINCT T1.student_id FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code JOIN Direct_distance AS D ON T2.city_code = D.city2_code WHERE T1.sex = 'F' AND T2.state = 'PA';
SELECT DISTINCT T1.StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Sex = 'F' AND T2.state = 'PA'
SELECT DISTINCT T1.student_id FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.state = 'TX' OR T2.state = 'TX' AND T1.sex = 'M';
SELECT DISTINCT T1.student_id FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.sex = 'M' AND T2.country = 'USA' AND T1.city_code NOT IN ( SELECT DISTINCT T3.city_code FROM Direct_distance AS T3 WHERE T3.city2_code = T2.city_code )
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT distance FROM Direct_distance WHERE city1_code = 'Boston' AND city2_code = 'Newark'
SELECT AVG(DISTANCE), MIN(DISTANCE), MAX(DISTANCE) FROM Direct_distance
SELECT AVG(T1.city_name), MIN(T1.city_name), MAX(T1.city_name) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city_code;
SELECT DISTINCT T1.city_code FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code WHERE T2.distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT DISTINCT city_code FROM City WHERE city_name IN (SELECT city_name FROM Direct_distance GROUP BY city_name ORDER BY COUNT(*) DESC LIMIT 1)
SELECT DISTINCT T1.city_code FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.distance > (SELECT AVG(T2.distance) FROM Direct_distance AS T2)
SELECT DISTINCT T1.city_code FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.distance > (SELECT AVG(T2.distance) FROM Direct_distance AS T2)
SELECT DISTINCT T1.city_code FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code WHERE T2.distance < 1000
SELECT DISTINCT city_code FROM City WHERE country = 'USA' AND latitude > 39 AND longitude > -120 AND latitude < 40 AND longitude < -110
SELECT SUM(DISTANCE) FROM Direct_distance WHERE city1_code = 'BAL'
SELECT SUM(DISTANCE) FROM Direct_distance WHERE city1_code = 'BAL'
SELECT AVG(DISTANCE) FROM Direct_distance WHERE city1_code = 'Boston' AND city2_code IN ( SELECT city_code FROM Direct_distance GROUP BY city_code HAVING COUNT(city_code) > 1 );
SELECT AVG(DISTANCE) FROM Direct_distance WHERE city1_code = 'Boston'
SELECT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city_code WHERE T2.distance < (SELECT MAX(distance) FROM Direct_distance)
SELECT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.distance < (SELECT MAX(distance) FROM Direct_distance)
SELECT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.distance > (SELECT AVG(distance) FROM Direct_distance WHERE city1_code = 'Boston')
SELECT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city_code WHERE T2.distance = (SELECT MAX(distance) FROM Direct_distance);
SELECT DISTINCT city_code, SUM(DISTINCT Direct_distance.distance) AS total_distance FROM Direct_distance JOIN City ON Direct_distance.city1_code = City.city_code JOIN City ON Direct_distance.city2_code = City.city_code GROUP BY city_code;
SELECT DISTINCT T1.city_code, SUM(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.city_code;
SELECT DISTINCT T1.city_name, AVG(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code GROUP BY T1.city_name
SELECT DISTINCT T1.city_name, AVG(T2.distance) AS avg_distance FROM Student AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_name ORDER BY T1.city_name ASC
SELECT T3.distance FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code JOIN Direct_distance AS T3 ON T2.city_code = T3.city1_code WHERE T1.Fname = 'Linda' AND T1.Lname = 'Smith' AND T1.Fname = 'Tracy' AND T1.Lname = 'Kim'
SELECT T2.distance FROM Student AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T1.Fname = 'Linda' AND T1.Lname = 'Smith' OR T1.Fname = 'Tracy' AND T1.Lname = 'Kim'
SELECT T1.Fname, T1.Lname FROM Student AS T1 JOIN Direct_distance AS D ON T1.city_code = D.city2_code WHERE T1.city_name = 'Linda Smith' ORDER BY T1.city_code DESC LIMIT 1;
SELECT T1.Fname, T1.Lname FROM Student AS T1 JOIN Direct_distance AS D ON T1.city_code = D.city1_code WHERE T1.city_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND Lname = 'Smith')
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.fname = 'Linda'
SELECT name FROM Sailors WHERE age > 30;
SELECT S.name, B.name, B.color, R.day FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.age > 30;
SELECT S.name, S.age FROM Sailors AS S WHERE S.age < 30;
SELECT S.name, S.age FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid WHERE R.day < '9/15'
SELECT Boats.name, Boats.color FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = 1;
SELECT DISTINCT Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.sid = 1;
error: No SQL found in the input string
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Reserves.day = '9/15' ORDER BY Reserves.day ASC LIMIT 1;
SELECT DISTINCT bid FROM Reserves
SELECT bid FROM Reserves WHERE sid IN (SELECT sid FROM Sailors)
SELECT DISTINCT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.name LIKE '%e%';
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT DISTINCT Reserves.sid FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.rating > ALL(SELECT rating FROM Reserves WHERE sid = Reserves.sid) ORDER BY Sailors.rating DESC LIMIT 1;
SELECT DISTINCT Reserves.sid FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.rating != (SELECT MIN(Sailors.rating) FROM Sailors)
SELECT DISTINCT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.rating > 7 AND R.day IN ('9/15', '9/14', '9/13', '9/12')
SELECT DISTINCT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.rating > 7 AND R.day IN ('9/15', '9/14', '9/13', '9/12') ORDER BY S.name;
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid GROUP BY S.sid HAVING COUNT(DISTINCT R.day) >= 1
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid GROUP BY S.sid HAVING COUNT(DISTINCT B.name) > 0
SELECT Reserves.sid, Reserves.name FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Reserves.sid HAVING COUNT(DISTINCT Boats.bid) > 1;
SELECT DISTINCT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Sailors.sid HAVING COUNT(DISTINCT Boats.bid) > 1
SELECT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Boats.color = 'red' OR Boats.color = 'blue';
SELECT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' OR Boats.color = 'blue';
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red' OR B.color = 'blue';
SELECT S.name, B.name, R.day FROM Sailors AS S JOIN Boats AS B ON S.sid = B.sid JOIN Reserves AS R ON S.sid = R.sid WHERE B.color = 'red' OR B.color = 'blue';
SELECT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Boats.color = 'red' AND Boats.color = 'blue';
SELECT Sailors.sid, Boats.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' AND Boats.color = 'blue'
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red' AND B.color = 'blue';
SELECT S.name, B.name, R.day FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.name IN ('Melon', 'Mars', 'Legacy') AND B.color = 'red' AND B.color = 'blue';
SELECT sid FROM Reserves WHERE bid NOT IN (SELECT bid FROM Boats)
SELECT sid FROM Reserves WHERE bid NOT IN (SELECT bid FROM Boats)
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid WHERE R.day NOT IN ( SELECT B.bid FROM Boats AS B JOIN Reserves AS R ON B.bid = R.bid );
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid WHERE R.day NOT IN ( SELECT bid FROM Boats )
SELECT sid FROM Reserves WHERE bid NOT IN (SELECT bid FROM Boats)
SELECT sid FROM Reserves WHERE bid NOT IN (SELECT bid FROM Boats WHERE sid IN (SELECT sid FROM Sailors))
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.id = 103
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.id = 103
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid JOIN Boat AS B2 ON B.bid = B2.bid WHERE S.rating > 'Luis' ORDER BY S.rating DESC;
SELECT S.name, B.name FROM Sailors AS S JOIN Boats AS B ON S.sid = B.sid JOIN Reserves AS R ON S.sid = R.sid WHERE S.rating > (SELECT MIN(S.rating) FROM Sailors WHERE name = 'Luis')
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.rating > ( SELECT MIN(S2.rating) FROM Sailors AS S2 JOIN Reserves AS R2 ON S2.sid = R2.sid JOIN Boats AS B2 ON R2.bid = B2.bid WHERE S2.name = 'Luis' ) ORDER BY S.name;
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.rating > ( SELECT MIN(S2.rating) FROM Sailors AS S2 WHERE S2.sid = S.sid )
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.rating > 2;
SELECT S.name, S.sid FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE S.rating >= 3;
error: No SQL found in the input string
SELECT S.name, S.age FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid WHERE R.day = (SELECT MAX(day) FROM Reserves) ORDER BY S.age DESC LIMIT 1;
error: No SQL found in the input string
SELECT COUNT(sid) FROM Sailors
SELECT AVG(Sailors.age) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Legacy' AND Sailors.rating = 7;
SELECT AVG(Sailors.age) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid JOIN Boat ON Boats.bid = Sailors.bid WHERE Sailors.rating = 7;
SELECT COUNT(DISTINCT Reserves.sid) FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.name LIKE 'D%';
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%';
SELECT AVG(rating), MAX(age) FROM Sailors;
SELECT AVG(rating), MAX(age) FROM Sailors;
SELECT Boats.name, COUNT(Reserves.day) FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Boats.name
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid
SELECT COUNT(*) FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE sid > 50)
SELECT COUNT(*) FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE sid > 50)
SELECT Boats.name, COUNT(Reserves.day) AS num_reservations FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Boats.name HAVING COUNT(Reserves.day) > 1
SELECT bid, COUNT(*) AS count FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Reserves.day IN ('9/15', '9/14', '9/13', '9/12') GROUP BY bid HAVING count > 1
SELECT Boats.name, COUNT(Reserves.day) FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.sid > 1 GROUP BY Boats.name
SELECT bid, COUNT(day) FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid GROUP BY bid
SELECT s.rating, AVG(r.age) AS average_age FROM Reserves r JOIN Sailors s ON r.sid = s.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' GROUP BY s.rating
SELECT r.rating, AVG(rs.age) AS average_age FROM Sailors AS rs JOIN Reserves AS rsv ON rs.sid = rsv.sid JOIN Boats AS b ON rs.bid = b.bid JOIN Boat AS b2 ON b.name = b2.name JOIN Sailors AS s ON rs.sid = s.sid WHERE s.name = 'Luis' AND b.color = 'red' GROUP BY r.rating
SELECT S.name, S.rating, S.age FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid ORDER BY S.rating, S.age;
SELECT S.name, S.rating, S.age FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid ORDER BY S.rating, S.age;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT bid) FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE name = 'Luis') AND day IN ('9/15', '9/14', '9/13', '9/12')
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT Boats.name, Reserves.day FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age BETWEEN 20 AND 30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid = T2.bid JOIN Sailors AS T3 ON T3.sid = T1.sid WHERE T3.age BETWEEN 20 AND 30;
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red' AND S.rating > (SELECT MIN(S2.rating) FROM Sailors AS S2 WHERE S2.sid = S.sid)
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.sid HAVING SUM(S.rating) > (SELECT AVG(S.rating) FROM Sailors AS S WHERE S.sid = R.sid)
error: No SQL found in the input string
SELECT MAX(rating) FROM Sailors;
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.name = 'Melon';
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.name = 'Melon';
SELECT name, age FROM Sailors ORDER BY rating DESC;
SELECT S.name, S.age FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid ORDER BY S.rating DESC;
SELECT Model FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT T1.Model, MAX(T2.Price) AS Max_Price FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model ORDER BY Max_Price DESC LIMIT 1;
SELECT DISTINCT Model FROM headphone ORDER BY Model;
SELECT DISTINCT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID ORDER BY T1.Model;
SELECT T2.Class, COUNT(*) AS Frequency FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T2.Class ORDER BY Frequency DESC LIMIT 1;
SELECT Class, COUNT(*) AS Quantity FROM headphone GROUP BY Class ORDER BY Quantity DESC LIMIT 1
SELECT Class, COUNT(*) FROM headphone GROUP BY Class HAVING COUNT(*) > 2
SELECT Class FROM headphone WHERE COUNT(DISTINCT Headphone_ID) <= 2 GROUP BY Class;
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(DISTINCT earpads) AS Earpads_Count FROM stock JOIN headphone ON stock.Headphone_ID = headphone.Headphone_ID;
SELECT COUNT(DISTINCT earpads) FROM stock;
SELECT T1.Model, SUM(T2.Quantity) AS Total_Quantity FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model ORDER BY Total_Quantity DESC LIMIT 2;
SELECT T1.earpads, COUNT(T1.earpads) AS earpads_count FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID = T2.Headphone_ID JOIN store AS T3 ON T1.Store_ID = T3.Store_ID WHERE T2.Model = 'SR80i' AND T2.Price > 100 GROUP BY T1.earpads ORDER BY earpads_count DESC LIMIT 2;
SELECT T1.Model, T1.Class, T1.Construction FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID ORDER BY T2.Quantity LIMIT 1
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT T1.Class, AVG(T2.Price) FROM stock AS T2 JOIN headphone AS T1 ON T2.Headphone_ID = T1.Headphone_ID GROUP BY T1.Class;
SELECT C.Construction, AVG(S.Quantity) AS Average_Price FROM stock AS S JOIN headphone AS H ON S.Headphone_ID = H.Headphone_ID JOIN store AS St ON S.Store_ID = St.Store_ID JOIN stock AS S2 ON S.Store_ID = S2.Store_ID JOIN headphone AS H2 ON S2.Headphone_ID = H2.Headphone_ID WHERE H2.Construction IS NOT NULL GROUP BY C.Construction ORDER BY C.Construction;
SELECT T1.Class, T2.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID WHERE T1.Model LIKE '%Bowls%' AND T1.Model LIKE '%Comfort Pads%' AND T2.Model IS NOT NULL;
SELECT T1.Class, T2.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID WHERE T1.Model IN ('Bowls', 'Comfort Pads') AND T2.Model IN ('Bowls', 'Comfort Pads');
SELECT DISTINCT T2.earpads FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID = T2.Headphone_ID WHERE T2.Construction = 'Hand-Crafted Mahogany / Aluminum'
SELECT DISTINCT earpads FROM stock WHERE earpads NOT IN (SELECT earpads FROM headphone WHERE construction = 'Plastic')
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened;
SELECT Name FROM store ORDER BY Date_Opened;
SELECT T1.Name, T2.Parking FROM store AS T1 JOIN headphone AS T2 ON T1.Store_ID = T2.Store_ID WHERE T1.Neighborhood = 'Tarzana' AND T2.Parking IS NOT NULL
SELECT T1.Name, T2.Parking FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID WHERE T1.Neighborhood = 'Tarzana' AND T2.Parking = 'n/a'
SELECT COUNT(DISTINCT neighborhood) FROM store
SELECT COUNT(DISTINCT store.neighborhood) FROM store JOIN stock ON store.store_id = stock.store_id WHERE stock.quantity > 0
SELECT Neighborhood, COUNT(Store_ID) AS Store_Count FROM store GROUP BY Neighborhood;
SELECT Neighborhood, COUNT(Store_ID) FROM store GROUP BY Neighborhood
SELECT T1.Name, SUM(T2.Quantity) AS Total_Headphones FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Store_ID ORDER BY Total_Headphones DESC LIMIT 1;
SELECT T1.Name, SUM(T2.Quantity) AS Total_Quantity FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Store_ID ORDER BY T1.Total_Quantity DESC LIMIT 1;
SELECT T1.Name FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID WHERE T2.Quantity = 0
SELECT T2.Name FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID = T2.Headphone_ID WHERE T1.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock WHERE Quantity > 0))
SELECT DISTINCT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model HAVING COUNT(T2.Store_ID) = 0
SELECT DISTINCT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID WHERE T2.Quantity = 0
SELECT T1.Model, MAX(T2.Quantity) FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model ORDER BY MAX(T2.Quantity) DESC LIMIT 1
SELECT Model FROM headphone WHERE Quantity = (SELECT MAX(Quantity) FROM stock)
SELECT COUNT(Headphone_ID) FROM stock WHERE Store_ID = (SELECT Store_ID FROM store WHERE Name = 'Woodman')
SELECT SUM(Quantity) FROM stock WHERE Store_ID = (SELECT Store_ID FROM store WHERE Name = 'Woodman')
SELECT T1.Name FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID WHERE T2.Quantity = 0
SELECT T1.Name FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID WHERE T2.Quantity = 0
error: No SQL found in the input string
SELECT COUNT(*) FROM Author_list;
SELECT COUNT(*) FROM Paper;
SELECT COUNT(*) FROM Paper;
SELECT COUNT(affiliation_id) FROM Affiliation
SELECT COUNT(*) FROM Affiliation;
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE venue = 'ACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE year = 2009 AND venue = 'COLING'
SELECT COUNT(*) FROM Paper WHERE venue = 'ACL' AND year = 2009 AND affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University')
SELECT name, address FROM Affiliation;
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year;
SELECT venue, year FROM Paper ORDER BY year
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Affiliation AS T4 ON T3.affiliation_id = T4.affiliation_id WHERE T4.name = 'Harvard University'
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Harvard University'
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Affiliation AS T4 ON T3.affiliation_id = T4.affiliation_id WHERE T2.name = 'Mckeown'
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T1.paper_id = T4.paper_id JOIN Citation AS T5 ON T4.paper_id = T5.cited_paper_id WHERE T2.name = 'Mckeown';
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name IN ('Stanford University', 'Columbia University')
SELECT T1.title, T2.paper_id FROM Paper AS T1 JOIN Affiliation AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Author_list AS T3 ON T1.paper_id = T3.paper_id JOIN Paper AS T4 ON T3.author_id = T4.author_id WHERE T2.name IN ('Stanford', 'Columbia University') AND T1.paper_id IN ( SELECT T3.paper_id FROM Paper AS T3 JOIN Affiliation AS T4 ON T3.affiliation_id = T4.affiliation_id WHERE T4.name IN ('Stanford', 'Columbia University') )
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.author_id = T4.author_id WHERE T3.name = 'Mckeown' AND T3.email = '‡a&Auml' AND T4.name = 'Rambow' AND T4.email = '‡&Atilde' ORDER BY T1.year ASC;
SELECT T2.paper_id, T3.title FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T1.author_id = T3.author_id JOIN Paper AS T4 ON T3.paper_id = T4.paper_id WHERE T1.name = 'Mckeown' AND T2.name = 'Kathleen' AND T3.venue = 'ACL' AND T4.venue = 'EMNLP' AND T1.name = 'Rambow' AND T2.name = 'Owen'
SELECT T2.title, T2.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.author_id = T4.author_id JOIN Paper AS T5 ON T4.paper_id = T5.paper_id WHERE T2.name IN ('Mckeown', 'Rambow') AND T2.author_id NOT IN (SELECT T3.author_id FROM Author_list AS T3 JOIN Paper AS T4 ON T3.author_id = T4.author_id WHERE T4.paper_id IN (SELECT T5.paper_id FROM Paper AS T5 WHERE T5.title LIKE 'Spoken-Language Research At Carnegie Mellon') OR T4.paper_id IN (SELECT T5.paper_id FROM Paper AS T5 WHERE T5.title LIKE 'Natural Language Research'))
SELECT T2.title, T2.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.paper_id = T4.paper_id WHERE T2.name = 'Mckeown' AND T4.venue = 'EMNLP' AND T4.year = 2019 AND T2.name != 'Rambow';
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T1.paper_id = T4.paper_id JOIN Citation AS T5 ON T4.paper_id = T5.cited_paper_id WHERE T2.name IN ('Mckeown', 'Rambow', 'Owen');
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Citation AS T4 ON T3.paper_id = T4.cited_paper_id WHERE T2.name IN ('Mckeown', 'Kathleen') AND T2.name IN ('Rambow', 'Owen') GROUP BY T1.paper_id HAVING COUNT(T1.paper_id) = 1;
SELECT T1.name, COUNT(*) AS papers FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.name ORDER BY papers DESC;
SELECT Author.name, COUNT(*) AS number_of_papers FROM Author JOIN Author_list ON Author.name = Author_list.author_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Author.name ORDER BY number_of_papers DESC;
SELECT DISTINCT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Author AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.paper_id = T4.paper_id ORDER BY COUNT(*) DESC;
SELECT T1.name FROM Affiliation AS T1 JOIN Author AS T2 ON T1.affiliation_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.paper_id = T4.paper_id JOIN Citation AS T5 ON T4.paper_id = T5.cited_paper_id WHERE T4.title LIKE '%papers%';
SELECT DISTINCT T1.name FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id WHERE T2.year > 50
SELECT DISTINCT T1.name FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id WHERE T2.year > 50
SELECT DISTINCT T1.name FROM Author_list AS T1 JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T2.paper_id IN (SELECT paper_id FROM Citation WHERE cited_paper_id IN (SELECT paper_id FROM Paper WHERE paper_id IN (SELECT T1.paper_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T2.title LIKE '%Evaluating%' AND T2.year >= 2010 AND T2.year <= 2019))
error: No SQL found in the input string
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue, year FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation WHERE paper_id IN (SELECT paper_id FROM Paper GROUP BY paper_id ORDER BY COUNT(*) DESC LIMIT 1))
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Paper WHERE paper_id = 'A00-1002'
SELECT COUNT(*) FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation WHERE paper_id = (SELECT paper_id FROM Paper WHERE title = 'A00-1002'))
SELECT COUNT(*) FROM Paper WHERE paper_id = (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = '™ej') AND paper_id = (SELECT paper_id FROM Paper WHERE title = 'Evaluating The Use Of Prosodic Information In Speech Recognition And Understanding'));
SELECT COUNT(*) FROM Paper WHERE paper_id = 'D12-1027'
SELECT T1.paper_id, COUNT(*) AS number_of_citations FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id GROUP BY T1.paper_id ORDER BY number_of_citations DESC LIMIT 1
SELECT T1.paper_id, COUNT(*) AS number_of_citations FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Citation AS T3 ON T1.paper_id = T3.cited_paper_id GROUP BY T1.paper_id ORDER BY number_of_citations DESC LIMIT 1;
SELECT T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id GROUP BY T1.paper_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id GROUP BY T2.paper_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.title, COUNT(*) AS citation_count FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Citation AS T3 ON T1.paper_id = T3.cited_paper_id GROUP BY T1.paper_id ORDER BY citation_count DESC LIMIT 10;
SELECT T1.title, COUNT(*) AS citation_count FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Citation AS T3 ON T1.paper_id = T3.cited_paper_id GROUP BY T1.paper_id ORDER BY citation_count DESC LIMIT 10;
error: No SQL found in the input string
SELECT COUNT(*) FROM Author WHERE name = 'Mckeown, Kathleen'
error: No SQL found in the input string
SELECT COUNT(*) FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')
SELECT A.name, COUNT(C.cited_paper_id) AS number_of_citations FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON A.author_id = P.author_id JOIN Citation C ON P.paper_id = C.paper_id GROUP BY A.author_id ORDER BY number_of_citations DESC LIMIT 1;
SELECT T2.name, COUNT(*) AS number_of_citations FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T1.author_id = T3.author_id GROUP BY T1.author_id ORDER BY number_of_citations DESC LIMIT 1;
SELECT venue, year FROM Paper WHERE author_id IN ( SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen' )
SELECT T1.venue, T1.year FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen' GROUP BY T1.venue, T1.year
SELECT venue, year FROM Paper WHERE affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University')
SELECT paper_id, venue, year FROM Paper WHERE affiliation_id IN ( SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University' );
SELECT T2.name, COUNT(*) AS papers FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id WHERE T2.year = 2009 GROUP BY T1.author_id ORDER BY papers DESC LIMIT 1;
SELECT T2.name FROM Author_list AS T1 JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T2.year = 2009 GROUP BY T1.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name, COUNT(*) AS paper_count FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T3 ON T1.affiliation_id = T3.affiliation_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY paper_count DESC LIMIT 3;
SELECT T1.name, COUNT(*) AS paper_count FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T3 ON T1.affiliation_id = T3.affiliation_id WHERE T3.year = 2009 GROUP BY T1.affiliation_id ORDER BY paper_count DESC LIMIT 3;
SELECT COUNT(*) FROM Paper WHERE venue = 'Columbia University' AND year >= 2009
SELECT COUNT(*) FROM Paper WHERE venue = 'Columbia University' AND year >= 2009;
SELECT COUNT(*) FROM Paper WHERE venue IN ('ACL', 'COLING', 'EMNLP', 'EACL', 'HLT', 'CL') AND year BETWEEN 2000 AND 2009 AND affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University');
SELECT COUNT(*) FROM Paper WHERE venue IN ('ACL', 'COLING', 'EMNLP', 'EACL', 'HLT', 'CL') AND year BETWEEN 2000 AND 2009 AND affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University');
SELECT T2.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name IN ('™ej', '‡a&Auml', '‡, Frane', '‡&Atilde', '˜yvind Raddum', 'ˆu&Aring') ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id GROUP BY T3.author_id ORDER BY COUNT(T2.author_id) DESC LIMIT 1
error: No SQL found in the input string
SELECT COUNT(*) FROM Author WHERE name = 'Mckeown, Kathleen'
error: No SQL found in the input string
SELECT T2.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T1.author_id = T3.author_id WHERE T3.title LIKE '%McKee% Kathleen%' GROUP BY T1.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Affiliation AS T4 ON T3.affiliation_id = T4.affiliation_id WHERE T1.title LIKE '%translation%';
SELECT T1.paper_id FROM Paper AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Citation AS T4 ON T3.paper_id = T4.cited_paper_id WHERE T1.title LIKE '%translation%'
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.author_id IS NULL
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.author_id IS NULL
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T1.address LIKE '%China%' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Affiliation AS T1 JOIN Author AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.paper_id = T4.paper_id GROUP BY T1.affiliation_id ORDER BY COUNT(T4.paper_id) DESC LIMIT 1
SELECT T1.year, COUNT(T2.paper_id) AS papers_per_year FROM Paper AS T1 JOIN Affiliation AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Author_list AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T1.paper_id = T4.paper_id JOIN Citation AS T5 ON T4.paper_id = T5.cited_paper_id GROUP BY T1.year ORDER BY T1.year;
SELECT venue, COUNT(*) AS number_of_papers FROM Paper GROUP BY venue ORDER BY venue;
SELECT Affiliation.name, COUNT(Citation.paper_id) AS total_papers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.author_id = Paper.author_id JOIN Citation ON Paper.paper_id = Citation.paper_id GROUP BY Affiliation.name
SELECT T1.name, COUNT(T1.paper_id) AS number_of_papers FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Author AS T3 ON T2.author_id = T3.author_id JOIN Paper AS T4 ON T3.paper_id = T4.paper_id GROUP BY T1.name
error: No SQL found in the input string
SELECT T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Citation AS T3 ON T1.paper_id = T3.cited_paper_id WHERE T3.cited_paper_id IN (SELECT T2.paper_id FROM Paper WHERE T2.author_id = (SELECT T2.author_id FROM Paper WHERE T2.paper_id = T1.paper_id AND T1.year > 2020 ORDER BY T2.year DESC LIMIT 50))
SELECT COUNT(T1.author_id) FROM Author_list AS T1 JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T2.cited_paper_id IS NULL AND T2.year > 2023
SELECT COUNT(T1.author_id) AS authors_with_more_than_50_citations FROM Author_list AS T1 JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T2.cited_paper_id IS NULL GROUP BY T1.author_id HAVING COUNT(T1.author_id) > 50;
SELECT DISTINCT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T3.paper_id = T2.paper_id WHERE T3.venue = 'ACL' AND T3.year = 2009 AND T3.title IN ('Evaluating The Use Of Prosodic Information In Speech Recognition And Understanding', 'Research In Natural Language Processing', 'Natural Language Research', 'Spoken-Language Research At Carnegie Mellon', 'Spoken Language Recognition And Understanding', 'Segment-Based Acoustic Models With Multi-Level Search Algorithms For Continuous Speech Recognition')
SELECT DISTINCT T1.name FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id WHERE T2.year = 2009 AND T1.venue = 'ACL' AND T1.affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Google Inc.') AND T1.author_id = (SELECT author_id FROM Author WHERE name = '™ej')
SELECT DISTINCT T1.name FROM Author_list AS T1 JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T2.venue = 'ACL' AND T2.year = (SELECT MAX(T3.year) FROM Paper AS T3 WHERE T3.paper_id = T2.paper_id)
error: No SQL found in the input string
SELECT COUNT(*) FROM conference
SELECT COUNT(*) FROM conference;
SELECT DISTINCT conference_name FROM conference;
SELECT DISTINCT conference_name FROM conference
SELECT conference_name, year, location FROM conference
SELECT T1.Conference_Name, T1.Year, T1.Location FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T2.Institution_ID = T3.Institution_ID;
SELECT T1.conference_name, COUNT(T2.conference_id) AS conference_count FROM conference AS T1 JOIN conference_participation AS T2 ON T1.conference_id = T2.conference_id GROUP BY T1.conference_name ORDER BY conference_count DESC;
SELECT T1.conference_name, COUNT(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.conference_id = T2.conference_id JOIN staff AS T3 ON T2.staff_id = T3.staff_id GROUP BY T1.conference_name
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT COUNT(*) AS conference_count, YEAR(conference_year) AS year FROM conference WHERE conference_id IN ( SELECT conference_id FROM conference_participation GROUP BY conference_id HAVING COUNT(*) > 1 ) GROUP BY YEAR(conference_year) ORDER BY year ASC LIMIT 1;
SELECT T1.Year FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Year ORDER BY COUNT(*) ASC LIMIT 1;
SELECT T1.Year FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Year ORDER BY COUNT(*) ASC LIMIT 1
SELECT Location FROM conference WHERE Conference_ID IN ( SELECT Conference_ID FROM conference_participation WHERE role = 'Participant' GROUP BY Conference_ID HAVING COUNT(DISTINCT staff_ID) > 1 )
SELECT Location FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation WHERE role = 'Participant' GROUP BY Conference_ID HAVING COUNT(DISTINCT Conference_ID) >= 2)
SELECT institution_name, location, founded FROM institution;
SELECT T1.Institution_Name, T1.Location, T1.Founded FROM institution AS T1 JOIN conference AS T2 ON T1.Institution_ID = T2.Institution_ID JOIN conference_participation AS T3 ON T2.Conference_ID = T3.Conference_ID WHERE T3.role = 'Participant';
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT COUNT(DISTINCT institution_id) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT T1.Institution_Name, T1.Location FROM institution AS T1 JOIN conference AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Founded DESC LIMIT 1
SELECT T2.Institution_Name, T2.Location FROM institution AS T1 JOIN conference AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Founded DESC LIMIT 1
SELECT T3.Institution_Name, COUNT(T2.role) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T3.Institution_ID = T2.Institution_ID WHERE T3.Founded > 1800 GROUP BY T3.Founded
SELECT I.Institution_Name, COUNT(T2.Staff_ID) AS Number_of_staff FROM institution AS I JOIN staff AS T1 ON I.Institution_ID = T1.Institution_ID JOIN conference_participation AS T2 ON T2.Institution_ID = I.Institution_ID WHERE T2.Founded > 1800 GROUP BY I.Institution_ID
SELECT T2.Institution_Name FROM conference AS T1 JOIN conference_participation AS T3 ON T1.Conference_ID = T3.Conference_ID JOIN institution AS T2 ON T3.Institution_ID = T2.Institution_ID WHERE T3.role = 'Participant' AND T2.Nationality = 'United States'
SELECT T2.Institution_Name FROM conference AS T1 JOIN conference_participation AS T3 ON T1.Conference_ID = T3.Conference_ID JOIN institution AS T2 ON T3.Institution_ID = T2.Institution_ID WHERE T3.role = 'Participant' AND T2.Nationality = 'United States'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.institution_id = T2.institution_id JOIN conference AS T3 ON T2.Conference_ID = T3.Conference_ID WHERE T1.Age > (SELECT AVG(T1.Age) FROM staff AS T1 WHERE T1.Age > T2.Age) GROUP BY T1.name;
SELECT T1.name, T2.role FROM staff AS T1 JOIN conference_participation AS T2 ON T1.institution_id = T2.institution_id JOIN conference AS T3 ON T2.Conference_ID = T3.Conference_ID WHERE T1.Age > (SELECT AVG(T1.Age) FROM staff AS T1 WHERE T1.Age > T2.Age) ORDER BY T1.Age ASC LIMIT 1;
SELECT MAX(staff.Age), MIN(staff.Age) FROM staff WHERE staff.Nationality = 'United States'
SELECT MAX(Age), MIN(Age) FROM staff
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T2.Institution_ID = T3.Institution_ID WHERE T3.Location = 'Canada' AND T2.role = 'Participant'
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T2.Institution_ID = T3.Institution_ID WHERE T3.Nationality = 'Canada' AND T2.role = 'Participant'
SELECT T1.name, T2.role FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.role IN ('Speaker', 'Sponsor')
SELECT T1.name, T2.role FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.role IN ('Speaker', 'Sponsor') AND T1.Conference_ID IN (SELECT DISTINCT T1.Conference_ID FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.role IN ('Speaker', 'Sponsor') GROUP BY T1.Conference_ID HAVING COUNT(T2.Conference_ID) > 1)
SELECT DISTINCT T1.name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T2.Institution_ID = T3.Institution_ID WHERE T1.Conference_Name = 'ACL' AND T2.role = 'Participant' OR T1.Conference_Name = 'Naccl' AND T2.role = 'Speaker';
SELECT T1.name, T2.name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T2.Institution_ID = T3.Institution_ID WHERE T1.Conference_Name IN ('ACL', 'NACCL') AND T2.role = 'Participant' AND T3.Institution_Name IN ('Shurtleff College (defunct)', 'Millikin University', 'Lombard College (defunct)', 'Lincoln College, Illinois', 'Illinois Wesleyan University', 'Illinois State University');
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.institution_id = T2.institution_id JOIN conference AS T3 ON T2.Conference_ID = T3.Conference_ID WHERE T3.Founded >= 2003 AND T3.Founded <= 2004
SELECT T2.name, T3.role FROM conference AS T1 JOIN staff AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN conference_participation AS T3 ON T1.Conference_ID = T3.Conference_ID WHERE T2.Age BETWEEN 41 AND 42 AND T1.Founded BETWEEN 2003 AND 2004 AND T3.role = 'Participant'
SELECT T1.Conference_Name, T1.Year, COUNT(*) AS Number_of_Participants FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID
SELECT c.Conference_Name, c.Year, COUNT(*) AS Number_of_Participants FROM conference AS c JOIN conference_participation AS cp ON c.Conference_ID = cp.Conference_ID JOIN staff AS s ON cp.staff_ID = s.staff_ID GROUP BY c.Conference_ID
SELECT c.Conference_Name FROM conference AS c JOIN conference_participation AS cp ON c.Conference_ID = cp.Conference_ID JOIN ( SELECT conference_id, COUNT(*) as attend_count FROM conference_participation GROUP BY conference_id ORDER BY attend_count DESC LIMIT 2 ) AS top_conferences ON c.Conference_ID = top_conferences.Conference_ID
SELECT T1.Conference_Name, COUNT(*) AS Attendance_Count FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID WHERE T2.role = 'Participant' GROUP BY T1.Conference_ID ORDER BY Attendance_Count DESC LIMIT 2;
SELECT T2.name, T2.nationality FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID WHERE T2.role = 'Participant' AND T1.Conference_Name = 'ACL' AND T2.Conference_ID NOT IN (SELECT DISTINCT Conference_ID FROM conference_participation WHERE role = 'Participant')
SELECT T2.name, T2.nationality FROM conference AS T1 JOIN conference_participation AS T3 ON T1.Conference_ID = T3.Conference_ID JOIN institution AS T2 ON T3.Institution_ID = T2.Institution_ID WHERE T1.Conference_Name = 'ACL' AND T3.role = 'Participant' AND T2.nationality NOT IN ('United States', 'Canada')
SELECT T3.Institution_Name, T3.Location FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN institution AS T3 ON T2.Institution_ID = T3.Institution_ID WHERE T2.role = 'Participant' AND T1.Year = 2004 AND T3.Founded NOT IN (SELECT T2.Institution_ID FROM conference_participation AS T2 WHERE T2.Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004))
SELECT T2.Institution_Name, T2.Location FROM conference AS T1 JOIN conference_participation AS T3 ON T1.Conference_ID = T3.Conference_ID JOIN institution AS T2 ON T3.Institution_ID = T2.Institution_ID WHERE T1.Founded < 2004 AND T3.role = 'Participant' AND T1.Founded IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age;
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 30
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 30 ORDER BY PilotSkills.age ASC;
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 35 AND Hangar.plane_name = 'Piper Cub';
SELECT PilotSkills.pilot_name, Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 35 AND Hangar.plane_name = 'Piper Cub'
error: No SQL found in the input string
SELECT T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.pilot_name = 'F-14 Fighter'
error: No SQL found in the input string
SELECT COUNT(DISTINCT Hangar.location) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 35 AND Hangar.plane_name = 'B-52 Bomber';
SELECT COUNT(*) FROM PilotSkills WHERE pilot_name = 'B-52 Bomber' AND age < 35;
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills)
error: No SQL found in the input string
SELECT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name ORDER BY COUNT(*) ASC LIMIT 1
error: No SQL found in the input string
SELECT COUNT(*) FROM PilotSkills WHERE plane_name = (SELECT plane_name FROM Hangar WHERE location = 'Chicago')
SELECT COUNT(*) FROM PilotSkills WHERE plane_name = (SELECT plane_name FROM Hangar WHERE location = 'Chicago')
SELECT T1.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.age = 41 AND T2.location = 'Austin'
SELECT T1.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.pilot_name = 'Smith' AND T1.age = 41
SELECT COUNT(DISTINCT PilotSkills.plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT Hangar.plane_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name;
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name = 'Smith'
SELECT COUNT(*) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT T1.pilot_name) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.age > 40
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC;
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name;
SELECT T1.location FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.location ORDER BY T2.pilot_name;
SELECT DISTINCT T1.type FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.type ORDER BY T1.type
SELECT DISTINCT plane_name FROM PilotSkills ORDER BY plane_name;
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age IN (SELECT MIN(age) FROM PilotSkills) AND PilotSkills.age > 35 AND Hangar.location IN ('Seattle', 'Chicago', 'Boston', 'Austin')
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age IN (SELECT MIN(age) FROM PilotSkills) AND PilotSkills.plane_name IN ('Piper Cub', 'F-14 Fighter') AND PilotSkills.age < 35 OR PilotSkills.age > 30
SELECT PilotSkills.pilot_name, Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.pilot_name = Hangar.pilot_name WHERE Hangar.location IN ('Seattle', 'Chicago', 'Boston', 'Austin') AND Hangar.pilot_name NOT IN ('Piper Cub', 'B-52 Bomber') AND Hangar.pilot_name NOT IN ('Piper Cub', 'B-52 Bomber');
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age = (SELECT MIN(age) FROM PilotSkills) AND Hangar.plane_name NOT IN ('B-52 Bomber', 'Piper Cub')
SELECT PilotSkills.pilot_name, Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.pilot_name = Hangar.pilot_name WHERE Hangar.location IN ('Seattle', 'Chicago', 'Boston', 'Austin') AND Hangar.location IN ('Piper Cub', 'B-52 Bomber') ORDER BY PilotSkills.pilot_name;
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.plane_name IN ('Piper Cub', 'B-52 Bomber') GROUP BY PilotSkills.pilot_name HAVING COUNT(DISTINCT Hangar.location) = 2
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location IN ('Austin', 'Boston')
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location IN ('Austin', 'Boston')
SELECT PilotSkills.pilot_name, Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name IN ('Piper Cub', 'F-14 Fighter')
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name IN ('Piper Cub', 'F-14 Fighter')
SELECT T2.location, AVG(T1.age) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T2.location
SELECT Hangar.location, AVG(PilotSkills.age) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY Hangar.location
SELECT Hangar.location, COUNT(PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY Hangar.location
SELECT Hangar.`plane_name`, COUNT(*) FROM PilotSkills JOIN Hangar ON PilotSkills.`plane_name` = Hangar.`plane_name` GROUP BY Hangar.`plane_name`
SELECT T1.pilot_name, T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.age ASC
SELECT DISTINCT T1.plane_name, T2.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.age;
SELECT T1.pilot_name, T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name, T1.age ORDER BY T1.age DESC
SELECT T1.plane_name, T2.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.pilot_name IS NOT NULL GROUP BY T1.plane_name, T2.pilot_name ORDER BY T1.age DESC
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT DISTINCT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT location, COUNT(pilot_name) AS num_pilots, AVG(age) AS avg_age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY location
SELECT location, COUNT(pilot_name) AS number_of_pilots, AVG(age) AS average_age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY location ORDER BY average_age DESC;
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 35;
SELECT T1.plane_name, COUNT(*) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name HAVING AVG(T1.age) < 35
SELECT T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.age = (SELECT MIN(age) FROM PilotSkills)
SELECT T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.age ASC LIMIT 1
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin';
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'
SELECT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age > (SELECT MIN(age) FROM PilotSkills) ORDER BY PilotSkills.pilot_name;
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills) ORDER BY pilot_name ASC;
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills)
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills)
SELECT DISTINCT Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name LIKE '%Bomber%'
SELECT DISTINCT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.age = (SELECT MIN(age) FROM PilotSkills)
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age > (SELECT MIN(PilotSkills.age) FROM PilotSkills)
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE pilot_name = (SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills))
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT `Area_km`, `Government_website` FROM district WHERE Population = (SELECT MIN(Population) FROM district)
SELECT d.Name, d.Area_km FROM district AS d WHERE d.Area_km > ( SELECT MAX(d.Area_km) FROM district JOIN district ON d.District_ID = district.District_ID );
SELECT MAX(District_area_km), AVG(District_area_km) FROM district JOIN district ON district.District_ID = district.District_ID WHERE District_ID = (SELECT District_ID FROM spokesman WHERE Name = 'Elvis Presley');
SELECT SUM(Population) FROM district WHERE Area_km IN (SELECT MAX(Area_km) FROM district)
SELECT district_id, name, government_website FROM district ORDER BY population DESC;
SELECT DISTINCT district.name FROM district JOIN spokesman_district ON district.District_ID = spokesman_district.District_ID JOIN spokesman ON spokesman_district.Spokesman_ID = spokesman.Spokesman_ID WHERE district.Density_km LIKE '%gov%'
SELECT district_id, name FROM district WHERE Population > 4000 OR Area_km > 3000;
SELECT Name, speach_title FROM spokesman
SELECT AVG(points), AVG(age) FROM spokesman WHERE Rank_position = 1;
SELECT S.Name, S.Points FROM spokesman AS S JOIN spokesman_district AS SD ON S.Spokesman_ID = SD.Spokesman_ID WHERE SD.Start_year < 2012 AND S.Age < 40 ORDER BY S.Points DESC;
SELECT T1.Name, T1.Age FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.Spokesman_ID = T2.Spokesman_ID WHERE T2.Start_year = (SELECT MIN(T2.Start_year) FROM spokesman_district AS T2)
SELECT S.Name, S.Points FROM spokesman AS S JOIN spokesman_district AS SD ON S.Spokesman_ID = SD.Spokesman_ID JOIN district AS D ON SD.District_ID = D.District_ID WHERE SD.Start_year < (SELECT MIN(D.Start_year) FROM district AS D WHERE D.District_ID = SD.District_ID AND D.Points > S.Points) ORDER BY SD.Start_year ASC;
SELECT T1.Name FROM district AS T1 JOIN spokesman AS T2 ON T1.District_ID = T2.District_ID GROUP BY T1.District_ID ORDER BY COUNT(T2.Speach_ID) DESC LIMIT 1
SELECT S.Name, D.Start_year FROM spokesman AS S JOIN spokesman_district AS SD ON S.Spokesman_ID = SD.Spokesman_ID JOIN district AS D ON SD.District_ID = D.District_ID WHERE SD.Start_year < 2004 ORDER BY D.Start_year ASC LIMIT 1;
SELECT district.Name, COUNT(spokesman_district.Start_year) AS Number_of_spokesmen FROM spokesman_district JOIN district ON spokesman_district.District_ID = district.District_ID GROUP BY district.Name ORDER BY Number_of_spokesmen DESC;
SELECT DISTINCT district.name FROM district JOIN spokesman_district ON district.District_ID = spokesman_district.District_ID JOIN spokesman ON spokesman_district.Spokesman_ID = spokesman.Spokesman_ID WHERE spokesman.rank_position IN (1, 2)
SELECT DISTINCT district.name FROM district JOIN spokesman_district ON district.District_ID = spokesman_district.District_ID JOIN spokesman ON spokesman_district.Spokesman_ID = spokesman.Spokesman_ID GROUP BY district.name HAVING COUNT(DISTINCT spokesman.Spokesman_ID) > 1;
SELECT COUNT(DISTINCT district_id) FROM spokesman_district WHERE district_id NOT IN (SELECT district_id FROM spokesman)
SELECT DISTINCT T1.Name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.Spokesman_ID = T2.Spokesman_ID GROUP BY T1.Spokesman_ID HAVING COUNT(DISTINCT T2.District_ID) = 0
SELECT SUM(Population), AVG(Population) FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district WHERE Rank_position = 1) GROUP BY District_ID;
error: No SQL found in the input string
SELECT Sculptures.title FROM Sculptures JOIN Paintings ON Sculptures.sculptureID = Paintings.sculptureID WHERE Paintings.year = (SELECT MAX(year) FROM Paintings) ORDER BY Sculptures.year DESC LIMIT 1;
error: No SQL found in the input string
SELECT T1.title, T1.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID ORDER BY T1.year ASC LIMIT 1
SELECT T2.title FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T2.location = 'Gallery 226'
SELECT T1.title FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T2.location = 'Gallery 226'
SELECT title, location FROM Paintings;
SELECT DISTINCT T1.title, T2.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID
SELECT title, location FROM Sculptures;
SELECT DISTINCT Sculptures.title, Sculptures.location FROM Sculptures JOIN Paintings ON Sculptures.sculptureID = Paintings.sculptureID WHERE Paintings.year = (SELECT MAX(year) FROM Paintings) ORDER BY Sculptures.title;
SELECT medium, mediumOn FROM Paintings WHERE paintingID = 80
error: No SQL found in the input string
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists WHERE Artists.birthYear > 1850;
SELECT Artists.fname, Artists.lname FROM Artists WHERE Artists.birthYear > 1850;
SELECT T2.title, T2.year FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.painterID WHERE T2.location != 'Gallery 226' AND T2.painterID IS NOT NULL
SELECT T2.title, T2.year FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.painterID WHERE T2.location != 'Gallery 226';
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.artistID WHERE P.year < 1900 ORDER BY P.year ASC, A.fname ASC, A.lname ASC;
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year < 1900;
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year > 1920;
SELECT DISTINCT Artists.fname, Artists.lname, Paintings.year FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year > 1920 ORDER BY Artists.birthYear;
SELECT Artists.fname, Artists.lname FROM Artists JOIN ( SELECT artistID, MIN(birthYear) as min_birth_year FROM Artists GROUP BY artistID ) as min_artist ON Artists.artistID = min_artist.artistID JOIN ( SELECT artistID, MAX(year) as max_year FROM Paintings ) as max_paintings ON Artists.artistID = max_paintings.artistID JOIN ( SELECT artistID, MIN(year) as min_year FROM Sculptures ) as min_sculptures ON Artists.artistID = min_sculptures.artistID WHERE min_artist.min_birth_year = max_paintings.max_year AND min_artist.min_year = min_sculptures.min_year ORDER BY min_artist.min_birth_year DESC, min_artist.min_year DESC;
error: No SQL found in the input string
SELECT MIN(Age) FROM Artists
SELECT artists.age FROM artists JOIN ( SELECT artistID, MIN(birthYear) AS min_birth_year FROM Artists GROUP BY artistID ) AS min_birth_year ON artists.artistID = min_birth_year.artistID JOIN ( SELECT artistID, MIN(year) AS min_year FROM Paintings GROUP BY artistID ) AS min_year ON artists.artistID = min_year.artistID JOIN ( SELECT artistID, MIN(year) AS min_year FROM Sculptures GROUP BY artistID ) AS min_year ON artists.artistID = min_year.artistID WHERE min_birth_year.min_birth_year = min_year.min_year
SELECT Artists.fname, Artists.birthYear FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year = (SELECT MIN(year) FROM Paintings) ORDER BY Artists.birthYear DESC LIMIT 1;
SELECT Artists.fname, Artists.birthYear FROM Artists WHERE Artists.birthYear = (SELECT MIN(BirthYear) FROM Artists) ORDER BY Artists.birthYear DESC LIMIT 1;
SELECT COUNT(DISTINCT Artists.artistID) FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID JOIN Sculptures ON Paintings.sculptorID = Sculptures.sculptorID WHERE Sculptures.location = 'Gallery 240';
SELECT SUM(T1.height_mm) AS total_height_mm FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T1.location = 'Gallery 240';
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT painterID FROM Artists ORDER BY age DESC LIMIT 1);
SELECT COUNT(*) AS painting_count FROM Paintings WHERE painter_id = (SELECT painter_id FROM Artists ORDER BY age DESC LIMIT 1);
SELECT T1.fname, T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.artistID WHERE T1.fname = 'Mary';
SELECT T1.title, T1.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.fname = 'Mary'
SELECT T1.width_mm FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.birthYear < 1850;
SELECT T1.width_mm FROM Paintings AS T1 JOIN Artists AS T2 ON T2.artistID = T1.painterID WHERE T2.birthYear < 1850
SELECT T1.location, T1.mediumType FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID JOIN Sculptures AS T3 ON T2.artistID = T3.sculptorID WHERE T2.fname = 'Pablo';
SELECT T1.location, T1.medium FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.fname = 'Pablo';
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Paintings.painterID IS NOT NULL AND Sculptures.sculptorID IS NOT NULL;
SELECT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID
SELECT DISTINCT A.fname, A.lname FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.artistID JOIN Sculptures AS S ON A.artistID = S.sculptorID WHERE P.medium = 'lithograph' AND P.mediumOn = 'canvas';
SELECT A.fname, A.lname FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.artistID JOIN Sculptures AS S ON A.artistID = S.sculptorID WHERE P.medium = 'oil' AND P.medium = 'lithograph';
SELECT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year = 1884 AND Paintings.medium = 'canvas';
SELECT T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.artistID WHERE T2.year = 1884 AND T1.birthYear = 1884;
SELECT DISTINCT A.fname FROM Artists A JOIN Paintings P ON A.artistID = P.artistID JOIN Sculptures S ON A.artistID = S.sculptorID WHERE P.medium = 'oil' AND S.location = 'Gallery 241' GROUP BY A.artistID HAVING COUNT(DISTINCT P.paintingID) = 1;
SELECT A.fname FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.artistID JOIN Sculptures AS S ON A.artistID = S.sculptorID WHERE P.medium = 'oil' AND P.location = 'Gallery 241';
SELECT medium, COUNT(*) FROM Paintings JOIN Artists ON Paintings.artistID = Artists.artistID GROUP BY medium;
SELECT medium, COUNT(*) FROM Paintings JOIN Artists ON Paintings.artistID = Artists.artistID GROUP BY medium UNION ALL SELECT medium, COUNT(*) FROM Sculptures JOIN Artists ON Sculptures.sculptorID = Artists.artistID GROUP BY medium;
SELECT AVG(height_mm), medium FROM Paintings GROUP BY medium
SELECT AVG(height_mm), medium FROM Paintings GROUP BY medium
SELECT DISTINCT T1.location, COUNT(T1.paintingID) AS num_paintings FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1900 GROUP BY T1.location ORDER BY num_paintings DESC;
SELECT COUNT(DISTINCT Paintings.painterID) AS num_paintings, Paintings.year AS year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.year < 1900 GROUP BY Paintings.year ORDER BY Paintings.year;
SELECT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year > 1910 AND T1.medium = 'oil';
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year > 1910 AND T1.medium = 'oil';
SELECT DISTINCT Paintings.painterID FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.location = 'Gallery 240' AND Paintings.medium = 'oil';
SELECT DISTINCT T2.painterID FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.location = 'Gallery 240' AND T1.medium = 'oil' AND T2.artistID IS NOT NULL AND T1.medium = 'oil' AND T1.location IS NOT NULL;
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T1.height_mm > T2.height_mm
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T1.height_mm > T2.height_mm
SELECT DISTINCT paintings.paintingID FROM paintings JOIN Paintings ON paintings.painterID = paintings.painterID WHERE paintings.location = 'Gallery 240' AND paintings.year > paintings.paintingID ORDER BY paintings.paintingID ASC LIMIT 1;
SELECT DISTINCT Paintings.painterID FROM Paintings JOIN ( SELECT painterID FROM Paintings WHERE paintingID IN ( SELECT Sculptures.sculptureID FROM Sculptures WHERE location = 'Gallery 240' ) ) AS older_paintings ON Paintings.painterID = older_paintings.painterID ORDER BY Paintings.painterID;
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
error: No SQL found in the input string
SELECT T1.lname, T1.fname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.title LIKE '%female%'
SELECT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.title LIKE '%female%' ORDER BY Paintings.year DESC LIMIT 1;
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID ORDER BY T1.title;
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID ORDER BY T1.title
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID ORDER BY LENGTH(T1.title)
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Paintings AS T2 ON T1.painterID = T2.painterID ORDER BY T2.height_mm ASC LIMIT 1
SELECT DISTINCT T1.title, T2.title FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T1.year >= 1900 AND T1.year <= 1950 AND T2.year >= 1900 AND T2.year <= 1950
SELECT T1.title, T2.title FROM Paintings AS T1 JOIN Sculptures AS T2 ON T1.painterID = T2.sculptorID WHERE T1.year >= 1900 AND T1.year <= 1950 AND T2.year >= 1900 AND T2.year <= 1950
SELECT Painting.title, Sculpture.title FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.artistID = 222;
SELECT Painting.title, Sculpture.title FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID JOIN Sculptures ON Paintings.sculptorID = Sculptures.sculptorID WHERE Artists.artistID = 222;
SELECT artistID, lname, fname FROM Artists WHERE artistID = ( SELECT artistID FROM ( SELECT artistID, COUNT(*) as count FROM Paintings WHERE year < 1900 GROUP BY artistID ORDER BY count DESC LIMIT 1 ) AS top_paintings JOIN ( SELECT artistID, COUNT(*) as count FROM Sculptures WHERE year < 1900 GROUP BY artistID ORDER BY count DESC LIMIT 1 ) AS top_sculptures ON top_paintings.artistID = top_sculptures.artistID WHERE top_paintings.artistID = top_sculptures.artistID
SELECT artists.artistID, artists.lname, artists.fname FROM artists WHERE artists.artistID = ( SELECT artistID FROM ( SELECT artistID, COUNT(*) as count FROM Paintings WHERE year < 1900 GROUP BY artistID ) AS subquery ORDER BY count DESC LIMIT 1 );
SELECT Artists.fname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Artists.fname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.height_mm < 600 OR T1.width_mm > 800;
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.width_mm < 600 OR T1.height_mm > 800;
SELECT T1.location, T2.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1930 OR T1.year > 1885
SELECT DISTINCT T1.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1930 OR T1.year > 1885;
SELECT PaintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;
SELECT PaintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;
SELECT T1.location, T2.medium FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.medium = 'panel' OR T1.medium = 'canvas';
SELECT T2.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.medium = 'on panels' OR T1.medium = 'on canvas' GROUP BY T2.location;
SELECT T1.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1930 AND T1.year > 1885
SELECT T1.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1930 AND T1.year > 1885
SELECT AVG(T1.height_mm), AVG(T1.width_mm) FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.medium = 'oil' AND T1.location = 'Gallery 241'
SELECT AVG(T1.height_mm), AVG(T1.width_mm) FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.medium = 'oil' AND T1.location = 'Gallery 241'
SELECT MAX(paintings.height_mm), paintings.painterID FROM Paintings JOIN Artists ON paintings.painterID = Artists.artistID WHERE paintings.year < 1900 ORDER BY paintings.height_mm DESC;
SELECT T1.height_mm, T1.paintingID FROM Paintings AS T1 JOIN Paintings AS T2 ON T1.painterID = T2.painterID WHERE T2.year < 1900 ORDER BY T1.height_mm DESC LIMIT 1
SELECT T1.year, T1.height_mm, T1.width_mm FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID GROUP BY T1.year
SELECT T1.year, T1.height_mm, T1.width_mm FROM Paintings AS T1 JOIN Paintings AS T2 ON T1.painterID = T2.painterID WHERE T2.painterID IS NULL ORDER BY T1.year DESC LIMIT 1;
SELECT AVG(paintings.height_mm), AVG(paintings.width_mm) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Artists.artistID ORDER BY Artists.fname;
SELECT AVG(paintings.height_mm), AVG(paintings.width_mm) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Paintings.painterID ORDER BY Artists.fname ASC, Artists.lname ASC;
SELECT Artists.fname, COUNT(Paintings.paintingID) AS num_paintings FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.fname HAVING COUNT(Paintings.paintingID) >= 2
SELECT a.fname, COUNT(p.paintingID) AS num_paintings FROM Artists a JOIN Paintings p ON a.artistID = p.artistID GROUP BY a.artistID HAVING COUNT(p.paintingID) >= 2
SELECT T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.artistID JOIN ( SELECT T3.paintingID FROM Paintings AS T3 JOIN Paintings AS T4 ON T3.paintingID = T4.paintingID WHERE T4.artistID = T1.artistID AND T4.year <= 1973 GROUP BY T3.paintingID HAVING COUNT(T4.paintingID) <= 3 ) AS T3 ON T1.artistID = T3.artistID GROUP BY T1.artistID HAVING COUNT(T2.paintingID) <= 3;
SELECT artists.fname, artists.lname, artists.birthYear, artists.deathYear FROM artists WHERE artists.age < 4 ORDER BY artists.deathYear;
SELECT T1.birthYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID GROUP BY T1.artistID ORDER BY COUNT(T2.sculptorID) DESC LIMIT 1
SELECT T2.year FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID GROUP BY T1.artistID ORDER BY COUNT(T2.year) DESC LIMIT 1
SELECT PaintingID, height_mm FROM Paintings WHERE location = 'Gallery 240' ORDER BY width_mm DESC LIMIT 1;
SELECT PaintingID, height_mm FROM Paintings WHERE location = 'Gallery 240' ORDER BY height_mm ASC LIMIT 1
SELECT DISTINCT paintings.paintingID FROM Paintings JOIN Sculptures ON paintings.painterID = Sculptures.sculptorID WHERE paintings.location = 'Gallery 240' ORDER BY paintings.paintingID LIMIT 10;
SELECT DISTINCT paintings.paintingID FROM paintings JOIN artists ON paintings.painterID = artists.artistID WHERE paintings.year < (SELECT MIN(year) FROM paintings WHERE paintings.location = 'Gallery 240')
SELECT PaintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT PaintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT a.lname, a.fname, COUNT(*) AS painting_count FROM Artists a JOIN Paintings p ON a.artistID = p.artistID JOIN Sculptures s ON a.artistID = s.sculptorID GROUP BY a.artistID ORDER BY painting_count DESC LIMIT 3;
SELECT Artists.lname, Artists.fname, COUNT(*) AS num_paintings FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.lname, Artists.fname ORDER BY num_paintings DESC LIMIT 1;
SELECT PaintingID, Location, Title FROM Paintings WHERE Medium = 'oil' ORDER BY Year;
SELECT PaintingID, PaintingTitle, PaintingYear, PaintingMedium, PaintingLocation FROM Paintings ORDER BY PaintingYear ASC;
SELECT T1.year, T1.location, T1.title FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.height_mm > 1000 ORDER BY T1.title;
SELECT DISTINCT T1.year, T1.location, T1.title FROM Paintings AS T1 JOIN ( SELECT T2.year, T2.location, T2.title FROM Paintings AS T2 WHERE T2.height_mm > 1000 ) AS T3 ON T1.year = T3.year AND T1.location = T3.location ORDER BY T1.title ASC;
SELECT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.artistID WHERE p.painterID IS NOT NULL;
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.title NOT IN ( SELECT Sculptures.title FROM Sculptures WHERE Sculptures.sculptorID = Artists.artistID )
SELECT T1.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1885 AND T1.mediumOn = 'canvas'
SELECT T1.location FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.birthYear < 1885 AND T1.medium = 'canvas'
error: No SQL found in the input string
SELECT COUNT(*) FROM race;
SELECT T1.Winning_driver, T1.Winning_team FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID ORDER BY T2.Winning_team ASC;
SELECT T1.Winning_driver, T1.Winning_team FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID ORDER BY T2.Winning_team ASC
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position = 'Junior Strous' AND T1.Driver_Name NOT IN (SELECT T3.Driver_Name FROM driver AS T3 WHERE T3.Driver_Name = 'Junior Strous')
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position != 'Junior Strous' AND T2.Winning_driver = 'Junior Strous'
SELECT T2.Constructor FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID ORDER BY T1.Age ASC;
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20;
SELECT MIN(Age), MAX(Age) FROM driver
SELECT MAX(Age), MIN(Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 20 OR Age < 30
SELECT COUNT(DISTINCT engine) FROM driver WHERE age BETWEEN 31 AND 20 OR age > 30 OR age < 20;
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC;
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID;
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID;
SELECT Driver_Name, COUNT(DISTINCT Race_Name) FROM race GROUP BY Driver_Name;
SELECT driver.Name, COUNT(DISTINCT race.Road) AS Race_Count FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID
SELECT MIN(Age) FROM race
error: No SQL found in the input string
SELECT Driver_Name, Age FROM driver WHERE Driver_ID IN ( SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(DISTINCT Driver_ID) > 1 )
SELECT Driver_Name, Age FROM driver WHERE Driver_ID IN ( SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(DISTINCT Race_ID) > 2 )
SELECT DISTINCT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Age >= 26
SELECT DISTINCT race_name FROM race WHERE Driver_ID IN (SELECT Driver_ID FROM driver WHERE Age >= 26)
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT DISTINCT T1.Constructor FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Constructor != 'Bugatti';
SELECT Constructor, COUNT(DISTINCT Driver_ID) AS Driver_count FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1;
error: No SQL found in the input string
SELECT DISTINCT T2.Engine FROM ( SELECT Driver_ID, COUNT(DISTINCT T2.Engine) AS Engine_Count FROM race GROUP BY Driver_ID ) AS T1 INNER JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Engine_Count > 1
SELECT DISTINCT T1.engine FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(DISTINCT T1.Driver_ID) > 1;
SELECT DISTINCT T1.name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Race_Name NOT IN ('Road Race Showcase/Road America - Race 1', 'Road Race Showcase/Road America - Race 2', 'Rexall Grand Prix of Edmonton - Race 1', 'Rexall Grand Prix of Edmonton - Race 2');
SELECT DISTINCT T1.name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Race_Name NOT IN ('SunRichGourmet.com 1000', 'Sommet des Legends', 'Road Race Showcase/Road America - Race 2', 'Road Race Showcase/Road America - Race 1', 'Rexall Grand Prix of Edmonton - Race 2', 'Rexall Grand Prix of Edmonton - Race 1')
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT T1.Constructor FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Age < 20 AND T2.Pole_Position IN ('Jonathan Bomarito', 'James Hinchcliffe', 'Carl Skerlong') AND T1.Age > 30
SELECT T2.Constructor, T2.Engine FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T2.Engine HAVING COUNT(T2.Engine) > 1
SELECT T2.Constructor, COUNT(T1.Race_Name) AS Race_Wins FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T2.Constructor HAVING Race_Wins > 1
SELECT DISTINCT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position IN ('James Hinchcliffe', 'Carl Skerlong') AND T1.Driver_Name IN ('James Hinchcliffe', 'Carl Skerlong')
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position = 'James Hinchcliffe' AND T2.Pole_Position = 'Carl Skerlong'
SELECT DISTINCT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position NOT IN ('James Hinchcliffe')
SELECT DISTINCT T1.name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Race_Name NOT IN ('SunRichGourmet.com 1000', 'Rexall Grand Prix of Edmonton - Race 1', 'Rexall Grand Prix of Edmonton - Race 2') AND T2.Pole_Position NOT IN ('James Hinchcliffe');
SELECT COUNT(language_id) FROM official_languages
SELECT COUNT(language_id) FROM official_languages
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id = T2.id ORDER BY T2.name ASC
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id = T2.id ORDER BY T2.name
SELECT DISTINCT l.name FROM languages AS l JOIN official_languages AS ol ON l.id = ol.language_id WHERE l.name LIKE '%ish%'
SELECT DISTINCT T1.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id = T2.id WHERE T2.name LIKE '%ish%';
-- Show the names of countries in descending order of overall scores. SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id WHERE official_languages.language_id = (SELECT id FROM languages WHERE name = 'Swedish');
SELECT countries.name, countries.overall_score FROM countries JOIN official_languages ON countries.id = official_languages.country_id ORDER BY countries.overall_score DESC;
SELECT AVG(T2.judgment_score) FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T2.id IN (SELECT T1.country_id FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T1.judgment_score IS NOT NULL GROUP BY T1.country_id HAVING COUNT(T1.judgment_score) > 1);
SELECT AVG(official_languages.language_id) AS average_judicial_score FROM official_languages
SELECT max(health_score), min(health_score) FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT MIN(official_languages.health_score), MAX(official_languages.health_score) FROM official_languages WHERE official_languages.country_id NOT IN ('Norway') ORDER BY official_languages.health_score ASC LIMIT 1;
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id = T2.country_id JOIN languages AS T3 ON T2.language_id = T3.id ORDER BY T3.education_score DESC;
SELECT countries.name, countries.overall_score FROM countries JOIN official_languages ON countries.id = official_languages.country_id WHERE official_languages.language_id = (SELECT language_id FROM languages WHERE name = 'English') ORDER BY countries.overall_score DESC;
SELECT T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T1.language_id = ( SELECT T3.language_id FROM languages AS T3 WHERE T3.name = 'Politcal' )
SELECT T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T1.language_id = ( SELECT T3.language_id FROM languages AS T3 JOIN official_languages AS T4 ON T4.language_id = T3.id WHERE T3.name = 'Politik' )
SELECT countries.name, languages.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id;
SELECT countries.name, languages.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id
SELECT T1.name, COUNT(T2.id) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id = T2.id GROUP BY T1.name;
SELECT T1.name AS official_language_name, COUNT(T2.id) AS number_of_countries FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN languages AS T3 ON T1.language_id = T3.id GROUP BY T1.name ORDER BY number_of_countries DESC LIMIT 10;
SELECT T1.name, COUNT(*) FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id GROUP BY T1.country_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name, T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T2.id = (SELECT T1.country_id FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id GROUP BY T1.country_id ORDER BY COUNT(*) DESC LIMIT 1);
SELECT T1.name, COUNT(*) FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN languages AS T3 ON T1.language_id = T3.id GROUP BY T1.name HAVING COUNT(*) >= 2
SELECT DISTINCT T1.language_id, T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN languages AS T3 ON T1.language_id = T3.id GROUP BY T1.language_id HAVING COUNT(T2.id) > 1
SELECT T1.overall_score FROM countries AS T1 JOIN official_languages AS T2 ON T1.id = T2.country_id WHERE T2.language_id = (SELECT id FROM languages WHERE name = 'English')
SELECT AVG(overall_score) FROM countries WHERE overall_score = (SELECT MIN(overall_score) FROM countries)
SELECT l.name, COUNT(*) AS count FROM official_languages AS l JOIN countries AS c ON l.country_id = c.id JOIN languages AS l1 ON l.language_id = l1.id WHERE l1.id IN ( SELECT l2.id FROM official_languages AS l2 JOIN countries AS c2 ON l2.country_id = c2.id WHERE c2.name = 'Sweden' ) GROUP BY l.name ORDER BY count DESC LIMIT 3;
SELECT languages.name, COUNT(countries.id) AS country_count FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id GROUP BY languages.name ORDER BY country_count DESC LIMIT 3;
SELECT T1.name, AVG(T2.overall_score) AS average_overall_score FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN languages AS T3 ON T1.language_id = T3.id GROUP BY T1.country_id ORDER BY average_overall_score DESC;
SELECT T1.name, AVG(T2.overall_score) AS average_overall_score FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id = T2.id GROUP BY T1.name ORDER BY average_overall_score DESC;
SELECT T1.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN languages AS T3 ON T1.language_id = T3.id WHERE T3.id IS NOT NULL ORDER BY COUNT(T1.language_id) DESC LIMIT 1;
SELECT T1.name, COUNT(T2.language_id) AS num_of_languages FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN languages AS T3 ON T1.language_id = T3.id GROUP BY T1.country_id ORDER BY num_of_languages DESC LIMIT 1;
SELECT T1.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T2.id NOT IN (SELECT T2.id FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id)
SELECT DISTINCT l.name FROM official_languages AS l JOIN countries AS c ON l.country_id = c.id WHERE c.id NOT IN (SELECT country_id FROM official_languages);
SELECT DISTINCT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id WHERE official_languages.language_id IS NULL
SELECT DISTINCT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id WHERE official_languages.language_id IS NULL
SELECT T1.name, T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id JOIN official_languages AS T3 ON T3.country_id = T2.id JOIN countries AS T4 ON T3.country_id = T4.id JOIN official_languages AS T5 ON T5.country_id = T4.id JOIN countries AS T6 ON T5.country_id = T6.id WHERE T1.language_id IN (SELECT T3.language_id FROM official_languages AS T3 JOIN countries AS T4 ON T3.country_id = T4.id WHERE T3.overall_score > 95) AND T1.language_id IN (SELECT T5.language_id FROM official_languages AS T5 JOIN countries AS T6 ON T5.country_id = T6.id WHERE T5.overall_score < 90)
SELECT T1.name, T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id = T2.id WHERE T2.overall_score > 95 AND T2.overall_score < 90;
SELECT DISTINCT county_state_province, town_city FROM Addresses;
SELECT town_city, county_state_province FROM Addresses
error: No SQL found in the input string
state_province: Over 60 years of age. county_state_province: Oklahoma
SELECT T2.feature_name, T2.feature_description FROM properties AS T1 JOIN property_features AS T2 ON T1.property_id = T2.property_id WHERE T1.property_name = 'rooftop';
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.feature_name, T1.feature_description FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id = T2.property_id GROUP BY T1.property_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT MIN(room_size) AS min_rooms FROM Rooms JOIN Properties ON Rooms.property_id = Properties.property_id;
SELECT MIN(room_count) FROM Properties;
SELECT COUNT(*) FROM Properties WHERE property_type_code = 'parking' OR property_type_code = 'garage'
SELECT COUNT(*) FROM Properties WHERE property_type_code = 'parking' OR property_type_code = 'garage'
error: No SQL found in the input string
SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description LIKE '%Mother%'
SELECT Users.first_name FROM Users JOIN ( SELECT user_id, COUNT(*) as property_count FROM User_Property_History GROUP BY user_id ORDER BY property_count DESC LIMIT 1 ) AS property_count_users ON Users.user_id = property_count_users.user_id
error: No SQL found in the input string
SELECT AVG(T1.room_count) FROM Properties AS T1 JOIN Rooms AS T2 ON T1.property_id = T2.property_id JOIN Ref_Room_Types AS T3 ON T2.room_type_code = T3.room_type_code WHERE T1.property_type_code = 'garden';
SELECT AVG(T2.room_size) FROM Properties AS T1 JOIN Rooms AS T2 ON T1.property_id = T2.property_id WHERE T1.property_type_code = 'garden' GROUP BY T1.property_type_code
SELECT T1.town_city FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id = T2.property_id JOIN Rooms AS T3 ON T2.room_id = T3.room_id WHERE T3.room_type_code = 'swimming pool' GROUP BY T1.town_city HAVING COUNT(T2.photo_seq) > 0;
error: No SQL found in the input string
SELECT Properties.property_id, Properties.price_min FROM Properties WHERE Properties.price_min = (SELECT MIN(price_min) FROM Properties) ORDER BY Properties.price_min ASC LIMIT 1;
SELECT Properties.property_id, Properties.price_min FROM Properties JOIN Property_Features ON Properties.property_id = Property_Features.property_id JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id JOIN Rooms ON Properties.property_id = Rooms.property_id JOIN User_Property_History ON Properties.property_id = User_Property_History.property_id JOIN User_Searches ON User_Property_History.user_id = User_Searches.user_id WHERE User_Searches.search_string = 'vendor requested price' ORDER BY Properties.price_min LIMIT 1;
SELECT AVG(room_size) FROM Rooms
SELECT AVG(rooms.room_size) FROM Rooms AS rooms JOIN Properties AS properties ON rooms.property_id = properties.property_id
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT COUNT(DISTINCT room_size) AS num_of_room_sizes FROM Rooms
SELECT Users.user_id, Users.login_name, Users.password FROM Users JOIN ( SELECT user_id, COUNT(*) as search_count FROM User_Searches GROUP BY user_id HAVING COUNT(*) > 1 ) AS search_counts ON Users.user_id = search_counts.user_id ORDER BY search_counts.search_count DESC LIMIT 10;
SELECT DISTINCT Users.user_id, User_Searches.search_seq FROM Users JOIN User_Searches ON Users.user_id = User_Searches.user_id GROUP BY Users.user_id, User_Searches.search_seq HAVING COUNT(User_Searches.search_seq) > 1;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Users.user_id, Users.age_category_code FROM Users JOIN ( SELECT user_id, COUNT(*) as count FROM User_Searches GROUP BY user_id HAVING COUNT(*) = 1 ) AS subquery ON Users.user_id = subquery.user_id
error: No SQL found in the input string
SELECT T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id = T2.user_id WHERE T2.search_string = 'repellat' ORDER BY T2.search_datetime ASC LIMIT 1;
SELECT `login_name` FROM Users WHERE age_category_code = 'Senior Citizen' ORDER BY `first_name`
SELECT `login_name` FROM Users WHERE age_category_code = 'Senior Citizen' ORDER BY `first_name`
SELECT SUM(CASE WHEN User_Property_History.search_string LIKE '%buyer%' THEN 1 ELSE 0 END) AS total_searches FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id WHERE User_Property_History.search_string LIKE '%buyer%'
SELECT COUNT(*) FROM User_Searches WHERE user_id IN (SELECT user_id FROM Users WHERE is_buyer = 1)
SELECT date_registered FROM Users WHERE login_name = 'Ratione'
SELECT date_registered FROM Users WHERE login_name = 'Ratione'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`address_id`, T1.`line_1_number_building`, T1.`town_city` FROM Addresses AS T1 JOIN Properties AS T2 ON T1.`address_id` = T2.`property_id` JOIN User_Property_History AS T3 ON T2.`property_id` = T3.`property_id` JOIN Users AS T4 ON T3.`user_id` = T4.`user_id` JOIN Properties AS T5 ON T2.`property_id` = T5.`property_id` JOIN Rooms AS T6 ON T5.`property_id` = T6.`property_id` JOIN User_Searches AS T7 ON T6.`property_id` = T7.`property_id` WHERE T4.`age_category_code` = 'Senior Citizen' AND T4.`user_category_code` = 'Senior Citizen' ORDER BY T1.`town_city` ASC;
SELECT T1.address_id, T1.line_1_number_building, T1.line_2_number_street, T1.town_city, T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id = T2.property_id JOIN User_Property_History AS T3 ON T2.property_id = T3.property_id JOIN Properties AS T4 ON T2.property_id = T4.property_id JOIN Rooms AS T5 ON T4.property_id = T5.property_id JOIN User_Searches AS T6 ON T4.user_id = T6.user_id WHERE T3.search_string LIKE '%senior citizen%' ORDER BY T1.zip_postcode;
SELECT COUNT(DISTINCT Property_ID) FROM Properties WHERE property_id IN ( SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2 )
SELECT COUNT(DISTINCT Property_ID) AS count FROM Properties WHERE Property_ID IN ( SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2 )
SELECT Properties.property_id, COUNT(*) AS photo_count FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Properties.property_id
SELECT Properties.property_id, COUNT(*) AS photo_count FROM Property_Photos JOIN Properties ON Property_Photos.property_id = Properties.property_id GROUP BY Properties.property_id;
SELECT Users.user_id, COUNT(*) AS photo_count FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id JOIN Rooms ON Properties.property_id = Rooms.property_id JOIN User_Property_History ON Properties.property_id = User_Property_History.property_id JOIN Users ON User_Property_History.user_id = Users.user_id GROUP BY Users.user_id
error: No SQL found in the input string
SELECT MAX(price_max) FROM Properties WHERE owner_user_id IN (SELECT user_id FROM Users WHERE user_category_code IN ('1', '2'))
SELECT T1.price_max FROM Properties AS T1 JOIN User_Property_History AS T2 ON T1.property_id = T2.property_id JOIN Properties AS T3 ON T1.property_id = T3.property_id JOIN User_Searches AS T4 ON T2.user_id = T4.user_id JOIN Users AS T5 ON T4.user_id = T5.user_id WHERE T5.user_category_code = '1' AND T5.user_category_code = '1'
SELECT U.search_seq AS search_seq, U.search_string AS search_string, U.datestamp AS datestamp, P.property_name AS property_name FROM User_Searches AS U JOIN Properties AS P ON U.property_id = P.property_id WHERE P.property_type_code = 'house' -- Assuming 'house' is the property type code AND U.search_string LIKE '%25%' -- Filtering by property name containing '25%' or '25-60' ORDER BY U.search_seq;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.property_type_description, COUNT(T2.property_id) AS number_of_properties FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id = T2.property_id JOIN Ref_Room_Types AS T3 ON T1.property_id = T3.property_id JOIN Ref_Room_Types AS T4 ON T3.room_type_code = T4.room_type_code JOIN Rooms AS T5 ON T4.room_type_code = T5.room_type_code JOIN Properties AS T6 ON T5.property_id = T6.property_id JOIN User_Property_History AS T7 ON T6.property_id = T7.property_id JOIN User_Searches AS T8 ON T6.user_id = T8.user_id WHERE T1.property_id = T7.property_id GROUP BY T1.property_type_description ORDER BY number_of_properties DESC LIMIT 1;
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Ref_Age_Categories AS T2 ON T1.age_category_code = T2.age_category_code WHERE T1.age_category_code = 'Over 60' ORDER BY T1.age_category_code LIMIT 1;
SELECT T2.age_category_description FROM Ref_Age_Categories AS T1 JOIN Ref_Age_Categories AS T2 ON T1.age_category_code = T2.age_category_code WHERE T1.age_category_description = 'Over 60'
SELECT room_size, COUNT(room_size) AS count FROM Rooms GROUP BY room_size;
SELECT room_size, COUNT(*) AS room_count FROM Rooms GROUP BY room_size;
SELECT T1.country FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id = T2.user_id JOIN Properties AS T3 ON T2.property_id = T3.property_id JOIN Rooms AS T4 ON T3.property_id = T4.property_id JOIN Addresses AS T5 ON T4.property_id = T5.property_id JOIN Ref_Age_Categories AS T6 ON T5.town_city = T6.age_category_code WHERE T1.first_name = 'Robbie' ORDER BY T2.search_datetime DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Users.first_name, Users.middle_name, Users.last_name FROM Users JOIN Addresses ON Users.user_address_id = Addresses.user_address_id JOIN Properties ON Addresses.property_id = Properties.property_id JOIN Property_Features ON Properties.property_id = Property_Features.property_id JOIN Rooms ON Properties.property_id = Rooms.property_id JOIN User_Property_History ON Properties.property_id = User_Property_History.property_id JOIN User_Searches ON User_Property_History.user_id = User_Searches.user_id WHERE Users.user_address_id IS NOT NULL;
SELECT DISTINCT T1.search_string FROM User_Searches AS T1 JOIN Properties AS T2 ON T1.property_id = T2.property_id JOIN Rooms AS T3 ON T2.property_id = T3.property_id WHERE T2.property_type_code = 'house' AND T3.room_type_code = 'single' AND T1.search_string NOT IN ( SELECT T2.search_string FROM Properties AS T2 JOIN Rooms AS T3 ON T2.property_id = T3.property_id WHERE T2.property_type_code = 'house' AND T3.room_type_code = 'single' )
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.first_name, T1.user_id FROM Users AS T1 JOIN ( SELECT user_id, COUNT(*) as count FROM User_Property_History WHERE datestamp >= '2015-01-01' AND datestamp <= '2016-01-01' GROUP BY user_id HAVING COUNT(*) <= 2 ) AS T2 ON T1.user_id = T2.user_id JOIN ( SELECT property_id, COUNT(*) as count FROM Properties WHERE datestamp >= '2015-01-01' AND datestamp <= '2016-01-01' GROUP BY property_id HAVING COUNT(*) >= 2 ) AS T3 ON T1.property_id = T3.property_id WHERE T2.count <= 2 OR T3.count <= 2 ORDER BY T1.user_id;
SELECT COUNT(*) FROM bike WHERE weight > 780;
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight), MIN(weight) FROM bike;
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
SELECT T1.name, T1.result FROM cyclists AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.cyclist_id WHERE T2.purchase_year NOT IN (SELECT T1.purchase_year FROM cyclists AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.cyclist_id WHERE T2.cyclist_id NOT IN (SELECT DISTINCT T1.id FROM cyclists AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.cyclist_id WHERE T2.purchase_year = T1.purchase_year))
SELECT DISTINCT bike_id, product_name FROM bikes WHERE purchase_year > 2015
SELECT bike_id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclists ON cyclists_own_bikes.cyclist_id = cyclists.id WHERE cyclists_own_bikes.purchase_year >= 2017 AND cyclists_own_bikes.purchase_year <= 2018 AND cyclists_id IN (SELECT cyclist_id FROM cyclists WHERE result = '4:26.644') GROUP BY bike_id, bike.product_name HAVING COUNT(*) >= 4;
SELECT bike_id, name FROM cyclists_own_bikes WHERE purchase_year = ( SELECT MIN(purchase_year) FROM ( SELECT bike_id, name FROM cyclists_own_bikes JOIN bike ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclist.id = bike.cyclist_id WHERE bike.product_name = 'Ibis ||' GROUP BY bike_id, name ORDER BY bike_id, name ASC ) )
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists AS T2 ON T1.id = T2.bike_id WHERE T2.nation IN ('Russia', 'Great Britain');
error: No SQL found in the input string
SELECT COUNT(*) FROM cyclists_own_bikes WHERE purchase_year NOT IN (SELECT purchase_year FROM bike WHERE id IN (SELECT bike_id FROM cyclists_own_bikes WHERE purchase_year >= 2015))
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id WHERE T2.result > '4:21.558' ORDER BY T2.purchase_year ASC
SELECT T1.product_name, T1.price FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id JOIN cyclists AS T3 ON T2.cyclist_id = T3.id WHERE T3.name = 'Bradley Wiggins' AND T3.name = 'Antonio Tauler';
SELECT T1.name, T1.nation, T1.result FROM cyclists AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.cyclist_id WHERE T2.bike_id IS NULL;
SELECT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id WHERE T2.material LIKE '%fiber%'
SELECT cyclist.name, COUNT(bike_id) AS bike_count FROM cyclists_own_bikes AS cyclists_own_bikes JOIN bike AS bike ON cyclists_own_bikes.bike_id = bike.id GROUP BY cyclist.name ORDER BY bike_count DESC;
SELECT T2.Flavor, T2.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item ORDER BY T2.Price DESC LIMIT 1;
SELECT T1.Item, T1.Flavor FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Price = (SELECT MIN(Price) FROM goods);
SELECT T2.Flavor, T2.Food FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item ORDER BY T2.Price DESC LIMIT 1
SELECT T1.Item, T1.Flavor FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Price = (SELECT MIN(Price) FROM goods);
SELECT Id FROM goods WHERE flavor = 'Apple'
error: No SQL found in the input string
SELECT Item.Id FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Price < 3
SELECT Id FROM goods WHERE Price < 3;
SELECT DISTINCT T1.Id FROM ( SELECT DISTINCT T1.Id FROM customers AS T1 JOIN items AS T2 ON T1.Id = T2.CustomerId JOIN goods AS T3 ON T2.ItemId = T3.Id WHERE T3.Flavor = 'Lemon' ) AS T4 JOIN customers AS T5 ON T4.Id = T5.Id ORDER BY T5.Id ASC;
SELECT DISTINCT T1.id FROM ( SELECT DISTINCT T1.id FROM customers AS T1 INNER JOIN items AS T2 ON T1.id = T2.CustomerId INNER JOIN goods AS T3 ON T2.ItemId = T3.Id WHERE T3.Flavor = 'Lemon' ) AS T4 JOIN customers AS T5 ON T4.id = T5.id ORDER BY T4.id ASC;
SELECT T2.Flavor, COUNT(T1.CustomerId) FROM items AS T1 JOIN goods AS T2 ON T1.ItemId = T2.Id JOIN customers AS T3 ON T1.CustomerId = T3.Id GROUP BY T2.Flavor
SELECT T1.Item, COUNT(*) FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN customers AS T3 ON T2.Item = T3.Id WHERE T3.Id IS NOT NULL GROUP BY T1.Item
SELECT DISTINCT customers.id FROM customers JOIN ( SELECT customer_id, COUNT(*) as count FROM receipts GROUP BY customer_id HAVING count >= 15 ) AS subquery ON customers.id = subquery.customer_id
SELECT DISTINCT customers.id FROM customers JOIN receipts ON customers.id = receipts.CustomerId GROUP BY customers.id HAVING COUNT(receipts.ReceiptNumber) >= 15
SELECT T2.LastName FROM customers AS T1 JOIN ( SELECT CustomerId, COUNT(*) as Count FROM receipts GROUP BY CustomerId HAVING Count > 10 ) AS T2 ON T1.Id = T2.CustomerId ORDER BY T2.Count DESC LIMIT 1;
SELECT T1.LastName FROM customers AS T1 JOIN items AS T2 ON T1.Id = T2.CustomerId JOIN goods AS T3 ON T2.Item = T3.Id WHERE T3.Flavor = 'Bakery' GROUP BY T1.LastName HAVING COUNT(T2.Ordinal) > 10;
SELECT COUNT(T1.Item) FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Flavor = 'Cake'
SELECT COUNT(T1.Item) FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Flavor = 'Cake';
SELECT Flavor FROM items WHERE Food = 'Croissant' AND Item IN (SELECT Id FROM goods WHERE Flavor = 'Croissant');
error: No SQL found in the input string
SELECT DISTINCT T2.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Item = T2.Item WHERE T2.CustomerId = 15;
SELECT DISTINCT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Item = T2.Item WHERE T2.CustomerId = 15;
SELECT T2.Flavor, AVG(T1.Price) AS Average_Price, MAX(T1.Price) AS Max_Price, MIN(T1.Price) AS Min_Price FROM items AS T1 JOIN goods AS T2 ON T1.ItemId = T2.ItemId JOIN customers AS T3 ON T1.CustomerId = T3.Id GROUP BY T2.Flavor
SELECT g.Flavor, AVG(i.Price) AS AveragePrice, MIN(i.Price) AS MinimumPrice, MAX(i.Price) AS MaximumPrice FROM items i JOIN goods g ON i.Item = g.Id GROUP BY g.Flavor;
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Flavor = 'Cake' AND goods.Flavor = 'Cookie';
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Flavor IN ('Cake', 'Cookie');
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id JOIN customers ON receipts.CustomerId = customers.Id WHERE customers.FirstName = 'LOGAN' AND goods.Flavor = 'Croissant';
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id JOIN customers ON receipts.CustomerId = customers.Id WHERE customers.FirstName = 'Logan' AND customers.LastName = 'Logan' AND goods.Flavor = 'Croissant';
SELECT receipts.ReceiptNumber, receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item WHERE items.Price = (SELECT MIN(Price) FROM items) ORDER BY receipts.Date DESC LIMIT 1;
SELECT receipts.ReceiptNumber, receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Flavor = goods.Flavor WHERE items.Price = (SELECT MAX(Price) FROM items) ORDER BY receipts.Date DESC LIMIT 1;
SELECT T2.Item, COUNT(*) AS Count FROM items AS T1 JOIN receipts AS T2 ON T1.Item = T2.Item GROUP BY T2.Item ORDER BY Count DESC LIMIT 1;
error: No SQL found in the input string
SELECT T2.Flavor, COUNT(*) FROM items AS T1 JOIN goods AS T2 ON T1.ItemId = T2.Item WHERE T2.Food IN ('Tart', 'Cookie', 'Croissant', 'Danish') GROUP BY T2.Food
SELECT Food, COUNT(*) FROM items GROUP BY Food;
SELECT T2.Flavor, AVG(T3.Price) FROM items AS T1 JOIN goods AS T2 ON T1.ItemId = T2.Id JOIN customers AS T3 ON T3.Id = T1.CustomerId GROUP BY T2.Flavor;
SELECT T1.Flavor, AVG(T2.Price) AS Average_Price FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item GROUP BY T1.Flavor
SELECT T1.Flavor, T2.Price FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item WHERE T2.Flavor = 'Apricot' AND T2.Price < 5 ORDER BY T2.Price ASC LIMIT 1;
SELECT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Flavor = 'Apricot' AND T2.Price < 5
SELECT Flavor FROM items WHERE Price > 10
SELECT Flavor FROM items WHERE Price > 10
SELECT DISTINCT T1.Item, T2.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN ( SELECT Item, AVG(Price) AS AvgPrice FROM items GROUP BY Item ) AS T3 ON T1.Item = T3.Item WHERE T3.AvgPrice < (SELECT AVG(Price) FROM items) GROUP BY T1.Item, T2.Price HAVING AVG(T2.Price) < (SELECT AVG(Price) FROM items)
SELECT DISTINCT T1.Item, T2.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Price < (SELECT AVG(T2.Price) FROM items AS T2 WHERE T2.Item = T1.Item) ORDER BY T1.Item ASC, T2.Price DESC GROUP BY T1.Item;
SELECT DISTINCT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN items AS T3 ON T2.Item = T3.Item WHERE T2.Flavor = 'Tart' AND T1.Price < (SELECT T3.Price FROM items AS T3 WHERE T3.Item = T1.Item AND T3.Flavor = 'Tart')
SELECT DISTINCT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN ( SELECT Item, MAX(Price) AS MaxPrice FROM items JOIN goods ON items.Item = goods.Item WHERE goods.Flavor = 'Tart' GROUP BY Item ) AS T3 ON T1.Item = T3.Item AND T2.Price = T3.MaxPrice WHERE T2.Price < ALL (SELECT T3.Price FROM items AS T3 JOIN goods AS T4 ON T3.Item = T4.Item WHERE T4.Flavor = 'Tart' GROUP BY T3.Item)
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Price > 13;
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Price > 13;
SELECT receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE items.Price > 15 ORDER BY receipts.Date DESC LIMIT 1;
SELECT receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Price > 15 ORDER BY receipts.Date DESC LIMIT 1;
SELECT DISTINCT goods.Id FROM goods WHERE goods.Id IN ( SELECT Item FROM items WHERE Item = 'APP' )
SELECT DISTINCT goods.Id FROM goods WHERE goods.Flavor = 'Apple'
SELECT T1.Flavor, T1.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Id = 70;
SELECT goods.Id, goods.Price FROM goods WHERE goods.Id = 70
SELECT DISTINCT T1.FirstName, T1.LastName FROM customers AS T1 JOIN ( SELECT Id, MAX(lastName) AS MaxLastName FROM customers GROUP BY Id ) AS T2 ON T1.Id = T2.Id ORDER BY T1.LastName;
SELECT T1.LastName FROM customers AS T1 JOIN ( SELECT Id, MAX(lastName) AS MaxLastName FROM customers GROUP BY Id ) AS T2 ON T1.Id = T2.Id ORDER BY T1.LastName ASC
SELECT DISTINCT goods.Id FROM items INNER JOIN goods ON items.Item = goods.Id ORDER BY goods.Id;
SELECT DISTINCT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item;
SELECT DISTINCT receipts.ReceiptNumber, goods.Flavor, items.Item FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.GoodId = goods.GoodId WHERE (goods.Flavor = 'Apple' OR items.Item = 'Apple') AND receipts.CustomerId = 12;
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Flavor = 'Apple' OR items.Food = 'Pie' AND items.Price > 10;
SELECT receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE items.Id = (SELECT Id FROM items ORDER BY Date DESC LIMIT 1);
SELECT receipts.ReceiptNumber, receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Flavor = 'Chocolate' AND goods.Price = (SELECT MIN(goods.Price) FROM goods) ORDER BY receipts.Date DESC LIMIT 1;
SELECT receipts.ReceiptNumber, receipts.Date FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE (items.Price > 10 OR (SELECT MIN(receipts.Date) FROM receipts WHERE ReceiptNumber = receipts.ReceiptNumber))
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.Item = items.Item JOIN goods ON items.Id = goods.Id WHERE goods.Price > 10 OR (items.Date = (SELECT MIN(Date) FROM receipts));
SELECT Item.Id FROM items INNER JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'Cookie' OR goods.Flavor = 'Cake' AND goods.Price BETWEEN 3 AND 7
SELECT T1.Item FROM items AS T1 INNER JOIN goods AS T2 ON T1.Item = T2.Id WHERE T2.Flavor = 'Cookie' OR T2.Flavor = 'Cake' AND T2.Price BETWEEN 3 AND 7
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN items AS T2 ON T1.Id = T2.CustomerId WHERE T2.Date = (SELECT MIN(Date) FROM items);
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN items AS T2 ON T1.Id = T2.CustomerId ORDER BY T2.Date ASC LIMIT 1
SELECT AVG(T2.Price) FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Flavor IN ('Blackberry', 'Blueberry');
SELECT AVG(good.Price) FROM goods g JOIN items i ON g.Id = i.Item JOIN customers c ON i.CustomerId = c.Id WHERE c.FirstName = 'TRAVIS' AND c.LastName = 'ZEME' OR c.FirstName = 'TERRELL' AND c.LastName = 'TOUSSAND';
SELECT T1.Price FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item WHERE T2.Flavor = 'Cheese' ORDER BY T1.Price DESC LIMIT 1
SELECT T2.Flavor FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Flavor = 'Cheese' ORDER BY T2.Price DESC LIMIT 1
SELECT FLavor, AVG(Price) AS Average_Price, MIN(Price) AS Lowest_Price, MAX(Price) AS Highest_Price FROM goods GROUP BY FLavor ORDER BY Flavor;
SELECT Flavor, MAX(Price), MIN(Price), AVG(Price) FROM items JOIN goods ON items.Item = goods.Id JOIN customers ON items.CustomerId = customers.Id WHERE customers.FirstName = 'TRAVIS' AND customers.LastName = 'ZEME' GROUP BY Flavor
SELECT T1.Price, T2.Flavor FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item WHERE T2.Food = 'Food' ORDER BY T1.Price ASC, T2.Flavor ASC;
SELECT MIN(good.Price), MAX(good.Price) FROM goods AS good JOIN items AS item ON good.Id = item.Item ORDER BY good.Food
SELECT Date FROM receipts ORDER BY Date DESC LIMIT 3;
SELECT DISTINCT Date FROM receipts WHERE Ordinal = ( SELECT Ordinal FROM receipts ORDER BY Ordinal DESC LIMIT 1 ) AND Ordinal IN ( SELECT Ordinal FROM receipts WHERE Ordinal = ( SELECT Ordinal FROM receipts ORDER BY Ordinal DESC LIMIT 1 ) )
SELECT c.FirstName, c.LastName, COUNT(*) AS ShoppingFrequency FROM customers c JOIN ( SELECT Id, COUNT(*) AS ShoppingFrequency FROM items JOIN goods g ON items.ItemId = g.Id GROUP BY Id ) items ON c.Id = items.Id GROUP BY c.Id ORDER BY ShoppingFrequency DESC LIMIT 1;
SELECT customers.Id, COUNT(receipts.ReceiptNumber) AS PurchaseCount FROM customers JOIN items ON customers.Id = items.CustomerId JOIN receipts ON customers.Id = receipts.CustomerId GROUP BY customers.Id ORDER BY PurchaseCount DESC LIMIT 1;
SELECT Date, COUNT(DISTINCT customers.Id) FROM receipts JOIN customers ON receipts.CustomerId = customers.Id JOIN items ON receipts.Item = items.Id WHERE Date IN ('12-Oct-2007', '9-Oct-2007', '7-Oct-2007', '20-Oct-2007', '10-Oct-2007', '16-Oct-2007') GROUP BY Date;
SELECT Date, COUNT(DISTINCT customers.Id) AS NumberOfVisits FROM receipts JOIN customers ON receipts.CustomerId = customers.Id GROUP BY Date
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN ( SELECT Id, Flavor FROM items WHERE Item = 'Tart' GROUP BY Id, Flavor ORDER BY Flavor ASC LIMIT 1 ) AS T2 ON T1.Id = T2.Id;
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN items AS T2 ON T1.Id = T2.CustomerId WHERE T2.Flavor = 'Apple' AND T2.Item = 'Tart'
SELECT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Price < (SELECT T3.Price FROM items AS T3 WHERE T3.Item = T1.Item)
SELECT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T2.Flavor = 'Croissant' AND T1.Price < (SELECT T2.Price FROM goods AS T2 WHERE T2.Flavor = 'Croissant') ORDER BY T1.Price ASC LIMIT 1;
SELECT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN (SELECT Item, AVG(Price) AS AvgPrice FROM items WHERE Item IN (SELECT Item FROM goods WHERE Price >= (SELECT AVG(Price) FROM items WHERE Item = T1.Item)) GROUP BY Item) AS T3 ON T1.Item = T3.Item WHERE T2.Price >= T3.AvgPrice;
SELECT T1.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN ( SELECT Item, AVG(Price) as AveragePrice FROM items WHERE Item IN (SELECT Item FROM goods WHERE Price >= (SELECT AVG(Price) FROM items WHERE Item = T1.Item)) GROUP BY Item ORDER BY AveragePrice DESC LIMIT 1 ) AS T3 ON T1.Item = T3.Item WHERE T2.Price >= T3.AveragePrice
SELECT Item.Id FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Price > (SELECT AVG(goods.Price) FROM goods WHERE goods.Price > (SELECT AVG(goods.Price) FROM goods) * 2)
SELECT Item.Id FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Price > (SELECT AVG(Price) FROM goods) GROUP BY Item.Id HAVING COUNT(*) > 2;
SELECT T1.Flavor, T1.Food, T2.Flavor FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item WHERE T2.Price = (SELECT MIN(T2.Price) FROM items AS T2 WHERE T2.Item = T1.Id) ORDER BY T2.Price ASC LIMIT 1;
SELECT T1.Flavor, T1.Food, T2.Price FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item ORDER BY T2.Price;
SELECT T1.Item, T1.Flavor FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN receipts AS T3 ON T2.Id = T3.Item WHERE T3.Date = '2007-10-01' ORDER BY T2.Food;
SELECT T1.Item, T2.Flavor FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item ORDER BY T2.Flavor;
SELECT T1.Item, T2.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item WHERE T1.Flavor = 'Chocolate' GROUP BY T1.Item HAVING COUNT(T1.Item) <= 10
SELECT T1.Item, T1.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN customers AS T3 ON T1.CustomerId = T3.Id WHERE T2.Flavor = 'Chocolate' GROUP BY T1.Item HAVING COUNT(T1.Item) <= 10;
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Food NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT T2.Flavor FROM items AS T1 JOIN goods AS T2 ON T1.ItemId = T2.ItemId WHERE T1.Food = 'Cakes' AND T2.Flavor != 'Tart' AND T2.Food = 'Cakes'
SELECT Flavor, COUNT(*) AS Frequency FROM items JOIN goods ON items.Item = goods.Id GROUP BY Flavor ORDER BY Frequency DESC LIMIT 3
SELECT T1.Item, T2.Price FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Item JOIN customers AS T3 ON T3.Id = T1.Customer WHERE T3.FirstName = 'STADICK' AND T3.LastName = 'SOPKO' GROUP BY T1.Item ORDER BY SUM(T2.Price) DESC LIMIT 3
SELECT DISTINCT customers.id FROM customers JOIN receipts ON customers.id = receipts.CustomerId GROUP BY customers.id HAVING SUM(items.Price) > 150;
SELECT DISTINCT customers.id FROM customers JOIN receipts ON customers.id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.ReceiptId WHERE SUM(items.Price) > 150;
SELECT DISTINCT c.Id FROM customers c JOIN ( SELECT Item, AVG(Price) as avg_price FROM items GROUP BY Item ) t ON c.Item = t.Item WHERE t.avg_price > 5;
error: No SQL found in the input string
SELECT Date FROM receipts WHERE Item IN (SELECT Id FROM items WHERE Price > 100) GROUP BY Date HAVING COUNT(*) > 100
SELECT receipts.Date, SUM(items.Price) AS Total_Sales FROM receipts JOIN items ON receipts.Item = items.Item GROUP BY receipts.Date HAVING SUM(items.Price) > 100 ORDER BY Total_Sales DESC LIMIT 1;
SELECT COUNT(DISTINCT Driver_ID) FROM driver;
SELECT COUNT(DISTINCT Driver_ID) AS Total_Drivers FROM team_driver;
SELECT Make, COUNT(*) AS num_drivers FROM driver WHERE Points > 150 GROUP BY Make;
SELECT Make, COUNT(*) FROM driver WHERE Points > 150 GROUP BY Make;
SELECT Make, AVG(Age) AS Average_Age FROM driver GROUP BY Make
SELECT Make, AVG(Age) AS Average_Age FROM driver GROUP BY Make
SELECT AVG(T1.Laps) FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID WHERE T1.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Age < 20)
SELECT AVG(T1.Laps) FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID WHERE T1.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Age < 20)
SELECT T2.Make, T2.Sponsor, T2.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID ORDER BY T3.Car_Owner ASC
SELECT T1.Make, T1.Sponsor, T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID ORDER BY T1.Car_Owner;
SELECT DISTINCT Make FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(DISTINCT Driver_ID) > 1)
SELECT Make, COUNT(DISTINCT Team_ID) AS TeamCount FROM team_driver GROUP BY Make HAVING COUNT(DISTINCT Team_ID) > 1
SELECT DISTINCT T2.Make FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Make = 'Buddy Arrington'
SELECT T2.Make FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Make = 'Buddy Arrington'
SELECT MAX(points), MIN(points) FROM driver;
SELECT MAX(points), MIN(points) FROM driver;
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Points < 150
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Points < 150;
SELECT Driver.Name FROM driver JOIN team_driver ON driver.Driver_ID = team_driver.Driver_ID JOIN team ON team_driver.Team_ID = team.Team_ID WHERE team.Country = (SELECT Country FROM country WHERE Country_Id = (SELECT Country_Id FROM team WHERE Team_ID = (SELECT Team_ID FROM team_driver WHERE Driver_ID = (SELECT Driver_ID FROM driver ORDER BY Age DESC LIMIT 1)))) ORDER BY Age ASC;
SELECT Driver.Name FROM driver JOIN team ON driver.Team_ID = team.Team_ID JOIN team_driver ON driver.Driver_ID = team_driver.Driver_ID JOIN country ON team.Country_ID = country.Country_ID JOIN make ON team.Make_ID = make.Make_ID JOIN sponsor ON team.Sponsor_ID = sponsor.Sponsor_ID WHERE country.Country_ID = 2 ORDER BY Driver.Age ASC;
SELECT T1.Driver_ID, T1.Driver, T2.Name FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID WHERE T2.Team_ID = (SELECT Team_ID FROM team ORDER BY Points DESC LIMIT 1) ORDER BY Points DESC;
SELECT Driver.Name, Driver.Points FROM driver JOIN team_driver ON driver.Driver_ID = team_driver.Driver_ID JOIN team ON team_driver.Team_ID = team.Team_ID ORDER BY Driver.Points DESC;
SELECT T1.Make, T1.Country FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID GROUP BY T1.Make, T1.Country
SELECT T1.Name, T1.Country FROM team AS T1 JOIN driver AS T2 ON T1.Team_ID = T2.Team_ID
SELECT T2.Make, T2.Points FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T2.Capital = 'Dublin' AND T3.Points = ( SELECT MIN(T3.Points) FROM driver AS T3 WHERE T3.Driver_ID = ( SELECT Driver_ID FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T2.Capital = 'Dublin' ) )
SELECT MAX(T2.Points) FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID JOIN country AS T4 ON T3.Country = T4.Country_Id WHERE T4.Capital = 'Dublin'
SELECT AVG(T2.Age) FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T1.Make = 'Chevrolet' AND T1.Country = 'USA' AND T1.Official_native_language = 'English';
SELECT AVG(T1.Age) FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T1.Make = 'Chevrolet' AND T1.Country = 'USA' AND T1.Official_native_language = 'English';
SELECT T2.Country FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T3.Points > 150 GROUP BY T2.Country HAVING COUNT(T3.Driver_ID) = 1;
SELECT T2.Country, COUNT(T1.Driver_ID) AS Points FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T3.Points > 150 GROUP BY T2.Country HAVING COUNT(T1.Driver_ID) > 1;
SELECT T2.Capital FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Points = (SELECT MIN(T3.Points) FROM driver)
SELECT T2.Capital, T2.make FROM team AS T1 JOIN driver AS T2 ON T1.Team_ID = T2.Team_ID ORDER BY T2.points DESC LIMIT 1
SELECT Make, COUNT(DISTINCT Driver_ID) AS Driver_Count FROM driver GROUP BY Make ORDER BY Driver_Count DESC;
SELECT Make, COUNT(DISTINCT Driver_ID) AS Driver_Count FROM team GROUP BY Make;
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Make FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver WHERE Driver_ID IN (SELECT Driver_ID FROM team_driver WHERE Team_ID IN (SELECT Team_ID FROM team WHERE Make IN (SELECT Make FROM country WHERE Country IN ('Japan', 'Ireland', 'China'))))) GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Make FROM driver GROUP BY Make HAVING COUNT(DISTINCT Driver_ID) >= 3;
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) >= 3
SELECT DISTINCT T2.`Team` FROM team AS T1 JOIN team_driver AS T2 ON T1.`Team_ID` = T2.`Team_ID` WHERE T2.`Driver_ID` IS NULL
SELECT T1.`Team` FROM team AS T1 JOIN team_driver AS T2 ON T1.`Team_ID` = T2.`Team_ID` GROUP BY T1.`Team_ID` HAVING COUNT(T2.`Driver_ID`) = 0
SELECT T2.Country FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Make = 'Chevrolet' AND T3.Make = 'Dodge' GROUP BY T2.Country HAVING COUNT(T2.Driver_ID) = 2;
SELECT DISTINCT T2.Country FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T3.Make = 'Chevrolet' AND T3.Make = 'Dodge' GROUP BY T2.Country HAVING COUNT(DISTINCT T3.Make) = 2
SELECT SUM(points) AS total_points, AVG(points) AS average_points FROM driver;
SELECT SUM(points) AS total_points, AVG(points) AS average_points FROM driver;
SELECT T2.country FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T3.Country IS NOT NULL
SELECT DISTINCT T2.Country FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID WHERE T1.Country IS NULL
SELECT T2.manager, T2.sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Driver_ID IN ( SELECT Driver_ID FROM team_driver WHERE Team_ID = (SELECT Team_ID FROM team WHERE Team = 'Henderson Motorsports') ) GROUP BY T2.manager, T2.sponsor ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.manager, T2.sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Make, T2.Manager, T2.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Age >= 2
SELECT T2.Make, T2.Manager, T2.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID JOIN country AS C ON T1.Country = C.Country JOIN make AS M ON T1.Make = M.Make JOIN manager AS M1 ON T1.Manager = M1.Manager JOIN car_owner AS C1 ON T1.Car_Owner = C1.Car_Owner WHERE COUNT(T1.Driver_ID) > 1
SELECT COUNT(Institution_ID) FROM institution;
SELECT COUNT(Institution_ID) FROM institution;
SELECT DISTINCT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT Name, Joined FROM institution ORDER BY Joined
SELECT DISTINCT City, Province FROM institution
SELECT DISTINCT T1.City, T1.Province FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution;
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution;
SELECT DISTINCT T1.Affiliation FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Joined < 1995 AND T2.Number_of_Championships > 0 AND T2.City != 'Vancouver'
SELECT DISTINCT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.City IS NOT NULL;
SELECT stadium.id, stadium.capacity FROM stadium JOIN Championship ON stadium.stadium_id = Championship.institution_id ORDER BY stadium.capacity DESC;
SELECT stadium.id, stadium.capacity FROM stadium JOIN Championship ON stadium.stadium_id = Championship.institution_id ORDER BY stadium.capacity DESC;
SELECT stadium.stadium_id, stadium.stadium_name, stadium.capacity FROM stadium JOIN Championship ON stadium.stadium_id = Championship.Institution_ID WHERE Championship.Number_of_Championships = ( SELECT MAX(CASE WHEN Championship.Number_of_Championships = 0 THEN stadium.capacity ELSE 0 END) FROM Championship ) ORDER BY stadium.capacity DESC LIMIT 1;
SELECT T1.Stadium FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Number_of_Championships = (SELECT MIN(T2.Number_of_Championships) FROM Championship AS T2 WHERE T2.Institution_ID = T1.Institution_ID)
SELECT Name, Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID WHERE Championship.Joined IS NOT NULL ORDER BY Nickname ASC LIMIT 10;
SELECT T1.Name AS Institution_Name, T2.Nickname AS Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID;
SELECT T2.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Enrollment = (SELECT MIN(T2.Enrollment) FROM institution AS T2) ORDER BY T1.Number_of_Championships DESC LIMIT 1;
SELECT T2.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Number_of_Championships = (SELECT MIN(T1.Number_of_Championships) FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Institution_ID = T2.Institution_ID GROUP BY T1.Institution_ID) ORDER BY T1.Number_of_Championships ASC LIMIT 1;
SELECT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Institution_ID ORDER BY T2.Number_of_Championships DESC;
SELECT T1.Name, COUNT(*) AS Number_of_Championships FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Institution_ID ORDER BY Number_of_Championships DESC
SELECT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Institution_ID HAVING COUNT(T2.Number_of_Championships) >= 1
SELECT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Institution_ID HAVING COUNT(T2.Number_of_Championships) > 1
SELECT SUM(CASE WHEN T1. affiliation = 'Public' THEN T1. number_of_championships ELSE 0 END) AS Total_Championships FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2. affiliation = 'Public';
SELECT COUNT(Institution_ID) FROM Championship WHERE Affiliation = 'Public'
SELECT DISTINCT Affiliation, COUNT(Affiliation) FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(*) FROM institution GROUP BY Affiliation
SELECT T2.Affiliation FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T2.Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Affiliation FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T2.Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Founded, T2.Founded FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Founded > (SELECT MAX(T2.Founded) FROM institution AS T2 WHERE T2.Institution_ID = T1.Institution_ID) GROUP BY T1.Founded HAVING COUNT(T1.Founded) > 1
SELECT T1.Founded, COUNT(T1.Founded) FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Founded HAVING COUNT(T1.Founded) > 1;
SELECT T2.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Capacity DESC;
SELECT T2.Nickname, T1.Capacity FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT T1.City, T1.Endowment FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.City IN ('Vancouver', 'Calgary')
SELECT T2.Province FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Founded < 1920 AND T1.Founded > 1950;
SELECT DISTINCT T1.Province FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Founded >= 1920 AND T1.Founded < 1950
SELECT COUNT(DISTINCT institution.Province) FROM institution;
SELECT COUNT(DISTINCT T1.Province) FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID
SELECT * FROM Warehouses;
SELECT Code, Location FROM Warehouses;
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse = 'New York'
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT W.Code, AVG(Boys.Value) AS Average_Value FROM Boxes AS Boys JOIN Warehouses AS W ON Boys.Warehouse = W.Code GROUP BY W.Code
SELECT W.Code, AVG(Boys.Value) AS Average_Value FROM Boxes AS Boys JOIN Warehouses AS W ON Boys.Warehouse = W.Code GROUP BY W.Code
SELECT AVG(T1.Contents.Value), SUM(T1.Contents.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code GROUP BY T1.Warehouse;
SELECT AVG(T1.Contents.value), SUM(T1.Contents.value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Code IS NOT NULL;
SELECT AVG(T1.Contents.Value), SUM(T1.Contents.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code;
SELECT AVG(T1.Contents.Value), SUM(T1.Contents.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Code IS NOT NULL;
SELECT Contents, AVG(Contents) AS Average, MAX(Contents) AS Maximum FROM Boxes GROUP BY Contents
SELECT COALESCE(T1.contents, '') AS contents, MAX(T2.value) AS max_value, MIN(T2.value) AS min_value FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code GROUP BY T1.contents
SELECT Contents FROM Boxes WHERE Value = (SELECT MAX(Value) FROM Boxes)
error: No SQL found in the input string
SELECT AVG(T1.value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code;
SELECT AVG(T1.value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code
SELECT DISTINCT Contents FROM Boxes;
error: No SQL found in the input string
SELECT COUNT(DISTINCT Contents) FROM Boxes;
error: No SQL found in the input string
SELECT DISTINCT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Value = 'Rocks';
SELECT DISTINCT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Value = 'None';
SELECT T1.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location IN ('Chicago', 'New York')
SELECT T1.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Code IN ('Chicago', 'New York')
SELECT SUM(T1.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location IN ('Chicago', 'New York')
SELECT SUM(T1.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Code IN ('Chicago', 'New York')
SELECT Contents FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'Chicago') OR Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT Contents FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'Chicago' OR Location = 'New York')
SELECT Contents FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks' AND T2.Contents != 'Scissors'
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks' AND T2.Value = 'Scissors'
SELECT Code FROM Boxes WHERE Contents = 'Rocks' OR Contents = 'Scissors';
SELECT DISTINCT W.Code FROM Warehouses AS W JOIN Boxes AS B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors');
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks' OR T2.Contents = 'Scissors';
SELECT T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Contents = 'Rocks' OR T1.Contents = 'Scissors'
SELECT Code, Contents FROM Boxes ORDER BY Value;
SELECT Code, Contents FROM Boxes ORDER BY Value;
SELECT T1.Code, T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code ORDER BY T1.Value LIMIT 1
SELECT T1.Code, T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code ORDER BY T1.Value LIMIT 1;
SELECT DISTINCT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Value > (SELECT AVG(T1.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code)
SELECT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents;
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT DISTINCT W.Code FROM Warehouses AS W JOIN Boxes AS B ON W.Code = B.Warehouse WHERE B.Contents = 'Rocks' AND B.Value > ( SELECT B2.Value FROM Boxes AS B2 WHERE B2.Warehouse = W.Code )
SELECT T1.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Contents = 'Rocks' AND T1.Value > ANY(T1.Contents)
SELECT W.Code, B.Contents FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE B.Values > (SELECT MAX(B.Values) FROM Boxes AS B WHERE B.Contents = 'Scissors') GROUP BY W.Code;
SELECT W.Code, T.Contents FROM Warehouses AS W JOIN Boxes AS B ON W.Code = B.Warehouse JOIN Boxes AS T ON B.Code = T.Warehouse WHERE T.Contents = 'Scissors' AND T.Value > (SELECT MAX(T.Value) FROM Boxes AS T WHERE T.Warehouse = W.Code)
SELECT SUM(T1.value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Capacity = (SELECT MAX(capacity) FROM Warehouses) GROUP BY T1.Code;
SELECT SUM(Contents.value) AS TotalValue FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Capacity = (SELECT MAX(capacity) FROM Warehouses) GROUP BY Warehouses.Code;
SELECT W.Code, AVG(B.Value) AS AverageValue FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code GROUP BY W.Code HAVING AVG(B.Value) > 150
SELECT W.Code, AVG(C.Value) AS AverageValue FROM Boxes AS C JOIN Warehouses AS W ON C.Warehouse = W.Code WHERE C.Value > 150 GROUP BY W.Code HAVING AVG(C.Value) > 150
SELECT Contents, SUM(Contents) FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Contents.Value) AS TotalBoxes, COUNT(Contents.Code) AS BoxCount FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Contents ORDER BY BoxCount DESC;
SELECT Location, SUM(Contents) AS Total, AVG(Contents) AS Average, MAX(Contents) AS Maximum FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Location;
SELECT Location, SUM(Contents) AS Total, AVG(Contents) AS Average, MAX(Contents) AS Maximum FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Location;
SELECT SUM(Capacity) FROM Warehouses;
SELECT SUM(Capacity) FROM Warehouses;
SELECT W.Location, B.Value FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE B.Value = (SELECT MAX(Value) FROM Boxes);
SELECT W.Location, MAX(B.Value) AS MaxValue FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code GROUP BY W.Location ORDER BY MaxValue DESC;
SELECT W.Code, COUNT(Codes) FROM Boxes AS Codes JOIN Warehouses AS W ON Codes.Warehouse = W.Code GROUP BY W.Code
SELECT W.Code, COUNT(T.Contents) AS BoxCount FROM Boxes AS T JOIN Warehouses AS W ON T.Warehouse = W.Code GROUP BY W.Code
SELECT COUNT(DISTINCT T1.Warehouse.Location) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Contents = 'Rocks'
error: No SQL found in the input string
SELECT T1.Code, T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code
SELECT Code, Location FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'Chicago');
SELECT Code FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT T1.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location = 'Chicago'
SELECT Warehouses.Code, SUM(Contents.Value) AS TotalBoxes FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Warehouses.Code
SELECT W.Code, COUNT(T.Contents) AS BoxCount FROM Boxes AS T JOIN Warehouses AS W ON T.Warehouse = W.Code GROUP BY W.Code;
SELECT Warehouses.Code, COUNT(DISTINCT Contents) AS Number_of_Distinct_Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Warehouses.Code
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) AS Count FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Warehouses.Code
SELECT Code FROM Warehouses WHERE Capacity > (SELECT Capacity FROM Warehouses)
SELECT Code FROM Warehouses WHERE Capacity > (SELECT Capacity FROM Boxes)
SELECT SUM(T1.Value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location = 'Chicago'
SELECT SUM(T1.Contents.value) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Code NOT IN ('Chicago') GROUP BY T2.Code;
SELECT University_Name, City, State FROM university ORDER BY University_Name;
SELECT University_Name, City, State FROM university ORDER BY University_Name;
SELECT COUNT(DISTINCT university_id) FROM university WHERE city IN ('St. Louis', 'Waukesha', 'Mequon')
SELECT COUNT(DISTINCT university_id) FROM university WHERE city IN ('St. Louis', 'Waukesha', 'Mequon') AND state IN ('Illinois', 'Ohio')
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university;
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university;
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Reputation_point > (SELECT AVG(T2.Reputation_point) FROM overall_ranking AS T2 WHERE T2.University_ID = T1.University_ID)
SELECT T1.Team_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN overall_ranking AS T3 ON T1.University_ID = T3.University_ID JOIN major_ranking AS T4 ON T2.Major_ID = T4.Major_ID WHERE T3.Reputation_point > (SELECT MAX(T3.Reputation_point) FROM overall_ranking AS T3 WHERE T3.Reputation_point > T3.Reputation_point ORDER BY T3.Reputation_point DESC LIMIT 1)
SELECT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university;
SELECT Home_Conference, COUNT(DISTINCT University_ID) FROM overall_ranking GROUP BY Home_Conference
SELECT COUNT(DISTINCT T1.University_ID) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T3.Major_ID = T2.Major_ID WHERE T2.Reputation_point = (SELECT MIN(T2.Reputation_point) FROM overall_ranking AS T2 JOIN major AS T3 ON T3.Major_ID = T2.Major_ID WHERE T2.Reputation_point = T3.Reputation_point)
SELECT T1.State, COUNT(T1.University_ID) AS University_Count FROM university AS T1 JOIN major AS T2 ON T1.Major_ID = T2.Major_ID GROUP BY T1.State ORDER BY University_Count DESC LIMIT 1;
SELECT State FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank = (SELECT MAX(Rank) FROM overall_ranking))
SELECT T1.Home_Conference FROM university AS T1 JOIN major AS T2 ON T1.Major_ID = T2.Major_ID JOIN overall_ranking AS T3 ON T1.Home_Conference = T3.Home_Conference WHERE T1.Enrollment > 2000 GROUP BY T1.Home_Conference;
SELECT T1.Home_Conference FROM university AS T1 JOIN major AS T2 ON T1.Major_ID = T2.Major_ID JOIN overall_ranking AS T3 ON T1.University_ID = T3.University_ID JOIN major_ranking AS T4 ON T2.Major_ID = T4.Major_ID WHERE T3.Reputation_point > 2000 AND T4.Total > 2000;
SELECT T1.concert_Name, T1.Enrollment FROM concert AS T1 JOIN ( SELECT T2.concert_ID, SUM(T2.Enrollment) AS Total FROM concert AS T2 JOIN ( SELECT T1.concert_ID, COUNT(*) AS Enrollment FROM concert AS T1 JOIN stadium AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID ) AS T3 ON T1.concert_ID = T3.concert_ID ) AS T4 ON T4.concert_ID = T1.concert_ID ORDER BY T4.Total DESC LIMIT 1
SELECT T1.Home_Conference, T2.Enrollment FROM university AS T1 JOIN major AS T2 ON T1.Major_ID = T2.Major_ID JOIN overall_ranking AS T3 ON T1.University_ID = T3.University_ID ORDER BY T3.Total LIMIT 1
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code;
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code;
SELECT Major_Name, Major_ID FROM major WHERE Major_ID IN ( SELECT Major_ID FROM major_ranking WHERE University_ID = ( SELECT University_ID FROM university WHERE University_Name = 'Augustana College' ) )
SELECT T1.Reputation_point, T1.Major_Name, T2.Reputation_point FROM major AS T1 JOIN university AS T2 ON T1.University_ID = T2.University_ID JOIN overall_ranking AS T3 ON T2.University_ID = T3.University_ID JOIN major_ranking AS T4 ON T2.University_ID = T4.University_ID WHERE T2.University_Name = 'Augustana College'
SELECT T1.University_Name, T1.City, T1.State FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.University_ID = (SELECT University_ID FROM university WHERE Major_Name = 'Accounting' ORDER BY T3.Rank DESC LIMIT 1)
SELECT T1.University_Name, T1.City, T1.State FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.University_ID = (SELECT University_ID FROM overall_ranking ORDER BY T3.Total DESC LIMIT 1) AND T3.Major_Name = 'Accounting'
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.rank = 1 ORDER BY T2.Reputation_point DESC LIMIT 1;
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Reputation_point = (SELECT MIN(T3.Reputation_point) FROM major AS T3 WHERE T3.University_ID = T1.University_ID AND T3.Reputation_point > T2.Reputation_point) ORDER BY T2.Reputation_point LIMIT 1
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major WHERE Rank = 1)
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Reputation_point != 1
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.University_ID = T1.University_ID AND T2.Major_Name = 'Accounting' AND T2.Major_Name = 'Urban Education';
SELECT T1.Major_Name FROM major AS T1 JOIN major_ranking AS T2 ON T1.Major_ID = T2.Major_ID WHERE T2.Reputation_point = (SELECT MIN(T2.Reputation_point) FROM major_ranking AS T2 WHERE T2.Major_ID = T1.Major_ID AND T2.Reputation_point > 0) AND T1.Major_Name IN ('Accounting', 'Urban Education')
SELECT T1.University_Name, T2.Reputation_point, T2.Reputation_point * T2.Citation_point AS Total FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID WHERE T1.City = 'Waukesha' AND T1.State = 'Wisconsin' ORDER BY T2.Reputation_point DESC, T2.Citation_point DESC LIMIT 1;
SELECT University_Name, Rank FROM university WHERE State = 'Wisconsin'
SELECT T1.university_name FROM university AS T1 JOIN major AS T2 ON T1.university_id = T2.university_id JOIN major_ranking AS T3 ON T2.major_id = T3.major_id WHERE T3.reputation_point = (SELECT MAX(T4.reputation_point) FROM university AS T4 WHERE T4.university_id = T1.university_id) ORDER BY T3.reputation_point DESC LIMIT 1;
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.Reputation_point = (SELECT MAX(T3.Reputation_point) FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID) ORDER BY T3.Reputation_point DESC LIMIT 1;
SELECT University_Name FROM university ORDER BY Reputation_point ASC;
SELECT University_Name FROM university ORDER BY Reputation_point ASC
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN overall_ranking AS T3 ON T1.University_ID = T3.University_ID JOIN major_ranking AS T4 ON T2.Major_ID = T4.Major_ID WHERE T3.Reputation_point >= 3 ORDER BY T4.Rank ASC LIMIT 1;
SELECT T1.University_Name, T2.Reputation_point, T3.Reputation_point FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID JOIN major_ranking AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.Rank >= 3;
SELECT SUM(T1.Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank < 5
SELECT SUM(T2.Reputation_point) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank <= 5;
SELECT T1.Major_Name, T1.Reputation_point FROM major AS T1 JOIN major_ranking AS T2 ON T1.Major_ID = T2.Major_ID WHERE T2.Reputation_point >= 3 ORDER BY T1.Reputation_point DESC LIMIT 3;
SELECT T1.Major_Name, T2.Reputation_point FROM major AS T1 JOIN university AS T2 ON T1.Major_ID = T2.Major_ID ORDER BY T2.Reputation_point DESC LIMIT 3;
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.University_ID = T2.University_ID WHERE T1.Enrollment < 3000 GROUP BY T1.University_ID HAVING COUNT(DISTINCT T2.University_ID) > 2;
SELECT T1.State, COUNT(T1.University_ID) FROM university AS T1 JOIN major AS T2 ON T1.Major_ID = T2.Major_ID JOIN overall_ranking AS T3 ON T1.University_ID = T3.University_ID JOIN major_ranking AS T4 ON T2.Major_ID = T4.Major_ID WHERE T3.Reputation_point > 2 AND T3.Total < 3000 GROUP BY T1.State
SELECT DISTINCT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Movie IS NULL;
SELECT DISTINCT T1.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Movie IS NULL
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G'
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G'
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie = 'Odeon'
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT T1.Name AS TheaterName, T2.Name AS MovieName FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie IN (SELECT T2.Name FROM Movies AS T2 WHERE T2.Code IS NOT NULL)
error: No SQL found in the input string
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
error: No SQL found in the input string
SELECT COUNT(DISTINCT MovieTheaters.Movie) AS TotalMovies FROM MovieTheaters;
SELECT COUNT(DISTINCT MovieTheaters.Movie) FROM MovieTheaters;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.Rating FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T1.Title LIKE '%Citizen%' AND T2.Movie IS NOT NULL;
SELECT T1.Rating FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T1.Name LIKE '%Citizen%' AND T2.Movie IS NOT NULL
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating IN ('G', 'PG')
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating IN ('G', 'PG')
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie IN ('Odeon', 'Imperial')
SELECT DISTINCT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name IN ('Odeon', 'Imperial')
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie IN ('Odeon', 'Imperial')
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie = (SELECT Movie FROM Movies WHERE Code = (SELECT Code FROM MovieTheaters WHERE Name = 'Odeon') INTERSECT SELECT Movie FROM Movies WHERE Code = (SELECT Code FROM MovieTheaters WHERE Name = 'Imperial'))
SELECT DISTINCT T1.Movie FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie NOT IN ('Odeon')
SELECT DISTINCT T1.Movie FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Movie != 'Odeon'
SELECT Title FROM Movies ORDER BY Title;
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code ORDER BY T1.Name;
SELECT Title FROM Movies ORDER BY Rating;
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code ORDER BY T2.Rating;
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Movie ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Movie ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Movie ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Movie ORDER BY COUNT(T1.Movie) DESC LIMIT 1
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL;
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Movie HAVING COUNT(T1.Movie) > 0
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies)
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G'
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G'
SELECT Title FROM Movies;
SELECT DISTINCT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie;
SELECT DISTINCT Rating FROM Movies;
SELECT DISTINCT Rating FROM Movies;
SELECT Title FROM Movies WHERE Rating = 'None'
SELECT DISTINCT T1.Title, T1.Rating FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T1.Rating IS NULL;
SELECT DISTINCT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Movie IS NULL;
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Code IS NULL;
SELECT T2.Name FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Recipient ORDER BY T2.Weight DESC LIMIT 1
SELECT C.Name FROM Client AS C JOIN Package AS P ON C.AccountNumber = P.Sender JOIN Shipment AS S ON P.Shipment = S.ShipmentID JOIN Has_Clearance AS H ON S.Planet = H.Planet WHERE H.Level = 4 ORDER BY P.Weight DESC LIMIT 1;
SELECT SUM(Weight) FROM Package WHERE Sender = 'Leo Wong'
SELECT SUM(Weight) FROM Package WHERE Sender = 'Leo Wong'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Salary`, `Position` FROM Employee WHERE Name = 'Turanga Leela';
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela';
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT Level FROM Client WHERE Name = 'Physician' AND EmployeeID IN (SELECT EmployeeID FROM Has_Clearance WHERE PlanetID IN (SELECT PlanetID FROM Planet WHERE Name = 'Tarantulon VI'))
SELECT Level FROM Has_Clearance WHERE Employee = 'Physician'
SELECT PackageNumber FROM Package WHERE Sender = 'Leo Wong'
SELECT COUNT(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber HAVING T1.Name = 'Leo Wong'
SELECT PackageNumber FROM Package WHERE Sender = 'Leo Wong' AND Recipient = 'Judge John Whitey'
SELECT PackageNumber FROM Package WHERE Sender = 'Leo Wong'
SELECT T2.Contents, T3.Shipment AS ShipmentID FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender JOIN Package AS T3 ON T3.Shipment = T2.Shipment JOIN Employee AS T4 ON T3.Sender = T4.Employee WHERE T4.Name = 'Leo Wong';
SELECT DISTINCT PackageNumber FROM Client WHERE Name = 'Leo Wong' AND PackageNumber IN (SELECT PackageNumber FROM Shipment WHERE Manager = 'Leo Wong' AND Sender = 'Leo Wong')
SELECT COUNT(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender JOIN Package AS T3 ON T2.Shipment = T3.Shipment JOIN Has_Clearance AS T4 ON T3.Shipment = T4.ShipmentID JOIN Employee AS T5 ON T4.Employee = T5.EmployeeID WHERE T5.Name = 'Ogden Wernstrom' AND T5.Name = 'Leo Wong';
SELECT COUNT(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender JOIN Package AS T3 ON T2.Shipment = T3.Shipment JOIN Client AS T4 ON T3.Recipient = T4.AccountNumber WHERE T4.Name = 'Ogden Wernstrom' AND T1.Name = 'Leo Wong'
SELECT Contents FROM Package WHERE Sender = 'John Zoidfarb' AND Recipient = 'Judge John Whitey'
SELECT T1.Contents FROM Client AS T1 JOIN Has_Clearance AS T2 ON T1.AccountNumber = T2.Employee WHERE T2.Name = 'John Zoidfarb' GROUP BY T1.AccountNumber, T1.Name
SELECT T1.ShipmentID, T1.Weight FROM Client AS T1 JOIN Has_Clearance AS T2 ON T1.AccountNumber = T2.Employee WHERE T1.Name LIKE '%John%' AND T2.Level = 4 ORDER BY T1.Weight DESC LIMIT 1;
SELECT T3.ShipmentID, MAX(T3.Weight) AS MaxWeight FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender JOIN Package AS T3 ON T2.Shipment.ShipmentID = T3.ShipmentID WHERE T1.Name LIKE '%John%' OR T1.Name LIKE '%%John%' OR T1.Name LIKE '%%John%' OR T1.Name LIKE '%%John%' GROUP BY T3.ShipmentID;
SELECT PackageNumber, Weight FROM Package WHERE Weight < (SELECT MIN(Weight) FROM Package) ORDER BY Weight DESC LIMIT 3;
SELECT T1.PackageNumber, T1.Weight FROM Package AS T1 JOIN ( SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3 ) AS T2 ON T1.PackageNumber = T2.PackageNumber
SELECT C.Name, COUNT(P.PackageNumber) AS PackageCount FROM Client AS C JOIN Has_Clearance AS H ON C.AccountNumber = H.Employee JOIN Package AS P ON H.Planet = P.Planet GROUP BY C.AccountNumber ORDER BY PackageCount DESC LIMIT 1;
SELECT C.Name, COUNT(P.PackageNumber) AS PackageCount FROM Client AS C JOIN Package AS P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber ORDER BY PackageCount DESC LIMIT 1;
SELECT C.Name, COUNT(P.PackageNumber) AS PackageCount FROM Client AS C JOIN Has_Clearance AS H ON C.AccountNumber = H.Employee JOIN Package AS P ON H.Planet = P.Planet GROUP BY C.AccountNumber ORDER BY PackageCount DESC LIMIT 1;
SELECT T2.Recipient, SUM(T2.Weight) AS TotalWeight FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T2.Recipient ORDER BY TotalWeight DESC LIMIT 1;
SELECT C.Name FROM Client AS C JOIN Has_Clearance AS H ON C.AccountNumber = H.Employee JOIN Package AS P ON H.Planet = P.Shipment GROUP BY C.AccountNumber HAVING COUNT(DISTINCT P.Shipment) > 1;
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber HAVING COUNT(T2.Shipment) > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars';
SELECT T2.Coordinates FROM Planet AS T1 JOIN Has_Clearance AS T2 ON T1.PlanetID = T2.Planet WHERE T1.Name = 'Mars';
SELECT Name, Coordinates FROM Planet ORDER BY Name;
SELECT Name, Coordinates FROM Planet ORDER BY Name;
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Client ON Has_Clearance.Manager = Client.AccountNumber JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry';
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Client ON Has_Clearance.Manager = Client.AccountNumber JOIN Package ON Has_Clearance.Employee = Client.AccountNumber WHERE Has_Clearance.Level = 2 AND Has_Clearance.PlanetID = Has_Clearance.PlanetID AND Has_Clearance.ShipmentID IS NOT NULL;
SELECT DISTINCT Shipment.Date FROM Shipment JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Client ON Has_Clearance.Manager = Client.AccountNumber
SELECT DISTINCT Shipment.Date FROM Shipment JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Client ON Has_Clearance.Manager = Client.AccountNumber
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Planet ON Has_Clearance.PlanetID = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID JOIN Client ON Has_Clearance.Manager = Client.AccountNumber WHERE Planet.Name = 'Tarantulon VI' AND Planet.PlanetID = 65498721354.688 AND Planet.Coordinates = 65498463216.3466 AND Planet.Coordinates = 65432135979.6547 AND Planet.Coordinates = 6543219894.1654 AND Planet.Coordinates = 849842198.354654 AND Planet.Coordinates = 654321987.21654
SELECT PackageNumber FROM Package WHERE Shipment.ShippingID IN ( SELECT Shipment.ShipmentID FROM Shipment JOIN Has_Clearance ON Shipment.ShippingID = Has_Clearance.ShippingID JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID JOIN Client ON Has_Clearance.Manager = Client.AccountNumber WHERE Planet.Name = 'Tarantulon VI' AND Has_Clearance.Level = 2 AND Client.Name = 'Zapp Brannigan' AND Has_Clearance.ShipmentID IS NOT NULL AND PackageContents = 'Undeclared' )
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Planet.Name = 'Mars' OR Planet.Name = 'Omicron Persei 8' OR Planet.Name = 'Omega III' OR Planet.Name = 'Nintenduu 64' OR Planet.Name = 'Mars'
SELECT PackageNumber FROM Package WHERE Shipments IN (SELECT ShipmentID FROM Shipment WHERE Planet = 'Mars' AND Manager = 'Turanga Leela')
SELECT Planet.Name, SUM(Has_Clearance.Weight) AS Total_Weight FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet WHERE Has_Clearance.Employee = (SELECT EmployeeID FROM Client WHERE AccountNumber = 'Judge John Whitey') GROUP BY Planet.Name
SELECT Planet.Name, COUNT(*) AS Number_of_shipments FROM Shipment JOIN Has_Clearance ON Shipment.ShipmentID = Has_Clearance.ShipmentID JOIN Planet ON Has_Clearance.PlanetID = Planet.PlanetID GROUP BY Planet.Name ORDER BY Number_of_shipments DESC;
SELECT Planet.Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet JOIN Shipment ON Has_Clearance.Planet = Shipment.Planet GROUP BY Planet.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Planet.Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet JOIN Shipment ON Has_Clearance.Planet = Shipment.Planet WHERE Shipment.ShipmentID = (SELECT MAX(Shipment.ShipmentID) FROM Shipment) ORDER BY Planet.Name DESC LIMIT 1;
SELECT T3.`Name`, COUNT(*) FROM Has_Clearance AS T1 JOIN Shipment AS T2 ON T1.`Planet` = T2.`Planet` JOIN Employee AS T3 ON T1.`Manager` = T3.`EmployeeID` GROUP BY T3.`Name`
SELECT T3.Name, COUNT(*) AS Number_of_shipments FROM Has_Clearance AS T1 JOIN Shipment AS T2 ON T1.ShipmentID = T2.ShipmentID JOIN Employee AS T3 ON T1.Manager = T3.EmployeeID GROUP BY T3.Name ORDER BY Number_of_shipments DESC;
SELECT SUM(Weight) FROM Package WHERE Sender = 'Judge John Whitey' AND Recipient = 'Leo Wong' AND Planet = 'Mars' GROUP BY Sender, Recipient;
SELECT SUM(Weight) FROM Package WHERE Sender = 'Judge John Whitey' AND Recipient = 'Judge John Whitey' AND Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars')
SELECT Planet.Name, SUM(Weight) AS TotalWeight FROM Has_Clearance JOIN Shipment ON Has_Clearance.Planet = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.ShipmentID GROUP BY Planet.Name ORDER BY TotalWeight DESC;
SELECT P.Name AS PlanetName, SUM(P.Weight) AS TotalWeight FROM Has_Clearance H JOIN Shipment S ON H.Planet = S.Planet JOIN Package P ON S.ShipmentID = P.ShipmentID GROUP BY P.Name ORDER BY TotalWeight DESC;
SELECT P.Name FROM Planet P JOIN Has_Clearance HC ON P.PlanetID = HC.Planet JOIN Shipment S ON HC.Planet = S.Planet WHERE S.Weight > 30 ORDER BY S.Date DESC LIMIT 1;
SELECT P.Name FROM Planet P JOIN Has_Clearance HC ON P.PlanetID = HC.Planet JOIN Shipment S ON HC.Planet = S.Planet WHERE S.Weight > 30
SELECT PackageNumber FROM Package WHERE Planet = 'Omicron Persei 8' AND Sender = 'Zapp Brannigan' AND Planet = PlanetID
SELECT COUNT(*) AS Number_of_Packages, Planet.Name AS Planet_Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet WHERE Has_Clearance.Manager = 'Zapp Brannigan' GROUP BY Planet.Name
SELECT PackageNumber FROM Package WHERE Planet = 'Omicron Persei 8' OR Sender = 'Zapp Brannigan' OR Planet = 'Omicron Persei 8' AND Sender = 'Zapp Brannigan'
SELECT COUNT(*) AS PackageCount, Planet.Name AS PlanetName FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet WHERE Planet.Name = 'Omicron Persei 8' OR (Planet.Name = 'Tarantulon VI' AND Has_Clearance.Employee = 'Zapp Brannigan')
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT T1.Name FROM Client AS T1 JOIN Has_Clearance AS T2 ON T1.AccountNumber = T2.EmployeeID WHERE T2.Planet = 'Mars'
SELECT T1.Name FROM Client AS T1 JOIN Has_Clearance AS T2 ON T1.AccountNumber = T2.Employee WHERE T2.Planet = 'Mars'
SELECT T1.Name FROM Client AS T1 JOIN Has_Clearance AS T2 ON T1.AccountNumber = T2.Employee WHERE T2.Level = 3 AND T1.Planet = 'Omega III'
SELECT T1.Name FROM Client AS T1 JOIN Has_Clearance AS T2 ON T1.AccountNumber = T2.Employee WHERE T2.Level = 4 AND T1.Shipment.Planet = 'Omega III'
SELECT Planet.Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet WHERE Has_Clearance.Level = 2;
SELECT Planet.Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet JOIN Client ON Has_Clearance.Employee = Client.AccountNumber WHERE Has_Clearance.Level = 2
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.EmployeeID WHERE T2.Salary BETWEEN 5000 AND 10000
SELECT Employee.Name FROM Employee JOIN Has_Clearance ON Employee.EmployeeID = Has_Clearance.Employee JOIN Shipment ON Has_Clearance.ShipmentID = Shipment.ShipmentID JOIN Package ON Shipment.ShipmentID = Package.Shipment WHERE Has_Clearance.Salary BETWEEN 5000 AND 10000 GROUP BY Employee.Name;
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee)
SELECT T1.Name FROM Employee AS T1 JOIN ( SELECT EmployeeID, AVG(Salary) as AverageSalary FROM Shipment GROUP BY EmployeeID ) AS T2 ON T1.EmployeeID = T2.EmployeeID WHERE T2.AverageSalary > 5000 OR T1.Salary > T2.AverageSalary;
SELECT COUNT(*) FROM Client WHERE AccountNumber IN (SELECT Client.AccountNumber FROM Client JOIN Has_Clearance ON Client.AccountNumber = Has_Clearance.Employee WHERE Has_Clearance.Planet = 'Mars' AND Has_Clearance.Employee = 0)
SELECT COUNT(*) FROM Client WHERE AccountNumber IN ( SELECT Client.AccountNumber FROM Client JOIN Package ON Client.AccountNumber = Package.Sender JOIN Has_Clearance ON Client.AccountNumber = Has_Clearance.Employee JOIN Shipment ON Has_Clearance.ShipmentID = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet = 'Mars' )
SELECT COUNT(*) FROM game;
SELECT COUNT(*) FROM game;
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC;
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(units_sold_Millions) FROM game WHERE Platform_ID NOT IN (SELECT Platform_ID FROM platform WHERE Platform_name = 'Nintendo')
SELECT AVG(units_sold_Millions) FROM game WHERE Franchise NOT LIKE 'Nintendo%'
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform;
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT COUNT(DISTINCT player_id) FROM game_player WHERE if_active = 'T' AND Game_ID IN (SELECT Game_ID FROM game WHERE Rank_of_the_year < 3)
SELECT COUNT(DISTINCT T1.Player_ID) FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID = T2.Player_ID WHERE T2.Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name ASC;
SELECT DISTINCT player.name FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game.Game_ID = game_player.Game_ID WHERE game_player.If_active = 'T' ORDER BY player.name ASC;
SELECT Player_name, College FROM player WHERE Rank_of_the_year = (SELECT MIN(Rank_of_the_year) FROM player) ORDER BY Rank_of_the_year DESC;
SELECT Player_name, College FROM player WHERE Rank_of_the_year = (SELECT MIN(Rank_of_the_year) FROM player) ORDER BY Rank_of_the_year DESC
SELECT Player_name, Rank_of_the_year FROM player WHERE Player_ID IN (SELECT Player_ID FROM game_player WHERE Game_ID = (SELECT Game_ID FROM game WHERE Title = 'Super Mario World'));
SELECT P.Player_name, P.Rank_of_the_year FROM player AS P JOIN game_player AS GP ON P.Player_ID = GP.Player_ID JOIN game AS G ON GP.Game_ID = G.Game_ID WHERE G.Title = 'Super Mario World' ORDER BY P.Rank_of_the_year;
SELECT DISTINCT T1.Developers FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID = T2.Player_ID JOIN game AS T3 ON T2.Game_ID = T3.Game_ID WHERE T3.Developers = 'Nintendo' AND T1.College = 'Auburn' GROUP BY T1.Developers HAVING COUNT(T2.Player_ID) = 1 ORDER BY T1.Developers ASC
SELECT DISTINCT T1.Developers FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID = T2.Player_ID JOIN game AS T3 ON T2.Game_ID = T3.Game_ID WHERE T1.College = 'Auburn' AND T2.If_active = 'T'
SELECT AVG(T2.units_sold_Millions) FROM player AS T1 JOIN game AS T2 ON T1.Game_ID = T2.Game_ID JOIN game_player AS T3 ON T2.Game_ID = T3.Game_ID WHERE T1.Position = 'Guard';
SELECT AVG(T1.Units_sold_Millions) FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID = T2.Player_ID WHERE T2.Position = 'Guard';
SELECT Title, Platform_name FROM game
SELECT Title, Platform_name FROM game WHERE Platform_ID = (SELECT Platform_ID FROM platform WHERE Platform_name = 'Super Mario Bros.');
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID WHERE T2.Market_district IN ('Asia', 'USA')
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID WHERE T2.Market_district IN ('Asia', 'USA')
SELECT T1.Platform_ID, T1.Platform_name, COUNT(T2.Game_ID) AS Game_Count FROM platform AS T1 JOIN game AS T2 ON T1.Platform_ID = T2.Platform_ID GROUP BY T1.Platform_ID, T1.Platform_name ORDER BY Game_Count DESC;
SELECT Platform_name, COUNT(*) FROM platform JOIN game ON platform.Platform_ID = game.Platform_ID GROUP BY Platform_name
SELECT T2.`Franchise` FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID JOIN game_player AS T3 ON T1.Game_ID = T3.Game_ID WHERE T3.If_active = 'T' GROUP BY T2.`Franchise` ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Franchise FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID JOIN game_player AS T3 ON T1.Game_ID = T3.Game_ID WHERE T3.If_active = 'T' GROUP BY T1.Franchise ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT T1.Franchise FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID JOIN game_player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.If_active = 'T' GROUP BY T1.Game_ID HAVING COUNT(T2.Position) >= 2;
SELECT DISTINCT T1.franchise FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID GROUP BY T1.franchise HAVING COUNT(T2.If_active) > 1
SELECT DISTINCT T1.Player_name FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID = T2.Player_ID WHERE T2.If_active = 'T';
SELECT DISTINCT p.name FROM player p JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Game_ID IS NULL;
SELECT g.Title FROM game g JOIN player p ON g.Game_ID = p.Game_ID WHERE p.College IN ('Oklahoma', 'Auburn') GROUP BY g.Title HAVING COUNT(DISTINCT p.Player_ID) = 1;
SELECT T1.Title FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID WHERE T2.College IN ('Oklahoma', 'Auburn') AND T1.Platform_ID = (SELECT Platform_ID FROM platform WHERE Platform_name = 'Oklahoma College' OR Platform_name = 'Auburn College')
SELECT DISTINCT T1.Franchise FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID JOIN game_player AS T3 ON T1.Game_ID = T3.Game_ID WHERE T3.Player_ID IN ( SELECT MIN(T3.Player_ID) FROM game_player AS T3 WHERE T3.Game_ID = T1.Game_ID ) GROUP BY T1.Franchise HAVING COUNT(T2.Player_ID) = ( SELECT MIN(COUNT(T2.Player_ID)) FROM game_player AS T3 WHERE T3.Game_ID = T1.Game_ID )
SELECT DISTINCT T1.Franchise FROM game_player AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID GROUP BY T1.Platform_ID HAVING COUNT(T1.Player_ID) = ( SELECT MIN(T3.Count) FROM ( SELECT COUNT(T1.Player_ID) AS Count FROM game_player AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID GROUP BY T1.Platform_ID ) AS T3 )
SELECT DISTINCT T1.Title FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID WHERE T2.Position = 'Guard' GROUP BY T1.Game_ID HAVING COUNT(DISTINCT T2.Player_ID) = 0
SELECT DISTINCT T1.Title FROM game AS T1 JOIN player AS T2 ON T1.Game_ID = T2.Game_ID WHERE T2.Position = 'Guard' GROUP BY T1.Title HAVING COUNT(T2.Player_ID) = 0
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1000000
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT AVG(Year_Profits_billion), MAX(Year_Profits_billion) FROM press
SELECT press.name, MAX(Year_Profits_billion), AVG(Year_Profits_billion) FROM press JOIN book ON press.press_id = book.press_id GROUP BY press.name
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT T1.Name AS Publisher_Name, T2.Name AS Publisher_Name FROM press AS T1 JOIN book AS T2 ON T1.Book_ID = T2.Book_ID WHERE T1.Month_Profits_billion = ( SELECT MAX(T3.Month_Profits_billion) FROM press AS T3 WHERE T3.Book_ID = T2.Book_ID ) OR T1.Month_Profits_billion = ( SELECT MIN(T3.Month_Profits_billion) FROM press AS T3 WHERE T3.Book_ID = T2.Book_ID );
SELECT Name FROM press WHERE Sale_Amount = (SELECT MAX(Sale_Amount) FROM press) UNION ALL SELECT Name FROM press WHERE Sale_Amount = (SELECT MIN(Sale_Amount) FROM press);
SELECT COUNT(DISTINCT author_id) FROM author WHERE age < 30
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT gender, AVG(Age) FROM author GROUP BY gender
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY gender
SELECT gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY gender
SELECT Title FROM book ORDER BY Release_date DESC;
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Press_ID, COUNT(*) AS Book_Count FROM book JOIN press ON book.Press_ID = press.Press_ID GROUP BY Press_ID
SELECT Press_ID, COUNT(*) AS Book_Count, Book_Series FROM book GROUP BY Press_ID, Book_Series
SELECT T1.Title, T1.Release_date FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 5;
SELECT T1.Title, T1.Release_date FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 5;
SELECT T2.`Book_Series` FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID WHERE T1.Sale_Amount > 1000 AND T1.Sale_Amount < 500;
SELECT T1.Book_Series, T2.Sale_Amount FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID WHERE T1.Sale_Amount BETWEEN 500 AND 1000 AND T1.Sale_Amount NOT IN (SELECT T3.Sale_Amount FROM book AS T3 WHERE T3.Sale_Amount < 500)
SELECT DISTINCT T1.Name FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID JOIN book AS T3 ON T3.Book_ID = T2.Book_ID WHERE T3.Book_Series = 'MM' AND T3.Book_Series = 'LT' AND T2.Press_ID IS NOT NULL
SELECT DISTINCT T1.Name FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID JOIN book AS T3 ON T2.Press_ID = T3.Press_ID WHERE T3.Title IN ('MM', 'LT')
SELECT T1.Name, T1.Age FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Book_ID IS NULL;
SELECT DISTINCT T1.Name FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Book_ID IS NULL
SELECT DISTINCT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID HAVING COUNT(T2.Book_ID) > 1
SELECT a.Name FROM author a JOIN press p ON a.Author_ID = p.Author_ID WHERE p.Year_Profits_billion > 1 GROUP BY a.Name HAVING COUNT(*) > 1;
SELECT T1.Title, T1.Name AS Publisher_Name, T2.Name AS Press_Name FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3;
SELECT T1.Title, T1.Author.Name, T1.Press.Name FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID WHERE T1.Sale_Amount = ( SELECT MAX(T1.Sale_Amount) FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID ) ORDER BY T1.Sale_Amount DESC LIMIT 3;
SELECT press.name, SUM(book.sale_amount) FROM press JOIN book ON press.press_id = book.press_id GROUP BY press.name
SELECT press.name, SUM(book.sale_amount) AS total_sale_amount FROM book JOIN press ON book.press_id = press.press_id GROUP BY press.name
SELECT press.name, COUNT(*) AS book_count FROM press JOIN book ON press.press_id = book.press_id GROUP BY press.name HAVING SUM(book.sale_amount) > 1000;
SELECT press.name, COUNT(*) FROM press JOIN book ON press.press_id = book.press_id GROUP BY press.name HAVING SUM(book.sale_amount) > 1000
SELECT T1.Name FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID JOIN book AS T3 ON T2.Press_ID = T3.Press_ID ORDER BY T3.Sale_Amount DESC LIMIT 1
error: No SQL found in the input string
SELECT T1.Name, T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Name, T2.Gender FROM book AS T1 JOIN author AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T2.Author_ID ORDER BY SUM(T1.Sale_Amount) DESC LIMIT 1;
SELECT DISTINCT T1.Name FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Name = 'Accor' AND T2.Press_ID IS NOT NULL
SELECT DISTINCT T1.Name FROM author AS T1 JOIN press AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Name != 'Accor' AND T2.Name IS NOT NULL
SELECT T1.Name, T2.Year_Profits_billion FROM press AS T1 JOIN book AS T2 ON T1.Book_ID = T2.Book_ID WHERE T1.Year_Profits_billion > 2 GROUP BY T1.Book_ID HAVING COUNT(T1.Book_ID) > 2;
SELECT T2.Name, T2.Year_Profits_billion FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID GROUP BY T2.Press_ID HAVING COUNT(T1.Book_ID) > 2
SELECT COUNT(DISTINCT Documents.Process_id) AS author_count FROM Documents JOIN Documents_Processes ON Documents.document_id = Documents_Processes.document_id JOIN Ref_Staff_Roles ON Documents.Process_id = Ref_Staff_Roles.process_id JOIN Authors ON Ref_Staff_Roles.staff_role_code = Authors.staff_role_code;
SELECT DISTINCT Authors.author_name FROM Authors;
SELECT T1.author_name, T1.other_details FROM Authors AS T1 JOIN Documents AS T2 ON T1.author_name = T2.author_name;
SELECT T1.author_name, T1.other_details FROM Authors AS T1 JOIN Documents AS T2 ON T1.author_name = T2.author_name WHERE T1.author_name = 'Addison Denesik';
SELECT COUNT(*) FROM Documents;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.author_name FROM Documents AS T1 JOIN Documents_Processes AS T2 ON T1.document_id = T2.document_id GROUP BY T2.document_id HAVING COUNT(T2.document_id) >= 2;
SELECT COUNT(*) FROM Business_Processes;
error: No SQL found in the input string
SELECT T1.process_name FROM Documents_Processes AS T1 INNER JOIN Documents AS T2 ON T1.document_id = T2.document_id INNER JOIN Process_Name AS T3 ON T1.process_id = T3.process_id WHERE T1.process_id = 9 GROUP BY T1.process_id, T3.process_id HAVING COUNT(*) = 1;
SELECT COUNT(*) FROM Documents_Processes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes;
error: No SQL found in the input string
SELECT COUNT(*) FROM Documents_Processes
SELECT process_status_code, process_status_description FROM Process_Status;
-- Execute the corrected query SELECT process_status_description FROM Documents_Processes INNER JOIN Documents ON Documents_Processes.document_id = Documents.document_id WHERE process_status_code = 'ct';
SELECT COUNT(DISTINCT Staff_id) AS Staff_Count FROM Staff_in_Processes;
SELECT Documents.Processes.process_id, Documents.Processes.process_outcome_code, Documents.Processes.process_status_code, Documents.Processes.process_name, Documents.document_id, Documents.Processes.next_process_id, Documents.Processes.date_from, Documents.Processes.date_to, Documents.Processes.other_details FROM Documents JOIN Business_Processes ON Documents.Processes.process_id = Business_Processes.process_id JOIN Documents_Processes ON Documents.Processes.process_id = Documents_Processes.process_id JOIN Process_Outcomes ON Documents.Processes.process_outcome_code = Process_Outcomes.process_outcome_code JOIN Process_Status ON Process_Outcomes.process_status_code = Process_Status.process_status_code JOIN Ref_Staff_Roles ON Process_Status.process_status_code = Ref_Staff_Roles.staff_role_code JOIN Staff_in_Processes ON Documents.Processes.process_id = Staff_in_Processes.process_id JOIN Documents_Processes ON Staff_in_Processes.document_id = Documents_Processes.document_id JOIN Documents ON Documents.Processes.process_id = Documents_Processes.process_id JOIN Process_Outcomes ON Documents.Processes.process_outcome_code = Process_Outcomes.process_outcome_code JOIN Process_Status ON Process_Outcomes.process_status_code = Process_Status.process_status_code JOIN Ref_Staff_Roles ON Process_Status.process_status_code = Ref_Staff_Roles.staff_role_code WHERE Documents.Processes.process_id IS NOT NULL ORDER BY Documents.Processes.process_id;
error: No SQL found in the input string
SELECT COUNT(DISTINCT Ref_Staff_Roles.staff_role_code) AS num_staff_roles FROM Ref_Staff_Roles;
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles;
error: No SQL found in the input string
SELECT COUNT(*) FROM Documents WHERE document_id IN (SELECT document_id FROM Documents_Processes WHERE process_id IN (SELECT process_id FROM Documents_Processes WHERE document_id IN (SELECT document_id FROM Documents WHERE author_name = 'Santina Cronin')) AND process_status_code = 'postpone')
SELECT DISTINCT Documents.Process_id FROM Documents JOIN Documents_Processes ON Documents.Process_id = Documents_Processes.Process_id JOIN Ref_Staff_Roles ON Documents.Process_id = Documents_Processes.Process_id JOIN Staff_in_Processes ON Documents.Process_id = Documents_Processes.Process_id JOIN Ref_Staff_Roles ON Staff_in_Processes.staff_id = Ref_Staff_Roles.staff_role_code WHERE Documents_Processes.process_status_code = 'postpone';
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes)
SELECT DISTINCT Process_id FROM Documents_Processes WHERE document_id IS NULL;
error: No SQL found in the input string
SELECT T1.process_name, T2.process_id, T3.process_outcome_code, T4.process_status_code FROM Documents AS T1 INNER JOIN Documents_Processes AS T2 ON T1.document_id = T2.document_id INNER JOIN Business_Processes AS T3 ON T2.process_id = T3.process_id INNER JOIN Process_Outcomes AS T4 ON T3.process_outcome_code = T4.process_outcome_code INNER JOIN Process_Status AS T5 ON T4.process_status_code = T5.process_status_code WHERE T1.document_name = 'Travel to Brazil'
SELECT process_id, COUNT(*) FROM Documents_Processes GROUP BY process_id;
SELECT COUNT(DISTINCT Documents.Process_id) FROM Documents JOIN Documents_Processes ON Documents.document_id = Documents_Processes.document_id JOIN Staff_in_Processes ON Documents.Process_id = Documents_Processes.Process_id JOIN Staff ON Staff_in_Processes.staff_id = Staff.staff_id WHERE Documents.Process_id = 9 AND Documents.document_id = 0;
SELECT Staff.staff_id, COUNT(DISTINCT Documents.Process_id) AS document_count FROM Documents JOIN Staff_in_Processes ON Documents.Process_id = Documents_Processes.Process_id JOIN Staff ON Documents_staff_id = Staff.staff_id GROUP BY Staff.staff_id;
SELECT Ref_Staff_Roles.staff_role_code, COUNT(DISTINCT Documents.Process_id) AS distinct_process_count FROM Ref_Staff_Roles JOIN Documents ON Ref_Staff_Roles.process_id = Documents.Process_id GROUP BY Ref_Staff_Roles.staff_role_code ORDER BY distinct_process_count DESC;
SELECT COUNT(DISTINCT Ref_Staff_Roles.staff_role_code) FROM Ref_Staff_Roles WHERE staff_role_code IN (SELECT staff_role_code FROM Staff_in_Processes WHERE staff_id = 3);
SELECT count(*) FROM Agencies;
SELECT COUNT(*) FROM Agencies;
SELECT agency_id, agency_details FROM Agencies;
SELECT agency_id, agency_details FROM Agencies;
SELECT COUNT(*) FROM Clients;
SELECT COUNT(client_id) FROM Clients;
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Invoices.meeting_id = Meetings.meeting_id JOIN Payments ON Meetings.meeting_id = Payments.meeting_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id WHERE Payments.payment_details = 'Visa';
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Invoices.meeting_id = Meetings.meeting_id JOIN Payments ON Meetings.meeting_id = Payments.meeting_id WHERE Invoices.meeting_id IS NOT NULL ORDER BY Clients.client_id;
SELECT DISTINCT T1.agency_id, COUNT(T1.client_id) AS num_clients FROM Agencies AS T1 JOIN Invoices AS T2 ON T1.agency_id = T2.agency_id JOIN Clients AS T3 ON T2.client_id = T3.client_id GROUP BY T1.agency_id ORDER BY num_clients DESC;
SELECT Agencies.agency_id, COUNT(DISTINCT Staff_in_Meetings.staff_id) AS num_of_staff FROM Agencies JOIN Staff_in_Meetings ON Agencies.agency_id = Staff_in_Meetings.agency_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id JOIN Meetings ON Staff_in_Meetings.meeting_id = Meetings.meeting_id JOIN Clients ON Meetings.client_id = Clients.client_id GROUP BY Agencies.agency_id
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id, T1.agency_details ORDER BY COUNT(T2.client_id) DESC LIMIT 1;
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.client_id) DESC LIMIT 1;
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id HAVING COUNT(T2.client_id) >= 2
SELECT DISTINCT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.client_id JOIN Invoices AS T3 ON T2.client_id = T3.client_id JOIN Meetings AS T4 ON T3.client_id = T4.client_id JOIN Payments AS T5 ON T4.client_id = T5.client_id JOIN Staff_in_Meetings AS T6 ON T5.client_id = T6.meeting_id WHERE T1.agency_id = (SELECT MAX(agency_id) FROM Agencies) GROUP BY T1.agency_id, T1.agency_details HAVING COUNT(T3.invoice_id) >= 2;
SELECT a.agency_details FROM Agencies a JOIN Clients c ON a.agency_id = c.agency_id JOIN Invoices i ON c.client_id = i.client_id JOIN Meetings m ON i.meeting_id = m.meeting_id JOIN Staff_in_Meetings smi ON m.meeting_id = smi.meeting_id WHERE c.client_details = 'Mac' ORDER BY a.agency_details;
SELECT T1.agency_details FROM Agencies AS T1 INNER JOIN Clients AS T2 ON T1.agency_id = T2.agency_id WHERE T2.detail = 'Mac';
SELECT Clients.client_details, Agencies.agency_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Staff_in_Meetings ON Invoices.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id JOIN Agencies ON Staff.agency_id = Agencies.agency_id
SELECT Clients.client_details, Agencies.agency_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Invoices.meeting_id = Meetings.meeting_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Agencies ON Staff_in_Meetings.agency_id = Agencies.agency_id WHERE Invoices.meeting_outcome = 'Finish';
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT DISTINCT T1.sic_code, COUNT(T2.client_id) AS num_of_clients FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.sic_code
SELECT DISTINCT Clients.client_id, Clients.sic_code FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Invoices.meeting_id = Meetings.meeting_id JOIN Payments ON Meetings.meeting_id = Payments.meeting_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id JOIN Agencies ON Staff.agency_id = Agencies.agency_id WHERE Agencies.agency_details LIKE '%Bad%'
SELECT T2.client_details FROM Clients AS T1 JOIN Staff_in_Meetings AS T2 ON T1.client_id = T2.client_id WHERE T1.sic_code = 'Bad';
error: No SQL found in the input string
SELECT DISTINCT T1.agency_id, T1.agency_details FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id JOIN Meetings AS T3 ON T2.meeting_id = T3.meeting_id JOIN Payments AS T4 ON T3.meeting_id = T4.meeting_id JOIN Staff_in_Meetings AS T5 ON T4.invoice_id = T5.invoice_id JOIN Staff AS T6 ON T5.staff_id = T6.staff_id WHERE T4.purpose_of_meeting IN ('monthly report', 'vote for solutions') ORDER BY T1.agency_id, T1.agency_details ASC
SELECT DISTINCT Agencies.agency_id FROM Agencies
SELECT DISTINCT Agencies.agency_id FROM Agencies WHERE Agencies.agency_id NOT IN (SELECT DISTINCT Staff_in_Meetings.meeting_id FROM Staff_in_Meetings)
SELECT COUNT(*) FROM Invoices
SELECT COUNT(*) FROM Invoices;
SELECT Invoices.invoice_id, Invoices.invoice_status, Invoices.invoice_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id WHERE Invoices.status = 'Finish';
SELECT DISTINCT Invoices.invoice_id, Invoices.invoice_status, Invoices.invoice_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id JOIN Meetings ON Invoices.invoice_id = Meetings.invoice_id JOIN Payments ON Meetings.meeting_id = Payments.meeting_id WHERE Invoices.invoice_status = 'Finish';
SELECT Clients.client_id, COUNT(Invoices.invoice_id) AS invoice_count FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id;
SELECT Clients.client_id, COUNT(Invoices.invoice_id) AS invoice_count FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
SELECT T1.client_id, T1.client_details FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id ORDER BY COUNT(T2.invoice_id) DESC LIMIT 1;
SELECT T1.client_id, T1.client_details FROM Clients AS T1 JOIN Meetings AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT T1.client_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id HAVING COUNT(T2.invoice_id) >= 2;
SELECT DISTINCT Clients.client_id FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id HAVING COUNT(Invoices.invoice_id) > 1;
SELECT DISTINCT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT DISTINCT T2.purpose_of_meeting, COUNT(*) FROM Meetings AS T1 JOIN Invoices AS T2 ON T1.meeting_id = T2.meeting_id JOIN Staff_in_Meetings AS T3 ON T1.meeting_id = T3.meeting_id JOIN Clients AS T4 ON T3.client_id = T4.client_id WHERE T4.sic_code = 'Mutual' GROUP BY T2.purpose_of_meeting;
SELECT T2.invoice_status FROM Invoices AS T1 JOIN Meetings AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T2.invoice_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.invoice_status FROM Invoices AS T1 JOIN Meetings AS T2 ON T1.invoice_id = T2.invoice_id JOIN Staff_in_Meetings AS T3 ON T2.meeting_id = T3.meeting_id JOIN Staff AS T4 ON T3.staff_id = T4.staff_id JOIN Clients AS T5 ON T4.client_id = T5.client_id WHERE T5.agency_id = (SELECT T1.agency_id FROM Invoices AS T1 JOIN Meetings AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T1.invoice_id ORDER BY COUNT(*) DESC LIMIT 1) ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.invoice_status, T1.invoice_details, T2.agency_id, T2.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Agencies AS T3 ON T2.agency_id = T3.agency_id JOIN Staff AS T4 ON T3.agency_id = T4.agency_id JOIN Staff_in_Meetings AS T5 ON T4.staff_id = T5.staff_id JOIN Meetings AS T6 ON T5.meeting_id = T6.meeting_id JOIN Payments AS T7 ON T6.payment_id = T7.payment_id WHERE T1.invoice_status = 'Starting' ORDER BY T1.invoice_id ASC LIMIT 10;
SELECT T1.invoice_status, T1.invoice_details, T1.client_details, T2.agency_details FROM Invoices AS T1 JOIN Meetings AS T2 ON T1.meeting_id = T2.meeting_id JOIN Clients AS T3 ON T1.client_id = T3.client_id JOIN Agencies AS T4 ON T2.agency_id = T4.agency_id WHERE T1.meeting_status = 'Finish' ORDER BY T1.invoice_id;
SELECT DISTINCT T1.meeting_type, T1.meeting_details FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id
SELECT DISTINCT T1.meeting_type, T1.other_details FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id
SELECT T1.meeting_outcome, T1.meeting_type, T1.purpose_of_meeting FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id
error: No SQL found in the input string
SELECT DISTINCT T1.payment_id, T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.status = 'Working'
SELECT DISTINCT T1.payment_id, T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.status = 'Working'
SELECT DISTINCT Invoices.invoice_id, Invoices.invoice_status FROM Invoices WHERE Invoices.invoice_id NOT IN (SELECT DISTINCT payments.invoice_id FROM payments)
SELECT T1.invoice_id, T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.payment_id IS NULL
SELECT COUNT(*) FROM Payments
SELECT COUNT(*) FROM Payments
error: No SQL found in the input string
SELECT T1.payment_id, T1.invoice_id, T1.payment_details FROM Payments AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id = T2.staff_id JOIN Meetings AS T3 ON T2.meeting_id = T3.meeting_id WHERE T3.purpose_of_meeting IN ('monthly report', 'vote for solutions')
SELECT DISTINCT T1.invoice_id, T1.invoice_status FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.invoice_status = ( SELECT MIN(T2.invoice_status) FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id )
SELECT DISTINCT T1.invoice_id, T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T1.invoice_id, T1.payment_details
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS number_of_payments FROM Invoices JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
SELECT T2.payment_id, COUNT(T1.invoice_id) AS payment_count FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T2.payment_id HAVING payment_count > 1
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.purpose_of_meeting = 'monthly report' ORDER BY T2.payment_details DESC LIMIT 1;
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.payment_id IN ( SELECT payment_id FROM Payments GROUP BY payment_id ORDER BY COUNT(payment_id) DESC LIMIT 1 )
error: No SQL found in the input string
SELECT COUNT(DISTINCT Staff_id) AS Staff_Count FROM Staff_in_Meetings
SELECT T1.agency_id, COUNT(T2.staff_id) AS staff_count FROM Agencies AS T1 JOIN Staff_in_Meetings AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id
SELECT DISTINCT T1.agency_id, COUNT(T2.staff_id) AS staff_count FROM Agencies AS T1 JOIN Staff_in_Meetings AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id = T2.agency_id JOIN Clients AS T3 ON T2.client_id = T3.client_id JOIN Invoices AS T4 ON T3.client_id = T4.client_id JOIN Meetings AS T5 ON T4.client_id = T5.client_id JOIN Payments AS T6 ON T5.client_id = T6.client_id JOIN Staff_in_Meetings AS T7 ON T6.invoice_id = T7.meeting_id WHERE T7.staff_id IS NOT NULL ORDER BY COUNT(T2.staff_id) DESC LIMIT 1;
SELECT DISTINCT T1.agency_id, T2.staff_details FROM Agencies AS T1 JOIN Staff_in_Meetings AS T2 ON T1.agency_id = T2.agency_id WHERE T2.staff_id IN ( SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT T1.meeting_outcome, COUNT(*) FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id GROUP BY T1.meeting_outcome
SELECT T1.meeting_outcome, COUNT(T1.meeting_id) FROM Meetings AS T1 JOIN Invoices AS T2 ON T1.meeting_id = T2.meeting_id JOIN Staff_in_Meetings AS T3 ON T1.meeting_id = T3.meeting_id JOIN Staff AS T4 ON T3.staff_id = T4.staff_id WHERE T4.client_id = (SELECT T2.client_id FROM Invoices AS T2 JOIN Meetings AS T1 ON T2.meeting_id = T1.meeting_id WHERE T1.meeting_id = T2.meeting_id) GROUP BY T1.meeting_outcome
SELECT Clients.client_id, COUNT(Meetings.meeting_id) AS meeting_count FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Invoices.meeting_id = Meetings.meeting_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id GROUP BY Clients.client_id
SELECT C.client_id, COUNT(T2.meeting_id) AS meeting_count FROM Clients AS C JOIN Invoices AS I ON C.client_id = I.client_id JOIN Meetings AS M ON I.meeting_id = M.meeting_id JOIN Staff_in_Meetings AS SMI ON M.meeting_id = SMI.meeting_id GROUP BY C.client_id
SELECT T1.meeting_type, COUNT(*) FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id GROUP BY T1.meeting_type
SELECT Meetings.meeting_type, COUNT(Meetings.meeting_id) AS meeting_count FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id GROUP BY Meetings.meeting_type ORDER BY meeting_count DESC;
SELECT T1.meeting_id, T1.meeting_outcome, T1.meeting_type, T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id WHERE T1.meeting_id IN (SELECT T3.meeting_id FROM Staff_in_Meetings AS T3 WHERE T3.staff_id IN (SELECT T1.staff_id FROM Staff_in_Meetings AS T1 WHERE T1.meeting_id IN (SELECT T2.meeting_id FROM Meetings AS T2 WHERE T2.client_id = T1.client_id)))
SELECT T1.meeting_id, T2.meeting_outcome, T3.meeting_type, T4.client_details FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id JOIN Clients AS T4 ON T1.client_id = T4.client_id JOIN Invoices AS T3 ON T1.meeting_id = T3.meeting_id JOIN Payments AS T5 ON T1.meeting_id = T5.meeting_id WHERE T2.meeting_id IS NOT NULL ORDER BY T1.meeting_id;
SELECT Meetings.meeting_id, COUNT(DISTINCT Staff_in_Meetings.staff_id) AS num_of_staff FROM Meetings JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id GROUP BY Meetings.meeting_id
SELECT T1.meeting_id, COUNT(T2.staff_id) AS staff_count FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id GROUP BY T1.meeting_id
SELECT Staff_in_Meetings.`staff_id`, COUNT(Meetings.meeting_id) FROM Staff_in_Meetings JOIN Meetings ON Staff_in_Meetings.meeting_id = Meetings.meeting_id WHERE Meetings.meeting_id IN ( SELECT MIN(Meeting_id) FROM Meetings GROUP BY Meeting_id HAVING COUNT(Meeting_id) = ( SELECT MIN(Meeting_id) FROM Meetings GROUP BY Meeting_id ) ) GROUP BY Staff_in_Meetings.`staff_id` HAVING COUNT(Meetings.meeting_id) > 1
SELECT Staff.id FROM Staff JOIN Staff_in_Meetings ON Staff.id = Staff_in_Meetings.staff_id WHERE Staff_in_Meetings.meeting_id IN ( SELECT MIN(meeting_id) FROM Meetings GROUP BY meeting_id );
SELECT COUNT(DISTINCT Staff_in_Meetings.staff_id) AS num_staff_attended FROM Staff_in_Meetings JOIN Meetings ON Staff_in_Meetings.meeting_id = Meetings.meeting_id JOIN Clients ON Meetings.client_id = Clients.client_id WHERE Meetings.meeting_type = 'Team'
SELECT COUNT(DISTINCT Staff_in_Meetings.staff_id) AS distinct_staff_count FROM Staff_in_Meetings JOIN Meetings ON Staff_in_Meetings.meeting_id = Meetings.meeting_id JOIN Clients ON Meetings.client_id = Clients.client_id WHERE Meetings.meeting_type = 'Company'
SELECT COUNT(DISTINCT Staff_in_Meetings.staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT Staff_in_Meetings.staff_id) AS staff_count FROM Staff_in_Meetings WHERE Staff_in_Meetings.meeting_id IS NULL;
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Invoices.meeting_id = Meetings.meeting_id JOIN Payments ON Meetings.meeting_id = Payments.meeting_id WHERE Payments.payment_id IS NOT NULL;
SELECT T1.client_id, T1.client_details FROM Clients AS T1 JOIN Meetings AS T2 ON T1.client_id = T2.client_id WHERE T2.meeting_id IS NOT NULL OR T2.meeting_type = 'Meeting'
error: No SQL found in the input string
SELECT T2.staff_id, T2.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id = T2.staff_id JOIN Meetings AS T3 ON T2.meeting_id = T3.meeting_id WHERE T3.meeting_type = 'Group' AND T1.s in ('Sergeant', 'Staff')
SELECT T1.client_id, T1.sic_code, T1.agency_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id JOIN Meetings AS T3 ON T1.client_id = T3.client_id JOIN Staff_in_Meetings AS T4 ON T3.meeting_id = T4.meeting_id WHERE T4.meeting_id = (SELECT meeting_id FROM Meetings WHERE purpose_of_meeting = 'Summary') GROUP BY T1.client_id, T1.sic_code, T1.agency_id HAVING COUNT(T2.invoice_id) > 0;
SELECT T1.client_id, T1.sic_code, T1.agency_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id JOIN Meetings AS T3 ON T1.client_id = T3.client_id JOIN Staff_in_Meetings AS T4 ON T3.meeting_id = T4.meeting_id JOIN Staff AS T5 ON T4.staff_id = T5.staff_id WHERE T4.meeting_id = (SELECT meeting_id FROM Meetings WHERE purpose_of_meeting = 'Finish') GROUP BY T1.client_id, T1.sic_code, T1.agency_id HAVING COUNT(T2.invoice_id) = 1;
SELECT T1.start_date_time, T1.end_date_time, T2.client_details, T3.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Staff_in_Meetings AS T3 ON T1.meeting_id = T3.meeting_id ORDER BY T1.start_date_time;
SELECT T1.start_date_time, T1.end_date_time, T2.client_details, T2.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id WHERE T1.meeting_type = 'Team' ORDER BY T1.start_date_time;
