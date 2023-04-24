CREATE OR REPLACE FUNCTION count_of_rows(p_table text) RETURNS INTEGER AS
$$
DECLARE
	row_count INTEGER := 0;
	rec RECORD;
BEGIN
	FOR rec IN EXECUTE 'SELECT COUNT(*) FROM "' || p_table || '"'
		LOOP
			row_count := rec.count;
		END LOOP;
	RETURN row_count;
END;
$$ LANGUAGE plpgsql;


SELECT count_of_rows('Seller');