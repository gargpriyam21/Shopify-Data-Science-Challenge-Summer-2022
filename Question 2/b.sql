SELECT
  Lastname
FROM
  [ Employees ]
WHERE
  EmployeeID IN (
    SELECT
      EmployeeID
    from
      (
        SELECT
          EmployeeID,
          COUNT(OrderID) as Orders
        FROM
          [ Orders ]
        GROUP BY
          EmployeeID
      )
    where
      Orders = (
        SELECT
          MAX(Orders)
        from
          (
            SELECT
              EmployeeID,
              COUNT(OrderID) as Orders
            FROM
              [ Orders ]
            GROUP BY
              EmployeeID
            ORDER BY
              Orders DESC
          )
      )
  )