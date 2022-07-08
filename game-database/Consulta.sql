Select
emp.nombre as jugador_eliminado,
emp_2.nombre as empleado_eliminador,
jug_eli.fecha_eliminacion as fecha_eliminacion,
se.nombre_sede
from jugadores_eliminados as jug_eli
LEFT JOIN empleados as emp ON jug_eli.id_jugador_eliminado = emp.id_empleados
LEFT JOIN empleados as emp_2 ON jug_eli.id_empleado_eliminacion = emp_2.id_empleados
INNER JOIN sede as se ON se.id_sede = jug_eli.id_sede_eliminacion