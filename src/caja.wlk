
class Caja {
	const property posicion
	const property llegadas
	
	constructor(_posicion, _llegadas) {
		llegadas = _llegadas
		posicion = _posicion
	}
	

	method movete(direccion) {
		self.validarLugarLibre(direccion) 
		direccion.move(posicion)
	}

	method validarLugarLibre(direccion) {
		const posAlLado = direccion.posicionDeAlLado(posicion) 
		var lugarLibre = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		
		if (!lugarLibre) 
			throw new Exception("Algo traba la caja.")
	}
	
	method puedePisarte(_) = false

	method imagen() {
		if (self.estaBienPosicionada())
			return "caja_ok.png"
		
		return "caja.png"
	}
	
	method estaBienPosicionada() {
		return llegadas
			.map{ llegada => llegada.posicion() }
			.contains(self.posicion()) //TODO: Redefinier el (==) en Position!
	}
	
}