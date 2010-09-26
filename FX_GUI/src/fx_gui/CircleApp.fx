/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fx_gui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

/**
 * @author Clewin
 */
public class CircleApp extends CustomNode {
    override var children = [
        Circle {
            fill:Color.BLUE
            strokeWidth:0.0
            
                        centerX: 0 centerY: 0
                        radius: 1
                    },
         Circle {
            fill:Color.GREEN
            strokeWidth:0.0

                        centerX: 0 centerY: 0
                        radius: 0.5
                    }
         ]
    
 

}
