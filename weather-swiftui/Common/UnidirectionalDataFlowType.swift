//
//  UnidirectionalDataFlowType.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 03/05/2023.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
