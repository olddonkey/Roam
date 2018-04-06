//
//  Logger.swift
//  Roam
//
//  Created by olddonkey on 2018/4/6.
//  Copyright © 2018年 olddonkey. All rights reserved.
//

import Foundation

func printLog<T>(message: T,
                 file: String = #file,
                 method: String = #function,
                 line: Int = #line){
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
