import Familia.*

class Don {
	
	const subordinados = #{}
	
	method atacar(victima, armas) {
		subordinados.anyOne().atacar(victima)
	}
	
	method sabeDespacharElegantemente(persona) {
		return true
	}
	
}

object donVito inherits Don {
	
	override method atacar(victima, armas) {
		super(victima, armas)
		super(victima, armas)
	}
}

class Subjefe {
	
	const subordinados = #{}
	const armasUtilizadas = []
	
	method atacar(victima, armas) {
		const arma = self.armaNoUtilizada(armas)
		
		arma.disparar(victima)
		self.agregarArmaUtilizada(arma)
	}
	
	method armaNoUtilizada(armas) {
		return armas.filter({unArma => !armasUtilizadas.contains(unArma)}).anyOne()
	}
	
	method agregarArmaUtilizada(arma) {
		armasUtilizadas.add(arma)
	}
	
	method sabeDespacharElegantemente(persona) {
		return subordinados.any({unSubordinado => unSubordinado.tieneArmaSutil()})
	}
}

class Soldado {
	
	method atacar(victima, armas) {
		self.armaMasCercana(armas).disparar(victima)
	}
	
	method armaMasCercana(armas) {
		return armas.head()
	}
	
	method sabeDespacharElegantemente(persona) {
		return persona.tieneArmaSutil()
	}
	
	method reorganizar(persona) {
		if(persona.cantArmas() > 5)
			persona.cambiarRango(new Subjefe())
	}
}

