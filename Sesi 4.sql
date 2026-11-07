--Sesi 4
--Mengitung Jumlah Order Tercatat
SELECT COUNT (*) Total_Orders
FROM bigquery-public-data.thelook_ecommerce.orders;

--Menghitung Jumlah Order Untuk Setiap Status
SELECT status, COUNT(*) Total_Orders
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY 1
ORDER BY 2 DESC;

--Menghitung Produk Yang Sering Muncul
SELECT product_id,COUNT (*) Jumlah_Produk
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--Menghitung Jumlah Customer By Country
SELECT country, COUNT(*) Jumlah_Customer
FROM bigquery-public-data.thelook_ecommerce.users
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--Menghitung Performa Penjualan
SELECT status, COUNT(*) Total_Items,
COUNT(DISTINCT order_id) Total_Orders,
ROUND(SUM(sale_price),2) Total_Sales,
ROUND(AVG(sale_price),2) Avg_Sale_Price
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY 1
HAVING COUNT (*) >=100
ORDER BY 4 DESC;
