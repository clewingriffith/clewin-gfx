package clewin.scala

import org.scalatest.junit.AssertionsForJUnit
import org.junit.Assert._;
import org.junit.Test;

class MobiusTest extends AssertionsForJUnit {

	implicit def double2complex(x: Double) = new Complex(x)
	
	@Test
	def testInvalid() {
		//shouldn't allow transforms where ad-bc==0
		try {
			val m = new Mobius(
					2, 3,
					4, 6)
			fail("Mobius constructor should throw exception")
		}
		catch {
			case e: AssertionError => {} //success;
		}
	}
	
	@Test
	def testIdentity() {
		val ident = new Matrix(
				1, 0,
				0, 1)
		
		val mobius = new Mobius(ident)
		
		val z = new Complex(-4, 17);
		assertEquals(z, mobius(z))
	}
	
	@Test
	def testTranslation() {
		
		val b = new Complex(2,3) //amount to move by
		val z = new Complex(-4, 17) //thing to move
		
		val trans = new Mobius(
				1, b, 
				0, 1)
		//trans(z) should move z by b
		assertEquals(z+b, trans(z))
	}
	
}