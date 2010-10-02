/*
 *  Copyright 2010 madagascar.
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

package clewin.app;

import clewin.Complex;

import clewin.app.binding.UIComplex;
import clewin.functions.ComplexPowers;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
/**
 *
 * @author madagascar
 */
public class ComplexPowersApp {
    public UIComplex[] invoke(UIComplex start, UIComplex transform, Integer minPowers, Integer maxPowers) {
        List<UIComplex> retList = new ArrayList<UIComplex>();
        Complex _start = new Complex(start.re, start.im);
        Complex _transform = new Complex(transform.re, transform.im);
        return new ComplexPowers(_transform, _start, minPowers,maxPowers).invoke();
    }
}
