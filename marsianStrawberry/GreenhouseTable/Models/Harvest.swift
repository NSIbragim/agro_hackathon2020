//
//  Harvest.swift
//  marsianStrawberry
//
//  Created by i.mamadaev on 12.12.2020.
//

import Foundation

class Harvest {
    let targetWeight, money, collectedWeight, wastedMoney: Float?
    let distance: Int?

    init(targetWeight: Float?, money: Float?, collectedWeight: Float?, wastedMoney: Float?, distance: Int?) {
        self.targetWeight = targetWeight
        self.money = money
        self.collectedWeight = collectedWeight
        self.wastedMoney = wastedMoney
        self.distance = distance
    }
}
