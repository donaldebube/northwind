WITH date_spine AS (
    SELECT
        DATEADD(day, SEQ4(), '2014-01-01'::DATE) AS d
    FROM TABLE(GENERATOR(ROWCOUNT => 13150))
)
SELECT
    TO_CHAR(d, 'YYYYMMDD') AS id,
    d AS full_date,
    YEAR(d) AS year,
    WEEKOFYEAR(d) AS year_week,
    DAYOFYEAR(d) AS year_day,
    YEAR(d) AS fiscal_year,
    QUARTER(d) AS fiscal_qtr,
    MONTH(d) AS month,
    TO_CHAR(d, 'MMMM') AS month_name,
    DAYOFWEEK(d) AS week_day,
    TO_CHAR(d, 'DY') AS day_name,
    CASE 
        WHEN DAYOFWEEK(d) IN (0, 6) THEN 0
        ELSE 1 
    END AS day_is_weekday
FROM date_spine
WHERE d < '2050-01-01'