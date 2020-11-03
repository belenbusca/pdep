import Arma.*
import Rango.*
import Traicion.*
import Arma.*

class Familia {
	
	const miembros = [don]
	var don
	const traiciones = []
	
	method durmiendoConLosPeces() {
		miembros.any({unFamiliar => unFamiliar.estaMuerto()})
	}
	
	method peligroso() {
		return self.vivos().max({unFamiliar => unFamiliar.cantArmas()})
	}
	
	method vivos() {
		return miembros.filter({unFamiliar => unFamiliar.estaVivo()})
	}
	
	method elQueQuieraEstarArmadoQueAndeArmado() {
		miembros.forEach({unFamiliar => unFamiliar.agregarArma(new Revolver(cantBalas = 6))})
	}
	
	method elegancia() {
		return miembros.any({familiar => familiar.sabeDespacharElegantemente()})
	}
	
	method ataqueSorpresa(unaFamilia) {
		
		miembros.forEach({unFamiliar => unFamiliar.ataqueSorpresa(unaFamilia)})
	}
	
	method estanTodosMuertos() {
		miembros.all({miembro => miembro.estaMuerto()})
	}
	
	method luto() {
		
		miembros.forEach({miembro => miembro.reorganizarse()})
		
	}
	
	method lealtadPromedio() {
		const lealtadFamiliar = miembros.sum({mimebro => mimebro.lealtad()})
		return lealtadFamiliar / self.cantMiembros()
	}
	
	method cantMiembros() {
		return miembros.size()
	}
	
	method memorarTraicion(unaTraicion) {
		traiciones.add(unaTraicion)
	}
	
	method matarTraidor(unTraidor) {
		unTraidor.morir()
	}
	
	method perderMiembro(unMiembro) {
		miembros.remove(unMiembro)
	}
	
	method incorporarMiembro(unMiembro) {
		miembros.add(unMiembro)
	}
	
}

class MiembroDeFamilia {
	var lealtad
	var rango = new Soldado()
	const armas = [escopeta]
	var estaVivo = true
	var estaHerido = false

	method lealtad() {
		return lealtad
	}
	
	method morir() {
		estaVivo = false
	}
	
	method serHerida() {
		estaHerido = true
	}
	
	method estaMuerto() {
		return !estaVivo
	}
	
	method estaHerido() {
		return estaHerido
	}
	
	method estaVivo() {
		return estaVivo
	}
	
	method atacar(victima) {
		rango.atacar(victima, armas)
	}
	
	method cantArmas() {
		return armas.size()
	}
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	method sabeDespacharElegantemente() {
		return rango.sabeDespacharElegantemente(self)
	}
	
	method tieneArmaSutil() {
		return armas.any({unArma => unArma.esSutil()})
	}
	
	method ataqueSorpresa(unaFamilia) {
		if(unaFamilia.estanTodosMuertos())
			throw new Exception(message= "Todos los miembros de la familia enemiga fueron asesinados")
		
		const masPeligroso = unaFamilia.peligroso()
		self.atacar(masPeligroso)
		
	}
	
	method aumentarLealtad(unPorcentaje) {
		lealtad += unPorcentaje
	}
	
	method reorganizarse() {
		self.aumentarLealtad(10)
		rango.reorganizar(self)
	}
	
	method cambiarRango(unRango) {
		rango = unRango
	}
	
	method traicionar(unaFamilia, primerVictima) {
		const traicion = new Traicion(primerVictima = primerVictima)
		unaFamilia.memorarTraicion(traicion)
		if(unaFamilia.lealtadPromedio() > 2 * lealtad)
			unaFamilia.matarTraidor(self)
		else
			traicion.concretasePor(self)
			
	}
	
	method abandonarFamilia(viejaFamilia) {
		viejaFamilia.perderMiembro(self)
	}
	
	method unirseANuevaFamilia(nuevaFamilia) {
		nuevaFamilia.incorporarMiembro(self)
	}
	
	method convertirseEnSoldado() {
		self.cambiarRango(new Soldado())
	}
}


