-- Create a view that combines temperature and RestaurantLessThan20 with counts
CREATE VIEW Contextual_Attribute AS
SELECT
    destination AS 'Destination',
    passanger AS 'Onboard Passenger',
    weather AS 'Weather',
    temperature AS 'Temperature (F)',
    time AS 'Time when user is driving',
    toCoupon_GEQ15min AS 'Driving distance greater than 15 minutes (0 as No, 1 as Yes)',
    toCoupon_GEQ25min AS 'Driving distance greater than 25 minutes (0 as No, 1 as Yes)',
	Y AS 'Coupon Accept? (0 as No, 1 as Yes)'
FROM
    Group12.dbo.in_coupon_vehicle_recommendation;
