-- Średni przychód firm – jak prezentuje się w różnych branżach? ( TOP10 + ranking )

WITH industries_revenue AS (
SELECT
	industry,
	ROUND(AVG(revenue),2) AS average_revenue_millions
FROM inc5000
GROUP BY industry
ORDER BY average_revenue_millions desc
)

SELECT
	industry,
    average_revenue_millions,
    DENSE_RANK() OVER ( ORDER BY average_revenue_millions DESC ) AS ranking
FROM industries_revenue
ORDER BY ranking ASC
LIMIT 10

