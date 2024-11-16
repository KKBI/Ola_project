create database OLA;
use OLA;
#1.Retrieve all successfull bookings.
create view successfull_bookings as 
select * from bookings
where Booking_Status = 'Success';
select * from successfull_bookings;


#2.find the average ride distance for each vehicle type
create view ride_distance_for_each_vehicle as
select Vehicle_Type,AVG(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;
select * from ride_distance_for_each_vehicle;

#3.Get the total number of canceled rides by customers.
create view canceled_rides_by_customers as
select count(*) from bookings where Booking_Status = 'Canceled by Customer';
select * from canceled_rides_by_customers;

#4.List the top 5 customers who booked the highest number of rides.
create view booked_the_highest_number_of_rides as
 select Customer_ID,count(Booking_ID) as total_rides
 from bookings
 group by Customer_ID
 order by total_rides desc limit 5;
 select	* from booked_the_highest_number_of_rides;
 
 #5.get the number of rides cancelled by drivers due to personal and car-related issues.
 create view cancelled_by_drivers_due_to_p_c_issues as
 select count(*)from bookings
 where Canceled_Rides_by_Driver='Personal & Car related issue';
 select * from cancelled_by_drivers_due_to_p_c_issues ;
 
 #6.Find the maximum and minimum driver ratings for Prime Sedan bookings.
 create view Max_Min_Driver_Rating as
 SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
 bookings WHERE Vehicle_Type = 'Prime Sedan';
 Select * from Max_Min_Driver_Rating;
 
 #7.Retrieve all rides where payment was made using UPI.
 Create View UPI_Payment As
 SELECT * FROM bookings
 WHERE Payment_Method = 'UPI';
 Select * from UPI_Payment;
 
 #8.Find the average customer rating per vehicle type.
 Create View AVG_Cust_Rating As
 SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
 FROM bookings
 GROUP BY Vehicle_Type;
 Select * from AVG_Cust_Rating;

#9.Calculate the total booking value of rides completed successfully.
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
Select * from total_successful_ride_value;

#10.List all incomplete rides along with the reason.
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
Select * from Incomplete_Rides_Reason;