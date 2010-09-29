package clewin

class Mobius(val T: Matrix) {

  //Can't have ad-bc==0
  assert((T.a*T.d) - (T.b*T.c) != Complex.zero)
  
  def this(a: Complex, b: Complex, c: Complex, d: Complex) = this(new Matrix(a, b, c, d))

  def apply(z: Complex): Complex = {
    if (z == Complex.inf) {
      if (T.c != 0)
        return T.a / T.c
      else
        return Complex.inf
    } else {
      val num = (T.a * z + T.b)
      val den = (T.c * z + T.d)
      if (den == 0)
        return Complex.inf
      else
        return num / den
    }
  }
}
