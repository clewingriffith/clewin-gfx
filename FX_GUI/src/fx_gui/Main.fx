/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fx_gui;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.control.Separator;
import javafx.scene.control.ListView;
import javafx.scene.layout.LayoutInfo;
import java.util.HashMap;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.shape.Rectangle;
import javafx.scene.input.MouseEvent;
import javafx.scene.transform.Transform;
import javafx.scene.layout.Container;
import javafx.scene.layout.Stack;
import javafx.scene.shape.Line;
import javafx.scene.layout.ClipView;
import javafx.scene.layout.Panel;
import javafx.geometry.VPos;
import javafx.geometry.HPos;
import fx_gui.ComplexPowersApp;

/**
 * @author clewin
 */
def appMap = new HashMap();

appMap.put("Circle", new CircleApp());
//appMap.put("Bars", new BarsApp());
appMap.put("Axes", new Axes());
appMap.put("ComplexPowers", new ComplexPowersApp());
var appSeq: String[] = for (k in appMap.keySet()) { k as String };
//var keyset:String[] = bind appMap.key
var appListView: ListView;
//var currentApp:Node = bind appMap.get(appListView.selectedItem as String) as Node;
var currentApp: Node = bind appMap.get("CircleApp") as Node;
def scale_per_wheelmove = 0.2;
var scale = 1.0;
def TOOLBAR_WIDTH = 100;
var screenScale = 400;

Stage {
    title: "GFX Zoo"
    scene: Scene {
        var xOffset: Number = 0.0;
        var yOffset: Number = 0.0;
        width: 400
        height: 400
        fill: Color.WHITE
        content: [

            //Separate the main canvas on the right from the controls on the left
            HBox {
                spacing: 20

                content: [

                    VBox {
                        content: [
                            appListView = ListView {
                                        items: appSeq
                                        layoutInfo: LayoutInfo { width: TOOLBAR_WIDTH height: 100 }
                                    }
                            Panel {
                                width: TOOLBAR_WIDTH
                                content: bind (appMap.get(appListView.selectedItem as String) as App).getControlPanel()
                            }
                        ]
                    },

                    ClipView {
                        pannable: true

                        node: Stack {

                            nodeVPos: VPos.TOP
                            nodeHPos: HPos.LEFT
                            content: [
                                Rectangle {
                                    fill: Color.DARKGRAY
                                    width: 400
                                    height: 400
                                },
                                Group {

                                    transforms: [Transform.translate(200, 200), Transform.scale(200, -200, 0, 0)]
                                    content: bind (appMap.get(appListView.selectedItem as String) as App).getNode();
                                },
                                VBox {
                                    content: [
                                Text {
                                    fill: Color.BLACK
                                    x: 10
                                    y: 20
                                    content: bind "Position: ({xOffset},{yOffset})"
                                },
                                Text {
                                    fill: Color.BLACK
                                    x: 10
                                    y: 30
                                    content: bind "Scale: ({xOffset},{yOffset})"
                                }]
                                }
                            ]
                        }
                    } //ClipView
                ] //HBox content
            }//HBox

        ] //scene content
    }//scene
}
