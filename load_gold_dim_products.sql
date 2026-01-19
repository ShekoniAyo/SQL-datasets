CREATE VIEW gold.dim_products AS
SELECT 
        ROW_NUMBER() OVER (ORDER BY prd_start_dt, prd_key) AS product_key,
        prd_id AS product_id, 
        prd_key AS product_number, 
        prd_nm AS product_name, 
        cat_id AS category_id, 
        cat AS category, 
        subcat AS subcategory, 
        maintainance, 
        prd_cost AS cost, 
        prd_line AS product_line,
        prd_start_dt AS product_start_date
FROM silver.crm_prd_info pi
LEFT JOIN silver.erp_px_cat_g1v2 pd
ON pi.cat_id = pd.id
WHERE prd_end_dt IS NULL