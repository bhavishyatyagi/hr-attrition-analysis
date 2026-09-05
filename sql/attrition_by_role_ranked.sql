SELECT 
    Department,
    JobRole,
    total_employees,
    employees_left,
    attrition_rate_pct,
    RANK() OVER (PARTITION BY Department ORDER BY attrition_rate_pct DESC) AS rank_within_dept
FROM (
    SELECT 
        Department,
        JobRole,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
        ROUND(
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
            2
        ) AS attrition_rate_pct
    FROM employees
    GROUP BY Department, JobRole
) AS role_attrition
ORDER BY Department, rank_within_dept;