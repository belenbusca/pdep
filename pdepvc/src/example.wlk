class Archivo {
	
	const property nombre
	var contenido 
}


class Carpeta {
	
	const nombre 
	const archivos = #{}
	
	method contieneArchivo(unNombre) {
		archivos.any{(unArchivo => unArchivo.nombre() == unNombre)}
	}
}