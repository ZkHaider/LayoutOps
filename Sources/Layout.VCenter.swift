//
//  Layout.VCenter.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation
import CoreGraphics

public struct VCenter {
    let insets: LXEdgeInsets
    public init(top: Float,
                bottom: Float) {
        self.insets = LXEdgeInsets(top: CGFloat(top),
                                   left: 0.0,
                                   bottom: CGFloat(bottom),
                                   right: 0.0)
    }
}

extension VCenter: Codable {
    
    private enum RootKeys: String, CodingKey {
        case vCenter
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        if !container.contains(.vCenter) {
            let context = DecodingError.Context(codingPath: [RootKeys.vCenter],
                                                debugDescription: "Could not find key \(RootKeys.vCenter)")
            throw DecodingError.keyNotFound(RootKeys.vCenter, context)
        }
        if let floatValue = try? container.decode(Float.self, forKey: .vCenter) {
            self.insets = LXEdgeInsets(top: CGFloat(floatValue),
                                       left: 0.0,
                                       bottom: CGFloat(floatValue),
                                       right: 0.0)
        } else if let arrayValue = try? container.decode([Float].self, forKey: .vCenter),
            arrayValue.count == 2 {
            self.insets = LXEdgeInsets(top: 0.0,
                                       left: CGFloat(arrayValue[0]),
                                       bottom: 0.0,
                                       right: CGFloat(arrayValue[1]))
        } else {
            self.insets = LXEdgeInsets(top: 0.0,
                                       left: 0.0,
                                       bottom: 0.0,
                                       right: 0.0)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        if self.insets.congruent {
            try container.encode(self.insets.top, forKey: .vCenter)
        } else {
            try container.encode([self.insets.top, self.insets.bottom], forKey: .vCenter)
        }
    }
 
}

extension VCenter: Hashable {
    
    public static func ==(lhs: VCenter,
                          rhs: VCenter) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
