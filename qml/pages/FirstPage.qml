import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property var counter: 0

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Just click that button")
            }
            Label {
                anchors.left: parent.left;
                anchors.leftMargin: 350;
                x: Theme.horizontalPageMargin
                text: counter
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Button {
                id: countButton
                height: 40
                width: 300
                text: qsTr("Click me")
                anchors.left: parent.left;
                anchors.leftMargin: 210;
                onClicked: {
                    counter++;
                }

            }
        }
    }
}
