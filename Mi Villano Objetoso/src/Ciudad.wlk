class Ciudad {
	
	var grados = 0
	const objetos = []
	
	method disminuirTemperatura(unosGrados) {
		grados -= unosGrados
	}
	
	method perderObjetoRobado(unObjeto) {
		objetos.remove(unObjeto)
	}
}
