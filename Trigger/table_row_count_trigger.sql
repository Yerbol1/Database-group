CREATE OR REPLACE FUNCTION table_row_count() RETURNS TRIGGER AS
$$
DECLARE
  table_name TEXT;
  row_count INTEGER;
BEGIN
  table_name := TG_TABLE_NAME;
  EXECUTE 'SELECT COUNT(*) FROM "' || table_name || '"' INTO row_count;
  RAISE NOTICE '% table size: % rows', table_name, row_count;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER table_row_count_trigger
BEFORE INSERT ON "Customer"
-- BEFORE INSERT ON "Seller"
-- BEFORE INSERT ON "Product"
-- BEFORE INSERT ON "Cart"
-- BEFORE INSERT ON "Cartitem"
-- BEFORE INSERT ON "Transaction"
-- BEFORE INSERT ON "TransactionItem"
-- BEFORE INSERT ON "Courier"
-- BEFORE INSERT ON "Delivery"
FOR EACH ROW
EXECUTE FUNCTION table_row_count();


INSERT INTO "Customer" (id, name, email, password, phone_number, address) VALUES (104, 'Customer Test', 'sdu-test4@gmail.com', 'sdupassword', '777-777-7777', 'Abylai-Khan 1/1');