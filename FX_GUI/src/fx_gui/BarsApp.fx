/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package fx_gui;

import javafx.scene.CustomNode;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

/**
 * @author Clewin
 */

public class BarsApp extends CustomNode {
override var children = for(x in [0..4]) {
        Rectangle {
            y: indexof x * 20
            width: 1.0
            height: 0.1
            fill:Color.RED
        }
    };
}
