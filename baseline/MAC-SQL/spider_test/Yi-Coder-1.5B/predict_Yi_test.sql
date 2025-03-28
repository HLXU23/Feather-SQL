SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
error: No SQL found in the input string
error: No SQL found in the input string
SELECT club.Name, club.Manager, club.Captain FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Country = 'United States' OR player.Country = 'South Africa';
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
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player ORDER BY Earnings DESC LIMIT 1)
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
SELECT `Country` FROM player WHERE `Earnings` BETWEEN 1400000 AND 1100000
error: No SQL found in the input string
SELECT COUNT(DISTINCT `Country`) FROM player
SELECT COUNT(DISTINCT `Country`) FROM player
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Customers.customer_id, Customers.customer_first_name, Customers.customer_last_name FROM Customers JOIN (SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(DISTINCT order_id) > 2) AS orders ON Customers.customer_id = orders.customer_id JOIN (SELECT customer_id FROM Order_Items GROUP BY customer_id HAVING COUNT(DISTINCT order_item_id) > 2) AS items ON Customers.customer_id = items.customer_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Orders.`order_id`, Orders.`date_order_placed` FROM Orders JOIN Order_Items ON Orders.`order_id` = Order_Items.`order_id` GROUP BY Orders.`order_id` HAVING COUNT(Order_Items.`order_item_id`) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(P.product_price) as Total_Cost, O.order_status_code as Order_Status, C.customer_first_name as Customer_Name, C.customer_last_name as Customer_Last_Name FROM Orders AS O JOIN Customers AS C ON O.customer_id = C.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id WHERE O.order_status_code = 'Delivered' GROUP BY O.order_id ORDER BY Total_Cost ASC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id;
SELECT Invoices.`invoice_status_code`, Invoices.`invoice_date`, Shipments.`shipment_date` FROM Invoices JOIN Shipments ON Invoices.`invoice_number` = Shipments.`invoice_number`
error
error
SELECT `product_name`, `shipment_date` FROM `Products` JOIN `Shipment_Items` ON `Products`.`product_id` = `Shipment_Items`.`product_id`
error
error
error: No SQL found in the input string
error
SELECT DISTINCT T1.`product_name`, T1.`product_price`, T1.`product_description` FROM Products AS T1 JOIN Customers AS T2 ON T1.`product_id` = T2.`customer_id` WHERE T2.`gender_code` = 'Female'
SELECT product_name, product_price, product_description FROM Products WHERE product_id IN (SELECT customer_id FROM Customers WHERE gender_code = 'Female')
SELECT Invoices.invoice_status_code FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Orders.order_status_code != 'Delivered' AND Orders.order_status_code != 'Cancelled'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT `order_item_status_code`) FROM Orders
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT `payment_method_code`) FROM Customer_Payment_Methods
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
SELECT DISTINCT `order_status_code`, `date_order_placed` FROM Orders
error
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `customer_first_name`, `product_name` FROM Customers JOIN Order_Items ON Customers.`customer_id` = Order_Items.`customer_id` JOIN Order_Items ON Order_Items.`order_item_id` = Order_Items.`order_item_id` JOIN Products ON Order_Items.`product_id` = Products.`product_id`
error: No SQL found in the input string
SELECT COUNT(*) FROM Shipments
SELECT COUNT(*) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT order_status_code, COUNT(*) FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT Order_Items.product_id, Products.product_name, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.product_id, Products.product_name, Products.product_description HAVING COUNT(Order_Items.product_id) > 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `shipment_tracking_number`, `shipment_date` FROM Shipments
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT `Digital_terrestrial_channel`) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT channel.Name, COUNT(program.Program_ID) as Number_of_programs FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Name
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `Name` FROM director WHERE `Age` BETWEEN 30 AND 60
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
error: No SQL found in the input string
error: No SQL found in the input string
SELECT transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
error: No SQL found in the input string
SELECT AVG(ERP_kW) FROM radio
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T3.`Transmitter`, T1.`City` FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.`ID` = T2.`City_channel_ID` JOIN radio AS T3 ON T2.`Radio_ID` = T3.`Radio_ID`
error: No SQL found in the input string
SELECT `Transmitter`, COUNT(*) FROM radio GROUP BY `Radio_ID`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Name` FROM driver WHERE `Citizenship` = 'United States'
SELECT `Name` FROM driver WHERE `Citizenship` = 'United States'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Power) as Maximum_Power, AVG(Power) as Average_Power FROM vehicle WHERE Builder = 'Zhuzhou'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Top_Speed`, `Power` FROM vehicle WHERE `Build_Year` = '1996'
SELECT `Build_Year`, `Model`, `Builder` FROM vehicle
SELECT `Build_Year`, `Model`, `Builder` FROM vehicle
error: No SQL found in the input string
SELECT COUNT(DISTINCT driver.Name) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year LIKE '%2012%' AND driver.Citizenship IS NOT NULL
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
error: No SQL found in the input string
SELECT D.Name FROM driver AS D JOIN vehicle_driver AS VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle AS V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Power > 5000
error: No SQL found in the input string
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
error: No SQL found in the input string
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT vehicle.`Vehicle_ID`, vehicle.`Model` FROM vehicle JOIN vehicle_driver ON vehicle.`Vehicle_ID` = vehicle_driver.`Vehicle_ID` JOIN driver ON vehicle_driver.`Driver_ID` = driver.`Driver_ID` WHERE driver.`Citizenship` IN ('United States', 'Ziyang') GROUP BY vehicle.`Vehicle_ID`, vehicle.`Model` HAVING COUNT(*) >= 2
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver AS T1 ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS T2 ON T2.Driver_ID = vehicle_driver.Driver_ID WHERE T2.Name IN ('Tony Stewart', 'Ryan Hunter-Reay', 'Jimmie Johnson', 'Jeff Gordon') AND T2.Citizenship IN ('United States') GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT T2.Name) IN (2, 3);
SELECT T1.`Vehicle_ID`, T1.`Model` FROM vehicle AS T1 JOIN vehicle_driver AS T3 ON T1.`Vehicle_ID` = T3.`Vehicle_ID` JOIN driver AS T2 ON T3.`Driver_ID` = T2.`Driver_ID` WHERE T2.`Name` = 'Jeff Gordon' OR (SELECT COUNT(*) FROM vehicle_driver WHERE Vehicle_ID = T1.`Vehicle_ID`) > 2
SELECT vehicle.`Vehicle_ID`, vehicle.`Model` FROM vehicle JOIN vehicle_driver AS T1 ON vehicle.`Vehicle_ID` = T1.`Vehicle_ID` JOIN driver AS T2 ON T1.`Driver_ID` = T2.`Driver_ID` WHERE T2.`Name` = 'Jeff Gordon' OR (SELECT COUNT(*) FROM vehicle_driver WHERE vehicle_driver.`Vehicle_ID` = vehicle.`Vehicle_ID`) > 2
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.`Name` FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.`Driver_ID` = T2.`Driver_ID` ORDER BY T1.`Name`
SELECT `Name` FROM driver ORDER BY `Name` ASC
SELECT T1.`Racing_Series`, COUNT(*) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.`Driver_ID` = T2.`Driver_ID` GROUP BY T1.`Racing_Series`
SELECT T1.`Racing_Series`, COUNT(*) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.`Driver_ID` = T2.`Driver_ID` GROUP BY T1.`Racing_Series`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Exams
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
SELECT COUNT(DISTINCT `Comments`) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
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
SELECT `Student_Answer_Text` FROM Student_Answers WHERE `Comments` IN ('Normal', 'Absent') AND `Student_Answer_Text` IN (SELECT `Student_Answer_Text` FROM Student_Answers WHERE `Comments` IN ('Normal', 'Absent'))
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT * FROM Students
error: No SQL found in the input string
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT `address_id`, `address_details` FROM Addresses
SELECT `address_id`, `address_details` FROM Addresses
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
SELECT `product_type_code`, AVG(`product_price`) FROM `Products`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Customers
error: No SQL found in the input string
SELECT `customer_id`, `customer_name` FROM Customers
SELECT `customer_id`, `customer_name` FROM Customers
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
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT Customer_Orders.order_id, Customer_Orders.order_date, Customer_Orders.order_status_code FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customers.customer_name = 'Jeromy'
error: No SQL found in the input string
SELECT `customer_name`, `customer_id`, COUNT(*) FROM Customers GROUP BY `customer_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `order_status_code`, COUNT(*) FROM Customer_Orders GROUP BY `order_status_code`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `product_name` FROM `Products` WHERE `product_id` NOT IN (SELECT `product_id` FROM `Order_Items`)
error: No SQL found in the input string
SELECT COUNT(*) FROM Products WHERE product_name = 'Monitor'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Customer_Orders.`order_date`, Customer_Orders.`order_id` FROM Customer_Orders WHERE (SELECT COUNT(*) FROM Order_Items WHERE Order_Items.`order_id` = Customer_Orders.`order_id`) > 3 OR (SELECT SUM(order_quantity) FROM Order_Items WHERE Order_Items.`order_id` = Customer_Orders.`order_id`) > 6
SELECT Order_Items.`order_id`, Customer_Orders.`order_date` FROM Customer_Orders JOIN Order_Items ON Customer_Orders.`order_id` = Order_Items.`order_id` WHERE (SELECT COUNT(*) FROM Order_Items WHERE Order_Items.`order_id` = Customer_Orders.`order_id`) > 3 OR (SELECT SUM(order_quantity) FROM Order_Items WHERE Order_Items.`order_id` = Customer_Orders.`order_id`) > 6
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name FROM building ORDER BY Number_of_Stories ASC
error: No SQL found in the input string
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Name, Address, Completed_Year FROM building JOIN region ON building.Region_ID = region.Region_ID ORDER BY Completed_Year DESC
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(`Population`) FROM region
SELECT AVG(`Population`) FROM region
SELECT Name FROM region ORDER BY Name ASC
error: No SQL found in the input string
SELECT `Name` FROM region WHERE `Area` > 10000 AND `Capital` IS NOT NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name FROM region WHERE Area = (SELECT MAX(Area) FROM region)
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
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`Completed_Year`, COUNT(*) FROM building AS T1 JOIN region AS T2 ON T1.`Region_ID` = T2.`Region_ID` WHERE T1.`Number_of_Stories` > 20 OR T1.`Number_of_Stories` < 15 GROUP BY T1.`Completed_Year`
SELECT DISTINCT Completed_Year FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE Number_of_Stories > 20 AND Number_of_Stories < 15
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Name, Completed_Year FROM building WHERE Region_ID IN (SELECT Region_ID FROM region ORDER BY Population DESC) ORDER BY Number_of_Stories DESC
SELECT Building_Name, Completed_Year FROM building JOIN region ON building.Region_ID = region.Region_ID ORDER BY Number_of_Stories DESC
error: No SQL found in the input string
SELECT `Channel_Details` FROM Channels ORDER BY `Channel_Details` ASC
SELECT COUNT(*) FROM Services
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
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT COUNT(*) FROM Customers_and_Services
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
SELECT T1.`Analytical_Layer_Type_Code`, COUNT(*) FROM Analytical_Layer AS T1 JOIN Customers_and_Services AS T2 ON T1.`Customers_and_Services_ID` = T2.`Customers_and_Services_ID` GROUP BY T1.`Analytical_Layer_Type_Code`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `Type_of_powertrain` FROM Vehicles
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(Annual_fuel_cost) AS Min_Annual_Fuel_Cost, MAX(Annual_fuel_cost) AS Max_Annual_Fuel_Cost, AVG(Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles;
error: No SQL found in the input string
SELECT `name`, `Model_year` FROM `Vehicles` WHERE `City_fuel_economy_rate` <= `Highway_fuel_economy_rate`
SELECT `name`, `Model_year` FROM `Vehicles` WHERE `City_fuel_economy_rate` <= `Highway_fuel_economy_rate`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT D.name, C.name, C.age, C.membership_credit FROM Customers C JOIN Discount D ON C.id = D.id
SELECT V.`name`, SUM(R.`total_hours`) as Total_hours FROM Vehicles as V JOIN Renting_history as R ON V.`id` = R.`vehicles_id` GROUP BY V.`id`
SELECT `name`, SUM(`total_hours`) FROM `Vehicles` JOIN `Renting_history` ON `Vehicles`.`id` = `Renting_history`.`vehicles_id` GROUP BY `Vehicles`.`id`
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM Customers WHERE `id` IN (SELECT `customer_id` FROM Renting_history GROUP BY `customer_id` HAVING COUNT(`id`) >= 2)
error: No SQL found in the input string
SELECT `name`, `Model_year` FROM Vehicles WHERE `id` = (SELECT `vehicles_id` FROM Renting_history ORDER BY `total_hours` DESC LIMIT 1)
error: No SQL found in the input string
SELECT Vehicles.name, Vehicles.Combined_fuel_economy_rate FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id JOIN Customers ON Renting_history.customer_id = Customers.id WHERE Vehicles.Type_of_powertrain = 'Electric' GROUP BY Vehicles.name, Vehicles.Combined_fuel_economy_rate ORDER BY SUM(Renting_history.total_hours) DESC;
SELECT Vehicles.name, COUNT(Renting_history.total_hours) as total_hours FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Vehicles.name IS NOT NULL AND Renting_history.total_hours IS NOT NULL GROUP BY Vehicles.name ORDER BY total_hours DESC
SELECT `name`, COUNT(*) FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.`discount_id` = T2.`id` GROUP BY T1.`discount_id` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `name` FROM Discount WHERE id = (SELECT MAX(discount_id) FROM Renting_history)
error: No SQL found in the input string
SELECT `name`, `Type_of_powertrain` FROM Vehicles WHERE `Combined_fuel_economy_rate` > 30 AND `City_fuel_economy_rate` > 30 AND `Highway_fuel_economy_rate` > 30 AND `Cost_per_25_miles` > 30
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(amount_of_loan) FROM Student_Loans
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
SELECT DISTINCT(`detention_summary`) FROM Detention
SELECT DISTINCT(`detention_summary`) FROM Detention
SELECT bio_data, address_type_description FROM Students JOIN (SELECT address_type_code, address_type_description FROM Ref_Address_Types) AS Address_Types ON Students.student_id = Address_Types.student_id
SELECT bio_data, student_details, address_type_description FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code WHERE Students_Addresses.date_from <= '2018-03-22 10:12:26.000' AND Students_Addresses.date_to >= '2017-05-18 23:15:01.000' ORDER BY Students.student_id ASC;
SELECT Students.`bio_data`, Students.`student_details`, Addresses.`address_details` FROM Students JOIN Students_Addresses ON Students.`student_id` = Students_Addresses.`student_id` JOIN Addresses ON Students_Addresses.`address_id` = Addresses.`address_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN ( SELECT student_id, behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AS T2 ON T1.student_id = T2.student_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `bio_data`, `event_date` FROM `Students` JOIN `Student_Events` ON `Students`.`student_id` = `Student_Events`.`student_id`
SELECT `bio_data`, `event_date` FROM `Students` JOIN `Student_Events` ON `Students`.`student_id` = `Student_Events`.`student_id`
error: No SQL found in the input string
error: No SQL found in the input string
SELECT achievement_details, achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
SELECT Achievements.`achievement_details`, Ref_Achievement_Type.`achievement_type_description` FROM Achievements JOIN Ref_Achievement_Type ON Achievements.`achievement_type_code` = Ref_Achievement_Type.`achievement_type_code`
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `date_of_transcript`, `transcript_details` FROM Transcripts
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `achievement_type_code`, `achievement_details`, `date_achievement` FROM Achievements WHERE `achievement_type_code` = 'Scholastic'
SELECT `datetime_detention_start`, `datetime_detention_end` FROM Detention
SELECT `datetime_detention_start`, `datetime_detention_end` FROM Detention
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `teacher_details`, `student_id`, `class_details` FROM `Teachers` AS T1 JOIN `Classes` AS T2 ON T1.`teacher_id` = T2.`teacher_id`
SELECT `teacher_details`, `student_id` FROM Teachers AS T1 JOIN Classes AS T2 ON T1.`teacher_id` = T2.`teacher_id`
error: No SQL found in the input string
error: No SQL found in the input string
SELECT S.student_id, COUNT(C.class_id) as num_courses FROM Students as S JOIN Classes as C ON S.student_id = C.student_id GROUP BY S.student_id ORDER BY num_courses DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `bio_data`, `student_details` FROM Students WHERE `student_id` IN (SELECT `student_id` FROM Student_Loans WHERE `amount_of_loan` > (SELECT AVG(`amount_of_loan`) FROM Student_Loans))
SELECT MIN(`date_of_loan`) FROM Student_Loans
SELECT MIN(`date_of_loan`) FROM Student_Loans
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
SELECT `datetime_detention_start` FROM Detention
SELECT DISTINCT `Name` FROM Author
SELECT DISTINCT `Name` FROM Author
SELECT Name, Address FROM Client
SELECT Name, Address FROM Client
error
error
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
-- How many clients are there? SELECT COUNT(*) FROM Client
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Title`, `Name` FROM Book JOIN Author ON Book.`Author` = Author.`idAuthor`
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Orders.`IdOrder`, Client.`Name` FROM Orders JOIN Client ON Orders.`IdClient` = Client.`IdClient`
SELECT Orders.`IdOrder`, Client.`Name` FROM Orders JOIN Client ON Client.`IdClient` = Orders.`IdClient`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`ISBN`, SUM(T2.`amount`) FROM Book AS T1 JOIN Books_Order AS T2 ON T1.`ISBN` = T2.`ISBN` GROUP BY T1.`ISBN`
error: No SQL found in the input string
SELECT Book.`Title` FROM Book JOIN Books_Order ON Book.`ISBN` = Books_Order.`ISBN` JOIN Orders ON Books_Order.`IdOrder` = Orders.`IdOrder` WHERE Books_Order.`amount` = (SELECT MAX(amount) FROM Books_Order)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Book.`Title` FROM Book JOIN Books_Order ON Book.`ISBN` = Books_Order.`ISBN` JOIN Orders ON Books_Order.`IdOrder` = Orders.`IdOrder`
error: No SQL found in the input string
SELECT DISTINCT T1.`Name` FROM Client AS T1 JOIN Orders AS T2 ON T1.`IdClient` = T2.`IdClient`
SELECT DISTINCT Client.Name FROM Client INNER JOIN Orders ON Client.IdClient = Orders.IdClient
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Name, COUNT(*) FROM Client AS T1 JOIN Books_Order AS T2 ON T1.IdClient = T2.IdClient WHERE T2.IdClient IS NOT NULL GROUP BY T1.IdClient, T1.Name
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(SalePrice) as Maximum_Sale_Price, MIN(SalePrice) as Minimum_Sale_Price FROM Book
SELECT MAX(SalePrice) as Maximum_Sale_Price, MIN(SalePrice) as Minimum_Sale_Price FROM Book
SELECT AVG(PurchasePrice) as Average_Purchase_Price, AVG(SalePrice) as Average_Sale_Price FROM Book
SELECT AVG(PurchasePrice) AS 'Average Purchase Price', AVG(SalePrice) AS 'Average Sale Price' FROM Book
SELECT MAX(sale_price - purchase_price) as max_difference FROM ( SELECT sale_price, purchase_price FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Books_Order ON Book.ISBN = Books_Order.ISBN JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder WHERE purchase_price is NOT NULL AND sale_price is NOT NULL ) as subquery ORDER BY subquery.sale_price DESC;
SELECT MAX(SalePrice - PurchasePrice) as Difference FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Books_Order ON Book.ISBN = Books_Order.ISBN JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder WHERE Author = 'George Orwell' AND PurchasePrice is NOT NULL ORDER BY PurchasePrice ASC, Title ASC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM Book WHERE Author = (SELECT idAuthor FROM Author WHERE Name = 'Plato') AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Orders.`IdOrder` FROM Orders JOIN Books_Order ON Orders.`IdOrder` = Books_Order.`IdOrder` JOIN Book ON Books_Order.`ISBN` = Book.`ISBN` WHERE Book.`Title` IN ('Pride and Prejudice', 'The Little Prince')
SELECT Orders.`IdOrder` FROM Orders JOIN Books_Order ON Orders.`IdOrder` = Books_Order.`IdOrder` JOIN Book ON Books_Order.`ISBN` = Book.`ISBN` WHERE Book.`Title` IN ('Pride and Prejudice', 'The Little Prince') AND Book.`Title` IN ('Pride and Prejudice', 'The Little Prince')
SELECT T1.`ISBN` FROM Book AS T1 JOIN Books_Order AS T2 ON T1.`ISBN` = T2.`ISBN` JOIN Orders AS T3 ON T2.`IdOrder` = T3.`IdOrder` WHERE T3.`IdClient` IN ('Peter Doe', 'James Smith')
SELECT Book.`ISBN` FROM Book JOIN Books_Order ON Book.`ISBN` = Books_Order.`ISBN` JOIN Orders ON Books_Order.`IdOrder` = Orders.`IdOrder` JOIN Author_Book ON Book.`ISBN` = Author_Book.`ISBN` JOIN Author ON Author_Book.`Author` = Author.`idAuthor` WHERE Author.`Name` IN ('Peter Doe', 'James Smith')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Name` FROM Client WHERE `IdClient` IN (SELECT `IdClient` FROM Orders WHERE `IdOrder` IN (SELECT `IdOrder` FROM Books_Order WHERE `ISBN` IN (SELECT `ISBN` FROM Book WHERE `Title` = 'Pride and Prejudice')))
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title, Release FROM book JOIN review ON book.Book_ID = review.Book_ID WHERE Type = 'Novel' AND Title is NOT NULL ORDER BY Release ASC;
SELECT MAX(Chapters) as Maximum_Chapters, MIN(Chapters) as Minimum_Chapters FROM book JOIN review ON book.Book_ID = review.Book_ID WHERE chapters is NOT NULL
error: No SQL found in the input string
SELECT AVG(Rating) FROM review
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM book JOIN review ON book.Book_ID = review.Book_ID WHERE review.Rank = (SELECT MIN(Rank) FROM review)
error: No SQL found in the input string
SELECT Type, COUNT(*) as Number_of_Books FROM book JOIN review ON book.Book_ID = review.Book_ID GROUP BY Type
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM book JOIN review ON book.Book_ID = review.Book_ID ORDER BY review.Rating ASC
SELECT Title, Pages, MAX(Readers_in_Million) as Max_Readers FROM review JOIN book ON review.Book_ID = book.Book_ID WHERE Title is NOT NULL GROUP BY Title, Pages ORDER BY Max_Readers DESC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM customer
SELECT Name FROM customer WHERE Level_of_Membership = (SELECT MIN(Level_of_Membership) FROM customer) ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
error: No SQL found in the input string
SELECT `Name`, `Card_Credit` FROM customer
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT c.Name, COUNT(c.Customer_ID) as 'Number of Customers' FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID WHERE c.Name NOT LIKE '%None%' AND c.Name IS NOT NULL GROUP BY c.Name;
SELECT `Nationality`, COUNT(*) FROM customer GROUP BY `Nationality`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Name`, `Dish_Name` FROM customer JOIN customer_order
SELECT T1.`Name`, T2.`Dish_Name` FROM customer AS T1 JOIN customer_order AS T2 ON T1.`Customer_ID` = T2.`Customer_ID`
SELECT T1.`Name`, T2.`Dish_Name`, SUM(T2.`Quantity`) as Total_Quantity FROM customer AS T1 JOIN customer_order AS T2 ON T1.`Customer_ID` = T2.`Customer_ID` GROUP BY T1.`Name`, T2.`Dish_Name` ORDER BY Total_Quantity DESC
SELECT T1.`Name`, T2.`Dish_Name`, T2.`Quantity` FROM customer AS T1 JOIN customer_order AS T2 ON T1.`Customer_ID` = T2.`Customer_ID` GROUP BY T2.`Customer_ID`, T2.`Branch_ID` ORDER BY T2.`Quantity` DESC
SELECT T1.`Name`, SUM(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.`Customer_ID` = T2.`Customer_ID` GROUP BY T1.`Customer_ID`
SELECT T1.`Name`, SUM(T2.Quantity) AS Total_Quantity FROM customer AS T1 JOIN customer_order AS T2 ON T1.`Customer_ID` = T2.`Customer_ID` GROUP BY T1.`Customer_ID`
SELECT T1.`Name`, SUM(T2.`Quantity`) FROM customer AS T1 JOIN customer_order AS T2 ON T1.`Customer_ID` = T2.`Customer_ID` GROUP BY T1.`Customer_ID` HAVING SUM(T2.`Quantity`) > 1
SELECT customer.Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID WHERE customer_order.Quantity > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT `Manager` FROM branch
error: No SQL found in the input string
SELECT `Name` FROM customer WHERE `Customer_ID` NOT IN (SELECT `Customer_ID` FROM customer_order)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Overall_Ranking` FROM club WHERE Club_ID = (SELECT Club_ID FROM club_leader WHERE Member_ID = (SELECT MAX(Member_ID) FROM member))
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Nationality`, COUNT(*) FROM member JOIN club_leader ON member.`Member_ID` = club_leader.`Member_ID` JOIN club ON club_leader.`Club_ID` = club.`Club_ID` GROUP BY `Nationality`
error: No SQL found in the input string
error: No SQL found in the input string
SELECT member.Name, club.Club_Name FROM member JOIN club_leader ON member.Member_ID = club_leader.Member_ID
SELECT `Name` FROM member WHERE `Member_ID` IN (SELECT `Member_ID` FROM club_leader WHERE `Club_ID` IN (SELECT `Club_ID` FROM club WHERE `Overall_Ranking` > 100))
SELECT `Name` FROM member INNER JOIN club_leader ON member.`Member_ID` = club_leader.`Member_ID` WHERE `Year_Join` < '2018'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.`Nationality` FROM member AS T1 JOIN club_leader AS T2 ON T1.`Member_ID` = T2.`Member_ID` JOIN club AS T3 ON T2.`Club_ID` = T3.`Club_ID` WHERE T1.`Age` > 22 AND T1.`Age` < 19 AND T2.`Year_Join` = (SELECT MIN(Year_Join) FROM club_leader WHERE `Member_ID` = T1.`Member_ID`)
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
SELECT Document_Objects.`Document_Object_ID` FROM Document_Objects
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
SELECT DOC.`Document_Object_ID`, COUNT(DOC2.`Document_Object_ID`) as Child_Documents FROM Documents_in_Collections AS DOC JOIN Document_Objects AS DOC2 ON DOC.`Document_Object_ID` = DOC2.`Document_Object_ID` JOIN Document_Subset_Members AS DSM ON DOC2.`Document_Object_ID` = DSM.`Related_Document_Object_ID` JOIN Document_Subsets AS DS ON DSM.`Document_Subset_ID` = DS.`Document_Subset_ID` JOIN Collection_Subset_Members AS CSM ON DOC.`Collection_ID` = CSM.`Related_Collection_ID` JOIN Collection_Subsets AS CS ON CSM.`Collection_Subset_ID` = CS.`Collection_Subset_ID` WHERE DS.`Document_Subset_ID` = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2007') GROUP BY DOC.`Document_Object_ID`
error: No SQL found in the input string
SELECT `Collection_Name` FROM Collections
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
SELECT DISTINCT T1.`Document_Object_ID`, T2.`Document_Object_ID`, T4.`Document_Subset_ID` FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.`Related_Document_Object_ID` = T2.`Document_Object_ID` JOIN Documents_in_Collections AS T3 ON T2.`Document_Object_ID` = T3.`Document_Object_ID` JOIN Document_Subsets AS T4 ON T1.`Document_Subset_ID` = T4.`Document_Subset_ID` WHERE T2.`Owner` IS NOT NULL AND T4.`Document_Subset_Name` IS NOT NULL AND T4.`Document_Subset_Name` != 'None' AND T4.`Document_Subset_Name` != 'none' AND T4.`Document_Subset_Name` != 'None' AND T4.`Document_Subset_Name` != 'none' ORDER BY T4.`Document_Subset_Name` ASC
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
SELECT T1.`Document_Subset_ID`, T1.`Document_Subset_Name`, COUNT(T2.`Document_Object_ID`) FROM Document_Subsets AS T1 JOIN Documents_in_Collections AS T2 ON T1.`Document_Subset_ID` = T2.`Collection_ID` GROUP BY T1.`Document_Subset_ID`
SELECT DISTINCT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Related_Document_Object_ID) FROM (SELECT * FROM Document_Subset_Members INNER JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID) WHERE Related_Document_Object_ID IS NOT NULL GROUP BY Document_Subset_ID, Document_Subset_Name
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DOCUMENT_OBJECTS.`Document_Object_ID`, COUNT(COLLECTIONS.`Collection_ID`) FROM Documents_in_Collections JOIN COLLECTIONS ON Documents_in_Collections.`Collection_ID` = COLLECTIONS.`Collection_ID` JOIN DOCUMENT_OBJECTS ON Documents_in_Collections.`Document_Object_ID` = DOCUMENT_OBJECTS.`Document_Object_ID` GROUP BY DOCUMENT_OBJECTS.`Document_Object_ID`
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
SELECT `name`, `language` FROM songs
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT participants.id, participants.name FROM participants LEFT JOIN performance_score ON participants.id = performance_score.participant_id LEFT JOIN songs ON performance_score.songs_id = songs.id WHERE songs.name IS NOT NULL GROUP BY participants.id, participants.name HAVING COUNT(DISTINCT songs.id) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT P.name, S.name, P.popularity FROM participants AS P JOIN performance_score AS PS ON P.id = PS.participant_id JOIN songs AS S ON PS.songs_id = S.id WHERE S.language IN ('Croatian', 'English') AND S.english_translation IS NOT NULL GROUP BY P.name, S.name HAVING COUNT(DISTINCT S.language) = 2
error: No SQL found in the input string
SELECT original_artist, english_translation FROM songs JOIN performance_score ON songs.id = performance_score.songs_id WHERE rhythm_tempo > 5 AND voice_sound_quality is NOT NULL ORDER BY voice_sound_quality DESC
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
SELECT COUNT(*) FROM City WHERE country = 'Canada'
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
SELECT City.`city_name` FROM City INNER JOIN Student ON City.`city_code` = Student.`city_code` GROUP BY City.`city_code` HAVING COUNT(*) >= 3
SELECT City.`city_name` FROM City JOIN Student ON City.`city_code` = Student.`city_code` GROUP BY City.`city_name` HAVING COUNT(*) >= 3
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
SELECT AVG(Direct_distance.distance) as average_distance, MIN(Direct_distance.distance) as minimum_distance, MAX(Direct_distance.distance) as maximum_distance FROM Student JOIN City ON Student.city_code = City.city_code JOIN Direct_distance ON City.city_code = Direct_distance.city1_code WHERE Student.Age is NOT NULL AND City.city_name is NOT NULL AND Direct_distance.distance is NOT NULL
SELECT AVG(distance) as Average_distance, MIN(distance) as Minimum_distance, MAX(distance) as Maximum_distance FROM Direct_distance
error: No SQL found in the input string
error: No SQL found in the input string
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = 'BOS' AND city2_code IN (SELECT city_code FROM City WHERE country = 'USA')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`city_code`, SUM(T2.`distance`) as Total_Distance FROM City AS T1 LEFT JOIN Direct_distance AS T2 ON T1.`city_code` = T2.`city1_code` GROUP BY T1.`city_code`
error: No SQL found in the input string
SELECT City.`city_name`, AVG(Direct_distance.`distance`) as 'Average_distance' FROM City JOIN Direct_distance ON City.`city_code` = Direct_distance.`city1_code` OR City.`city_code` = Direct_distance.`city2_code` GROUP BY City.`city_code`
SELECT City.`city_name`, AVG(Direct_distance.`distance`) as 'Average Distance' FROM City JOIN Student ON City.`city_code` = Student.`city_code` JOIN Direct_distance ON City.`city_code` = Direct_distance.`city1_code` OR City.`city_code` = Direct_distance.`city2_code` GROUP BY City.`city_code`
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
SELECT DISTINCT `bid` FROM Reserves
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT sid FROM Sailors WHERE age < (SELECT MIN(age) FROM Sailors)
error: No SQL found in the input string
SELECT DISTINCT T1.`name` FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.`sid` = T2.`sid` WHERE T1.`rating` > 7
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid GROUP BY T1.name HAVING COUNT(T2.bid) > 1
SELECT Reserves.`sid` FROM Reserves JOIN Boats ON Reserves.`bid` = Boats.`bid` WHERE Boats.`color` IN ('red', 'blue')
-- What are the sids for sailors who reserved red or blue boats? SELECT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' OR Boats.color = 'blue'
error: No SQL found in the input string
SELECT `name`, `sid` FROM `Sailors` WHERE `rating` IN (SELECT MIN(`rating`) FROM `Sailors`)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Sailors.sid FROM Sailors WHERE sid NOT IN (SELECT Reserves.sid FROM Reserves)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Sailors.name, Sailors.sid FROM Sailors WHERE rating >= 3 JOIN Reserves ON Sailors.sid = Reserves.sid
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(age) FROM Sailors WHERE rating = 7
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(rating) as Average_Rating, MAX(age) as Max_Age FROM Sailors
SELECT AVG(rating) as Average_Rating, MAX(age) as Largest_Age FROM Sailors
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`name`, COUNT(*) FROM Boats AS T1 JOIN Reserves AS T2 ON T1.`bid` = T2.`bid` GROUP BY T1.`bid`
error: No SQL found in the input string
SELECT Boats.name, COUNT(*) FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.sid > 1 GROUP BY Boats.name
error: No SQL found in the input string
SELECT T1.`rating`, AVG(T1.`age`) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.`sid` = T2.`sid` JOIN Boats AS T3 ON T2.`bid` = T3.`bid` WHERE T3.`color` = 'red' GROUP BY T1.`rating`
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
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY rating DESC
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
SELECT T1.`Construction`, AVG(T1.`Price`) FROM headphone AS T1 JOIN stock AS T2 ON T1.`Headphone_ID` = T2.`Headphone_ID` GROUP BY T1.`Construction`
error: No SQL found in the input string
error: No SQL found in the input string
error
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Model` FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
error: No SQL found in the input string
SELECT T1.`Name`, COUNT(*) FROM store AS T1 JOIN stock AS T2 ON T1.`Store_ID` = T2.`Store_ID` JOIN headphone AS T3 ON T2.`Headphone_ID` = T3.`Headphone_ID` GROUP BY T1.`Store_ID`
SELECT Name FROM store ORDER BY Date_Opened
SELECT `Name`, `Parking` FROM store WHERE `Neighborhood` = 'Tarzana'
error: No SQL found in the input string
SELECT COUNT(DISTINCT `Neighborhood`) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT T1.`Neighborhood`, COUNT(*) FROM store AS T1 JOIN stock AS T2 ON T1.`Store_ID` = T2.`Store_ID` GROUP BY T1.`Store_ID`
error: No SQL found in the input string
SELECT T1.`Name`, COUNT(*) FROM store AS T1 JOIN stock AS T2 ON T1.`Store_ID` = T2.`Store_ID` JOIN headphone AS T3 ON T2.`Headphone_ID` = T3.`Headphone_ID` GROUP BY T1.`Store_ID` ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT `Name` FROM `store` WHERE `Store_ID` NOT IN (SELECT `Store_ID` FROM `stock`)
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
SELECT COUNT(*) FROM Affiliation
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
SELECT A.name, COUNT(P.paper_id) as Number_of_Papers FROM Affiliation AS A JOIN Author_list AS A1 ON A.affiliation_id = A1.affiliation_id JOIN Paper AS P ON A1.paper_id = P.paper_id GROUP BY A.name ORDER BY Number_of_Papers ASC
error: No SQL found in the input string
SELECT DISTINCT Author.name FROM Author_list INNER JOIN Author ON Author_list.author_id = Author.author_id INNER JOIN Paper ON Author_list.paper_id = Paper.paper_id INNER JOIN Citation ON Paper.paper_id = Citation.paper_id WHERE COUNT(DISTINCT Author_list.author_id) > 50 AND Author.name IS NOT NULL AND Author.name != 'None' AND Author.name != 'none' AND Author.name != 'None'
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
SELECT COUNT(*) FROM Citation JOIN Paper ON Citation.paper_id = Paper.paper_id JOIN Author_list ON Author_list.author_id = Author.author_id WHERE Author.name ILIKE 'Mckeown, Kathleen'
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
SELECT COUNT(DISTINCT Author_list.author_id) FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Author.name = 'Mckeown, Kathleen'
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
SELECT `title` FROM Paper WHERE `paper_id` IN (SELECT `cited_paper_id` FROM Citation GROUP BY `cited_paper_id` HAVING COUNT(*) > 50)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM Author AS T1 JOIN Author_list AS T2 ON T1.`author_id` = T2.`author_id` JOIN Paper AS T3 ON T2.`paper_id` = T3.`paper_id` WHERE T3.`venue` IN ('ACL', 'NAACL') AND T3.`year` = '2009'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Conference_Name, Year FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation)
error: No SQL found in the input string
SELECT DISTINCT `Conference_Name` FROM conference
error: No SQL found in the input string
error
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT conference.Location FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID JOIN staff ON conference_participation.staff_ID = staff.staff_ID WHERE staff.Nationality = 'United States' GROUP BY conference.Location HAVING COUNT(DISTINCT staff.Institution_ID) >= 2
SELECT `Institution_Name`, `Location`, `Founded` FROM institution
SELECT institution.Institution_Name, institution.Location, institution.Founded FROM institution JOIN staff ON institution.Institution_ID = staff.Institution_ID JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE staff.name IS NOT NULL ORDER BY institution.Institution_Name ASC;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT institution.Institution_Name, COUNT(*) FROM institution JOIN staff ON institution.Institution_ID = staff.Institution_ID JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year > 1800 AND staff.Age > 18 AND staff.Nationality = 'United States' GROUP BY institution.Institution_ID
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Age) as Max_Age, MIN(Age) as Min_Age FROM staff JOIN institution ON staff.Institution_ID = institution.Institution_ID JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE Age is NOT NULL;
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Conference_Name`, `Year`, COUNT(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.`Conference_ID` = T2.`Conference_ID` GROUP BY T1.`Conference_ID`
SELECT T1.`Conference_ID`, T1.`Conference_Name`, T1.`Year`, COUNT(T2.`staff_ID`) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.`Conference_ID` = T2.`Conference_ID` GROUP BY T1.`Conference_ID`
SELECT T1.`Conference_Name`, COUNT(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.`Conference_ID` = T2.`Conference_ID` GROUP BY T1.`Conference_ID` ORDER BY COUNT(*) DESC LIMIT 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
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
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
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
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT P.pilot_name, P.age FROM PilotSkills AS P JOIN Hangar AS H ON P.plane_name = H.plane_name WHERE (P.plane_name = 'Piper Cub' AND P.age > 35) OR (P.plane_name = 'F-14 Fighter' AND P.age < 30)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(age) as average_age, MIN(age) as minimum_age FROM PilotSkills
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
SELECT Hangar.`location`, COUNT(*), AVG(PilotSkills.`age`) FROM Hangar JOIN PilotSkills ON Hangar.`plane_name` = PilotSkills.`plane_name` GROUP BY Hangar.`location`
SELECT T1.`location`, COUNT(*), AVG(T2.`age`) FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.`plane_name` = T2.`plane_name` GROUP BY T1.`plane_name`
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
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT district.District_ID, district.Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT `Name`, `Speach_title` FROM `spokesman` JOIN `spokesman_district` ON `spokesman`.`Spokesman_ID` = `spokesman_district`.`Spokesman_ID`
SELECT AVG(points) as Average_Points, AVG(Age) as Average_Ages FROM spokesman WHERE Rank_position = 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`Name`, COUNT(*) FROM district AS T1 JOIN spokesman_district AS T2 ON T1.`District_ID` = T2.`District_ID` GROUP BY T1.`District_ID`
SELECT DISTINCT T1.Name FROM district AS T1 JOIN spokesman AS T2 ON T1.District_ID = T2.District_ID WHERE T2.Rank_position IN (1, 2) AND T2.Rank_position = (SELECT MIN(T3.Rank_position) FROM spokesman AS T3 WHERE T3.District_ID = T1.District_ID)
SELECT DISTINCT T1.Name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID JOIN spokesman AS T3 ON T2.Spokesman_ID = T3.Spokesman_ID WHERE T3.Name IS NOT NULL GROUP BY T1.District_ID HAVING COUNT(DISTINCT T3.Name) > 1
error: No SQL found in the input string
SELECT `Name` FROM spokesman WHERE `Spokesman_ID` NOT IN (SELECT `Spokesman_ID` FROM spokesman_district)
SELECT SUM(population) AS Total_Population, AVG(population) AS Average_Population FROM district WHERE District_ID IN (SELECT DISTINCT District_ID FROM spokesman)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT title, location FROM Paintings
SELECT `title`, `location` FROM Paintings
SELECT title, location FROM Sculptures
SELECT `title`, `location` FROM `Sculptures`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Artists.fname, Artists.lname, Sculptures.year FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.location != 'Gallery 226'
error: No SQL found in the input string
SELECT fname, lname FROM Artists WHERE birthYear < 1900
SELECT fname, lname FROM Artists WHERE birthYear < 1900
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
SELECT P.`location`, P.`medium` FROM Paintings AS P JOIN Artists AS A ON P.`painterID` = A.`artistID` WHERE A.`fname` = 'Pablo'
SELECT P.`location`, P.`medium` FROM Paintings AS P JOIN Artists AS A ON P.`painterID` = A.`artistID` WHERE A.`fname` = 'Pablo'
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
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT P.title AS Painting_Name, P.year AS Painting_Year, S.title AS Sculpture_Name, S.year AS Sculpture_Year FROM Paintings AS P JOIN Artists AS A ON P.painterID = A.artistID JOIN Sculptures AS S ON A.artistID = S.sculptorID WHERE P.year BETWEEN 1900 AND 1950 OR S.year BETWEEN 1900 AND 1950
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
SELECT PaintingID FROM Paintings WHERE height_mm BETWEEN 500 AND 2000
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
SELECT P.`painterID`, A.`fname`, A.`lname`, AVG(P.`height_mm`) AS `Average_Height`, AVG(P.`width_mm`) AS `Average_Width` FROM Artists AS A JOIN Paintings AS P ON A.`artistID` = P.`painterID` GROUP BY P.`painterID` ORDER BY A.`fname`, A.`lname`
SELECT P.`painterID`, A.`fname`, A.`lname`, AVG(P.`height_mm`) AS `Average_height`, AVG(P.`width_mm`) AS `Average_width` FROM Artists AS A JOIN Paintings AS P ON A.`artistID` = P.`painterID` GROUP BY P.`painterID` ORDER BY A.`fname`, A.`lname`
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
SELECT P.paintingID, P.location, P.title FROM Paintings AS P JOIN Artists AS A ON P.painterID = A.artistID WHERE P.medium = 'oil' ORDER BY P.year;
SELECT P.paintingID, P.title, P.year, P.location FROM Paintings AS P JOIN Artists AS A ON P.painterID = A.artistID WHERE P.medium = 'oil' ORDER BY P.year
SELECT P.year, P.location, P.title FROM Paintings AS P WHERE height_mm > 1000 ORDER BY P.title
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Winning_driver`, `Winning_team` FROM race WHERE `Winning_driver` IS NOT NULL ORDER BY `Winning_team` ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Entrant, COUNT(*) FROM driver WHERE Age >= 20 GROUP BY Entrant
error: No SQL found in the input string
SELECT MIN(Age) as Min_Age, MAX(Age) as Max_Age FROM driver
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
SELECT Driver_Name, Age FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) >= 2)
error: No SQL found in the input string
SELECT Race_Name FROM race JOIN driver ON race.Driver_ID = driver.Driver_ID WHERE driver.Age >= 26
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Engine, COUNT(*) FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY Engine HAVING COUNT(*) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT T1.`Constructor` FROM driver AS T1 JOIN race AS T2 ON T1.`Driver_ID` = T2.`Driver_ID` WHERE T1.`Age` < 20 AND T1.`Age` > 30
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Driver_Name` FROM driver WHERE `Driver_ID` NOT IN (SELECT `Driver_ID` FROM race WHERE `Pole_Position` = 'James Hinchcliffe')
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM countries
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries
SELECT AVG(justice_score) FROM countries
error: No SQL found in the input string
SELECT MAX(health_score) as Maximum_Health_Score, MIN(health_score) as Minimum_Health_Score FROM countries WHERE id != 3
error: No SQL found in the input string
SELECT COUNT(DISTINCT `name`) FROM languages
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT c.name, l.name FROM countries c JOIN official_languages o ON c.id = o.country_id JOIN languages l ON o.language_id = l.id
SELECT countries.name, languages.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id
SELECT `name`, COUNT(*) FROM official_languages JOIN languages ON official_languages.`language_id` = languages.`id` GROUP BY official_languages.`language_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM languages WHERE `id` IN (SELECT `language_id` FROM official_languages GROUP BY `language_id` HAVING COUNT(*) >= 2)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T2.`name`, COUNT(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.`language_id` = T2.`id` WHERE T2.`name` IS NOT NULL GROUP BY T2.`name` ORDER BY COUNT(*) DESC LIMIT 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name`, COUNT(*) FROM countries JOIN official_languages ON id = country_id GROUP BY id ORDER BY COUNT(*) DESC LIMIT 1
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name` FROM `languages` WHERE `id` NOT IN (SELECT `language_id` FROM `official_languages`)
SELECT `name` FROM `countries` WHERE `id` NOT IN (SELECT `country_id` FROM `official_languages`)
error: No SQL found in the input string
SELECT `name` FROM `languages` WHERE `id` IN (SELECT `language_id` FROM `official_languages` WHERE `country_id` IN (SELECT `id` FROM `countries` WHERE `overall_score` > 95 AND `id` IN (SELECT `country_id` FROM `official_languages` WHERE `language_id` = `languages`.`id`))) AND `id` IN (SELECT `language_id` FROM `official_languages` WHERE `country_id` IN (SELECT `id` FROM `countries` WHERE `overall_score` < 90))
SELECT `name` FROM `languages` WHERE `id` IN (SELECT `language_id` FROM `official_languages` WHERE `country_id` IN (SELECT `id` FROM `countries` WHERE `overall_score` < 90))
error: No SQL found in the input string
SELECT `town_city`, `county_state_province`, `country` FROM Addresses
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(`room_count`) FROM Properties
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
SELECT AVG(room_count) FROM Properties
SELECT AVG(room_count) FROM Properties
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(datestamp) FROM User_Property_History
SELECT MAX(datestamp) FROM User_Property_History
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `user_category_code`, `user_id` FROM Users WHERE `user_id` IN (SELECT `user_id` FROM User_Searches GROUP BY `user_id` HAVING COUNT(`user_id`) = 1)
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
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Addresses AS A JOIN Users AS U ON A.user_address_id = U.user_address_id JOIN User_Property_History AS UP ON U.user_id = UP.user_id JOIN Ref_User_Categories AS RC ON U.age_category_code = RC.age_category_code WHERE RC.user_category_description = 'Senior Citizen'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `datestamp`, `property_name` FROM `User_Property_History` JOIN `Properties` ON `User_Property_History`.`property_id` = `Properties`.`property_id` ORDER BY `datestamp`
SELECT `datestamp`, `property_name` FROM `User_Property_History` AS T1 JOIN `Properties` AS T2 ON T1.`property_id` = T2.`property_id` ORDER BY `datestamp`
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
SELECT User_Searches.search_string FROM Users INNER JOIN User_Property_History ON Users.user_id = User_Property_History.user_id INNER JOIN Properties ON User_Property_History.property_id = Properties.property_id INNER JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code WHERE Users.user_id NOT IN (SELECT owner_user_id FROM Properties)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT cyclist.heat, cyclist.name, cyclist.nation FROM cyclist JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `name`, `result` FROM cyclist WHERE nation != 'Russia'
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT cyclist.name, cyclist.nation, cyclist.result FROM cyclist WHERE id NOT IN (SELECT cyclists_own_bikes.cyclist_id FROM cyclists_own_bikes)
error: No SQL found in the input string
SELECT T2.`name`, COUNT(*) FROM cyclists_own_bikes AS T1 JOIN cyclist AS T2 ON T1.`cyclist_id` = T2.`id` WHERE T2.`name` IS NOT NULL GROUP BY T1.`cyclist_id` ORDER BY T2.`name`
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
SELECT DISTINCT `receipts`.`CustomerId` FROM (SELECT `CustomerId` FROM `items` JOIN `goods` ON `items`.`Item` = `goods`.`Id` GROUP BY `items`.`CustomerId`, `goods`.`Id`) AS `subquery` JOIN `receipts` ON `receipts`.`CustomerId` = `subquery`.`CustomerId` WHERE `receipts`.`ReceiptNumber` IS NOT NULL GROUP BY `receipts`.`CustomerId` HAVING COUNT(`receipts`.`ReceiptNumber`) >= 15
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
SELECT `ReceiptNumber` FROM `receipts` JOIN `items` ON `receipts`.`CustomerId` = `items`.`CustomerId` JOIN `goods` ON `items`.`Item` = `goods`.`Id` WHERE `goods`.`Flavor` = 'Cake' AND `goods`.`Flavor` = 'Cookie'
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
SELECT goods.Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT customers.Id, goods.Price FROM customers JOIN items ON customers.Id = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price < (SELECT AVG(Price) FROM goods)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `ReceiptNumber` FROM receipts JOIN customers ON receipts.`CustomerId` = customers.`Id` JOIN items ON receipts.`Receipt` = items.`Receipt` JOIN goods ON items.`Item` = goods.`Id` WHERE `Date` > '2007-10-09' AND `Date` < '2007-11-09' AND `CustomerId` IN (SELECT `Id` FROM customers WHERE `FirstName` = 'RUPERT' AND `LastName` = 'SLINGLAND') AND `Price` > 13 AND `Flavor` IS NOT NULL AND `Food` IS NOT NULL ORDER BY `ReceiptNumber` ASC
SELECT DISTINCT T1.`ReceiptNumber` FROM receipts AS T1 JOIN items AS T2 ON T1.`CustomerId` = T2.`Item` JOIN goods AS T3 ON T2.`Item` = T3.`Id` WHERE T3.`Price` > 13
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `Item` FROM items
SELECT `ReceiptNumber` FROM `receipts` JOIN `items` JOIN `goods` WHERE (`Flavor` = 'Apple' AND `Food` = 'Pie') OR `CustomerId` = '12'
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
SELECT T1.`Flavor`, MAX(T1.`Price`) AS `Highest`, MIN(T1.`Price`) AS `Lowest`, AVG(T1.`Price`) AS `Average` FROM goods AS T1 JOIN items AS T2 ON T1.`Id` = T2.`Item` GROUP BY T1.`Flavor` ORDER BY `Highest` DESC, `Lowest` ASC, `Average` ASC
SELECT Flavor, MAX(Price) as Maximum, MIN(Price) as Minimum, AVG(Price) as Average FROM goods JOIN items ON goods.Id = items.Item GROUP BY Flavor ORDER BY Flavor;
SELECT g.Flavor, g.Food, MIN(i.Price) AS Lowest_Price, MAX(i.Price) AS Highest_Price FROM goods AS g JOIN items AS i ON g.Id = i.Item JOIN receipts AS r ON r.CustomerId = customers.Id JOIN customers AS c ON c.Id = r.CustomerId WHERE c.FirstName IS NOT NULL AND c.LastName IS NOT NULL AND i.Price IS NOT NULL GROUP BY g.Flavor, g.Food ORDER BY g.Flavor, g.Food;
error: No SQL found in the input string
SELECT TOP 3 Date, COUNT(*) as NumberOfReceipts FROM (SELECT DISTINCT Date FROM receipts WHERE Date IS NOT NULL) AS SubQuery GROUP BY Date ORDER BY NumberOfReceipts DESC
SELECT DISTINCT `Date`, COUNT(`Date`) FROM receipts GROUP BY `Date` ORDER BY COUNT(`Date`) DESC
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DATE, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY DATE
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT items.`Item` FROM items JOIN goods ON items.`Item` = goods.`Id` WHERE goods.`Food` = 'Cake' AND goods.`Price` >= (SELECT AVG(Price) FROM goods WHERE goods.`Food` = 'Tart')
SELECT items.`Item` FROM items JOIN goods ON items.`Item` = goods.`Id` WHERE goods.`Food` = 'Cake' AND goods.`Price` >= (SELECT AVG(Price) FROM goods WHERE goods.`Food` = 'Tart')
SELECT goods.Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT goods.Id FROM goods WHERE Price > (SELECT AVG(Price) FROM goods) * 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT items.Item FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'Chocolate' GROUP BY items.Item HAVING COUNT(items.Item) <= 10
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT customers.Id FROM customers JOIN ( SELECT receipt, AVG(price) as avg_spending FROM items JOIN goods ON items.Item = goods.Id GROUP BY receipt HAVING avg_spending > 5 ) AS spending_info ON customers.Id = spending_info.receipt
error: No SQL found in the input string
SELECT DISTINCT `Date` FROM ( SELECT DISTINCT `Date` FROM receipts JOIN customers ON receipts.`CustomerId` = customers.`Id` WHERE customers.`FirstName` IS NOT NULL AND customers.`LastName` IS NOT NULL AND customers.`FirstName` <> 'None' ) AS subquery GROUP BY `Date` HAVING SUM(goods.`Price`) > 100
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM driver
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Make`, AVG(`Age`) FROM `driver` JOIN `team_driver` ON `driver`.`Driver_ID` = `team_driver`.`Driver_ID` GROUP BY `Team_ID`
SELECT `Make`, AVG(`Age`) FROM `driver`
SELECT AVG(Laps) FROM driver WHERE Age < 20
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Points) AS Max_Points, MIN(Points) AS Min_Points FROM driver
SELECT MIN(Points) as Lowest_Points, MAX(Points) as Highest_Points FROM driver
error: No SQL found in the input string
SELECT COUNT(*) FROM driver WHERE Points < 150
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Driver`, `Country` FROM driver JOIN team_driver ON driver.`Driver_ID` = team_driver.`Driver_ID`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `Country` FROM driver WHERE Points > 150
error: No SQL found in the input string
error: No SQL found in the input string
SELECT d.Country, d.Capital FROM driver AS d JOIN (SELECT Driver_ID FROM team_driver AS td JOIN team AS t ON t.Team_ID = td.Team_ID WHERE t.Sponsor = 'UNO / Bull Frog Knits' GROUP BY td.Driver_ID ORDER BY SUM(d.Points) DESC LIMIT 1) AS td ON d.Driver_ID = td.Driver_ID
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Make FROM driver WHERE Car_# IN (SELECT Car_# FROM driver GROUP BY Car_# HAVING COUNT(*) >= 3)
error: No SQL found in the input string
SELECT `Team` FROM `team` WHERE `Team_ID` NOT IN (SELECT `Team_ID` FROM `team_driver`)
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(Points) as Total_Points, AVG(Points) as Average_Points FROM driver
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Manager`, `Sponsor` FROM team WHERE `Team_ID` = (SELECT `Team_ID` FROM team_driver WHERE `Driver_ID` = (SELECT MIN(`Driver_ID`) FROM driver))
SELECT `Manager`, `Sponsor` FROM team WHERE `Team_ID` = (SELECT `Team_ID` FROM team_driver WHERE `Driver_ID` = (SELECT MIN(`Driver_ID`) FROM driver))
error: No SQL found in the input string
SELECT T1.`Manager`, T1.`Car_Owner` FROM team AS T1 JOIN team_driver AS T2 ON T1.`Team_ID` = T2.`Team_ID` GROUP BY T1.`Team_ID` HAVING COUNT(*) >= 2
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MIN(Enrollment) as Min_Enrollment, MAX(Enrollment) as Max_Enrollment FROM institution
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
SELECT Name FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID ORDER BY Number_of_Championships DESC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
-- Return the years in which more than 1 institution was founded, as well as the number of institutions founded in each of those. SELECT DISTINCT Founded AS Year, COUNT(*) FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID GROUP BY Year HAVING COUNT(*) > 1
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Enrollment FROM institution WHERE City IN ('Vancouver', 'Calgary')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT `Province`) FROM institution
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Value) as Average_Value, SUM(Value) as Total_Value FROM Boxes
SELECT AVG(Value) as Average_Value, SUM(Value) as Total_Value FROM Boxes
SELECT AVG(Capacity) as Average_Capacity, SUM(Capacity) as Total_Capacity FROM Warehouses;
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Contents`, AVG(`Value`) as `Average`, MAX(`Value`) as `Maximum` FROM Boxes JOIN Warehouses ON Warehouses.`Code` = Boxes.`Warehouse`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `Contents` FROM Boxes
SELECT DISTINCT `Contents` FROM Boxes
SELECT COUNT(DISTINCT `Contents`) FROM Boxes
SELECT COUNT(DISTINCT `Contents`) FROM Boxes
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
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
error: No SQL found in the input string
SELECT T1.`Major_Name`, T2.`Rank` FROM major AS T1 JOIN major_ranking AS T2 ON T1.`Major_ID` = T2.`Major_ID` WHERE T2.`University_ID` = (SELECT University_ID FROM university WHERE University_Name = 'Augustana College')
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
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID JOIN major_ranking ON university.University_ID = major_ranking.University_ID JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE Reputation_point IS NOT NULL ORDER BY Reputation_point ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT SUM(university.Enrollment) FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE overall_ranking.Rank <= 5
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
SELECT COUNT(DISTINCT `Code`) FROM MovieTheaters
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
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT `Title` FROM Movies
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
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
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
SELECT PackageNumber, Weight FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment ORDER BY Weight LIMIT 3)
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
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT P.Name, SUM(Pkg.Weight) as Total_Weight FROM Planet AS P JOIN Package AS Pkg ON P.PlanetID = Pkg.`Recipient` GROUP BY P.PlanetID
SELECT P.Name, SUM(P.Weight) as 'Total Package Weight' FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Employee E ON S.Manager = E.EmployeeID JOIN Has_Clearance H ON E.EmployeeID = H.Employee JOIN Planet P2 ON H.Planet = P2.PlanetID WHERE P.Recipient IS NOT NULL AND P.Sender IS NOT NULL AND P.Contents != 'Undeclared' GROUP BY P.Name
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `PackageNumber`, `Weight` FROM Package WHERE `Weight` BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT `Name` FROM `Employee` WHERE `EmployeeID` NOT IN (SELECT `Employee` FROM `Has_Clearance` WHERE `Planet` = 'Mars')
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Name` FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT `Name` FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
error: No SQL found in the input string
SELECT `Platform_name`, `Market_district` FROM platform
error: No SQL found in the input string
error: No SQL found in the input string
SELECT MAX(Download_rank) as Max_Download_rank, MIN(Download_rank) as Min_Download_rank FROM platform
SELECT MAX(player.Rank_of_the_year) AS Max_Rank, MIN(player.Rank_of_the_year) AS Min_Rank FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game_player.Game_ID = game.Game_ID JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Platform_name = 'Nintendo'
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(*) FROM player WHERE Rank_of_the_year <= 3
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT AVG(Units_sold_Millions) FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE Position = 'Guard' AND player.Units_sold_Millions is NOT NULL
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `Title` FROM game WHERE Platform_ID IN (SELECT Platform_ID FROM platform WHERE Market_district IN ('USA', 'Asia'))
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT `Franchise` FROM game
error: No SQL found in the input string
SELECT `Title` FROM game WHERE `Platform_ID` NOT IN (SELECT `Platform_ID` FROM game_player WHERE `If_active` = 'F')
error: No SQL found in the input string
SELECT p.Name FROM press p JOIN book b ON p.Press_ID = b.Press_ID JOIN author a ON b.Author_ID = a.Author_ID WHERE a.Name IS NOT NULL AND b.Sale_Amount IS NOT NULL GROUP BY p.Name ORDER BY MAX(b.Sale_Amount) DESC;
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
SELECT Title FROM book ORDER BY `Release_date` DESC
SELECT Title FROM book ORDER BY `Release_date` DESC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`Book_Series` FROM book AS T1 JOIN (SELECT `Book_ID` FROM book WHERE Sale_Amount > 1000) AS T2 ON T1.`Book_ID` = T2.`Book_ID` GROUP BY T1.`Book_Series` HAVING COUNT(*) = 2
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
SELECT `Name`, SUM(`Sale_Amount`) FROM press JOIN book ON press.`Press_ID` = book.`Press_ID` GROUP BY press.`Press_ID`
SELECT T1.`Name`, COUNT(*) FROM press AS T1 JOIN book AS T2 ON T1.`Press_ID` = T2.`Press_ID` WHERE T2.`Sale_Amount` > 1000 GROUP BY T1.`Press_ID`
SELECT T1.`Name`, COUNT(*) FROM press AS T1 JOIN book AS T2 ON T1.`Press_ID` = T2.`Press_ID` WHERE T2.`Sale_Amount` > 1000 GROUP BY T1.`Press_ID`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.Name, T1.Year_Profits_billion FROM press AS T1 JOIN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(*) > 2) AS T2 ON T1.Press_ID = T2.Press_ID
SELECT P.Name, P.Year_Profits_billion FROM press AS P JOIN book AS B ON P.Press_ID = B.Press_ID WHERE B.Book_ID IN (SELECT Book_ID FROM book WHERE Author_ID IN (SELECT Author_ID FROM author WHERE Gender = 'Male')) GROUP BY P.Press_ID HAVING COUNT(Book_ID) > 2
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `author_name`, `other_details` FROM Authors
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT D.`document_name`, D.`document_description` FROM Documents AS D
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `process_outcome_code`, `process_outcome_description` FROM Process_Outcomes
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `process_status_code`, `process_status_description` FROM Process_Status
SELECT Process_Status.`process_status_description` FROM Process_Status WHERE Process_Status.`process_status_code` = 'ct'
SELECT COUNT(*) FROM Staff
SELECT T1.`staff_id`, T1.`staff_details` FROM Staff AS T1
error: No SQL found in the input string
SELECT COUNT(*) FROM Ref_Staff_Roles
SELECT `staff_role_code`, `staff_role_description` FROM Ref_Staff_Roles
error: No SQL found in the input string
SELECT COUNT(*) FROM Business_Processes
SELECT DISTINCT `process_id` FROM Documents_Processes
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT DISTINCT B.process_id, COUNT(D.document_id) FROM Business_Processes AS B JOIN Documents_Processes AS DP ON B.process_id = DP.process_id JOIN Documents AS D ON DP.document_id = D.document_id JOIN Staff_in_Processes AS SP ON D.document_id = SP.document_id JOIN Staff AS S ON SP.staff_id = S.staff_id JOIN Ref_Staff_Roles AS RSR ON S.staff_id = RSR.staff_id WHERE D.author_name IS NOT NULL AND RSR.staff_role_code IN ('Proof Reader', 'Manager') GROUP BY B.process_id ORDER BY B.process_id ASC
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Agencies
SELECT T1.`agency_id`, T1.`agency_details` FROM Agencies AS T1
SELECT `agency_id`, `agency_details` FROM Agencies
SELECT COUNT(*) FROM Clients
SELECT COUNT(*) FROM Clients
SELECT Clients.`client_id`, Clients.`client_details` FROM Clients
SELECT Clients.`client_id`, Clients.`client_details` FROM Clients
SELECT `agency_details`, COUNT(*) FROM Agencies AS T1 JOIN Clients AS T2 ON T1.`agency_id` = T2.`agency_id` GROUP BY `agency_details`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.sic_code, COUNT(*) FROM Clients AS T1 JOIN Staff_in_Meetings AS T2 ON T1.client_id = T2.client_id GROUP BY T1.sic_code
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Invoices.invoice_id, Invoices.invoice_status, Invoices.invoice_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id
error: No SQL found in the input string
SELECT `client_id`, COUNT(*) FROM Clients GROUP BY `client_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Invoices.invoice_status, Invoices.invoice_details, Clients.client_id, Clients.client_details, Clients.agency_id, Clients.agency_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id
SELECT Invoices.`invoice_status`, Invoices.`invoice_details`, Clients.`client_id`, Clients.`client_details`, Clients.`agency_id`, Agencies.`agency_details` FROM Invoices JOIN Clients ON Invoices.`client_id` = Clients.`client_id` JOIN Agencies ON Clients.`agency_id` = Agencies.`agency_id`
error: No SQL found in the input string
error
SELECT DISTINCT meeting_outcome, purpose_of_meeting FROM Meetings
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Payments
SELECT P.payment_id, I.invoice_id, P.payment_details, I.invoice_details FROM Payments P INNER JOIN Invoices I ON P.invoice_id = I.invoice_id;
error
SELECT Invoices.invoice_id, Invoices.invoice_status FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id
SELECT DISTINCT Invoices.invoice_id, Invoices.invoice_status FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) FROM Invoices JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(*) FROM Staff
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.`meeting_outcome`, COUNT(*) FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.`meeting_id` = T2.`meeting_id` GROUP BY T1.`meeting_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT `meeting_type`, COUNT(*) FROM Meetings GROUP BY `meeting_type`
error: No SQL found in the input string
SELECT T1.meeting_id, T1.meeting_outcome, T1.meeting_type, T2.client_details, T4.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Staff_in_Meetings AS T3 ON T1.meeting_id = T3.meeting_id JOIN Staff AS T4 ON T3.staff_id = T4.staff_id
error
SELECT T1.`meeting_id`, COUNT(*) FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.`meeting_id` = T2.`meeting_id` GROUP BY T1.`meeting_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT COUNT(DISTINCT Staff.`staff_id`) FROM Staff_in_Meetings JOIN Staff ON Staff_in_Meetings.`staff_id` = Staff.`staff_id`
error: No SQL found in the input string
error: No SQL found in the input string
error: No SQL found in the input string
SELECT Clients.client_id, Clients.client_details FROM Clients JOIN (Staff_in_Meetings INNER JOIN Meetings ON Staff_in_Meetings.meeting_id = Meetings.meeting_id) ON Clients.client_id = Meetings.client_id OR Clients.client_id = Invoices.client_id JOIN Invoices ON Clients.client_id = Invoices.client_id
error: No SQL found in the input string
SELECT Staff.`staff_id`, Staff.`staff_details` FROM Staff JOIN Staff_in_Meetings ON Staff.`staff_id` = Staff_in_Meetings.`staff_id` JOIN Meetings ON Staff_in_Meetings.`meeting_id` = Meetings.`meeting_id` WHERE Staff.`staff_details` LIKE '%s%' AND Meetings.`billable_yn` = '1'
error: No SQL found in the input string
error: No SQL found in the input string
SELECT T1.start_date_time, T1.end_date_time, T2.client_details, T4.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Staff_in_Meetings AS T3 ON T1.meeting_id = T3.meeting_id JOIN Staff AS T4 ON T3.staff_id = T4.staff_id
error: No SQL found in the input string
