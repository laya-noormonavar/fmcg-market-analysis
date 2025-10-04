SELECT fmcg_category,
       platform_name,
       product_name,
       date_miladi,
	   date,
       MIN(price) AS cheapest_price
FROM products
WHERE metric = 'گران ترین' and ranking=1 and platform_name= 'Digikala'
GROUP BY fmcg_category, platform_name, product_name, date_miladi , date
ORDER BY fmcg_category, platform_name, date_miladi, date;

