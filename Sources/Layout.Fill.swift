//
//  Layout.Fill.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation
import CoreGraphics

public struct Fill {
    let insets: LXEdgeInsets
    public init(start: Float,
                top: Float,
                end: Float,
                bottom: Float) {
        self.insets = LXEdgeInsets(top: CGFloat(top),
                                   left: CGFloat(start),
                                   bottom: CGFloat(bottom),
                                   right: CGFloat(end))
    }

    init(insets: LXEdgeInsets) {
        self.insets = insets
    }
}

extension Fill: Codable {
    
    private enum RootKeys: String, CodingKey {
        case fill
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        if !container.contains(.fill) {
            let context = DecodingError.Context(codingPath: [RootKeys.fill],
                                                debugDescription: "Could not find key \(RootKeys.fill)")
            throw DecodingError.keyNotFound(RootKeys.fill, context)
        }
        self.insets = try container.decode(LXEdgeInsets.self, forKey: .fill)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.insets, forKey: .fill)
    }
 
}

extension Fill: Hashable {
    
    public static func ==(lhs: Fill,
                          rhs: Fill) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
