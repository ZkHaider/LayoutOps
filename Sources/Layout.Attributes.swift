//
//  Layout.Attributes.swift
//  ExampleApp
//
//  Created by Haider Khan on 9/22/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import Foundation
import CoreGraphics

public enum LayoutAttribute {
    
    case fill(Fill)
    case hFill(HFill)
    case vFill(VFill)
    
    case center(Center)
    case hCenter(HCenter)
    case vCenter(VCenter)
    
    case alignTop(AlignTop)
    case alignStart(AlignStart)
    case alignBottom(AlignBottom)
    case alignEnd(AlignEnd)
    
    case unknown
    
}

extension LayoutAttribute: Codable {
    
    public init(from decoder: Decoder) throws {
        
        if let fill = try? Fill(from: decoder) {
            self = .fill(fill)
        } else if let hFill = try? HFill(from: decoder) {
            self = .hFill(hFill)
        } else if let vFill = try? VFill(from: decoder) {
            self = .vFill(vFill)
        } else if let center = try? Center(from: decoder) {
            self = .center(center)
        } else if let hCenter = try? HCenter(from: decoder) {
            self = .hCenter(hCenter)
        } else if let vCenter = try? VCenter(from: decoder) {
            self = .vCenter(vCenter)
        } else if let alignTop = try? AlignTop(from: decoder) {
            self = .alignTop(alignTop)
        } else if let alignStart = try? AlignStart(from: decoder) {
            self = .alignStart(alignStart)
        } else if let alignEnd = try? AlignEnd(from: decoder) {
            self = .alignEnd(alignEnd)
        } else if let alignBottom = try? AlignBottom(from: decoder) {
            self = .alignBottom(alignBottom)
        } else {
            self = .unknown
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .fill(let fill):
            try fill.encode(to: encoder)
        case .hFill(let hFill):
            try hFill.encode(to: encoder)
        case .vFill(let vFill):
            try vFill.encode(to: encoder)
        case .center(let center):
            try center.encode(to: encoder)
        case .hCenter(let hCenter):
            try hCenter.encode(to: encoder)
        case .vCenter(let vCenter):
            try vCenter.encode(to: encoder)
        case .alignTop(let alignTop):
            try alignTop.encode(to: encoder)
        case .alignStart(let alignStart):
            try alignStart.encode(to: encoder)
        case .alignBottom(let alignBottom):
            try alignBottom.encode(to: encoder)
        case .alignEnd(let alignEnd):
            try alignEnd.encode(to: encoder)
        case .unknown: break
        }
    }
    
}

extension LayoutAttribute: Hashable {
    
    public static func ==(lhs: LayoutAttribute,
                          rhs: LayoutAttribute) -> Bool {
        switch lhs {
        case .fill(let lhsFill):
            switch rhs {
            case .fill(let rhsFill): return lhsFill == rhsFill
            default: return false
            }
        case .hFill(let lhsHFill):
            switch rhs {
            case .hFill(let rhsHFill): return lhsHFill == rhsHFill
            default: return false
            }
        case .vFill(let lhsVFill):
            switch rhs {
            case .vFill(let rhsVFill): return lhsVFill == rhsVFill
            default: return false
            }
        case .center(let lhsCenter):
            switch rhs {
            case .center(let rhsCenter): return lhsCenter == rhsCenter
            default: return false
            }
        case .hCenter(let lhsHCenter):
            switch rhs {
            case .hCenter(let rhsHCenter): return lhsHCenter == rhsHCenter
            default: return false
            }
        case .vCenter(let lhsVCenter):
            switch rhs {
            case .vCenter(let rhsVCenter): return lhsVCenter == rhsVCenter
            default: return false
            }
        case .alignTop(let lhsAlignTop):
            switch rhs {
            case .alignTop(let rhsAlignTop): return lhsAlignTop == rhsAlignTop
            default: return false
            }
        case .alignStart(let lhsAlignStart):
            switch rhs {
            case .alignStart(let rhsAlignStart): return lhsAlignStart == rhsAlignStart
            default: return false
            }
        case .alignBottom(let lhsAlignBottom):
            switch rhs {
            case .alignBottom(let rhsAlignBottom): return lhsAlignBottom == rhsAlignBottom
            default: return false
            }
        case .alignEnd(let lhsAlignEnd):
            switch rhs {
            case .alignEnd(let rhsAlignEnd): return lhsAlignEnd == rhsAlignEnd
            default: return false
            }
        case .unknown:
            switch rhs {
            case .unknown: return true
            default: return false 
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .fill(let fill):
            hasher.combine(fill)
        case .hFill(let hFill):
            hasher.combine(hFill)
        case .vFill(let vFill):
            hasher.combine(vFill)
        case .center(let center):
            hasher.combine(center)
        case .hCenter(let hCenter):
            hasher.combine(hCenter)
        case .vCenter(let vCenter):
            hasher.combine(vCenter)
        case .alignTop(let alignTop):
            hasher.combine(alignTop)
        case .alignStart(let alignStart):
            hasher.combine(alignStart)
        case .alignBottom(let alignBottom):
            hasher.combine(alignBottom)
        case .alignEnd(let alignEnd):
            hasher.combine(alignEnd)
        case .unknown: break
        }
    }
    
}
