package clewin

import clewin.app.binding.UIComplex


/**
 * Scala Complex class
 */
class Complex(val re:Double, val im:Double) {
	
	//single argument constructor assumes this is just a real number.
	def this(re:Double) = this(re, 0)
	
	override def toString() = "(" + re + ", " + im + ")"
	
	override def equals(other: Any): Boolean = {
		other.isInstanceOf[Complex] && 
		Math.abs(re-other.asInstanceOf[Complex].re)<0.001 &&
		Math.abs(im-other.asInstanceOf[Complex].im)<0.001
	}
	
	def+(other:Complex): Complex = new Complex(re+other.re, im+other.im)
	
	def-(other:Complex): Complex = new Complex(re-other.re, im-other.im)
	
	def unary_-(): Complex = new Complex(-1,0)*this
	
	def*(other:Complex): Complex = new Complex(re*other.re - im*other.im, re*other.im + im*other.re)
	
	def/(other:Complex): Complex = {
		val a = re; val b = im
		val x = other.re; val y = other.im
		return new Complex((a*x+b*y)/(x*x+y*y), (b*x-a*y)/(x*x+y*y))
	}
	
	def arg(): Double = Math.atan2(im, re)
	
	def abs(): Double = Math.sqrt(re*re + im*im)
	
	def conjugate(): Complex = new Complex(re, -im)
	
	
}

object Complex {
	
	val zero = new Complex(0,0)
	
	val inf = new Complex(Math.POS_INF_DOUBLE, 0)
	
	def arg(c:Complex) = c.arg
	
	def abs(c:Complex) = c.abs
	
	def sqrt(c:Complex): Complex = 	{
		val U2 = 0.5*(c.re + c.abs)
		val u = Math.sqrt(U2)
		val v = c.im/(2*u)
		return new Complex(u, v);
	}

}