//
//  Layout.Align.End.swift
//  LayoutOps
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation

public struct AlignEnd {
    let insets: LXEdgeInsets
    public init(inset: Float) {
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: 0.0,
                                   bottom: 0.0,
                                   right: CGFloat(inset))
    }
    
}

extension AlignEnd: Codable {
    
    private enum RootKeys: String, CodingKey {
        case alignEnd
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let floatValue = try container.decode(Float.self, forKey: .alignEnd)
        self.insets = LXEdgeInsets(top: 0.0,
                                   left: 0.0,
                                   bottom: 0.0,
                                   right: CGFloat(floatValue))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.insets.right, forKey: .alignEnd)
    }
 
}

extension AlignEnd: Hashable {
    
    public static func ==(lhs: AlignEnd,
                          rhs: AlignEnd) -> Bool {
        if lhs.insets != rhs.insets {
            return false
        }
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.insets)
    }
    
}
