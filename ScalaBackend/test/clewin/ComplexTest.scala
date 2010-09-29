package clewin.scala

import org.scalatest.junit.AssertionsForJUnit

import org.junit.Assert._;
import org.junit.Test;

class ComplexTest extends AssertionsForJUnit {

	val EPSILON = 0.0001;
	
	@Test
	def testCreate(): Unit = {
		val c = new Complex(3,2)
		assertEquals(3, c.re, EPSILON)
		assertEquals(2, c.im, EPSILON)
	}
	
	@Test
	def testEquals(): Unit = {
		val c1 = new Complex(3,5);
		val c2 = new Complex(3,5);
		val c3 = new Complex(4,7);
		
		assertTrue(c1.equals(c2));
		assertTrue(c1 == c2);
		assertTrue(c2.equals(c1));
		assertTrue(c2 == c1);
		assertFalse(c1.equals(c3));
		assertFalse(c1 == c3);
		assertFalse(c3.equals(c2));
		assertFalse(c3 == c2);
	}
	
	@Test
	def testRealOnly() {
		val r = new Complex(4)
		assertEquals(new Complex(4,0), r)
	}
	
	@Test 
	def implicitRealConversion() {
		assertEquals(new Complex(4), 4)
	}
	
	@Test
	def testPlus(): Unit = {
		val c1 = new Complex(3,2)
		val c2 = new Complex(4,-3)
		val expected = new Complex(7, -1)
		assertEquals(expected, (c1+c2))
	}
	
	@Test
	def testMinus(): Unit = {
		val c1 = new Complex(3,2)
		val c2 = new Complex(4,-3)
		val expected = new Complex(-1, 5)
		assertEquals(expected, (c1-c2))
	}
	
	@Test
	def testUnaryMinus() {
		val c1 = new Complex(3,0)
		assertEquals(new Complex(-3,0), -c1)
		val c2 = new Complex(2,2)
		assertEquals(new Complex(-2,-2), -c2)
	}
	
	@Test
	def testTimes(): Unit = {
		val c1 = new Complex(3,4)
		val c2 = new Complex(2,-3)
		val expected = new Complex(18,-1)
		assertEquals(expected, c1*c2)
		assertEquals(expected, c2*c1)
	}
	
	@Test
	def testDivide(): Unit = {
		val c1 = new Complex(1,0)
		val c2 = new Complex(2,1)
		val expected = new Complex(0.4,-0.2)
		assertEquals(expected, c1/c2)
		assertEquals(c2, c2/c1)
	}
	
	@Test
	def testArg(): Unit = {
		val c1 = new Complex(1,0)
		assertEquals(0, c1.arg, EPSILON)
		val c2 = new Complex(1,1)
		assertEquals(0.25*Math.Pi, c2.arg, EPSILON)
		val c3 = new Complex(0,1)
		assertEquals(0.5*Math.Pi, c3.arg, EPSILON)	
		
		//alt syntax
		assertEquals(0.25*Math.Pi, Complex.arg(c2), EPSILON)
	}
	
	@Test
	def testAbs() {
		val c1 = new Complex(1,0)
		assertEquals(1, c1.abs, EPSILON)
		assertEquals(1, Complex.abs(c1), EPSILON)
		val c2 = new Complex(0,-1)
		assertEquals(1, c2.abs, EPSILON)
		val c3 = new Complex(-1,-1)
		assertEquals(Math.sqrt(2), c3.abs, EPSILON)
	}
	
	@Test
	def testSqrt() {
		 val c1 = new Complex(2,0)
		 assertEquals(new Complex(Math.sqrt(2),0), Complex.sqrt(c1))
		 
	}
}