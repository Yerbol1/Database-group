CREATE OR REPLACE PROCEDURE get_products_by_seller(p_seller_name TEXT)
LANGUAGE plpgsql
AS $$
DECLARE
    product_cursor CURSOR FOR SELECT b.name FROM "Product" b JOIN "Seller" a ON b.seller_id = a.id WHERE a.name = p_seller_name;
    product_count INTEGER;
    product_name TEXT;
BEGIN
    OPEN product_cursor;
    LOOP
        FETCH NEXT FROM product_cursor INTO product_name;
        EXIT WHEN NOT FOUND;
    END LOOP;
    CLOSE product_cursor;
    GET DIAGNOSTICS product_count = ROW_COUNT;
    RAISE NOTICE 'Retrieved % products for seller %', product_count, p_seller_name;
END;
$$;

CREATE OR REPLACE PROCEDURE get_products_by_all_sellers()
LANGUAGE plpgsql
AS $$
DECLARE
    seller_name TEXT;
BEGIN
    FOR seller_name IN SELECT name FROM "Seller"
    LOOP
        CALL get_products_by_seller(seller_name);
    END LOOP;
END;
$$;



CALL get_products_by_all_sellers();
