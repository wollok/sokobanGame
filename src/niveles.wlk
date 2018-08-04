import caja.*
import pared.*
import sokoban.*
import llegada.*
import wollok.game.*

object nivel1 {
	
	method cargar() {
		
//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, 0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(0, n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(ancho, n)) } // bordeDer
		
		posParedes.addAll([new Position(3,5), new Position(4,5), new Position(5,5)])
		posParedes.addAll([new Position(1,2), new Position(2,2),new Position(6,2), new Position(7,2)])
		posParedes.addAll([new Position(1,1), new Position(2,1),new Position(6,1), new Position(7,1)])
	
		posParedes.forEach { p => self.dibujar(new Pared(p)) }	
		
//	LLEGADAS
		var llegadas = [new Position(4, 4), new Position(4, 3),new Position(4, 2), new Position(4, 1)]
			.map{ p => self.dibujar(new Llegada(p)) }

//	CAJAS
		var cajas = [new Position(2, 4), new Position(6, 4), new Position(4, 2), new Position(5, 2)]
			.map{ p => self.dibujar(new Caja(p, llegadas)) }
			
//	SOKOBAN

		game.addVisual(sokoban)

//	TECLADO
		keyboard.up().onPressDo{ sokoban.irArriba() }
		keyboard.down().onPressDo{ sokoban.irAbajo() }
		keyboard.left().onPressDo{ sokoban.irIzquierda() }
		keyboard.right().onPressDo{ sokoban.irDerecha() }

		keyboard.r().onPressDo{ self.restart() }
		keyboard.any().onPressDo{ self.comprobarSiGano(cajas) }
		
		
//	COLISIÓNES
		game.whenCollideDo(sokoban, { e => sokoban.empuja(e) })
	}
	
	method restart() {
		game.clear()
		self.cargar()
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method comprobarSiGano(cajas) {
		if (cajas.all{ c => c.estaBienPosicionada() }) {
			console.println("GANASTE!") 
			//game.clear()
		}
	}
}