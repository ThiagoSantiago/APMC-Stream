//
//  TimeInterval+Extension.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation

extension TimeInterval {
    func toHourMinAndSec() -> String {
        let totalSeconds = Int(self)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%d:%02d", minutes, seconds)
        }
    }
}
