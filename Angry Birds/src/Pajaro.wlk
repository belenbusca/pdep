class Pajaro {
	
	var ira
	
	method fuerza() {
		return ira * 2
	}
	
	method enojarse() {
		ira *= 2
	}
	
	method tranquilizarse() {
		ira -= 5
	}
	
	method puedeDerribar(unObstaculo) {
		return self.fuerza() > unObstaculo.resistencia()
	}
	
	method atacar(unaIsla) {
		const obstaculo = unaIsla.obstaculoMasCercano()
		if(self.puedeDerribar(obstaculo))
			unaIsla.perderObstaculo(obstaculo)
	}
	
}

class PajaroRencoroso inherits Pajaro {
	var cantVecesEnojado = 0
	
	override method enojarse() {
		super()
		cantVecesEnojado ++
	}
}

class Red inherits PajaroRencoroso {
	
	override method fuerza() {
		return ira * 10 * cantVecesEnojado
	}
}

class Terence inherits PajaroRencoroso {
	
	var property multiplicador 
	
	override method fuerza() {
		return ira * multiplicador * cantVecesEnojado
	}
}

class Bomb inherits Pajaro {
	
	var property fuerzaLimite = 9000
	
	override method fuerza() {
		return super().min(fuerzaLimite)
	}
}

class Chuck inherits Pajaro {
	
	var velocidad 
	
	override method fuerza() {
		return 150 + 5 * 0.max(velocidad - 80)
	}
	
	override method enojarse() {
		velocidad *= 2
	}
	
	override method tranquilizarse() {
		
	}
}

class Matilda inherits Pajaro {
	const huevos = []
	
	override method fuerza() {
		return super() + self.fuerzaTodosSusHuevos()
	}
	
	method fuerzaTodosSusHuevos() {
		return huevos.sum({huevo => huevo.fuerza()})
	}
	
	override method enojarse() {
		huevos.add(new Huevo(peso = 2))
	}
}

class Huevo {
	const peso
	
	method fuerza() = peso
}