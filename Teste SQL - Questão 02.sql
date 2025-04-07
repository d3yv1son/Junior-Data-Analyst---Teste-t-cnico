SELECT 
  d.nome AS nome_departamento,
  COUNT(DISTINCT e.matr) AS qtd_empregados,
  
  ROUND(COALESCE(AVG(v.valor), 0), 2) AS media_salarial,
  ROUND(COALESCE(MAX(v.valor), 0), 2) AS maior_salario,
  ROUND(COALESCE(MIN(v.valor), 0), 2) AS menor_salario
  
FROM 
  departamento d
  
LEFT JOIN 
  empregado e ON d.cod_dep = e.gerencia_cod_dep OR d.cod_dep = e.lotacao
  
LEFT JOIN 
  emp_venc ev ON e.matr = ev.matr
  
LEFT JOIN 
  vencimento v ON v.cod_venc = ev.cod_venc
  
WHERE 
  v.tipo = 'V'
  
GROUP BY 
  d.nome
  
ORDER BY 
  media_salarial DESC;
