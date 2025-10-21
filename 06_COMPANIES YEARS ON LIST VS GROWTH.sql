/* Okres ( w latach ) znajdowania się firmy na liscie VS jej wzrost
Jak widać w TOP10 wszystkie(!) firmy są zaledwie jeden rok na liscie, co oznacza, ze nowe firmy robią na początku największe "boom" i najszybciej rosną. */

SELECT
	name 			AS company_name,
    yrs_on_list 	AS years_on_list,
    AVG(growth_pct) AS average_growth_pct
FROM inc5000
GROUP BY company_name, years_on_list
ORDER BY average_growth_pct DESC
LIMIT 10