USE ucode_web;

SELECT find.name, find.id FROM (
  SELECT heroes.name, heroes.id FROM heroes
  WHERE heroes.race != "human" AND heroes.name LIKE '%a%' AND heroes.class_role IN ("tankman", "healer")
) AS find JOIN teams ON heroes.id = teams.hero_id
GROUP BY find.id
ORDER BY find.id
LIMIT 1;
