/* Sredni zysk VS Liczba firm w podziale na branże, czy wieksza ilosc firm = wiekszy zysk? Jak widać - nie jest to regułą.
Średnia ≠ liczba firm – wiele firm może być nowymi startupami, także przy takiej analizie musimy brać pod uwagę, które firmy są z ugruntowaną pozycją, a które dopiero zaczynają */

SELECT
	industry,
    ROUND(AVG(revenue),2) AS average_revenue_millions,
    COUNT(*)			  AS companies_count
FROM inc5000
GROUP BY industry
ORDER BY average_revenue_millions DESC
LIMIT 10
