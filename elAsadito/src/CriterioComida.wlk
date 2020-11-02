object vegetariano {
	method cumpleCriterio(unaComida) {
		return !unaComida.esCarne()
	}
}

class Dietetico {
	var property caloriasMaximas = 500
	
	method cumpleCriterio(unaComida) {
		return unaComida.calorias() < caloriasMaximas
	}
}

class Alternado {
	var aceptarComida // Booleano
	method cumpleCriterio(unaComida) {
		aceptarComida = !aceptarComida
		return aceptarComida
	}
}

object combinacionDeCondiciones {
	const criterios = [vegetariano, new Dietetico(), new Alternado(aceptarComida = true)]
	method cumpleCriterio(unaComida) {
		return criterios.all{ unCriterio => unCriterio.cumpleCriterio(unaComida) }
	}
	
	method agregarCriterio(unCriterio) {
		criterios.add(unCriterio)
	}
}