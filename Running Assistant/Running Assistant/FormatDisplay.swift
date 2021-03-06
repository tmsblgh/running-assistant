//
//  FormatDisplay.swift
//  Running Assistant
//
//  Created by Balogh Tamás on 2018. 04. 07.
//  Copyright © 2018. Balogh Tamás. All rights reserved.
//

import Foundation

struct FormatDisplay {
    static func distance(_ distance: Double) -> String {
        let distanceMeasurement = Measurement(value: distance, unit: UnitLength.meters)
        return FormatDisplay.distance(distanceMeasurement)
    }
    
    static func distance(_ distance: Measurement<UnitLength>) -> String {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: "hu_HU")
        return formatter.string(from: distance)
    }
    
    static func time(_ seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(seconds))!
    }
    
    static func speed(distance: Measurement<UnitLength>, goalSpeed: Float, seconds: Int, outputUnit: UnitSpeed) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = [.providedUnit]
        formatter.locale = Locale(identifier: "hu_HU")
        let speedInDouble = seconds != 0 ? distance.value / Double(seconds) : 0
        let speedInMeasurement = Measurement(value: speedInDouble, unit: UnitSpeed.kilometersPerHour)
        return formatter.string(from: speedInMeasurement.converted(to: outputUnit))
    }
    
    static func date(_ timestamp: Date?) -> String {
        guard let timestamp = timestamp as Date? else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: timestamp)
    }
}
