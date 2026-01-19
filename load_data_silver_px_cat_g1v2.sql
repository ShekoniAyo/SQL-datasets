INSERT INTO silver.erp_px_cat_g1v2 (id, cat, subcat, maintainance)
SELECT id
      ,cat
      ,subcat
      ,maintainance
 FROM bronze.erp_px_cat_g1v2

 SELECT *
 FROM silver.erp_px_cat_g1v2
