-- How was the questions generated?
-- It was generated via Bard.ai with the following prompt:
-- use bigquery-public-data.chicago_crime.crime from BigQuery and provide with me 10 - 15 SQL questions, together with the output it should show

-- Question 1
-- Find the total number of crimes reported in Chicago:

SELECT COUNT(*) AS total_crimes
FROM `bigquery-public-data.chicago_crime.crime`

-- Question 2
-- Find the top 10 most common crimes in Chicago:

SELECT primary_type, COUNT(*) AS count
FROM `bigquery-public-data.chicago_crime.crime`
GROUP BY primary_type
ORDER BY count DESC
LIMIT 10

-- Question 3
-- Find the average number of crimes reported per day in Chicago:

with num_of_crime as (
SELECT count(*) as no_of_crime,
DATE(date) as crime_date
FROM `bigquery-public-data.chicago_crime.crime`
GROUP BY crime_date )

SELECT avg(no_of_crime) as avg_crimes_per_day
FROM num_of_crime

[BARD.AI answer]
SELECT
  AVG(num_crimes) AS avg_crimes_per_day
FROM
  (
    SELECT
      COUNT(*) AS num_crimes,
      DATE(date) AS crime_date
    FROM
      `bigquery-public-data.chicago_crime.crime`
    GROUP BY
      crime_date
  ) AS daily_crime_counts


