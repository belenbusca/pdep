import Ninio.*

class Adulto {
	
	const niniosQueIntentaronAsustar = []
	
	method intentarSerAsustadoPor(unNinio) {
		niniosQueIntentaronAsustar.add(unNinio)
		if(self.esAsustadoPor(unNinio))
			self.darCaramelosA(unNinio)
	}
	
	method cantNiniosQueIntentaronAsustarConMasDe15Caramelos() {
		return niniosQueIntentaronAsustar.filter({unNinio => unNinio.cantCaramelos() > 15}).size()
	}
	
	method esAsustadoPor(unNinio) {
		return self.tolerancia() < unNinio.capacidadDeSusto()
	}
	
	method tolerancia() {
		return self.cantNiniosQueIntentaronAsustarConMasDe15Caramelos() * 10
	}
	
	method darCaramelosA(unNinio) {
		unNinio.recibirCaramelos(self.cantidadCaramelosADar())
	}
	
	method cantidadCaramelosADar() {
		return self.tolerancia() / 2
	}
}

class Abuelos inherits Adulto {
	
	override method esAsustadoPor(unNinio) {
		return true
	}
	
	override method cantidadCaramelosADar() {
		return super() / 2
	}
	
}

class AdultoNecio inherits Adulto {
	
	override method esAsustadoPor(unNinio) {
		return false
	}
}
