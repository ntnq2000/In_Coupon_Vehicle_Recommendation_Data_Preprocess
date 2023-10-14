--create a table function that count how many user spent $20 or less at restaurant per month
CREATE FUNCTION dbo.AcceptedCouponCountsByRestaurantLessThan20()
RETURNS TABLE
AS
RETURN (
    SELECT RestaurantLessThan20, COUNT(*) AS 'Accepted Count'
    FROM Group12.dbo.in_coupon_vehicle_recommendation
    WHERE Y = 1
    GROUP BY RestaurantLessThan20
);