/*
Quizás en esta estaSatisfecho() de comenzal convenia delegar en un método auxiliar el cálculo del peso de lo que comió
La condición adicion de ```estaSatisfecho()``` de Vegetarianos no esta bien."La condición adicional para estar satisfechos es que ninguna comida de las ingeridas sea abundante.". En el codigo te deje un posible solución correcta.
Recordá que podes usar el mensaje ```numero.even()``` a un número para saber si es par.
*/
import comidas.*

class Comensales {
	var property peso
	var property comidasComidas=[]
	
	method comer(comida){comidasComidas.add(comida)}
	method leAgrada(comida)
	method estaSatisfecho(){return self.comidasComidas().all{c=>c.peso()>peso*0.01}}
	
}


class Vegetarianos inherits Comensales{
	override method leAgrada(comida){return comida.esVegetariano()}
	override method estaSatisfecho(){return super() and self.ninguaEsAbundantesLasComidasIngeridas()}
	method ninguaEsAbundantesLasComidasIngeridas(){return self.comidasComidas().all{c=> not c.esAbundante()}}
}

class HambrePopular inherits Comensales{
	override method leAgrada(comida){return comida.esAbundante()}
}

class PaladarFino inherits Comensales{
	override method leAgrada(comida){return comida.peso()<150 and comida.peso()>300 and comida.valoracion()>100}
	override method estaSatisfecho(){return super() and self.comidasIngeridasPar()}
	method comidasIngeridasPar(){return self.comidasIngeridasPar().size()%2==0}	
}