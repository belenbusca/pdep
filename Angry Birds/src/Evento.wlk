import Isla.*
import Pajaro.*

object sesionManejoDeIraConMatilda {
	
	method afectar(unPajaro) {
		unPajaro.tranquilizarse()
	}
}

class InvasionCerditos {
	var cantCerditosInvasores
	
	method afectar(unPajaro) {
		cantCerditosInvasores.div(100).times({_ => unPajaro.enojarse()})
		return new FiestaSorpresa(homenajeados = [unPajaro])
	}
}

class FiestaSorpresa {
	const homenajeados = []
	
	method afectar(unPajaro) {
		if(homenajeados.contains(unPajaro))
			unPajaro.enojarse()
		else
			throw new Exception(message = "Oops! No hay homenajeados en esta fiesta :(")
	}
}

class SerieDeEventosDesafortunados {
	const serieDeEventos = []
	
	method afectar(unPajaro) {
		serieDeEventos.forEach({unEvento => unEvento.afectar(unPajaro)})
	}
}
