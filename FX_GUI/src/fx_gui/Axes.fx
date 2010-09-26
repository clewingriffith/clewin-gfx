/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fx_gui;

import javafx.scene.CustomNode;
import javafx.scene.shape.Line;
import javafx.scene.paint.Color;

/**
 * @author Clewin
 */
public class Axes extends App {

    var mainNode: AxesNode = AxesNode {};

    override function getNode() {
        return mainNode;
    }

}

public class AxesNode extends CustomNode {

    override var children = [
                Line {
                    startX: -1.0
                    startY: 0.0
                    endX: 1.0
                    endY: 0.0
                    fill: Color.RED
                    strokeWidth: 0.0
                },
                Line {
                    startX: 0.0
                    startY: -1.0
                    endX: 0.0
                    endY: 1.0
                    fill: Color.BLUE
                    strokeWidth: 0.0
                }
            ]
}
