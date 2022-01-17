SELECT
  ProductName,
  MAX(Product_Count) as Product_Count
FROM
  (
    SELECT
      P.ProductName,
      COUNT(1) as Product_Count
    FROM
      [ OrderDetails ] OD
      INNER JOIN [ Products ] P on P.ProductID = OD.ProductID
      INNER JOIN [ Orders ] O on O.OrderID = OD.OrderID
      INNER JOIN [ Customers ] C on O.CustomerID = C.CustomerID
    WHERE
      C.Country = 'Germany'
    GROUP BY
      OD.ProductId
    ORDER BY
      Product_Count DESC
  )