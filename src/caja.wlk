import wollok.game.*

class Caja {
	var property position
	const property llegadas
	
	method movete(direccion) {
		self.validarLugarLibre(direccion) 
		position = direccion.siguiente(position)
	}

	method validarLugarLibre(direccion) {
		const posAlLado = direccion.siguiente(position) 
		var lugarLibre = game.getObjectsIn(posAlLado)
			.all{ obj => obj.puedePisarte(self) } 
		
		if (!lugarLibre) 
			throw new Exception("Algo traba la caja.")
	}
	
	method puedePisarte(_) = false

	method image() {
		if (self.estaBienPosicionada())
			return "caja_ok.png"
		
		return "caja.png"
	}
	
	method estaBienPosicionada() {
		return llegadas
			.map{ llegada => llegada.position() }
			.contains(self.position()) //TODO: Redefinir el (==) en Position!
	}	
}
