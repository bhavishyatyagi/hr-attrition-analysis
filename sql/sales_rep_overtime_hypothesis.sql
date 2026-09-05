WITH role_attrition AS (
    SELECT 
        Department,
        JobRole,
        OverTime,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
        ROUND(
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
            2
        ) AS attrition_rate_pct
    FROM employees
    WHERE JobRole = 'Sales Representative'
    GROUP BY Department, JobRole, OverTime
)
SELECT *
FROM role_attrition
ORDER BY attrition_rate_pct DESC;