//
//  Layout.HFill.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation

public struct HFill {
    let insets: LXEdgeInsets
    public init(start: Float,
                end: Float) {
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: CGFloat(start),
                                   bottom: 0.0,
                                   right: CGFloat(end))
    }
}

extension HFill: Codable {
    
    private enum RootKeys: String, CodingKey {
        case hFill
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        if !container.contains(.hFill) {
                   let context = DecodingError.Context(codingPath: [RootKeys.hFill],
                                                       debugDescription: "Could not find key \(RootKeys.hFill)")
                   throw DecodingError.keyNotFound(RootKeys.hFill, context)
               }
        if let floatValue = try? container.decode(Float.self, forKey: .hFill) {
            self.insets = LXEdgeInsets(top: 0.0,
                                       left: CGFloat(floatValue),
                                       bottom: 0.0,
                                       right: CGFloat(floatValue))
        } else if let arrayValue = try? container.decode([Float].self, forKey: .hFill),
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
            try container.encode(self.insets.left, forKey: .hFill)
        } else {
            try container.encode([self.insets.left, self.insets.right], forKey: .hFill)
        }
    }
 
}

extension HFill: Hashable {
    
    public static func ==(lhs: HFill,
                          rhs: HFill) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
