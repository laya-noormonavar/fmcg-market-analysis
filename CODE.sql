WITH ranked_products AS (
    SELECT fmcg_category,
           platform_name,
           product_name,
           COUNT(*) AS frequency,
           ROW_NUMBER() OVER (
               PARTITION BY fmcg_category, platform_name
               ORDER BY COUNT(*) DESC
           ) AS rn
    FROM products
    WHERE metric = 'گران ترین' AND ranking < 20
    GROUP BY fmcg_category, platform_name, product_name
)
SELECT fmcg_category, platform_name, product_name, frequency
FROM ranked_products
WHERE rn <= 3
ORDER BY fmcg_category, platform_name, frequency DESC;
