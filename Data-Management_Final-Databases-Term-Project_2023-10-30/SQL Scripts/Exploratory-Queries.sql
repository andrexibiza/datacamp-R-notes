-- SELECT COUNT(*)
-- FROM `data-management-term-project.term_project_data.sales`;

-- Examine sales.TotalPrice column
-- SELECT 
--   MIN(TotalPrice) AS min_price,
--   MAX(TotalPrice) AS max_price,
--   (APPROX_QUANTILES(TotalPrice, 2)[OFFSET(1)]) AS median_price
-- FROM `data-management-term-project.term_project_data.sales`;

-- Examine products.Price column
-- SELECT
--   MIN(Price) AS min_product_price,
--   MAX(Price) AS max_product_price
-- FROM `data-management-term-project.term_project_data.products`;

-- Min and Max sales date
SELECT
  MIN(SalesDate) AS min_sales_date,
  MAX(SalesDate) AS max_sales_date
FROM `data-management-term-project.term_project_data.sales`;