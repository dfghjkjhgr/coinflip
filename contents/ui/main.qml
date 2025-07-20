import QtQuick
import QtQuick.Controls
import QtMultimedia
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

PlasmoidItem {
    width: 300
    height: 300
    
    fullRepresentation: Item {
	id: main
	property string lastFlip: "Heads"
	property int repeatCounter: 0
	
	width: 300
	height: 400
	
	Label {
	    text: "Flip A Coin"
	    font.pointSize: 16
	    anchors.top: parent.top
	    anchors.horizontalCenter: parent.horizontalCenter
	}
	
	Image {
	    id: coin
	    source: "../assets/coinHeads.png"
	    height: main.height - 100
	    width: main.width - 100
	    anchors.horizontalCenter: parent.horizontalCenter
	    anchors.verticalCenter: parent.verticalCenter
	}

	Label {
	    id: coinLabel
	    text: "Heads (X0)"
	    anchors.bottom: parent.bottom
	}

	PlasmaComponents.Button {
	    SoundEffect {
		id: coinFlip0
		source: "../assets/coinFlip0.wav"
	    }

	    SoundEffect {
		id: coinFlip1
		source: "../assets/coinFlip1.wav"
	    }

	    SoundEffect {
		id: coinFlip2
		source: "../assets/coinFlip2.wav"
	    }

	    SoundEffect {
		id: coinFlip3
		source: "../assets/coinFlip3.wav"
	    }

	    function playSound(sounds) {
		(sounds[Math.floor(Math.random() * 4)]).play() // I know its ugly, please don't judge
	    }
		
	
	    width: main.width / 3
	    height: 40
	    font.pointSize: 12
	 
	    id: button
	    text: "Flip a Coin"
	    onPressed: {
		if (Math.random() > 0.5) {
		    coin.source = "../assets/coinHeads.png";
		    if (main.lastFlip == "Heads") {
			main.repeatCounter += 1;
		    } else {
			main.lastFlip = "Heads";
			main.repeatCounter = 1;
		    }
		} else {
		    coin.source = "../assets/coinTails.png"
		    if (main.lastFlip == "Tails") {
			main.repeatCounter += 1;
		    } else {
			main.lastFlip = "Tails";
			main.repeatCounter = 1;
		    }
		}
		coinLabel.text = `${main.lastFlip} (X${main.repeatCounter}${main.repeatCounter >= 5 ? "!" : ""}) ${main.repeatCounter >= 15 ? "EPIC" : ""}`;
		playSound([coinFlip0, coinFlip1, coinFlip2, coinFlip3]);
	    }
	    anchors.bottom: parent.bottom
	    anchors.horizontalCenter: parent.horizontalCenter
	}
    }
}	

