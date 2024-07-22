select * from sales

SELECT 
    SUM(profit) AS total_profit,
    IF(SUM(profit) > 1000, SUM(profit) * 0.10, SUM(profit) * 0.05) AS discount
FROM 
    sales;

CREATE OR REPLACE FUNCTION get_profit(productID varchar)
RETURNS varchar AS $$
DECLARE
    sum_sales double precision;
    sum_profit double precision;
    profit_percentage double precision;
BEGIN
   select sum(sales) as "sum of sales", sum(profit) as "sum of profit" into sum_sales,sum_profit
   from sales where product_id=productID; 
    profit_percentage= (sum_profit/sum_sales) *100;
    RETURN profit_percentage;
END;
$$ LANGUAGE plpgsql;

select product_id,sales,discount,profit,get_profit() as "total profit" from sales where product_id= 'OFF-EN-10001509'

select get_profit('FUR-TA-10000617')

select distinct product_id from sales
