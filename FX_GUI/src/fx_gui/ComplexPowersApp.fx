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

package fx_gui;

import javafx.scene.layout.VBox;
import javafx.scene.control.Label;
import javafx.scene.Node;
import javafx.scene.Group;
import clewin.app.binding.UIComplex;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;


/**
 * Take a point and multiply it by a complex transformation a number of times
 * Draw a new object in each place.
 */
public class ComplexPowersApp extends App  {
    //The transformation
    var transInput: ComplexInput;
    
    //The powers we want to display
    var minPower: IntInput;
    var maxPower: IntInput;

    //The start point
    var startInput: ComplexInput;

    var backend: clewin.app.ComplexPowersApp = new clewin.app.ComplexPowersApp();

    override function getNode() {
        
        
        Group {
            content: bind for (p in backend.invoke(new UIComplex(startInput.re, startInput.im),
        new UIComplex(transInput.re, transInput.im),
        minPower.value,maxPower.value )) {
                Circle {
                        centerX: p.re
                        centerY: p.im
                        radius: 0.1
                        fill: Color.BLUEVIOLET
                    }
            }

            
        }

    }

    override function getControlPanel(): Node {
        VBox {
            spacing: 5
            content: [
                Label { text: "Parameters" }

                startInput = ComplexInput { label: "Start: " }
                transInput = ComplexInput { label: "Multiplier:" }
                minPower = IntInput { label: "Min powers" }
                maxPower = IntInput { label: "Max powers" }
            ]
        };

    }

}
