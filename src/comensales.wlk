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
	override method estaSatisfecho(){return super() and not self.sonAbundantesLasComidasIngeridas()}
	method sonAbundantesLasComidasIngeridas(){return self.comidasComidas().all{c=>c.esAbundante()}}
}

class HambrePopular inherits Comensales{
	override method leAgrada(comida){return comida.esAbundante()}
}

class PaladarFino inherits Comensales{
	override method leAgrada(comida){return comida.peso()<150 and comida.peso()>300 and comida.valoracion()>100}
	override method estaSatisfecho(){return super() and self.comidasIngeridasPar()}
	method comidasIngeridasPar(){return self.comidasIngeridasPar().size()%2==0}	
}