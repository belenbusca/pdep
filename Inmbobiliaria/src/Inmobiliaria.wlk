object inmobiliaria {
	const operaciones = #{}
	const empleados = #{}
	
	method elMejorEmpleadoSegun(unCriterio) {
		return empleados.max{ empleado => unCriterio.evaluar(empleado) }
	}
	
}

object totalDeComisiones {
	method evaluar(empleado) = empleado.totalDeComisiones()
}

object cantidadOperacionesCerradas {
	method evaluar(empleado) = empleado.cantidadOperacionesCerradas()
}

object cantidadDeReservas {
	method evaluar(empleado) = empleado.cantidadDeReservas()
}



