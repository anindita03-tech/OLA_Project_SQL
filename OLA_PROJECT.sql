-- 1. Retrieve all successful bookings:
create view successful_bookings as
select * from bookings.bookings
where Booking_Status = 'success';

select * from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
create view   ride_distance_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance) as avg_distance  
from bookings.bookings
group by Vehicle_Type ;

select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view   cancelled_rides_by_customers as
select count(Booking_Status) from bookings.bookings
where Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers ;

-- 4. List the top 5 customers who booked the highest number of rides:

create view 5_highest_booking_customers as
select Customer_ID,COUNT(Booking_ID) as NUMBER_OF_BOOKING FROM bookings.bookings
group by Customer_ID 
order by NUMBER_OF_BOOKING desc limit 5;

select * from 5_highest_booking_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view number_of_rides_cancelled_by_drivers_P_C_issues as
select COUNT(Canceled_Rides_by_Driver)from bookings.bookings
where Canceled_Rides_by_Driver ='Personal & Car related issue';

select * from number_of_rides_cancelled_by_drivers_P_C_issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_nd_min_driver_ratings as
select max(driver_ratings) as maximum_ratings,min(driver_ratings)as minimum_ratings
from bookings.bookings where Vehicle_Type ='Prime Sedan';

select * from max_nd_min_driver_ratings;

-- 7. Retrieve all rides where payment was made using UPI:

create view UPI_Payment as
select * from bookings.bookings
 where Payment_Method ='UPI';

select * from  UPI_Payment;

-- 8. Find the average customer rating per vehicle type:

create view AVG_VEHICLE_RATING_BY_CUS AS
select vehicle_type,avg(Customer_Rating)
from  bookings.bookings
group by vehicle_type;

select * from AVG_VEHICLE_RATING_BY_CUS;

-- 9. Calculate the total booking value of rides completed successfully:

create view total_success_booking as
select SUM(booking_value )as total_success_booking
from bookings.bookings
where booking_status = 'success';

select * from total_success_booking;

-- 10. List all incomplete rides along with the reason:

create view incomplete_rides_reason as 
select incomplete_rides ,incomplete_rides_reason from bookings.bookings 
where incomplete_rides ='yes';

select * from incomplete_rides_reason;