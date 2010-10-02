/*
 *  Copyright 2010 Clewin Griffith.
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *       http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *  under the License.
 */

package clewin.functions

import clewin.Complex;

/**
 * Take a complex number z and multiply by a for a sequence of powers
 * eg. if minPower is -2 and maxPower is 2, it will return the sequence
 * a^-2*z, a^1*z, z, a*z, a^2*z
 *
 * @param a the transformation to apply
 */
class ComplexPowers(a:Complex, z:Complex, minPower:Int, maxPower:Int) {

  def invoke() : Array[clewin.app.binding.UIComplex] = {
    _invoke().map(x => new clewin.app.binding.UIComplex(x.re, x.im))
  }

  def _invoke() : Array[Complex] = {
    //2,5
    val powers = if(minPower==maxPower) (minPower to maxPower) else (minPower to maxPower)
    System.out.println(powers)
    return powers.map(p => raiseToPower(p)).toArray
  }


  def raiseToPower(p:Int):Complex = {
    if(p>0) {
      //generate the sequence a,a,a,a p times.
      val as = Array.fill(p)(a)
      //repetitively multiply a by z. ie. a*a*a..*z
      System.out.println(as.foldRight(z){_*_})
      as.foldLeft(z){_*_}
    } else if (p==0){
      z
    } else {
      val as = Array.fill(-p)(a)
      as.foldLeft(z){_/_}
    }
  }

}
