//
//  CurrentWeatherViewModel.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 03/05/2023.
//

import Foundation
import SwiftUI
import Combine
import WeatherKit

final class CurrentWeatherViewModel: ObservableObject {
        
    @Published var weatherManager = WeatherManager()
    
    private var anyCancellable: AnyCancellable? = nil
    
    init() {
        anyCancellable = weatherManager.objectWillChange
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] (_) in
                self?.objectWillChange.send()
            })
    }
}

