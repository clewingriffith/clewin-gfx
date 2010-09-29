/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package clewin.functions

import clewin.Circle;
import clewin.Complex;

import java.util.LinkedList;
import java.util.Collection;

class CircleApp {
  def invoke() : Collection[Circle] = {
    val retList = new LinkedList[Circle]();
    retList.add(new Circle(new Complex(0.0,0.0), 1.0))
    return retList;
  } 
}
