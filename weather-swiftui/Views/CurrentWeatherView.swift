//
//  CurrentWeatherView.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 03/05/2023.
//

import SwiftUI
import WeatherKit

struct CurrentWeatherView: View {
    let weatherService = WeatherService.shared
    @StateObject private var viewModel = CurrentWeatherViewModel()
    
    var body: some View {
        VStack {
            if let weather = viewModel.weatherManager.weather {
                ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer(minLength: 110)
                        CityAndTemperatureView(weather: weather, viewModel: viewModel)
                        Spacer(minLength: 50)
                        
                        HourlyForecastView(weather: weather, viewModel: viewModel)
                        
                        DailyForecastView(weather: weather)
                        Spacer()
                    }
                }
            } else {
                VStack {
                    Spacer()
                    HalfpipeLoadingView()
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity)
        .background {
            Image("clouds")
                .resizable()
                .scaledToFill()
        }
        .edgesIgnoringSafeArea(.all)
        .task {
            await viewModel.weatherManager.requestWeatherForCurrentLocation()
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}
