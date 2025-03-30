SELECT COUNT(*) FROM club
SELECT Player_ID, Name, Country, Earnings, Events_number, Wins_count, Club_ID FROM player;
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC;
SELECT Manager, Captain FROM club
SELECT club.Name, club.Manager, club.Captain FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings = (SELECT MAX(Earnings) FROM player)
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT `Name` FROM player ORDER BY `Wins_count` ASC
SELECT p.Name, p.Country, p.Earnings, p.Wins_count FROM player p JOIN club c ON p.Club_ID = c.Club_ID ORDER BY p.Wins_count ASC;
error: No SQL found in the input string
SELECT `Name` FROM `player` WHERE `Earnings` = (SELECT MAX(`Earnings`) FROM `player`);
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000;
SELECT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player WHERE Wins_count > 2)
SELECT `Country`, COUNT(*) as `Number_of_Wins` FROM `player` WHERE `Wins_count` > 2 GROUP BY `Club_ID` ORDER BY `Number_of_Wins` DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT T1.`Name` FROM club AS T1 JOIN player AS T2 ON T1.`Club_ID` = T2.`Club_ID` WHERE T2.`Wins_count` > 2
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT `Name` FROM `player` WHERE `Club_ID` IN (SELECT `Club_ID` FROM `club` WHERE `Manager` = 'Sam Allardyce')
SELECT `Name` FROM player WHERE `Club_ID` IN (SELECT `Club_ID` FROM club WHERE `Manager` = 'Sam Allardyce');
SELECT `Name`, AVG(`Earnings`) as `Average_Earnings` FROM `club` JOIN `player` ON `club`.`Club_ID` = `player`.`Club_ID` GROUP BY `Name` ORDER BY `Average_Earnings` DESC
SELECT T1.`Name`, AVG(T2.`Earnings`) as `Average_Earnings` FROM club as T1 JOIN player as T2 ON T1.`Club_ID` = T2.`Club_ID` GROUP BY T1.`Club_ID` ORDER BY AVG(T2.`Earnings`) DESC
SELECT `Manufacturer`, COUNT(*) FROM club GROUP BY `Manufacturer`
SELECT `Manufacturer`, COUNT(*) as `Number_of_Clubs` FROM club JOIN player ON club.`Club_ID` = player.`Club_ID` GROUP BY `Manufacturer`
SELECT `Manufacturer`, COUNT(*) as `Count` FROM `club` GROUP BY `Manufacturer` ORDER BY `Count` DESC LIMIT 1
error: No SQL found in the input string
SELECT `Manufacturer`, COUNT(*) as `Number_of_Clubs` FROM club GROUP BY `Manufacturer` HAVING COUNT(*) > 1
SELECT `Manufacturer`, COUNT(*) as `Number_of_Clubs` FROM club GROUP BY `Manufacturer` HAVING COUNT(*) > 1
SELECT `Country`, COUNT(*) as `Number_of_Players` FROM `player` GROUP BY `Country` HAVING COUNT(*) > 1
SELECT Country, COUNT(*) as Number_of_Players FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT `Name` FROM club WHERE `Club_ID` NOT IN (SELECT DISTINCT `Club_ID` FROM `player`)
SELECT T1.`Name` FROM club AS T1 LEFT JOIN player AS T2 ON T1.`Club_ID` = T2.`Club_ID` WHERE T2.`Club_ID` IS NULL
SELECT p.Name, p.Country, p.Earnings, p.Events_number, p.Wins_count, c.Name AS Club_Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE p.Earnings > 1400000 AND p.Earnings < 1100000 ORDER BY p.Earnings DESC;
SELECT club.Name FROM club WHERE club.Club_ID IN ( SELECT player.Club_ID FROM player WHERE player.Earnings > 1400000 ) AND club.Club_ID IN ( SELECT player.Club_ID FROM player WHERE player.Earnings < 1100000 )
SELECT COUNT(DISTINCT Country) as NumberOfDistinctCountries FROM player;
SELECT COUNT(DISTINCT Country) as Number_of_Countries FROM player
SELECT `Earnings` FROM `player` WHERE `Country` = 'Australia' OR `Country` = 'Zimbabwe'
SELECT `Earnings` FROM `player` WHERE `Country` = 'Australia' OR `Country` = 'Zimbabwe';
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C INNER JOIN Orders O ON C.customer_id = O.customer_id INNER JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(O) > 2 AND COUNT(OI) >= 3
error: No SQL found in the input string
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) as product_count FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code;
SELECT Orders.order_id, COUNT(Order_Items.product_id) as product_count, Orders.order_status_code FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code;
SELECT `date_order_placed` FROM `Orders` WHERE `order_id` IN ( SELECT `order_id` FROM `Order_Items` GROUP BY `order_id` HAVING COUNT(`order_item_id`) > 1 ) ORDER BY `date_order_placed` ASC LIMIT 1;
SELECT date_order_placed as Order_Date FROM Orders WHERE (SELECT COUNT(order_id) FROM Order_Items WHERE Order_Items.order_id = Orders.order_id) > 1;
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.customer_id IS NULL
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.customer_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id HAVING COUNT(DISTINCT Order_Items.order_id) >= 2
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id LEFT JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.order_id IS NULL GROUP BY Products.product_id HAVING COUNT(Orders.order_id) < 2;
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING COUNT(DISTINCT Order_Items.product_id) >= 2;
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id ORDER BY COUNT(Order_Items.order_item_id) DESC LIMIT 1;
SELECT Products.product_id, Products.product_name, Products.product_price FROM ( SELECT Order_Items.product_id, COUNT(Order_Items.product_id) as product_count FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Order_Items.product_id ORDER BY product_count DESC LIMIT 10 ) as TopProducts INNER JOIN Products ON TopProducts.product_id = Products.product_id
SELECT Orders.order_id, SUM(Products.product_price) as sum_of_prices FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY sum_of_prices ASC LIMIT 1;
SELECT total_cost FROM ( SELECT Orders.order_id, SUM(Products.product_price) as total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY total_cost ASC LIMIT 1 ) as least_expensive_order;
SELECT `payment_method_code`, COUNT(*) as `count` FROM `Customer_Payment_Methods` GROUP BY `payment_method_code` ORDER BY `count` DESC LIMIT 1;
SELECT CP.payment_method_code, COUNT(C.customer_id) AS customer_count FROM Customer_Payment_Methods CP JOIN Customers C ON CP.customer_id = C.customer_id GROUP BY CP.payment_method_code ORDER BY customer_count DESC LIMIT 1;
SELECT gender_code, COUNT(DISTINCT product_id) as number_of_products FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY gender_code;
SELECT gender_code, COUNT(*) as number_of_products FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY gender_code;
SELECT gender_code, COUNT(*) as number_of_orders FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code;
SELECT gender_code, COUNT(*) AS number_of_orders FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY gender_code;
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id;
error: No SQL found in the input string
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number;
SELECT Customers.customer_id, Customers.login_name, Customers.login_password, Customers.phone_number, Customers.address_line_1, Customers.town_city, Customers.county, Customers.country, Customer_Payment_Methods.payment_method_code, Invoices.invoice_number, Invoices.invoice_status_code, Invoices.invoice_date, Orders.order_id, Orders.order_status_code, Orders.date_order_placed, Order_Items.product_id, Order_Items.order_item_status_code, Shipments.shipment_id, Shipments.shipment_tracking_number, Shipments.shipment_date FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Invoices ON Orders.order_id = Invoices.invoice_number JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id;
SELECT Products.product_name, Shipments.shipment_date FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipments.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id ORDER BY Products.product_name;
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Shipment_Items ON Products.product_id = Shipment_Items.product_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id WHERE Shipments.shipment_id IN ( SELECT Shipment_Items.shipment_id FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.customer_id = ( SELECT customer_id FROM Customers WHERE email_address = 'melody.schuppe@example.org' ) );
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Order_Items.order_item_status_code = 'Delivered' AND Shipments.invoice_number IS NOT NULL;
SELECT Order_Items.order_item_status_code, Shipment_Items.order_item_id, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_id = Shipment_Items.order_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id WHERE Order_Items.order_item_status_code = 'Delivered' AND Shipments.shipment_status_code = 'Delivered' AND Shipment_Items.order_item_id IN ( SELECT order_item_id FROM Order_Items JOIN Shipment_Items ON Order_Items.order_id = Shipment_Items.order_id WHERE order_item_status_code = 'Delivered' );
SELECT Products.product_name, Customers.product_color FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Shipments ON Orders.order_id = Shipments.order_id INNER JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id INNER JOIN Order_Items AS Order_Items_Ship ON Order_Items_Ship.order_item_id = Shipment_Items.order_item_id WHERE Order_Items_Ship.order_item_status_code = 'Delivered' AND Shipments.invoice_number IS NOT NULL;
SELECT Products.product_name, Products.product_color FROM Products JOIN Shipment_Items ON Products.product_id = Shipment_Items.product_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id WHERE Shipments.shipment_tracking_number IS NOT NULL;
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Products.product_id IN ( SELECT product_id FROM Order_Items WHERE order_item_status_code = 'Delivered' ) AND Customers.gender_code = 'Female';
SELECT Products.product_name, Products.product_price, Products.product_description FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'Female'
SELECT Orders.order_id, Invoices.invoice_status_code FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Invoices ON Customer_Payment_Methods.customer_id = Invoices.customer_id WHERE Invoices.invoice_status_code = 'Paid' AND Orders.order_status_code != 'Delivered'
error: No SQL found in the input string
SELECT Orders.order_id, Orders.date_order_placed, SUM(Order_Items.product_price * Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed;
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price * Order_Items.quantity) as total_amount_paid FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Orders.order_id;
SELECT COUNT(DISTINCT Orders.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id;
SELECT COUNT(DISTINCT Customers.customer_id) AS NumberOfCustomers FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id;
SELECT COUNT(DISTINCT order_item_status_code) AS number_of_item_states_in_orders FROM Order_Items;
SELECT COUNT(DISTINCT `order_item_status_code`) FROM `Order_Items`
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) AS num_payment_methods FROM Customer_Payment_Methods;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Products.product_name LIKE '%Dell%' GROUP BY Products.product_size;
SELECT Products.product_price, Products.product_size FROM Products JOIN ( SELECT product_id, AVG(product_price) as avg_price FROM Products GROUP BY product_id ) as AvgPrice ON Products.product_id = AvgPrice.product_id WHERE Products.product_price > AvgPrice.avg_price
WITH MeanPrice AS ( SELECT AVG(product_price) AS MeanPrice FROM Products ) SELECT product_name, product_price, product_size FROM Products, MeanPrice WHERE product_price > MeanPrice
SELECT COUNT(DISTINCT product_id) AS number_of_unique_products FROM Order_Items WHERE order_item_status_code = 'Out of Stock';
SELECT COUNT(*) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_status_code = 'Out of Stock';
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL;
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders;
SELECT Orders.order_status_code, Orders.date_order_placed, Order_Items.product_id, Products.product_name, Products.product_price FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT `address_line_1`, `town_city`, `county` FROM Customers WHERE `country` = 'USA'
error: No SQL found in the input string
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Customers.customer_first_name, GROUP_CONCAT(Products.product_name) AS products_bought FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customers.customer_first_name;
SELECT COUNT(*) FROM Shipment_Items;
SELECT COUNT(*) FROM Shipment_Items;
SELECT AVG(product_price) as average_price FROM Products
SELECT AVG(product_price) as average_price FROM Products;
SELECT AVG(P.product_price) AS average_price FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id;
SELECT AVG(total_cost) / COUNT(*) as average_cost_per_order FROM ( SELECT Order_Items.product_id, SUM(Products.product_price) as total_cost FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.product_id ) as subquery
error: No SQL found in the input string
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Orders.date_order_placed FROM Orders JOIN Customer_Payment_Methods ON Orders.customer_id = Customer_Payment_Methods.customer_id GROUP BY Orders.date_order_placed HAVING COUNT(Customer_Payment_Methods.payment_method_code) >= 2
error: No SQL found in the input string
SELECT order_status_code, COUNT(*) as count FROM Orders GROUP BY order_status_code ORDER BY count LIMIT 1;
SELECT MIN(order_status_code) as least_common_order_status FROM Orders
SELECT product_id, product_name, product_description FROM Products WHERE product_id IN ( SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(product_id) > 3 )
SELECT Products.product_id, Products.product_name, Products.product_description, COUNT(*) as sold_count FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Products.product_id HAVING COUNT(*) > 3;
SELECT Invoices.invoice_date, Invoices.invoice_number FROM Invoices JOIN Shipment_Items ON Invoices.invoice_number = Shipment_Items.invoice_number JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id GROUP BY Invoices.invoice_number HAVING COUNT(*) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date, Shipment_Items.shipment_id FROM Invoices JOIN Shipment_Items ON Invoices.invoice_number = Shipment_Items.shipment_id GROUP BY Invoices.invoice_number HAVING COUNT(DISTINCT Shipment_Items.shipment_id) >= 2;
SELECT `Shipment_tracking_number`, `Shipment_date` FROM `Shipments`
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id;
SELECT Products.product_color, Products.product_description, Products.product_size FROM Products JOIN ( SELECT MAX(product_price) as max_price FROM Products ) as max_price_table ON Products.product_price = max_price_table.max_price
SELECT Products.product_color, Products.product_description, Products.product_size FROM Products INNER JOIN (SELECT product_id, MAX(product_price) as max_price FROM Products GROUP BY product_id) as MaxPrice ON Products.product_id = MaxPrice.product_id WHERE Products.product_price < MaxPrice.max_price
SELECT `Name` FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc.co.uk%'
SELECT COUNT(DISTINCT `Digital_terrestrial_channel`) FROM channel
SELECT Title, Start_Year FROM program ORDER BY Start_Year DESC
error: No SQL found in the input string
SELECT `Name`, `Age` FROM director WHERE `Director_ID` IN ( SELECT `Director_ID` FROM director_admin WHERE `Is_first_director` = 'T' ) ORDER BY `Age` DESC LIMIT 1;
SELECT `Title` FROM `program` WHERE `Start_Year` = (SELECT MIN(`Start_Year`) FROM `program`)
SELECT `Name`, `Internet` FROM channel WHERE `Channel_ID` IN ( SELECT `Channel_ID` FROM ( SELECT `Channel_ID`, COUNT(*) as program_count FROM program GROUP BY `Channel_ID` ) as subquery WHERE program_count > 1 )
SELECT channel.Name, COUNT(*) as NumberOfPrograms FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Name
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
error: No SQL found in the input string
SELECT `Name`, `Internet` FROM channel WHERE `Channel_ID` = ( SELECT `Channel_ID` FROM ( SELECT `Channel_ID`, COUNT(`Director_ID`) as `director_count`, ROW_NUMBER() OVER (ORDER BY COUNT(`Director_ID`) DESC) as `row_num` FROM `director_admin` GROUP BY `Channel_ID` ) AS subquery WHERE `row_num` = 1 )
SELECT d.Name FROM director d WHERE d.Age BETWEEN 30 AND 60;
SELECT DISTINCT channel.Name FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program WHERE program.Start_Year = ( SELECT MIN(program.Start_Year) FROM program ) ) AND channel.Channel_ID IN ( SELECT director_admin.Channel_ID FROM director_admin WHERE director_admin.Is_first_director = 'F' AND director_admin.Director_ID IN ( SELECT director.Director_ID FROM director WHERE director.Age > ( SELECT MAX(director.Age) FROM director WHERE director.Director_ID IN ( SELECT director_admin.Director_ID FROM director_admin WHERE director_admin.Is_first_director = 'T' ) ) ) );
SELECT `Channel_ID`, `Name` FROM `channel` WHERE `Channel_ID` NOT IN ( SELECT `Channel_ID` FROM `director_admin` WHERE `Director_ID` = ( SELECT `Director_ID` FROM `director` WHERE `Name` = 'Hank Baskett' ) )
error: No SQL found in the input string
SELECT `Transmitter`, `ERP_kW` FROM `radio` ORDER BY `ERP_kW` ASC
SELECT `tv_show_name`, `Original_Airdate` FROM `tv_show`
SELECT `Station_name` FROM `city_channel` WHERE `Affiliation` <> 'ABC'
SELECT `Transmitter` FROM `radio` WHERE `ERP_kW` > 150 OR `ERP_kW` < 30
SELECT `Transmitter` FROM `radio` WHERE `ERP_kW` = (SELECT MAX(`ERP_kW`) FROM `radio`)
SELECT AVG(ERP_kW) as Average_ERP FROM radio
SELECT city_channel.City, COUNT(city_channel_radio.Radio_ID) as Radio_Count FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY city_channel.City
SELECT Affiliation, COUNT(*) as count FROM city_channel GROUP BY Affiliation ORDER BY count DESC LIMIT 1
SELECT `Affiliation`, COUNT(*) as `Number_of_Shares` FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY `Affiliation` HAVING COUNT(*) > 3
SELECT c.City, ct.Station_name FROM city_channel c JOIN city_channel_tv_show ct ON c.ID = ct.City_channel_ID ORDER BY ct.Station_name ASC;
SELECT `Transmitter`, `City` FROM `city_channel_radio` JOIN `city_channel` ON `city_channel_radio`.`City_channel_ID` = `city_channel`.`ID` JOIN `radio` ON `city_channel_radio`.`Radio_ID` = `radio`.`Radio_ID`
SELECT `Transmitter`, `Station_name` FROM `radio` JOIN `city_channel_radio` ON `radio`.`Radio_ID` = `city_channel_radio`.`Radio_ID` JOIN `city_channel` ON `city_channel_radio`.`City_channel_ID` = `city_channel`.`ID` JOIN `city_channel_tv_show` ON `city_channel`.`ID` = `city_channel_tv_show`.`City_channel_ID` JOIN `tv_show` ON `city_channel_tv_show`.`tv_show_ID` = `tv_show`.`tv_show_ID` ORDER BY `ERP_kW` DESC
SELECT T1.`Transmitter`, COUNT(*) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.`Radio_ID` = T2.`Radio_ID` GROUP BY T1.`Radio_ID`
SELECT DISTINCT `Transmitter` FROM `radio` WHERE `Radio_ID` NOT IN ( SELECT `Radio_ID` FROM `city_channel_radio` )
SELECT `Model` FROM vehicle WHERE `Top_Speed` = (SELECT MAX(`Top_Speed`) FROM vehicle WHERE `Power` > 6000)
SELECT `Model`, `Top_Speed` FROM `vehicle` WHERE `Power` > 6000 ORDER BY `Top_Speed` DESC LIMIT 1
SELECT D.Name FROM driver AS D WHERE D.Citizenship = 'United States'
SELECT `Name` FROM driver WHERE `Citizenship` = 'United States'
SELECT COUNT(*) as num_vehicles, Driver_ID FROM vehicle_driver GROUP BY Driver_ID ORDER BY num_vehicles DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) as Number_of_Vehicles FROM vehicle_driver GROUP BY Driver_ID ORDER BY Number_of_Vehicles DESC LIMIT 1
SELECT MAX(Power) as Maximum_Power, AVG(Power) as Average_Power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS Maximum_Power, AVG(Power) AS Average_Power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1;
SELECT Vehicle_ID FROM ( SELECT Vehicle_ID, COUNT(*) as count FROM vehicle_driver GROUP BY Vehicle_ID ) as subquery WHERE count = ( SELECT MIN(count) FROM ( SELECT COUNT(*) as count FROM vehicle_driver GROUP BY Vehicle_ID ) as subquery2 )
SELECT `Top_Speed`, `Power` FROM vehicle WHERE `Build_Year` = '2006–2010'
SELECT `Top_Speed`, `Power` FROM vehicle WHERE `Build_Year` = '2012'
SELECT `Build_Year`, `Model`, `Builder` FROM vehicle
SELECT `Build_Year`, `Model`, `Builder` FROM `vehicle`
SELECT COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT VD.`Driver_ID`) FROM vehicle_driver AS VD JOIN vehicle AS V ON VD.`Vehicle_ID` = V.`Vehicle_ID` WHERE V.`Build_Year` = '2012'
SELECT COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = 'Zhuzhou' AND vehicle.Total_Production = '1' AND driver.Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT SUM(Top_Speed) / COUNT(*) AS Average_Top_Speed FROM vehicle
SELECT AVG(T1.`Top_Speed`) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.`Vehicle_ID` = T2.`Vehicle_ID`
SELECT DISTINCT Name FROM driver WHERE Driver_ID IN ( SELECT Driver_ID FROM vehicle_driver WHERE Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle WHERE Power > 5000 ) )
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Model, Total_Production FROM vehicle WHERE Total_Production > 100 AND Top_Speed > 150
SELECT `Model` FROM vehicle WHERE `Total_Production` > 100 OR `Top_Speed` > 150;
SELECT `Model`, `Build_Year` FROM vehicle WHERE `Model` LIKE '%DJ%'
SELECT `Model`, `Build_Year` FROM `vehicle` WHERE `Model` LIKE '%DJ%'
SELECT V.Model FROM vehicle AS V WHERE V.Model NOT IN (SELECT VD.Vehicle_ID FROM vehicle_driver AS VD)
SELECT `Model` FROM vehicle WHERE `Vehicle_ID` NOT IN (SELECT `Vehicle_ID` FROM vehicle_driver)
SELECT V.`Vehicle_ID`, V.`Model` FROM vehicle AS V WHERE V.`Vehicle_ID` IN ( SELECT VD.`Vehicle_ID` FROM vehicle_driver AS VD GROUP BY VD.`Vehicle_ID` HAVING COUNT(*) = 2 ) AND V.`Builder` = 'Ziyang';
SELECT V.`Vehicle_ID`, V.`Model` FROM vehicle AS V JOIN ( SELECT VD.`Vehicle_ID` FROM vehicle_driver AS VD GROUP BY VD.`Vehicle_ID` HAVING COUNT(*) = 2 ) AS TwoDrivers ON V.`Vehicle_ID` = TwoDrivers.`Vehicle_ID` JOIN ( SELECT V.`Builder` FROM vehicle AS V GROUP BY V.`Builder` HAVING COUNT(*) = 1 ) AS ZiyangBuilders ON V.`Builder` = ZiyangBuilders.`Builder`
SELECT V.Vehicle_ID, V.Model FROM vehicle V JOIN vehicle_driver VD ON V.Vehicle_ID = VD.Vehicle_ID WHERE VD.Driver_ID IN ( SELECT D.Driver_ID FROM driver D WHERE D.Name = 'Jeff Gordon' ) GROUP BY V.Vehicle_ID, V.Model HAVING COUNT(*) > 2;
SELECT V.`Vehicle_ID`, V.`Model` FROM vehicle AS V JOIN ( SELECT VD.`Vehicle_ID` FROM vehicle_driver AS VD GROUP BY VD.`Vehicle_ID` HAVING COUNT(*) > 2 ) AS VH ON V.`Vehicle_ID` = VH.`Vehicle_ID` UNION SELECT V.`Vehicle_ID`, V.`Model` FROM vehicle AS V JOIN ( SELECT VD.`Vehicle_ID` FROM vehicle_driver AS VD JOIN driver AS D ON VD.`Driver_ID` = D.`Driver_ID` WHERE D.`Name` = 'Jeff Gordon' ) AS VH ON V.`Vehicle_ID` = VH.`Vehicle_ID`
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC;
SELECT `Racing_Series`, COUNT(*) FROM driver GROUP BY `Racing_Series`
SELECT `Racing_Series`, COUNT(*) as `Number_of_Drivers` FROM driver GROUP BY `Racing_Series`
SELECT `Name`, `Citizenship` FROM driver WHERE `Driver_ID` IN ( SELECT `Driver_ID` FROM vehicle_driver WHERE `Vehicle_ID` IN ( SELECT `Vehicle_ID` FROM vehicle WHERE `Model` = 'DJ1' ) );
SELECT `Name`, `Citizenship` FROM driver WHERE `Driver_ID` IN ( SELECT `Driver_ID` FROM vehicle_driver WHERE `Vehicle_ID` IN ( SELECT `Vehicle_ID` FROM vehicle WHERE `Model` = 'DJ1' ) );
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
error: No SQL found in the input string
SELECT COUNT(*) FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name NOT LIKE '%Database%'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database'
SELECT Date_of_Answer FROM Student_Answers WHERE Exam_ID IN ( SELECT Exam_ID FROM Questions_in_Exams WHERE Question_ID IN ( SELECT Question_ID FROM Questions WHERE Question_Text LIKE '%data%' ) ) ORDER BY Date_of_Answer DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Q.`Type_of_Question_Code`, COUNT(*) as `Count` FROM Questions Q JOIN Questions_in_Exams QIE ON Q.`Question_ID` = QIE.`Question_ID` GROUP BY Q.`Type_of_Question_Code`;
SELECT `Type_of_Question_Code`, COUNT(`Question_ID`) FROM Questions GROUP BY `Type_of_Question_Code`
SELECT DISTINCT `Student_Answer_Text` FROM `Student_Assessments` WHERE `Comment` = 'Normal'
SELECT DISTINCT `Student_Answer_Text` FROM `Student_Assessments` WHERE `Assessment` = 'Excellent';
SELECT COUNT(DISTINCT `Comments`) AS `Number_of_Comments` FROM `Student_Answers`
SELECT COUNT(DISTINCT `Comments`) FROM `Student_Answers`
SELECT `Student_Answer_Text`, COUNT(*) as `Count` FROM `Student_Answers` GROUP BY `Student_Answer_Text` ORDER BY `Count` DESC
SELECT Student_Answers.Student_Answer_Text, COUNT(*) as Frequency FROM Student_Answers JOIN Valid_Answers ON Student_Answers.Student_ID = Valid_Answers.Question_ID GROUP BY Student_Answers.Student_Answer_Text ORDER BY Frequency DESC;
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Student_Answers.Satisfactory_YN = '1'
SELECT S.First_Name, SA.Date_of_Answer FROM Students AS S JOIN Student_Answers AS SA ON S.Student_ID = SA.Student_ID WHERE SA.Satisfactory_YN = '1'
SELECT S.Email_Adress, SA.Date_of_Answer FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID ORDER BY SA.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Student_Answers.Satisfactory_YN = '1' ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Valid_Answers.Valid_Answer_Text, COUNT(Student_Assessments.Valid_Answer_ID) AS Count FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID GROUP BY Student_Assessments.Valid_Answer_ID ORDER BY Count LIMIT 1;
SELECT Valid_Answers.Valid_Answer_Text, COUNT(*) AS Frequency FROM Valid_Answers JOIN Student_Assessments ON Valid_Answers.Valid_Answer_ID = Student_Assessments.Valid_Answer_ID GROUP BY Valid_Answers.Valid_Answer_ID ORDER BY Frequency ASC LIMIT 1;
SELECT S.First_Name FROM Students AS S WHERE ( SELECT COUNT(*) FROM Student_Answers AS SA WHERE S.Student_ID = SA.Student_ID GROUP BY SA.Student_ID ) >= 2
SELECT S.First_Name FROM Students S WHERE ( SELECT COUNT(*) FROM Student_Answers SA WHERE SA.Student_ID = S.Student_ID GROUP BY SA.Question_ID ) >= 2
SELECT Valid_Answer_Text, COUNT(*) as Count FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY Count DESC LIMIT 1;
SELECT Valid_Answer_Text, COUNT(*) as Frequency FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Assessment = 'Excellent' GROUP BY Valid_Answer_Text ORDER BY Frequency DESC LIMIT 1;
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Gender_MFU, COUNT(*) as Number_of_Students FROM Students GROUP BY Gender_MFU;
SELECT Gender_MFU, COUNT(*) FROM Students WHERE Gender_MFU IN ('U', 'M', 'F') GROUP BY Gender_MFU;
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('M', 'F');
SELECT Last_Name FROM Students WHERE Gender_MFU = 'F' OR Gender_MFU = 'M';
SELECT S.First_Name FROM Students AS S WHERE S.Student_ID NOT IN ( SELECT SA.Student_ID FROM Student_Answers AS SA WHERE SA.Student_Answer_ID IS NOT NULL )
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Student_Answers.Student_ID IS NULL GROUP BY Students.Student_ID;
SELECT `Student_Answer_Text` FROM `Student_Answers` WHERE `Comments` = 'Normal' AND `Comments` = 'Absent'
SELECT S.First_Name, S.Last_Name, SA.Student_Answer_Text FROM Students S JOIN Student_Assessments SA ON S.Student_ID = SA.Student_Answer_ID JOIN Valid_Answers VA ON SA.Valid_Answer_ID = VA.Valid_Answer_ID WHERE VA.Comments = 'Normal' AND VA.Comments = 'Absent'
error: No SQL found in the input string
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) > 3
SELECT First_Name, Last_Name FROM Students;
SELECT * FROM Students;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `address_id`, `address_details` FROM `Addresses`
SELECT address_id, address_details FROM Addresses;
error: No SQL found in the input string
CREATE TABLE stadium ( stadium_id INTEGER PRIMARY KEY, stadium_name TEXT );
SELECT Products.product_id, Products.product_type_code, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id
SELECT product_id, product_type_code, product_name FROM Products
error: No SQL found in the input string
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT MIN(product_price) AS Minimum_Price, AVG(product_price) AS Average_Price, MAX(product_price) AS Maximum_Price FROM Products
SELECT MIN(product_price) AS Minimum_Price, AVG(product_price) AS Average_Price, MAX(product_price) AS Maximum_Price FROM Products;
SELECT AVG(product_price) AS average_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) as Average_Clothes_Price FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Products.product_price > (SELECT AVG(Products.product_price) FROM Products)
SELECT Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Products.product_price > (SELECT AVG(Products.product_price) FROM Products) GROUP BY Products.product_name
SELECT Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_type_code = 'Hardware' AND Products.product_price > (SELECT AVG(Products.product_price) FROM Products WHERE Products.product_type_code = 'Hardware')
SELECT `product_name` FROM `Products` WHERE `product_type_code` = 'Hardware' AND `product_price` > (SELECT AVG(`product_price`) FROM `Products` WHERE `product_type_code` = 'Hardware')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1;
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT `product_name`, `product_price` FROM `Products` ORDER BY `product_price` DESC
SELECT Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id ORDER BY Products.product_price DESC
SELECT * FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC;
SELECT product_name, product_price FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC;
SELECT `product_type_code`, COUNT(*) as `Number_of_Products` FROM `Products` GROUP BY `product_type_code`
SELECT product_type_code, COUNT(product_id_temp) as product_count FROM Products JOIN Order_Items ON Products.product_id_temp = Order_Items.product_id_temp GROUP BY product_type_code;
SELECT `product_type_code`, AVG(`product_price`) as `average_price` FROM `Products` GROUP BY `product_type_code`
SELECT Products.product_type_code, AVG(Order_Items.order_quantity * Products.product_price) AS average_price FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Products.product_type_code;
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code, COUNT(*) as product_count FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code, COUNT(*) as product_count FROM Products GROUP BY product_type_code ORDER BY product_count DESC LIMIT 1;
SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code ORDER BY count DESC LIMIT 1;
error: No SQL found in the input string
SELECT COUNT(*) FROM Customers;
SELECT `customer_id`, `customer_name` FROM `Customers`
SELECT Customers.customer_id, Customers.customer_name FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT Customers.customer_address, Customers.customer_phone, Customers.customer_email FROM Customers INNER JOIN Addresses ON Customers.address_id = Addresses.address_id WHERE Customers.customer_name = 'Jeromy'
SELECT `customer_address`, `customer_phone`, `customer_email` FROM `Customers` WHERE `customer_name` = 'Jeromy'
SELECT `payment_method_code`, COUNT(*) FROM `Customers` GROUP BY `payment_method_code`
SELECT `payment_method_code`, COUNT(`customer_id`) as `customer_count` FROM `Customers` GROUP BY `payment_method_code`;
SELECT `payment_method_code`, COUNT(*) as `Number_of_Customers` FROM `Customers` GROUP BY `payment_method_code` ORDER BY `Number_of_Customers` DESC LIMIT 1;
error: No SQL found in the input string
SELECT C.`customer_name`, COUNT(DISTINCT O.`order_id`) as `Number_of_Orders` FROM Customers as C JOIN Customer_Orders as O ON C.`customer_id` = O.`customer_id` JOIN Order_Items as OI ON O.`order_id` = OI.`order_id` JOIN Products as P ON OI.`product_id` = P.`product_id` WHERE P.`product_type_code` = 'Hardware' AND P.`product_name` = 'Yellow Topping' GROUP BY C.`customer_id` ORDER BY COUNT(DISTINCT O.`order_id`) LIMIT 1;
SELECT customer_name FROM Customers WHERE customer_id IN ( SELECT customer_id FROM ( SELECT customer_id, payment_method_code, COUNT(*) as count FROM Customers GROUP BY customer_id, payment_method_code ) WHERE count = ( SELECT MIN(count) FROM ( SELECT customer_id, payment_method_code, COUNT(*) as count FROM Customers GROUP BY customer_id, payment_method_code ) ) )
SELECT `payment_method_code`, `customer_number` FROM `Customers` WHERE `customer_name` = 'Jeromy'
SELECT `payment_method_code`, `customer_number` FROM Customers WHERE `customer_name` = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers;
SELECT DISTINCT `payment_method_code` FROM `Customers`
SELECT `product_id`, `product_type_code` FROM `Products` ORDER BY `product_name`
SELECT Products.product_id, Products.product_type_code, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id WHERE Products.product_type_code = 'Clothes' GROUP BY Products.product_id, Products.product_name ORDER BY Products.product_name;
SELECT product_type_code, COUNT(*) as product_count FROM Products GROUP BY product_type_code ORDER BY product_count LIMIT 1
SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code ORDER BY count LIMIT 1;
error: No SQL found in the input string
SELECT COUNT(*) FROM Customer_Orders
SELECT `order_id`, `order_date`, `order_status_code` FROM `Customer_Orders` JOIN `Customers` ON `Customer_Orders`.`customer_id` = `Customers`.`customer_id` WHERE `customer_name` = 'Jeromy';
SELECT Customers.customer_id, Customer_Orders.order_date, Customer_Orders.order_status_code FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customers.customer_name = 'Jeromy'
SELECT Customers.customer_name, Customers.customer_id, COUNT(Customer_Orders.order_id) as number_of_orders FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id
SELECT Customers.customer_name, Customers.customer_id, COUNT(Customer_Orders.order_id) as number_of_orders FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id;
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(Customer_Orders.order_id) DESC LIMIT 1;
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN (SELECT customer_id, COUNT(*) as order_count FROM Customer_Orders GROUP BY customer_id ORDER BY order_count DESC LIMIT 1) as most_orders ON Customers.customer_id = most_orders.customer_id
SELECT `order_status_code`, COUNT(*) as `Number of Orders` FROM `Customer_Orders` GROUP BY `order_status_code`;
SELECT `order_status_code`, COUNT(*) as `order_count` FROM `Customer_Orders` GROUP BY `order_status_code`;
SELECT `order_status_code`, COUNT(*) as `count` FROM `Customer_Orders` GROUP BY `order_status_code` ORDER BY `count` DESC LIMIT 1;
SELECT `order_status_code`, COUNT(*) as `count` FROM `Customer_Orders` GROUP BY `order_status_code` ORDER BY `count` DESC LIMIT 1;
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT Products.product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT Products.product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT COUNT(*) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(*) FROM Order_Items AS OI JOIN Products AS P ON OI.product_id = P.product_id WHERE P.product_type_code = 'Monitor'
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor';
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id INNER JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_type_code = 'Clothes' AND Products.product_name = 'Monitor';
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id;
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT Customers.customer_id FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT `CO`.`order_date`, `CO`.`order_id` FROM `Customer_Orders` AS `CO` JOIN `Order_Items` AS `OI` ON `CO`.`order_id` = `OI`.`order_id` GROUP BY `CO`.`order_id` HAVING SUM(`OI`.`order_quantity`) > 6 OR COUNT(`OI`.`product_id`) > 3
error: No SQL found in the input string
SELECT COUNT(*) FROM building
SELECT COUNT(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT `Address`, `Completed_Year` FROM `building` ORDER BY `Completed_Year` DESC
SELECT `Address` FROM `building` ORDER BY `Completed_Year` DESC
SELECT MAX(Number_of_Stories) as Max_Number_of_Stories FROM building WHERE Completed_Year != 1980;
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year <> 1980
SELECT SUM(Population) / COUNT(Region_ID) AS Average_Population FROM region
SELECT AVG(Population) FROM region WHERE Name = 'Lombardy'
SELECT Name FROM region ORDER BY Name ASC;
SELECT r.Name, r.Capital, r.Area, r.Population FROM region r JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Completed_Year = (SELECT MAX(b2.Completed_Year) FROM building b2 WHERE b2.Region_ID = r.Region_ID);
SELECT `Capital` FROM `region` WHERE `Area` > 10000
SELECT `Region_ID`, `Name`, `Capital` FROM `region` WHERE `Area` > 10000
SELECT R.`Capital` FROM region AS R WHERE R.`Population` = (SELECT MAX(Population) FROM region)
error: No SQL found in the input string
CREATE TABLE singer ( Song_Name TEXT, Song_release_year INTEGER );
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T1.`Name`, T2.`Name` FROM building AS T1 JOIN region AS T2 ON T1.`Region_ID` = T2.`Region_ID`
SELECT B.`Name`, R.`Name` FROM building AS B JOIN region AS R ON B.`Region_ID` = R.`Region_ID`
SELECT R.`Name` FROM region AS R JOIN building AS B ON R.`Region_ID` = B.`Region_ID` GROUP BY R.`Region_ID` HAVING COUNT(B.`Building_ID`) > 1
SELECT R.Name FROM region AS R JOIN building AS B ON R.Region_ID = B.Region_ID GROUP BY R.Name HAVING COUNT(B.Building_ID) > 1
SELECT `Capital` FROM `region` WHERE `Region_ID` = (SELECT `Region_ID` FROM `building` GROUP BY `Region_ID` ORDER BY COUNT(*) DESC LIMIT 1)
error: No SQL found in the input string
SELECT B.`Address`, R.`Capital` FROM building AS B JOIN region AS R ON B.`Region_ID` = R.`Region_ID`
SELECT B.`Name`, B.`Address`, R.`Name` FROM building AS B JOIN region AS R ON B.`Region_ID` = R.`Region_ID`
SELECT `Number_of_Stories` FROM `building` WHERE `Region_ID` = (SELECT `Region_ID` FROM `region` WHERE `Name` = 'Abruzzo')
SELECT `Number_of_Stories` FROM `building` WHERE `Region_ID` = (SELECT `Region_ID` FROM `region` WHERE `Name` = 'Abruzzo')
error: No SQL found in the input string
SELECT `Completed_Year`, COUNT(*) FROM building GROUP BY `Completed_Year`
SELECT `Completed_Year` FROM `building` GROUP BY `Completed_Year` ORDER BY COUNT(*) DESC LIMIT 1
SELECT MAX(Completed_Year) FROM building
SELECT `Name` FROM `region` WHERE `Region_ID` NOT IN (SELECT `Region_ID` FROM `building`)
SELECT R.Name FROM region R WHERE R.Region_ID NOT IN (SELECT B.Region_ID FROM building B)
SELECT * FROM building WHERE Number_of_Stories > 20 AND Number_of_Stories < 15
SELECT Building_ID, Completed_Year FROM building WHERE Number_of_Stories > 20 AND Number_of_Stories < 15
SELECT DISTINCT `Address` FROM `building`
SELECT DISTINCT `Address` FROM `building`
SELECT `Name`, `Completed_Year`, `Number_of_Stories` FROM `building` ORDER BY `Number_of_Stories` DESC
SELECT `Name`, `Number_of_Stories`, `Completed_Year` FROM `building` ORDER BY `Number_of_Stories` DESC
SELECT * FROM Channels ORDER BY Channel_Details ASC
SELECT Channels.Channel_Details FROM Channels JOIN Customers_and_Services ON Channels.Channel_ID = Customers_and_Services.Channel_ID ORDER BY Channels.Channel_Details;
error: No SQL found in the input string
SELECT Customers.Customer_Details, COUNT(Services.Service_ID) as Service_Count FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_Details;
SELECT `Analytical_Layer_Type_Code`, COUNT(*) as count FROM `Analytical_Layer` GROUP BY `Analytical_Layer_Type_Code` ORDER BY count DESC LIMIT 1;
SELECT `Analytical_Layer_Type_Code`, COUNT(*) as count FROM `Analytical_Layer` GROUP BY `Analytical_Layer_Type_Code` ORDER BY count DESC LIMIT 1;
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch';
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch';
SELECT Services.Service_Details, COUNT(*) as Service_Usage_Count FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_Details HAVING COUNT(*) > 3
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Services.Service_ID HAVING COUNT(Customers_and_Services.Customer_ID) > 3
SELECT C.Customer_Details, COUNT(CS.Service_ID) as Service_Usage_Count FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID ORDER BY Service_Usage_Count DESC LIMIT 1;
SELECT Customers.Customer_Details, COUNT(Customers_and_Services.Customer_ID) as Service_Count FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID GROUP BY Customers.Customer_ID ORDER BY Service_Count DESC LIMIT 1;
SELECT Customers.Customer_Details, COUNT(DISTINCT Customers_and_Services.Customers_and_Services_ID) as Service_Usage_Count FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID GROUP BY Customers.Customer_Details ORDER BY Service_Usage_Count DESC LIMIT 1;
SELECT Customers.Customer_Details, COUNT(DISTINCT Customers_and_Services.Customers_and_Services_ID) as Service_Usage_Count FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID GROUP BY Customers.Customer_ID ORDER BY Service_Usage_Count DESC LIMIT 1;
SELECT C.* FROM Customers C WHERE C.Customer_ID NOT IN ( SELECT CS.Customer_ID FROM Customers_and_Services CS )
SELECT Customers.Customer_ID, Customers.Customer_Details FROM Customers WHERE Customers.Customer_ID NOT IN ( SELECT Customers_and_Services.Customer_ID FROM Customers_and_Services )
SELECT C.Customer_Details, COUNT(CS.Service_ID) as Service_Usage FROM Customers C JOIN Customers_and_Services CUS ON C.Customer_ID = CUS.Customer_ID JOIN Services S ON S.Service_ID = CUS.Service_ID GROUP BY C.Customer_ID ORDER BY Service_Usage ASC LIMIT 1;
SELECT Customers.Customer_Details, Services.Service_Details, COUNT(*) as Frequency FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_Details, Services.Service_Details HAVING COUNT(*) = (SELECT MIN(Frequency) FROM ( SELECT COUNT(*) as Frequency FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_Details, Services.Service_Details ) AS subquery)
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT COUNT(DISTINCT Services.Service_ID) FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID;
SELECT * FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Customers.* FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers_and_Services.Customers_and_Services_Details LIKE '%Kutch%';
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE (Customers.Customer_Details = 'Hardy Kutch' OR Customer_Interactions.Services_and_Channels_Details = 'good')
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customers_and_Services.Customers_and_Services_ID = Customer_Interactions.Customers_and_Services_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Customers_and_Services_Details = 'Satisfied' AND Integration_Platform.Integration_Platform_Details = 'Success';
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customers_and_Services.Customers_and_Services_ID = Customer_Interactions.Customers_and_Services_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Name = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'Bad'
CREATE TABLE Customer_Interactions ( Customer_Interaction_ID INTEGER PRIMARY KEY, Channel_ID INTEGER, Customer_ID INTEGER, Service_ID INTEGER, Status_Code TEXT, Services_and_Channels_Details TEXT, FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID), FOREIGN KEY(Service_ID) REFERENCES Services(Service_ID), FOREIGN KEY(Channel_ID) REFERENCES Channels(Channel_ID) ); INSERT INTO Customer_Interactions (Customer_Interaction_ID, Channel_ID, Customer_ID, Service_ID, Status_Code, Services_and_Channels_Details) SELECT Customer_Interaction_ID, Channel_ID, Customer_ID, Service_ID, Status_Code, Services_and_Channels_Details FROM YourTableName WHERE Customer_ID = (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch') AND Services_and_Channels_Details = 'Bad';
SELECT Services.Service_Details, Channels.Channel_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Channels.Channel_Details = '15 ij'
SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Channels.Channel_Details = '15 ij';
SELECT Customers.Customer_Details, Services.Service_Details, Channels.Channel_Details, Analytical_Layer.Analytical_Layer_Type_Code FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Customer_Interactions ON Customers_and_Services.Customers_and_Services_ID = Customer_Interactions.Customers_and_Services_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID JOIN Analytical_Layer ON Customers_and_Services.Customers_and_Services_ID = Analytical_Layer.Customers_and_Services_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Analytical_Layer.Pattern_Recognition = 'Bad';
SELECT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID JOIN Analytical_Layer ON Customers_and_Services.Customers_and_Services_ID = Analytical_Layer.Customers_and_Services_ID_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Analytical_Layer.Pattern_Recognition = 'Bad';
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details = 'Success'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details = 'Success'
SELECT Customers.Customer_Details, Customers_and_Services.Customers_and_Services_Details FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Integration_Platform ON Customers_and_Services.Customers_and_Services_ID = Integration_Platform.Customers_and_Services_ID WHERE Integration_Platform.Integration_Platform_Details = 'Fail';
SELECT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Integration_Platform.Integration_Platform_Details = 'Fail';
SELECT Services.Service_ID, Services.Service_Details FROM Services LEFT JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Service_ID IS NULL
SELECT Services.Service_Details FROM Services WHERE Services.Service_ID NOT IN ( SELECT Customers_and_Services.Service_ID FROM Customers_and_Services )
SELECT Analytical_Layer.`Analytical_Layer_Type_Code`, COUNT(*) as `Usage_Count` FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.`Customers_and_Services_ID` = Customers_and_Services.`Customers_and_Services_ID` GROUP BY Analytical_Layer.`Analytical_Layer_Type_Code`;
SELECT Analytical_Layer.Analytical_Layer_Type_Code, COUNT(Analytical_Layer.Analytical_Layer_Type_Code) as Count FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Analytical_Layer.Analytical_Layer_Type_Code;
SELECT Services.* FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers_and_Services_Details = 'Unsatisfied' ON Customers_and_Services.Customers_and_Services_Details = 'Unsatisfied'
-- First, create a temporary table to hold the result of the first query CREATE TEMPORARY TABLE temp_services AS SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers_and_Services_Details ON Customers_and_Services.Customers_and_Services_ID = Customers_and_Services_Details.Customers_and_Services_ID WHERE Customers_and_Services_Details.Customers_and_Services_Details = 'Unsatisfied'; -- Then, create a table to hold the result of the second query CREATE TABLE Customers_and_Services_Details ( Customers_and_Services_ID INT, Customers_and_Services_Details TEXT ); -- Insert the result of the second query into the temporary table INSERT INTO Customers_and_Services_Details (Customers_and_Services_ID, Customers_and_Services_Details) SELECT Customers_and_Services_ID, Customers_and_Services_Details FROM Customers_and_Services; -- Finally, select the result of the first query from the temporary table SELECT * FROM temp_services;
error: No SQL found in the input string
SELECT COUNT(*) FROM Vehicles
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT Vehicles.name FROM Vehicles ORDER BY Vehicles.Model_year DESC;
SELECT DISTINCT `Type_of_powertrain` FROM `Vehicles`
SELECT DISTINCT `Type_of_powertrain` FROM `Vehicles`
SELECT `name`, `Type_of_powertrain`, `Annual_fuel_cost` FROM `Vehicles` WHERE `Model_year` IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Model_year, Vehicles.Annual_fuel_cost FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014)
SELECT V.`Type_of_powertrain` FROM Vehicles AS V WHERE V.`Model_year` IN (2014, 2013) GROUP BY V.`Type_of_powertrain`
SELECT V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id WHERE V.Model_year IN (2013, 2014) GROUP BY V.Type_of_powertrain HAVING COUNT(DISTINCT V.id) = 2;
SELECT `Type_of_powertrain`, COUNT(*) FROM Vehicles GROUP BY `Type_of_powertrain`
SELECT `Type_of_powertrain`, COUNT(*) as `Number_of_Vehicles` FROM `Vehicles` GROUP BY `Type_of_powertrain`;
SELECT Type_of_powertrain, COUNT(*) as Number_of_Vehicles FROM Vehicles GROUP BY Type_of_powertrain ORDER BY Number_of_Vehicles DESC LIMIT 1;
SELECT `Type_of_powertrain`, COUNT(*) as `Count` FROM `Vehicles` GROUP BY `Type_of_powertrain` ORDER BY `Count` DESC LIMIT 1;
SELECT MIN(Annual_fuel_cost) AS Minimum_Annual_Fuel_Cost, MAX(Annual_fuel_cost) AS Maximum_Annual_Fuel_Cost, AVG(Annual_fuel_cost) AS Average_Annual_Fuel_Cost FROM Vehicles;
SELECT MIN(Annual_fuel_cost) AS Minimum_Fuel_Cost, MAX(Annual_fuel_cost) AS Maximum_Fuel_Cost, AVG(Annual_fuel_cost) AS Average_Fuel_Cost FROM Vehicles;
SELECT `name`, `Model_year` FROM `Vehicles` WHERE `Combined_fuel_economy_rate` <= `Highway_fuel_economy_rate`
SELECT V.name, V.Model_year FROM Vehicles V WHERE V.City_fuel_economy_rate <= V.Highway_fuel_economy_rate
SELECT V.`Type_of_powertrain`, AVG(V.`Annual_fuel_cost`) FROM Vehicles AS V JOIN Renting_history AS R ON V.`id` = R.`vehicles_id` WHERE V.`Type_of_powertrain` IN ( SELECT Vehicles.`Type_of_powertrain` FROM Vehicles GROUP BY Vehicles.`Type_of_powertrain` HAVING COUNT(Vehicles.`id`) >= 2 ) GROUP BY V.`Type_of_powertrain`
SELECT V.Type_of_powertrain, AVG(R.Annual_fuel_cost) AS Average_Annual_Fuel_Cost FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.Type_of_powertrain
SELECT `name`, `age`, `membership_credit` FROM `Customers`
SELECT `name`, `age`, `membership_credit` FROM `Customers`
SELECT `name`, `age` FROM `Customers` WHERE `membership_credit` = (SELECT MAX(`membership_credit`) FROM `Customers`)
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers);
SELECT AVG(age) as average_age FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers);
SELECT AVG(age) as average_age FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount
SELECT Customers.name, Customers.age, Customers.membership_credit, Discount.name AS discount_name, Discount.membership_credit AS discount_membership_credit FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id ORDER BY discount_membership_credit ASC;
SELECT V.name, RH.total_hours FROM Renting_history RH JOIN Vehicles V ON RH.vehicles_id = V.id GROUP BY RH.vehicles_id;
SELECT V.name, RH.total_hours FROM Vehicles AS V JOIN Renting_history AS RH ON V.id = RH.vehicles_id ORDER BY V.name;
SELECT V.name FROM Vehicles V LEFT JOIN Renting_history R ON V.id = R.vehicles_id WHERE R.vehicles_id IS NULL
SELECT V.name FROM Vehicles V LEFT JOIN Renting_history R ON V.id = R.vehicles_id WHERE R.vehicles_id IS NULL
SELECT C.name FROM Customers AS C JOIN Renting_history AS RH ON C.id = RH.customer_id GROUP BY C.id HAVING COUNT(RH.id) >= 2
SELECT Customers.name FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id GROUP BY Customers.id HAVING COUNT(*) >= 2
SELECT `name`, `Model_year` FROM `Vehicles` WHERE `id` = ( SELECT `vehicles_id` FROM `Renting_history` GROUP BY `vehicles_id` ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT V.name, V.Model_year FROM Vehicles AS V JOIN ( SELECT vehicles_id, COUNT(*) as count FROM Renting_history GROUP BY vehicles_id ORDER BY count DESC LIMIT 1 ) AS R ON V.id = R.vehicles_id
SELECT V.`name`, RH.`total_hours` FROM Vehicles AS V JOIN Renting_history AS RH ON V.`id` = RH.`vehicles_id` ORDER BY RH.`total_hours` DESC
SELECT V.name, SUM(R.total_hours) as total_hours FROM Renting_history as R JOIN Vehicles as V ON R.vehicles_id = V.id GROUP BY R.vehicles_id ORDER BY total_hours DESC
SELECT D.name, COUNT(*) as num_records FROM Renting_history as R JOIN Discount as D ON R.discount_id = D.id GROUP BY D.name ORDER BY num_records DESC LIMIT 1;
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.name ORDER BY COUNT(R.id) DESC LIMIT 1;
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Renting_history.total_hours > 30
SELECT V.name, V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.id HAVING SUM(R.total_hours) > 30
SELECT V.name AS Vehicle_Name, V.Type_of_powertrain AS Powertrain_Type, AVG(V.City_fuel_economy_rate) AS Average_City_Fuel_Economy_Rate, AVG(V.Highway_fuel_economy_rate) AS Average_Highway_Fuel_Economy_Rate FROM Vehicles AS V GROUP BY V.Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Average_City_Fuel_Economy_Rate, AVG(Highway_fuel_economy_rate) AS Average_Highway_Fuel_Economy_Rate FROM Vehicles GROUP BY Type_of_powertrain;
SELECT AVG(amount_of_loan) as Average_Amount FROM Student_Loans
SELECT AVG(amount_of_loan) as average_amount_of_loan FROM Student_Loans
SELECT Students.student_id, Students.bio_data, COUNT(*) as num_classes FROM Students JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id HAVING COUNT(*) >= 2 UNION SELECT Students.student_id, Students.bio_data, COUNT(*) as num_detentions FROM Students JOIN Detention ON Students.student_id = Detention.student_id WHERE Detention.detention_id IS NULL GROUP BY Students.student_id HAVING COUNT(*) < 2;
SELECT Students.student_id, Students.bio_data FROM Students JOIN ( SELECT student_id, COUNT(*) as class_count FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2 ) T1 ON Students.student_id = T1.student_id JOIN ( SELECT student_id, COUNT(*) as detention_count FROM Detention GROUP BY student_id ) T2 ON Students.student_id = T2.student_id WHERE T1.class_count >= 2 AND T2.detention_count < 2
SELECT Teachers.* FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id WHERE Classes.class_details LIKE '%data%' AND NOT (Classes.class_details LIKE 'net%')
SELECT Teachers.teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id WHERE Teachers.teacher_id IN ( SELECT Teachers.teacher_id FROM Teachers WHERE Teachers.teacher_details LIKE '%data%' AND NOT Teachers.teacher_details LIKE 'net%' )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students LEFT JOIN Detention ON Students.student_id = Detention.student_id WHERE Detention.student_id IS NULL AND NOT EXISTS (SELECT 1 FROM Student_Loans WHERE Students.student_id = Student_Loans.student_id);
SELECT Students.student_id, Students.bio_data, Students.student_details, Addresses.address_details FROM Students LEFT JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id LEFT JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id LEFT JOIN Detention ON Students.student_id = Detention.student_id LEFT JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Detention.detention_id IS NULL AND Student_Loans.student_loan_id IS NULL
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id HAVING COUNT(DISTINCT Achievements.achievement_id) >= 2
SELECT S.student_id, S.bio_data, S.student_details, L.date_of_loan, L.amount_of_loan FROM Students S JOIN Student_Loans L ON S.student_id = L.student_id JOIN Achievements A ON S.student_id = A.student_id GROUP BY S.student_id HAVING COUNT(A.achievement_id) >= 2
SELECT T1.`teacher_id`, T1.`teacher_details`, COUNT(T2.`class_id`) as `Number_of_Courses` FROM `Classes` as T1 JOIN `Teachers` as T2 ON T1.`teacher_id` = T2.`teacher_id` GROUP BY T1.`teacher_id`, T1.`teacher_details` ORDER BY COUNT(T2.`class_id`) DESC LIMIT 1;
SELECT Teachers.teacher_id, Teachers.teacher_details, COUNT(Classes.teacher_id) as num_courses FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id GROUP BY Teachers.teacher_id ORDER BY num_courses DESC LIMIT 1;
error: No SQL found in the input string
SELECT DISTINCT Detention.detention_summary FROM Detention
SELECT Students.student_id, Students.bio_data, Students.student_details, Addresses.address_details, Ref_Address_Types.address_type_description FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id JOIN Ref_Address_Types ON Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT Students.bio_data, Ref_Address_Types.address_type_description, Students_Addresses.date_from, Students_Addresses.date_to FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code;
SELECT Students.`bio_data`, Addresses.`address_details` FROM Students JOIN Students_Addresses ON Students.`student_id` = Students_Addresses.`student_id` JOIN Addresses ON Students_Addresses.`address_id` = Addresses.`address_id` WHERE Students_Addresses.`address_type_code` = 'Home';
SELECT Students.student_id, Students.bio_data, Students.student_details, Addresses.address_details, Transcripts.date_of_transcript, Transcripts.transcript_details, Behaviour_Monitoring.behaviour_monitoring_details, Detention.datetime_detention_start, Detention.datetime_detention_end, Detention.detention_summary, Achievements.date_achievement, Achievements.achievement_details FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id JOIN Transcripts ON Students.student_id = Transcripts.student_id JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Detention ON Students.student_id = Detention.student_id JOIN Achievements ON Students.student_id = Achievements.student_id;
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id;
SELECT B.student_id, E.event_type_description, COUNT(*) as count FROM Behaviour_Monitoring B JOIN Ref_Event_Types E ON B.event_type_code = E.event_type_code GROUP BY B.student_id, E.event_type_description ORDER BY count DESC LIMIT 1;
SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1;
SELECT Students.bio_data, Students.student_details, COUNT(Behaviour_Monitoring.student_id) as count FROM Students INNER JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id GROUP BY Students.student_id;
SELECT S.student_id, S.bio_data, S.student_details, BM.behaviour_monitoring_details, A.achievement_details FROM Students S JOIN ( SELECT student_id, COUNT(*) as count FROM Transcripts GROUP BY student_id ORDER BY count DESC LIMIT 1 ) T ON S.student_id = T.student_id JOIN ( SELECT student_id, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY student_id HAVING count = 3 ) BM ON S.student_id = BM.student_id JOIN ( SELECT student_id, COUNT(*) as count FROM Achievements GROUP BY student_id ORDER BY count DESC LIMIT 1 ) A ON S.student_id = A.student_id
SELECT S.student_id, S.bio_data, S.student_details FROM Students S JOIN ( SELECT student_id, COUNT(DISTINCT behaviour_monitoring_details) as count FROM Behaviour_Monitoring GROUP BY student_id ) B ON S.student_id = B.student_id WHERE B.count = ( SELECT MAX(count) FROM ( SELECT student_id, COUNT(DISTINCT behaviour_monitoring_details) as count FROM Behaviour_Monitoring GROUP BY student_id ) );
SELECT S.bio_data, COUNT(BM.behaviour_monitoring_details) as count_details FROM Students S JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id GROUP BY S.bio_data ORDER BY count_details DESC LIMIT 1;
SELECT S.bio_data, T.date_of_transcript FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id JOIN Transcripts T ON SE.event_id = T.transcript_id WHERE SE.event_id IN ( SELECT event_id FROM Student_Events WHERE event_type_code = 'Registration' );
SELECT Students.bio_data, Student_Events.event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id GROUP BY Students.student_id;
SELECT Ref_Event_Types.event_type_description, COUNT(Student_Events.event_id) as num_students FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY num_students DESC LIMIT 1;
error: No SQL found in the input string
SELECT Achievements.`achievement_details`, Ref_Achievement_Type.`achievement_type_description` FROM Achievements INNER JOIN Ref_Achievement_Type ON Achievements.`achievement_type_code` = Ref_Achievement_Type.`achievement_type_code`
SELECT Achievements.`achievement_details`, Ref_Achievement_Type.`achievement_type_description` FROM Achievements INNER JOIN Ref_Achievement_Type ON Achievements.`achievement_type_code` = Ref_Achievement_Type.`achievement_type_code`
SELECT COUNT(DISTINCT Teachers.teacher_id) AS Number_of_teachers FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id LEFT JOIN Achievements ON Students.student_id = Achievements.student_id AND Achievements.achievement_type_code = 'Scholastic' WHERE Achievements.student_id IS NULL;
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id LEFT JOIN Achievements AS T4 ON T3.student_id = T4.student_id AND T4.achievement_type_code = 'Scholastic' WHERE T4.student_id IS NULL;
SELECT `date_of_transcript`, `transcript_details` FROM `Transcripts`
SELECT Transcripts.date_of_transcript, Transcripts.transcript_details, Students.bio_data, Students.student_details, Ref_Event_Types.event_type_description, Ref_Achievement_Type.achievement_type_description, Ref_Detention_Type.detention_type_description FROM Transcripts JOIN Students ON Transcripts.student_id = Students.student_id JOIN Ref_Event_Types ON Transcripts.event_type_code = Ref_Event_Types.event_type_code JOIN Ref_Achievement_Type ON Transcripts.achievement_type_code = Ref_Achievement_Type.achievement_type_code JOIN Ref_Detention_Type ON Transcripts.detention_type_code = Ref_Detention_Type.detention_type_code
SELECT `achievement_type_code`, `achievement_details`, `date_achievement` FROM `Achievements` WHERE `student_id` IN ( SELECT `student_id` FROM `Students` WHERE `bio_data` = 'Leonard' )
SELECT Ref_Achievement_Type.achievement_type_code, Achievements.achievement_details, Achievements.date_achievement FROM Achievements INNER JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
SELECT `datetime_detention_start`, `datetime_detention_end` FROM `Detention`
SELECT Detention.datetime_detention_start, Detention.datetime_detention_end FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code;
SELECT `bio_data` FROM `Students` WHERE `bio_data` LIKE '%Suite%'
SELECT `student_id`, `bio_data` FROM `Students` WHERE `student_details` LIKE '%Suite%'
SELECT T1.teacher_name, T2.student_name FROM ( SELECT T1.teacher_name FROM ( SELECT `teacher_name` FROM `Teachers` WHERE `teacher_id` IN ( SELECT `teacher_id` FROM `Classes` GROUP BY `teacher_id` HAVING COUNT(DISTINCT `student_id`) > 1 ) ) AS T1 JOIN ( SELECT `student_name` FROM `Students` WHERE `student_id` IN ( SELECT `student_id` FROM `Classes` GROUP BY `student_id` HAVING COUNT(DISTINCT `teacher_id`) > 1 ) ) AS T2 ON T1.teacher_name = T2.student_name )
SELECT T1.teacher_details, T2.student_details FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id = T2.teacher_id
SELECT COUNT(*) as total_courses, teacher_id FROM Classes GROUP BY teacher_id ORDER BY total_courses DESC LIMIT 1;
SELECT T1.`teacher_id`, COUNT(*) as `number_of_courses` FROM Classes as T1 JOIN Teachers as T2 ON T1.`teacher_id` = T2.`teacher_id` GROUP BY T1.`teacher_id` ORDER BY `number_of_courses` DESC LIMIT 1
SELECT student_id FROM Classes WHERE student_id IN ( SELECT student_id FROM Classes GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT student_id, COUNT(*) as num_courses FROM Classes GROUP BY student_id ORDER BY num_courses DESC LIMIT 1;
SELECT S.`student_id`, S.`bio_data` FROM Students AS S JOIN ( SELECT C.`student_id` FROM Classes AS C GROUP BY C.`student_id` HAVING COUNT(*) = 2 ) AS T ON S.`student_id` = T.`student_id`
SELECT S.student_id, S.bio_data, S.student_details, COUNT(C.class_id) as num_courses FROM Students S JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id HAVING COUNT(C.class_id) = 2;
SELECT RD.detention_type_code, RD.detention_type_description, COUNT(*) as count FROM Detention D JOIN Ref_Detention_Type RD ON D.detention_type_code = RD.detention_type_code GROUP BY D.detention_type_code HAVING count = ( SELECT COUNT(*) FROM Detention GROUP BY detention_type_code ORDER BY count DESC LIMIT 1 )
SELECT d.detention_type_code, r.detention_type_description FROM Detention d JOIN Ref_Detention_Type r ON d.detention_type_code = r.detention_type_code GROUP BY d.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1;
SELECT S.bio_data, S.student_details, SL.amount_of_loan FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
error: No SQL found in the input string
SELECT MIN(date_of_loan) as Earliest_Date_of_Loan FROM Student_Loans
SELECT S.student_id, S.bio_data, S.student_details, L.amount_of_loan FROM Students S JOIN Student_Loans L ON S.student_id = L.student_id WHERE L.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT Transcripts.date_of_transcript FROM Transcripts JOIN ( SELECT student_id, MAX(amount_of_loan) as max_loan FROM Student_Loans GROUP BY student_id ) AS MaxLoan ON Transcripts.student_id = MaxLoan.student_id WHERE MaxLoan.max_loan = Student_Loans.amount_of_loan;
SELECT T1.`date_of_transcript` FROM Transcripts AS T1 JOIN (SELECT student_id, MAX(amount_of_loan) AS max_loan FROM Student_Loans GROUP BY student_id) AS T2 ON T1.`student_id` = T2.`student_id` WHERE T1.`amount_of_loan` = T2.`max_loan`
SELECT T1.`teacher_details` FROM Teachers AS T1 JOIN Classes AS T2 ON T1.`teacher_id` = T2.`teacher_id` JOIN Students AS T3 ON T2.`student_id` = T3.`student_id` JOIN Transcripts AS T4 ON T3.`student_id` = T4.`student_id` WHERE T4.`date_of_transcript` = (SELECT MIN(T4.`date_of_transcript`) FROM Transcripts AS T4)
SELECT T1.* FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id JOIN Transcripts AS T4 ON T3.student_id = T4.student_id WHERE T4.date_of_transcript = (SELECT MIN(T4.date_of_transcript) FROM Transcripts AS T4)
SELECT SL.student_id, COUNT(*) AS total_loan FROM Student_Loans AS SL GROUP BY SL.student_id;
SELECT S.student_id, SUM(T.amount_of_loan) AS total_amount_of_loan FROM Students S JOIN Student_Loans T ON S.student_id = T.student_id GROUP BY S.student_id;
SELECT S.student_id, S.bio_data, COUNT(C.class_id) as course_count FROM Students S LEFT JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id;
SELECT S.`student_id`, S.`bio_data`, COUNT(SE.`event_id`) AS `number_of_courses` FROM `Students` AS S LEFT JOIN `Student_Events` AS SE ON S.`student_id` = SE.`student_id` LEFT JOIN `Classes` AS C ON S.`student_id` = C.`student_id` GROUP BY S.`student_id`
SELECT COUNT(*) FROM Detention
SELECT COUNT(*) FROM Students JOIN Detention ON Students.student_id = Detention.student_id
SELECT address_type_description FROM Ref_Address_Types WHERE address_type_code = ( SELECT address_type_code FROM ( SELECT address_type_code, COUNT(*) as count FROM Students_Addresses GROUP BY address_type_code ORDER BY count DESC LIMIT 1 ) );
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description, COUNT(Students_Addresses.address_id) AS count_addresses FROM Students_Addresses INNER JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Students_Addresses.address_type_code, Ref_Address_Types.address_type_description ORDER BY count_addresses DESC LIMIT 1;
SELECT S.`bio_data`, S.`student_details` FROM Students AS S WHERE S.`student_id` NOT IN ( SELECT DISTINCT T.`student_id` FROM Transcripts AS T )
SELECT S.`student_id`, S.`bio_data`, S.`student_details` FROM Students S LEFT JOIN Student_Events SE ON S.`student_id` = SE.`student_id` LEFT JOIN Student_Loans SL ON S.`student_id` = SL.`student_id` WHERE SE.`event_id` IS NULL AND SL.`student_id` IS NULL
SELECT S.student_id, SA.address_details, T.date_of_transcript, T2.date_of_transcript AS second_transcript_date FROM Students AS S JOIN Students_Addresses AS SA ON S.student_id = SA.student_id JOIN Transcripts AS T ON S.student_id = T.student_id JOIN Transcripts AS T2 ON S.student_id = T2.student_id WHERE T.date_of_transcript < T2.date_of_transcript GROUP BY S.student_id, SA.address_details, T.date_of_transcript, T2.date_of_transcript HAVING COUNT(*) = 2
SELECT S.student_id, S.bio_data, A.address_details, T.date_of_transcript, COUNT(T.transcript_id) AS num_transcripts FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Addresses A ON SA.address_id = A.address_id JOIN Transcripts T ON S.student_id = T.student_id GROUP BY S.student_id, A.address_details, T.date_of_transcript HAVING COUNT(T.transcript_id) = 2
SELECT D.`datetime_detention_start` FROM `Detention` AS D WHERE D.`detention_type_code` = 'On break'
SELECT `datetime_detention_start` FROM `Detention`
SELECT Name FROM Author
error: No SQL found in the input string
SELECT `Name`, `Address` FROM `Client`
SELECT `Name`, `Address` FROM `Client`
SELECT Book.Title, Book.ISBN, Book.SalePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN WHERE Books_Order.amount = (SELECT MAX(amount) FROM Books_Order WHERE ISBN = Book.ISBN);
SELECT Book.Title, Book.ISBN, Book.SalePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN WHERE Books_Order.amount = (SELECT MAX(amount) FROM Books_Order WHERE ISBN = Book.ISBN);
error: No SQL found in the input string
SELECT A.Name, COUNT(B.ISBN) FROM Author A JOIN Author_Book B ON A.idAuthor = B.Author GROUP BY A.Name
error: No SQL found in the input string
SELECT COUNT(DISTINCT Name) as NumberOfAuthors FROM Author;
SELECT COUNT(*) FROM Client
SELECT COUNT(DISTINCT IdClient) FROM Client;
SELECT `Name`, `Address` FROM `Client` ORDER BY `Name` ASC
SELECT Name, Address FROM Client ORDER BY Name ASC;
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor;
SELECT Book.Title, Author.Name FROM Author_Book JOIN Book ON Author_Book.ISBN = Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor GROUP BY Book.Title, Author.Name
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient
SELECT A.`Name`, COUNT(*) FROM Author AS A JOIN Author_Book AS AB ON A.`idAuthor` = AB.`Author` GROUP BY A.`idAuthor`
SELECT A.Name, COUNT(B.ISBN) as BookCount FROM Author A JOIN Author_Book AB ON A.idAuthor = AB.Author JOIN Book B ON AB.ISBN = B.ISBN GROUP BY A.Name;
SELECT B.`Title`, COUNT(*) FROM Books_Order AS BO JOIN Book AS B ON BO.`ISBN` = B.`ISBN` GROUP BY BO.`ISBN`
SELECT B.ISBN, COUNT(*) as Order_Count FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN GROUP BY B.ISBN;
SELECT B.ISBN, SUM(BO.amount) as TotalAmount FROM Books_Order BO JOIN Book B ON BO.ISBN = B.ISBN GROUP BY B.ISBN;
SELECT BO.ISBN, SUM(BO.amount) as TotalAmountOrdered FROM Books_Order BO JOIN Book B ON BO.ISBN = B.ISBN GROUP BY BO.ISBN;
SELECT B.Title, COUNT(*) as OrderCount FROM Books_Order AS BO JOIN Book AS B ON BO.ISBN = B.ISBN GROUP BY BO.ISBN ORDER BY OrderCount DESC LIMIT 1;
SELECT B.Title, COUNT(*) as NumberOfOrders FROM Books_Order AS BO JOIN Book AS B ON BO.ISBN = B.ISBN GROUP BY BO.ISBN ORDER BY NumberOfOrders DESC LIMIT 1;
SELECT `Title`, `PurchasePrice` FROM `Book` WHERE `PurchasePrice` = (SELECT MAX(`PurchasePrice`) FROM `Book`)
SELECT Title, PurchasePrice FROM Book WHERE ISBN IN ( SELECT ISBN FROM Books_Order GROUP BY ISBN ORDER BY SUM(amount) DESC LIMIT 1 )
SELECT B.Title FROM Book AS B JOIN Books_Order AS BO ON B.ISBN = BO.ISBN WHERE BO.amount > 0
SELECT b.Title FROM Book b JOIN Books_Order bo ON b.ISBN = bo.ISBN JOIN Orders o ON o.IdOrder = bo.IdOrder WHERE o.DateExped < CURRENT_DATE GROUP BY b.Title
SELECT DISTINCT Name FROM Client WHERE IdClient IN ( SELECT IdClient FROM Orders WHERE IdOrder IN ( SELECT IdOrder FROM Books_Order ) );
SELECT DISTINCT C.Name FROM Client AS C JOIN Orders AS O ON C.IdClient = O.IdClient;
SELECT T1.`Name`, COUNT(*) FROM Client AS T1 JOIN Orders AS T2 ON T1.`IdClient` = T2.`IdClient` GROUP BY T1.`IdClient`
SELECT Client.Name, COUNT(Orders.IdOrder) as NumberOfOrders FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.Name;
SELECT Client.IdClient, Client.Name, COUNT(Orders.IdOrder) as NumberOfOrders FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient ORDER BY NumberOfOrders DESC LIMIT 1;
SELECT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient GROUP BY C.IdClient ORDER BY COUNT(O.IdOrder) DESC LIMIT 1;
SELECT C.Name, SUM(BO.amount) as TotalAmount FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder JOIN Book B ON BO.ISBN = B.ISBN GROUP BY C.Name;
SELECT C.Name, SUM(BO.amount) as Total_Books_Ordered FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY C.Name;
SELECT C.Name, SUM(BO.amount) as TotalAmount FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder JOIN Book B ON BO.ISBN = B.ISBN GROUP BY C.Name ORDER BY TotalAmount DESC LIMIT 1;
SELECT C.Name FROM Client AS C JOIN Orders AS O ON C.IdClient = O.IdClient JOIN Books_Order AS BO ON O.IdOrder = BO.IdOrder GROUP BY C.Name ORDER BY SUM(BO.amount) DESC LIMIT 1;
SELECT Book.Title FROM Book WHERE Book.ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT B.Title FROM Book B WHERE B.ISBN NOT IN ( SELECT BO.ISBN FROM Books_Order BO )
SELECT DISTINCT Client.Name FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient WHERE Orders.IdOrder IS NULL
SELECT C.Name FROM Client C LEFT JOIN Orders O ON C.IdClient = O.IdClient WHERE O.IdOrder IS NULL
SELECT MAX(SalePrice) as Maximum_Sale_Price, MIN(SalePrice) as Minimum_Sale_Price FROM Book
SELECT MAX(SalePrice) AS MaximumSalePrice, MIN(SalePrice) AS MinimumSalePrice FROM Book
SELECT AVG(SalePrice) as Average_Sale_Price FROM Book
SELECT AVG(PurchasePrice) AS Average_Purchase_Price, AVG(SalePrice) AS Average_Sale_Price FROM Book
SELECT MAX(SalePrice - PurchasePrice) as Maximum_Difference FROM Book
error: No SQL found in the input string
SELECT Book.Title FROM Book WHERE Book.SalePrice > (SELECT AVG(Book.SalePrice) FROM Book)
SELECT Book.Title FROM Book WHERE Book.SalePrice > (SELECT AVG(Book.SalePrice) FROM Book)
SELECT Book.Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Book.Title FROM Book WHERE Book.SalePrice = (SELECT MIN(Book.SalePrice) FROM Book)
SELECT Book.Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(SalePrice) as Average_Sale_Price FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell';
SELECT AVG(SalePrice) as Average_Sale_Price FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell';
SELECT `SalePrice` FROM `Book` WHERE `Author` IN (SELECT `idAuthor` FROM `Author` WHERE `Name` = 'Plato')
SELECT `SalePrice` FROM `Book` INNER JOIN `Author_Book` ON `Book`.`ISBN` = `Author_Book`.`ISBN` INNER JOIN `Author` ON `Author_Book`.`Author` = `Author`.`idAuthor` WHERE `Author`.`Name` = 'Plato'
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell' ORDER BY Book.SalePrice ASC LIMIT 1;
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell' ORDER BY Book.SalePrice ASC LIMIT 1;
SELECT Book.Title FROM Book WHERE Author = 1 AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato' AND Book.SalePrice < (SELECT AVG(SalePrice) FROM Book)
error: No SQL found in the input string
SELECT `Name` FROM `Author` JOIN `Author_Book` ON `Author`.`idAuthor` = `Author_Book`.`Author` JOIN `Book` ON `Author_Book`.`ISBN` = `Book`.`ISBN` WHERE `Book`.`Title` = 'Pride and Prejudice'
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%';
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%';
SELECT COUNT(*) FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice';
SELECT COUNT(*) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT `Orders`.`IdOrder` FROM `Orders` JOIN `Books_Order` ON `Orders`.`IdOrder` = `Books_Order`.`IdOrder` WHERE `Books_Order`.`ISBN` IN ( SELECT `ISBN` FROM `Book` WHERE `Title` = 'Pride and Prejudice' ) OR `Books_Order`.`ISBN` IN ( SELECT `ISBN` FROM `Book` WHERE `Title` = 'The Little Prince' )
SELECT DISTINCT Orders.IdOrder FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY Orders.IdOrder HAVING COUNT(DISTINCT Book.Title) = 2;
SELECT B.ISBN FROM Books_Order AS BO1 JOIN Books_Order AS BO2 ON BO1.ISBN = BO2.ISBN JOIN Book AS B ON B.ISBN = BO1.ISBN WHERE BO1.IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe') AND BO2.IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith') GROUP BY B.ISBN HAVING COUNT(DISTINCT BO1.IdOrder) > 1
SELECT Books_Order.ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'Peter Doe' AND Client.Name = 'James Smith'
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder WHERE Orders.IdClient = '0000005' AND Orders.IdClient != '0000002'
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'Peter Doe' AND Client.Name != 'James Smith'
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice';
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice';
error: No SQL found in the input string
SELECT Title FROM book ORDER BY Title ASC;
SELECT Title FROM book ORDER BY Pages DESC
SELECT `Type`, `Release` FROM `book`
SELECT MAX(Chapters) AS Maximum_Chapters, MIN(Chapters) AS Minimum_Chapters FROM book
SELECT Title FROM book WHERE Type != 'Poet'
SELECT AVG(Rating) AS Average_Rating FROM review
SELECT `Title`, `Rating` FROM `book` JOIN `review` ON `book`.`Book_ID` = `review`.`Book_ID`
SELECT `Rating` FROM `review` WHERE `Book_ID` = (SELECT `Book_ID` FROM `book` WHERE `Chapters` = (SELECT MAX(`Chapters`) FROM `book`))
SELECT r.Rank FROM book b JOIN review r ON b.Book_ID = r.Book_ID WHERE b.Pages = (SELECT MIN(b2.Pages) FROM book b2)
SELECT Title FROM book JOIN review ON book.Book_ID = review.Book_ID WHERE review.Rank = (SELECT MAX(Rank) FROM review)
SELECT AVG(r.`Readers_in_Million`) as `Average_Readers_in_Million` FROM `book` b JOIN `review` r ON b.`Book_ID` = r.`Book_ID` WHERE b.`Type` = 'Novel'
SELECT `Type`, COUNT(*) FROM `book` GROUP BY `Type`
SELECT `Type`, COUNT(*) as `Count` FROM `book` GROUP BY `Type` ORDER BY `Count` DESC LIMIT 1;
SELECT b.Type FROM book AS b JOIN review AS r ON b.Book_ID = r.Book_ID GROUP BY b.Type HAVING COUNT(r.Review_ID) >= 3;
SELECT b.Title FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Rating ASC
SELECT `Title`, `Audio`, `Readers_in_Million` FROM `book` JOIN `review` ON `book`.`Book_ID` = `review`.`Book_ID` ORDER BY `Readers_in_Million` DESC
SELECT COUNT(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT `Type` FROM book WHERE `Chapters` > 75 AND `Chapters` < 50
SELECT COUNT(DISTINCT Type) FROM book
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
error: No SQL found in the input string
SELECT COUNT(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT `Name` FROM `customer` ORDER BY `Level_of_Membership` ASC
SELECT `Nationality`, `Card_Credit` FROM `customer`
SELECT `Nationality`, `Card_Credit` FROM `customer`
SELECT `Name` FROM `customer` WHERE `Nationality` IN ('England', 'Australia')
SELECT `Name` FROM `customer` WHERE `Nationality` IN ('England', 'Australia')
SELECT AVG(Card_Credit) as Average_Card_Credit FROM customer WHERE Level_of_Membership > 1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT `Card_Credit` FROM `customer` WHERE `Level_of_Membership` = (SELECT MAX(`Level_of_Membership`) FROM `customer`)
SELECT `Customer_ID`, `Card_Credit` FROM `customer` WHERE `Level_of_Membership` = (SELECT MAX(`Level_of_Membership`) FROM `customer`)
SELECT Nationality, COUNT(*) as Number_of_Customers FROM customer GROUP BY Nationality;
SELECT Nationality, COUNT(*) as Number_of_Customers FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(*) as NumberOfCustomers FROM customer GROUP BY Nationality ORDER BY NumberOfCustomers DESC LIMIT 1;
SELECT Nationality, COUNT(*) as NumberOfCustomers FROM customer GROUP BY Nationality ORDER BY NumberOfCustomers DESC LIMIT 1;
SELECT DISTINCT `Nationality` FROM `customer` WHERE `Card_Credit` < 50 INTERSECT SELECT DISTINCT `Nationality` FROM `customer` WHERE `Card_Credit` > 75
SELECT Nationality FROM customer WHERE Card_Credit > 50 AND Card_Credit < 75 GROUP BY Nationality HAVING COUNT(DISTINCT Customer_ID) = 2;
error: No SQL found in the input string
SELECT customer.Name, customer_order.Dish_Name FROM customer_order JOIN customer ON customer_order.Customer_ID = customer.Customer_ID;
SELECT customer.Name, customer_order.Dish_Name, customer_order.Quantity FROM customer_order JOIN customer ON customer_order.Customer_ID = customer.Customer_ID ORDER BY customer_order.Quantity DESC
SELECT customer.Name, customer_order.Dish_Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer_order JOIN customer ON customer_order.Customer_ID = customer.Customer_ID GROUP BY customer_order.Dish_Name ORDER BY Total_Quantity DESC
SELECT `Name`, SUM(`Quantity`) as `Total_Quantity` FROM `customer_order` JOIN `customer` ON `customer_order`.`Customer_ID` = `customer`.`Customer_ID` GROUP BY `customer`.`Customer_ID`
SELECT `customer`.`Name`, SUM(`customer_order`.`Quantity`) as `Total_Quantity` FROM `customer_order` JOIN `customer` ON `customer_order`.`Customer_ID` = `customer`.`Customer_ID` GROUP BY `customer`.`Name`
SELECT c.`Customer_ID`, c.`Name`, SUM(co.`Quantity`) as `Total_Quantity` FROM `customer` c JOIN `customer_order` co ON c.`Customer_ID` = co.`Customer_ID` GROUP BY c.`Customer_ID`, c.`Name` HAVING `Total_Quantity` > 1
SELECT customer.Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING SUM(customer_order.Quantity) > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT customer.Name FROM customer LEFT JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID WHERE customer_order.Customer_ID IS NULL
SELECT `Name` FROM `customer` WHERE `Customer_ID` NOT IN (SELECT DISTINCT `Customer_ID` FROM `customer_order`)
error: No SQL found in the input string
SELECT Name FROM member ORDER BY Age ASC
SELECT `Name`, `Nationality` FROM member WHERE `Age` = (SELECT MIN(Age) FROM member)
SELECT `Name` FROM member WHERE `Nationality` <> 'England'
SELECT `Name` FROM member WHERE Age IN (19, 20)
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality, COUNT(*) as Count FROM member GROUP BY Nationality ORDER BY Count DESC LIMIT 1;
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Nationality) >= 2
SELECT `Name`, `Club_Name` FROM club_leader JOIN club ON club_leader.`Club_ID` = club.`Club_ID` JOIN member ON club_leader.`Member_ID` = member.`Member_ID` WHERE `Year_Join` = (SELECT MIN(`Year_Join`) FROM club_leader)
SELECT m.Name FROM club c JOIN club_leader cl ON c.Club_ID = cl.Club_ID JOIN member m ON cl.Member_ID = m.Member_ID WHERE c.Overall_Ranking > 100
SELECT `Member_ID`, `Name` FROM `member` WHERE `Member_ID` IN (SELECT `Member_ID` FROM `club_leader` WHERE `Year_Join` < '2018');
SELECT `Team_Leader` FROM club WHERE Club_Name = 'Houston'
SELECT `Name` FROM member WHERE `Member_ID` NOT IN (SELECT `Member_ID` FROM club_leader)
SELECT DISTINCT T1.`Nationality` FROM member AS T1 JOIN club_leader AS T2 ON T1.`Member_ID` = T2.`Member_ID` WHERE T1.`Age` > 22 AND T1.`Age` < 20;
SELECT AVG(T1.`Age`) FROM member AS T1 JOIN club_leader AS T2 ON T1.`Member_ID` = T2.`Member_ID` JOIN club AS T3 ON T2.`Club_ID` = T3.`Club_ID`
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT Collection_Subset_ID, COUNT(*) as Document_Count FROM Collection_Subset_Members GROUP BY Collection_Subset_ID;
SELECT DISTINCT CS.`Collection_Subset_Name` FROM Collection_Subsets AS CS JOIN Collection_Subset_Members AS CSM ON CS.`Collection_Subset_ID` = CSM.`Collection_Subset_ID`
SELECT Collection_Subsets.Document_Subset_Details FROM Collection_Subsets JOIN Document_Subsets ON Collection_Subsets.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Collection_Subsets.Collection_Subset_Name = 'Top collection';
SELECT Collections.Collection_Name, Collections.Collection_Description FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Document_Subset_Members ON Document_Subset_Members.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Top collection';
SELECT Document_Subsets.Document_Subset_Name FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID;
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name LIKE '%Best for 2000%'
SELECT Document_Object_ID FROM Document_Objects;
SELECT Document_Objects.Document_Object_ID, Document_Subsets.Document_Subset_Name FROM Document_Subset_Members JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT `Document_Object_ID` FROM `Document_Objects` WHERE `Owner` = 'Marlin'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT D.Owner FROM Document_Objects D JOIN Documents_in_Collections DC ON D.Document_Object_ID = DC.Document_Object_ID WHERE D.Owner = 'Marlin'
SELECT D.`Description` FROM Document_Objects AS D JOIN Document_Subset_Members AS DS ON D.`Document_Object_ID` = DS.`Document_Object_ID` JOIN Document_Subsets AS DS2 ON DS.`Document_Subset_ID` = DS2.`Document_Subset_ID` WHERE DS2.`Document_Subset_Name` = 'Best for 2007'
SELECT D.`Description` FROM Document_Objects AS D JOIN Collections AS C ON D.`Parent_Document_Object_ID` = C.`Collection_ID`
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
error: No SQL found in the input string
SELECT D.`Document_Object_ID` FROM Document_Objects D WHERE D.`Parent_Document_Object_ID` NOT IN ( SELECT D2.`Parent_Document_Object_ID` FROM Document_Objects D2 WHERE D2.`Document_Object_ID` <> D.`Document_Object_ID` ) GROUP BY D.`Document_Object_ID` HAVING COUNT(*) = 1
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN ( SELECT Parent_Document_Object_ID FROM Document_Objects )
SELECT Document_Objects.Document_Object_ID, COUNT(*) as Child_Documents FROM Document_Objects JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID GROUP BY Document_Objects.Document_Object_ID
SELECT Document_Objects.Parent_Document_Object_ID, COUNT(*) as Child_Documents_Count FROM Document_Objects LEFT JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID GROUP BY Document_Objects.Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT D.`Document_Subset_Name` FROM Document_Objects AS D JOIN Document_Subset_Members AS SM ON D.`Document_Object_ID` = SM.`Related_Document_Object_ID` JOIN Document_Subsets AS S ON SM.`Document_Subset_ID` = S.`Document_Subset_ID`
SELECT Collections.Collection_Name, Collections.Collection_Description FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Collection_Subset_Members ON Collections.Collection_ID = Collection_Subset_Members.Collection_ID WHERE Collection_Subset_Members.Document_Subset_ID = ( SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2005' );
SELECT Collections.Collection_Description FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Objects.Description = 'Best'
error: No SQL found in the input string
SELECT Collections.Collection_Name FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID WHERE Collections.Collection_Name = 'Nice';
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Collections.Collection_Name FROM Collections WHERE Collections.Collection_ID NOT IN ( SELECT Collections.Collection_ID FROM Collections JOIN Collections AS C ON Collections.Parent_Collection_ID = C.Collection_ID )
SELECT D.`Document_Object_ID` FROM Document_Objects AS D JOIN ( SELECT DIC.`Document_Object_ID` FROM Documents_in_Collections AS DIC GROUP BY DIC.`Document_Object_ID` HAVING COUNT(*) > 1 ) AS C ON D.`Document_Object_ID` = C.`Document_Object_ID`
SELECT D1.`Document_Object_ID` FROM Documents_in_Collections AS D1 JOIN Document_Objects AS D2 ON D1.`Document_Object_ID` = D2.`Document_Object_ID` GROUP BY D1.`Document_Object_ID` HAVING COUNT(DISTINCT D2.`Document_Object_ID`) > 1
SELECT COUNT(*) FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best');
SELECT COUNT(*) FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT D.`Document_Object_ID` FROM Document_Objects AS D JOIN Documents_in_Collections AS DC ON D.`Document_Object_ID` = DC.`Document_Object_ID` WHERE D.`Owner` = 'Ransom'
SELECT Document_Objects.Document_Object_ID FROM Document_Objects JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Document_Objects.Owner = 'Ransom';
SELECT DSM.Document_Subset_ID, DSM.Document_Subset_ID AS Document_Subset_Name, COUNT(DISTINCT DC.Collection_ID) AS Number_of_Collections FROM Document_Subset_Members AS DSM JOIN Documents_in_Collections AS DC ON DSM.Document_Object_ID = DC.Document_Object_ID GROUP BY DSM.Document_Subset_ID, DSM.Document_Subset_ID;
SELECT DSM.`Document_Subset_ID`, DSM.`Document_Subset_Name`, COUNT(DOC.`Document_Object_ID`) AS `Number_of_Collections` FROM Document_Subset_Members AS DSMM JOIN Document_Subsets AS DSM ON DSMM.`Document_Subset_ID` = DSM.`Document_Subset_ID` JOIN Documents_in_Collections AS DOC ON DSMM.`Document_Object_ID` = DOC.`Document_Object_ID` GROUP BY DSM.`Document_Subset_ID`;
SELECT D.`Document_Object_ID`, COUNT(*) as `Number_of_Children` FROM Document_Objects D JOIN Documents_in_Collections DC ON D.`Document_Object_ID` = DC.`Document_Object_ID` GROUP BY D.`Document_Object_ID` ORDER BY `Number_of_Children` DESC LIMIT 1;
SELECT `Document_Objects`.`Document_Object_ID`, COUNT(*) as `Number_of_Children` FROM `Documents_in_Collections` JOIN `Document_Objects` ON `Documents_in_Collections`.`Document_Object_ID` = `Document_Objects`.`Document_Object_ID` GROUP BY `Document_Objects`.`Document_Object_ID`;
SELECT Document_Objects.Document_Object_ID, COUNT(*) as Related_Documents_Count FROM Document_Objects JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID GROUP BY Document_Objects.Document_Object_ID ORDER BY Related_Documents_Count LIMIT 1;
SELECT Document_Objects.Document_Object_ID FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID GROUP BY Document_Objects.Document_Object_ID, Document_Objects.Parent_Document_Object_ID, Document_Objects.Owner, Document_Objects.Description, Document_Objects.Other_Details HAVING COUNT(*) = ( SELECT COUNT(*) FROM Document_Subset_Members WHERE Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID GROUP BY Document_Objects.Document_Object_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Document_Objects.Document_Object_ID, COUNT(Documents_in_Collections.Document_Object_ID) as Number_of_Related_Documents FROM Document_Objects LEFT JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID GROUP BY Document_Objects.Document_Object_ID HAVING COUNT(Documents_in_Collections.Document_Object_ID) BETWEEN 2 AND 4
SELECT D.`Document_Object_ID`, COUNT(*) as `Number_of_Related_Documents` FROM Document_Objects D JOIN Documents_in_Collections DC ON D.`Document_Object_ID` = DC.`Document_Object_ID` JOIN Document_Objects RD ON DC.`Document_Object_ID` = RD.`Parent_Document_Object_ID` WHERE D.`Document_Object_ID` IN ( SELECT DSM.`Related_Document_Object_ID` FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.`Document_Subset_ID` = DS.`Document_Subset_ID` GROUP BY DSM.`Related_Document_Object_ID` HAVING COUNT(*) BETWEEN 2 AND 4 ) GROUP BY D.`Document_Object_ID`
SELECT D.Owner FROM Document_Objects AS D JOIN Documents_in_Collections AS DC ON D.Document_Object_ID = DC.Document_Object_ID JOIN Collections AS C ON DC.Collection_ID = C.Collection_ID WHERE D.Owner = 'Braeden'
SELECT DISTINCT Document_Objects.Owner FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID JOIN Document_Subset_Members ON Document_Objects.Document_Object_ID = Document_Subset_Members.Related_Document_Object_ID WHERE Document_Objects.Owner = 'Braeden' AND Document_Objects.Parent_Document_Object_ID IS NOT NULL
SELECT Document_Subset_Name FROM Document_Subset_Members JOIN Document_Objects ON Document_Objects.Document_Object_ID = Document_Subset_Members.Related_Document_Object_ID JOIN Collections ON Collections.Collection_ID = Document_Subset_Members.Collection_ID WHERE Document_Objects.Owner = 'Braeden'
SELECT DISTINCT DS.`Document_Subset_Name` FROM `Document_Subset_Members` AS DSM JOIN `Document_Subsets` AS DS ON DSM.`Document_Subset_ID` = DS.`Document_Subset_ID` JOIN `Collections` AS C ON DSM.`Collection_ID` = C.`Collection_ID` AND C.`Owner` = 'Braeden'
SELECT Document_Subset_ID_old, Document_Subset_Name, COUNT(*) as NumberOfDocuments FROM Document_Subset_Members JOIN Document_Objects ON Document_Objects.Document_Object_ID = Document_Subset_Members.Related_Document_Object_ID JOIN Document_Subsets ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID_old GROUP BY Document_Subset_ID_old, Document_Subset_Name;
SELECT DSM.`Document_Subset_ID`, DSM.`Document_Subset_Name`, COUNT(DISTINCT DO.`Document_Object_ID`) AS `Number_of_Documents` FROM Document_Subset_Members AS DSMM JOIN Document_Subsets AS DSM ON DSMM.`Document_Subset_ID` = DSM.`Document_Subset_ID` JOIN Document_Objects AS DO ON DSMM.`Related_Document_Object_ID` = DO.`Document_Object_ID` GROUP BY DSM.`Document_Subset_ID`, DSM.`Document_Subset_Name`
SELECT Document_Subset_ID_old, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) as Number_of_Documents FROM Document_Subset_Members JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID GROUP BY Document_Subset_ID_old, Document_Subset_Name ORDER BY Number_of_Documents DESC LIMIT 1
SELECT DSM.`Document_Subset_ID`, DSN.`Document_Subset_Name`, COUNT(DO.`Document_Object_ID`) AS `Number_of_Documents` FROM `Document_Subset_Members` AS DSM JOIN `Document_Objects` AS DO ON DSM.`Document_Object_ID` = DO.`Document_Object_ID` JOIN `Document_Subsets` AS DSN ON DSM.`Document_Subset_ID` = DSN.`Document_Subset_ID` GROUP BY DSM.`Document_Subset_ID` ORDER BY COUNT(DO.`Document_Object_ID`) DESC LIMIT 1;
SELECT D.`Document_Object_ID` FROM Document_Subset_Members AS MSM JOIN Document_Subsets AS DS ON MSM.`Document_Subset_ID` = DS.`Document_Subset_ID` JOIN Document_Objects AS D ON MSM.`Related_Document_Object_ID` = D.`Document_Object_ID` WHERE DS.`Document_Subset_Name` = 'Best for 2000';
SELECT D.`Document_Object_ID` FROM Document_Subset_Members AS MS JOIN Document_Subsets AS DS ON MS.`Document_Subset_ID` = DS.`Document_Subset_ID` JOIN Document_Objects AS D ON MS.`Related_Document_Object_ID` = D.`Document_Object_ID` WHERE DS.`Document_Subset_Name` = 'Best for 2000'
SELECT Document_Subsets.Document_Subset_Name, Document_Objects.Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID JOIN Document_Objects ON Document_Subset_Members.Related_Document_Object_ID = Document_Objects.Document_Object_ID JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID
SELECT DSM.Document_Subset_ID, DSM.Document_Subset_Name, D.Document_Object_ID FROM Document_Subsets AS DSM JOIN Document_Objects AS D ON DSM.Document_Object_ID = D.Parent_Document_Object_ID GROUP BY DSM.Document_Subset_ID
SELECT Collections.Collection_Name FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Objects.Owner = 'Ransom'
SELECT Collections.Collection_Name FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Objects.Owner = 'Ransom';
SELECT Document_Objects.Document_Object_ID, COUNT(*) as Number_of_Collections FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID GROUP BY Document_Objects.Document_Object_ID;
SELECT D.`Document_Object_ID`, COUNT(*) as `Number_of_Collections` FROM Documents_in_Collections AS D JOIN Collections AS C ON D.`Collection_ID` = C.`Collection_ID` GROUP BY D.`Document_Object_ID`
SELECT COUNT(*) FROM Documents_in_Collections AS di JOIN Collections AS c ON di.Collection_ID = c.Collection_ID JOIN Collection_Subset_Members AS csm ON c.Collection_ID = csm.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(*) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT Document_Objects.Document_Object_ID FROM Documents_in_Collections INNER JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Document_Objects.Document_Object_ID) FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT C.`Collection_Name`, C.`Collection_ID`, COUNT(DISTINCT D.`Document_Object_ID`) as `Number_of_Documents` FROM Collections as C JOIN Documents_in_Collections as D ON C.`Collection_ID` = D.`Collection_ID` GROUP BY C.`Collection_ID` ORDER BY `Number_of_Documents` DESC LIMIT 1
SELECT Collection_Name, Collection_ID, COUNT(*) as Number_of_Documents FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID WHERE Collections.Collection_Name = 'Best' GROUP BY Collection_ID ORDER BY Number_of_Documents DESC LIMIT 1
SELECT D.`Document_Object_ID` FROM Document_Subsets AS DS JOIN Document_Subset_Members AS DSM ON DS.`Document_Subset_ID` = DSM.`Document_Subset_ID` JOIN Document_Objects AS D ON DSM.`Related_Document_Object_ID` = D.`Document_Object_ID` JOIN Documents_in_Collections AS DC ON D.`Document_Object_ID` = DC.`Document_Object_ID` JOIN Collections AS C ON DC.`Collection_ID` = C.`Collection_ID` WHERE DS.`Document_Subset_Name` = 'Best for 2000' AND C.`Collection_Name` = 'Best'
SELECT Document_Object_ID FROM ( SELECT Document_Objects.Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000' ) INTERSECT SELECT Document_Object_ID FROM ( SELECT Document_Objects.Document_Object_ID FROM Collection_Subset_Members JOIN Collection_Subsets ON Collection_Subset_Members.Collection_Subset_ID = Collection_Subsets.Collection_Subset_ID JOIN Document_Objects ON Collection_Subset_Members.Related_Document_Object_ID = Document_Objects.Document_Object_ID WHERE Collection_Subsets.Collection_Subset_Name = 'Best' );
SELECT D.`Document_Object_ID` FROM Document_Objects AS D JOIN Documents_in_Collections AS DC ON D.`Document_Object_ID` = DC.`Document_Object_ID` JOIN Collections AS C ON DC.`Collection_ID` = C.`Collection_ID` WHERE C.`Collection_Name` = 'Best' AND NOT EXISTS ( SELECT 1 FROM Document_Subset_Members AS DS JOIN Document_Subsets AS DS2 ON DS.`Document_Subset_ID` = DS2.`Document_Subset_ID` WHERE DS2.`Document_Subset_Name` = 'Best for 2000' AND DS.`Document_Object_ID` = D.`Document_Object_ID` )
SELECT D.`Document_Object_ID` FROM Document_Objects AS D WHERE D.`Owner` = 'Braeden' AND D.`Description` = 'Braeden Collection' AND D.`Document_Object_ID` NOT IN ( SELECT DS.`Document_Subset_ID` FROM Document_Subsets AS DS WHERE DS.`Document_Subset_Name` = 'Best for 2000' )
SELECT D.`Document_Object_ID` FROM Document_Subsets AS DS JOIN Document_Subset_Members AS DSM ON DS.`Document_Subset_ID` = DSM.`Document_Subset_ID` JOIN Document_Objects AS D ON DSM.`Document_Object_ID` = D.`Document_Object_ID` JOIN Collections AS C ON DSM.`Collection_ID` = C.`Collection_ID` WHERE DS.`Document_Subset_Name` = 'Best for 2000' OR C.`Collection_Name` = 'Best'
SELECT DISTINCT D.`Document_Object_ID` FROM Document_Subset_Members AS MS JOIN Document_Subsets AS DS ON MS.`Document_Subset_ID` = DS.`Document_Subset_ID` JOIN Document_Objects AS D ON MS.`Document_Object_ID` = D.`Document_Object_ID` WHERE DS.`Document_Subset_Name` = 'Best for 2000' OR D.`Collection_Name` = 'Best'
SELECT C.`Collection_Name` FROM Collections AS C JOIN Documents_in_Collections AS D ON C.`Collection_ID` = D.`Collection_ID` WHERE D.`Document_Object_ID` IN ( SELECT D.`Document_Object_ID` FROM Document_Objects AS D WHERE D.`Description` = 'Best' )
SELECT Collections.Collection_Name FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Objects.Description = 'Best';
SELECT COUNT(*) FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Collections.Collection_ID) FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT Collection_Subset_Name FROM Collection_Subset_Members JOIN Collections ON Collection_Subset_Members.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best';
SELECT Collection_Subset_Name FROM Collection_Subset_Members JOIN Collections ON Collection_Subset_Members.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
error: No SQL found in the input string
SELECT `name` FROM `songs` ORDER BY `name` ASC
SELECT `name`, `language` FROM songs
SELECT MAX(voice_sound_quality) AS Maximum_Voice_Sound_Quality, MIN(voice_sound_quality) AS Minimum_Voice_Sound_Quality FROM performance_score;
error: No SQL found in the input string
SELECT id, language, original_artist FROM songs WHERE name != 'Love'
SELECT `name`, `original_artist` FROM songs WHERE `english_translation` = 'All the streets of love';
SELECT DISTINCT `stage_presence` FROM `performance_score` INNER JOIN `songs` ON `performance_score`.`songs_id` = `songs`.`id` WHERE `songs`.`language` = 'English'
SELECT participants.id, participants.name FROM participants JOIN ( SELECT participant_id FROM performance_score GROUP BY participant_id HAVING COUNT(songs_id) >= 2 ) AS performances ON participants.id = performances.participant_id
SELECT participants.id, participants.name, participants.popularity FROM participants JOIN (SELECT performance_score.participant_id, COUNT(*) as song_count FROM performance_score GROUP BY performance_score.participant_id) as song_counts ON participants.id = song_counts.participant_id ORDER BY song_counts.song_count DESC;
SELECT id, name FROM participants WHERE id IN ( SELECT participant_id FROM performance_score WHERE voice_sound_quality = 5 OR rhythm_tempo = 5 )
SELECT `voice_sound_quality` FROM `performance_score` INNER JOIN `songs` ON `performance_score`.`songs_id` = `songs`.`id` WHERE `songs`.`name` = 'The Balkan Girls' AND `songs`.`language` = 'English';
SELECT songs.id, songs.name FROM songs JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY songs.id ORDER BY COUNT(performance_score.participant_id) DESC LIMIT 1;
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(*) FROM songs s LEFT JOIN performance_score ps ON s.id = ps.songs_id WHERE ps.songs_id IS NULL
SELECT language, AVG(rhythm_tempo) as average_rhythm_score FROM songs JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY language
SELECT DISTINCT name FROM participants WHERE id IN ( SELECT participant_id FROM performance_score WHERE songs_id IN ( SELECT id FROM songs WHERE language = 'English' ) );
SELECT `name`, `popularity` FROM `participants` WHERE `id` IN ( SELECT `participant_id` FROM `performance_score` WHERE `songs_id` IN ( SELECT `id` FROM `songs` WHERE `language` = 'Croatian' ) ) AND `id` IN ( SELECT `participant_id` FROM `performance_score` WHERE `songs_id` IN ( SELECT `id` FROM `songs` WHERE `language` = 'English' ) )
SELECT `name` FROM `songs` WHERE `name` LIKE '%Is%'
SELECT `original_artist`, AVG(`voice_sound_quality`) as `avg_voice_sound_quality` FROM `songs` JOIN `performance_score` ON `songs`.`id` = `performance_score`.`songs_id` WHERE `songs`.`rhythm_tempo` > 5 GROUP BY `original_artist` ORDER BY `avg_voice_sound_quality` DESC
SELECT COUNT(*) FROM City
SELECT S.Song_Name, S.Song_release_year FROM my_database.Singer AS S WHERE S.Age = (SELECT MIN(S.Age) FROM my_database.Singer AS S)
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City;
SELECT COUNT(DISTINCT country) FROM City;
SELECT Major, AVG(Age) FROM Student GROUP BY Major
error: No SQL found in the input string
SELECT city_name, city_code, state, country FROM City;
SELECT `latitude`, `longitude` FROM `City` WHERE `city_name` = 'Baltimore';
SELECT `latitude`, `longitude` FROM `City` WHERE `city_name` = 'Baltimore';
SELECT `city_name` FROM `City` WHERE `state` = 'PA'
SELECT city_name FROM City WHERE state = 'PA'
SELECT COUNT(*) FROM City WHERE country = 'CANADA'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT `city_name` FROM `City` WHERE `country` = 'USA' ORDER BY `latitude`
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude;
-- Show all states and number of cities in each state. SELECT c.state, COUNT(c.city_code) as city_count FROM City c GROUP BY c.state;
SELECT state, COUNT(city_code) as number_of_cities FROM City GROUP BY state;
SELECT `Major`, COUNT(`StuID`) as `Number_of_Students` FROM Student GROUP BY `Major`
SELECT country, COUNT(city_code) as num_cities FROM City GROUP BY country
SELECT DISTINCT City.state FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code GROUP BY City.state HAVING COUNT(DISTINCT City.city_code) >= 2
SELECT DISTINCT state FROM City WHERE city_code IN ( SELECT city2_code FROM Direct_distance GROUP BY city2_code HAVING COUNT(city1_code) >= 2 )
SELECT City.state, COUNT(*) as city_count FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code GROUP BY City.state ORDER BY city_count DESC LIMIT 1;
SELECT state FROM City GROUP BY state ORDER BY COUNT(city_code) DESC LIMIT 1;
SELECT Country, COUNT(city_code) as NumberOfCities FROM City GROUP BY Country ORDER BY NumberOfCities LIMIT 1;
SELECT `country`, COUNT(`city_code`) as `number_of_cities` FROM `City` GROUP BY `country` ORDER BY `number_of_cities` LIMIT 1;
SELECT `Fname`, `LName` FROM `Student` WHERE `city_code` IN (SELECT `city_code` FROM `City` WHERE `state` = 'MD')
SELECT Fname, LName FROM Student WHERE city_code IN (SELECT city_code FROM City WHERE state = 'MD');
SELECT COUNT(*) FROM Student WHERE city_code IN (SELECT city_code FROM City WHERE country = 'China')
SELECT COUNT(*) FROM Student WHERE city_code IN (SELECT city_code FROM City WHERE country = 'China')
SELECT `Fname`, `Major` FROM `Student` WHERE `city_code` = (SELECT `city_code` FROM `City` WHERE `city_name` = 'Baltimore')
SELECT `Fname`, `Major` FROM `Student` WHERE `city_code` = (SELECT `city_code` FROM `City` WHERE `city_name` = 'Baltimore');
error: No SQL found in the input string
SELECT C.city_name, COUNT(S.StuID) as `Number_of_Students` FROM Student S JOIN City C ON S.city_code = C.city_code GROUP BY C.city_name;
error: No SQL found in the input string
SELECT City.city_name, COUNT(Student.StuID) as NumberOfStudents FROM Student JOIN Direct_distance ON Student.city_code = Direct_distance.city1_code JOIN City ON Direct_distance.city2_code = City.city_code GROUP BY City.city_name;
SELECT City.state, COUNT(Student.StuID) as num_students FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.state ORDER BY num_students DESC LIMIT 1;
SELECT `City`.`state`, COUNT(`Student`.`StuID`) as `Number of Students` FROM `Student` JOIN `City` ON `Student`.`city_code` = `City`.`city_code` GROUP BY `City`.`state` ORDER BY `Number of Students` DESC LIMIT 1
SELECT City.country, COUNT(Student.StuID) as NumberOfStudents FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.country HAVING COUNT(Student.StuID) = ( SELECT MIN(NumberOfStudents) FROM ( SELECT COUNT(Student.StuID) as NumberOfStudents FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.country ) )
SELECT City.country, COUNT(Student.StuID) as student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.country ORDER BY student_count ASC LIMIT 1;
SELECT S.`Fname`, S.`LName`, S.`Age`, S.`Sex`, S.`Major`, S.`Advisor`, S.`city_code` FROM Student S WHERE S.`Age` = (SELECT MIN(Age) FROM Student)
SELECT C.city_name FROM City C WHERE (SELECT COUNT(*) FROM Student S WHERE S.city_code = C.city_code) >= 3;
SELECT `state`, COUNT(*) as `Number_of_Students` FROM `Student` GROUP BY `state` HAVING COUNT(*) > 5
SELECT City.state, COUNT(Student.StuID) as student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.state HAVING COUNT(Student.StuID) > 5
SELECT StuID FROM Student WHERE city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA')
SELECT StuID FROM Student WHERE city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA')
SELECT StuID FROM Student WHERE Sex = 'F' AND city_code IN (SELECT city_code FROM City WHERE state = 'PA')
SELECT StuID FROM Student WHERE Sex = 'F' AND city_code IN (SELECT city_code FROM City WHERE state = 'PA');
SELECT StuID FROM Student WHERE Sex = 'M' AND city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA')
SELECT StuID FROM Student WHERE Sex = 'M' AND city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA');
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT `distance` FROM `Direct_distance` WHERE `city1_code` = 'BAL' AND `city2_code` = 'CHI'
SELECT Direct_distance.distance FROM Direct_distance JOIN City ON Direct_distance.city2_code = City.city_code WHERE City.city_name = 'Newark' AND City.city_name = 'Boston'
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark');
SELECT AVG(distance) AS Average_Distance, MIN(distance) AS Min_Distance, MAX(distance) AS Max_Distance FROM Direct_distance JOIN City ON Direct_distance.city2_code = City.city_code AND Direct_distance.city1_code = City.city_code;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT city1_code FROM Direct_distance WHERE distance = ( SELECT MAX(distance) FROM Direct_distance );
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT city_code FROM City WHERE city_code IN ( SELECT city2_code FROM Direct_distance WHERE distance > ( SELECT AVG(distance) FROM Direct_distance ) )
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000
SELECT City.city_code FROM Direct_distance JOIN City ON Direct_distance.city2_code = City.city_code WHERE Direct_distance.distance < 1000
SELECT SUM( SELECT (6371 * acos( cos(radians(t1.latitude)) * cos(radians(t2.latitude)) * cos(radians(t2.longitude) - radians(t1.longitude)) + sin(radians(t1.latitude)) * sin(radians(t2.latitude)) )) FROM City t1, City t2 WHERE t1.city_name = 'BAL' AND t2.city_name = 'San Francisco' ) AS total_distance
SELECT SUM(distance) as Total_Distance FROM Direct_distance JOIN City ON Direct_distance.city2_code = City.city_code WHERE city_name = 'BAL';
SELECT SUM(distance) / COUNT(*) as average_distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(distance) as Average_Distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code != (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT city_name FROM City WHERE city_code = ( SELECT city_code FROM City WHERE latitude = ( SELECT MIN(latitude) FROM City WHERE city_name = 'Chicago' ) )
SELECT city_name FROM City WHERE city_code = ( SELECT city2_code FROM Direct_distance WHERE distance = ( SELECT MIN(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ) )
SELECT city_name FROM City WHERE city_code = ( SELECT city2_code FROM Direct_distance WHERE distance = ( SELECT MAX(distance) FROM Direct_distance WHERE city1_code = ( SELECT city_code FROM City WHERE city_name = 'Boston' ) ) );
SELECT City.city_name FROM City WHERE city_code = ( SELECT city2_code FROM Direct_distance WHERE distance = ( SELECT MAX(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ) )
SELECT city_code, SUM(distance) as total_distance FROM Direct_distance GROUP BY city_code;
SELECT T1.`city_code`, SUM(T2.`distance`) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.`city_code` = T2.`city1_code` OR T1.`city_code` = T2.`city2_code` GROUP BY T1.`city_code`
error: No SQL found in the input string
SELECT City.city_name, AVG(Direct_distance.distance) as average_distance FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code GROUP BY City.city_name
SELECT SUM(distance) as 'Distance' FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city2_code = (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim');
SELECT (6371 * acos(cos(radians(latitude1)) * cos(radians(latitude2)) * cos(radians(longitude2) - radians(longitude1)) + sin(radians(latitude1)) * sin(radians(latitude2)))) AS distance FROM (SELECT latitude AS latitude1, longitude AS longitude1, (SELECT latitude FROM City WHERE city_name = 'Toronto') AS latitude2, (SELECT longitude FROM City WHERE city_name = 'Toronto') AS longitude2 FROM Student, City WHERE Fname = 'Tracy' AND LName = 'Kim' AND Student.city_code = City.city_code)
SELECT Fname, LName FROM Student WHERE Age = ( SELECT MAX(Age) FROM Student WHERE Age < (SELECT Age FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') ) AND Fname <> 'Linda' AND LName <> 'Smith'
SELECT S.Fname, S.LName FROM Student S JOIN City C ON S.city_code = C.city_code WHERE ( SELECT C1.city_code FROM ( SELECT C1.city_code, (6371 * acos(cos(radians(C.latitude)) * cos(radians(C1.latitude)) * cos(radians(C1.longitude) - radians(C.longitude)) + sin(radians(C.latitude)) * sin(radians(C1.latitude)))) AS distance FROM City C JOIN Direct_distance D ON C.city_code = D.city_2_code WHERE C.city_name = 'Linda Smith' ) AS subquery ORDER BY distance ASC LIMIT 1 ) = S.city_code
SELECT City.state FROM City JOIN Student ON City.city_code = Student.city_code WHERE Student.Fname = 'Linda';
SELECT City.state FROM City JOIN Student ON City.city_code = Student.city_code WHERE Student.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT name FROM Sailors WHERE age > 30
SELECT `name`, `age` FROM `Sailors` WHERE `age` < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT Boats.name FROM Boats INNER JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = (SELECT sid FROM Sailors WHERE sid = 1);
SELECT bid FROM Reserves WHERE sid = 1;
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 102;
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 102;
SELECT DISTINCT bid FROM Reserves
SELECT bid FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE age = (SELECT MIN(age) FROM Sailors))
SELECT name FROM Sailors WHERE name LIKE '%e%';
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT DISTINCT sid FROM Sailors WHERE age > (SELECT MAX(age) FROM Sailors)
SELECT sid FROM Sailors WHERE age < (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT S1.name FROM Sailors AS S1 WHERE S1.age > (SELECT MAX(S2.rating) FROM Sailors AS S2 WHERE S2.rating > 7)
SELECT S1.name FROM Sailors AS S1 JOIN Reserves AS R1 ON S1.sid = R1.sid JOIN Boats AS B1 ON R1.bid = B1.bid WHERE S1.age > (SELECT S2.age FROM Sailors AS S2 WHERE S2.rating > 7) GROUP BY S1.name;
SELECT Sailors.sid, Sailors.name FROM Sailors WHERE Sailors.sid IN (SELECT Reserves.sid FROM Reserves GROUP BY Reserves.sid HAVING COUNT(DISTINCT Reserves.bid) > 0)
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid GROUP BY Sailors.sid HAVING COUNT(DISTINCT Reserves.bid) > 0
SELECT S.sid, S.name FROM Sailors AS S JOIN ( SELECT R.sid FROM Reserves AS R GROUP BY R.sid HAVING COUNT(DISTINCT R.bid) > 1 ) AS T ON S.sid = T.sid
SELECT S1.name FROM Sailors AS S1 JOIN (SELECT sid, COUNT(*) as cnt FROM Reserves GROUP BY sid HAVING COUNT(*) >= 2) AS S2 ON S1.sid = S2.sid
SELECT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue') GROUP BY Sailors.sid ORDER BY COUNT(DISTINCT Boats.color) DESC LIMIT 1
SELECT DISTINCT sid FROM Reserves INNER JOIN Boats ON Reserves.bid = Boats.bid WHERE color IN ('red', 'blue');
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue');
SELECT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT sid FROM Sailors WHERE age = (SELECT MIN(age) FROM Sailors) AND name IN (SELECT name FROM Boats WHERE color = 'red' OR color = 'blue');
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue');
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT Sailors.sid, Sailors.name FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT S.sid, S.name FROM Sailors AS S WHERE S.sid NOT IN (SELECT R.sid FROM Reserves AS R)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103;
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name != 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name <> 'Luis')
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Sailors.rating > ( SELECT Sailors.rating FROM Sailors WHERE Sailors.name = 'Luis' )
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name != 'Luis')
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Sailors.rating > 2
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Sailors.rating >= 3
SELECT `name`, `age` FROM Sailors WHERE `age` = (SELECT MAX(age) FROM Sailors)
SELECT `name`, `age` FROM `Sailors` WHERE `age` = (SELECT MAX(`age`) FROM `Sailors`);
SELECT COUNT(*) FROM Sailors
SELECT COUNT(*) FROM Sailors
SELECT AVG(Sailors.age) FROM Sailors WHERE Sailors.rating = 7
SELECT SUM(age) / COUNT(*) AS average_age FROM Sailors WHERE rating = 7
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating) as Average_Rating, MAX(age) as Max_Age FROM Sailors
SELECT AVG(rating) as Average_Rating, MAX(age) as Largest_Age FROM Sailors
SELECT Boats.name, COUNT(*) as NumberOfReservations FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Boats.name
SELECT Boats.name, COUNT(*) as number_of_reservations FROM Boats LEFT JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.name
SELECT COUNT(*) FROM Reserves WHERE bid > 50
SELECT COUNT(*) FROM Reserves WHERE bid > 50
SELECT Boats.name, COUNT(*) as Number_of_Reservations FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.bid HAVING COUNT(*) > 1
SELECT Boats.name, COUNT(*) as reservations_count FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.bid HAVING COUNT(*) > 1
SELECT Boats.name, COUNT(*) as num_reservations FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Sailors.sid > 1 GROUP BY Boats.name
SELECT Boats.name, COUNT(*) FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.sid > 1 GROUP BY Reserves.bid, Boats.name;
SELECT Sailors.rating, AVG(Sailors.age) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' GROUP BY Sailors.rating;
SELECT Sailors.rating, AVG(Sailors.age) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' GROUP BY Sailors.rating
SELECT name, rating, age FROM Sailors ORDER BY rating ASC, age ASC
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age BETWEEN 20 AND 30
SELECT Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age BETWEEN 20 AND 30
SELECT Sailors.name FROM Sailors WHERE Sailors.rating > (SELECT AVG(Sailors.rating) FROM Sailors INNER JOIN Reserves ON Sailors.sid = Reserves.sid INNER JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red')
SELECT Sailors.name FROM Sailors WHERE Sailors.rating > ( SELECT MAX(Reserves.bid) FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' )
SELECT MAX(rating) as Highest_Rating FROM Sailors
SELECT MAX(rating) as Maximum_Rating FROM Sailors
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon';
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon';
SELECT `name`, `age` FROM `Sailors` ORDER BY `rating` DESC
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT `Model` FROM `headphone` WHERE `Price` = (SELECT MAX(`Price`) FROM `headphone`)
SELECT `Model` FROM `headphone` WHERE `Price` = (SELECT MAX(`Price`) FROM `headphone`)
SELECT DISTINCT `Model` FROM `headphone` ORDER BY `Model` ASC;
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC;
SELECT `Class`, COUNT(*) as count FROM `headphone` GROUP BY `Class` ORDER BY count DESC LIMIT 1;
SELECT Class, COUNT(*) as NumberOfHeadphones FROM headphone GROUP BY Class ORDER BY NumberOfHeadphones DESC LIMIT 1;
SELECT `Class`, COUNT(*) FROM `headphone` WHERE `Class` IN ( SELECT `Class` FROM `headphone` GROUP BY `Class` HAVING COUNT(*) > 2 ) GROUP BY `Class`;
SELECT `Class` FROM headphone WHERE `Class` NOT IN ( SELECT `Class` FROM headphone GROUP BY `Class` HAVING COUNT(*) > 2 )
SELECT `Class`, COUNT(*) FROM `headphone` WHERE `Price` > 200 GROUP BY `Class`
SELECT `Class`, SUM(`Price`) FROM `headphone` WHERE `Price` > 200 GROUP BY `Class`
SELECT COUNT(DISTINCT Earpads) as Number_of_Earpads FROM headphone;
SELECT COUNT(DISTINCT `Earpads`) FROM `headphone`
SELECT `Earpads`, COUNT(*) as `Count` FROM `headphone` GROUP BY `Earpads` ORDER BY `Count` DESC LIMIT 2
SELECT `Earpads`, COUNT(*) as `Number_of_Headphones` FROM headphone GROUP BY `Earpads` ORDER BY `Number_of_Headphones` DESC LIMIT 2;
SELECT `Model`, `Class`, `Construction` FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT `Model`, `Class`, `Construction` FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT `Class`, AVG(`Price`) AS `Average_Price` FROM `headphone` GROUP BY `Class`
SELECT `Construction`, AVG(`Price`) FROM `headphone` GROUP BY `Construction`
SELECT DISTINCT H1.`Class` FROM headphone AS H1 JOIN headphone AS H2 ON H1.`Class` = H2.`Class` WHERE H1.`Earpads` = 'Bowls' AND H2.`Earpads` = 'Comfort Pads'
SELECT DISTINCT H.`Class` FROM headphone AS H JOIN stock AS S ON H.`Headphone_ID` = S.`Headphone_ID` JOIN store AS ST ON S.`Store_ID` = ST.`Store_ID` WHERE H.`Earpads` = 'Bowls' AND ST.`Parking` = 'n/a'
SELECT `Earpads` FROM `headphone` WHERE `Construction` = 'Hand-Crafted Mahogany / Aluminum';
SELECT `Earpads` FROM `headphone` WHERE `Construction` = 'Hand-Crafted Mahogany / Aluminum'
SELECT `Model` FROM `headphone` WHERE `Price` < (SELECT AVG(`Price`) FROM `headphone`)
SELECT `Model` FROM `headphone` WHERE `Price` < (SELECT AVG(`Price`) FROM `headphone`)
SELECT `Name`, `Date_Opened` FROM `store` ORDER BY `Date_Opened`
SELECT `Name`, `Date_Opened` FROM `store` ORDER BY `Date_Opened`
SELECT `Name`, `Parking` FROM `store` WHERE `Neighborhood` = 'Tarzana'
SELECT `Name`, `Parking` FROM `store` WHERE `Neighborhood` = 'Tarzana'
SELECT COUNT(DISTINCT Neighborhood) as Number_of_Neighborhoods FROM store
SELECT COUNT(DISTINCT `Neighborhood`) FROM `store`
SELECT `Neighborhood`, COUNT(*) as `Number_of_Stores` FROM `store` GROUP BY `Neighborhood`
SELECT `Neighborhood`, COUNT(*) as `Number_of_Stores` FROM `store` GROUP BY `Neighborhood`
SELECT S.`Name`, COUNT(*) as `Number_of_Headphones` FROM store AS S JOIN stock AS STO ON S.`Store_ID` = STO.`Store_ID` JOIN headphone AS H ON STO.`Headphone_ID` = H.`Headphone_ID` GROUP BY S.`Store_ID` ORDER BY `Number_of_Headphones` DESC LIMIT 1;
SELECT T1.`Name`, SUM(T2.`Quantity`) FROM store AS T1 JOIN stock AS T2 ON T1.`Store_ID` = T2.`Store_ID` GROUP BY T1.`Store_ID`
SELECT store.Name FROM store WHERE store.Store_ID NOT IN ( SELECT stock.Store_ID FROM stock INNER JOIN headphone ON stock.Headphone_ID = headphone.Headphone_ID )
SELECT store.Name FROM store WHERE store.Store_ID NOT IN ( SELECT stock.Store_ID FROM stock INNER JOIN headphone ON stock.Headphone_ID = headphone.Headphone_ID )
SELECT H.Model FROM headphone H WHERE H.Model NOT IN (SELECT S.Headphone_ID FROM stock S)
SELECT DISTINCT H.`Model` FROM headphone AS H WHERE H.`Headphone_ID` NOT IN (SELECT S.`Headphone_ID` FROM stock AS S)
SELECT `headphone`.`Model`, SUM(`stock`.`Quantity`) as `Total_Quantity` FROM `stock` JOIN `headphone` ON `stock`.`Headphone_ID` = `headphone`.`Headphone_ID` GROUP BY `headphone`.`Model` ORDER BY `Total_Quantity` DESC LIMIT 1;
SELECT H.`Model`, SUM(S.`Quantity`) as Total_Quantity FROM headphone as H JOIN stock as S ON H.`Headphone_ID` = S.`Headphone_ID` GROUP BY H.`Headphone_ID` ORDER BY Total_Quantity DESC LIMIT 1;
SELECT COUNT(*) FROM stock WHERE Store_ID = (SELECT Store_ID FROM store WHERE Name = 'Woodman') AND Headphone_ID = (SELECT Headphone_ID FROM headphone)
SELECT SUM(T1.`Quantity`) FROM stock AS T1 JOIN store AS T2 ON T1.`Store_ID` = T2.`Store_ID` JOIN headphone AS T3 ON T1.`Headphone_ID` = T3.`Headphone_ID` WHERE T2.`Name` = 'Woodman'
SELECT `Neighborhood` FROM `store` WHERE `Store_ID` NOT IN (SELECT `Store_ID` FROM `stock`)
SELECT store.Neighborhood FROM store WHERE store.Store_ID NOT IN (SELECT stock.Store_ID FROM stock JOIN headphone ON stock.Headphone_ID = headphone.Headphone_ID) GROUP BY store.Neighborhood
error: No SQL found in the input string
SELECT `Author`.`name`, `Affiliation`.`address` FROM `Author` JOIN `Author_list` ON `Author`.`author_id` = `Author_list`.`author_id` JOIN `Affiliation` ON `Author_list`.`affiliation_id` = `Affiliation`.`affiliation_id` WHERE `Author_list`.`affiliation_id` = ( SELECT `affiliation_id` FROM `Author_list` GROUP BY `affiliation_id` ORDER BY COUNT(`author_id`) DESC LIMIT 1 )
error: No SQL found in the input string
SELECT COUNT(*) FROM Paper
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL 2000'
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL 2000'
SELECT COUNT(*) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Paper.year = 2009 AND Affiliation.name = 'Columbia University';
SELECT COUNT(*) FROM Paper WHERE venue = 'Columbia University' AND year = 2009
SELECT `name`, `address` FROM `Affiliation`
SELECT `name`, `address` FROM `Affiliation`
SELECT Venue, Year FROM Paper ORDER BY Year
SELECT DISTINCT venue, year FROM Paper ORDER BY year;
SELECT Paper.`title`, Paper.`paper_id` FROM Paper INNER JOIN Author_list ON Paper.`paper_id` = Author_list.`paper_id` INNER JOIN Author ON Author_list.`author_id` = Author.`author_id` INNER JOIN Affiliation ON Author_list.`affiliation_id` = Affiliation.`affiliation_id` WHERE Affiliation.`name` = 'Harvard University';
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Harvard University';
SELECT Paper.`paper_id`, Paper.`title` FROM Paper JOIN Author_list ON Paper.`paper_id` = Author_list.`paper_id` JOIN Author ON Author_list.`author_id` = Author.`author_id` WHERE Author.`name` = 'Mckeown'
SELECT `title`, `Author_list`.`paper_id` FROM `Paper` INNER JOIN `Author_list` ON `Paper`.`paper_id` = `Author_list`.`paper_id` INNER JOIN `Author` ON `Author_list`.`author_id` = `Author`.`author_id` WHERE `Author`.`name` = 'McKeown'
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name IN ('Stanford University', 'Columbia University');
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name IN ('Stanford University', 'Columbia University');
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen' AND Author.name = 'Rambow, Owen'
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT Paper.`title`, Paper.`paper_id` FROM Paper WHERE Paper.`paper_id` NOT IN ( SELECT Author_list.`paper_id` FROM Author_list WHERE Author_list.`author_id` IN ( SELECT Author.`author_id` FROM Author WHERE Author.`name` = 'Mckeown' ) AND Author_list.`affiliation_id` IN ( SELECT Affiliation.`affiliation_id` FROM Affiliation WHERE Affiliation.`name` = 'Rambow' ) )
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown' AND Author.name != 'Rambow'
SELECT Paper.`title`, Paper.`paper_id` FROM Paper JOIN Author_list ON Paper.`paper_id` = Author_list.`paper_id` JOIN Author ON Author_list.`author_id` = Author.`author_id` WHERE Author.`name` IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen');
SELECT A.`name`, COUNT(*) as `Number_of_Papers` FROM Author AS A JOIN Author_list AS AL ON A.`author_id` = AL.`author_id` JOIN Paper AS P ON AL.`paper_id` = P.`paper_id` GROUP BY A.`name` ORDER BY COUNT(*) DESC
SELECT A.name, COUNT(AL.paper_id) as num_papers FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.name ORDER BY num_papers DESC;
SELECT Affiliation.name, COUNT(Author_list.author_id) as num_papers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.name ORDER BY num_papers ASC;
SELECT Affiliation.name, COUNT(Author_list.author_id) as num_papers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.name ORDER BY num_papers DESC
SELECT A.`name` FROM Author AS A JOIN Author_list AS AL ON A.`author_id` = AL.`author_id` JOIN Paper AS P ON AL.`paper_id` = P.`paper_id` GROUP BY A.`name` HAVING COUNT(P.`paper_id`) > 50
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.name HAVING COUNT(P.paper_id) > 50
SELECT A.`name` FROM Author AS A WHERE (SELECT COUNT(*) FROM Author_list AS AL WHERE A.`author_id` = AL.`author_id`) = 1
SELECT A.name FROM Author A WHERE (SELECT COUNT(*) FROM Author_list AL WHERE AL.author_id = A.author_id) = 1;
SELECT Venue, Year, COUNT(*) as Publication_Count FROM Paper GROUP BY Venue, Year ORDER BY Publication_Count DESC LIMIT 1;
SELECT Venue, Year, COUNT(*) as Publications FROM Paper GROUP BY Venue, Year ORDER BY Publications DESC LIMIT 1;
SELECT `venue`, COUNT(*) as `publications_count` FROM `Paper` GROUP BY `venue` ORDER BY `publications_count` LIMIT 1;
SELECT Affiliation.name, COUNT(*) as publication_count FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.name ORDER BY publication_count LIMIT 1;
SELECT COUNT(*) FROM Citation WHERE paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027'
error: No SQL found in the input string
SELECT Paper.paper_id, COUNT(Citation.cited_paper_id) as num_citations FROM Paper JOIN Citation ON Paper.paper_id = Citation.paper_id GROUP BY Paper.paper_id ORDER BY num_citations DESC LIMIT 1;
SELECT Paper.title, COUNT(*) as cnt FROM Paper JOIN Citation ON Paper.paper_id = Citation.paper_id GROUP BY Paper.title ORDER BY cnt DESC LIMIT 1;
SELECT Paper.title FROM Paper WHERE Paper.paper_id IN ( SELECT Citation.cited_paper_id FROM Citation ) GROUP BY Paper.title ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Paper.title, COUNT(Citation.cited_paper_id) as num_citations FROM Paper JOIN Citation ON Paper.paper_id = Citation.paper_id GROUP BY Paper.paper_id ORDER BY num_citations DESC LIMIT 10
SELECT P.title, COUNT(C.cited_paper_id) as num_citations FROM Paper P JOIN Citation C ON P.paper_id = C.paper_id GROUP BY P.paper_id ORDER BY num_citations DESC LIMIT 10;
SELECT COUNT(*) FROM Citation JOIN Author_list ON Citation.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Mckeown, Kathleen';
SELECT COUNT(*) FROM Paper WHERE paper_id IN ( SELECT paper_id FROM Author_list WHERE author_id = ( SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen' ) );
error: No SQL found in the input string
SELECT COUNT(*) FROM Citation JOIN Author_list ON Citation.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen';
SELECT A.`name`, COUNT(*) as `Number of Citations` FROM Author as A JOIN Author_list as AL ON A.`author_id` = AL.`author_id` JOIN Paper as P ON AL.`paper_id` = P.`paper_id` JOIN Citation as C ON P.`paper_id` = C.`paper_id` GROUP BY A.`author_id` ORDER BY `Number of Citations` DESC LIMIT 1;
SELECT a.name, COUNT(c.paper_id) as num_citations FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id JOIN Citation c ON p.paper_id = c.paper_id GROUP BY a.author_id ORDER BY num_citations DESC LIMIT 1;
SELECT Venue, Year FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Mckeown, Kathleen'
SELECT Venue, Year FROM Paper WHERE Paper.paper_id IN ( SELECT Paper_id FROM Author_list WHERE Author_list.author_id IN ( SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen' ) )
SELECT Venue, Year FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University';
SELECT Venue, Year FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University';
SELECT A.`name`, COUNT(*) as `Number_of_Papers` FROM Author AS A JOIN Author_list AS AL ON A.`author_id` = AL.`author_id` JOIN Paper AS P ON AL.`paper_id` = P.`paper_id` WHERE P.`year` = 2009 GROUP BY A.`author_id` ORDER BY `Number_of_Papers` DESC LIMIT 1;
error: No SQL found in the input string
SELECT Affiliation.name, COUNT(Author_list.author_id) as paper_count FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY Affiliation.name ORDER BY paper_count DESC LIMIT 3
SELECT Affiliation.name, COUNT(DISTINCT Paper.paper_id) as num_papers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY Affiliation.name ORDER BY num_papers DESC LIMIT 3;
SELECT COUNT(*) FROM Paper WHERE venue = 'Columbia University' AND year < 2009
SELECT COUNT(*) FROM Paper WHERE venue = 'Carnegie Mellon University' AND year >= 2009
SELECT COUNT(*) FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Affiliation.name = 'Stanford University' AND Paper.year BETWEEN 2000 AND 2009
SELECT COUNT(*) FROM Paper WHERE venue = 'Stanford University' AND year BETWEEN 2000 AND 2009
SELECT title, COUNT(*) as author_count FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id GROUP BY Paper.paper_id ORDER BY author_count DESC LIMIT 1;
SELECT `title` FROM Paper WHERE `paper_id` = ( SELECT `paper_id` FROM ( SELECT `paper_id`, COUNT(`author_id`) AS `author_count` FROM Author_list GROUP BY `paper_id` ORDER BY `author_count` DESC LIMIT 1 ) )
SELECT COUNT(*) FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Kathleen McKeown')
error: No SQL found in the input string
SELECT A.name, COUNT(*) as num_papers FROM Author_list AS AL JOIN Author AS A ON AL.author_id = A.author_id JOIN Paper AS P ON AL.paper_id = P.paper_id WHERE A.name = 'Mckeown, Kathleen' GROUP BY A.name ORDER BY num_papers DESC LIMIT 1;
SELECT A.name FROM Author A WHERE A.author_id IN ( SELECT AL.author_id FROM Author_list AL WHERE AL.affiliation_id IN ( SELECT Affiliation.affiliation_id FROM Affiliation WHERE Affiliation.name = 'Mckeown, Kathleen' ) ) GROUP BY A.author_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
error: No SQL found in the input string
SELECT Paper.paper_id, Paper.title FROM Paper WHERE Paper.paper_id NOT IN (SELECT Citation.cited_paper_id FROM Citation)
SELECT Paper.paper_id, Paper.title FROM Paper WHERE Paper.paper_id NOT IN (SELECT Citation.cited_paper_id FROM Citation)
SELECT Affiliation.name, COUNT(DISTINCT Paper.paper_id) as num_papers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Affiliation.address LIKE '%China%' GROUP BY Affiliation.name ORDER BY num_papers DESC LIMIT 1;
error: No SQL found in the input string
SELECT Year, COUNT(DISTINCT Paper_id) as Number_of_Papers FROM Paper GROUP BY Year
SELECT Venue, Year, COUNT(*) as NumberOfPapers FROM Paper GROUP BY Venue, Year
SELECT Affiliation.name, COUNT(DISTINCT Paper.paper_id) as total_papers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.name
SELECT Affiliation.name, COUNT(DISTINCT Paper.paper_id) as NumberOfPapers FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.name;
SELECT Paper.title FROM Paper JOIN ( SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50 ) AS Citations ON Paper.paper_id = Citations.paper_id
SELECT title FROM Paper WHERE paper_id IN ( SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50 )
SELECT COUNT(DISTINCT Author.name) as num_authors FROM Author WHERE Author.author_id NOT IN ( SELECT DISTINCT Author_list.author_id FROM Author_list LEFT JOIN Citation ON Author_list.paper_id = Citation.cited_paper_id GROUP BY Author_list.author_id HAVING COUNT(Citation.cited_paper_id) > 50 )
SELECT COUNT(DISTINCT Author.name) as num_authors FROM Author WHERE Author.author_id NOT IN ( SELECT Author_list.author_id FROM Author_list INNER JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.citations > 50 )
SELECT DISTINCT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue IN ('ACL', 'NAACL') AND P.year = 2009;
SELECT DISTINCT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id JOIN Affiliation AF ON AL.affiliation_id = AF.affiliation_id WHERE P.year = 2009 AND (P.venue = 'NAACL' OR P.venue = 'ACL');
SELECT A.name FROM Author A WHERE A.author_id NOT IN ( SELECT AL.author_id FROM Author_list AL JOIN Affiliation AA ON AL.affiliation_id = AA.affiliation_id WHERE AA.name = 'Google Inc.' AND AL.venue = 'ACL' );
SELECT DISTINCT A.name FROM Author A WHERE A.author_id NOT IN ( SELECT AL.author_id FROM Author_list AL WHERE AL.affiliation_id = ( SELECT Affiliation.affiliation_id FROM Affiliation WHERE Affiliation.name = 'Google Inc.' ) AND AL.paper_id IN ( SELECT Paper.paper_id FROM Paper WHERE Paper.venue = 'ACL' ) );
SELECT COUNT(*) FROM conference
SELECT COUNT(*) FROM conference
SELECT DISTINCT `Conference_Name` FROM `conference`
SELECT `Conference_Name` FROM `conference` WHERE `Conference_Name` NOT LIKE '%(defunct%)%'
SELECT `Conference_Name`, `Year`, `Location` FROM `conference`
SELECT `Conference_Name`, `Year`, `Location` FROM `conference`
SELECT `Conference_Name`, COUNT(*) as `Number_of_Conferences` FROM `conference` JOIN `conference_participation` ON `conference`.`Conference_ID` = `conference_participation`.`Conference_ID` GROUP BY `Conference_Name`
SELECT `Conference_Name`, COUNT(*) as `Number of Occurrences` FROM `conference` JOIN `conference_participation` ON `conference`.`Conference_ID` = `conference_participation`.`Conference_ID` GROUP BY `Conference_Name`
SELECT `Year`, COUNT(*) FROM conference GROUP BY `Year`
SELECT COUNT(*) as Number_of_Conferences, Year FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(*) LIMIT 1
SELECT MIN(Year) FROM conference
SELECT T1.`Location` FROM institution AS T1 JOIN staff AS T2 ON T1.`Institution_ID` = T2.`Institution_ID` JOIN conference_participation AS T3 ON T2.`staff_ID` = T3.`staff_ID` JOIN conference AS T4 ON T3.`Conference_ID` = T4.`Conference_ID` GROUP BY T1.`Location` HAVING COUNT(DISTINCT T4.`Conference_ID`) >= 2
SELECT T1.`Location` FROM institution AS T1 JOIN staff AS T2 ON T1.`Institution_ID` = T2.`Institution_ID` JOIN conference_participation AS T3 ON T2.`staff_ID` = T3.`staff_ID` JOIN conference AS T4 ON T3.`Conference_ID` = T4.`Conference_ID` GROUP BY T1.`Location` HAVING COUNT(DISTINCT T4.`Conference_ID`) >= 2
SELECT `Institution_Name`, `Location`, `Founded` FROM institution
SELECT `Institution_Name`, `Location`, `Founded` FROM `institution`
SELECT COUNT(*) FROM institution WHERE `Founded` BETWEEN 1850 AND 1900;
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT `Institution_Name`, `Location` FROM institution ORDER BY `Founded` DESC LIMIT 1
SELECT `Institution_Name`, `Location` FROM institution ORDER BY `Founded` DESC LIMIT 1
SELECT T1.`Institution_Name`, COUNT(*) FROM institution AS T1 JOIN staff AS T2 ON T1.`Institution_ID` = T2.`Institution_ID` WHERE T2.`Founded` > 1800 GROUP BY T1.`Institution_ID`
SELECT institution.Institution_ID, institution.Institution_Name, COUNT(staff.staff_ID) as Number_of_Staff FROM institution JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE institution.Founded > 1800 GROUP BY institution.Institution_ID
SELECT institution.Institution_Name FROM institution LEFT JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE staff.Institution_ID IS NULL
error: No SQL found in the input string
SELECT `name` FROM `staff` WHERE `Age` > (SELECT AVG(`Age`) FROM `staff`)
SELECT `name` FROM `staff` WHERE `Age` > (SELECT AVG(`Age`) FROM `staff`);
SELECT MAX(Age) as Maximum_Age, MIN(Age) as Minimum_Age FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age) as Maximum_Age, MIN(Age) as Minimum_Age FROM staff;
SELECT `Conference_Name` FROM `conference` INNER JOIN `conference_participation` ON `conference`.`Conference_ID` = `conference_participation`.`Conference_ID` INNER JOIN `staff` ON `conference_participation`.`staff_ID` = `staff`.`staff_ID` WHERE `staff`.`Nationality` = 'Canada'
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada'
SELECT T1.`name` FROM staff AS T1 JOIN conference_participation AS T2 ON T1.`staff_ID` = T2.`staff_ID` WHERE T2.`role` = 'Speaker' AND T2.`role` = 'Sponsor' GROUP BY T1.`staff_ID` HAVING COUNT(DISTINCT T2.`role`) = 2
SELECT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID WHERE conference_participation.role IN ('Speaker', 'Sponsor') GROUP BY staff.name HAVING COUNT(DISTINCT conference_participation.role) = 2;
SELECT s.name FROM staff AS s JOIN institution AS i ON s.Institution_ID = i.Institution_ID JOIN conference_participation AS cp ON s.staff_ID = cp.staff_ID WHERE cp.Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name IN ('ACL', 'Naccl')) GROUP BY s.name;
SELECT DISTINCT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Conference_Name IN ('ACL', 'NACCL')
SELECT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year IN (2003, 2004)
SELECT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year BETWEEN 2003 AND 2004;
SELECT T1.`Conference_Name`, T1.`Year`, COUNT(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.`Conference_ID` = T2.`Conference_ID` GROUP BY T1.`Conference_ID`
SELECT T1.`Conference_Name`, T1.`Year`, COUNT(DISTINCT T2.`staff_ID`) AS `Number_of_Participants` FROM conference AS T1 JOIN conference_participation AS T2 ON T1.`Conference_ID` = T2.`Conference_ID` GROUP BY T1.`Conference_ID`
SELECT C.`Conference_Name`, COUNT(*) as Attendants_Count FROM conference_participation AS CP JOIN conference AS C ON CP.`Conference_ID` = C.`Conference_ID` GROUP BY C.`Conference_ID` ORDER BY Attendants_Count DESC LIMIT 2
SELECT c.`Conference_Name` FROM conference AS c JOIN ( SELECT cp.`Conference_ID`, COUNT(*) AS `Attendance` FROM conference_participation AS cp GROUP BY cp.`Conference_ID` ORDER BY `Attendance` DESC LIMIT 2 ) AS top_conferences ON c.`Conference_ID` = top_conferences.`Conference_ID`
SELECT `name`, `nationality` FROM staff WHERE `Institution_ID` IN ( SELECT `Institution_ID` FROM institution WHERE `Institution_Name` = 'Illinois State University' ) AND `staff_ID` NOT IN ( SELECT `staff_ID` FROM conference_participation WHERE `Conference_ID` IN ( SELECT `Conference_ID` FROM conference WHERE `Conference_Name` = 'ACL' ) )
SELECT `name`, `nationality` FROM staff WHERE Institution_ID = (SELECT Institution_ID FROM institution WHERE Institution_Name = 'Illinois State University') AND staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID = (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'));
SELECT `Institution_Name`, `Location` FROM institution WHERE `Institution_ID` NOT IN ( SELECT `Institution_ID` FROM `conference_participation` WHERE `Conference_ID` IN ( SELECT `Conference_ID` FROM `conference` WHERE `Year` = 2004 ) )
SELECT `Institution_Name`, `Location` FROM institution WHERE `Institution_ID` NOT IN ( SELECT DISTINCT `Institution_ID` FROM conference_participation WHERE `Conference_ID` IN ( SELECT `Conference_ID` FROM conference WHERE `Year` = 2004 ) )
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1;
SELECT `pilot_name` FROM `PilotSkills` ORDER BY `age` ASC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT `pilot_name` FROM `PilotSkills` WHERE `age` < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT PilotSkills.pilot_name, Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age < 35 AND Hangar.plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter';
SELECT Hangar.location FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name WHERE PilotSkills.plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) as NumberOfDifferentLocations FROM Hangar
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32;
SELECT Hangar.plane_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name = 'Jones' AND PilotSkills.age = 32;
error: No SQL found in the input string
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
error: No SQL found in the input string
SELECT COUNT(*) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE pilot_name LIKE '%B-52%' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills);
SELECT ps.pilot_name FROM PilotSkills ps JOIN Hangar h ON ps.plane_name = h.plane_name WHERE h.location = 'Piper Cub' ORDER BY ps.age ASC LIMIT 1;
SELECT plane_name FROM Hangar WHERE location = ( SELECT location FROM Hangar GROUP BY location ORDER BY COUNT(*) DESC LIMIT 1 );
SELECT Hangar.plane_name, COUNT(PilotSkills.plane_name) as flight_count FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY Hangar.plane_name ORDER BY flight_count DESC LIMIT 1;
SELECT plane_name FROM Hangar WHERE plane_name NOT IN (SELECT plane_name FROM PilotSkills) ORDER BY plane_name LIMIT 1;
SELECT plane_name FROM Hangar WHERE plane_name NOT IN (SELECT plane_name FROM PilotSkills)
SELECT COUNT(*) FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Chicago')
SELECT COUNT(*) FROM PilotSkills PS JOIN Hangar H ON PS.plane_name = H.plane_name WHERE H.location = 'Chicago'
SELECT Hangar.plane_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age = 41;
SELECT Hangar.plane_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name = 'Smith' AND PilotSkills.age = 41
SELECT COUNT(DISTINCT plane_name) FROM Hangar
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(*) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name = 'Smith'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE pilot_name = 'Smith'
SELECT COUNT(*) FROM Hangar WHERE plane_name IN (SELECT pilot_name FROM PilotSkills WHERE age > 40)
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC;
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC;
SELECT `pilot_name` FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC;
SELECT Hangar.`location` FROM Hangar ORDER BY Hangar.`plane_name`
SELECT Hangar.location, COUNT(*) as NumberOfPlanes FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY Hangar.location ORDER BY NumberOfPlanes DESC;
SELECT DISTINCT plane_name FROM PilotSkills ORDER BY plane_name;
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC;
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30;
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age > 35 UNION SELECT pilot_name, age FROM PilotSkills WHERE plane_name = 'F-14 Fighter' AND age < 30;
SELECT pilot_name, age FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age > 35 UNION SELECT pilot_name, age FROM PilotSkills WHERE plane_name = 'F-14 Fighter' AND age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT T1.`pilot_name` FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.`plane_name` = T2.`plane_name` WHERE T2.`location` = 'Piper Cub' AND T1.`plane_name` != 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber')
SELECT P.pilot_name, P.plane_name, P.age FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name WHERE H.location IN ('Seattle', 'Chicago', 'Boston', 'Austin') GROUP BY P.pilot_name, P.plane_name, P.age HAVING COUNT(DISTINCT P.plane_name) = 2
SELECT AVG(age) AS average_age, MIN(age) AS smallest_age FROM PilotSkills;
SELECT AVG(age) as average_age, MIN(age) as min_age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name
SELECT DISTINCT PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location IN ('Austin', 'Boston');
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin' OR location = 'Boston')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter');
SELECT Hangar.plane_name, AVG(PilotSkills.age) as average_age FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY Hangar.plane_name;
SELECT `plane_name`, AVG(`age`) FROM `PilotSkills` GROUP BY `plane_name`
SELECT Hangar.location, COUNT(PilotSkills.plane_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY Hangar.location;
SELECT `plane_name`, COUNT(*) FROM `Hangar` GROUP BY `plane_name`
SELECT Hangar.`plane_name`, MAX(PilotSkills.`age`) AS `oldest_age` FROM Hangar JOIN PilotSkills ON Hangar.`plane_name` = PilotSkills.`plane_name` GROUP BY Hangar.`plane_name` ORDER BY Hangar.`plane_name`
SELECT Hangar.plane_name, MAX(PilotSkills.age) AS oldest_age, PilotSkills.pilot_name FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY Hangar.plane_name ORDER BY Hangar.plane_name;
SELECT pilot_name, MIN(age) as oldest_age FROM PilotSkills GROUP BY plane_name
SELECT H.`plane_name`, P.`pilot_name`, P.`age` FROM PilotSkills AS P JOIN Hangar AS H ON P.`plane_name` = H.`plane_name` ORDER BY P.`age` DESC
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) as max_age FROM PilotSkills GROUP BY pilot_name;
SELECT T1.`pilot_name`, COUNT(*) as `Number of Pilots`, AVG(T1.`age`) as `Average Age` FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.`plane_name` = T2.`plane_name` GROUP BY T1.`pilot_name`
SELECT location, COUNT(pilot_name), AVG(age) FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY location;
SELECT COUNT(*) FROM PilotSkills WHERE pilot_name IN ( SELECT pilot_name FROM ( SELECT pilot_name FROM PilotSkills WHERE plane_name IN ( SELECT plane_name FROM Hangar ) GROUP BY pilot_name HAVING AVG(age) < 35 ) )
SELECT Hangar.plane_name, COUNT(PilotSkills.pilot_name) as num_pilots FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name WHERE PilotSkills.age < 35 GROUP BY Hangar.plane_name;
SELECT Hangar.location, PilotSkills.pilot_name, PilotSkills.plane_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.age = (SELECT MIN(age) FROM PilotSkills)
SELECT location FROM Hangar WHERE plane_name = (SELECT pilot_name FROM PilotSkills ORDER BY age ASC LIMIT 1)
SELECT pilot_name, age FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin')
SELECT pilot_name, age FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE location = 'Austin';
SELECT ps1.`pilot_name` FROM PilotSkills AS ps1 JOIN Hangar AS h1 ON ps1.`plane_name` = h1.`plane_name` WHERE ps1.`age` > (SELECT ps2.`age` FROM PilotSkills AS ps2 WHERE ps2.`plane_name` = 'Piper Cub') ORDER BY ps1.`pilot_name`
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name ASC;
SELECT COUNT(*) FROM PilotSkills WHERE age < (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(*) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%';
SELECT COUNT(*) FROM PilotSkills WHERE age > (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(*) FROM PilotSkills WHERE age > ( SELECT age FROM PilotSkills WHERE pilot_name = 'Piper Cub' )
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT `Area_km`, `Government_website` FROM `district` WHERE `Population` = (SELECT MIN(`Population`) FROM `district`)
SELECT `Name`, `Points` FROM spokesman WHERE `Points` = (SELECT MAX(`Points`) FROM spokesman)
SELECT MAX(Area_km) as Biggest_Area, AVG(Area_km) as Average_Area FROM district
SELECT SUM(d.`Population`) FROM district AS d JOIN ( SELECT sd.`District_ID` FROM spokesman_district AS sd JOIN spokesman AS sp ON sd.`Spokesman_ID` = sp.`Spokesman_ID` WHERE sp.`Speach_title` = 'Public Health' ) AS top_speakers ON d.`District_ID` = top_speakers.`District_ID` ORDER BY d.`Area_km` DESC LIMIT 3;
SELECT T1.`District_ID`, T1.`Name`, T1.`Government_website` FROM district AS T1 ORDER BY T1.`Population`
SELECT D.Name FROM district AS D JOIN spokesman_district AS SD ON D.District_ID = SD.District_ID JOIN spokesman AS S ON SD.Spokesman_ID = S.Spokesman_ID WHERE D.Government_website LIKE '%gov%'
SELECT `District_ID`, `Name` FROM `district` WHERE `Population` > 4000 OR `Area_km` > 3000
SELECT `Name`, `Speach_title` FROM spokesman
SELECT AVG(Points) AS Average_Points, AVG(Age) AS Average_Age FROM spokesman WHERE Rank_position = 1
SELECT `Name`, `Points` FROM spokesman WHERE Age < 40
error: No SQL found in the input string
SELECT `Name` FROM spokesman WHERE `Points` < (SELECT AVG(`Points`) FROM spokesman);
SELECT T1.`Name`, COUNT(*) FROM district AS T1 JOIN spokesman_district AS T2 ON T1.`District_ID` = T2.`District_ID` JOIN spokesman AS T3 ON T2.`Spokesman_ID` = T3.`Spokesman_ID` GROUP BY T1.`District_ID` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Name` FROM spokesman WHERE Spokesman_ID IN ( SELECT Spokesman_ID FROM spokesman_district WHERE Start_year < '2004' )
SELECT D.`Name`, COUNT(*) FROM district AS D JOIN spokesman_district AS SD ON D.`District_ID` = SD.`District_ID` GROUP BY D.`District_ID`
SELECT D.`Name` FROM district AS D WHERE EXISTS ( SELECT 1 FROM spokesman_district AS SD1 WHERE SD1.`District_ID` = D.`District_ID` AND EXISTS ( SELECT 1 FROM spokesman_district AS SD2 WHERE SD2.`District_ID` = D.`District_ID` AND SD2.`Start_year` = ( SELECT MIN(SD3.`Start_year`) FROM spokesman_district AS SD3 WHERE SD3.`Spokesman_ID` = SD1.`Spokesman_ID` ) ) AND ( SELECT COUNT(*) FROM spokesman_district AS SD4 WHERE SD4.`District_ID` = D.`District_ID` AND SD4.`Start_year` = ( SELECT MIN(SD5.`Start_year`) FROM spokesman_district AS SD5 WHERE SD5.`Spokesman_ID` IN ( SELECT SD6.`Spokesman_ID` FROM spokesman_district AS SD6 WHERE SD6.`District_ID` = D.`District_ID` ) ) ) > 1 )
SELECT D.`Name` FROM `district` AS D JOIN (SELECT `District_ID` FROM `spokesman_district` GROUP BY `District_ID` HAVING COUNT(`Spokesman_ID`) > 1) AS SD ON D.`District_ID` = SD.`District_ID`
SELECT COUNT(DISTINCT T1.`District_ID`) FROM district AS T1 LEFT JOIN spokesman_district AS T2 ON T1.`District_ID` = T2.`District_ID` WHERE T2.`District_ID` IS NULL
SELECT `Name` FROM spokesman WHERE `Spokesman_ID` NOT IN (SELECT `Spokesman_ID` FROM spokesman_district)
SELECT SUM(Districts.Population), AVG(Districts.Population) FROM district AS Districts JOIN (SELECT Districts.District_ID FROM district AS Districts JOIN spokesman_district AS SpokesmanDistricts ON Districts.District_ID = SpokesmanDistricts.District_ID GROUP BY Districts.District_ID) AS SpokesmanDistricts ON Districts.District_ID = SpokesmanDistricts.District_ID
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `title` FROM `Sculptures` WHERE `location` = 'Gallery 226'
SELECT title FROM Sculptures WHERE location = 'Gallery 226';
SELECT Paintings.title, Paintings.location FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID
SELECT title, location FROM Paintings WHERE title IN (SELECT title FROM Paintings WHERE location = 'Gallery 241')
SELECT `title`, `location` FROM `Sculptures`
SELECT title, location FROM Sculptures WHERE location IS NOT NULL;
SELECT `medium` FROM `Paintings` WHERE `paintingID` = 80;
SELECT Paintings.medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.paintingID = 80;
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT CONCAT(fname, ' ', lname) AS full_name FROM Artists WHERE birthYear > 1850
SELECT `title`, `year` FROM `Sculptures` WHERE `location` != 'Gallery 226'
SELECT title, year FROM Sculptures WHERE location != 'Gallery 226'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year < 1900
SELECT DISTINCT birthYear FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE substr(strftime('%Y', Sculptures.year), 1, 4) > 1920
SELECT birthYear FROM Artists WHERE artistID IN ( SELECT artistID FROM Sculptures WHERE year > 1920 )
SELECT fname, lname FROM Artists WHERE birthYear = (SELECT MIN(birthYear) FROM Artists)
error: No SQL found in the input string
SELECT MIN(deathYear - birthYear) AS age_of_shortest_life FROM Artists;
error: No SQL found in the input string
SELECT A.fname, A.birthYear FROM Artists A JOIN Paintings P ON A.artistID = P.painterID JOIN Sculptures S ON A.artistID = S.sculptorID WHERE A.deathYear IS NULL GROUP BY A.artistID ORDER BY A.birthYear DESC LIMIT 1;
SELECT `fname`, `birthYear` - `deathYear` AS `age` FROM `Artists` WHERE `deathYear` = (SELECT MIN(`birthYear`) FROM `Artists`);
SELECT COUNT(*) FROM Paintings WHERE location = 'Gallery 240'
error: No SQL found in the input string
SELECT COUNT(*) FROM Paintings WHERE painterID IN ( SELECT artistID FROM Artists WHERE deathYear = (SELECT MAX(deathYear) FROM Artists) )
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists WHERE birthYear = (SELECT MAX(birthYear) FROM Artists));
SELECT `Paintings`.`title`, `Paintings`.`year` FROM `Paintings` JOIN `Artists` ON `Paintings`.`painterID` = `Artists`.`artistID` WHERE `Artists`.`fname` = 'Mary'
SELECT P.title, P.year FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Mary'
SELECT `width_mm` FROM Paintings WHERE `year` < 1850 AND `painterID` IN ( SELECT `artistID` FROM Artists WHERE `birthYear` < 1850 )
SELECT Paintings.width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT Paintings.location, Paintings.medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT Paintings.location, Paintings.medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT A.fname, A.lname FROM Artists A WHERE EXISTS ( SELECT 1 FROM Paintings P1 WHERE P1.painterID = A.artistID ) AND EXISTS ( SELECT 1 FROM Sculptures S1 WHERE S1.sculptorID = A.artistID )
SELECT CONCAT(Artists.fname, ' ', Artists.lname) as Full_Name FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID UNION SELECT CONCAT(Artists.fname, ' ', Artists.lname) as Full_Name FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID
SELECT fname, lname FROM Artists WHERE artistID IN ( SELECT artistID FROM Paintings WHERE medium = 'oil' AND paintingID IN ( SELECT paintingID FROM Paintings WHERE medium = 'lithograph' ) )
SELECT fname, lname FROM Artists WHERE artistID IN ( SELECT artistID FROM Paintings WHERE medium = 'oil' INTERSECT SELECT artistID FROM Sculptures WHERE medium = 'lithograph' )
SELECT Artists.birthYear FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year = 1884 AND Paintings.mediumOn = 'canvas'
SELECT `birthYear` FROM `Artists` WHERE `artistID` IN ( SELECT `painterID` FROM `Paintings` WHERE `birthYear` = 1884 )
SELECT DISTINCT fname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE medium = 'oil' AND location = 'Gallery 241'
SELECT `fname` FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.location = 'Gallery 241' AND Paintings.medium = 'oil'
SELECT `medium`, COUNT(*) as `Number of Works` FROM ( SELECT `medium` FROM `Paintings` UNION ALL SELECT `medium` FROM `Sculptures` ) as `All Mediums` GROUP BY `All Mediums`.`medium`
SELECT medium, COUNT(*) as number_of_works FROM Paintings GROUP BY medium;
SELECT `medium`, AVG(`height_mm`) as `average_height` FROM `Paintings` GROUP BY `medium`
SELECT `medium`, AVG(`height_mm`) as `average_height` FROM `Paintings` GROUP BY `medium`
SELECT Paintings.location, COUNT(*) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1900 GROUP BY Paintings.location;
SELECT COUNT(*) FROM Paintings WHERE year < 1900 AND location IS NOT NULL
SELECT Paintings.title FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.year > 1910 AND Paintings.medium = 'oil'
SELECT Paintings.title FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.medium = 'oil' AND Paintings.year > 1910
SELECT artistID FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.location = 'Gallery 240' AND Paintings.medium = 'oil';
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location = 'Gallery 240';
SELECT DISTINCT P1.title FROM Paintings P1 JOIN Paintings P2 ON P1.painterID = P2.painterID WHERE P1.height_mm > P2.height_mm AND P1.medium = 'canvas'
SELECT DISTINCT P1.title FROM Paintings P1 JOIN Paintings P2 ON P1.painterID = P2.painterID WHERE P1.height_mm > P2.height_mm AND P2.medium = 'canvas'
SELECT DISTINCT P.paintingID FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE P.location = 'Gallery 240' AND P.year < (SELECT P2.year FROM Paintings P2 WHERE P2.location = 'Gallery 240')
SELECT DISTINCT P1.paintingID FROM Paintings P1 JOIN Paintings P2 ON P1.paintingID = P2.paintingID WHERE P2.location = 'Gallery 240' AND P1.year > P2.year
SELECT MAX(year) FROM Paintings
error: No SQL found in the input string
SELECT fname, lname FROM Artists WHERE artistID IN ( SELECT sculptorID FROM Sculptures WHERE title LIKE '%female%' )
SELECT CONCAT(fname, ' ', lname) as FullName FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE title LIKE '%female%'
SELECT DISTINCT title FROM Paintings ORDER BY title ASC;
SELECT DISTINCT title FROM Paintings ORDER BY title ASC;
SELECT title FROM Paintings ORDER BY height_mm ASC, width_mm ASC;
SELECT title FROM Paintings ORDER BY height_mm ASC
SELECT P.title AS painting_title, S.title AS sculpture_title FROM Paintings P JOIN Sculptures S ON P.painterID = S.painterID JOIN Artists A ON P.painterID = A.artistID WHERE A.birthYear BETWEEN 1900 AND 1950 UNION SELECT P.title AS painting_title, S.title AS sculpture_title FROM Paintings P JOIN Sculptures S ON P.painterID = S.painterID JOIN Artists A ON P.painterID = A.artistID WHERE A.deathYear BETWEEN 1900 AND 1950;
SELECT P.title AS Painting_Name, S.title AS Sculpture_Name FROM Paintings P JOIN Sculptures S ON P.painterID = S.painterID JOIN Artists A ON A.artistID = P.painterID WHERE P.year BETWEEN 1900 AND 1950 UNION SELECT P.title AS Painting_Name, S.title AS Sculpture_Name FROM Paintings P JOIN Sculptures S ON P.painterID = S.painterID JOIN Artists A ON A.artistID = P.painterID WHERE S.year BETWEEN 1900 AND 1950
CREATE TABLE Sculptures ( sculptureID INTEGER PRIMARY KEY, title TEXT, year INTEGER, medium TEXT, location TEXT, sculptorID INTEGER, FOREIGN KEY(sculptorID) REFERENCES Artists(artistID) );
SELECT P.title AS painting_title, S.title AS sculpture_title, A.fname AS artist_name FROM Paintings P JOIN Sculptures S ON P.painterID = S.sculptorID JOIN Artists A ON P.painterID = A.artistID WHERE P.painterID = 222;
SELECT A.artistID FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.year < 1900 GROUP BY A.artistID ORDER BY COUNT(P.paintingID) DESC LIMIT 1;
SELECT artistID FROM ( SELECT artistID, COUNT(*) as painting_count, MIN(year) as earliest_year FROM ( SELECT artistID, paintingID, year FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID UNION ALL SELECT artistID, sculptureID, year FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID ) WHERE year < 1900 GROUP BY artistID ) WHERE painting_count = ( SELECT MAX(painting_count) FROM ( SELECT COUNT(*) as painting_count FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE year < 1900 GROUP BY artistID ) )
error: No SQL found in the input string
error: No SQL found in the input string
SELECT title FROM Paintings WHERE (width_mm < 600 OR height_mm > 800)
SELECT title FROM Paintings WHERE width_mm < 600 AND height_mm > 800
SELECT location FROM Paintings WHERE (year < 1885 OR year > 1930) GROUP BY location HAVING COUNT(DISTINCT paintingID) > 1
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930 UNION SELECT location FROM Sculptures WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;
SELECT P.location FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE P.medium = 'oil' AND P.mediumOn = 'canvas'
SELECT DISTINCT P.location FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE P.medium = 'oil' AND P.mediumOn = 'canvas'
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT P.location FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE P.year < 1885 AND P.year > 1930
SELECT AVG(P.height_mm) AS average_height, AVG(P.width_mm) AS average_width FROM Paintings AS P JOIN Sculptures AS S ON P.painterID = S.sculptorID WHERE P.medium = 'oil' AND P.location = 'Gallery 241';
SELECT AVG(Paintings.height_mm) AS AverageHeight, AVG(Paintings.width_mm) AS AverageWidth FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.medium = 'oil' AND Paintings.location = 'Gallery 241'
SELECT MAX(height_mm) as max_height, paintingID as painting_id FROM Paintings WHERE year < 1900
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) as max_height, MAX(width_mm) as max_width FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) as largest_height, MAX(width_mm) as largest_width FROM Paintings GROUP BY year
SELECT AVG(Paintings.height_mm) AS AverageHeight, AVG(Paintings.width_mm) AS AverageWidth, Artists.lname AS PainterName FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Artists.lname ORDER BY PainterName;
SELECT AVG(Paintings.height_mm) as AverageHeight, AVG(Paintings.width_mm) as AverageWidth, Artists.lname as PainterName FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Artists.lname ORDER BY PainterName;
SELECT A.fname, COUNT(*) FROM Artists A JOIN Paintings P1 ON A.artistID = P1.painterID JOIN Paintings P2 ON A.artistID = P2.painterID GROUP BY A.artistID HAVING COUNT(*) >= 2
SELECT A.fname, COUNT(P.paintingID) FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT A.artistID, A.lname, A.fname, A.birthYear, A.deathYear FROM Artists A WHERE ( SELECT COUNT(*) FROM Paintings B WHERE B.painterID = A.artistID ) <= 3 AND ( SELECT COUNT(*) FROM Sculptures C WHERE C.sculptorID = A.artistID ) <= 3
SELECT A.lname, A.fname, A.birthYear, A.deathYear FROM Artists A JOIN Paintings P ON A.artistID = P.painterID JOIN Sculptures S ON A.artistID = S.sculptorID WHERE (SELECT COUNT(*) FROM Paintings WHERE painterID = A.artistID) < 4 AND (SELECT COUNT(*) FROM Sculptures WHERE sculptorID = A.artistID) < 4
SELECT A.deathYear FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID GROUP BY A.artistID ORDER BY COUNT(S.sculptureID) LIMIT 1;
SELECT `deathYear` FROM `Artists` WHERE `artistID` IN ( SELECT `painterID` FROM `Paintings` WHERE `painterID` IN ( SELECT `painterID` FROM `Sculptures` ) ) ORDER BY `deathYear` ASC LIMIT 1;
SELECT paintingID, height_mm FROM Paintings WHERE location = 'Gallery 240' ORDER BY width_mm DESC LIMIT 1;
SELECT `height_mm`, `paintingID` FROM Paintings WHERE `location` = 'Gallery 240' ORDER BY `height_mm` DESC LIMIT 1
SELECT P.paintingID FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.location = 'Gallery 240' AND P.location <> 'Gallery 240'
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'Gallery 240')
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT A.fname, A.lname, COUNT(P.paintingID) as painting_count FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY painting_count DESC LIMIT 3;
SELECT A.fname, A.lname, COUNT(P.paintingID) as painting_count FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY painting_count DESC LIMIT 1;
SELECT `paintingID`, `location`, `title` FROM `Paintings` WHERE `medium` = 'oil' ORDER BY `year`
SELECT Paintings.paintingID, Paintings.title, Paintings.year, Paintings.location, Paintings.medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.medium = 'oil' ORDER BY Paintings.year;
SELECT `year`, `location`, `title` FROM `Paintings` WHERE `height_mm` > 1000 ORDER BY `title`
SELECT `year`, `location`, `title` FROM `Paintings` WHERE `height_mm` > 1000 ORDER BY `title` ASC;
SELECT `fname`, `lname` FROM Artists WHERE artistID IN ( SELECT artistID FROM Paintings WHERE paintingID IN ( SELECT paintingID FROM Sculptures WHERE sculptureID NOT IN ( SELECT sculptureID FROM Sculptures WHERE location IS NOT NULL ) ) ) AND artistID NOT IN ( SELECT artistID FROM Sculptures WHERE location IS NOT NULL )
SELECT `fname`, `lname` FROM Artists WHERE `artistID` IN ( SELECT `painterID` FROM Paintings WHERE `painterID` IN ( SELECT `artistID` FROM Sculptures WHERE `sculptorID` IN ( SELECT `artistID` FROM Artists ) ) ) AND `artistID` IN ( SELECT `painterID` FROM Paintings WHERE `painterID` IN ( SELECT `artistID` FROM Sculptures WHERE `sculptorID` IN ( SELECT `artistID` FROM Artists ) ) )
SELECT DISTINCT P.location FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE P.year < 1885 AND P.mediumOn = 'canvas' AND P.location IN (SELECT location FROM Paintings WHERE year < 1885 AND mediumOn = 'canvas')
SELECT Paintings.title FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Paintings.year < 1885 AND Paintings.mediumOn != 'canvas'
error: No SQL found in the input string
SELECT COUNT(*) FROM race
error: No SQL found in the input string
SELECT D.`Driver_Name`, W.`Winning_team` FROM driver AS D JOIN race AS R ON D.`Driver_ID` = R.`Driver_ID` JOIN ( SELECT R2.`Winning_driver`, R2.`Winning_team` FROM race AS R2 WHERE R2.`Report` = 'Report' ) AS W ON D.`Driver_ID` = W.`Winning_driver` ORDER BY W.`Winning_team`;
SELECT d.Driver_Name FROM driver AS d JOIN race AS r ON d.Driver_ID = r.Driver_ID WHERE r.Pole_Position <> 'Junior Strous' GROUP BY d.Driver_Name HAVING COUNT(*) = 1;
SELECT D.Driver_Name, D.Driver_ID FROM driver AS D JOIN race AS R ON D.Driver_ID = R.Driver_ID WHERE R.Pole_Position <> 'Junior Strous'
SELECT `Constructor` FROM `driver` ORDER BY `Age` ASC;
SELECT DISTINCT `Constructor` FROM `driver` ORDER BY `Age` ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20;
SELECT Entrant FROM driver WHERE Age >= 20
SELECT MAX(Age) AS Maximum_Age, MIN(Age) AS Minimum_Age FROM driver;
SELECT MAX(Age) as Maximum_Age, MIN(Age) as Minimum_Age FROM driver
SELECT COUNT(DISTINCT `Engine`) FROM driver WHERE `Age` > 30 OR `Age` < 20
SELECT COUNT(DISTINCT Engine) as Number_of_Different_Engines FROM driver WHERE Age >= 20 OR Age <= 30
error: No SQL found in the input string
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT driver.Driver_Name, race.Race_Name FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID;
SELECT driver.Driver_Name, race.Road FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID;
SELECT D.Driver_Name, COUNT(*) FROM driver AS D JOIN race AS R ON D.Driver_ID = R.Driver_ID GROUP BY D.Driver_Name;
SELECT driver.Driver_Name, COUNT(race.Race_Name) as Number_of_Races FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID;
error: No SQL found in the input string
SELECT Age FROM driver WHERE Driver_ID IN ( SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT driver.Driver_Name, driver.Age FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID HAVING COUNT(race.Race_Name) >= 2
SELECT d.Driver_Name, d.Age FROM driver d JOIN ( SELECT r.Driver_ID, COUNT(*) as race_count FROM race r GROUP BY r.Driver_ID HAVING COUNT(*) > 1 ) r ON d.Driver_ID = r.Driver_ID
SELECT race.Race_Name FROM race JOIN driver ON race.Driver_ID = driver.Driver_ID WHERE driver.Age >= 26;
SELECT Race_Name FROM race WHERE Driver_ID IN ( SELECT Driver_ID FROM driver WHERE Age >= 26 )
SELECT `Driver_Name` FROM `driver` WHERE `Constructor` != 'Bugatti'
SELECT Driver_Name FROM driver WHERE Constructor <> 'Bugatti'
SELECT D.`Constructor`, COUNT(*) FROM driver AS D JOIN race AS R ON D.`Driver_ID` = R.`Driver_ID` GROUP BY D.`Constructor`
SELECT `Constructor`, COUNT(`Driver_ID`) as `Number_of_Drivers` FROM driver GROUP BY `Constructor`;
SELECT `Engine`, COUNT(*) as `Count` FROM `driver` GROUP BY `Engine` ORDER BY `Count` DESC LIMIT 1;
error: No SQL found in the input string
SELECT D.`Engine` FROM driver AS D JOIN race AS R ON D.`Driver_ID` = R.`Driver_ID` GROUP BY D.`Engine` HAVING COUNT(DISTINCT R.`Driver_ID`) > 1
SELECT Engine, COUNT(DISTINCT Driver_ID) as Number_of_Drivers FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) > 1
SELECT D.Driver_Name FROM driver D WHERE D.Driver_ID NOT IN (SELECT R.Driver_ID FROM race R)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT DISTINCT Driver_ID FROM race)
SELECT D.`Constructor` FROM driver AS D WHERE D.`Age` < 20 INTERSECT SELECT D.`Constructor` FROM driver AS D WHERE D.`Age` > 30
SELECT d.Constructor, COUNT(*) FROM driver AS d JOIN race AS r ON d.Driver_ID = r.Driver_ID WHERE d.Age < 20 AND d.Age > 30 GROUP BY d.Constructor;
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(DISTINCT Winning_driver) > 1
SELECT Winning_team, COUNT(*) as num_wins FROM race GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT D.`Driver_Name` FROM driver AS D JOIN race AS R ON D.`Driver_ID` = R.`Driver_ID` WHERE R.`Pole_Position` = 'James Hinchcliffe' AND R.`Pole_Position` = 'Carl Skerlong' AND R.`Race_Name` IN ( SELECT R.`Race_Name` FROM race AS R WHERE R.`Pole_Position` = 'Carl Skerlong' GROUP BY R.`Race_Name` HAVING COUNT(DISTINCT R.`Pole_Position`) = 2 ) AND D.`Age` < (SELECT D.`Age` FROM driver AS D WHERE D.`Pole_Position` = 'Carl Skerlong')
SELECT D.`Driver_Name` FROM driver AS D JOIN race AS R ON D.`Driver_ID` = R.`Driver_ID` WHERE R.`Pole_Position` = 'James Hinchcliffe' AND R.`Pole_Position` = 'Carl Skerlong'
SELECT D.`Driver_Name` FROM driver AS D WHERE D.`Driver_ID` NOT IN ( SELECT R.`Driver_ID` FROM race AS R WHERE R.`Pole_Position` = 'James Hinchcliffe' AND R.`Fastest_Lap` = 'Jonathan Summerton' )
SELECT Driver_Name FROM driver WHERE Driver_Name != 'James Hinchcliffe'
SELECT COUNT(*) FROM languages
error: No SQL found in the input string
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC;
SELECT languages.name FROM languages JOIN official_languages ON official_languages.language_id = languages.id JOIN countries ON countries.id = official_languages.country_id WHERE countries.name LIKE '%ish%'
SELECT languages.name FROM languages JOIN official_languages ON official_languages.language_id = languages.id JOIN countries ON countries.id = official_languages.country_id WHERE languages.name LIKE '%ish%'
SELECT c.name, s.name, s.age, s.country_id, c.overall_score, c.health_score, c.education_score, c.economics_score, c.politics_score FROM singers s JOIN official_languages ol ON s.id = ol.country_id JOIN languages l ON ol.language_id = l.id JOIN countries c ON s.country_id = c.id WHERE s.age = (SELECT MIN(age) FROM singers) ORDER BY c.overall_score DESC;
SELECT countries.name, countries.overall_score FROM countries ORDER BY countries.overall_score DESC
SELECT AVG(justice_score) as average_justice_score FROM countries
SELECT AVG(justice_score) FROM countries
error: No SQL found in the input string
SELECT MAX(health_score) AS Max_Health_Score, MIN(health_score) AS Min_Health_Score FROM countries WHERE name != 'Norway'
SELECT COUNT(DISTINCT language_id) AS num_languages FROM official_languages
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT `name` FROM `countries` ORDER BY `education_score` DESC
SELECT countries.name, countries.education_score FROM countries ORDER BY countries.education_score DESC
SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'Polish' AND countries.politics_score = (SELECT MAX(politics_score) FROM countries WHERE languages.name = 'Polish')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT countries.name, languages.name FROM official_languages INNER JOIN countries ON official_languages.country_id = countries.id INNER JOIN languages ON official_languages.language_id = languages.id;
SELECT L.`name`, COUNT(*) FROM languages AS L JOIN official_languages AS OL ON L.`id` = OL.`language_id` GROUP BY L.`id`
SELECT L.name, COUNT(*) as count FROM languages AS L JOIN official_languages AS OL ON L.id = OL.language_id GROUP BY L.name;
SELECT L.name AS official_language, COUNT(C.id) AS number_of_countries FROM official_languages AS OL JOIN languages AS L ON OL.language_id = L.id JOIN countries AS C ON OL.country_id = C.id GROUP BY L.name ORDER BY number_of_countries DESC LIMIT 1;
SELECT languages.name FROM languages JOIN official_languages ON official_languages.language_id = languages.id GROUP BY languages.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT L.name AS official_languages FROM languages AS L WHERE L.id IN ( SELECT OL.language_id FROM official_languages AS OL GROUP BY OL.language_id HAVING COUNT(DISTINCT OL.country_id) >= 2 )
SELECT L1.name AS official_language FROM languages AS L1 WHERE ( SELECT COUNT(*) FROM official_languages AS OL WHERE OL.language_id = L1.id ) >= 2
SELECT AVG(countries.overall_score) FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'
SELECT AVG(countries.overall_score) FROM countries INNER JOIN official_languages ON countries.id = official_languages.country_id INNER JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'
SELECT languages.name, COUNT(*) as count FROM official_languages JOIN languages ON official_languages.language_id = languages.id GROUP BY official_languages.language_id ORDER BY count DESC LIMIT 3;
SELECT languages.name FROM official_languages JOIN countries ON official_languages.country_id = countries.id JOIN languages ON official_languages.language_id = languages.id GROUP BY languages.name ORDER BY COUNT(countries.id) DESC LIMIT 3;
SELECT languages.name, AVG(countries.overall_score) as average_overall_score FROM official_languages JOIN countries ON official_languages.country_id = countries.id JOIN languages ON official_languages.language_id = languages.id GROUP BY languages.name ORDER BY average_overall_score DESC
SELECT languages.name, AVG(countries.overall_score) as average_score FROM official_languages JOIN countries ON official_languages.country_id = countries.id JOIN languages ON official_languages.language_id = languages.id GROUP BY languages.name ORDER BY average_score DESC
SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id GROUP BY countries.id ORDER BY COUNT(official_languages.language_id) DESC LIMIT 1;
SELECT countries.name FROM countries JOIN official_languages ON official_languages.country_id = countries.id GROUP BY countries.name ORDER BY COUNT(official_languages.language_id) DESC LIMIT 1;
SELECT languages.name FROM languages WHERE languages.id NOT IN (SELECT official_languages.language_id FROM official_languages)
SELECT languages.name FROM languages WHERE languages.id NOT IN ( SELECT official_languages.language_id FROM official_languages );
SELECT countries.name FROM countries WHERE countries.id NOT IN (SELECT official_languages.country_id FROM official_languages)
SELECT countries.name FROM countries WHERE countries.id NOT IN (SELECT official_languages.country_id FROM official_languages)
SELECT languages.name FROM languages JOIN official_languages ON official_languages.language_id = languages.id JOIN countries ON countries.id = official_languages.country_id WHERE countries.overall_score > 95 AND countries.overall_score < 90;
SELECT languages.name FROM languages JOIN official_languages ON official_languages.language_id = languages.id JOIN countries ON countries.id = official_languages.country_id WHERE countries.overall_score > 95 AND countries.overall_score < 90
SELECT DISTINCT county_state_province, town_city FROM Addresses;
SELECT Addresses.country, Addresses.town_city FROM Addresses INNER JOIN Properties ON Addresses.address_id = Properties.property_address_id
SELECT Properties.`property_address_id`, Addresses.`county_state_province` FROM Properties JOIN Addresses ON Properties.`property_address_id` = Addresses.`address_id`
SELECT P.property_address_id, A.county_state_province FROM Properties P JOIN Addresses A ON P.property_address_id = A.address_id GROUP BY P.property_address_id, A.county_state_province;
SELECT Features.feature_description FROM Features WHERE EXISTS ( SELECT 1 FROM Property_Features WHERE Property_Features.feature_id = Features.feature_id AND Property_Features.feature_name = 'rooftop' );
error: No SQL found in the input string
SELECT feature_name, feature_description FROM Features WHERE feature_id IN ( SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1 )
error: No SQL found in the input string
SELECT MIN(room_count) as Minimum_Rooms FROM Rooms JOIN Properties ON Rooms.property_id = Properties.property_id
SELECT MIN(room_count) as Lowest_Room_Count FROM Properties;
SELECT COUNT(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 1;
SELECT COUNT(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT U.first_name, COUNT(P.property_id) as num_properties FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id GROUP BY U.first_name ORDER BY num_properties DESC LIMIT 1;
SELECT U.first_name FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id GROUP BY U.first_name ORDER BY COUNT(P.property_id) DESC LIMIT 1;
SELECT AVG(room_count) as average_room_count FROM Properties WHERE property_id IN ( SELECT property_id FROM Property_Features WHERE feature_id IN ( SELECT feature_id FROM Features WHERE feature_name = 'garden' ) )
SELECT AVG(Properties.room_count) as average_rooms FROM Properties INNER JOIN Property_Features ON Properties.property_id = Property_Features.property_id INNER JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Features.feature_name = 'garden';
SELECT DISTINCT t1.town_city FROM Addresses AS t1 JOIN Properties AS t2 ON t1.address_id = t2.property_address_id JOIN Property_Features AS t3 ON t2.property_id = t3.property_id JOIN Features AS t4 ON t3.feature_id = t4.feature_id WHERE t4.feature_name = 'swimming pool';
SELECT DISTINCT A.town_city FROM Properties AS P JOIN Addresses AS A ON P.property_address_id = A.address_id JOIN Property_Features AS F ON P.property_id = F.property_id JOIN Features AS FEAT ON F.feature_id = FEAT.feature_id WHERE FEAT.feature_name = 'swimming pool';
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1;
error: No SQL found in the input string
SELECT AVG(room_count) as average_rooms FROM Properties;
SELECT AVG(T1.room_count) as average_rooms FROM ( SELECT Properties.property_id, Properties.room_count FROM Properties JOIN Rooms ON Properties.property_id = Rooms.property_id ) as T1
SELECT COUNT(DISTINCT room_size) as room_sizes_count FROM Rooms
SELECT COUNT(DISTINCT `room_size`) as `Number_of_Different_Room_Sizes` FROM `Rooms`
SELECT U.user_id, U.login_name, S.search_string FROM Users U JOIN ( SELECT user_id, search_string FROM User_Searches GROUP BY user_id HAVING COUNT(search_string) >= 2 ) S ON U.user_id = S.user_id
SELECT U.user_id, U.login_name, US.search_seq FROM Users U JOIN ( SELECT user_id, search_seq FROM User_Searches GROUP BY user_id HAVING COUNT(*) >= 2 ) US ON U.user_id = US.user_id
error: No SQL found in the input string
SELECT MAX(search_datetime) as most_recent_search FROM User_Searches;
SELECT Users.first_name, Users.last_name, User_Searches.search_datetime, User_Searches.search_string FROM Users JOIN User_Searches ON Users.user_id = User_Searches.user_id ORDER BY User_Searches.search_string DESC;
SELECT `search_string`, `search_datetime` FROM `User_Searches` ORDER BY `search_datetime` DESC, `search_string` DESC
SELECT P.zip_postcode FROM Properties P WHERE P.property_id NOT IN ( SELECT UPH.property_id FROM User_Property_History UPH WHERE UPH.user_id IN ( SELECT U.user_id FROM Users U WHERE U.is_seller = 0 ) ) AND P.property_id IN ( SELECT PF.property_id FROM Property_Features PF WHERE PF.feature_id IN ( SELECT F.feature_id FROM Features F WHERE F.feature_name = 'garage_yn' AND F.feature_value = '1' ) ) AND P.property_id NOT IN ( SELECT P.property_id FROM Properties P WHERE P.property_id IN ( SELECT UPH.property_id FROM User_Property_History UPH WHERE UPH.user_id IN ( SELECT U.user_id FROM Users U WHERE U.is_seller = 0 ) ) ) GROUP BY P.zip_postcode HAVING COUNT(DISTINCT P.property_id) <= 2
SELECT zip_postcode FROM Properties WHERE property_id NOT IN ( SELECT property_id FROM User_Property_History WHERE user_id IN ( SELECT user_id FROM Users WHERE is_buyer = '1' ) ) AND property_id IN ( SELECT property_id FROM User_Property_History GROUP BY property_id HAVING COUNT(user_id) <= 2 )
error: No SQL found in the input string
SELECT U.user_id, U.user_category_code FROM Users U WHERE U.user_id IN ( SELECT US.user_id FROM User_Searches US GROUP BY US.user_id HAVING COUNT(DISTINCT US.search_seq) = 1 )
SELECT Users.age_category_code FROM Users JOIN User_Searches ON Users.user_id = User_Searches.user_id WHERE User_Searches.search_datetime = (SELECT MIN(User_Searches.search_datetime) FROM User_Searches)
SELECT U.age_category_code FROM Users U JOIN ( SELECT user_id, MIN(search_datetime) as earliest_search FROM User_Searches GROUP BY user_id ) US ON U.user_id = US.user_id ORDER BY US.earliest_search ASC LIMIT 1;
SELECT `login_name` FROM `Users` WHERE `user_category_code` = 'Senior Citizen' ORDER BY `first_name` ASC;
SELECT `login_name` FROM `Users` WHERE `age_category_code` = '25-60' AND `user_category_code` = 'Senior Citizen' ORDER BY `first_name`;
SELECT COUNT(DISTINCT Users.user_id) AS total_searches FROM User_Searches INNER JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = 1;
SELECT COUNT(*) FROM Users JOIN User_Searches ON Users.user_id = User_Searches.user_id WHERE Users.is_buyer = 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Users.first_name, Users.middle_name, Users.last_name, Users.login_name FROM Users WHERE Users.is_seller = '1'
SELECT `first_name`, `middle_name`, `last_name`, `login_name` FROM Users WHERE `is_seller` = 1;
error: No SQL found in the input string
SELECT Addresses.line_1_number_building, Addresses.line_2_number_street, Addresses.town_city FROM Users INNER JOIN Addresses ON Users.user_address_id = Addresses.address_id WHERE Users.user_category_code = 'Senior Citizen';
error: No SQL found in the input string
SELECT COUNT(*) FROM Properties WHERE property_id IN ( SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2 );
SELECT property_id, COUNT(*) as num_photos FROM Property_Photos GROUP BY property_id
SELECT P.property_id, COUNT(PP.photo_seq) as photo_count FROM Properties P JOIN Property_Photos PP ON P.property_id = PP.property_id GROUP BY P.property_id;
SELECT Users.user_id, COUNT(Properties.property_id) as num_photos FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Users.user_id;
SELECT Users.user_id, COUNT(Properties.property_id) as num_properties FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Users.user_id;
SELECT SUM(price_max) as total_max_price FROM Properties INNER JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN ('Single Mother', 'Student')
SELECT SUM(price_max) as total_max_price FROM Properties INNER JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN ('Single Mother', 'Student')
SELECT Users.date_registered, Properties.property_name FROM User_Property_History JOIN Users ON User_Property_History.user_id = Users.user_id JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp;
SELECT `datestamp`, `property_name` FROM `User_Property_History` JOIN `Properties` ON `User_Property_History`.`property_id` = `Properties`.`property_id` ORDER BY `datestamp`;
SELECT property_type_description, property_type_code FROM Ref_Property_Types WHERE property_type_description = 'house'
error: No SQL found in the input string
SELECT * FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `room_size`, COUNT(*) as `Number_of_Rooms` FROM `Rooms` GROUP BY `room_size`
error: No SQL found in the input string
SELECT U.country FROM Users U JOIN Addresses A ON U.user_address_id = A.address_id WHERE U.first_name = 'Robbie'
SELECT Users.first_name, Users.middle_name, Users.last_name FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id WHERE Properties.property_address_id = ( SELECT address_id FROM Addresses WHERE line_1_number_building = '929 Hermiston Vista Suite 955' );
SELECT CONCAT(Users.first_name, ' ', Users.last_name) as Full_Name FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id GROUP BY Users.user_id HAVING COUNT(DISTINCT Properties.property_id) > 0;
SELECT `search_string` FROM `User_Searches` WHERE `user_id` NOT IN ( SELECT DISTINCT `owner_user_id` FROM `Properties` )
error: No SQL found in the input string
SELECT U.last_name, U.user_id FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id JOIN User_Property_History UP ON P.property_id = UP.property_id JOIN ( SELECT user_id, COUNT(DISTINCT property_id) as property_count, SUM(CASE WHEN search_seq <= 2 THEN 1 ELSE 0 END) as search_count FROM User_Searches GROUP BY user_id HAVING COUNT(DISTINCT property_id) >= 2 AND SUM(CASE WHEN search_seq <= 2 THEN 1 ELSE 0 END) <= 2 ) AS S ON U.user_id = S.user_id
error: No SQL found in the input string
SELECT COUNT(*) FROM bike WHERE weight > 780
SELECT `product_name`, `weight` FROM `bike` ORDER BY `price` ASC
SELECT heat, name, nation FROM cyclist;
SELECT MAX(weight) AS Maximum_Weight, MIN(weight) AS Minimum_Weight FROM bike;
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
SELECT `name`, `result` FROM `cyclist` WHERE `nation` != 'Russia'
SELECT DISTINCT bike.id, bike.product_name FROM bike INNER JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015
SELECT bike.id, bike.product_name FROM bike WHERE bike.id IN ( SELECT cyclists_own_bikes.bike_id FROM cyclists_own_bikes GROUP BY cyclists_own_bikes.bike_id HAVING COUNT(DISTINCT cyclists_own_bikes.cyclist_id) >= 4 )
SELECT cyclist.id, cyclist.name FROM cyclist JOIN ( SELECT cyclist_id, COUNT(bike_id) as bike_count FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY bike_count DESC LIMIT 1 ) AS most_bikes ON cyclist.id = most_bikes.cyclist_id;
SELECT DISTINCT bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE (cyclist.nation = 'Russia' OR cyclist.nation = 'Great Britain');
SELECT COUNT(DISTINCT heat) as Number_of_Different_Heats FROM cyclist;
SELECT COUNT(DISTINCT cyclist.id) FROM cyclist LEFT JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id WHERE cyclists_own_bikes.bike_id IS NULL AND cyclists_own_bikes.purchase_year > 2015
SELECT DISTINCT bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.result > '4:21.558';
SELECT `product_name`, `price` FROM bike WHERE id IN ( SELECT bike_id FROM cyclists_own_bikes WHERE cyclist_id IN ( SELECT id FROM cyclist WHERE name IN ('Bradley Wiggins', 'Antonio Tauler') ) )
SELECT `name`, `nation`, `result` FROM `cyclist` WHERE `id` NOT IN (SELECT `cyclist_id` FROM `cyclists_own_bikes`)
SELECT product_name FROM bike WHERE material LIKE '%fiber%';
SELECT cyclist.id, cyclist.name, COUNT(cyclists_own_bikes.bike_id) as num_bikes FROM cyclist JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id GROUP BY cyclist.id ORDER BY cyclist.id;
SELECT g.Flavor, g.Price FROM goods AS g JOIN items AS i ON g.Id = i.Item JOIN receipts AS r ON i.Receipt = r.ReceiptNumber JOIN customers AS c ON r.CustomerId = c.Id WHERE g.Food = 'Cake' AND c.LastName = 'STENZ' GROUP BY g.Flavor, g.Price ORDER BY g.Price DESC LIMIT 1;
SELECT Id, Flavor FROM goods WHERE Food = 'Cake' AND Price = (SELECT MAX(Price) FROM goods WHERE Food = 'Cake')
SELECT Flavor, Price FROM goods WHERE Food = 'Cookie' ORDER BY Price ASC LIMIT 1;
SELECT Id, Flavor FROM goods WHERE Food = 'Cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'Cookie')
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Price < 3;
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT customers.Id FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'Chocolate' AND goods.Food = 'Cake'
SELECT DISTINCT customers.Id FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'Lemon' AND goods.Food = 'Cake';
SELECT g.Flavor, COUNT(DISTINCT r.CustomerId) as NumberOfCustomers FROM goods as g JOIN items as i ON g.Id = i.Item JOIN receipts as r ON i.Receipt = r.ReceiptNumber GROUP BY g.Flavor;
SELECT goods.Food, COUNT(DISTINCT receipts.CustomerId) AS NumberOfCustomers FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY goods.Food;
SELECT c.Id FROM customers AS c JOIN receipts AS r ON c.Id = r.CustomerId JOIN items AS i ON r.Receipt = i.Receipt GROUP BY c.Id HAVING COUNT(i.Item) >= 15
SELECT DISTINCT customers.Id FROM customers JOIN receipts ON customers.Id = receipts.CustomerId GROUP BY customers.Id HAVING COUNT(DISTINCT receipts.ReceiptNumber) >= 15
SELECT customers.LastName FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.Receipt = items.Receipt GROUP BY customers.LastName HAVING COUNT(items.Item) > 10
SELECT `LastName` FROM customers JOIN ( SELECT `CustomerId`, COUNT(*) as `Count` FROM receipts GROUP BY `CustomerId` ) AS `Receipts` ON `Customers`.`Id` = `Receipts`.`CustomerId` WHERE `Count` > 10
SELECT COUNT(DISTINCT items.Item) AS NumberOfCakes FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Food = 'Cake'
SELECT COUNT(DISTINCT Flavor) as NumberOfCakes FROM goods WHERE Food = 'Cake'
SELECT Flavor FROM goods WHERE Food = 'Croissant'
SELECT Flavor FROM goods WHERE Food = 'Croissant';
SELECT DISTINCT items.Item FROM items INNER JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = '15';
SELECT DISTINCT items.Item FROM items JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = '15';
SELECT goods.Flavor, AVG(goods.Price) AS AveragePrice, MAX(goods.Price) AS MaxPrice, MIN(goods.Price) AS MinPrice FROM goods GROUP BY goods.Flavor;
SELECT Flavor, AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Flavor;
SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'Cake' OR g.Food = 'Cookie' GROUP BY r.ReceiptNumber HAVING COUNT(DISTINCT g.Id) = 2
SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.Receipt = i.Receipt;
SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id JOIN customers c ON r.CustomerId = c.Id WHERE g.Food = 'Croissant' AND c.LastName = 'LOGAN';
SELECT `receipts`.`ReceiptNumber` FROM `receipts` JOIN `customers` ON `receipts`.`CustomerId` = `customers`.`Id` JOIN `items` ON `items`.`Item` = `goods`.`Id` JOIN `goods` ON `goods`.`Id` = `items`.`Item` WHERE `customers`.`LastName` = 'Logan' AND `goods`.`Food` = 'Croissant'
SELECT ReceiptNumber, Date FROM receipts INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id WHERE Price = (SELECT MAX(Price) FROM goods)
SELECT `ReceiptNumber`, `Date` FROM `receipts` INNER JOIN `items` ON `receipts`.`ReceiptNumber` = `items`.`Receipt` INNER JOIN `goods` ON `items`.`Item` = `goods`.`Id` WHERE `Price` = (SELECT MAX(`Price`) FROM `goods`);
SELECT goods.Item, COUNT(*) as NumberOfPurchases FROM receipts JOIN items ON receipts.Receipt = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY goods.Item ORDER BY NumberOfPurchases LIMIT 1;
SELECT goods.Item, COUNT(items.Item) as ItemCount FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id GROUP BY goods.Item ORDER BY ItemCount LIMIT 1;
SELECT goods.Flavor, COUNT(items.Item) as NumberOfGoods FROM goods JOIN items ON goods.Id = items.Item GROUP BY goods.Flavor
SELECT c.LastName, c.FirstName, COUNT(g.Id) as NumberOfGoods FROM customers c JOIN items i ON c.Id = i.CustomerId JOIN goods g ON i.Item = g.Id GROUP BY c.Id;
SELECT Flavor, AVG(Price) as AveragePrice FROM goods GROUP BY Flavor
SELECT Flavor, AVG(Price) as AveragePrice FROM goods GROUP BY Flavor
SELECT goods.Id FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id WHERE goods.Flavor = 'Apricot' AND goods.Price < 5;
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT goods.Flavor FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id WHERE goods.Food = 'Cake' AND goods.Price > 10 GROUP BY goods.Flavor
SELECT goods.Flavor FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id WHERE goods.Food = 'Cake' AND goods.Price > 10 GROUP BY goods.Flavor
SELECT DISTINCT goods.Id, goods.Price FROM goods WHERE goods.Price < (SELECT AVG(goods.Price) FROM goods)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT goods.Id FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON receipts.ReceiptNumber = items.Receipt WHERE goods.Food = 'Tart' AND goods.Price < (SELECT Price FROM goods WHERE Food = 'Tart')
SELECT DISTINCT Id FROM goods WHERE Flavor = 'Chocolate' AND Food = 'Tart' AND Price < (SELECT MIN(Price) FROM goods WHERE Flavor = 'Tart')
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT `Date` FROM `receipts` INNER JOIN `items` ON `receipts`.`ReceiptNumber` = `items`.`Receipt` INNER JOIN `goods` ON `items`.`Item` = `goods`.`Id` WHERE `goods`.`Price` > 15 GROUP BY `Date` HAVING COUNT(DISTINCT `ReceiptNumber`) = 1
SELECT `Date` FROM `receipts` WHERE `CustomerId` IN ( SELECT `Id` FROM `customers` WHERE `LastName` = 'STENZ' AND `FirstName` = 'SIXTA' ) AND `ReceiptNumber` IN ( SELECT `Receipt` FROM `items` WHERE `Item` = ( SELECT `Id` FROM `goods` WHERE `Price` > 15 ) )
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Id LIKE '%APP%';
SELECT goods.Flavor, goods.Price FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id = '70'
SELECT DISTINCT LastName FROM customers ORDER BY LastName ASC;
SELECT LastName FROM customers ORDER BY LastName ASC;
SELECT goods.Id AS ItemId FROM goods ORDER BY goods.Id;
SELECT g.Id FROM goods g JOIN items i ON g.Id = i.Item GROUP BY g.Id ORDER BY g.Id;
JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'Apple' OR r.CustomerId = 12 GROUP BY r.ReceiptNumber HAVING COUNT(DISTINCT g.Flavor) > 1
SELECT `ReceiptNumber` FROM `receipts` JOIN `items` ON `receipts`.`ReceiptNumber` = `items`.`Receipt` WHERE `items`.`Item` = 'Apple' OR `receipts`.`CustomerId` = 12;
SELECT * FROM receipts WHERE Date = (SELECT MAX(Date) FROM receipts)
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT r.ReceiptNumber, r.Date FROM receipts r JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id WHERE r.Date = (SELECT MIN(Date) FROM receipts) OR g.Price > 10;
SELECT r.ReceiptNumber FROM receipts r INNER JOIN items i ON r.Receipt = i.Receipt INNER JOIN goods g ON i.Item = g.Id WHERE g.Price > 10 OR r.Date = (SELECT MIN(Date) FROM receipts)
SELECT goods.Id, goods.Flavor, goods.Food, goods.Price FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id WHERE goods.Food = 'Cookie' OR goods.Food = 'Cake' AND goods.Price BETWEEN 3 AND 7;
SELECT goods.Id, goods.Flavor, goods.Price FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Food = 'Cake' AND goods.Price BETWEEN 3 AND 7
SELECT `FirstName`, `LastName` FROM customers JOIN receipts ON customers.`Id` = receipts.`CustomerId` JOIN items ON receipts.`ReceiptNumber` = items.`Receipt` WHERE items.`Ordinal` = ( SELECT MIN(`Ordinal`) FROM items JOIN receipts ON items.`Receipt` = receipts.`ReceiptNumber` JOIN customers ON receipts.`CustomerId` = customers.`Id` )
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM customers WHERE Id = (SELECT MIN(CustomerId) FROM receipts)
SELECT AVG(Price) as AveragePrice FROM goods WHERE Flavor IN ('Blackberry', 'Blueberry');
SELECT AVG(Price) as AveragePrice FROM goods WHERE Flavor IN ('Blackberry', 'Blueberry')
SELECT MIN(Price) FROM goods WHERE Flavor = 'Chocolate'
SELECT goods.Flavor, goods.Food, goods.Price FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE goods.Flavor = 'Cheese' AND goods.Price = ( SELECT MIN(Price) FROM goods WHERE goods.Flavor = 'Cheese' )
SELECT g.Flavor, MAX(g.Price) AS Highest_Price, MIN(g.Price) AS Lowest_Price, AVG(g.Price) AS Average_Price FROM goods AS g JOIN items AS i ON g.Id = i.Item JOIN receipts AS r ON i.Receipt = r.ReceiptNumber WHERE r.Date IN ( SELECT MAX(r2.Date) FROM receipts AS r2 WHERE r.Date = r2.Date ) GROUP BY g.Flavor ORDER BY g.Flavor;
SELECT goods.Flavor, MAX(receipts.Date) AS MaxDate, MIN(receipts.Date) AS MinDate, AVG(goods.Price) AS AveragePrice FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY goods.Flavor
SELECT `Flavor`, MIN(`Price`) AS `Lowest_Price`, MAX(`Price`) AS `Highest_Price` FROM `goods` GROUP BY `Flavor` ORDER BY `Flavor`;
SELECT Flavor, MIN(Price) AS Minimum_Price, MAX(Price) AS Maximum_Price FROM goods GROUP BY Flavor ORDER BY Flavor;
SELECT Date, COUNT(*) as ReceiptCount FROM receipts JOIN customers ON receipts.CustomerId = customers.Id GROUP BY Date ORDER BY ReceiptCount DESC LIMIT 3
SELECT `Date`, COUNT(*) as `NumberOfReceipts` FROM receipts JOIN customers ON receipts.`CustomerId` = customers.`Id` GROUP BY `Date` ORDER BY `NumberOfReceipts` DESC LIMIT 1;
SELECT c.FirstName, c.LastName, COUNT(i.Item) as NumberOfItems FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id ORDER BY NumberOfItems DESC LIMIT 1;
SELECT `CustomerId`, COUNT(*) as `NumberOfPurchases` FROM `receipts` GROUP BY `CustomerId` ORDER BY `NumberOfPurchases` DESC LIMIT 1
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT Date, COUNT(DISTINCT CustomerId) as NumberOfCustomers FROM receipts GROUP BY Date
SELECT `FirstName`, `LastName` FROM customers WHERE Id IN ( SELECT `CustomerId` FROM receipts WHERE `Date` IN ( SELECT `Date` FROM receipts WHERE `ReceiptNumber` IN ( SELECT `ReceiptNumber` FROM items WHERE `Item` = ( SELECT `Id` FROM goods WHERE `Flavor` = 'Apple' AND `Food` = 'Tart' ) ) ) )
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'Tart' AND goods.Flavor = 'Apple';
SELECT Id FROM goods WHERE Food = 'Croissant' AND Price < (SELECT Price FROM goods WHERE Food = 'Cookie')
SELECT goods.Id FROM goods WHERE goods.Food = 'Croissant' AND goods.Price < (SELECT goods.Price FROM goods WHERE goods.Food = 'Chocolate')
SELECT goods.Id FROM goods WHERE goods.Food = 'Tart' AND goods.Price >= (SELECT AVG(goods.Price) FROM goods WHERE goods.Food = 'Cake')
SELECT goods.Id FROM goods WHERE goods.Food = 'Tart' AND goods.Price >= (SELECT AVG(goods.Price) FROM goods WHERE goods.Food = 'Chocolate')
WITH AveragePrice AS ( SELECT AVG(Price) AS AveragePrice FROM goods ) SELECT Id FROM goods WHERE Price > 2 * (SELECT AveragePrice FROM AveragePrice);
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT goods.Id, goods.Flavor, goods.Food, goods.Price FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id WHERE customers.LastName = 'STENZ' AND customers.FirstName = 'SIXTA' ORDER BY goods.Price;
SELECT goods.Id, goods.Flavor, goods.Food FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id WHERE customers.LastName = 'STENZ' AND customers.FirstName = 'SIXTA' ORDER BY goods.Price;
SELECT goods.Id, goods.Flavor FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Food = 'Cake' ORDER BY goods.Flavor
SELECT goods.Id, goods.Flavor FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Food = 'Cake' ORDER BY goods.Flavor;
SELECT goods.Item, goods.Flavor, COUNT(*) as NumberOfPurchases FROM goods INNER JOIN items ON goods.Id = items.Item INNER JOIN receipts ON items.Receipt = receipts.ReceiptNumber INNER JOIN customers ON receipts.CustomerId = customers.Id WHERE goods.Flavor = 'Chocolate' AND customers.Id NOT IN ( SELECT receipts.CustomerId FROM receipts INNER JOIN items ON receipts.Receipt = items.Receipt GROUP BY receipts.CustomerId HAVING COUNT(DISTINCT items.Item) > 10 ) GROUP BY goods.Item, goods.Flavor
SELECT goods.Item, COUNT(items.Item) as ItemCount FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Flavor = 'Chocolate' GROUP BY goods.Item HAVING COUNT(items.Item) <= 10
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart');
SELECT Flavor FROM goods WHERE Food = 'Tart' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Cake');
SELECT g.Flavor, COUNT(i.Item) as ItemCount FROM goods as g JOIN items as i ON g.Id = i.Item GROUP BY g.Flavor ORDER BY ItemCount DESC LIMIT 3;
SELECT g.Flavor, COUNT(*) as PurchaseCount FROM goods as g JOIN items as i ON g.Id = i.Item JOIN receipts as r ON r.ReceiptNumber = i.Receipt GROUP BY g.Flavor ORDER BY PurchaseCount DESC LIMIT 3;
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id HAVING SUM(g.Price) > 150
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 150 GROUP BY c.Id HAVING COUNT(DISTINCT g.Id) = 6;
SELECT customers.Id, AVG(goods.Price) as AverageSpending FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY customers.Id HAVING AVG(goods.Price) > 5
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id HAVING AVG(g.Price) > 5;
SELECT r.Date, g.Flavor, SUM(g.Price) as TotalPrice FROM receipts r JOIN items i ON r.Receipt = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date, g.Flavor, g.Price HAVING SUM(g.Price) > 100 ORDER BY r.Date, TotalPrice DESC;
SELECT Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE Price * (SELECT COUNT(*) FROM items WHERE goods.Id = items.Item) > 100 GROUP BY Date HAVING COUNT(DISTINCT goods.Id) > 1
error: No SQL found in the input string
SELECT COUNT(DISTINCT driver.Driver_ID) AS Total_Drivers FROM driver JOIN team_driver ON driver.Driver_ID = team_driver.Driver_ID;
SELECT T.`Make`, COUNT(*) FROM team AS T JOIN team_driver AS TD ON T.`Team_ID` = TD.`Team_ID` JOIN driver AS D ON TD.`Driver_ID` = D.`Driver_ID` WHERE D.`Points` > 150 GROUP BY T.`Make`
SELECT t.`Make`, COUNT(*) as `Count` FROM team as t JOIN team_driver as td ON t.`Team_ID` = td.`Team_ID` JOIN driver as d ON td.`Driver_ID` = d.`Driver_ID` WHERE d.`Points` > 150 GROUP BY t.`Make`
SELECT `Make`, AVG(`Age`) as `Average_Age` FROM `driver` GROUP BY `Make`
SELECT `Make`, AVG(`Age`) as `Average_Age` FROM `driver` GROUP BY `Make`
SELECT AVG(`Laps`) as `Average_Laps` FROM `driver` WHERE `Age` < 20
SELECT AVG(`Laps`) FROM `driver` WHERE `Age` < 20
SELECT T.`Manager`, T.`Sponsor` FROM team AS T ORDER BY T.`Car_Owner`;
SELECT T.Manager, T.Sponsor, D.Car_Owner FROM team AS T JOIN team_driver AS TD ON T.Team_ID = TD.Team_ID JOIN driver AS D ON TD.Driver_ID = D.Driver_ID ORDER BY D.Car_Owner
SELECT T1.`Make`, COUNT(*) FROM team AS T1 JOIN team_driver AS T2 ON T1.`Team_ID` = T2.`Team_ID` GROUP BY T1.`Team_ID` HAVING COUNT(*) > 1
SELECT Make, COUNT(*) as Team_Count FROM team_driver JOIN team ON team_driver.Team_ID = team.Team_ID GROUP BY Make;
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington' AND Team = 'Henderson Motorsports';
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) AS Maximum_Points, MIN(Points) AS Minimum_Points FROM driver
SELECT MAX(Points) AS Highest_Points, MIN(Points) AS Lowest_Points FROM driver
SELECT COUNT(*) FROM driver WHERE Points < '150';
SELECT COUNT(*) FROM driver WHERE Points < 150
SELECT `Driver` FROM `driver` ORDER BY `Age` ASC
SELECT `Driver` FROM `driver` ORDER BY `Age` ASC
SELECT `Driver` FROM `driver` ORDER BY `Points` DESC
SELECT d.Driver, SUM(td.Points) as Total_Points FROM driver as d JOIN team_driver as td ON d.Driver_ID = td.Driver_ID GROUP BY d.Driver_ID ORDER BY Total_Points DESC
SELECT d.`Driver`, c.`Country` FROM driver as d JOIN country as c ON d.`Country` = c.`Country_Id`
SELECT `Driver`, `Country` FROM `driver`
SELECT MAX(Points) FROM driver WHERE Country = 4
SELECT MAX(Points) FROM driver WHERE Country = 2
SELECT AVG(D.Age) as Average_Age FROM country AS C JOIN driver AS D ON C.Country_Id = D.Country WHERE C.Official_native_language = 'English'
SELECT AVG(d.Age) as Average_Age FROM driver as d JOIN team_driver as td ON d.Driver_ID = td.Driver_ID JOIN team as t ON td.Team_ID = t.Team_ID WHERE t.Official_native_language = 'English'
SELECT DISTINCT country.Country FROM country JOIN driver ON country.Country_Id = driver.Country WHERE driver.Points > 150
SELECT DISTINCT country.Country FROM country JOIN driver ON country.Country_Id = driver.Country WHERE driver.Points > 150
SELECT `Capital` FROM `country` WHERE `Country_Id` = (SELECT `Country` FROM `driver` WHERE `Points` = (SELECT MAX(`Points`) FROM `driver`));
SELECT `Country`, `Capital` FROM `country` WHERE `Country_Id` = (SELECT `Country` FROM `driver` WHERE `Points` = (SELECT MAX(`Points`) FROM `driver`));
SELECT `Make`, COUNT(*) as `Number_of_Drivers` FROM `team` INNER JOIN `team_driver` ON `team`.`Team_ID` = `team_driver`.`Team_ID` GROUP BY `Make`
SELECT `Make`, COUNT(*) FROM `team` JOIN `team_driver` ON `team`.`Team_ID` = `team_driver`.`Team_ID` GROUP BY `Make`
SELECT T.`Make`, COUNT(*) as `Number_of_Drivers` FROM team as T JOIN team_driver as TD ON T.`Team_ID` = TD.`Team_ID` GROUP BY T.`Make` ORDER BY `Number_of_Drivers` DESC LIMIT 1
SELECT Make, COUNT(*) as NumberOfDrivers FROM team_driver INNER JOIN team ON team_driver.Team_ID = team.Team_ID GROUP BY Make ORDER BY NumberOfDrivers DESC LIMIT 1;
SELECT D.`Make` FROM driver AS D JOIN team_driver AS TD ON D.`Driver_ID` = TD.`Driver_ID` GROUP BY D.`Make` HAVING COUNT(D.`Driver_ID`) >= 3
SELECT Make FROM ( SELECT Make, COUNT(*) as Driver_Count FROM team_driver INNER JOIN team ON team_driver.Team_ID = team.Team_ID GROUP BY Make ) as T1 WHERE Driver_Count >= 3
SELECT T.`Team` FROM team AS T LEFT JOIN team_driver AS TD ON T.`Team_ID` = TD.`Team_ID` WHERE TD.`Driver_ID` IS NULL
SELECT team.Team FROM team LEFT JOIN team_driver ON team.Team_ID = team_driver.Team_ID WHERE team_driver.Team_ID IS NULL
SELECT DISTINCT country.Country FROM country WHERE country.Country IN ( SELECT country.Country FROM country WHERE country.Country IN ( SELECT team_driver.Team_ID FROM team_driver WHERE team_driver.Driver_ID IN ( SELECT driver.Driver_ID FROM driver WHERE driver.Make = 'Dodge' ) ) AND country.Country IN ( SELECT team_driver.Team_ID FROM team_driver WHERE team_driver.Driver_ID IN ( SELECT driver.Driver_ID FROM driver WHERE driver.Make = 'Chevrolet' ) ) )
SELECT DISTINCT country.Country FROM country JOIN team ON country.Country_Id = team.Country WHERE team.Make IN ('Dodge', 'Chevrolet')
SELECT SUM(CAST(Points AS INT)) AS Total_Points, AVG(CAST(Points AS INT)) AS Average_Points FROM driver
SELECT SUM(CAST(Points AS INTEGER)) AS Total_Points, AVG(CAST(Points AS FLOAT)) AS Average_Points FROM driver;
SELECT country.Country FROM country WHERE country.Country_Id NOT IN (SELECT DISTINCT country.Country_Id FROM driver)
SELECT `Country` FROM `country` WHERE `Country_Id` NOT IN (SELECT DISTINCT `Country` FROM `driver`)
SELECT T.`Manager`, T.`Sponsor`, COUNT(TD.`Driver_ID`) AS `Number_of_Drivers` FROM `team` AS T JOIN `team_driver` AS TD ON T.`Team_ID` = TD.`Team_ID` GROUP BY T.`Manager`, T.`Sponsor` ORDER BY COUNT(TD.`Driver_ID`) DESC LIMIT 1;
SELECT T1.`Manager`, T1.`Sponsor` FROM team AS T1 JOIN (SELECT `Team_ID`, COUNT(*) AS `Num_Drivers` FROM team_driver GROUP BY `Team_ID` ORDER BY `Num_Drivers` DESC LIMIT 1) AS T2 ON T1.`Team_ID` = T2.`Team_ID`
SELECT T.Manager, D.Car_Owner FROM team AS T JOIN ( SELECT TD.Team_ID FROM team_driver AS TD GROUP BY TD.Team_ID HAVING COUNT(*) >= 2 ) AS SubQuery ON T.Team_ID = SubQuery.Team_ID JOIN driver AS D ON T.Manager = D.Driver_ID AND D.Car_Owner IS NOT NULL
SELECT T.`Team`, TD.`Manager`, TD.`Car_Owner` FROM team AS T JOIN team_driver AS TD ON T.`Team_ID` = TD.`Team_ID` JOIN driver AS D ON TD.`Driver_ID` = D.`Driver_ID`
error: No SQL found in the input string
SELECT i.Name, i.Team, i.City, i.Province, i.Founded, i.Affiliation, i.Enrollment, i.Endowment, i.Stadium, i.Capacity, c.Nickname, c.Joined, c.Number_of_Championships FROM institution i LEFT JOIN Championship c ON i.Institution_ID = c.Institution_ID
SELECT Name FROM institution ORDER BY Name ASC
SELECT `Name`, `Team`, `City`, `Province`, `Founded`, `Affiliation`, `Enrollment`, `Endowment`, `Stadium`, `Capacity` FROM `institution` WHERE `Institution_ID` IN (SELECT `Institution_ID` FROM `Championship`);
SELECT Name FROM institution ORDER BY `Founded` ASC
SELECT `Name`, `Founded` FROM institution WHERE `Founded` = (SELECT MIN(`Founded`) FROM institution)
SELECT i1.City, i1.Province FROM institution i1 JOIN institution i2 ON i1.Institution_ID = i2.Institution_ID WHERE i2.Institution_ID IN ( SELECT Institution_ID FROM Championship )
SELECT `Name`, `Founded` FROM institution WHERE `Institution_ID` IN (SELECT `Institution_ID` FROM Championship WHERE `Number_of_Championships` > 0)
SELECT MAX(Enrollment) AS Maximum_Enrollment, MIN(Enrollment) AS Minimum_Enrollment FROM institution;
SELECT MAX(Enrollment) as Maximum_Enrollment, MIN(Enrollment) as Minimum_Enrollment FROM institution
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT `Affiliation` FROM `institution` WHERE `City` != 'Vancouver'
SELECT `Stadium` FROM `institution` ORDER BY `Capacity` DESC
SELECT `Stadium` FROM `institution` ORDER BY `Capacity` DESC
error: No SQL found in the input string
SELECT `Stadium` FROM institution WHERE `Enrollment` = (SELECT MAX(`Enrollment`) FROM institution)
SELECT institution.Name, Championship.Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID;
SELECT institution.Name AS Institution_Name, institution.Team AS Institution_Team, institution.City AS Institution_City, institution.Province AS Institution_Province, institution.Founded AS Institution_Founded, institution.Affiliation AS Institution_Affiliation, institution.Enrollment AS Institution_Enrollment, institution.Endowment AS Institution_Endowment, institution.Stadium AS Institution_Stadium, institution.Capacity AS Institution_Capacity, championship.Nickname AS Championship_Nickname, championship.Joined AS Championship_Joined, championship.Number_of_Championships AS Championship_Number_of_Championships FROM institution JOIN championship ON institution.Institution_ID = championship.Institution_ID;
SELECT Nickname FROM Championship WHERE Institution_ID = (SELECT MIN(Institution_ID) FROM institution)
SELECT Nickname FROM Championship WHERE Institution_ID = (SELECT Institution_ID FROM institution ORDER BY Enrollment ASC LIMIT 1)
SELECT i.`Name`, i.`Founded` FROM institution i JOIN championship c ON i.`Institution_ID` = c.`Institution_ID` ORDER BY c.`Number_of_Championships` DESC
SELECT i.`Name`, SUM(c.`Number_of_Championships`) as `Total_Championships` FROM institution i JOIN championship c ON i.`Institution_ID` = c.`Institution_ID` GROUP BY i.`Name` ORDER BY `Total_Championships` DESC
SELECT `Name` FROM institution WHERE `Institution_ID` IN (SELECT `Institution_ID` FROM Championship)
SELECT T1.`Name` FROM institution AS T1 JOIN Championship AS T2 ON T1.`Institution_ID` = T2.`Institution_ID` WHERE T2.`Number_of_Championships` = (SELECT MAX(T2.`Number_of_Championships`) FROM Championship AS T2)
SELECT COUNT(*) FROM Championship WHERE Institution_ID IN (SELECT Institution_ID FROM Institution WHERE Affiliation = 'Public')
SELECT COUNT(*) FROM Championship WHERE Institution_ID IN (SELECT Institution_ID FROM institution WHERE Affiliation = 'Public')
SELECT Affiliation, COUNT(*) as NumberOfInstitutions FROM institution GROUP BY Affiliation;
SELECT Affiliation, COUNT(*) as Number_of_Institutions FROM institution GROUP BY Affiliation;
SELECT Affiliation, COUNT(*) as count FROM institution GROUP BY Affiliation ORDER BY count DESC LIMIT 1;
SELECT Affiliation, COUNT(*) as Affiliation_Count FROM institution GROUP BY Affiliation ORDER BY Affiliation_Count DESC LIMIT 1
SELECT `Founded` FROM institution WHERE `Founded` IN ( SELECT `Founded` FROM institution GROUP BY `Founded` HAVING COUNT(*) > 1 )
SELECT `Founded`, COUNT(*) as `Number_of_Institutions` FROM institution WHERE `Founded` IN ( SELECT `Founded` FROM institution GROUP BY `Founded` HAVING COUNT(*) > 1 ) GROUP BY `Founded`
SELECT `institution`.`Name`, `institution`.`Capacity` FROM `institution` JOIN `Championship` ON `institution`.`Institution_ID` = `Championship`.`Institution_ID` ORDER BY `institution`.`Capacity` DESC
SELECT c.Nickname, i.Capacity FROM Championship c JOIN Institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC;
SELECT SUM(Enrollment) FROM institution WHERE City = 'Vancouver' OR City = 'Calgary';
SELECT `Enrollment` FROM `institution` WHERE `City` = 'Vancouver' OR `City` = 'Calgary'
SELECT DISTINCT T1.`Province` FROM institution AS T1 JOIN institution AS T2 ON T1.`Founded` < T2.`Founded` AND T1.`Institution_ID` = T2.`Institution_ID`
SELECT DISTINCT Province FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID WHERE institution.Founded < 1920 AND Championship.Joined > 1950
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
SELECT Warehouses.Code, Warehouses.Location, Warehouses.Capacity FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code, Warehouses.Location, Warehouses.Capacity
SELECT * FROM Warehouses;
SELECT DISTINCT `Contents` FROM `Boxes` WHERE `Warehouse` = (SELECT `Code` FROM `Warehouses` WHERE `Location` = 'New York')
SELECT DISTINCT `Contents` FROM `Boxes` WHERE `Warehouse` = (SELECT `Code` FROM `Warehouses` WHERE `Location` = 'New York');
SELECT Boxes.Contents FROM Boxes JOIN Warehouses ON Boxes.`Warehouse` = Warehouses.`Code` WHERE Boxes.`Value` > 150
SELECT `Contents` FROM `Boxes` WHERE `Value` > 150
SELECT Warehouses.Code, AVG(Boxes.Value) as Average_Value FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code, AVG(Boxes.Value) as Average_Value FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT AVG(Warehouses.Capacity) as Average_Capacity, SUM(Boxes.Value) as Total_Value FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse
SELECT AVG(Value) AS Average_Value, SUM(Value) AS Total_Value FROM Boxes
SELECT AVG(Capacity) AS Average_Capacity, SUM(Capacity) AS Total_Capacity FROM Warehouses;
SELECT AVG(Capacity) AS Average_Capacity, SUM(Capacity) AS Total_Capacity FROM Warehouses
SELECT Contents, AVG(Value) as Average_Value, MAX(Value) as Maximum_Value FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) as Average_Value, MAX(Value) as Maximum_Value FROM Boxes GROUP BY Contents
SELECT `Contents`, SUM(`Value`) as `Total_Value` FROM `Boxes` WHERE `Warehouse` IN (SELECT `Code` FROM `Warehouses`) GROUP BY `Contents` ORDER BY `Total_Value` DESC LIMIT 1
SELECT Contents FROM Boxes ORDER BY Value DESC LIMIT 1;
SELECT AVG(Value) FROM Boxes
SELECT AVG(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT `Contents` FROM `Boxes`
SELECT COUNT(DISTINCT `Contents`) FROM `Boxes`
SELECT COUNT(DISTINCT `Contents`) FROM `Boxes`
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT Warehouses.Code FROM Warehouses WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT Boxes.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Warehouses.Location IN ('Chicago', 'New York');
SELECT SUM(Value) as TotalValue FROM Boxes INNER JOIN Warehouses ON Boxes.`Warehouse` = Warehouses.`Code` WHERE Warehouses.`Location` IN ('Chicago', 'New York');
SELECT Warehouses.Location, SUM(Boxes.Value) as TotalValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Warehouses.Location IN ('Chicago', 'New York') GROUP BY Warehouses.Location;
SELECT Warehouses.Location, Boxes.Contents FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE (Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York')
SELECT DISTINCT B1.Contents FROM Boxes B1, Boxes B2, Warehouses W1, Warehouses W2 WHERE B1.Warehouse = W1.Code AND B2.Warehouse = W2.Code AND W1.Location = 'Chicago' AND W2.Location = 'New York' AND B1.Contents IN (SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') AND Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York'))
SELECT `Contents` FROM `Boxes` WHERE `Warehouse` NOT IN (SELECT `Code` FROM `Warehouses` WHERE `Location` = 'New York')
SELECT `Contents` FROM `Boxes` WHERE `Warehouse` = 'New York' AND `Contents` NOT IN (SELECT `Contents` FROM `Boxes` WHERE `Warehouse` = 'Chicago');
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks' AND Boxes.Contents != 'Scissors'
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks' AND Boxes.Contents != 'Scissors'
SELECT Warehouses.Code, Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents IN ('Rocks', 'Scissors')
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks' OR Boxes.Contents = 'Scissors'
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks' AND Boxes.Contents = 'Scissors'
SELECT T1.`Code`, T1.`Contents`, T1.`Value` FROM Boxes AS T1 ORDER BY T1.`Value`
SELECT `Code`, `Contents` FROM `Boxes` ORDER BY `Value`
SELECT `Code`, `Contents` FROM `Boxes` WHERE `Value` = (SELECT MIN(`Value`) FROM `Boxes`)
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT DISTINCT `Contents` FROM `Boxes` WHERE `Value` > (SELECT AVG(`Value`) FROM `Boxes`)
SELECT `Contents` FROM `Boxes` WHERE `Value` > (SELECT AVG(`Value`) FROM `Boxes`)
SELECT DISTINCT b.Contents FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code ORDER BY b.Contents ASC;
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC;
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Value > (SELECT Boxes.Value FROM Boxes WHERE Boxes.Contents = 'Rocks')
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Value > (SELECT MAX(Boxes2.Value) FROM Boxes AS Boxes2 WHERE Boxes2.Contents = 'Rocks')
SELECT `Code`, `Contents` FROM `Boxes` WHERE `Value` > (SELECT `Value` FROM `Boxes` WHERE `Contents` = 'Scissors')
SELECT W.Code, B.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents = 'Scissors' AND B.Value > ( SELECT B2.Value FROM Boxes B2 WHERE B2.Contents = 'Scissors' AND B2.Warehouse = W.Code )
SELECT SUM(Value) FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses ORDER BY Capacity DESC LIMIT 1)
SELECT SUM(Boxes.Value) as TotalValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Warehouses.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT Warehouses.Code, AVG(Boxes.Value) as AverageValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING AVG(Boxes.Value) > 150
SELECT Warehouses.Code, AVG(Boxes.Value) as Average_Value FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING AVG(Boxes.Value) > 150
SELECT `Contents`, SUM(`Value`) AS `Total Value`, COUNT(*) AS `Number of Boxes` FROM `Boxes` GROUP BY `Contents`
SELECT `Contents`, COUNT(*) as `Number of Boxes`, SUM(`Value`) as `Total Value` FROM Boxes GROUP BY `Contents`
SELECT Location, SUM(Capacity) as Total_Capacity, AVG(Capacity) as Average_Capacity, MAX(Capacity) as Maximum_Capacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) as Total_Capacity, AVG(Capacity) as Average_Capacity, MAX(Capacity) as Maximum_Capacity FROM Warehouses GROUP BY Location
SELECT SUM(Capacity) FROM Warehouses
SELECT SUM(Capacity) as Total_Capacity FROM Warehouses;
SELECT Warehouses.Location, MAX(Boxes.Value) as Max_Value FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT Warehouses.Location, MAX(Boxes.Value) as Max_Value FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT Warehouses.Code, COUNT(*) as NumberOfBoxes FROM Warehouses LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Location, COUNT(Boxes.Code) as NumberOfBoxes FROM Warehouses LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location;
SELECT COUNT(DISTINCT Warehouses.Location) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks'
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents = 'Rocks'
SELECT Boxes.Code, Warehouses.Location FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
SELECT Warehouses.Code, Warehouses.Location, Boxes.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse
SELECT `Code` FROM `Boxes` WHERE `Warehouse` IN (SELECT `Code` FROM `Warehouses` WHERE `Location` = 'Chicago')
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Warehouses.Location = 'Chicago'
SELECT Warehouses.`Code`, COUNT(*) FROM Warehouses JOIN Boxes ON Warehouses.`Code` = Boxes.`Warehouse` GROUP BY Warehouses.`Code`
SELECT Warehouses.Location, COUNT(Boxes.Code) as Boxes_Count FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location;
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) as NumberOfContents FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code FROM Warehouses WHERE Warehouses.Capacity < (SELECT MAX(Capacity) FROM Warehouses)
SELECT Warehouses.Code FROM Warehouses JOIN ( SELECT Warehouse, COUNT(*) as BoxesCount FROM Boxes GROUP BY Warehouse ) as BoxesCounts ON Warehouses.Code = BoxesCounts.Warehouse WHERE BoxesCounts.BoxesCount > Warehouses.Capacity
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT SUM(Value) as TotalValue FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT `University_Name`, `City`, `State` FROM university WHERE `University_ID` IN (SELECT `University_ID` FROM overall_ranking);
SELECT `University_Name`, `City`, `State` FROM `university` ORDER BY `University_Name` ASC;
SELECT COUNT(*) FROM university WHERE (State = 'Illinois' OR State = 'Ohio')
SELECT COUNT(*) FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT MIN(Enrollment) as Minimum_Enrollment FROM university
SELECT MAX(Enrollment) AS Maximum_Enrollment, AVG(Enrollment) AS Average_Enrollment, MIN(Enrollment) AS Minimum_Enrollment FROM university;
SELECT `Team_Name` FROM university WHERE `Enrollment` > (SELECT AVG(`Enrollment`) FROM university)
SELECT u.Team_Name FROM university u JOIN overall_ranking or ON u.University_ID = or.University_ID WHERE or.Enrollment > (SELECT AVG(or.Enrollment) FROM overall_ranking or JOIN university u ON u.University_ID = or.University_ID)
SELECT DISTINCT Home_Conference FROM university
error: No SQL found in the input string
SELECT `Home_Conference`, COUNT(*) FROM university GROUP BY `Home_Conference`
SELECT `Home_Conference`, COUNT(*) as `Number_of_Universities` FROM university WHERE `Home_Conference` IN ( SELECT `Home_Conference` FROM university GROUP BY `Home_Conference` HAVING COUNT(*) > 1 ) GROUP BY `Home_Conference`
SELECT `State`, COUNT(*) as `Number_of_Universities` FROM `university` GROUP BY `State` ORDER BY `Number_of_Universities` DESC LIMIT 1;
SELECT State, COUNT(*) as UniversityCount FROM university GROUP BY State ORDER BY UniversityCount DESC LIMIT 1;
SELECT `Home_Conference`, AVG(`Enrollment`) as `Average_Enrollment` FROM `university` GROUP BY `Home_Conference` HAVING `Average_Enrollment` > 2000
SELECT `Home_Conference` FROM `university` WHERE `Enrollment` > 2000
SELECT `Home_Conference` FROM `university` WHERE `Enrollment` = (SELECT MIN(`Enrollment`) FROM `university`)
SELECT `Home_Conference`, COUNT(*) as `Number_of_Enrollment` FROM university GROUP BY `Home_Conference` ORDER BY `Number_of_Enrollment` ASC LIMIT 1;
SELECT `Major_Name`, `Major_Code` FROM `major` ORDER BY `Major_Code`
SELECT `Major_Name`, `Major_Code` FROM `major` ORDER BY `Major_Code`
SELECT `Major_Name`, `Major_Code` FROM major WHERE Major_ID IN (SELECT Major_ID FROM major_ranking WHERE University_ID = (SELECT University_ID FROM university WHERE University_Name = 'Augustana College'))
SELECT major.Major_Name, major_ranking.Rank FROM major_ranking JOIN major ON major_ranking.Major_ID = major.Major_ID JOIN university ON major_ranking.University_ID = university.University_ID WHERE university.University_Name = 'Augustana College';
error
SELECT `University_Name`, `City`, `State` FROM university WHERE `University_ID` = ( SELECT `University_ID` FROM major_ranking WHERE `Rank` = 1 )
SELECT u.University_Name FROM university u JOIN ( SELECT mr.University_ID, COUNT(*) as major_count FROM major_ranking mr GROUP BY mr.University_ID ) m ON u.University_ID = m.University_ID WHERE m.major_count = ( SELECT MAX(major_count) FROM ( SELECT COUNT(*) as major_count FROM major_ranking GROUP BY University_ID ) )
SELECT u.University_Name FROM major_ranking AS mr JOIN university AS u ON mr.University_ID = u.University_ID GROUP BY u.University_ID ORDER BY COUNT(mr.Major_ID) DESC LIMIT 1;
SELECT university.University_Name FROM university LEFT JOIN major_ranking ON university.University_ID = major_ranking.University_ID WHERE major_ranking.Rank = 1 AND major_ranking.Major_ID IS NULL
SELECT university.University_Name FROM university WHERE university.University_ID NOT IN ( SELECT major_ranking.University_ID FROM major_ranking WHERE major_ranking.Rank = 1 )
SELECT university.University_Name FROM university JOIN major_ranking ON university.University_ID = major_ranking.University_ID WHERE major_ranking.Major_ID IN ( SELECT major_ID FROM major WHERE major_Name IN ('Accounting', 'Urban Education') ) GROUP BY university.University_Name HAVING COUNT(DISTINCT major_ranking.Major_ID) = 2;
SELECT university.University_Name FROM university WHERE university.University_ID IN ( SELECT major_ranking.University_ID FROM major_ranking WHERE major_ranking.Major_ID IN ( SELECT major.Major_ID FROM major WHERE major.Major_Name = 'Accounting' ) ) AND university.University_ID IN ( SELECT major_ranking.University_ID FROM major_ranking WHERE major_ranking.Major_ID IN ( SELECT major.Major_ID FROM major WHERE major.Major_Name = 'Urban Education' ) )
SELECT `university`.`University_Name`, `overall_ranking`.`Rank` FROM `university` JOIN `overall_ranking` ON `overall_ranking`.`University_ID` = `university`.`University_ID` WHERE `university`.`State` = 'Wisconsin'
SELECT university.University_Name, major_ranking.Rank FROM university JOIN major_ranking ON university.University_ID = major_ranking.University_ID WHERE university.State = 'Wisconsin' ORDER BY major_ranking.Rank;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `University_Name` FROM `university` JOIN `overall_ranking` ON `university`.`University_ID` = `overall_ranking`.`University_ID` ORDER BY `overall_ranking`.`Reputation_point` ASC;
SELECT university.University_Name, overall_ranking.Reputation_point FROM overall_ranking JOIN university ON overall_ranking.University_ID = university.University_ID ORDER BY overall_ranking.Reputation_point ASC;
SELECT university.University_Name FROM university JOIN major_ranking ON university.University_ID = major_ranking.University_ID WHERE major_ranking.Rank >= 3;
SELECT u.University_Name FROM university u JOIN overall_ranking or1 ON u.University_ID = or1.University_ID JOIN major_ranking mr1 ON u.University_ID = mr1.University_ID WHERE or1.Rank <= 3 AND mr1.Rank <= 3;
SELECT SUM(university.Enrollment) FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE overall_ranking.Rank <= 5
SELECT SUM(overall_ranking.Total) FROM overall_ranking JOIN university ON overall_ranking.University_ID = university.University_ID WHERE overall_ranking.Rank <= 5
SELECT university.University_Name, overall_ranking.Citation_point, major.Major_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID JOIN major_ranking ON university.University_ID = major_ranking.University_ID JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE overall_ranking.Reputation_point > 0.0 ORDER BY overall_ranking.Reputation_point DESC, major.Major_Name ASC LIMIT 3;
SELECT `University_Name`, `Citation_point` FROM `university` JOIN `overall_ranking` ON `university`.`University_ID` = `overall_ranking`.`University_ID` WHERE `overall_ranking`.`Reputation_point` = ( SELECT MAX(`Reputation_point`) FROM `overall_ranking` );
SELECT University_Name FROM university WHERE Enrollment < 3000 GROUP BY University_Name HAVING COUNT(*) > 2
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(University_ID) > 2
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT Movies.Title FROM Movies WHERE Movies.Rating IS NULL
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Movies.Title FROM Movies WHERE Rating = 'G'
SELECT Movies.Title FROM Movies JOIN MovieTheaters ON MovieTheaters.Movie = Movies.Code WHERE MovieTheaters.Name = 'Odeon'
SELECT Movies.Title FROM Movies INNER JOIN MovieTheaters ON MovieTheaters.Movie = Movies.Code WHERE MovieTheaters.Name = 'Odeon';
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie GROUP BY Movies.Title
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(*) FROM Movies
SELECT COUNT(*) FROM Movies
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) as NumberOfMovies FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Code) FROM MovieTheaters
SELECT `Rating` FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT MovieTheaters.Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating IN ('G', 'PG')
SELECT MovieTheaters.Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating IN ('G', 'PG')
SELECT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name IN ('Odeon', 'Imperial')
SELECT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name = 'Odeon' OR MovieTheaters.Name = 'Imperial';
SELECT Movies.Title FROM Movies WHERE Movies.Code IN ( SELECT MovieTheaters.Movie FROM MovieTheaters WHERE MovieTheaters.Name IN ('Odeon', 'Imperial') )
SELECT Movies.Title FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE MovieTheaters.Name IN ('Odeon', 'Imperial') GROUP BY Movies.Title HAVING COUNT(DISTINCT MovieTheaters.Name) = 2;
SELECT Movies.Title FROM Movies WHERE Movies.Code NOT IN ( SELECT MovieTheaters.Movie FROM MovieTheaters WHERE MovieTheaters.Name = 'Odeon' )
SELECT Movies.Title FROM Movies WHERE Movies.Code NOT IN (SELECT MovieTheaters.Movie FROM MovieTheaters WHERE MovieTheaters.Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title, Rating FROM Movies ORDER BY Rating
SELECT Title, Rating FROM Movies ORDER BY Rating
SELECT `Name`, COUNT(*) as `Number of Movies` FROM MovieTheaters JOIN Movies ON MovieTheaters.`Movie` = Movies.`Code` GROUP BY MovieTheaters.`Name` ORDER BY `Number of Movies` DESC LIMIT 1
error: No SQL found in the input string
SELECT M.Title, COUNT(*) as NumberOfTheaters FROM Movies as M JOIN MovieTheaters as MT ON M.Code = MT.Movie GROUP BY M.Title ORDER BY NumberOfTheaters DESC LIMIT 1
SELECT Movies.Title, COUNT(MovieTheaters.Code) as NumberOfTheaters FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie GROUP BY Movies.Title ORDER BY NumberOfTheaters DESC LIMIT 1;
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies)
SELECT DISTINCT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies)
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT MovieTheaters.Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating = 'G'
SELECT MovieTheaters.Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating = 'G'
error: No SQL found in the input string
SELECT Title FROM Movies;
SELECT DISTINCT Rating FROM Movies
error: No SQL found in the input string
SELECT * FROM Movies WHERE Rating IS NULL
SELECT * FROM Movies WHERE Rating IS NULL
SELECT Movies.Title FROM Movies WHERE Movies.Code NOT IN (SELECT MovieTheaters.Movie FROM MovieTheaters)
SELECT Movies.Title FROM Movies WHERE Movies.Code NOT IN (SELECT MovieTheaters.Movie FROM MovieTheaters)
SELECT Client.Name, SUM(Package.Weight) as TotalWeight FROM Client JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Client.Name ORDER BY TotalWeight DESC LIMIT 1;
SELECT Client.Name FROM Client JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Package.PackageNumber ORDER BY SUM(Package.Weight) DESC LIMIT 1;
SELECT SUM(Weight) as TotalWeight FROM Package WHERE Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT SUM(Weight) as TotalWeight FROM Package WHERE Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT AVG(Salary) as Average_Salary FROM Employee WHERE Position = 'Intern'
error: No SQL found in the input string
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'Physician';
SELECT `PackageNumber` FROM `Package` WHERE `Sender` = (SELECT `AccountNumber` FROM `Client` WHERE `Name` = 'Leo Wong');
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT `PackageNumber` FROM `Package` WHERE `Recipient` = 'Leo Wong'
SELECT `PackageNumber` FROM `Package` WHERE `Recipient` = (SELECT `AccountNumber` FROM `Client` WHERE `Name` = 'Leo Wong');
SELECT * FROM Package WHERE Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT PackageNumber FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong');
SELECT COUNT(*) FROM Package WHERE Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') AND Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Ogden Wernstrom');
SELECT COUNT(*) FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Ogden Wernstrom') AND Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT Package.Contents FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'John Zoidberg';
SELECT `Contents` FROM `Package` INNER JOIN `Shipment` ON `Package`.`Shipment` = `Shipment`.`ShipmentID` INNER JOIN `Client` ON `Package`.`Sender` = `Client`.`AccountNumber` WHERE `Client`.`Name` = 'John Zoidberg';
SELECT `PackageNumber`, `Weight` FROM `Package` WHERE `Sender` = (SELECT `AccountNumber` FROM `Client` WHERE `Name` = 'John A. Zoidberg') ORDER BY `Weight` DESC LIMIT 1;
SELECT `PackageNumber`, `Weight` FROM `Package` WHERE `Sender` IN (SELECT `AccountNumber` FROM `Client` WHERE `Name` = 'John') ORDER BY `Weight` DESC LIMIT 1;
SELECT `PackageNumber`, `Weight` FROM `Package` ORDER BY `Weight` ASC LIMIT 3
SELECT `PackageNumber`, `Weight` FROM `Package` ORDER BY `Weight` ASC LIMIT 3;
SELECT C.`Name`, COUNT(*) as `Number_of_Packages` FROM Package as P JOIN Client as C ON P.`Sender` = C.`AccountNumber` GROUP BY C.`Name` ORDER BY `Number_of_Packages` DESC LIMIT 1;
SELECT C.`Name`, COUNT(*) as NumberOfPackages FROM Client as C JOIN Package as P ON C.`AccountNumber` = P.`Sender` GROUP BY C.`AccountNumber` ORDER BY NumberOfPackages DESC LIMIT 1;
SELECT C.`Name`, COUNT(*) as `Number of Packages` FROM `Package` as P JOIN `Client` as C ON P.`Recipient` = C.`AccountNumber` GROUP BY C.`AccountNumber` ORDER BY COUNT(*) LIMIT 1
SELECT MIN(PackageNumber) as smallest_package_number, Name as sender_name FROM Package JOIN Client ON Package.Sender = Client.AccountNumber GROUP BY Package.Sender
SELECT C.`Name` FROM Client AS C JOIN Package AS P ON C.`AccountNumber` = P.`Sender` GROUP BY C.`AccountNumber` HAVING COUNT(DISTINCT P.`PackageNumber`) > 1
SELECT C.`Name` FROM Client C JOIN Package P ON C.`AccountNumber` = P.`Sender` GROUP BY C.`AccountNumber` HAVING COUNT(DISTINCT P.`PackageNumber`) > 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC;
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC;
SELECT `ShipmentID` FROM `Shipment` WHERE `Manager` IN (SELECT `EmployeeID` FROM `Employee` WHERE `Name` = 'Phillip J. Fry')
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry';
SELECT `Date` FROM `Shipment`
SELECT `Date` FROM `Shipment`
SELECT `ShipmentID` FROM `Shipment` WHERE `Planet` = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT `ShipmentID` FROM `Shipment` WHERE `Planet` = 'Mars' AND `Manager` = (SELECT `EmployeeID` FROM `Employee` WHERE `Name` = 'Turanga Leela')
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Turanga Leela' AND Shipment.Planet = 'Mars'
SELECT `ShipmentID` FROM `Shipment` WHERE `Planet` = 'Mars' OR `Manager` = (SELECT `EmployeeID` FROM `Employee` WHERE `Name` = 'Turanga Leela')
SELECT Shipment.ShipmentID FROM Employee INNER JOIN Shipment ON Employee.EmployeeID = Shipment.Manager WHERE Employee.Name = 'Turanga Leela' AND Shipment.Planet = 'Mars';
SELECT P.Name, COUNT(S.ShipmentID) as Total_Shipments FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.Name
SELECT P.Name, COUNT(S.ShipmentID) as NumberOfShipments FROM Shipment S JOIN Planet P ON S.Planet = P.PlanetID GROUP BY P.Name
SELECT P.Name FROM Shipment AS S JOIN Planet AS P ON S.Planet = P.PlanetID GROUP BY P.Name ORDER BY COUNT(*) DESC LIMIT 1;
error: No SQL found in the input string
SELECT E.`Name`, COUNT(*) FROM Employee AS E JOIN Shipment AS S ON E.`EmployeeID` = S.`Manager` GROUP BY E.`EmployeeID`
SELECT E.Name AS Manager, COUNT(S.ShipmentID) AS NumberOfShipments FROM Employee AS E JOIN Shipment AS S ON E.EmployeeID = S.Manager GROUP BY E.Name;
SELECT SUM(Weight) as TotalWeight FROM Package WHERE Recipient = 'Mars'
SELECT SUM(Weight) as TotalWeight FROM Package WHERE Recipient = 'Mars'
SELECT P.Name, SUM(P.Weight) AS TotalWeight FROM Package P INNER JOIN Shipment S ON P.Shipment = S.ShipmentID INNER JOIN Planet Pt ON S.Planet = Pt.PlanetID GROUP BY P.Name;
SELECT P.Name, SUM(Pkg.Weight) as TotalWeight FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package Pkg ON S.ShipmentID = Pkg.Shipment GROUP BY P.Name;
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Has_Clearance HC ON P.PlanetID = HC.Planet WHERE HC.Level > 2
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN ( SELECT P.Shipment, SUM(P.Weight) AS TotalWeight FROM Package P GROUP BY P.Shipment ) T ON S.ShipmentID = T.Shipment WHERE T.TotalWeight > 30
SELECT `PackageNumber` FROM `Package` WHERE `Recipient` = 'Zapp Brannigan' AND `Sender` = 'Omicron Persei 8'
SELECT COUNT(*) FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan') AND Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Omicron Persei 8');
SELECT `PackageNumber` FROM `Package` WHERE `Recipient` = 'Omicron Persei 8' OR `Sender` = 'Zapp Brannigan';
error: No SQL found in the input string
SELECT `PackageNumber`, `Weight` FROM `Package` WHERE `Weight` BETWEEN 10 AND 30
error: No SQL found in the input string
SELECT Name FROM Employee WHERE EmployeeID NOT IN ( SELECT Employee FROM Has_Clearance WHERE Planet = 'Mars' )
SELECT E.Name FROM Employee E WHERE E.EmployeeID NOT IN ( SELECT HC.Employee FROM Has_Clearance HC WHERE HC.Planet = 'Mars' );
SELECT E.Name FROM Employee AS E JOIN Has_Clearance AS HC ON E.EmployeeID = HC.Employee JOIN Planet AS P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III'
SELECT E.Name FROM Employee AS E JOIN Has_Clearance AS HC ON E.EmployeeID = HC.Employee JOIN Planet AS P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III';
SELECT P.Name FROM Planet P WHERE ( SELECT COUNT(*) FROM Employee E WHERE E.Position = 'Robot' AND E.EmployeeID IN ( SELECT EC.Employee FROM Has_Clearance EC WHERE EC.Planet = P.PlanetID ) ) = 1
SELECT P.Name FROM Planet P JOIN Has_Clearance HC ON P.PlanetID = HC.PlanetID JOIN Employee E ON HC.EmployeeID = E.EmployeeID WHERE E.Position = 'Robot';
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000;
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000;
SELECT `Name` FROM `Employee` WHERE `Salary` > (SELECT AVG(`Salary`) FROM `Employee`) OR `Salary` > 5000;
SELECT E.Name FROM Employee E WHERE E.Salary > (SELECT AVG(Salary) FROM Employee) AND E.Salary > 5000
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN ( SELECT Employee FROM Has_Clearance WHERE Planet = 'Mars' )
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN ( SELECT Employee FROM Has_Clearance WHERE Planet = 'Mars' )
error: No SQL found in the input string
SELECT COUNT(*) FROM game
SELECT `Title`, `Developers` FROM `game` ORDER BY `Units_sold_Millions` DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) as Average_Units_Sold_Millions FROM game WHERE Developers != 'Nintendo'
SELECT AVG(Units_sold_Millions) as Average_Units_Sold_Millions FROM game WHERE Developers != 'Nintendo'
SELECT `Platform_name`, `Market_district` FROM `platform`
SELECT platform.`Platform_name`, platform.`Market_district` FROM platform
SELECT `Platform_ID`, `Platform_name` FROM `platform` WHERE `Download_rank` = 1
SELECT `Platform_ID`, `Platform_name` FROM `platform` WHERE `Download_rank` = 1
SELECT MAX(Rank_of_the_year) AS Maximum_Rank, MIN(Rank_of_the_year) AS Minimum_Rank FROM player;
SELECT MAX(Rank_of_the_year) AS Maximum_Rank, MIN(Rank_of_the_year) AS Minimum_Rank FROM player
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(*) FROM player WHERE Rank_of_the_year <= 3
SELECT `Player_name` FROM `player` ORDER BY `Player_name` ASC;
SELECT `Player_name` FROM `player` ORDER BY `Player_name` ASC
SELECT `Player_name`, `College` FROM `player` ORDER BY `Rank_of_the_year` DESC
SELECT player.Player_name, player.College FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID WHERE game_player.If_active = 'T' ORDER BY player.Rank_of_the_year DESC;
SELECT player.Player_name, player.Rank_of_the_year FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game.Game_ID = game_player.Game_ID WHERE game.Title = 'Super Mario World';
SELECT player.Player_name, player.Rank_of_the_year FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game_player.Game_ID = game.Game_ID WHERE game.Title = 'Super Mario World';
SELECT DISTINCT `Developers` FROM game INNER JOIN platform ON game.`Platform_ID` = platform.`Platform_ID` INNER JOIN game_player ON game.`Game_ID` = game_player.`Game_ID` INNER JOIN player ON game_player.`Player_ID` = player.`Player_ID` WHERE `College` = 'Auburn'
SELECT DISTINCT Developers FROM game WHERE Game_ID IN ( SELECT Game_ID FROM game_player WHERE Player_ID IN ( SELECT Player_ID FROM player WHERE College = 'Auburn' ) );
SELECT AVG(Units_sold_Millions) as Average_Units_Sold_Millions FROM game_player JOIN game ON game_player.Game_ID = game.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.Position = 'Guard'
SELECT AVG(`Units_sold_Millions`) as `Average_Units_Sold` FROM game_player JOIN game ON game_player.Game_ID = game.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.Position = 'Guard'
SELECT game.Title, platform.Platform_name FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID
SELECT game.Title, platform.Platform_name FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID
SELECT game.Title FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Market_district IN ('USA', 'Asia');
SELECT Title FROM game WHERE Platform_ID IN ( SELECT Platform_ID FROM platform WHERE Market_district IN ('USA', 'Asia') )
SELECT `Platform_name`, COUNT(`Game_ID`) as `Number_of_Games` FROM `game` INNER JOIN `platform` ON `game`.`Platform_ID` = `platform`.`Platform_ID` GROUP BY `Platform_name`
SELECT Rank_of_the_year, COUNT(*) as Number_of_Games FROM game JOIN game_player ON game.Game_ID = game_player.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID GROUP BY Rank_of_the_year
SELECT T1.`Franchise`, COUNT(*) as `Number_of_Games` FROM game AS T1 GROUP BY T1.`Franchise` ORDER BY `Number_of_Games` DESC LIMIT 1
SELECT g.Franchise, COUNT(gp.Game_ID) as Game_Count FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID GROUP BY g.Franchise ORDER BY Game_Count DESC LIMIT 1;
SELECT T1.`Franchise` FROM game AS T1 JOIN game AS T2 ON T1.`Franchise` = T2.`Franchise` GROUP BY T1.`Franchise` HAVING COUNT(*) >= 2
SELECT DISTINCT franchise FROM game WHERE franchise IN ( SELECT franchise FROM game GROUP BY franchise HAVING COUNT(*) > 1 )
SELECT P.`Player_name` FROM player AS P WHERE P.`Player_ID` NOT IN (SELECT GP.`Player_ID` FROM game_player AS GP)
SELECT DISTINCT player.Player_name FROM player WHERE player.Player_ID NOT IN (SELECT DISTINCT game_player.Player_ID FROM game_player)
SELECT game.Title FROM game JOIN game_player ON game.Game_ID = game_player.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Oklahoma' INTERSECT SELECT game.Title FROM game JOIN game_player ON game.Game_ID = game_player.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Auburn'
SELECT game.Title FROM game JOIN game_player ON game.Game_ID = game_player.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Oklahoma' OR player.College = 'Auburn';
SELECT DISTINCT `Franchise` FROM `game`
SELECT DISTINCT `Franchise` FROM `game`;
SELECT game.Title FROM game WHERE game.Game_ID NOT IN ( SELECT game_player.Game_ID FROM game_player WHERE game_player.If_active = 'T' AND game_player.Player_ID IN ( SELECT player.Player_ID FROM player WHERE player.Position = 'Guard' ) )
SELECT game.Title FROM game WHERE game.Game_ID NOT IN ( SELECT game_player.Game_ID FROM game_player WHERE game_player.If_active = 'T' AND game_player.Player_ID IN ( SELECT player.Player_ID FROM player WHERE player.Position = 'Guard' ) )
SELECT `Name`, `Year_Profits_billion` FROM `press` ORDER BY `Year_Profits_billion` DESC
SELECT `Name`, `Year_Profits_billion` FROM `press` ORDER BY `Year_Profits_billion` DESC
SELECT p.Name FROM press AS p JOIN book AS b ON p.Press_ID = b.Press_ID GROUP BY p.Press_ID HAVING SUM(b.Sale_Amount) > 15 OR AVG(p.Month_Profits_billion) > 1 OR AVG(p.Year_Profits_billion) > 1
error: No SQL found in the input string
SELECT AVG(`Year_Profits_billion`) AS `Average_Profit`, MAX(`Year_Profits_billion`) AS `Maximum_Profit` FROM press
SELECT `Press_ID`, AVG(`Year_Profits_billion`) AS `Average_Yearly_Profit`, MAX(`Year_Profits_billion`) AS `Max_Yearly_Profit` FROM `press` GROUP BY `Press_ID`
SELECT `Name` FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT `Name` FROM press WHERE `Month_Profits_billion` = (SELECT MAX(`Month_Profits_billion`) FROM press)
error: No SQL found in the input string
SELECT P.`Name` FROM press AS P JOIN (SELECT Press_ID, AVG(Month_Profits_billion) AS AvgMonthProfits FROM press GROUP BY Press_ID) AS AvgProfits ON P.`Press_ID` = AvgProfits.`Press_ID` WHERE AvgProfits.`AvgMonthProfits` = (SELECT MIN(AvgMonthProfits) FROM (SELECT Press_ID, AVG(Month_Profits_billion) AS AvgMonthProfits FROM press GROUP BY Press_ID));
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT `Gender`, AVG(`Age`) as `Average_Age` FROM `author` GROUP BY `Gender`
SELECT `Gender`, AVG(`Age`) as `Average_Age` FROM `author` GROUP BY `Gender`
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender;
SELECT Title FROM book ORDER BY Release_date DESC
SELECT `Title` FROM `book` ORDER BY `Release_date` DESC
SELECT `Book_Series`, COUNT(*) FROM `book` GROUP BY `Book_Series`
SELECT Book_Series, COUNT(*) as Count FROM book GROUP BY Book_Series
SELECT `Title`, `Release_date` FROM book ORDER BY `Sale_Amount` DESC LIMIT 5
SELECT `Title`, `Release_date` FROM `book` ORDER BY `Sale_Amount` DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 AND Sale_Amount < 500 GROUP BY Book_Series HAVING COUNT(*) > 1
SELECT Book_Series FROM book WHERE Sale_Amount > '1000' INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < '500'
SELECT DISTINCT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Book_Series = 'MM' AND b.Book_ID IN ( SELECT Book_ID FROM book WHERE Book_Series = 'LT' );
SELECT DISTINCT author.Name FROM author JOIN book ON author.Author_ID = book.Author_ID WHERE book.Book_Series IN ('MM', 'LT')
SELECT `Name`, `Age` FROM author WHERE `Author_ID` NOT IN (SELECT DISTINCT `Author_ID` FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT `Name` FROM author WHERE `Author_ID` IN ( SELECT `Author_ID` FROM book GROUP BY `Author_ID` HAVING COUNT(`Author_ID`) > 1 )
SELECT `Name` FROM author WHERE Author_ID IN ( SELECT `Author_ID` FROM book GROUP BY `Author_ID` HAVING COUNT(`Author_ID`) > 1 )
SELECT b.Title, a.Name, p.Name FROM book AS b JOIN author AS a ON b.Author_ID = a.Author_ID JOIN press AS p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT b.Title, a.Name, p.Name FROM book AS b JOIN author AS a ON b.Author_ID = a.Author_ID JOIN press AS p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT P.`Name`, SUM(B.`Sale_Amount`) as Total_Book_Sale_Amount FROM press as P JOIN book as B ON P.`Press_ID` = B.`Press_ID` GROUP BY P.`Name`
SELECT P.`Name`, SUM(B.`Sale_Amount`) as `Total_Book_Sale_Amount` FROM book AS B JOIN press AS P ON B.`Press_ID` = P.`Press_ID` GROUP BY B.`Press_ID`
SELECT press.Name, COUNT(book.Book_ID) FROM book JOIN press ON book.Press_ID = press.Press_ID WHERE book.Sale_Amount > 1000 GROUP BY press.Name
SELECT P.`Name`, COUNT(*) FROM press AS P JOIN book AS B ON P.`Press_ID` = B.`Press_ID` WHERE B.`Sale_Amount` > 1000 GROUP BY P.`Press_ID`
error: No SQL found in the input string
SELECT `Name` FROM author WHERE `Author_ID` = (SELECT `Author_ID` FROM book WHERE `Sale_Amount` = (SELECT MAX(`Sale_Amount`) FROM book))
SELECT `Name`, `Gender` FROM author WHERE `Author_ID` = (SELECT `Author_ID` FROM book GROUP BY `Author_ID` ORDER BY COUNT(`Book_ID`) DESC LIMIT 1)
SELECT `Name`, `Gender` FROM author WHERE `Age` = (SELECT MAX(`Age`) FROM author)
SELECT a.Name FROM author AS a WHERE a.Author_ID NOT IN ( SELECT b.Author_ID FROM book AS b WHERE b.Press_ID = ( SELECT p.Press_ID FROM press AS p WHERE p.Name = 'Accor' ) )
SELECT DISTINCT author.Name FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID LEFT JOIN press ON book.Press_ID = press.Press_ID WHERE press.Name = 'Accor' AND book.Author_ID IS NULL
SELECT `Name`, `Year_Profits_billion` FROM press WHERE `Press_ID` IN ( SELECT `Press_ID` FROM book GROUP BY `Press_ID` HAVING COUNT(`Book_ID`) > 2 )
SELECT P.`Name`, P.`Year_Profits_billion` FROM press AS P JOIN book AS B ON P.`Press_ID` = B.`Press_ID` GROUP BY P.`Press_ID` HAVING COUNT(DISTINCT B.`Book_ID`) > 2
error: No SQL found in the input string
SELECT author_name FROM Authors
SELECT Authors.author_name, Authors.other_details FROM Authors;
SELECT `other_details` FROM `Authors` WHERE `author_name` = 'Addison Denesik'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT Documents.document_name, Documents.document_description FROM Documents;
SELECT Documents.document_id, Documents.document_name FROM Documents JOIN Authors ON Documents.author_name = Authors.author_name WHERE Authors.author_name = 'Bianka Cummings'
SELECT Authors.author_name, Authors.other_details FROM Authors JOIN Documents ON Authors.author_name = Documents.author_name WHERE Documents.document_name = 'Travel to China'
SELECT Authors.author_name, COUNT(*) as num_documents FROM Authors JOIN Documents ON Authors.author_name = Documents.author_name GROUP BY Authors.author_name
SELECT Authors.author_name, COUNT(*) as num_documents FROM Authors JOIN Documents ON Authors.author_name = Documents.author_name GROUP BY Authors.author_name ORDER BY num_documents DESC LIMIT 1;
SELECT Authors.author_name FROM Authors JOIN Documents ON Authors.author_name = Documents.author_name GROUP BY Authors.author_name HAVING COUNT(Documents.document_id) >= 2
SELECT COUNT(*) FROM Business_Processes
SELECT B.`process_id`, B.`process_name`, B.`process_description` FROM Business_Processes AS B WHERE B.`process_id` = 9
SELECT process_name FROM Business_Processes WHERE next_process_id = 9;
SELECT Documents.document_name, COUNT(Documents_Processes.process_outcome_code) as Number_of_Outcomes FROM Documents JOIN Documents_Processes ON Documents.document_id = Documents_Processes.document_id GROUP BY Documents.document_name;
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes;
SELECT `process_outcome_description` FROM `Process_Outcomes` WHERE `process_outcome_code` = 'working'
SELECT COUNT(DISTINCT Documents_Processes.process_status_code) as NumberOfProcessStatuses FROM Documents_Processes INNER JOIN Process_Status ON Documents_Processes.process_status_code = Process_Status.process_status_code;
SELECT process_status_code, process_status_description FROM Process_Status;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Staff.staff_id, Staff.staff_details, Ref_Staff_Roles.staff_role_description FROM Staff JOIN Staff_in_Processes ON Staff.staff_id = Staff_in_Processes.staff_id JOIN Ref_Staff_Roles ON Staff_in_Processes.staff_role_code = Ref_Staff_Roles.staff_role_code WHERE Staff.staff_id = 100
SELECT COUNT(DISTINCT staff_role_code) AS Number_of_Staff_Roles FROM Staff_in_Processes
SELECT `staff_role_code`, `staff_role_description` FROM `Ref_Staff_Roles`
SELECT `staff_role_description` FROM `Ref_Staff_Roles` WHERE `staff_role_code` = 'HR'
SELECT COUNT(*) FROM Documents_Processes
SELECT D.`document_id`, B.`process_id` FROM Documents AS D JOIN Documents_Processes AS DP ON D.`document_id` = DP.`document_id` JOIN Business_Processes AS B ON DP.`process_id` = B.`process_id`
SELECT D.`document_id` FROM Documents D LEFT JOIN Documents_Processes DP ON D.`document_id` = DP.`document_id` WHERE DP.`process_id` IS NULL
SELECT DISTINCT bp.process_id FROM Staff_in_Processes AS spp LEFT JOIN Business_Processes AS bp ON spp.process_id = bp.process_id WHERE bp.process_id IS NULL
SELECT Process_Outcomes.process_outcome_description, Process_Status.process_status_description FROM Documents_Processes JOIN Process_Outcomes ON Documents_Processes.process_outcome_code = Process_Outcomes.process_outcome_code JOIN Process_Status ON Documents_Processes.process_status_code = Process_Status.process_status_code WHERE Documents_Processes.document_id = 0;
SELECT Business_Processes.process_name FROM Business_Processes INNER JOIN Documents_Processes ON Business_Processes.process_id = Documents_Processes.process_id INNER JOIN Documents ON Documents_Processes.document_id = Documents.document_id WHERE Documents.document_name = 'Travel to Brazil';
SELECT B.`process_id`, COUNT(*) as `Number_of_Documents` FROM Business_Processes AS B JOIN Documents_Processes AS DP ON B.`process_id` = DP.`process_id` JOIN Documents AS D ON DP.`document_id` = D.`document_id` GROUP BY B.`process_id`
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9
SELECT T1.`staff_id`, COUNT(*) FROM Staff AS T1 JOIN Staff_in_Processes AS T2 ON T1.`staff_id` = T2.`staff_id` JOIN Documents_Processes AS T3 ON T2.`process_id` = T3.`process_id` GROUP BY T1.`staff_id`
SELECT Ref_Staff_Roles.`staff_role_code`, COUNT(*) FROM Staff JOIN Staff_in_Processes ON Staff.`staff_id` = Staff_in_Processes.`staff_id` JOIN Documents_Processes ON Staff_in_Processes.`document_id` = Documents_Processes.`document_id` JOIN Business_Processes ON Documents_Processes.`process_id` = Business_Processes.`process_id` JOIN Ref_Staff_Roles ON Staff_in_Processes.`staff_role_code` = Ref_Staff_Roles.`staff_role_code` GROUP BY Ref_Staff_Roles.`staff_role_code`;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Agencies
SELECT `agency_id`, `agency_details` FROM `Agencies`
SELECT agency_id, agency_details FROM Agencies;
SELECT COUNT(DISTINCT client_id) FROM Clients
SELECT COUNT(*) FROM Clients
SELECT Clients.client_id, Clients.client_details FROM Clients INNER JOIN Agencies ON Clients.agency_id = Agencies.agency_id;
SELECT client_id, client_details FROM Clients;
SELECT A.`agency_id`, COUNT(*) FROM Clients AS A JOIN Agencies AS B ON A.`agency_id` = B.`agency_id` GROUP BY A.`agency_id`
SELECT Clients.agency_id, COUNT(*) as num_clients FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id GROUP BY Clients.agency_id;
SELECT Agencies.agency_id, Agencies.agency_details, COUNT(Clients.client_id) as num_clients FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id ORDER BY num_clients DESC LIMIT 1;
SELECT A.agency_id, A.agency_details FROM Clients AS C JOIN Staff AS S ON C.agency_id = S.agency_id GROUP BY C.agency_id, C.agency_details HAVING COUNT(C.client_id) = ( SELECT COUNT(client_id) FROM Clients WHERE agency_id = C.agency_id GROUP BY agency_id ORDER BY COUNT(client_id) DESC LIMIT 1 );
SELECT A.`agency_id`, A.`agency_details` FROM Agencies AS A JOIN ( SELECT C.`agency_id` FROM Clients AS C GROUP BY C.`agency_id` HAVING COUNT(*) >= 2 ) AS B ON A.`agency_id` = B.`agency_id`
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE ( SELECT COUNT(*) FROM Clients B WHERE A.agency_id = B.agency_id ) >= 2
SELECT Agencies.agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id WHERE Clients.client_details = 'Mac'
SELECT Clients.agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id WHERE Clients.client_details = 'Mac';
error: No SQL found in the input string
SELECT Clients.client_details, Agencies.agency_details FROM Clients INNER JOIN Agencies ON Clients.agency_id = Agencies.agency_id;
SELECT `sic_code`, COUNT(*) as `Number_of_Clients` FROM `Clients` GROUP BY `sic_code`;
SELECT `sic_code`, COUNT(*) as `Number_of_Clients` FROM `Clients` GROUP BY `sic_code`
SELECT Clients.client_id, Clients.client_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id WHERE Agencies.agency_details LIKE '%Bad%' AND Clients.sic_code = 'Bad';
SELECT `client_details` FROM `Clients` WHERE `sic_code` = 'Bad';
SELECT Agencies.`agency_id`, Agencies.`agency_details` FROM Agencies JOIN Clients ON Agencies.`agency_id` = Clients.`agency_id`
SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id
SELECT DISTINCT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients)
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients)
error: No SQL found in the input string
SELECT COUNT(*) FROM Invoices
SELECT Invoices.invoice_id, Invoices.invoice_status, Invoices.invoice_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id;
SELECT `invoice_id`, `invoice_status`, `invoice_details` FROM `Invoices`
SELECT Clients.client_id, COUNT(Invoices.invoice_id) FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
SELECT Clients.client_id, COUNT(Invoices.invoice_id) as invoice_count FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Clients.client_id;
SELECT `client_id_new`, `client_details`, COUNT(`invoice_id`) as `Number_of_Invoices` FROM `Clients` JOIN `Invoices` ON `Clients`.`client_id` = `Invoices`.`client_id` GROUP BY `client_id_new` ORDER BY `Number_of_Invoices` DESC LIMIT 1;
SELECT Clients.client_id, Clients.client_details, COUNT(Invoices.invoice_id) as invoice_count FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id ORDER BY invoice_count DESC LIMIT 1;
SELECT Clients.client_id FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id HAVING COUNT(Invoices.client_id) >= 2
SELECT Clients.client_id FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id HAVING COUNT(Invoices.invoice_id) > 2
SELECT `invoice_status`, COUNT(*) FROM `Invoices` GROUP BY `invoice_status`
SELECT `invoice_status`, COUNT(*) as `Number_of_Invoices` FROM `Invoices` GROUP BY `invoice_status`;
SELECT invoice_status, COUNT(*) as invoice_count FROM Invoices GROUP BY invoice_status ORDER BY invoice_count DESC LIMIT 1;
SELECT `invoice_status`, COUNT(*) as `invoice_count` FROM Invoices JOIN Clients ON Invoices.`client_id` = Clients.`client_id` GROUP BY `invoice_status` ORDER BY `invoice_count` DESC LIMIT 1;
SELECT Invoices.`invoice_status`, Invoices.`invoice_details`, Clients.`client_id`, Clients.`client_details`, Agencies.`agency_id`, Agencies.`agency_details` FROM Invoices JOIN Clients ON Invoices.`client_id` = Clients.`client_id` JOIN Agencies ON Clients.`agency_id` = Agencies.`agency_id`
SELECT `invoice_status`, `invoice_details`, `Clients`.`client_id`, `Clients`.`client_details`, `Agencies`.`agency_id`, `Agencies`.`agency_details` FROM Invoices JOIN Clients ON Invoices.`client_id` = Clients.`client_id` JOIN Agencies ON Clients.`agency_id` = Agencies.`agency_id`
SELECT `meeting_type`, `meeting_outcome`, `purpose_of_meeting`, `other_details` FROM `Meetings`;
SELECT `meeting_type`, `other_details` FROM `Meetings`
SELECT `meeting_outcome`, `purpose_of_meeting` FROM `Meetings`
SELECT DISTINCT `meeting_outcome`, `purpose_of_meeting` FROM `Meetings`
SELECT `payment_id`, `payment_details` FROM `Payments` JOIN `Invoices` ON `Payments`.`invoice_id` = `Invoices`.`invoice_id` WHERE `Invoices`.`invoice_status` = 'Working'
SELECT `payment_id`, `payment_details` FROM `Payments` INNER JOIN `Invoices` ON `Payments`.`invoice_id` = `Invoices`.`invoice_id` WHERE `Invoices`.`invoice_status` = 'Working';
SELECT `invoice_id`, `invoice_status` FROM `Invoices` WHERE `invoice_id` NOT IN (SELECT `invoice_id` FROM `Payments`)
SELECT `invoice_id`, `invoice_status` FROM `Invoices` WHERE `invoice_id` NOT IN (SELECT `invoice_id` FROM `Payments`)
SELECT COUNT(*) FROM Payments
SELECT COUNT(*) FROM Payments
SELECT `payment_id`, `invoice_id`, `payment_details` FROM `Payments`
SELECT `payment_id`, `invoice_id`, `payment_details` FROM `Payments`
SELECT `invoice_id`, `invoice_status` FROM `Invoices`
SELECT DISTINCT P.`invoice_id`, I.`invoice_status` FROM `Payments` P JOIN `Invoices` I ON P.`invoice_id` = I.`invoice_id`
SELECT `invoice_id`, COUNT(*) as `Number_of_Payments` FROM `Payments` GROUP BY `invoice_id`
SELECT `invoice_id`, COUNT(`payment_id`) as `Number_of_Payments` FROM `Payments` GROUP BY `invoice_id`;
SELECT `invoice_id`, `invoice_status`, `invoice_details` FROM Invoices WHERE (SELECT COUNT(*) FROM Payments WHERE Payments.`invoice_id` = Invoices.`invoice_id`) = (SELECT MAX(payment_count) FROM (SELECT COUNT(*) AS payment_count FROM Payments GROUP BY `invoice_id`));
SELECT I.`invoice_id`, I.`invoice_status`, I.`invoice_details`, COUNT(P.`payment_id`) as `Number_of_Payments` FROM Invoices as I JOIN Payments as P ON I.`invoice_id` = P.`invoice_id` GROUP BY I.`invoice_id` ORDER BY `Number_of_Payments` DESC LIMIT 1;
error: No SQL found in the input string
SELECT COUNT(*) FROM Staff
SELECT Agencies.agency_id, COUNT(Staff.staff_id) FROM Agencies JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id
SELECT A.agency_id, COUNT(S.staff_id) as number_of_staff FROM Agencies A JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id;
SELECT A.agency_id, A.agency_details, COUNT(S.staff_id) as staff_count FROM Agencies A JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id ORDER BY staff_count DESC LIMIT 1;
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Staff S ON A.agency_id = S.agency_id JOIN Clients C ON A.agency_id = C.agency_id JOIN Staff_in_Meetings SM ON S.staff_id = SM.staff_id GROUP BY A.agency_id HAVING COUNT(SM.staff_id) = ( SELECT COUNT(staff_id) FROM Staff WHERE agency_id = A.agency_id GROUP BY agency_id ORDER BY COUNT(staff_id) DESC LIMIT 1 );
SELECT `meeting_outcome`, COUNT(*) FROM `Meetings` GROUP BY `meeting_outcome`
SELECT `meeting_outcome`, COUNT(*) as `count` FROM `Meetings` GROUP BY `meeting_outcome`;
SELECT Clients.client_id, COUNT(Meetings.meeting_id) FROM Clients JOIN Meetings ON Clients.client_id = Meetings.client_id GROUP BY Clients.client_id
SELECT Clients.client_id, COUNT(Meetings.meeting_id) as num_meetings FROM Clients JOIN Meetings ON Clients.client_id = Meetings.client_id GROUP BY Clients.client_id;
SELECT `meeting_type`, COUNT(*) FROM `Meetings` GROUP BY `meeting_type`
SELECT `meeting_type`, COUNT(*) as `Number_of_Meetings` FROM `Meetings` GROUP BY `meeting_type`;
SELECT M.`meeting_id`, M.`meeting_outcome`, M.`meeting_type`, C.`client_details` FROM Meetings AS M JOIN Clients AS C ON M.`client_id` = C.`client_id`
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings INNER JOIN Clients ON Meetings.client_id = Clients.client_id
SELECT T1.`meeting_id`, COUNT(*) FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.`meeting_id` = T2.`meeting_id` GROUP BY T1.`meeting_id`
SELECT `meeting_id`, COUNT(*) as `Number_of_Staff` FROM `Staff_in_Meetings` GROUP BY `meeting_id`
SELECT T1.`staff_id`, COUNT(*) FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.`staff_id` = T2.`staff_id` JOIN Meetings AS T3 ON T2.`meeting_id` = T3.`meeting_id` WHERE T3.`billable_yn` = '1' GROUP BY T1.`staff_id` HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM Staff JOIN Staff_in_Meetings ON Staff.`staff_id` = Staff_in_Meetings.`staff_id` JOIN Meetings ON Staff_in_Meetings.`meeting_id` = Meetings.`meeting_id` WHERE Meetings.`billable_yn` = '1' GROUP BY Staff.`staff_id`))
SELECT S.`staff_id` FROM Staff AS S JOIN ( SELECT SM.`staff_id` FROM Staff_in_Meetings AS SM JOIN Meetings AS M ON SM.`meeting_id` = M.`meeting_id` WHERE M.`meeting_outcome` = 'Summary' GROUP BY SM.`staff_id` HAVING COUNT(DISTINCT M.`meeting_id`) = ( SELECT COUNT(DISTINCT M.`meeting_id`) FROM Staff_in_Meetings AS SM JOIN Meetings AS M ON SM.`meeting_id` = M.`meeting_id` GROUP BY SM.`staff_id` ORDER BY COUNT(DISTINCT M.`meeting_id`) ASC LIMIT 1 ) ) AS L ON S.`staff_id` = L.`staff_id`
SELECT COUNT(*) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN ( SELECT DISTINCT staff_id FROM Staff_in_Meetings )
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_Meetings )
SELECT Clients.client_id, Clients.client_details FROM Clients JOIN Invoices ON Clients.agency_id = Invoices.client_id OR Clients.agency_id = Invoices.client_id JOIN Meetings ON Clients.agency_id = Meetings.client_id OR Clients.agency_id = Meetings.client_id WHERE Clients.agency_id IN (SELECT agency_id FROM Meetings) OR Clients.agency_id IN (SELECT agency_id FROM Invoices)
SELECT Clients.client_id, Clients.client_details, Clients.sic_code, Invoices.invoice_id, Invoices.invoice_status, Invoices.invoice_details, Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Meetings.billable_yn, Meetings.start_date_time, Meetings.end_date_time, Meetings.purpose_of_meeting, Meetings.other_details, Payments.payment_id, Payments.payment_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id JOIN Meetings ON Clients.client_id = Meetings.client_id JOIN Payments ON Invoices.invoice_id = Payments.invoice_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id WHERE Clients.agency_id IN (SELECT agency_id FROM Agencies WHERE agency_details LIKE '%White, Corwin and Rath%') OR Clients.agency_id IN (SELECT agency_id FROM Agencies WHERE agency_details LIKE '%West, Grady and Durgan%') OR Clients.agency_id IN (SELECT agency_id FROM Agencies WHERE agency_details LIKE '%Upton, Hayes and Schumm%') OR Clients.agency_id IN (SELECT agency_id FROM Agencies WHERE agency_details LIKE '%Renner LLC%') OR Clients.agency_id IN (SELECT agency_id FROM Agencies WHERE agency_details LIKE '%Muller, Klein and Kunde%') OR Clients.agency_id IN (SELECT agency_id FROM Agencies WHERE agency_details LIKE '%Hickle-Durgan%') OR Clients.sic_code = 'Mutual' OR Clients.sic_code = 'Bad'
SELECT staff_id, staff_details FROM Staff WHERE staff_details LIKE '%s%' GROUP BY staff_id, staff_details;
SELECT S.`Staff_ID`, S.`Staff_Details` FROM Staff AS S JOIN Staff_in_Meetings AS SM ON S.`Staff_ID` = SM.`Staff_ID` JOIN Meetings AS M ON SM.`Meeting_ID` = M.`Meeting_ID` WHERE S.`Staff_Details` LIKE '%s%' GROUP BY S.`Staff_ID` HAVING COUNT(DISTINCT M.`Meeting_ID`) > 0;
SELECT Clients.`client_id`, Clients.`sic_code`, Clients.`agency_id` FROM Clients JOIN Invoices ON Clients.`agency_id` = Invoices.`client_id` JOIN Meetings ON Clients.`agency_id` = Meetings.`client_id` WHERE Meetings.`meeting_id` IN ( SELECT Meeting_id FROM Staff_in_Meetings WHERE staff_id IN ( SELECT staff_id FROM Staff WHERE agency_id IN ( SELECT agency_id FROM Clients WHERE `agency_id` = Invoices.`client_id` ) ) )
SELECT Clients.client_id, Clients.sic_code, Clients.agency_id FROM Clients JOIN Invoices ON Clients.agency_id = Invoices.client_id JOIN Meetings ON Clients.agency_id = Meetings.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id WHERE ( SELECT COUNT(*) FROM Meetings WHERE Clients.agency_id = Meetings.client_id ) = 1 AND ( SELECT COUNT(*) FROM Invoices WHERE Clients.agency_id = Invoices.client_id ) > 0
SELECT Meetings.start_date_time, Meetings.end_date_time, Clients.client_details, Staff.staff_details FROM Meetings INNER JOIN Clients ON Meetings.client_id = Clients.client_id INNER JOIN Staff ON Meetings.agency_id = Staff.agency_id;
SELECT Meetings.start_date_time, Meetings.end_date_time, Clients.client_details, Staff.staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
