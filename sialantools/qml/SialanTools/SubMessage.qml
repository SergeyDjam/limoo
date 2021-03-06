/*
    Copyright (C) 2014 Sialan Labs
    http://labs.sialan.org

    Kaqaz is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Kaqaz is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: submsg
    anchors.fill: parent
    opacity: 0
    visible: opacity != 0

    property variant item
    property alias source: blur.source
    property alias backgroundColor: backgroud.color

    Behavior on opacity {
        NumberAnimation{ easing.type: Easing.OutCubic; duration: 400 }
    }

    Timer {
        id: destroy_timer
        interval: 400
        repeat: false
        onTriggered: submsg.destroy()
    }

    onItemChanged: {
        if( !item ) {
            opacity = 0
            destroy_timer.restart()
        } else {
            item.parent = submsg
            opacity = 1
        }
    }

    MouseArea {
        anchors.fill: parent
    }

    FastBlur {
        id: blur
        anchors.fill: parent
        radius: 64
        cached: true
    }

    Rectangle {
        id: backgroud
        anchors.fill: parent
        color: "#66ffffff"
    }

    function hide() {
        if( item && item.hide )
            item.hide()

        opacity = 0
        destroy_timer.restart()
    }

    Component.onCompleted: BackHandler.pushHandler(submsg,submsg.hide)
    Component.onDestruction: if( item ) item.destroy()
}
