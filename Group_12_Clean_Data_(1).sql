--return a list of users who accepted the coupon
select * from Group12.dbo.in_coupon_vehicle_recommendation where Y = 1
--return a list of users who denied the coupon
select * from Group12.dbo.in_coupon_vehicle_recommendation where Y <> 1

--check for null in data set, uncomment to run the statement
--select count(car) from Group12.dbo.in_coupon_vehicle_recommendation where car is null;
--select count(Bar) from Group12.dbo.in_coupon_vehicle_recommendation where Bar is null;
--select count(CoffeeHouse) FROM Group12.dbo.in_coupon_vehicle_recommendation WHERE CoffeeHouse is null;
--select count(CarryAway) from Group12.dbo.in_coupon_vehicle_recommendation where CarryAway is null;
--select count(RestaurantLessThan20) from Group12.dbo.in_coupon_vehicle_recommendation where RestaurantLessThan20 is null;
--select count(Restaurant20To50) from Group12.dbo.in_coupon_vehicle_recommendation where Restaurant20To50 is null;

--we are going to analyze one user attribute (RestaurantLessThan20) and one contextual attribute (temperature)

--find all distinct values in RestaurantLessThan20 (how often does the user go to a restaurant with an average less than $20 per person very month), you can uncomment the query to see output
select distinct RestaurantLessThan20 from Group12.dbo.in_coupon_vehicle_recommendation
--we get values such as: "less1", "1~3", "gt8", "never", "4~8"
--which means "less than 1", "1 to 3 times", "greater than 8", "never", "4 to 8 times"

--find all distinct values in temperature (what was the temperature in Fahrenheit when user is driving), you can uncomment the query to see output
select distinct temperature from Group12.dbo.in_coupon_vehicle_recommendation
--we get values such as: "55", "30", "80"

--call the created table function that count how many user accepted coupon according to the temperature as the user was driving
SELECT * FROM dbo.AcceptedCouponCountsByTemperature();

--call the created table function that count how many user spent $20 or less at restaurant per montn
SELECT * FROM dbo.AcceptedCouponCountsByRestaurantLessThan20();

--call the created view of contextual attributes that affect user coupon acceptance (such as destination, passenger, weather, time, toCoupon_GEQ15min, toCoupon_GEQ25min)
select * from Contextual_Attribute order by 'Coupon Accept? (0 as No, 1 as Yes)'