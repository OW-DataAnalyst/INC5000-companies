/* Branże z największym średnim wzrostem – które to? (RANKING) 
Insight :  Co ciekawe, w rankingu TOP10 brakuje branży z największym rocznym revenue.
Branża Insurance ( TOP1 ) nie zalicza gwałtownych wzrostów zainteresowania, stale rośnie do przodu od wielu lat.
Branże takie jak Logistics & Transportation lub Consumer Products & Services to branże, które idą bardzo mocno do przodu w ostatnich latach, 
przez co w następnych wydaniach jeśli tendencja nie spadnie - wyprzedzą Insurance. 
(Logistics & Transportation brakuje tylko 5M$ do Insurance, więc powinna wyprzedzic juz w nastepnym roku.)
*/

WITH industries_growth AS (
SELECT
	industry,
    ROUND(AVG(growth_pct),2) as average_growth_pct
FROM inc5000
GROUP BY industry
)

SELECT
	industry,
    average_growth_pct,
    DENSE_RANK() OVER ( ORDER BY average_growth_pct DESC ) AS ranking
from industries_growth
ORDER BY ranking ASC
LIMIT 10
