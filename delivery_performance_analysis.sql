WITH OrderDetails AS (
    -- Step 1: Join the tables and calculate the value and delay status of each specific order
    SELECT 
        o.order_id,
        c.customer_state,
        SUM(i.price) AS order_value,
        CASE 
            WHEN CAST(o.order_delivered_customer_date AS DATETIME) > CAST(o.order_estimated_delivery_date AS DATETIME) THEN 1 
            ELSE 0 
        END AS is_late
    FROM olist_orders o
    JOIN olist_customers c ON o.customer_id = c.customer_id
    JOIN olist_order_items i ON o.order_id = i.order_id
    WHERE o.order_status = 'delivered' 
      AND o.order_delivered_customer_date IS NOT NULL
      AND o.order_delivered_customer_date != ''
    GROUP BY o.order_id, c.customer_state, o.order_delivered_customer_date, o.order_estimated_delivery_date
),
StateMetrics AS (
    -- Step 2: Aggregate the data by State to find the Average Order Value and Late Rate
    SELECT 
        customer_state,
        COUNT(order_id) AS total_orders,
        ROUND(AVG(order_value), 2) AS avg_order_value,
        ROUND((SUM(is_late) / COUNT(order_id)) * 100, 2) AS late_rate_percent
    FROM OrderDetails
    GROUP BY customer_state
)
-- Step 3: Rank the states by who has the worst delivery delays
SELECT 
        customer_state,
        total_orders,
        avg_order_value,
        late_rate_percent,
        DENSE_RANK() OVER (ORDER BY late_rate_percent DESC) AS worst_delay_rank
FROM StateMetrics
WHERE total_orders > 100 
ORDER BY worst_delay_rank;