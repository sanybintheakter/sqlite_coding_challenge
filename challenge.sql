- TASK 1
SELECT
    c.first_name || ' ' || c.last_name AS customer_full_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spend
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
JOIN order_items oi
    ON o.id = oi.order_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spend DESC
LIMIT 5;

- TASK 2
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi
    ON p.id = oi.product_id
JOIN orders o
    ON oi.order_id = o.id
GROUP BY p.category
ORDER BY revenue DESC;

- TASK 3
SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    e.salary,
    ROUND(dept_avg.avg_salary, 2) AS department_average
FROM employees e
JOIN departments d
    ON e.department_id = d.id
JOIN (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
    ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary
ORDER BY d.name, e.salary DESC;

- TASK 4
SELECT
    city,
    COUNT(*) AS gold_customer_count
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customer_count DESC, city ASC;