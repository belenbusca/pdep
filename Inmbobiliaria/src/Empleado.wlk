import Inmueble.*
import Operacion.*
import Reserva.*

class Empleado {
	const operacionesCerradas = #{}
	const reservas = #{}
	var montoCobrado = 0
	
	method totalDeComisiones() {
		return operacionesCerradas.sum{ propiedad => propiedad.comisionPorOperacion() }
	}
	
	method cantidadOperacionesCerradas() {
		return operacionesCerradas.size()
	}
	
	method cantidadDeReservas() {
		return reservas.size()
	}
	
	method vaATenerProblemasCon(otroEmpleado) {
		//return self.cerroOperacionEnMismaZonaQue(otroEmpleado) and self.concretoOperacionQueReservo(otroEmpleado) or otroEmpleado.concretoOperacionQueReservo(self)
	}
	
	method concretoOperacionQueReservo(otroEmpleado) {
		return operacionesCerradas.any{ propiedad => otroEmpleado.reservo(propiedad)}
	}
	
	method reservo(propiedad) {
		return reservas.any{ reserva => reserva.propiedadReservada() == propiedad}
	}
	
	method reservarPara(cliente, propiedad) {
		if(propiedad.puedeSerReservada()) {
			const reserva = new Reserva(clienteSolicitante = cliente, propiedadReservada = propiedad)
			propiedad.serReservada()	
			reservas.add(reserva)
		}	
	}
	
	method cerroOperacionEnMismaZonaQue(otroEmpleado) {
		return self.zonasDondeConcretoOperaciones().any{ unaZona => otroEmpleado.operoEnZona(unaZona) }
	}
	
	method operoEnZona(unaZona) {
		return self.zonasDondeConcretoOperaciones().contains(unaZona)
	}
	
	method zonasDondeConcretoOperaciones() {
		return operacionesCerradas.map{ propiedad => propiedad.zona() }.asSet()
	}
	
	method concretarOperacion(propiedad, cliente) {
		if(propiedad.estaReservada() and !self.fueReservadaPara(propiedad, cliente))
			throw new Exception(message = "Esta propiedad ya fue reservada para otro cliente")
		operacionesCerradas.add(propiedad)
		self.cobrarComision(propiedad)
	}
	
	method fueReservadaPara(propiedad, cliente) {
		return reservas.any{ reserva => reserva.propiedadReservada() == propiedad && reserva.clienteSolicitante() == cliente }
	}
	
	method cobrarComision(propiedad) {
		montoCobrado += propiedad.comisionPorOperacion()
	}
}
