--create a table function that count how many user accepted coupon according to the temperature as the user was driving
CREATE FUNCTION dbo.AcceptedCouponCountsByTemperature()
RETURNS TABLE
AS
RETURN (
    SELECT temperature, COUNT(*) AS 'Accepted Count'
    FROM Group12.dbo.in_coupon_vehicle_recommendation
    WHERE Y = 1
    GROUP BY temperature
);