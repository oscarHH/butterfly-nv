import QtQuick 2.0

Item{
    property string texto: value
    property string colorfondo: value
    Rectangle{
        id:rent
        color: "#e42b2b"
        Text {
            id: name
            text: colorfondo

        }
    }
}


