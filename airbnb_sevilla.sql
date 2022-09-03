create database Airbnb_Sevilla;
use Airbnb_Sevilla;
select * from airbnb_sevilla;

# Eliminamos las columnas que no vamos a necesitar
ALTER TABLE airbnb_sevilla DROP column name;
ALTER TABLE airbnb_sevilla DROP column last_review; 
ALTER TABLE airbnb_sevilla DROP column reviews_per_month;
ALTER TABLE airbnb_sevilla DROP column license;
ALTER TABLE airbnb_sevilla DROP column host_name;

# Comprobamos que no existan valores nulos o valores en blanco en la tabla
SELECT *FROM airbnb_sevilla WHERE price IS NULL AND TRIM(price)<>'';

#Realizamos una agrupación por precio medio y neighbourhood_group de forma descendente 
SELECT DISTINCT neighbourhood_group, AVG (price) AS avg_precio 
FROM airbnb_sevilla  
GROUP BY neighbourhood_group 
ORDER BY avg_precio DESC;

#Realizamos una agrupación por neighbourhood y precio
SELECT DISTINCT neighbourhood, neighbourhood_group, 
AVG (price) OVER (PARTITION BY neighbourhood) AS avg_precio 
FROM airbnb_sevilla 
ORDER BY avg_precio DESC;

# Top 10 por número de reviews
SELECT *FROM airbnb_sevilla ORDER BY number_of_reviews DESC LIMIT 10;

# Número de airbnb por neighbourhood
SELECT DISTINCT neighbourhood, neighbourhood_group, COUNT(id) AS numero_Airbnb  
FROM airbnb_sevilla 
GROUP BY neighbourhood, neighbourhood_group 
ORDER BY numero_Airbnb DESC;

# Número de airbnb por propietario
SELECT DISTINCT host_id, COUNT(host_id) AS Airbnb_propietario FROM airbnb_sevilla GROUP BY host_id ORDER BY Airbnb_propietario DESC;

# Top 10 por número de airbnb por neighbourhood 
SELECT DISTINCT neighbourhood, neighbourhood_group, COUNT(id) AS numero_Airbnb  
FROM airbnb_sevilla 
GROUP BY neighbourhood, neighbourhood_group 
ORDER BY numero_Airbnb DESC LIMIT 10;

#Top 10 por número de room_type
SELECT room_type, COUNT(room_type) AS numero_Airbnb FROM airbnb_sevilla GROUP BY room_type ORDER BY room_type DESC;

# Precio promedio por tipo de room type por neighbourhood
SELECT DISTINCT neighbourhood, room_type, AVG (price) AS Avg_precio FROM airbnb_sevilla GROUP BY neighbourhood, room_type ORDER BY Avg_precio DESC;

# Promedio disponibilidad durante el año
SELECT DISTINCT neighbourhood_group, AVG (availability_365) AS availability 
FROM airbnb_sevilla 
GROUP BY neighbourhood_group 
ORDER BY availability DESC;

