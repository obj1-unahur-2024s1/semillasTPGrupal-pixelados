import semillas.*

class Parcela{
	const property ancho
	const property largo
	const property horasDeSolQueRecibe
	const property plantas = []
	
	method plantar(planta){
		if(self.cantidadPlantas()+1<=self.plantasMaximas())
			if(horasDeSolQueRecibe-planta.horasDeSolQueTolera()<=2)
				plantas.add(planta)
			else
				self.error("Esta planta no resiste tantas horas de sol")
		else self.error("parcela completa")
	}
	method sacarPlanta(planta){if(plantas.contains(planta)) plantas.remove(planta)}
	method superficie() = ancho*largo
	method plantasMaximas() = if(ancho>largo) self.superficie().div(5) else 3+(self.superficie().div(3))
	method cantidadPlantas() = plantas.size()
	method tieneComplicaciones() = plantas.any({p=>p.horasDeSolQueTolera()<horasDeSolQueRecibe})	
}

class ParcelaEcologica inherits Parcela{
	method seAsocia(planta) = planta.leResultaIdeal(self) and not self.tieneComplicaciones()
}

class Parcelaindustrial inherits Parcela{
	method seAsocia(planta) = self.cantidadPlantas()<=2 and planta.esFuerte()	
}