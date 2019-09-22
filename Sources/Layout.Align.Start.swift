//
//  Layout.Align.Start.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation

public struct AlignStart {
    let insets: LXEdgeInsets
    public init(inset: Float) {
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: CGFloat(inset),
                                   bottom: 0.0,
                                   right: 0.0)
    }
    
}

extension AlignStart: Codable {
    
    private enum RootKeys: String, CodingKey {
        case alignStart
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let floatValue = try container.decode(Float.self, forKey: .alignStart)
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: CGFloat(floatValue),
                                   bottom: 0.0,
                                   right: 0.0)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.insets.left, forKey: .alignStart)
    }
 
}

extension AlignStart: Hashable {
    
    public static func ==(lhs: AlignStart,
                          rhs: AlignStart) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
