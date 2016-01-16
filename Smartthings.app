/**
 *
 *  Subscribe Simulated Device to Arduino
 *
 */
definition(
	name: "Subscribe Simulated Device to Arduino (Switches)",
	namespace: "clh41413",
	author: "Casey Hill",
	description: "Subscribes and Updates Simulated Device Based on Arduino PINs",
	category: "My Apps",
    iconUrl: "https://s3.amazonaws.com/smartapp-icons/Convenience/Cat-Convenience.png",
    iconX2Url: "https://s3.amazonaws.com/smartapp-icons/Convenience/Cat-Convenience@2x.png",
    iconX3Url: "https://s3.amazonaws.com/smartapp-icons/Convenience/Cat-Convenience@2x.png"

)

preferences {
	section("Select arduino that sensors are connected to.") {
		input "arduino", "capability.switch", title: "Select...", required: true
    }
	section("Select the simulated sensor you would like to attach to Zone 1") {
        input "mySwitch1", title: "Select...", "capability.switch", required: true
	}
    section("Select the simulated sensor you would like to attach to Zone 2") {
        input "mySwitch2", title: "Select...", "capability.switch", required: false
	}
     section("Select the simulated sensor you would like to attach to Zone 3") {
        input "mySwitch3", title: "Select...", "capability.switch", required: false
	}
     section("Select the simulated sensor you would like to attach to Zone 4") {
        input "mySwitch4", title: "Select...", "capability.switch", required: false
	}
}

def installed()
{   
	subscribe()
    log.debug "Sending poll to update status on inital install"
    //arduino.poll() TODO: Need to poll and see if its on or the current status.  Just need to update the device.
}

def updated()
{
	unsubscribe()
   	subscribe()
}

def subscribe()
{

	    subscribe(mySwitch1, "switch", zone1)
        subscribe(mySwitch2, "switch", zone2)
        subscribe(mySwitch3, "switch", zone3)
        subscribe(mySwitch3, "switch", zone4)
}

def zone1(evt) {
	if(evt.value == "on"){
        log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
        arduino.zone1On()
        }
    else{
     	log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    	 arduino.zone1Off()
    }
}

def zone2(evt) {
	if(evt.value == "on"){
        log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
        arduino.zone2On()
        }
    else{
     	log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    	 arduino.zone2Off()
    }
}

def zone3(evt) {
	if(evt.value == "on"){
        log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
        arduino.zone3On()
        }
    else{
     	log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    	 arduino.zone3Off()
    }
}

def zone4(evt) {
	if(evt.value == "on"){
        log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
        arduino.zone4On()
        }
    else{
     	log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    	 arduino.zone4Off()
    }
}
