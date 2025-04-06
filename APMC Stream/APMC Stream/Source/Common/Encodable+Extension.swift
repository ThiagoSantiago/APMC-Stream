//
//  Encodable+Extension.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 05/04/25.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
