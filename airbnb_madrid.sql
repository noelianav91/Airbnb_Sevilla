# Comenzamos creando la base de datos donde alojaremos la tabla importada a MySQL
create database Airbnb_Madrid;
use Airbnb_Madrid;
select * from listings;

# Eliminamos las columnas que no vamos a necesitar
ALTER TABLE listings DROP column name;
ALTER TABLE listings DROP column last_review; 
ALTER TABLE listings DROP column reviews_per_month;
ALTER TABLE listings DROP column license;
ALTER TABLE listings DROP column host_name;

#Realizamos una agrupación por precio medio y neighbourhood_group de forma descendente 
SELECT DISTINCT neighbourhood_group, AVG (price) AS avg_precio FROM listings  GROUP BY neighbourhood_group ORDER BY avg_precio DESC;

#Realizamos una agrupación por neighbourhood y precio
SELECT DISTINCT neighbourhood, neighbourhood_group, AVG (price) OVER (PARTITION BY neighbourhood) AS avg_precio FROM listings ORDER BY avg_precio DESC;

# Top 10 por número de reviews
SELECT *FROM listings ORDER BY number_of_reviews DESC LIMIT 10;

# Número de airbnb por neighbourhood
SELECT DISTINCT neighbourhood, neighbourhood_group, COUNT(id) AS numero_Airbnb  FROM listings GROUP BY neighbourhood, neighbourhood_group ORDER BY numero_Airbnb DESC;

# Top 10 por número de airbnb por neighbourhood 
SELECT DISTINCT neighbourhood, neighbourhood_group, COUNT(id) AS numero_Airbnb  FROM listings GROUP BY neighbourhood, neighbourhood_group ORDER BY numero_Airbnb DESC LIMIT 10;

#Top 10 por número de room_type
SELECT room_type, COUNT(room_type) AS numero_Airbnb FROM listings GROUP BY room_type ORDER BY room_type DESC;

# Precio promedio por tipo de room type por neighbourhood
SELECT DISTINCT neighbourhood, room_type, AVG (price) AS Avg_precio FROM listings GROUP BY neighbourhood, room_type ORDER BY Avg_precio DESC;

# Promedio disponibilidad durante el año
SELECT DISTINCT neighbourhood_group, AVG (availability_365) AS availability FROM listings GROUP BY  neighbourhood_group ORDER BY availability DESC;

