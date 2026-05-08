-- =========================================
-- BIKE SHARE DATA ANALYSIS PROJECT
-- =========================================


-- =========================================
-- STEP 1: Combine yearly datasets
-- =========================================

WITH cte AS (

    SELECT *
    FROM bike_share_yr_0

    UNION

    SELECT *
    FROM bike_share_yr_1

)


-- =========================================
-- STEP 2: Select required columns
-- =========================================

SELECT
    dteday,
    season,
    a.yr,
    weekday,
    rider_type,
    riders,
    price,
    COGS,


-- =========================================
-- STEP 3: Calculate revenue
-- =========================================

    riders * price AS revenue,


-- =========================================
-- STEP 4: Calculate profit
-- =========================================

    riders * price - COGS*riders AS profit


-- =========================================
-- STEP 5: Join tables
-- =========================================

FROM cte a

LEFT JOIN cost_table b
ON a.yr = b.yr