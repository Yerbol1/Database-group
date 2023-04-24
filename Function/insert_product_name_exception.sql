CREATE OR REPLACE FUNCTION insert_product_name(p_id INTEGER, p_name VARCHAR, p_description TEXT, p_price DECIMAL, p_image_url VARCHAR, p_seller_id INTEGER) RETURNS VOID AS
$$
BEGIN
    IF LENGTH(p_name) < 5 THEN
        RAISE EXCEPTION 'Product name must be at least 5 characters';
    ELSE
        INSERT INTO "Product" (id, name, description, price, image_url, seller_id) VALUES (p_id, p_name, p_description, p_price, p_image_url, p_seller_id);
    END IF;
END;
$$ LANGUAGE plpgsql;


SELECT insert_product_name(505, 'Lego', 'Lego is the best toy for kids...', 525.89, 'https://image-data.com/lego.jpg', 2);
SELECT insert_product_name(505, 'Transformer-robot', 'Transformer-robot', 1385.89, 'https://image-data.com/transformer-robot.jpg', 87);