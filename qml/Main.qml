import QtQuick
import QtQuick.Controls
import Postbox

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Postbox")

    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor

        Column {
            anchors.centerIn: parent
            spacing: 16

            Rectangle {
                width: 320
                height: 80
                radius: 10
                color: Theme.elementColor
                border.color: Theme.outlineColor
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: "Inbox Preview"
                    color: Theme.bodyTextColor
                    font.pixelSize: 20
                }
            }

            Rectangle {
                width: 320
                height: 80
                radius: 10
                color: Theme.focusedColor

                Text {
                    anchors.centerIn: parent
                    text: "Selected Item"
                    color: Theme.bodyTextColor
                    font.pixelSize: 20
                }
            }

            Text {
                text: "Accent sample text"
                color: Theme.accentColor
                font.pixelSize: 18
            }
        }
    }
}