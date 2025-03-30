SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Name AS Player_Name, T2.Name AS Club_Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Manufacturer, COUNT(DISTINCT Club_ID) FROM club GROUP BY Manufacturer
error: No SQL found in the input string
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT T1.Manufacturer FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Manufacturer HAVING COUNT(T1.Manufacturer) > 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT Country) FROM player
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(date_order_placed) AS earliest_order_date FROM Orders UNION ALL SELECT date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_status_code = 'Delivered' AND Order_Items.order_item_id IN ( SELECT order_item_id FROM Order_Items WHERE order_item_status_code = 'Delivered' GROUP BY order_item_id HAVING COUNT(*) > 1 )
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) AS `count`, Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY `count` DESC LIMIT 1
SELECT payment_method_code, COUNT(*) AS num_customers FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY num_customers DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT oi.order_item_status_code) FROM Order_Items oi
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT `payment_method_code`) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT Payment_Method_Code) FROM Customer_Payment_Methods;
SELECT login_name, login_password FROM Customers WHERE customer_id IN (SELECT customer_id FROM Customers WHERE SUBSTR(login_name, 1, 2) = '+12')
SELECT login_name, login_password FROM Customers WHERE login_name LIKE '+12%'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(*) FROM Shipments
SELECT AVG(product_price) FROM Products
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT order_status_code FROM Orders GROUP BY order_status_code HAVING COUNT(*) = 1
SELECT order_status_code, COUNT(*) as count FROM Orders GROUP BY order_status_code ORDER BY count ASC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM channel WHERE `Internet` LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel WHERE Digital_terrestrial_channel IS NOT NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT C.Name, C.Internet FROM channel AS C JOIN program AS P ON C.Channel_ID = P.Channel_ID GROUP BY C.Channel_ID HAVING COUNT(P.Program_ID) > 1
SELECT C.Name, COUNT(P.Program_ID) FROM channel AS C JOIN program AS P ON C.Channel_ID = P.Channel_ID GROUP BY C.Channel_ID
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT DISTINCT Channel_ID FROM program)
SELECT D.Name FROM director D JOIN program P ON D.Director_ID = P.Director_ID WHERE P.Title = 'Dracula'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID WHERE T2.Is_first_director = 'T' AND T2.Director_ID IN ( SELECT Director_ID FROM director WHERE Age < 40 ) AND T2.Director_ID IN ( SELECT Director_ID FROM director WHERE Age > 60 )
SELECT DISTINCT channel.Channel_ID, channel.Name FROM channel LEFT JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID WHERE director_admin.Director_ID NOT IN (SELECT Director_ID FROM director WHERE Name = 'Hank Baskett')
SELECT COUNT(*) FROM radio;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Station_name FROM city_channel AS T1 WHERE T1.Affiliation != 'ABC'
SELECT DISTINCT r.Transmitter FROM radio r INNER JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID WHERE r.ERP > 150 OR r.ERP < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT `Affiliation`, COUNT(*) AS `Count` FROM city_channel GROUP BY `Affiliation` ORDER BY `Count` DESC LIMIT 1
SELECT DISTINCT T1.Affiliation FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID WHERE T2.Is_online = 'T' GROUP BY T1.Affiliation HAVING COUNT(*) > 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Driver_ID, COUNT(DISTINCT Vehicle_ID) AS Total_Vehicles_Driven FROM vehicle_driver GROUP BY Driver_ID ORDER BY Total_Vehicles_Driven DESC LIMIT 1;
SELECT d.Driver_ID, COUNT(vd.Vehicle_ID) AS Total_Vehicles FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID GROUP BY d.Driver_ID ORDER BY Total_Vehicles DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT v.Vehicle_ID FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID HAVING COUNT(*) = 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT d.Name FROM driver d ORDER BY d.Name
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Exams
SELECT COUNT(*) FROM Exams
SELECT DISTINCT Exam_ID FROM Exams ORDER BY Exam_ID ASC
SELECT DISTINCT Exam_ID FROM Exams ORDER BY Exam_ID ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
error: No SQL found in the input string
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
error: No SQL found in the input string
SELECT Student_Answer_Text, COUNT(*) AS Frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Frequency DESC
error: No SQL found in the input string
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Assessment, COUNT(*) AS Frequency FROM Student_Assessments GROUP BY Assessment ORDER BY Frequency ASC LIMIT 1;
error: No SQL found in the input string
SELECT DISTINCT T1.First_Name FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(*) >= 2
SELECT Valid_Answer_Text, COUNT(*) as Frequency FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY Frequency DESC LIMIT 1;
SELECT `Valid_Answer_Text`, COUNT(*) AS `Frequency` FROM Valid_Answers GROUP BY `Valid_Answer_Text` ORDER BY `Frequency` DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_Answer_ID IS NULL
SELECT DISTINCT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_Answer_ID IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Type_of_Question_Code FROM Questions WHERE Type_of_Question_Code IN (SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3)
error: No SQL found in the input string
SELECT S.Student_ID, S.First_Name, S.Middle_Name, S.Last_Name, S.Gender_MFU, S.Student_Address, S.Email_Adress, S.Cell_Mobile_Phone, S.Home_Phone FROM Students S
SELECT COUNT(*) FROM Addresses;
SELECT COUNT(*) FROM Addresses;
error: No SQL found in the input string
SELECT Addresses.address_id, Addresses.address_details FROM Addresses
SELECT COUNT(*) FROM Products;
SELECT COUNT(*) FROM Products;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT product_price FROM Products WHERE product_name = 'Monitor'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products
SELECT AVG(P.product_price) FROM Products P WHERE P.product_type_code = 'Clothes';
SELECT AVG(P.product_price) FROM Products P WHERE P.product_type_code = 'Clothes';
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.product_type_code FROM Products AS T1 GROUP BY T1.product_type_code HAVING COUNT(*) >= 2
error: No SQL found in the input string
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code, COUNT(*) as frequency FROM Products GROUP BY product_type_code ORDER BY frequency DESC LIMIT 1
SELECT COUNT(*) FROM Customers;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT customer_id, customer_name FROM Customers
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT payment_method_code, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count DESC LIMIT 1
SELECT payment_method_code, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Customers.payment_method_code, Customers.customer_number FROM Customers WHERE Customers.customer_name = 'Jeromy'
error: No SQL found in the input string
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Customer_Orders;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT o.order_id, o.order_date, o.order_status_code FROM Customer_Orders AS o JOIN Customers AS c ON o.customer_id = c.customer_id WHERE c.customer_name = 'Jeromy'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c INNER JOIN ( SELECT customer_id, COUNT(*) as order_count FROM Customer_Orders GROUP BY customer_id ORDER BY order_count DESC LIMIT 1 ) t ON c.customer_id = t.customer_id
error: No SQL found in the input string
SELECT Customer_Orders.order_status_code, COUNT(*) FROM Customer_Orders GROUP BY Customer_Orders.order_status_code
error: No SQL found in the input string
SELECT order_status_code, COUNT(*) as frequency FROM Customer_Orders GROUP BY order_status_code ORDER BY frequency DESC LIMIT 1
SELECT order_status_code, COUNT(*) as frequency FROM Customer_Orders GROUP BY order_status_code ORDER BY frequency DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT P.product_name FROM Products P LEFT JOIN Order_Items OI ON P.product_id = OI.product_id WHERE OI.product_id IS NULL
SELECT DISTINCT P.product_name FROM Products P LEFT JOIN Order_Items OI ON P.product_id = OI.product_id WHERE OI.product_id IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Customers C JOIN Customer_Orders CO ON C.customer_id = CO.customer_id JOIN Order_Items OI ON CO.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id WHERE P.product_name = 'Monitor';
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_type_code = 'Monitor';
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Customers.customer_id FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT DISTINCT Customers.customer_id FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM building;
SELECT COUNT(*) FROM building;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Region.Population) FROM Region
error: No SQL found in the input string
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT r.Capital FROM region r ORDER BY r.Population DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Name, T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Name, T1.Capital FROM region AS T1 INNER JOIN building AS T2 ON T1.Region_ID = T2.Region_ID ORDER BY COUNT(T2.Building_ID) DESC LIMIT 1;
error: No SQL found in the input string
SELECT b.Name, b.Address, r.Name FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Completed_Year) FROM building
SELECT DISTINCT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Region_ID IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Address FROM building
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT COUNT(DISTINCT Service_ID) FROM Services
SELECT COUNT(*) FROM Services;
SELECT `Analytical_Layer_Type_Code`, COUNT(*) AS Frequency FROM Analytical_Layer GROUP BY `Analytical_Layer_Type_Code` ORDER BY Frequency DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch'
SELECT T2.Service_Details FROM Customers AS T1 INNER JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T1.Customer_Details = 'Hardy Kutch'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) > 3)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Customers.Customer_Details FROM Customers LEFT JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers_and_Services.Customer_ID IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT COUNT(DISTINCT Customers.Customer_ID) + COUNT(DISTINCT Services.Service_ID) FROM Customers, Services
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Customers.Customer_Details FROM Customers WHERE Customers.Customer_Details LIKE '%Kutch%'
SELECT DISTINCT Services.Service_Details FROM Services LEFT JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID LEFT JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID LEFT JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE (Customers.Customer_Details = 'Hardy Kutch' AND Customers_and_Services.Customer_ID = Customers.Customer_ID) OR Integration_Platform.Integration_Platform_Details = 'good'
SELECT DISTINCT S.Service_Details FROM Services AS S WHERE S.Service_ID IN ( SELECT DISTINCT CS.Service_ID FROM Customers AS C JOIN Customers_and_Services AS CS ON C.Customer_ID = CS.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' ) UNION ALL SELECT DISTINCT S.Service_Details FROM Services AS S JOIN Customer_Interactions AS CI ON S.Service_ID = CI.Service_ID JOIN Integration_Platform AS IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE IP.Integration_Platform_Details = 'good';
SELECT DISTINCT Services.Service_Details FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Integration_Platform.Customer_Interaction_ID = Customer_Interactions.Customer_Interaction_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Integration_Platform.Integration_Platform_Details = 'bad'
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID WHERE Customers.Customer_ID = (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch') AND Customer_Interactions.Status_Code = 'bad' GROUP BY Services.Service_Details HAVING COUNT(Services.Service_Details) > 1;
SELECT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Channel_ID = '15 ij'
error: No SQL found in the input string
SELECT Customers.Customer_Details, Customers_and_Services.Service_Details, Channels.Channel_Details, Customer_Interactions.Status_Code, Integration_Platform.Integration_Platform_Details FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Customer_Interactions ON Customers_and_Services.Customers_and_Services_ID = Customer_Interactions.Customers_and_Services_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Channels.Channel_Details = 'bad' AND Services.Service_Details = 'bad'
SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details = 'Success'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details = 'Success'
SELECT Customers.Customer_Details FROM Customers INNER JOIN Integration_Platform ON Customers.Customer_ID = Integration_Platform.Customer_Interaction_ID WHERE Integration_Platform.Integration_Platform_Details = 'Fail'
SELECT Customers.Customer_Details FROM Customers INNER JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID INNER JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Integration_Platform.Integration_Platform_Details = 'Fail'
SELECT DISTINCT Services.Service_Details FROM Services LEFT JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Service_ID IS NULL
SELECT DISTINCT Services.Service_Details FROM Services LEFT JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customer_ID IS NULL
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Vehicles;
SELECT COUNT(*) FROM Vehicles;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Vehicles.Type_of_powertrain FROM Vehicles WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
error: No SQL found in the input string
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT Type_of_powertrain, COUNT(*) AS Type_of_powertrain_Count FROM Vehicles GROUP BY Type_of_powertrain ORDER BY Type_of_powertrain_Count DESC LIMIT 1
SELECT MIN(Annual_fuel_cost) AS Min_Annual_Fuel_Cost, MAX(Annual_fuel_cost) AS Max_Annual_Fuel_Cost, AVG(Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles;
SELECT MIN(Annual_fuel_cost) AS min_cost, MAX(Annual_fuel_cost) AS max_cost, AVG(Annual_fuel_cost) AS avg_cost FROM Vehicles
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Customers.age) FROM Customers WHERE Customers.membership_credit > (SELECT AVG(membership_credit) FROM Customers)
error: No SQL found in the input string
SELECT * FROM Discount
SELECT * FROM Discount
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Vehicles.name FROM Vehicles WHERE NOT EXISTS ( SELECT 1 FROM Renting_history WHERE Renting_history.vehicles_id = Vehicles.id )
SELECT DISTINCT Vehicles.name FROM Vehicles LEFT JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.id IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT D.name, COUNT(*) FROM Discount AS D JOIN Renting_history AS R ON D.id = R.discount_id GROUP BY D.id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.id ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Avg_City_Fuel_Economy_Rate, AVG(Highway_fuel_economy_rate) AS Avg_Highway_Fuel_Economy_Rate FROM Vehicles GROUP BY Type_of_powertrain
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Detention_Summary FROM Detention
SELECT DISTINCT Detention.detention_summary FROM Detention
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Ref_Achievement_Type.achievement_type_code, Achievements.achievement_details, Achievements.date_achievement FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`teacher_details`, S.`student_details` FROM Teachers AS T1 INNER JOIN Classes AS C ON T1.`teacher_id` = C.`teacher_id` INNER JOIN Students AS S ON C.`student_id` = S.`student_id`;
SELECT COUNT(DISTINCT T2.class_id) AS max_courses, T1.teacher_id FROM Teachers AS T1 INNER JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY max_courses DESC LIMIT 1;
error: No SQL found in the input string
SELECT COUNT(DISTINCT c.class_id) AS max_courses, s.student_id FROM Classes c JOIN Students s ON c.student_id = s.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT c.class_id) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(DISTINCT class_id) AS cnt FROM Classes GROUP BY student_id ) subquery );
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Detention_Type_Code, Detention_Type_Description FROM Ref_Detention_Type WHERE Detention_Type_Code IN (SELECT Detention_Type_Code FROM Detention GROUP BY Detention_Type_Code HAVING COUNT(*) = 1)
SELECT Detention_Type_Code, Detention_Type_Description FROM Ref_Detention_Type WHERE Detention_Type_Code IN (SELECT Detention_Type_Code FROM Detention GROUP BY Detention_Type_Code HAVING COUNT(*) = 1)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Student_Loans.student_id, SUM(Student_Loans.amount_of_loan) AS TotalLoan FROM Student_Loans GROUP BY Student_Loans.student_id;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types JOIN (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code ORDER BY COUNT(*) DESC LIMIT 1) AS T ON Ref_Address_Types.address_type_code = T.address_type_code
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Author FROM Author_Book
SELECT Name FROM Author
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Book
SELECT COUNT(*) FROM Book
SELECT COUNT(DISTINCT Author) FROM Book;
SELECT COUNT(DISTINCT Author) FROM Book;
SELECT COUNT(*) FROM Client;
SELECT COUNT(*) FROM Client;
error: No SQL found in the input string
SELECT Name, Address FROM Client ORDER BY Name
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Orders.IdOrder, Client.Name FROM Orders INNER JOIN Client ON Orders.IdClient = Client.IdClient
SELECT DISTINCT Orders.IdOrder, Clients.Name FROM Orders INNER JOIN Clients ON Orders.IdClient = Clients.IdClient;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Book.ISBN, COUNT(Books_Order.IdOrder) FROM Book LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN
SELECT B.ISBN, SUM(BO.amount) FROM Books_Order AS BO JOIN Book AS B ON BO.ISBN = B.ISBN GROUP BY B.ISBN
error: No SQL found in the input string
SELECT ISBN, SUM(amount) AS TotalAmount FROM Books_Order GROUP BY ISBN
SELECT b.Title FROM Book b INNER JOIN (SELECT b.ISBN, COUNT(*) as cnt FROM Books_Order bo INNER JOIN Book b ON b.ISBN = bo.ISBN GROUP BY b.ISBN) t ON b.ISBN = t.ISBN ORDER BY t.cnt DESC LIMIT 1;
SELECT b.Title FROM Book b JOIN Books_Order bo ON b.ISBN = bo.ISBN GROUP BY b.Title ORDER BY COUNT(bo.amount) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Title FROM Book AS T1 INNER JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Orders AS T3 ON T2.IdOrder = T3.IdOrder
SELECT DISTINCT C.Name FROM Client AS C JOIN Orders AS O ON C.IdClient = O.IdClient
SELECT DISTINCT Name FROM Client WHERE IdClient IN (SELECT DISTINCT IdClient FROM Orders)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient ORDER BY COUNT(*) DESC LIMIT 1;
SELECT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient GROUP BY C.IdClient ORDER BY COUNT(O.IdOrder) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT C.Name FROM Client C JOIN Books_Order BO ON C.IdClient = BO.IdOrder GROUP BY C.IdClient ORDER BY SUM(BO.amount) DESC LIMIT 1;
SELECT T1.Title FROM Book AS T1 LEFT JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN WHERE T2.ISBN IS NULL
SELECT T1.Title FROM Book AS T1 LEFT JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN WHERE T2.ISBN IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(SalePrice) AS max_sale_price, MIN(SalePrice) AS min_sale_price FROM Book
SELECT MAX(SalePrice) AS MaxSalePrice, MIN(SalePrice) AS MinSalePrice FROM Book
SELECT AVG(PurchasePrice) AS AveragePurchasePrice, AVG(SalePrice) AS AverageSalePrice FROM Book
SELECT AVG(PurchasePrice) AS AveragePurchasePrice, AVG(SalePrice) AS AverageSalePrice FROM Book
SELECT MAX(SalePrice) - MIN(PurchasePrice) FROM Book
SELECT MAX(SalePrice) - MIN(PurchasePrice) FROM Book
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(B.SalePrice) FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON A.idAuthor = AB.Author WHERE A.Name = 'George Orwell'
error: No SQL found in the input string
SELECT SalePrice FROM Book WHERE Author = (SELECT idAuthor FROM Author WHERE Name = 'Plato')
SELECT SalePrice FROM Book WHERE Author = (SELECT idAuthor FROM Author WHERE Name = 'Plato')
SELECT Title FROM Book WHERE Author = (SELECT idAuthor FROM Author WHERE Name = 'George Orwell') ORDER BY SalePrice ASC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Author FROM Book WHERE Title = 'Pride and Prejudice'
SELECT Author FROM Author_Book WHERE Author = (SELECT Author FROM Book WHERE Title = 'Pride and Prejudice')
error: No SQL found in the input string
SELECT Title FROM Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name LIKE '%Plato%')
SELECT COUNT(*) FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')
error: No SQL found in the input string
SELECT DISTINCT Orders.IdOrder FROM Orders INNER JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder INNER JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title IN ('Pride and Prejudice', 'The Little Prince')
SELECT DISTINCT T1.IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author_Book AS T3 ON T2.Author = T3.Author WHERE T2.Title = 'Pride and Prejudice' OR T2.Title = 'The Little Prince';
SELECT DISTINCT `Books_Order`.ISBN FROM `Books_Order` AS BO INNER JOIN Orders AS O ON BO.IdOrder = O.IdOrder INNER JOIN Client AS C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' OR C.Name = 'James Smith'
SELECT DISTINCT B.ISBN FROM Books_Order AS BO INNER JOIN Orders AS O ON BO.IdOrder = O.IdOrder INNER JOIN Client AS C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' OR C.Name = 'James Smith'
SELECT B.Title FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN JOIN Orders O ON BO.IdOrder = O.IdOrder WHERE O.IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe') AND O.IdClient <> (SELECT IdClient FROM Client WHERE Name = 'James Smith')
SELECT B.Title FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN JOIN Orders O ON BO.IdOrder = O.IdOrder WHERE O.IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe') AND O.IdClient <> (SELECT IdClient FROM Client WHERE Name = 'James Smith')
error: No SQL found in the input string
SELECT DISTINCT C.Name FROM Client AS C INNER JOIN Books_Order AS B ON C.IdClient = B.IdOrder INNER JOIN Book AS BO ON B.ISBN = BO.ISBN INNER JOIN Author_Book AS A ON BO.ISBN = A.ISBN INNER JOIN Author AS AU ON AU.idAuthor = A.Author WHERE AU.Name = 'Jane Austen' AND BO.Title = 'Pride and Prejudice'
SELECT COUNT(*) FROM book
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Rating) FROM review
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(review.Readers_in_Million) FROM review JOIN book ON review.Book_ID = book.Book_ID WHERE book.Type = 'Novel';
error: No SQL found in the input string
SELECT Type, COUNT(*) FROM book GROUP BY Type ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT Title FROM book ORDER BY (SELECT Rating FROM review WHERE book.Book_ID = review.Book_ID) DESC
error: No SQL found in the input string
SELECT COUNT(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM customer;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Nationality, COUNT(*) AS Frequency FROM customer GROUP BY Nationality ORDER BY Frequency DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID
SELECT c.Name, do.Dish_Name FROM customer AS c JOIN customer_order AS do ON c.Customer_ID = do.Customer_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM member
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.`Team_Leader` FROM club AS T1 INNER JOIN club_leader AS T2 ON T1.`Club_ID` = T2.`Club_ID` WHERE T1.`Club_Name` = 'Houston'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Age) FROM member WHERE Member_ID IN (SELECT Member_ID FROM club_leader)
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT DISTINCT T2.Collection_Subset_Name FROM Collection_Subset_Members AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Top collection'
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Document_Object_ID FROM Collection_Subset_Members JOIN Document_Objects ON Collection_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID;
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT DISTINCT Document_Objects.Owner FROM Document_Objects INNER JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID INNER JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Braeden Collection'
SELECT `Owner` FROM Document_Objects WHERE `Document_Object_ID` = (SELECT `Document_Object_ID` FROM Documents_in_Collections WHERE `Collection_ID` = (SELECT `Collection_ID` FROM Collections WHERE `Owner` = 'Marlin'))
SELECT DISTINCT Owner FROM Document_Objects WHERE Owner = 'Marlin'
error: No SQL found in the input string
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
error: No SQL found in the input string
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
error: No SQL found in the input string
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
error: No SQL found in the input string
SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name = 'Nice'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT C.Collection_Name FROM Collections C WHERE NOT EXISTS ( SELECT 1 FROM Collections C2 WHERE C2.Parent_Collection_ID = C.Collection_ID )
error: No SQL found in the input string
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Document_Object_ID HAVING COUNT(*) > 1
error: No SQL found in the input string
SELECT COUNT(*) FROM Collections WHERE Collection_Name = 'Best'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
error: No SQL found in the input string
SELECT DISTINCT Document_Objects.Owner FROM Document_Objects INNER JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID INNER JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID INNER JOIN Collection_Subset_Members ON Collections.Collection_ID = Collection_Subset_Members.Related_Collection_ID INNER JOIN Document_Subset_Members ON Collection_Subset_Members.Related_Collection_ID = Document_Subset_Members.Related_Document_Object_ID INNER JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Objects.Owner = 'Braeden'
SELECT Document_Subset_Name FROM Document_Subsets ds INNER JOIN Document_Subset_Members ds_members ON ds.Document_Subset_ID = ds_members.Document_Subset_ID INNER JOIN Document_Objects do ON ds_members.Related_Document_Object_ID = do.Document_Object_ID INNER JOIN Collections c ON do.Owner = c.Collection_Name WHERE c.Collection_Name = 'Braeden'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(Document_Object_ID) AS NumOfDocs FROM Document_Subset_Members INNER JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID GROUP BY Document_Subset_ID, Document_Subset_Name ORDER BY NumOfDocs DESC LIMIT 1;
error: No SQL found in the input string
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')
SELECT Document_Subset_Name, Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID;
SELECT Document_Subset_Name, Document_Subset_ID, Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID;
error: No SQL found in the input string
SELECT C.Collection_Name FROM Collections C INNER JOIN Documents_in_Collections DC ON C.Collection_ID = DC.Collection_ID INNER JOIN Document_Objects DO ON DC.Document_Object_ID = DO.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT Document_Object_ID, COUNT(Collection_ID) AS NumCollections FROM Documents_in_Collections GROUP BY Document_Object_ID
error: No SQL found in the input string
SELECT COUNT(*) FROM Document_Objects DO INNER JOIN Documents_in_Collections DSC ON DO.Document_Object_ID = DSC.Document_Object_ID INNER JOIN Collections COL ON DSC.Collection_ID = COL.Collection_ID WHERE COL.Collection_Name = 'Best'
SELECT COUNT(*) FROM Document_Objects DO INNER JOIN Documents_in_Collections DC ON DO.Document_Object_ID = DC.Document_Object_ID INNER JOIN Collections COL ON DC.Collection_ID = COL.Collection_ID WHERE COL.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000') AND Related_Document_Object_ID IN (SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT DISTINCT DO.Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Objects DO ON DSM.Related_Document_Object_ID = DO.Document_Object_ID JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT DO.Document_Object_ID FROM Collections CO JOIN Documents_in_Collections DIC ON CO.Collection_ID = DIC.Collection_ID JOIN Document_Objects DO ON DIC.Document_Object_ID = DO.Document_Object_ID WHERE CO.Collection_Name = 'Best'
SELECT DO.Document_Object_ID FROM Document_Objects AS DO JOIN Documents_in_Collections AS DIC ON DO.Document_Object_ID = DIC.Document_Object_ID JOIN Collections AS C ON DIC.Collection_ID = C.Collection_ID JOIN Collection_Subset_Members AS CS ON C.Collection_ID = CS.Related_Collection_ID JOIN Collection_Subsets AS CSB ON CS.Collection_Subset_ID = CSB.Document_Subset_ID WHERE C.Collection_Name = 'Best' AND CSB.Document_Subset_Name != 'Best for 2000'
error: No SQL found in the input string
SELECT DO.Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Objects DO ON DSM.Document_Object_ID = DO.Document_Object_ID WHERE DSM.Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000') UNION SELECT DO.Document_Object_ID FROM Collection_Subset_Members CSM JOIN Document_Objects DO ON CSM.Related_Document_Object_ID = DO.Document_Object_ID WHERE CSM.Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subsets WHERE Collection_Subset_Name = 'Best')
SELECT DISTINCT DO.Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Objects DO ON DSM.Related_Document_Object_ID = DO.Document_Object_ID JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' UNION SELECT DO.Document_Object_ID FROM Collections CO JOIN Documents_in_Collections DIC ON CO.Collection_ID = DIC.Collection_ID JOIN Document_Objects DO ON DIC.Document_Object_ID = DO.Document_Object_ID WHERE CO.Collection_Name = 'Best';
SELECT C.Collection_Name FROM Collections C WHERE C.Collection_ID IN ( SELECT CS.Related_Collection_ID FROM Collection_Subset_Members CS WHERE CS.Collection_Subset_ID IN ( SELECT DSM.Document_Subset_ID FROM Document_Subset_Members DSM WHERE DSM.Related_Document_Object_ID IN ( SELECT DO.Document_Object_ID FROM Document_Objects DO JOIN Documents_in_Collections DIC ON DO.Document_Object_ID = DIC.Document_Object_ID JOIN Collections CO ON DIC.Collection_ID = CO.Collection_ID WHERE CO.Collection_Name = 'Best' ) ) );
SELECT C.Collection_Name FROM Collections C, Collection_Subset_Members CS, Collection_Subsets CS2 WHERE C.Collection_ID = CS.Collection_ID AND CS.Related_Collection_ID = CS2.Collection_Subset_ID AND CS2.Collection_Subset_Name = 'Best'
SELECT COUNT(*) FROM Collection_Subset_Members WHERE Related_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT c.Collection_ID) FROM Collections c WHERE c.Collection_Name = 'Best';
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collections WHERE Collection_Name = 'Best')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM songs ORDER BY `name` ASC
error: No SQL found in the input string
SELECT MAX(voice_sound_quality), MIN(voice_sound_quality) FROM performance_score
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `voice_sound_quality` FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.name = 'The Balkan Girls' AND songs.language = 'English'
SELECT s.id, s.name FROM songs s JOIN performance_score ps ON s.id = ps.songs_id GROUP BY s.id, s.name HAVING COUNT(ps.participant_id) = (SELECT COUNT(ps2.participant_id) FROM performance_score ps2 WHERE ps2.songs_id = s.id)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT s.language, AVG(ps.rhythm_tempo) AS average_rhythm_score FROM songs AS s JOIN performance_score AS ps ON s.id = ps.songs_id GROUP BY s.language
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM City
SELECT COUNT(*) FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(DISTINCT Country) FROM City
SELECT COUNT(DISTINCT Country) FROM City
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM City WHERE Country = 'Canada'
SELECT COUNT(*) FROM City WHERE Country = 'Canada'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.state, COUNT(T1.city_code) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code OR T1.city_code = T2.city1_code GROUP BY T1.state
error: No SQL found in the input string
SELECT Country, COUNT(DISTINCT City.city_code) FROM City GROUP BY Country
error: No SQL found in the input string
-- Execute the corrected SQL query SELECT DISTINCT T1.state FROM City AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code OR T1.city_code = T2.city1_code GROUP BY T1.state HAVING COUNT(*) >= 2
SELECT DISTINCT T1.state FROM City AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code OR T1.city_code = T2.city1_code GROUP BY T1.state HAVING COUNT(*) >= 2
SELECT state, COUNT(*) FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT Country, COUNT(*) FROM City GROUP BY Country ORDER BY COUNT(*) ASC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'CHINA'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T2.state, COUNT(*) FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT Country, COUNT(*) AS NumberOfStudents FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY Country ORDER BY NumberOfStudents ASC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.city_name FROM City AS T1 INNER JOIN (SELECT T2.city_code FROM Student AS T2 GROUP BY T2.city_code HAVING COUNT(*) >= 3) AS T3 ON T1.city_code = T3.city_code
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country <> 'USA'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'BAL') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'CHI')
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'BAL') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'CHI')
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark')
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark')
SELECT AVG(distance) AS average_distance, MIN(distance) AS minimum_distance, MAX(distance) AS maximum_distance FROM Direct_distance;
SELECT AVG(distance) AS average_distance, MIN(distance) AS minimum_distance, MAX(distance) AS maximum_distance FROM Direct_distance;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.city_code FROM City AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.distance < 1000
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT City.city_code, SUM(Direct_distance.distance) FROM City LEFT JOIN Direct_distance ON City.city_code = Direct_distance.city2_code GROUP BY City.city_code
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT B.name FROM Boats AS B JOIN Reserves AS R ON B.bid = R.bid WHERE R.sid = 1
SELECT DISTINCT T1.bid FROM Reserves AS T1 INNER JOIN Sailors AS T2 ON T1.sid = T2.sid WHERE T2.sid = ?
SELECT S.name FROM Sailors AS S INNER JOIN Reserves AS R ON S.sid = R.sid WHERE R.bid = 102
SELECT name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 102
SELECT DISTINCT R.bid FROM Reserves R
SELECT DISTINCT T1.bid FROM Reserves AS T1 INNER JOIN Sailors AS T2 ON T1.sid = T2.sid;
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT DISTINCT Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT Sailors.name, Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL;
error: No SQL found in the input string
SELECT DISTINCT Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT DISTINCT sid FROM Reserves)
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Sailors;
SELECT AVG(Sailors.age) FROM Sailors WHERE Sailors.rating = 7
SELECT AVG(Sailors.age) FROM Sailors WHERE Sailors.rating = 7
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(rating) AS avg_rating, MAX(age) AS max_age FROM Sailors
SELECT AVG(rating) AS avg_rating, MAX(age) AS max_age FROM Sailors
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT COUNT(*) FROM Boats WHERE color = 'red'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(rating) FROM Sailors
SELECT MAX(rating) FROM Sailors
SELECT S.name FROM Sailors AS S INNER JOIN Reserves AS R ON S.sid = R.sid INNER JOIN Boats AS B ON R.bid = B.bid WHERE B.name = 'Melon'
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT `Model`, `Price` FROM headphone ORDER BY `Price` DESC LIMIT 1
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
error: No SQL found in the input string
SELECT Class, COUNT(*) AS ClassCount FROM headphone GROUP BY Class ORDER BY ClassCount DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT `Earpads`) FROM headphone
error: No SQL found in the input string
SELECT h.Earpads, COUNT(*) AS count FROM stock s JOIN headphone h ON s.Headphone_ID = h.Headphone_ID GROUP BY h.Earpads ORDER BY count DESC LIMIT 2;
SELECT h.Earpads, SUM(s.Quantity) AS TotalHeadphones FROM stock AS s JOIN headphone AS h ON s.Headphone_ID = h.Headphone_ID JOIN store AS store ON s.Store_ID = store.Store_ID GROUP BY h.Earpads ORDER BY TotalHeadphones DESC LIMIT 2;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT DISTINCT T1.Class FROM headphone AS T1 INNER JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID WHERE T1.Earpads = 'Bowls' OR T1.Earpads = 'Comfort Pads'
SELECT DISTINCT h1.Class, h2.Class FROM headphone AS h1 JOIN stock AS s1 ON h1.Headphone_ID = s1.Headphone_ID JOIN stock AS s2 ON h1.Headphone_ID = s2.Headphone_ID AND s1.Store_ID = s2.Store_ID WHERE h1.Earpads = 'Bowls' AND h2.Earpads = 'Comfort Pads';
SELECT DISTINCT h.Earpads FROM headphone h WHERE h.Construction != 'Plastic'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name FROM store ORDER BY Date_Opened
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT store.Neighborhood) FROM store INNER JOIN stock ON store.Store_ID = stock.Store_ID
SELECT COUNT(DISTINCT store.Neighborhood) FROM store INNER JOIN stock ON store.Store_ID = stock.Store_ID;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT H.Model FROM headphone H LEFT JOIN stock S ON H.Headphone_ID = S.Headphone_ID WHERE S.Headphone_ID IS NULL
SELECT DISTINCT h.Model FROM headphone AS h LEFT JOIN stock AS s ON h.Headphone_ID = s.Headphone_ID WHERE s.Headphone_ID IS NULL
SELECT H.Model, SUM(S.Quantity) AS TotalQuantity FROM headphone AS H JOIN stock AS S ON H.Headphone_ID = S.Headphone_ID GROUP BY H.Model ORDER BY TotalQuantity DESC LIMIT 1
error: No SQL found in the input string
SELECT SUM(Quantity) FROM stock WHERE Store_ID = (SELECT Store_ID FROM store WHERE Name = 'Woodman')
SELECT SUM(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT s.Neighborhood FROM store s LEFT JOIN stock st ON s.Store_ID = st.Store_ID WHERE st.Headphone_ID IS NULL
SELECT DISTINCT T1.Neighborhood FROM store AS T1 LEFT JOIN stock AS T3 ON T1.Store_ID = T3.Store_ID WHERE T3.Headphone_ID IS NULL;
SELECT COUNT(DISTINCT `author_id`) FROM Author;
SELECT COUNT(DISTINCT `author_id`) FROM Author;
SELECT COUNT(*) FROM Paper;
SELECT COUNT(*) FROM Paper
SELECT COUNT(DISTINCT `affiliation_id`) FROM Affiliation
SELECT COUNT(DISTINCT A.affiliation_id) FROM Affiliation A
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.venue FROM Paper AS T1 ORDER BY T1.year
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Paper.title, Paper.paper_id FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Author ON Author_list.author_id = Author.author_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Author.name = 'Mckeown, Kathleen' OR Author.name = 'Rambow, Owen'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Author_list.paper_id = Paper.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('McKeown, Kathleen', 'Rambow, Owen')
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002';
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = (SELECT paper_id FROM Paper WHERE title = 'Evaluating The Use Of Prosodic Information In Speech Recognition And Understanding')
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT p.title, COUNT(c.cited_paper_id) AS citations FROM Paper p JOIN Citation c ON p.paper_id = c.paper_id GROUP BY p.paper_id ORDER BY citations DESC LIMIT 10;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T3.venue, T3.year FROM Affiliation AS T1 INNER JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T1.name = 'Columbia University'
SELECT DISTINCT T3.venue, T3.year FROM Author_list AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id JOIN Affiliation AS T3 ON T1.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University';
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.paper_id FROM Paper AS T1 INNER JOIN Citation AS T2 ON T1.paper_id = T2.paper_id WHERE T1.title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT A.name FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id INNER JOIN Paper P ON AL.paper_id = P.paper_id INNER JOIN Citation C ON P.paper_id = C.paper_id INNER JOIN Citation C2 ON C.cited_paper_id = C2.paper_id INNER JOIN Paper P2 ON C2.paper_id = P2.paper_id INNER JOIN Affiliation AF ON AL.affiliation_id = AF.affiliation_id WHERE P.venue IN ('ACL', 'NAACL') AND P.year = 2009 AND P2.year = 2009 AND AF.name IN ('Google Inc.', 'Indian Institute of Technology', 'University of California', 'The MITRE Corporation', 'National Institute of Technology', 'Hitachi Ltd.')
error: No SQL found in the input string
SELECT DISTINCT A.name FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue NOT LIKE '%ACL%'
SELECT DISTINCT A.name FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue != 'ACL'
SELECT COUNT(*) FROM conference
SELECT COUNT(*) FROM conference
SELECT DISTINCT T1.`Conference_Name` FROM conference AS T1
SELECT DISTINCT Conference_Name FROM conference
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Year, COUNT(*) FROM conference GROUP BY Year ORDER BY COUNT(*) ASC LIMIT 1
SELECT MIN(Year) FROM conference
SELECT Location FROM conference GROUP BY Location HAVING COUNT(*) >= 2
SELECT DISTINCT T1.Location FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Location HAVING COUNT(T2.Conference_ID) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT I.Institution_Name FROM institution I WHERE I.Institution_ID NOT IN (SELECT DISTINCT S.Institution_ID FROM staff S)
SELECT I.Institution_Name FROM institution I LEFT JOIN staff S ON I.Institution_ID = S.Institution_ID WHERE S.staff_ID IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age), MIN(Age) FROM staff
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID JOIN conference c1 ON cp1.Conference_ID = c1.Conference_ID WHERE c1.Conference_Name = 'ACL' AND s.staff_ID IN (SELECT staff_ID FROM conference_participation cp2 JOIN conference c2 ON cp2.Conference_ID = c2.Conference_ID WHERE c2.Conference_Name = 'NACCL')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT C.Conference_Name FROM conference C JOIN ( SELECT Conference_ID, COUNT(staff_ID) AS total_attendees FROM conference_participation GROUP BY Conference_ID ORDER BY total_attendees DESC ) AS T ON C.Conference_ID = T.Conference_ID WHERE T.total_attendees >= ( SELECT MAX(total_attendees) FROM ( SELECT Conference_ID, COUNT(staff_ID) AS total_attendees FROM conference_participation GROUP BY Conference_ID ) AS T2 ORDER BY total_attendees DESC LIMIT 2 )
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT s.name, s.Nationality FROM staff s LEFT JOIN conference_participation cp ON s.staff_ID = cp.staff_ID WHERE cp.Conference_ID IS NULL AND s.Nationality IS NOT NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT Hangar.location FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.plane_name = 'F-14 Fighter'
SELECT Hangar.location FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.plane_name = 'F-14 Fighter'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age LIMIT 1;
error: No SQL found in the input string
SELECT plane_name FROM Hangar GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT PilotSkills.plane_name) FROM PilotSkills
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Hangar.plane_name, Hangar.location FROM Hangar ORDER BY Hangar.plane_name
SELECT DISTINCT T1.plane_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.plane_name
SELECT DISTINCT T1.plane_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.plane_name
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT P.pilot_name, P.age FROM PilotSkills AS P WHERE (P.plane_name = 'Piper Cub' AND P.age > 35) OR (P.plane_name = 'F-14 Fighter' AND P.age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
error: No SQL found in the input string
SELECT DISTINCT T1.pilot_name FROM PilotSkills AS T1 LEFT JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.plane_name = 'Piper Cub' AND T1.plane_name != 'B-52 Bomber'
error: No SQL found in the input string
SELECT DISTINCT P1.pilot_name FROM PilotSkills P1 INNER JOIN PilotSkills P2 ON P1.plane_name = P2.plane_name WHERE P1.plane_name = 'Piper Cub' AND P2.plane_name = 'B-52 Bomber'
SELECT AVG(age) AS average_age, MIN(age) AS smallest_age FROM PilotSkills
SELECT AVG(age) AS average_age, MIN(age) AS minimum_age FROM PilotSkills
SELECT DISTINCT T1.pilot_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Austin' OR T2.location = 'Boston'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT plane_name, COUNT(*) FROM Hangar GROUP BY plane_name
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.plane_name, T2.pilot_name FROM PilotSkills AS T1 INNER JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name AND T2.age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = T1.plane_name) ORDER BY T2.age DESC;
error: No SQL found in the input string
SELECT DISTINCT T1.pilot_name, MAX(T1.age) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.pilot_name
error: No SQL found in the input string
SELECT H.location, COUNT(P.pilot_name) AS num_pilots, AVG(P.age) AS avg_age FROM Hangar AS H JOIN PilotSkills AS P ON H.plane_name = P.plane_name GROUP BY H.location
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT H.location FROM PilotSkills PS INNER JOIN Hangar H ON PS.plane_name = H.plane_name ORDER BY PS.age LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.pilot_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.plane_name = 'Piper Cub' AND T1.age > (SELECT MIN(T3.age) FROM PilotSkills AS T3 WHERE T3.plane_name = 'Piper Cub') ORDER BY T1.pilot_name
SELECT DISTINCT T1.pilot_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.plane_name = 'Piper Cub' ORDER BY T1.pilot_name
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.plane_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.plane_name LIKE '%Bomber%'
SELECT DISTINCT T1.plane_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location LIKE '%Bomber%'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Area_km), AVG(Area_km) FROM district
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT D.Name FROM district D, spokesman_district SD, spokesman S WHERE D.District_ID = SD.District_ID AND S.Spokesman_ID = SD.Spokesman_ID AND D.Government_website LIKE '%gov%'
error: No SQL found in the input string
SELECT spokesman.Name, spokesman.Speach_title FROM spokesman
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Name` FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT S.title FROM Sculptures S WHERE S.location = 'Gallery 226'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT medium FROM Paintings WHERE paintingID = 80
error: No SQL found in the input string
SELECT CONCAT(fname, ' ', lname) AS full_name FROM Artists WHERE birthYear > 1850
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `birthYear` FROM Artists WHERE EXISTS (SELECT 1 FROM Paintings WHERE Paintings.year = 1884 AND Paintings.mediumOn = 'canvas' AND Paintings.painterID = Artists.artistID)
error: No SQL found in the input string
SELECT DISTINCT A.fname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.location = 'Gallery 241' AND P.medium = 'oil'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.medium, COUNT(*) FROM ( SELECT DISTINCT medium FROM Paintings UNION ALL SELECT DISTINCT medium FROM Sculptures ) AS T1 GROUP BY T1.medium
SELECT T1.medium, AVG(T1.height_mm) AS average_height FROM Paintings AS T1 GROUP BY T1.medium
SELECT T1.medium, AVG(T1.height_mm) FROM Paintings AS T1 GROUP BY T1.medium
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Paintings.painterID FROM Paintings WHERE location = 'Gallery 240' AND medium = 'oil'
SELECT DISTINCT Paintings.painterID FROM Paintings WHERE location = 'Gallery 240' AND medium = 'oil'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT P.paintingID FROM Paintings P WHERE P.year < (SELECT MIN(year) FROM Paintings WHERE location = 'Gallery 240')
SELECT DISTINCT P.paintingID FROM Paintings P WHERE P.year < (SELECT MIN(P2.year) FROM Paintings P2 WHERE P2.location = 'Gallery 240')
SELECT MIN(year) FROM Paintings
SELECT MIN(year) FROM Paintings
error: No SQL found in the input string
SELECT CONCAT(A.fname, ' ', A.lname) AS full_name FROM Artists A INNER JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.title LIKE '%female%'
SELECT DISTINCT T1.title FROM Paintings AS T1 ORDER BY T1.title
SELECT DISTINCT T1.title FROM Paintings AS T1 ORDER BY T1.title
SELECT DISTINCT title FROM Paintings ORDER BY LENGTH(title)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `fname` FROM Artists WHERE `artistID` = (SELECT `artistID` FROM (SELECT COUNT(*) AS cnt, `sculptorID` FROM Sculptures GROUP BY `sculptorID`) AS T WHERE T.cnt = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt, `sculptorID` FROM Sculptures GROUP BY `sculptorID`) AS T2))
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT P.location FROM Paintings P WHERE P.year < 1885 OR P.year > 1930
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT P.location FROM Paintings P INNER JOIN (SELECT location FROM Paintings WHERE medium = 'panel' OR medium = 'canvas') AS T ON P.location = T.location
error: No SQL found in the input string
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT AVG(height_mm) AS average_height, AVG(width_mm) AS average_width FROM Paintings WHERE medium = 'oil' AND location = 'Gallery 241'
SELECT AVG(height_mm) AS average_height, AVG(width_mm) AS average_width FROM Paintings WHERE medium = 'oil' AND location = 'Gallery 241'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT height_mm, paintingID FROM Paintings WHERE location = 'Gallery 240' ORDER BY height_mm DESC LIMIT 1
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'Gallery 240')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM race;
SELECT COUNT(*) FROM race;
SELECT DISTINCT race.Winning_driver, race.Winning_team FROM race ORDER BY race.Winning_team ASC
error: No SQL found in the input string
SELECT DISTINCT race.Winning_driver FROM race INNER JOIN driver ON race.Driver_ID = driver.Driver_ID WHERE race.Pole_Position != 'Junior Strous'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Age), MIN(Age) FROM driver
SELECT MIN(Age) AS MinAge, MAX(Age) AS MaxAge FROM driver
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT d.Driver_Name, r.Race_Name FROM driver AS d JOIN race AS r ON d.Driver_ID = r.Driver_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Engine, COUNT(*) AS Engine_Count FROM driver GROUP BY Engine ORDER BY Engine_Count DESC LIMIT 1
SELECT Engine, COUNT(*) FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT T1.engine FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.engine HAVING COUNT(*) >= 2
SELECT DISTINCT T1.engine FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.engine HAVING COUNT(T1.engine) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT race.Winning_team FROM race INNER JOIN driver ON race.Driver_ID = driver.Driver_ID GROUP BY race.Winning_team HAVING COUNT(*) > 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM languages
SELECT COUNT(*) FROM languages
error: No SQL found in the input string
SELECT name FROM languages ORDER BY name ASC
SELECT `name` FROM languages WHERE `name` LIKE '%ish%'
SELECT `name` FROM languages WHERE `name` LIKE '%ish%'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(justice_score) FROM countries
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT COUNT(DISTINCT o.language_id) FROM official_languages o
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT `name` FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT countries.name, languages.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id
SELECT countries.name, languages.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id
error: No SQL found in the input string
SELECT l.name, COUNT(c.id) FROM languages AS l JOIN official_languages AS ol ON l.id = ol.language_id JOIN countries AS c ON ol.country_id = c.id GROUP BY l.id
SELECT l.name FROM languages l JOIN official_languages o ON l.id = o.language_id GROUP BY l.id ORDER BY COUNT(o.country_id) DESC LIMIT 1
SELECT l.name FROM languages l JOIN official_languages o ON l.id = o.language_id GROUP BY l.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id WHERE T2.country_id IN (SELECT country_id FROM official_languages GROUP BY country_id HAVING COUNT(language_id) >= 2)
SELECT DISTINCT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.name HAVING COUNT(T2.country_id) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.name ORDER BY COUNT(ol.country_id) DESC LIMIT 3;
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id ORDER BY COUNT(T2.country_id) DESC LIMIT 3
error: No SQL found in the input string
error: No SQL found in the input string
SELECT c.name FROM countries c JOIN official_languages o ON c.id = o.country_id GROUP BY c.id ORDER BY COUNT(o.language_id) DESC LIMIT 1
SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id GROUP BY official_languages.country_id ORDER BY COUNT(official_languages.language_id) DESC LIMIT 1
SELECT DISTINCT l.name FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id WHERE ol.country_id IS NULL
SELECT DISTINCT l.name FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id WHERE ol.country_id IS NULL
SELECT c.name FROM countries c LEFT JOIN official_languages o ON c.id = o.country_id WHERE o.language_id IS NULL
SELECT c.name FROM countries c LEFT JOIN official_languages o ON c.id = o.country_id WHERE o.language_id IS NULL
SELECT T1.name FROM languages AS T1 WHERE EXISTS ( SELECT 1 FROM countries AS T2 WHERE T2.overall_score > 95 AND T2.overall_score < 90 AND EXISTS ( SELECT 1 FROM official_languages AS T3 WHERE T3.language_id = T1.id AND T3.country_id = T2.id ) )
error: No SQL found in the input string
SELECT DISTINCT T1.country, T1.town_city FROM Addresses AS T1
SELECT Addresses.country, Addresses.town_city FROM Addresses
SELECT T1.county_state_province FROM Addresses AS T1 INNER JOIN Properties AS T2 ON T1.address_id = T2.property_address_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT feature_name, feature_description FROM Property_Features JOIN Features ON Property_Features.feature_id = Features.feature_id GROUP BY feature_name, feature_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT f.feature_name, f.feature_description FROM Features f JOIN Property_Features pf ON f.feature_id = pf.feature_id JOIN Properties prop ON pf.property_id = prop.property_id GROUP BY f.feature_id ORDER BY COUNT(pf.feature_id) DESC LIMIT 1;
SELECT MIN(Properties.room_count) FROM Properties
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT room_size) FROM Rooms
error: No SQL found in the input string
SELECT user_id, search_string FROM User_Searches GROUP BY user_id HAVING COUNT(*) >= 2
error: No SQL found in the input string
SELECT MAX(search_datetime) FROM User_Searches
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT A.zip_postcode FROM Properties AS P JOIN Users AS U ON P.owner_user_id = U.user_id JOIN Addresses AS A ON P.property_address_id = A.address_id WHERE U.user_id NOT IN (SELECT DISTINCT U2.user_id FROM Users AS U2 WHERE U2.is_seller = '1')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Ref_User_Categories.user_category_description FROM Users JOIN Ref_User_Categories ON Users.user_category_code = Ref_User_Categories.user_category_code WHERE Users.user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1)
SELECT `age_category_description` FROM Ref_Age_Categories WHERE `age_category_code` = (SELECT `age_category_code` FROM Users WHERE Users.user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime ASC LIMIT 1))
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Users WHERE is_buyer = 1;
SELECT COUNT(*) FROM Users WHERE is_buyer = 1;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(photo_seq) AS photo_count FROM Property_Photos WHERE property_id IN (SELECT DISTINCT property_id FROM Properties)
error: No SQL found in the input string
SELECT Users.user_id, COUNT(Property_Photos.photo_filename) AS photo_count FROM Users LEFT JOIN Properties ON Users.user_id = Properties.owner_user_id LEFT JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Users.user_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Ref_Property_Types.property_type_description, Ref_Property_Types.property_type_code FROM Ref_Property_Types GROUP BY Ref_Property_Types.property_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.`property_type_description`, COUNT(*) AS `count` FROM Ref_Property_Types AS T1 GROUP BY T1.`property_type_description` ORDER BY `count` DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
error: No SQL found in the input string
SELECT Addresses.country FROM Users JOIN Addresses ON Users.user_address_id = Addresses.address_id WHERE Users.user_id = (SELECT user_id FROM Users WHERE Users.first_name = 'Robbie')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(weight), MIN(weight) FROM bike
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT b.product_name FROM cyclists_own_bikes AS c JOIN cyclist AS cyc ON c.cyclist_id = cyc.id JOIN bike AS b ON c.bike_id = b.id WHERE cyc.nation IN ('Russia', 'Great Britain')
SELECT COUNT(DISTINCT heat) FROM cyclist
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist_id, COUNT(bike_id) AS num_bikes FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Flavor`, `Price` FROM goods WHERE `Food` = 'Cookie' ORDER BY `Price` LIMIT 1
SELECT goods.Id, goods.Flavor FROM goods WHERE goods.Price = (SELECT MIN(price) FROM goods WHERE goods.Food = 'Cookie')
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Flavor = 'Apple'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T4.Id FROM items AS T1 INNER JOIN goods AS T2 ON T1.Item = T2.Id INNER JOIN receipts AS T3 ON T1.Receipt = T3.ReceiptNumber INNER JOIN customers AS T4 ON T3.CustomerId = T4.Id WHERE T2.Flavor = 'Lemon'
SELECT DISTINCT T4.Id FROM goods AS T1 INNER JOIN items AS T2 ON T1.Id = T2.Item INNER JOIN receipts AS T3 ON T3.ReceiptNumber = T2.Receipt INNER JOIN customers AS T4 ON T3.CustomerId = T4.Id WHERE T1.Flavor = 'Lemon';
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT f.Food) FROM goods AS f
error: No SQL found in the input string
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Croissant'
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Croissant'
error: No SQL found in the input string
SELECT DISTINCT I.Item FROM items I JOIN receipts R ON I.Receipt = R.ReceiptNumber WHERE R.CustomerId = 15
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT R.ReceiptNumber FROM receipts AS R JOIN items AS I ON I.Item = 'Croissant' JOIN goods AS G ON G.Id = I.Item JOIN customers AS C ON R.CustomerId = C.Id WHERE C.LastName = 'Logan'
error: No SQL found in the input string
SELECT r.ReceiptNumber, r.Date FROM receipts AS r JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON i.Item = g.Id WHERE g.Price = (SELECT MAX(Price) FROM goods)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT r.ReceiptNumber FROM receipts AS r JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON g.Id = i.Item WHERE g.Price > 13
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Flavor LIKE '%APP%' OR Food LIKE '%APP%'
SELECT goods.Price FROM goods WHERE goods.Id = 70
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT items.Item FROM items ORDER BY items.Item
SELECT DISTINCT goods.Id FROM goods
SELECT * FROM receipts WHERE (SELECT COUNT(*) FROM items WHERE Item = 'Apple Pie') > 0 OR CustomerId = 12
SELECT DISTINCT r.ReceiptNumber FROM receipts AS r JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON i.Item = g.Id WHERE (g.Flavor = 'Apple' OR r.CustomerId = 12)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT LastName, FirstName FROM customers WHERE Id = (SELECT CustomerId FROM receipts ORDER BY Date ASC LIMIT 1)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(Price) FROM goods WHERE Flavor = 'Cheese'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Flavor, MIN(Price), MAX(Price) FROM goods GROUP BY Flavor
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Date FROM receipts AS T1 INNER JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt GROUP BY T1.Date ORDER BY COUNT(*) DESC LIMIT 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT g.Flavor FROM goods g JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'Chocolate' AND i.Ordinal <= 10
error: No SQL found in the input string
SELECT DISTINCT g.Flavor FROM goods g WHERE g.Food = 'Cake' AND g.Flavor NOT IN (SELECT g2.Flavor FROM goods g2 WHERE g2.Food = 'Tart')
SELECT DISTINCT g.Flavor FROM goods g WHERE g.Food = 'Cake' AND g.Flavor NOT IN (SELECT f.Flavor FROM goods f WHERE f.Food = 'Tart')
SELECT g.Flavor, COUNT(*) AS popularity FROM goods g JOIN items i ON g.Id = i.Item JOIN receipts r ON r.ReceiptNumber = i.Receipt GROUP BY g.Flavor ORDER BY popularity DESC LIMIT 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM driver;
SELECT COUNT(*) FROM driver;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Make FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Make HAVING COUNT(T2.Team_ID) > 1
SELECT DISTINCT T1.Make FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Make HAVING COUNT(T2.Team_ID) > 1
SELECT T1.Make FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID INNER JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Car_Owner = 'Buddy Arrington'
SELECT T1.Make FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID INNER JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) AS Max_Points, MIN(Points) AS Min_Points FROM driver
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT d.Driver, d.Country FROM driver AS d
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Make`, COUNT(*) AS `Number of Drivers` FROM driver GROUP BY `Make` ORDER BY `Number of Drivers` DESC LIMIT 1
SELECT `Make`, COUNT(*) FROM driver GROUP BY `Make` ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT `Make` FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) >= 3)
error: No SQL found in the input string
SELECT T1.Team FROM team AS T1 LEFT JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID WHERE T2.Driver_ID IS NULL
SELECT T3.Country FROM team_driver AS T1 INNER JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID INNER JOIN team AS T3 ON T1.Team_ID = T3.Team_ID WHERE T2.Make IN ('Dodge', 'Chevrolet') GROUP BY T3.Country HAVING COUNT(DISTINCT T2.Make) = 2
SELECT DISTINCT T1.Country FROM driver AS T1 INNER JOIN team_driver AS T2 ON T1.Driver_ID = T2.Driver_ID INNER JOIN team AS T3 ON T2.Team_ID = T3.Team_ID WHERE T3.Make = 'Dodge' OR T3.Make = 'Chevrolet'
error: No SQL found in the input string
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT DISTINCT T1.Country FROM country AS T1 LEFT JOIN team_driver AS T2 ON T1.Country = T2.Driver_ID IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM institution
SELECT COUNT(*) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
error: No SQL found in the input string
error: No SQL found in the input string
SELECT institution.City, institution.Province FROM institution
error: No SQL found in the input string
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Name FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Number_of_Championships > 0
error: No SQL found in the input string
SELECT SUM(T2.number_of_championships) FROM institution T1 INNER JOIN Championship T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Affiliation = 'Public'
SELECT SUM(`T2.number_of_championships`) FROM Championship T1 INNER JOIN institution T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Affiliation = 'Public'
SELECT Affiliation, COUNT(*) FROM institution GROUP BY Affiliation
error: No SQL found in the input string
SELECT `Affiliation`, COUNT(*) FROM institution GROUP BY `Affiliation` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Affiliation`, COUNT(*) as `Count` FROM institution GROUP BY `Affiliation` ORDER BY `Count` DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
error: No SQL found in the input string
SELECT DISTINCT T1.Province FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Founded < 1920 AND T1.Founded > 1950
error: No SQL found in the input string
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT B.Contents FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE W.Location = 'New York'
SELECT DISTINCT B.Contents FROM Boxes B INNER JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'New York'
error: No SQL found in the input string
SELECT Contents FROM Boxes WHERE Value > 150
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Value) AS AverageValue, SUM(Value) AS TotalValue FROM Boxes
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT Contents, AVG(Value) AS AvgValue, MAX(Value) AS MaxValue FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) AS Average, MAX(Value) AS Maximum FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) AS TotalValue FROM Boxes GROUP BY Contents ORDER BY TotalValue DESC LIMIT 1
SELECT MAX(Value) FROM Boxes
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago' OR Location = 'New York')
SELECT B1.Contents FROM Boxes AS B1 JOIN Boxes AS B2 ON B1.Contents = B2.Contents WHERE B1.Warehouse = 'Chicago' AND B2.Warehouse = 'New York'
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
error: No SQL found in the input string
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks' AND Boxes.Contents != 'Scissors'
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks' AND Boxes.Contents != 'Scissors'
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Contents IN ('Rocks', 'Scissors')
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Contents IN ('Rocks', 'Scissors')
SELECT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Contents IN ('Rocks', 'Scissors')
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT B.Code, B.Contents FROM Boxes AS B ORDER BY B.Value
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT B.Code FROM Boxes B WHERE B.Value > (SELECT MIN(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT B1.Code FROM Boxes B1 WHERE B1.Value > (SELECT MIN(B2.Value) FROM Boxes B2 WHERE B2.Contents = 'Rocks')
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Warehouses.Code, AVG(Boxes.Value) AS AvgValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING AVG(Boxes.Value) > 150
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Contents, SUM(Value) AS Total_Value, COUNT(*) AS Total_Boxes FROM Boxes GROUP BY Contents
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(Capacity) FROM Warehouses
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Warehouses.Code, COUNT(*) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
error: No SQL found in the input string
SELECT COUNT(DISTINCT W.Location) FROM Boxes AS B INNER JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE B.Contents = 'Rocks'
SELECT COUNT(DISTINCT Warehouses.Code) FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Contents = 'Rocks'
SELECT B.Code, W.Location FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code
SELECT B.Code, W.Location FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'
SELECT B.Code FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Code FROM Warehouses WHERE Capacity = 0
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio');
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(*) FROM university GROUP BY Home_Conference
error: No SQL found in the input string
SELECT State, COUNT(*) FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT DISTINCT u.Home_Conference FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE u.Enrollment > 2000
SELECT Home_Conference FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank = (SELECT MIN(Rank) FROM overall_ranking))
error: No SQL found in the input string
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT university.University_Name, university.City, university.State FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID INNER JOIN major_ranking ON university.University_ID = major_ranking.University_ID WHERE major_ranking.Rank = 1 AND major_ranking.Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting')
error: No SQL found in the input string
SELECT `University_Name` FROM university WHERE University_ID IN (SELECT `University_ID` FROM major_ranking WHERE Rank = 1)
SELECT `University_Name` FROM university WHERE University_ID IN (SELECT `University_ID` FROM major_ranking WHERE Rank = 1)
SELECT DISTINCT U.University_Name FROM university U LEFT JOIN major_ranking MR ON U.University_ID = MR.University_ID WHERE MR.Rank != 1
SELECT DISTINCT U.University_Name FROM university U LEFT JOIN major_ranking MR ON U.University_ID = MR.University_ID WHERE MR.Rank != 1
SELECT university.University_Name FROM university WHERE EXISTS ( SELECT 1 FROM major_ranking WHERE university.University_ID = major_ranking.University_ID AND major_ranking.Major_ID = (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') ) AND EXISTS ( SELECT 1 FROM major_ranking WHERE university.University_ID = major_ranking.University_ID AND major_ranking.Major_ID = (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education') )
SELECT DISTINCT u.University_Name FROM university u JOIN major_ranking mr1 ON u.University_ID = mr1.University_ID JOIN major_ranking mr2 ON u.University_ID = mr2.University_ID WHERE mr1.Major_ID = (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') AND mr2.Major_ID = (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `University_Name` FROM university WHERE `University_ID` = (SELECT `University_ID` FROM overall_ranking WHERE `Research_point` = (SELECT MAX(`Research_point`) FROM overall_ranking))
SELECT `University_Name` FROM university WHERE `University_ID` = (SELECT `University_ID` FROM overall_ranking WHERE `Research_point` = (SELECT MAX(`Research_point`) FROM overall_ranking))
error: No SQL found in the input string
SELECT university.University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC;
SELECT university.University_Name FROM university INNER JOIN major_ranking ON university.University_ID = major_ranking.University_ID INNER JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE major.Major_Name = 'Accounting' AND major_ranking.Rank <= 3
SELECT university.University_Name FROM university INNER JOIN major_ranking ON university.University_ID = major_ranking.University_ID INNER JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE major.Major_Name = 'Accounting' AND major_ranking.Rank <= 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T2.State FROM university AS T1 INNER JOIN (SELECT T3.State FROM university AS T3 WHERE T3.Enrollment < 3000) AS T2 ON T2.State = T1.State GROUP BY T2.State HAVING COUNT(*) > 2
SELECT DISTINCT T1.State FROM university AS T1 WHERE T1.Enrollment < 3000 GROUP BY T1.State HAVING COUNT(*) > 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon'
error: No SQL found in the input string
SELECT Movies.Title, MovieTheaters.Name FROM Movies INNER JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT Movies.Title, MovieTheaters.Name FROM Movies INNER JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM MovieTheaters;
SELECT COUNT(*) FROM MovieTheaters;
SELECT COUNT(DISTINCT MovieTheaters.Movie) FROM MovieTheaters
error: No SQL found in the input string
SELECT COUNT(DISTINCT Name) FROM MovieTheaters
SELECT COUNT(DISTINCT Name) FROM MovieTheaters
error: No SQL found in the input string
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating IN ('G', 'PG'))
error: No SQL found in the input string
SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name IN ('Odeon', 'Imperial')
error: No SQL found in the input string
SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon' AND EXISTS (SELECT 1 FROM MovieTheaters WHERE Name = 'Imperial' AND Movie = T1.Code)
SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name IN ('Odeon', 'Imperial') GROUP BY T1.Title HAVING COUNT(T2.Name) = 2
SELECT T1.Title FROM Movies AS T1 LEFT JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name != 'Odeon'
error: No SQL found in the input string
SELECT Title FROM Movies ORDER BY Title ASC
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM Movies ORDER BY Rating
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(Movie) = (SELECT COUNT(Movie) FROM MovieTheaters GROUP BY Movie ORDER BY COUNT(Movie) DESC LIMIT 1)
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(DISTINCT Movie) = (SELECT COUNT(DISTINCT Movie) FROM MovieTheaters) ORDER BY COUNT(DISTINCT Movie) DESC LIMIT 1
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie GROUP BY T1.Title ORDER BY COUNT(T2.Name) DESC LIMIT 1
SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie GROUP BY T1.Title ORDER BY COUNT(T2.Name) DESC LIMIT 1
error: No SQL found in the input string
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating = 'G')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM Movies;
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT Movies.* FROM Movies LEFT JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Movie IS NULL;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.Title FROM Movies AS T1 LEFT JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Movie IS NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(Package.Weight) FROM Package WHERE Sender = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Level FROM Has_Clearance WHERE Employee = (SELECT EmployeeID FROM Employee WHERE Position = 'Physician')
SELECT Level FROM Has_Clearance WHERE Employee = (SELECT EmployeeID FROM Employee WHERE Position = 'Physician')
SELECT P.PackageNumber FROM Package P INNER JOIN Shipment S ON P.Shipment = S.ShipmentID INNER JOIN Has_Clearance HC ON S.Planet = HC.Planet INNER JOIN Employee E ON HC.Employee = E.EmployeeID INNER JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package WHERE Sender = 'Leo Wong'
SELECT DISTINCT P.PackageNumber FROM Package P INNER JOIN Client C ON P.Recipient = C.AccountNumber WHERE C.Name = 'Leo Wong';
SELECT P.PackageNumber FROM Package P WHERE P.Recipient = 'Leo Wong';
SELECT P.PackageNumber, P.Sender, P.Recipient, P.Contents, P.Weight FROM Package P WHERE (P.Sender = 'Leo Wong' OR P.Recipient = 'Leo Wong')
SELECT DISTINCT P.PackageNumber FROM Package P WHERE (P.Sender = 'Leo Wong' OR P.Recipient = 'Leo Wong')
SELECT COUNT(*) FROM Package WHERE Sender = 'Ogden Wernstrom' AND Recipient = 'Leo Wong';
SELECT COUNT(*) FROM Package WHERE Sender = 'Ogden Wernstrom' AND Recipient = 'Leo Wong';
SELECT Contents FROM Package WHERE Sender = 'John Zoidfarb'
SELECT Contents FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'John Zoidfarb')
error: No SQL found in the input string
SELECT Package.PackageNumber, Weight FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name LIKE '%John%') ORDER BY Weight DESC LIMIT 1;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT C.Name, COUNT(*) AS NumberOfPackages FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber ORDER BY NumberOfPackages DESC LIMIT 1;
SELECT C.Name, COUNT(*) FROM Client AS C JOIN Package AS P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Coordinates` FROM Planet WHERE `Name` = 'Mars'
SELECT `Coordinates` FROM Planet WHERE `Name` = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT ShipmentID FROM Shipment WHERE Planet = (SELECT Name FROM Planet WHERE Name = 'Mars')
SELECT ShipmentID FROM Shipment WHERE Planet = (SELECT Name FROM Planet WHERE Name = 'Mars')
SELECT ShipmentID FROM Shipment WHERE Planet = (SELECT Name FROM Planet WHERE Name = 'Mars') AND Manager = (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
error: No SQL found in the input string
SELECT ShipmentID FROM Shipment WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars') OR Manager = (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
SELECT ShipmentID FROM Shipment WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars') AND Manager = (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Planet.Name FROM Planet JOIN Shipment ON Shipment.Planet = Planet.PlanetID GROUP BY Planet.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Planet FROM Shipment GROUP BY Planet HAVING COUNT(*) = (SELECT COUNT(*) FROM Shipment GROUP BY Planet)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(Package.Weight) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT SUM(Package.Weight) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
error: No SQL found in the input string
SELECT Planet.Name, SUM(Package.Weight) AS TotalWeight FROM Planet JOIN Shipment ON Shipment.Planet = Planet.PlanetID JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name
error: No SQL found in the input string
error: No SQL found in the input string
SELECT P.PackageNumber FROM Package P INNER JOIN Shipment S ON P.Shipment = S.ShipmentID INNER JOIN Planet P2 ON S.Planet = P2.PlanetID INNER JOIN Has_Clearance HC ON S.Planet = HC.Planet INNER JOIN Employee E ON HC.Employee = E.EmployeeID WHERE P2.Name = 'Omicron Persei 8' AND E.Name = 'Zapp Brannigan'
error: No SQL found in the input string
SELECT P.PackageNumber FROM Package P WHERE P.Shipment IN ( SELECT S.ShipmentID FROM Shipment S WHERE S.Planet = (SELECT P.PlanetID FROM Planet P WHERE P.Name = 'Omicron Persei 8') OR S.Manager = (SELECT E.EmployeeID FROM Employee E WHERE E.Name = 'Zapp Brannigan') )
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Package.PackageNumber, Package.Weight FROM Package WHERE Package.Weight BETWEEN 10 AND 30
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM game
SELECT COUNT(*) FROM game
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT AVG(units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
error: No SQL found in the input string
SELECT platform.Platform_name, platform.Market_district FROM platform
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(`Rank_of_the_year`), MIN(`Rank_of_the_year`) FROM player
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT developers FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Auburn'))
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Franchise`, COUNT(*) FROM game GROUP BY `Franchise` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Franchise`, COUNT(*) FROM game GROUP BY `Franchise` ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT P.Player_name FROM player P LEFT JOIN game_player GP ON P.Player_ID = GP.Player_ID WHERE GP.Player_ID IS NULL
error: No SQL found in the input string
SELECT DISTINCT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.College IN ('Oklahoma', 'Auburn')
SELECT DISTINCT `Franchise` FROM game
SELECT DISTINCT `Franchise` FROM game
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Year_Profits_billion) as Avg_Profit, MAX(Year_Profits_billion) as Max_Profit FROM press
SELECT P.Name, AVG(P.Year_Profits_billion) AS Avg_Yearly_Profit, MAX(P.Year_Profits_billion) AS Max_Yearly_Profit FROM press P GROUP BY P.Name
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT P.Name FROM press P ORDER BY P.Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Title, T1.Release_date FROM book AS T1 ORDER BY T1.Sale_Amount DESC LIMIT 5
SELECT DISTINCT B.Book_Series FROM book B WHERE B.Sale_Amount > 1000 AND B.Sale_Amount < 500
SELECT T1.Book_Series FROM book AS T1 WHERE T1.Sale_Amount > 1000 AND (SELECT COUNT(*) FROM book AS T2 WHERE T2.Book_Series = T1.Book_Series AND T2.Sale_Amount < 500) > 0
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Name` FROM author WHERE `Author_ID` = (SELECT `Author_ID` FROM book ORDER BY Sale_Amount DESC LIMIT 1)
SELECT `Author_ID`, MAX(`Sale_Amount`) FROM book
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT `author_name`) FROM Authors;
SELECT DISTINCT `author_name` FROM Authors
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Documents
SELECT `author_name` FROM Documents WHERE document_id = 4
SELECT `author_name` FROM Documents WHERE `document_name` = 'Travel to Brazil'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `author_name` FROM Documents GROUP BY `author_name` ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT COUNT(DISTINCT Business_Processes.process_id) FROM Business_Processes;
error: No SQL found in the input string
SELECT DISTINCT A.process_name FROM Business_Processes AS A INNER JOIN Documents_Processes AS C ON A.process_id = C.process_id INNER JOIN Documents AS D ON C.document_id = D.document_id INNER JOIN Staff_in_Processes AS E ON D.document_id = E.document_id AND A.process_id = E.process_id INNER JOIN Staff AS F ON E.staff_id = F.staff_id INNER JOIN Ref_Staff_Roles AS G ON F.staff_id = G.staff_id WHERE A.process_id = 9 AND G.staff_role_code = 'Manager'
SELECT COUNT(DISTINCT D.process_outcome_code) FROM Documents_Processes D
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT `process_outcome_description` FROM Process_Outcomes WHERE `process_outcome_code` = 'working'
SELECT COUNT(DISTINCT process_status_code) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status
SELECT `process_status_description` FROM Process_Status WHERE `process_status_code` = 'ct'
SELECT COUNT(*) FROM Staff;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT Ref_Staff_Roles.staff_role_code) FROM Ref_Staff_Roles;
error: No SQL found in the input string
SELECT `staff_role_description` FROM Ref_Staff_Roles WHERE `staff_role_code` = 'HR'
SELECT COUNT(*) FROM Documents_Processes;
SELECT DISTINCT D.process_id FROM Documents D JOIN Documents_Processes DP ON D.document_id = DP.document_id;
SELECT DISTINCT D.document_id FROM Documents D LEFT JOIN Documents_Processes DP ON D.document_id = DP.document_id WHERE DP.document_id IS NULL
SELECT DISTINCT D.process_id FROM Documents_Processes D LEFT JOIN Business_Processes BP ON D.process_id = BP.process_id WHERE BP.process_id IS NULL
SELECT DISTINCT dp.process_outcome_code, ps.process_status_code FROM Documents_Processes dp JOIN Process_Outcomes po ON dp.process_outcome_code = po.process_outcome_code JOIN Process_Status ps ON dp.process_status_code = ps.process_status_code WHERE dp.document_id = 0;
SELECT b.process_name FROM Business_Processes AS b JOIN Documents_Processes AS dp ON b.process_id = dp.process_id JOIN Documents AS d ON dp.document_id = d.document_id WHERE d.document_name = 'Travel to Brazil'
error: No SQL found in the input string
SELECT COUNT(*) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT `agency_id`) FROM Agencies
SELECT COUNT(*) FROM Agencies
error: No SQL found in the input string
SELECT agency_id, agency_details FROM Agencies
SELECT COUNT(*) FROM Clients;
SELECT COUNT(*) FROM Clients;
error: No SQL found in the input string
SELECT Clients.client_id, Clients.client_details FROM Clients
error: No SQL found in the input string
SELECT COUNT(DISTINCT Clients.client_id) AS NumOfClients, Agencies.agency_id FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id GROUP BY Agencies.agency_id
SELECT a.agency_id, a.agency_details FROM Agencies a JOIN Clients c ON a.agency_id = c.agency_id GROUP BY a.agency_id HAVING COUNT(c.client_id) = (SELECT COUNT(client_id) FROM Clients)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT A.agency_id, A.agency_details FROM Agencies AS A JOIN Clients AS C ON A.agency_id = C.agency_id GROUP BY A.agency_id HAVING COUNT(DISTINCT C.client_id) >= 2;
SELECT A.agency_details FROM Agencies AS A INNER JOIN Clients AS C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT Clients.client_details, Agencies.agency_details FROM Clients INNER JOIN Agencies ON Clients.agency_id = Agencies.agency_id WHERE Clients.client_details LIKE '%Mac%'
error: No SQL found in the input string
SELECT Clients.client_details, Agencies.agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
error: No SQL found in the input string
SELECT Clients.sic_code, COUNT(Clients.client_id) FROM Clients GROUP BY Clients.sic_code
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT A.agency_id, A.agency_details FROM Agencies AS A JOIN Clients AS C ON A.agency_id = C.agency_id
SELECT DISTINCT A.agency_id, A.agency_details FROM Agencies AS A JOIN Clients AS C ON A.agency_id = C.agency_id
SELECT DISTINCT T1.agency_id FROM Agencies AS T1 LEFT JOIN Clients AS T2 ON T1.agency_id = T2.agency_id WHERE T2.client_id IS NULL
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients)
SELECT COUNT(*) FROM Invoices;
SELECT COUNT(*) FROM Invoices;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Clients.client_id, COUNT(Invoices.invoice_id) AS NumberOfInvoices FROM Clients LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.client_id FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id HAVING COUNT(T1.invoice_id) >= 2
SELECT DISTINCT T2.client_id FROM Invoices AS T1 INNER JOIN Clients AS T2 ON T1.client_id = T2.client_id GROUP BY T2.client_id HAVING COUNT(T1.invoice_id) >= 2
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(*) AS invoice_count FROM Invoices GROUP BY invoice_status ORDER BY invoice_count DESC LIMIT 1
SELECT invoice_status, COUNT(*) AS invoice_count FROM Invoices GROUP BY invoice_status ORDER BY invoice_count DESC LIMIT 1
SELECT I.invoice_status, I.invoice_details, C.client_details, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
SELECT I.invoice_status, I.invoice_details, C.client_id, C.client_details, A.agency_id, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
error: No SQL found in the input string
SELECT DISTINCT `meeting_type`, `other_details` FROM Meetings
error: No SQL found in the input string
SELECT DISTINCT meeting_outcome, purpose_of_meeting FROM Meetings
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT I.invoice_id, I.invoice_status FROM Invoices I LEFT JOIN Payments P ON I.invoice_id = P.invoice_id WHERE P.payment_id IS NULL
SELECT COUNT(*) FROM Payments;
SELECT COUNT(*) FROM Payments
SELECT Payments.payment_id, Invoices.invoice_id, Payments.payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id
SELECT P.payment_id, I.invoice_id, P.payment_details FROM Payments AS P JOIN Invoices AS I ON P.invoice_id = I.invoice_id
error: No SQL found in the input string
SELECT DISTINCT I.invoice_id, I.invoice_status FROM Invoices I JOIN Payments P ON I.invoice_id = P.invoice_id
error: No SQL found in the input string
SELECT COUNT(*) AS payment_count, Invoices.invoice_id FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Staff;
SELECT COUNT(*) FROM Staff;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Meeting_Type, COUNT(*) AS NumberOfMeetings FROM Meetings GROUP BY Meeting_Type
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients WHERE Clients.client_id IN ( SELECT DISTINCT Clients.client_id FROM Clients WHERE Clients.client_id IN ( SELECT DISTINCT Meetings.client_id FROM Meetings ) OR Clients.client_id IN ( SELECT DISTINCT Invoices.client_id FROM Invoices ) )
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
