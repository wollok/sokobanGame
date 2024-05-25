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
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		posParedes.addAll([new Position(x=3,y=5), new Position(x=4,y=5), new Position(x=5,y=5)])
		posParedes.addAll([new Position(x=1,y=2), new Position(x=2,y=2),new Position(x=6,y=2), new Position(x=7,y=2)])
		posParedes.addAll([new Position(x=1,y=1), new Position(x=2,y=1),new Position(x=6,y=1), new Position(x=7,y=1)])
	
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }	
		
//	LLEGADAS
		var llegadas = [new Position(x=4, y=4), new Position(x=4, y=3),new Position(x=4, y=2), new Position(x=4, y=1)]
			.map{ p => self.dibujar(new Llegada(position = p)) }

//	CAJAS
		var cajas = [new Position(x=2, y=4), new Position(x=6, y=4), new Position(x=4, y=2), new Position(x=5, y=2)]
			.map{ p => self.dibujar(new Caja(position = p, llegadas = llegadas)) }
			
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
			game.say(sokoban, "GANASTE!") 
		}
	}
}