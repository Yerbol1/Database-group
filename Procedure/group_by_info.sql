
CREATE OR REPLACE PROCEDURE group_by_info()
LANGUAGE plpgsql
AS $$
DECLARE
  row_record RECORD;
BEGIN
  FOR row_record IN
    SELECT "Seller".name, COUNT(*) AS product_count
    FROM "Seller"
    JOIN "Product" ON "Seller".id = "Product".seller_id
    GROUP BY "Seller".name
  LOOP
    RAISE NOTICE '%: % products', row_record.name, row_record.product_count;
  END LOOP;
END;
$$;


CALL group_by_info();
