
class Pared {
	var property position
	
	constructor(_position) {
		position = _position
	}
	
	method movete(direccion) {
		throw new Exception("No puedes mover las paredes.")
	}
	
	method puedePisarte(_) = false
	method image() = "muro.png"
}