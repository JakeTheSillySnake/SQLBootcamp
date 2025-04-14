CREATE TABLE IF NOT EXISTS roads(
  point1 VARCHAR,
  point2 VARCHAR,
  cost INTEGER
);

-- TRUNCATE TABLE roads;

INSERT INTO roads(point1, point2, cost)
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);

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

-- Выбор итоговых маршрутов с минимальной стоимостью 
SELECT * FROM routes
WHERE total_cost = (SELECT MIN(total_cost) FROM routes)
ORDER BY total_cost, tour;
