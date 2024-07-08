import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.1
import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.ScreenTools   1.0
import QtQuick.Controls.Styles  1.4

// Dialog for the login screen
Dialog {
    id: window
    modal: true
    focus: true
    parent: ApplicationWindow.overlay
    closePolicy:Dialog.NoAutoClose
    width:  parent.width
    height: parent.height
    anchors.centerIn: ApplicationWindow.overlay
    background: Rectangle{
        anchors.fill: parent
        color: "transparent"
    }

    // Properties to alias the text fields for username and password
    property alias username: usrField.text
    property alias password: passField.text
    property string invldStrng

    // Signal emitted when login is requested
    signal loginRequested(string username, string password)

    // Function to show the dialog
    function show(){
        window.visible=true
    }

    // Function to hide the dialog
    function hide()
    {
        window.visible = false
    }

    // Main rectangle containing the login form
    Rectangle{
        id:loginRec
        width:parent.width*0.25
        height: parent.height*0.45
        radius: parent.width*0.01
        anchors.centerIn: parent
        border.color:"white"
        border.width:5
        color:  "#66000000"

       // Label for the login title
       Label{
           id:loginLabl
           width:parent.width
           height: parent.height*0.15
           text: "Login"
           color: qgcPal.text
           font.family: ScreenTools.demiboldFontFamily
           font.pointSize: ScreenTools.defaultFontPointSize *2
           anchors.top: parent.top
           anchors.topMargin: parent.height*0.08
           anchors.left: parent.left
           anchors.leftMargin: parent.width*0.4
       }

       // Column layout for the form fields and button
        Column {
            anchors.centerIn: parent
            spacing: parent.height*0.05

            // Label for the username field
            QGCLabel {
                id:usrLbl
                text:               qsTr("Username")
            }

            // Text field for the username input
            QGCTextField {
                id: usrField
                width:ScreenTools.defaultFontPixelWidth * 35
                height:ScreenTools.defaultFontPixelWidth * 5
                placeholderText: "Username..."
            }

            // Label for the password field
            QGCLabel {
                id:passLbl
                text:               qsTr("Password")
            }

            // Text field for the password input
            QGCTextField {
                id: passField
                width:ScreenTools.defaultFontPixelWidth * 35
                height:ScreenTools.defaultFontPixelWidth * 5
                placeholderText: "Password..."
                echoMode: TextInput.Password
            }

            // Button to trigger the login request
            QGCButton {
                id: lgnBtn
                text: "Login"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    loginRequested(username, password)
                }
            }

            // Text element to display the invalid credentials message
            Text {
                id: statusText
                color: "red"
                text: invldStrng
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
