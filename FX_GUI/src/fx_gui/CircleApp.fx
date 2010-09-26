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
import javafx.scene.layout.VBox;
import javafx.scene.control.Label;
import javafx.scene.input.TextInput;
import javafx.scene.control.TextBox;
import javafx.scene.layout.HBox;
import javafx.scene.input.KeyEvent;

/**
 * @author Clewin
 */
public class CircleApp extends App {

    var radius: Double;
    var centerX: Double;
    var centerY: Double;
    var mainNode: CircleAppNode = CircleAppNode {
                radius: bind radius
                centerX: bind centerX
                centerY: bind centerY
            };
    var radiusBox: TextBox = TextBox {
                columns: 5
                text: "1.0"

                onKeyTyped: function(ke: KeyEvent): Void {
                    radiusBox.commit();
                    radius = Double.valueOf(radiusBox.text)

                }
            };
    var reBox: TextBox = TextBox {
                 columns: 5
                 text: "0.0"
                 onKeyTyped: function(ke: KeyEvent): Void {
                    reBox.commit();
                    centerX = Double.valueOf(reBox.text);
                 }
                }
    var imBox: TextBox = TextBox {
        columns: 5
        text: "0.0"
                onKeyTyped: function(ke: KeyEvent): Void {
                    imBox.commit();
                    centerY = Double.valueOf(imBox.text.trim());
                 }
                }

    var centerBox: HBox = HBox {
                
                
                content: [
                    reBox,
                    Label { text: "+" },
                    imBox,
                    Label { text: "i" }
                ]
                
            }

    override function getNode() {
        return mainNode;
    }

    override function getControlPanel(): Node {
        VBox {
            content: [
                Label { text: "Parameters" }
                Label { text: "Center:" },
                centerBox,
                Label { text: "Radius:" },

                radiusBox
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
