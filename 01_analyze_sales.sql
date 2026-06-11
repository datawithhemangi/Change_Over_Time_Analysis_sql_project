/*Sales performance Over time*/

/*sales over the year or year-wise*/

SELECT
YEAR(order_date) as order_year,
SUM(sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)


/*sales over the month or month-wise*/

SELECT
MONTH(order_date) as order_month,
SUM(sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)


/*sales month-wise and year-wise*/

SELECT
MONTH(order_date) as order_month,
YEAR(order_date) as order_year,
SUM(sales_amount) as total_sales,
SUM(quantity) as total_quantity,
COUNT(DISTINCT customer_key) as total_customers
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date) , MONTH(order_date) 
ORDER BY YEAR(order_date) , MONTH(order_date)

/*sales year-wise(whole year)*/
SELECT
DATETRUNC(year, order_date) as order_date,
SUM(sales_amount) as total_Sales,
COUNT(DISTINCT customer_key) as total_customer,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
ORDER BY DATETRUNC(year, order_date)
