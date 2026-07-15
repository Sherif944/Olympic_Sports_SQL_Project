/*******************************************************************************
   📌 Script Name: 04_Advanced_data_analysis.sql
   👤 Author: Sherif Mohammed
   🎯 Purpose: Analytical Reporting & Historical Olympic Insights.

   📚 This script answers 4 complex analytical questions:
   -----------------------------------------------------------------------------
   1️⃣ Continuity Analysis (Sports played in ALL Summer Olympics):
       - Logic: Dynamically calculates total Summer Games using nested CTEs, 
         then filters sports that match this exact historical count.
         
   2️⃣ Elite Performance (Top 5 Gold Medal Winners - All-Time):
       - Logic: Uses 'DENSE_RANK()' over aggregate gold counts to dynamically 
         handle ties, ensuring athletes with identical counts share the same rank.
         
   3️⃣ Nation Medal Tally (Total Medals per Country):
       - Logic: Resolves transactional logs into a clean cross-tab matrix 
         layout using high-performance conditional aggregation (CASE WHEN).
         
   4️⃣ Seasonal Dominance (Peak Country per Olympic Edition):
       - Logic: Leverages 'FIRST_VALUE()' partitioned by Games, combined with 
         safe data-type casting (CAST), to return the top country name alongside 
         its peak medal count for each tier.
*******************************************************************************/

-- Identify the sport which was played in all summer olympics
WITH t1 AS(
SELECT
	COUNT(DISTINCT games) total_summer_games
FROM OLYMPIC_HISTORY
WHERE season = 'Summer'),

t2 AS(
SELECT DISTINCT 
	sport,
	games
FROM OLYMPIC_HISTORY
WHERE season = 'Summer'
),

t3 AS(
SELECT
	sport,
	COUNT(games) no_of_games
FROM t2
GROUP BY sport
)

SELECT * FROM t3
JOIN t1 on
t1.total_summer_games = t3.no_of_games

-- Fetch the top 5 athletes who have won the most gold medals
WITH medals_number AS(
SELECT
	name,
	COUNT(*) total_number_of_medals
FROM OLYMPIC_HISTORY
WHERE Medal = 'Gold'
GROUP BY name
),

ranking_medals AS(
SELECT
	name,
	total_number_of_medals,
	DENSE_RANK() OVER(ORDER BY total_number_of_medals DESC) ranking_gold_medals_winners
FROM medals_number
)

SELECT * FROM ranking_medals
WHERE ranking_gold_medals_winners <= 5

-- List down total gold,silver and bronze medals won by each country 

SELECT
	nr.region AS country,
	SUM(CASE WHEN oh.Medal = 'Bronze' THEN 1 ELSE 0 END) bronze_medal,
	SUM(CASE WHEN oh.Medal = 'Gold' THEN 1 ELSE 0 END) gold_medal,
	SUM(CASE WHEN oh.Medal = 'Silver' THEN 1 ELSE 0 END) silver_medal
FROM OLYMPIC_HISTORY oh
JOIN OLYMPIC_HISTORY_NOC_REGIONS nr
ON oh.NOC = nr.NOC
WHERE Medal != 'NA'
GROUP BY nr.region

-- Identify which country won the most gold,silver and most bronze medals in each olympic games

WITH country_won_medals AS (
    SELECT 
        nr.region AS country,
        oh.games,
        SUM(CASE WHEN oh.Medal = 'Gold'   THEN 1 ELSE 0 END) AS gold_medal,
        SUM(CASE WHEN oh.Medal = 'Silver' THEN 1 ELSE 0 END) AS silver_medal,
        SUM(CASE WHEN oh.Medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze_medal
    FROM OLYMPIC_HISTORY oh
    JOIN OLYMPIC_HISTORY_NOC_REGIONS nr ON nr.NOC = oh.NOC
    WHERE Medal != 'NA'
    GROUP BY nr.region, oh.games
)
SELECT DISTINCT 
	games,
	FIRST_VALUE(country) OVER(PARTITION BY games ORDER BY gold_medal DESC)
	+ '-' + CAST(FIRST_VALUE(gold_medal) OVER(PARTITION BY games ORDER BY gold_medal DESC) AS VARCHAR) max_gold,
	FIRST_VALUE(country) OVER(PARTITION BY games ORDER BY silver_medal DESC)
	+ '-' + CAST(FIRST_VALUE(silver_medal) OVER(PARTITION BY games ORDER BY silver_medal DESC) AS VARCHAR) max_silver,
	FIRST_VALUE(country) OVER(PARTITION BY games ORDER BY bronze_medal DESC)
	+ '-' + CAST(FIRST_VALUE(bronze_medal) OVER(PARTITION BY games ORDER BY bronze_medal DESC) AS VARCHAR) max_bronze
FROM country_won_medals
