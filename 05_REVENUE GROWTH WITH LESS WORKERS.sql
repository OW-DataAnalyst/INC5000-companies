/* Wzrost przychodów przy jednoczesnym zmniejszaniu zatrudnienia – czy takie przypadki występują? 
Jak widać, takie przypadki nie są liczne, ale występują. Wiąże się to z tym, że świat podąża w kierunku technologii i niektóre procesy da się zautomatyzować.
Często zatrudniania jest jedno wielozadaniowa osoba, zamiast wielu nowych */

WITH industries AS (
SELECT
	name						 AS company_name,
	industry,
	(workers - previous_workers) AS new_workers,
    growth_pct
FROM inc5000
GROUP BY company_name, industry
)

SELECT
	industries.*
FROM industries
WHERE new_workers < 0 AND growth_pct > 0
ORDER BY new_workers ASC
