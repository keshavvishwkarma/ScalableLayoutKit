//
//  Logger.swift
//  ScalableLayoutDesign
//
//  Created by Keshav on 9/9/17.
//  Copyright © 2017 Keshav. All rights reserved.
//

import Foundation

public protocol Logable {
    /// Whether to log or not
    var log: Bool { get set }
    
    static var type: String { get }
    
    /// Normal log messages
    func log(_ items: Any...)
    
    /// Error Messages
    func error(_ items: Any...)
}

public extension Logable {
    
    /// Default implementation.
    func log(_ items: Any...) {
        abstractLog("📚👉", args: items)
    }
    
    /// Default implementation.
    func error(_ items: Any...) {
        abstractLog("🚫👉", args: items)
    }
    
    /// Default implementation.
    static var type: String {
        return String(describing: self)
    }
    
    private func abstractLog(_ logType: String, args: [Any]) {
        guard log else { return }
        var messageFormat = ""
        args.forEach {
            messageFormat.append( " " + String(describing: $0) )
        }
        
        print( "👀\(logType) \(Self.type) :", messageFormat )
    }
    
}

public struct DefaultLogger: Logable {
    public static var logger: Logable = DefaultLogger()
    public static var type: String = "ScalableLog"
    public var log = false
}



