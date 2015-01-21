  SELECT servicio_id, ts.tipo_srv_nombre, p.prov_nombre, 
         c.ciudad_nombre, servicio_costo, servicio_descripcion, 
         servicio_fecha, servicio_hora
    FROM servicio s, proveedor p,ciudad c, tipo_servicio ts 
   WHERE ts.tipo_srv_id = s.tipo_servicio_tipo_srv_id 
     AND p.prov_id = s.proveedor_prov_id
	 AND c.ciudad_id = s.ciudad_ciudad_id
ORDER BY servicio_id ASC 