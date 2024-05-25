
class Pared {
	var property position
	
	method movete(direccion) {
		throw new DomainException(message = "No puedes mover las paredes.")
	}
	
	method puedePisarte(_) = false
	method image() = "muro.png"
}