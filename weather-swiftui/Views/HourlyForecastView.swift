//
//  HourlyForecastView.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 05/05/2023.
//

import SwiftUI
import WeatherKit

struct HourlyForecastView: View {
    @State var weather: Weather
    @State var viewModel: CurrentWeatherViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "clock")
                Text("HOURLY FORECAST")
            }
            .font(.caption)
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.weatherManager.shortenedHourWeather, id: \.date) { hourForecast in
                        VStack(spacing: 15) {
                            Text("\(Calendar.current.component(.hour, from: hourForecast.date))")
                            Image(systemName: "\(hourForecast.symbolName).fill")
                                .symbolRenderingMode(.multicolor)
                            Text("\(hourForecast.temperature.value.roundDouble())")
                        }
                        .padding(.horizontal, 15)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(.gray.opacity(0.6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
