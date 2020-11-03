
class Alquiler {
	
	const meses
	
	method comision(unInmueble) {
		return meses * unInmueble.valor() / 50000
	}
	
}

object venta {
	method comision(unInmueble) {
		return unInmueble.valor() * porcentajeVenta.porcentaje() / 100
	}
}

object porcentajeVenta {
	var property porcentaje = 1.5
}
