class Planta{
	const property anioObtencion
	const property altura
	
	method horasDeSolQueTolera()
	method esFuerte() = self.horasDeSolQueTolera()>10
	method daSemillas() = self.esFuerte()
	method espacioQueOcupa()
	method leResultaIdeal(parcela)
}

class Menta inherits Planta{
	override method horasDeSolQueTolera() = 6
	override method daSemillas() = super() or altura>0.4
	override method espacioQueOcupa() = altura*3
	override method leResultaIdeal(parcela) = parcela.superficie()>6
}

class Soja inherits Planta{
	override method horasDeSolQueTolera() = if(altura<0.5) 6 else if(altura.between(0.5,1)) 7 else 9
	override method daSemillas() = super() or anioObtencion>2007 and altura>1
	override method espacioQueOcupa() = altura*0.5
	override method leResultaIdeal(parcela) = parcela.horasDeSolQueRecibe() == self.horasDeSolQueTolera()
}

class Quinoa inherits Planta{
	const horasDeSolQueTolera
	override method horasDeSolQueTolera() = horasDeSolQueTolera
	override method daSemillas() = super() or anioObtencion<2005
	override method espacioQueOcupa() = 0.5
	override method leResultaIdeal(parcela) = parcela.plantas().all({p=>p.altura()<1.5})
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	override method leResultaIdeal(parcela) = parcela.plantasMaximas() == 1
}

class MentaHierbaBuena inherits Menta{
	override method espacioQueOcupa() = super()*2
}