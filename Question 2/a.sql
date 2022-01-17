SELECT
  COUNT(DISTINCT(OrderID))
FROM
  [ Orders ] O
  LEFT JOIN [ Shippers ] S ON O.ShipperID = S.ShipperID
WHERE
  S.ShipperName = 'Speedy Express';