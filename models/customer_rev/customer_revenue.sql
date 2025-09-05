SELECT
    OS.CustomerID,
    C.customername,
    SUM(OS.OrderCount) AS OrderCount,
    SUM(OS.Revenue) AS Revenue
FROM
    {{ ref('orders_fact') }} OS
JOIN
    {{ ref('customers_stg') }} C ON OS.customerID = C.CustomerID
GROUP BY
    OS.CustomerID,
    C.customername

    