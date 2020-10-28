object islaPajaro {
	
	const pajaros = []
	
	method pajarosFuertes() {
		return pajaros.filter({unPajaro => unPajaro.fuerza() > 50})
	}
	
	method fuerza() {
		return self.pajarosFuertes().sum({unPajaro => unPajaro.fuerza()})
	}
	
	method suceder(unEvento) {
		pajaros.forEach({unPajaro => unEvento.afectar(unPajaro)})
	}
	
	method atacar(unaIsla) {
		pajaros.forEach({unPajaro => unPajaro.atacar(unaIsla)})
	}
}

class IslaCerdito {
	const obstaculos = []
	
	method pudoRecuperarHuevos() {
		return obstaculos.isEmpty()
	}
	
	method perderObstaculo(unObstaculo) {
		obstaculos.remove(unObstaculo)
	}
	
	method obstaculoMasCercano() {
		return obstaculos.head()
	}
}