package clewin

/**
 * Matrix of form
 * 
 * a b
 * c d
 */
class Matrix(val a: Complex, val b: Complex, val c: Complex, val d: Complex) {

	//TODO: function, not defined on creation.
  val determinant: Complex = a * d - b * c

  def normalized(): Matrix = {
    val rootD = Complex.sqrt(this.determinant)
    return new Matrix(
      a / rootD, b / rootD,
      c / rootD, d / rootD)
  }

  def inverse(): Matrix = {
    val D = this.determinant
    return new Matrix(
      d / D, -b / D,
      -c / D, a / D)
  }

  def *(o: Matrix): Matrix =
    new Matrix(
      a * o.a + b * o.c, a * o.b + b * o.d,
      c * o.a + d * o.c, c * o.b + d * o.d)

}