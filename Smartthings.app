/**
 *
 *  Subscribe Simulated Device to Arduino
 *
 */
definition(
	name: "Subscribe Simulated Device to Arduino",
	namespace: "cetheridge30",
	author: "Christopher Etheridge",
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
        input "zone1", title: "Select...", "capability.switch"
	}
        section("Select the simulated sensor you would like to attach to Zone 2") {
        input "zone2", title: "Select...", "capability.switch"
	}
	section("Select the simulated sensor you would like to attach to Zone 3") {
        input "zone3", title: "Select...", "capability.switch"
	}
	section("Select the simulated sensor you would like to attach to Zone 4") {
        input "zone4", title: "Select...", "capability.switch"
	}
}

def installed()
{   
	subscribe()
    log.debug "Sending poll to update status on inital install"
    arduino.poll()
}

def updated()
{
	unsubscribe()
   	subscribe()
}

def subscribe()
{

	subscribe(arduino, "zone1.on", zone1OpenHandler)
        subscribe(arduino, "zone1.off", zone1ClosedHandler)  
        subscribe(arduino, "zone2.on", zone2OpenHandler)
        subscribe(arduino, "zone2.off", zone2ClosedHandler)  
        subscribe(arduino, "zone3.on", zone3OpenHandler)
        subscribe(arduino, "zone3.off", zone3ClosedHandler)   
        subscribe(arduino, "zone4.on", zone4OpenHandler)
        subscribe(arduino, "zone4.off", zone4ClosedHandler)   
 }

def zone1OpenHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone1.on()
}

def zone1ClosedHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone1.off()
}

def zone2OpenHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone2.open()
}

def zone2ClosedHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone2.close()
}

def zone3OpenHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone3.open()
}

def zone3ClosedHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone3.close()
}
def zone4OpenHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone2.open()
}

def zone4ClosedHandler(evt) {
    //log.debug "arduinoevent($evt.name: $evt.value: $evt.deviceId)"
    zone2.close()
}

