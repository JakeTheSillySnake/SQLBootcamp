WITH RECURSIVE nodes AS (
  -- Cтроим дерево возможных маршрутов, начиная с a
  SELECT point1 AS path, point1, point2, cost FROM roads
  WHERE point1 = 'a'
	  UNION
  SELECT CONCAT(nodes.path, ',', roads.point1) AS path, roads.point1, roads.point2, nodes.cost + roads.cost FROM nodes
    JOIN roads ON nodes.point2 = roads.point1
  -- Избегаем повторных посещений
  WHERE path NOT LIKE CONCAT('%', roads.point1, '%')
), routes AS (
  SELECT cost AS total_cost,
    CONCAT('{', path, ',', point2, '}') AS tour
  FROM nodes
  -- Выбираем только полные маршруты, возвращающиеся в пункт a
  WHERE point2 = 'a' AND LENGTH(path) = 7 
)

-- Выбор итоговых маршрутов с минимальной и максимальной стоимостью 
SELECT * FROM routes
WHERE total_cost = (SELECT MIN(total_cost) FROM routes)
OR total_cost = (SELECT MAX(total_cost) FROM routes)
ORDER BY total_cost, tour;
