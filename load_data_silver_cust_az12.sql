IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE silver.erp_cust_az12;
GO
CREATE TABLE silver.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
INSERT INTO silver.erp_cust_az12(cid, bdate, gen)
SELECT 
        CASE WHEN cid LIKE 'NAS%' 
            THEN SUBSTRING(cid, 4, LEN(cid))
            ELSE cid
       END AS cid
      , CASE WHEN bdate > GETDATE() 
            THEN  NULL
            ELSE bdate
        END AS bdate
      ,CASE
            WHEN TRIM(gen) = 'F' OR TRIM(gen) = 'FEMALE' 
                THEN  'Female'
            WHEN TRIM(gen) = 'M' OR TRIM(gen) = 'MALE' 
                THEN  'Male'
            ELSE 'N/A'
        END AS gender
  FROM bronze.erp_cust_az12

  Select * from silver.erp_cust_az12
