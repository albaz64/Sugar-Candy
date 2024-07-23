import Qt5Compat.GraphicalEffects
import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    id: sessionButton

    property int selectedSession: selectSession.currentIndex
    property string textConstantSession
    property int loginButtonWidth
    property Control exposeSession: selectSession

    height: root.font.pointSize
    width: parent.width / 2
    anchors.horizontalCenter: parent.horizontalCenter

    ComboBox {
        id: selectSession

        hoverEnabled: true
        anchors.left: parent.left
        Keys.onPressed: {
            if (!popup.opened) {
                if (event.key === Qt.Key_Up) {
                    if (loginButton.state !== "enabled") {
                        revealSecret.focus = true;
                        revealSecret.state = "focused";
                    } else if (loginButton.state === "enabled") {
                        loginButton.focus = true;
                        loginButton.state = "focused";
                    }
                    currentIndex += 1;
                } else if (event.key === Qt.Key_Down) {
                    systemButtons.children[0].focus = true;
                    systemButtons.children[0].state = "focused";
                    currentIndex -= 1;
                } else if (event.key === Qt.Key_Left || event.key === Qt.Key_Right) {
                    popup.open();
                }
            }
        }
        model: sessionModel
        currentIndex: model.lastIndex
        textRole: "name"
        states: [
            State {
                name: "pressed"
                when: selectSession.down

                PropertyChanges {
                    target: displayedItem
                    color: Qt.darker(root.palette.highlight, 1.1)
                }

                PropertyChanges {
                    target: selectSession.background
                    border.color: Qt.darker(root.palette.highlight, 1.1)
                }

            },
            State {
                name: "hovered"
                when: selectSession.hovered

                PropertyChanges {
                    target: displayedItem
                    color: Qt.lighter(root.palette.highlight, 1.1)
                }

                PropertyChanges {
                    target: selectSession.background
                    border.color: Qt.lighter(root.palette.highlight, 1.1)
                }

            },
            State {
                name: "focused"
                when: selectSession.visualFocus

                PropertyChanges {
                    target: displayedItem
                    color: root.palette.highlight
                }

                PropertyChanges {
                    target: selectSession.background
                    border.color: root.palette.highlight
                }

            }
        ]
        transitions: [
            Transition {
                PropertyAnimation {
                    properties: "color, border.color"
                    duration: 150
                }

            }
        ]

        indicator {
            visible: false
        }

        delegate: ItemDelegate {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            highlighted: parent.highlightedIndex === index

            contentItem: Text {
                text: model.name
                font.pointSize: root.font.pointSize * 0.8
                color: selectSession.highlightedIndex === index ? root.palette.highlight.hslLightness >= 0.7 ? "#444444" : "white" : root.palette.window.hslLightness >= 0.8 ? root.palette.highlight.hslLightness >= 0.8 ? "#444444" : root.palette.highlight : "white"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            background: Rectangle {
                color: selectSession.highlightedIndex === index ? root.palette.highlight : "transparent"
            }

        }

        contentItem: Text {
            id: displayedItem

            text: (config.TranslateSession || (textConstantSession + ":")) + " " + selectSession.currentText
            color: root.palette.text
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: 3
            font.pointSize: root.font.pointSize * 0.8
            Keys.onReleased: parent.popup.open()
        }

        background: Rectangle {
            color: "transparent"
            border.width: parent.visualFocus ? 1 : 0
            border.color: "transparent"
            height: parent.visualFocus ? 2 : 0
            width: displayedItem.implicitWidth
            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 3
        }

        popup: Popup {
            id: popupHandler

            y: parent.height - 1
            x: config.ForceRightToLeft === "true" ? -loginButtonWidth + displayedItem.width : 0
            width: sessionButton.width
            implicitHeight: contentItem.implicitHeight
            padding: 10

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight + 20
                model: selectSession.popup.visible ? selectSession.delegateModel : null
                currentIndex: selectSession.highlightedIndex

                ScrollIndicator.vertical: ScrollIndicator {
                }

            }

            background: Rectangle {
                radius: config.RoundCorners / 2
                color: config.BackgroundColour
                layer.enabled: true

                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset: 0
                    verticalOffset: 0
                    radius: 20 * config.InterfaceShadowSize
                    samples: 41 * config.InterfaceShadowSize
                    cached: true
                    color: Qt.hsla(0, 0, 0, config.InterfaceShadowOpacity)
                }

            }

            enter: Transition {
                NumberAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                }

            }

        }

    }

}
