ALTER TABLE wishlist_items
    ADD COLUMN purchase_discount_percent NUMERIC(5, 2) NOT NULL DEFAULT 0,
    ADD COLUMN purchase_final_price NUMERIC(19, 2);

UPDATE wishlist_items
SET purchase_final_price = final_price
WHERE status = 'COMPRADO';
