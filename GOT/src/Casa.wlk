class Casa {
	var patrimonio
	const property ciudad
	const property miembros = []
	
	method patrimonio() = patrimonio
	method perteneceALaCasa(unaPersona) {
		return miembros.contains(unaPersona)
	}
	
	method esRica() {
		return patrimonio > 1000
	}
	
	method cantidadDeMiembros() {
		return miembros.size()
	}
	
	method perderPorcentajeDeDinero(porcentajeADerrochar) {
		const cantDineroAPerder = porcentajeADerrochar * patrimonio / 100 
		patrimonio -= cantDineroAPerder
	}
	
	method miembrosSolterosYVivos() {
		return miembros.filter{ miembro => miembro.esSoltero() && miembro.estaVivo() }
	}
}

object lannister inherits Casa {
	method admiteCasamiento(personaDeLaCasa, otraPersona) {
		return personaDeLaCasa.esSoltero()
	}
}

object stark inherits Casa {
	method admiteCasamiento(personaDeLaCasa, otraPersona) {
		return !self.perteneceALaCasa(otraPersona)
	}
}

object guardiaDeLaNoche inherits Casa {
	method admiteCasamiento(personaDeLaCasa, otraPersona) {
		return false
	}
}
