//
//  Layout.Align.Bottom.swift
//  LayoutOps
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation
import CoreGraphics

public struct AlignBottom {
    let insets: LXEdgeInsets
    public init(inset: Float) {
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: 0.0,
                                   bottom: CGFloat(inset),
                                   right: 0.0)
    }
    
}

extension AlignBottom: Codable {
    
    private enum RootKeys: String, CodingKey {
        case alignBottom
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        if !container.contains(.alignBottom) {
            let context = DecodingError.Context(codingPath: [RootKeys.alignBottom],
                                                debugDescription: "Could not find key \(RootKeys.alignBottom)")
            throw DecodingError.keyNotFound(RootKeys.alignBottom, context)
        } 
        let floatValue = try container.decode(Float.self, forKey: .alignBottom)
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: 0.0,
                                   bottom: CGFloat(floatValue),
                                   right: 0.0)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.insets.bottom, forKey: .alignBottom)
    }
 
}

extension AlignBottom: Hashable {
    
    public static func ==(lhs: AlignBottom,
                          rhs: AlignBottom) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
