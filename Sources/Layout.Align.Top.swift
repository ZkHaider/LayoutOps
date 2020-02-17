//
//  Layout.Align.Top.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation
import CoreGraphics

public struct AlignTop {
    let insets: LXEdgeInsets
    public init(inset: Float) {
        self.insets = LXEdgeInsets(top: CGFloat(inset),
                                   left: 0.0,
                                   bottom: 0.0,
                                   right: 0.0)
    }
    
}

extension AlignTop: Codable {
    
    private enum RootKeys: String, CodingKey {
        case alignTop
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        if !container.contains(.alignTop) {
            let context = DecodingError.Context(codingPath: [RootKeys.alignTop],
                                                debugDescription: "Could not find key \(RootKeys.alignTop)")
            throw DecodingError.keyNotFound(RootKeys.alignTop, context)
        }
        let floatValue = try container.decode(Float.self, forKey: .alignTop)
        self.insets = LXEdgeInsets(top: CGFloat(floatValue),
                                   left: 0.0,
                                   bottom: 0.0,
                                   right: 0.0)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.insets.top, forKey: .alignTop)
    }
 
}

extension AlignTop: Hashable {
    
    public static func ==(lhs: AlignTop,
                          rhs: AlignTop) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
