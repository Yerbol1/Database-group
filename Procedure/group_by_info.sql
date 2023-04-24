CREATE OR REPLACE PROCEDURE group_by_info()
LANGUAGE plpgsql
AS $$
BEGIN
  SELECT "Seller".name, COUNT(*) AS product_count
  FROM "Seller"
  JOIN "Product" ON "Seller".id = "Product".seller_id
  GROUP BY "Seller".name;
END;
$$;


CALL group_by_info();


/* 
ERROR: ОШИБКА:  в запросе нет назначения для данных результата
HINT:  Если вам нужно отбросить результаты SELECT, используйте PERFORM.
CONTEXT:  функция PL/pgSQL group_by_info(), строка 3, оператор SQL-оператор
*/


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