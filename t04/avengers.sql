USE ucode_web;

SELECT heroes.name, SUM(powers.points) FROM powers
JOIN heroes ON(heroes.id = powers.hero_id) 
GROUP BY heroes.id
ORDER BY SUM(powers.points) DESC, heroes.id
LIMIT 1;
SELECT heroes.name, SUM(powers.points) FROM heroes
JOIN powers ON (heroes.id = powers.hero_id)
WHERE powers.type = 'defense'
GROUP BY heroes.id
ORDER BY SUM(powers.points), heroes.id
LIMIT 1;
