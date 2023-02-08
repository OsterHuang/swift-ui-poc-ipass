//
//  TimeFormatter.swift
//  ipass
//
//  Created by Oster Huang on 07/02/2023.
//

import Foundation

extension TimeInterval {
    func formatHHmmss() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)

    }
    
    func formatMmss() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    func formatHHmm() -> String {
        let interval = Int(self)
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d", hours, minutes)

    }
}
