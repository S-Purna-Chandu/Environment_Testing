{{ config(database='raw', schema='jaffle_shop') }}

{% set table_name = '@FED_DATA/fed_holdings.csv' %}

SELECT
    t.$1 AS As_of_Date,
    REPLACE(t.$2, '\'', '') AS CUSIP,
    t.$3 AS Security_Type,
    t.$4 AS Security_Description,
    t.$5 AS Term,
    t.$6 AS Maturity_Date,
    t.$7 AS Issuer,
    t.$8 AS Spread_pct,
    t.$9 AS Coupon_pct,
    t.$10 AS Current_Face_Value,
    t.$11 AS Par_Value,
    t.$12 AS Inflation_Compensation,
    t.$13 AS Percent_Outstanding,
    t.$14 AS Change_From_Prior_Week,
    t.$15 AS Change_From_Prior_Year,
    t.$16 AS is_Aggregated
FROM {{table_name}} (file_format => CSV_FILE_FORMAT) t