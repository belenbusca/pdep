
class Arma {
	method matar(victima) {
		victima.morir()
	}
}

class Revolver inherits Arma {
	var cantBalas
	method disparar(unaVictima) {
		if(cantBalas > 0)
			self.matar(unaVictima)
			cantBalas --
	}
	
	method esSutil() {
		return cantBalas == 1
	}
}

object escopeta inherits Arma {
	
	method disparar(unaVictima) {
		if(unaVictima.estaHerido())
			self.matar(unaVictima)
		else 
			unaVictima.serHerida()
	}
	
	method esSutil() {
		return false
	}
	
}

class CuerdaDePiano inherits Arma {
	
	var esBuenaCalidad
	
	method disparar(victima) {
		if(esBuenaCalidad) self.matar(victima)
	}
	
	method esSutil() {
		return true
	}
}
