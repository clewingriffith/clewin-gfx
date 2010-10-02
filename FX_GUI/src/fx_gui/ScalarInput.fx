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

import javafx.scene.control.TextBox;
import javafx.scene.control.Label;
import javafx.scene.CustomNode;
import javafx.scene.layout.HBox;
import javafx.geometry.VPos;
import javafx.scene.input.KeyEvent;

/**
 * Number input with label
 */

public class ScalarInput extends CustomNode {

    public-init var label: String;
    public var value: Number;

    var numBox: TextBox;

    override var children = [
                HBox {
                    spacing: 5
                    nodeVPos: VPos.BASELINE;
                    content: [Label { text: bind label },
                        
                        numBox = TextBox {
                                    columns: 4
                                    text: "0.0"
                                    onKeyTyped: function(ke: KeyEvent): Void {
                                        numBox.commit();
                                        value = Double.valueOf(numBox.text);
                                    }
                                },
                    ]
                }
            ]
}

