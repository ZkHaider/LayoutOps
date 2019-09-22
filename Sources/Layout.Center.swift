//
//  Layout.Center.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation

public struct Center {
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

extension Center: Codable {
    
    private enum RootKeys: String, CodingKey {
        case center
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        if !container.contains(.center) {
            let context = DecodingError.Context(codingPath: [RootKeys.center],
                                                debugDescription: "Could not find key \(RootKeys.center)")
            throw DecodingError.keyNotFound(RootKeys.center, context)
        }
        self.insets = try container.decode(LXEdgeInsets.self, forKey: .center)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.insets, forKey: .center)
    }
 
}

extension Center: Hashable {
    
    public static func ==(lhs: Center,
                          rhs: Center) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
