/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fx_gui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.scene.layout.VBox;
import javafx.scene.control.Label;

/**
 * Draw a circle with different radius and center
 */
public class CircleApp extends App {

    var centerInput: ComplexInput;
    var radiusInput: ScalarInput;

    var mainNode: CircleAppNode = CircleAppNode {
                radius: bind radiusInput.value;
                centerX: bind centerInput.re
                centerY: bind centerInput.im
            };
    

    override function getNode() {
        return mainNode;
    }

    override function getControlPanel(): Node {
        VBox {
            spacing: 5
            content: [
                Label { text: "Parameters" }

                radiusInput = ScalarInput { label: "Radius", value: 1.0 }
                
                centerInput = ComplexInput { label: "Center:" }
            ]
        };

    }

}

public class CircleAppNode extends CustomNode {

    public-init var radius: Number;
    public-init var centerX: Number;
    public-init var centerY: Number;
    override var children = [
               Circle {
                    fill: Color.TRANSPARENT
                    stroke: Color.BLACK
                    strokeWidth: 0.0

                    centerX: 0
                    centerY: 0
                    radius: 1.0
                },
                Circle {
                    fill: Color.TRANSPARENT
                    stroke: Color.GREEN
                    strokeWidth: 0.0

                    centerX: bind centerX
                    centerY: bind centerY
                    radius: bind radius
                }
            ]
}
