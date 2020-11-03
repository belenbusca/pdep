class Elemento {
	method espacioQueOcupa() {
		return 0
	}
}

class Regalo inherits Elemento {
	const property precio
	const property destinatario
	const espacioQueOcupa
	const precioPromedio 
	
	/*method umbralPrecioPromedio() {
		return umbral.precioPromedio()
	}*/
	
	override method espacioQueOcupa() {
		return espacioQueOcupa
	}
	
	method esRegaloTeQuierenMucho() {
		return precio > precioPromedio
	}
}

class Tarjeta inherits Elemento {
	const property precio = 2
	const property destinatario
	const property valorAdjunto
	
}

class Adorno inherits Elemento {

	const pesoBase
	var coeficienteDeSuperioridad
	
	method importancia() {
		return self.peso() * coeficienteDeSuperioridad
	}
	
	method peso() {
		return pesoBase
	}
}

class Luz inherits Adorno {
	const cantidadLamparitas
	
	method luminosidad() {
		return cantidadLamparitas
	}
	
	override method importancia() {
		return super() * self.luminosidad()
	}
}

class FiguraElaborada inherits Adorno {
	const volumen
	
	override method importancia() {
		return super() * volumen
	}
}

class Guirnalda inherits Adorno {
	const anioDeCompra 
	const aniosDeUso = new Date() - anioDeCompra 
	
	override method peso() {
		return pesoBase - 100 * aniosDeUso
	}
}
