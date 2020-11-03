import Operacion.*

class Inmueble {
	const tamanio
	const cantidadDeAmbientes
	var operacion // venta o alquiler
	const property zona
	var estaReservada = false
	
	method operacion() = operacion
	
	method esLocal() = false
	
	method estaReservada() {
		return estaReservada
	}
	
	method puedeSerReservada() {
		return !estaReservada
	}
	
	method precioTotal() {
		return self.valor() + self.plus()
	}
	
	method valor()
	
	method plus() {
		return zona.valor()
	}
	
	method serReservada() {
		estaReservada = true
	}
	
	method comisionPorOperacion() {
		return operacion.comision()
	}

}

class Casa inherits Inmueble {
	const valorPropiedad
	override method valor() = valorPropiedad
}

class PH inherits Inmueble {
	override method valor() = 500.max(14000 * tamanio)
}

class Departamento inherits Inmueble {
	override method valor() = 350000 * cantidadDeAmbientes
}

class Local inherits Casa {
	var tipo
	var mesesAAlquilar
	
	override method operacion() = new Alquiler(meses = mesesAAlquilar)
	
	override method valor() = tipo.precio(valorPropiedad)
	
	method remodelar(nuevoTipo) {
		tipo = nuevoTipo
	}
}

object galpon {
	method precio(valorPropiedad) = valorPropiedad / 2
}

class ALaCalle {
	const montoFijo
	method precio() = montoFijo
}


class Zona {
	//const nombre
	var property valor
}