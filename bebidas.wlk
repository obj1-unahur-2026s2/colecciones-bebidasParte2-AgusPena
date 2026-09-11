object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuado {
  var nutrientes = []
  method agregarNutriente(nutriente) {
    nutrientes.add(nutriente)
}

method rendimientoQueOtorga(dosisConsumida) = nutrientes.sum() * dosisConsumida / 1000
}

object aguaSaborizada {
  var bebida = whisky
  method prepararCon(bebidaNueva) {
    bebida = bebidaNueva
}
method rendimientoQueOtorga(dosisConsumida) =1 + bebida.rendimientoQueOtorga(dosisConsumida / 4)
}

object coctel {
  var bebidas = []

  method agregarBebida(bebida) {
    bebidas.add(bebida)
  }

  method rendimientoQueOtorga(dosisConsumida) =
    if (bebidas.isEmpty()) 1
    else bebidas.fold(1, { acumulado, bebida =>
      acumulado * bebida.rendimientoQueOtorga(dosisConsumida / bebidas.size())
    })
}
