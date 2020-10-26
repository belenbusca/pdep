import Ninio.*

class Legion {
	
	const miembros = []
	
	method capacidadDeSusto() {
		return miembros.sum({unMiembro => unMiembro.capacidadDeSusto()})
	}
	
	method cantCaramelos() {
		return miembros.sum({unMiembro => unMiembro.cantCaramelos()})
	}
	
	method lider() {
		return miembros.max({unMiembro => unMiembro.capacidadDeSusto()})
	}
	
	method intentarAsustarA(unAdulto) {
		unAdulto.intentarSerAsustadoPor(self)
	}
	
	method recibirCaramelos(unaCantidad) {
		self.lider().recibirCaramelos(unaCantidad)
	}
	

}
