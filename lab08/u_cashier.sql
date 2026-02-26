SELECT current_user, session_user;

SELECT * FROM coffee.v_order_summary ORDER BY order_id;
SELECT * FROM coffee.v_daily_sales;

INSERT INTO coffee.category(category_name) VALUES ('ShouldFail');

 