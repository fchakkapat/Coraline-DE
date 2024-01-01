/* Command for creating table cat_reg */
CREATE TABLE IF NOT EXISTS cat_reg (
  Category VARCHAR(255) NOT NULL,
  East INT NOT NULL,
  West INT NOT NULL,
  "Grand Total" INT NOT NULL
);

/* Command for inserting data into cat_reg */
INSERT INTO cat_reg
  SELECT
    Category,
    SUM(CASE WHEN Region = 'East' THEN TotalPrice END) AS East,
    SUM(CASE WHEN Region = 'West' THEN TotalPrice END) AS West,
    SUM(TotalPrice) AS "Grand_Total"
  FROM food_sales
  GROUP BY Category
  ORDER BY Category;
