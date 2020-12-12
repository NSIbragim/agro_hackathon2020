//
//  GreenHouse.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import Foundation

class GreenHouse {
    let temperature, lightning, acidity, water: Float?
    init(temperature: Float, lightning: Float, acidity: Float, water: Float) {
        self.temperature = temperature
        self.lightning = lightning
        self.acidity = acidity
        self.water = water
    }
}
