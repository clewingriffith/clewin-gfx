/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package clewin

class Circle(val center: Complex, val radius:Double) {
  def getCenterX(): Double = center.re
  def getCenterY(): Double = center.im
  def getRadius(): Double = radius
}
