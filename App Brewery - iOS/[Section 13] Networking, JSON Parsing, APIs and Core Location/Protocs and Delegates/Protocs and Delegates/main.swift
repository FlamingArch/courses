//
//  main.swift
//  Protocs and Delegates
//
//  Created by Harsh Chaturvedi on 22/09/20.
//

protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate : AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happended?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic : AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor : AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second,")
    }
    func useStethescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func fun() {
        print("Whirr")
    }
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)
emilio.assessSituation()
emilio.medicalEmergency()
