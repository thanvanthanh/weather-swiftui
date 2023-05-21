//
//  DailyForecastView.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 05/05/2023.
//

import SwiftUI
import WeatherKit

struct DailyForecastView: View {
    @State var weather: Weather
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                Text("10 - DAY FORECAST")
                Spacer()
            }
            .font(.caption)
            Divider()
            
            ForEach(weather.dailyForecast, id: \.date) { dailyForecast in
                HStack {
                    Text(dailyForecast.date.weekDay())
                        .frame(width:50, alignment: .leading)
                    Spacer()
                    
                    Image(systemName: "\(dailyForecast.symbolName).fill")
                        .symbolRenderingMode(.multicolor)
                    Spacer()
                    
                    Text("\(dailyForecast.lowTemperature.value.roundDouble())°")
                    TemperatureBarView(currentTemp: weather.currentWeather.temperature.value,
                                       minTemp: dailyForecast.lowTemperature.value,
                                       maxTemp: dailyForecast.highTemperature.value,
                                       isToday: checkIsToday(date: dailyForecast.date))
                    .frame(width: 100, height: 8)
                    Text("\(dailyForecast.highTemperature.value.roundDouble())°")
                }
                .padding(.top, 5)
                Divider()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(.gray.opacity(0.6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    func checkIsToday(date: Date) -> Bool{
            date.timeIntervalSince(Date()) < 100
        }
}

//struct DailyForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyForecastView()
//    }
//}
