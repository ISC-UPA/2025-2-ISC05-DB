-- En Access
SELECT t.nombre, g.nombre, p.nombre, sum(v.kilos) AS total
FROM ((grupos AS g  
     INNER JOIN productos AS p ON g.idgrupo = p.idgrupo) 
     INNER JOIN [Ventas Globales] AS v ON p.idproducto = v.idproducto) 
     INNER JOIN vendedores AS t ON v.idvendedor = t.idvendedor
GROUP BY t.nombre, g.nombre, p.nombre;

-- Fechas 
#12/31/1996#
