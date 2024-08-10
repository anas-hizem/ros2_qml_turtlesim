import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("ROS2 Turtlesim QML Controller")

    Column {
        anchors.centerIn: parent
        spacing: 10
        
        Slider {
            id: speedSlider
            from: 0.1
            to: 3.0
            value: 1.0
            stepSize: 0.1
            onValueChanged: {
                rclComm.set_speed(speedSlider.value)
            }
        }

        Button {
            text: "Avant"
            onClicked: rclComm._pub_msgs(0)
        }

        Button {
            text: "Arrière"
            onClicked: rclComm._pub_msgs(1)
        }

        Row {
            spacing: 10

            Button {
                text: "Gauche"
                onClicked: rclComm._pub_msgs(2)
            }

            Button {
                text: "Droite"
                onClicked: rclComm._pub_msgs(3)
            }
        }

        Row {
            spacing: 10

            Button {
                text: "Avant Gauche"
                onClicked: rclComm._pub_msgs(5)
            }

            Button {
                text: "Avant Droite"
                onClicked: rclComm._pub_msgs(6)
            }
        }

        Row {
            spacing: 10

            Button {
                text: "Arrière Gauche"
                onClicked: rclComm._pub_msgs(7)
            }

            Button {
                text: "Arrière Droite"
                onClicked: rclComm._pub_msgs(8)
            }
        }
    }
}

