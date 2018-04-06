//
//  ProcedureProtocol.swift
//  Roam
//
//  Created by olddonkey on 2018/4/5.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation
import Result

protocol ProcedureProtocol {
    associatedtype input
    associatedtype output
    associatedtype successType
    associatedtype errorType: Error
    var delegate: Delegate<input, output> { get set }
    func start()
    func finish(result: Result<successType, errorType>)
}
