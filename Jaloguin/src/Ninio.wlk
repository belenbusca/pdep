class Ninio {
	
//	var actitud
	const elementosDisfraz = []
	var cantCaramelos = 0
	
	method cantCaramelos() {
		return cantCaramelos
	}
	
	method capacidadDeSusto() {
		return elementosDisfraz.sum({unElemento => unElemento.susto()})
	}
	
	method recibirCaramelos(unaCantidad) {
		cantCaramelos += unaCantidad
	}
	
	method intentarAsustarA(unAdulto) {
		unAdulto.intentarSerAsustadoPor(self)
	}
	
}