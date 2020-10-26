import Pirata.*
import CiudadCostera.*
import Mision.*

class Barco {
	
	const property tripulacion = []
	var mision
	const capacidad

	method cantidadTripulantes() {
		return tripulacion.size()
	}
	
	method tieneSuficienteTripulacion() {
		return self.cantidadTripulantes() >= capacidad * 0.9 
	}
	
	method tiene(unItem) {
		return tripulacion.any({unPirata => unPirata.tiene(unItem)})
	}
	
	method puedeFormarParteDeLaTripulacion(unPirata) {
		return self.tieneLugarParaUnoMas() && mision.esUtil(unPirata)
	}
	
	method tieneLugarParaUnoMas() {
		return self.cantidadTripulantes() < capacidad
	}
	
	method agregarTripulante(unPirata) {
		if(self.puedeFormarParteDeLaTripulacion(unPirata))
			 tripulacion.add(unPirata)
	}
	
	method cambiarMision(nuevaMision) {
		tripulacion.removeAllSuchThat({unTripulante => !nuevaMision.esUtil(unTripulante)})
		mision = nuevaMision
	}
	
	method pirataMasEbrio() {
		return tripulacion.max({unTripulante => unTripulante.nivelEbriedad() })
	}
	
	method anclarEn(unaCiudadCostera) {
		tripulacion.forEach({unTripulante => unTripulante.tomarTrago()})
		self.perderAlMasEbrio(unaCiudadCostera)	
	}
	
	method perderAlMasEbrio(unaCiudadCostera) {
		tripulacion.remove(self.pirataMasEbrio())
		unaCiudadCostera.sumarHabitante()
	}
	
	method esTemible() {
		return mision.puedeCompletarsePor(self)
	}
	
	method esSaqueablePor(unPirata) {
		return unPirata.estaPasadoDeGrog()
	}
	
	method esVulnerableA(otroBarco) {
		return self.cantidadTripulantes() <= otroBarco.cantidadTripulantes() / 2
	}
	
	method todaLatripulacionPasadaDeGrog() {
		return tripulacion.all({unPirata => unPirata.estaPasadoDeGrog()})
	}
	
	method tripulantesPasadosDeGrog() {
		return tripulacion.filter({unTripulante => unTripulante.estaPasadoDeGrog()})
	}
	
	method cantTripulantesPasadosDeGrog() {
		return self.tripulantesPasadosDeGrog().size()
	}
	
	method cantDiferentesItemsDeTripulantesPasadosDeGrog() {
		const itemsTripulacionPasadaDeGrog = self.tripulantesPasadosDeGrog().flatMap({unPirata => unPirata.items()})
		return itemsTripulacionPasadaDeGrog.asSet().size()
	}
	
	method tripulantePasadoDeGrogConMasMonedas() {
		return self.tripulantesPasadosDeGrog().max({unPirata => unPirata.cantMonedas()})
	}

}



