/* Firmy zwiększające zatrudnienie – które odnotowały największy wzrost?
Jak widzimy - firma, która odnotowała największy wzrost liczby zatrudnianych pracowników to firma z branży Ochrony. ( 3X więcej od firmy na drugim miejscu)
Nic dziwnego, to praca w której obowiązki są praktycznie w 100% fizyczne i potrzebne są nowe osoby.
Pozycja druga i trzecia również zajmowana jest przez branże w których jest bardzo duże zapotrzebowanie na fizycznych ludzi.
Branże w których część procesów jest zautomatyzowana, czy w większości obsługiwana przez człowieka na komputerze ( wielozadaniowosc ) np. Financial Services,
zostają zdecydowanie w tyle (Prognoza w czasach aktualnych (AI) to zdecydowane zmniejszenie liczb otwieranych stanowisk w takich branżach) */


WITH industries_workers AS (
SELECT
	name AS company_name,
    industry,
    (workers - previous_workers) AS new_workers
FROM inc5000
)

SELECT
	company_name,
    industry,
    new_workers,
    DENSE_RANK() OVER ( ORDER BY new_workers DESC ) AS ranking
FROM industries_workers
ORDER BY ranking ASC
