//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Praveenkumar on 10/4/19.
//  Copyright © 2019 Praveen Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var dataPoints: [[ChartValue]] = [
        [ChartValue(day: "S", value: 25), ChartValue(day: "M", value: 50), ChartValue(day: "T", value: 75), ChartValue(day: "W", value: 100), ChartValue(day: "T", value: 125), ChartValue(day: "F", value: 150), ChartValue(day: "S", value: 175)],

        [ChartValue(day: "S", value: 100), ChartValue(day: "M", value: 25), ChartValue(day: "T", value: 50), ChartValue(day: "W", value: 175), ChartValue(day: "T", value: 125), ChartValue(day: "F", value: 75), ChartValue(day: "S", value: 150)],
        
        [ChartValue(day: "S", value: 50), ChartValue(day: "M", value: 125), ChartValue(day: "T", value: 25), ChartValue(day: "W", value: 75), ChartValue(day: "T", value: 150), ChartValue(day: "F", value: 100), ChartValue(day: "S", value: 175)]
        
        
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.117543973, green: 0.2897527516, blue: 0.4028342962, alpha: 1)).edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack (spacing: 24) {
                        ChartDataPoint(value: dataPoints[selectedIndex][0].value, dayValue: dataPoints[selectedIndex][0].day)
                        ChartDataPoint(value: dataPoints[selectedIndex][1].value, dayValue: dataPoints[selectedIndex][1].day)
                        ChartDataPoint(value: dataPoints[selectedIndex][2].value, dayValue: dataPoints[selectedIndex][2].day)
                        ChartDataPoint(value: dataPoints[selectedIndex][3].value, dayValue: dataPoints[selectedIndex][3].day)
                        ChartDataPoint(value: dataPoints[selectedIndex][4].value, dayValue: dataPoints[selectedIndex][4].day)
                        ChartDataPoint(value: dataPoints[selectedIndex][5].value, dayValue: dataPoints[selectedIndex][5].day)
                        ChartDataPoint(value: dataPoints[selectedIndex][6].value, dayValue: dataPoints[selectedIndex][6].day)
                    }.animation(.default)
                    
                    Picker(selection: $selectedIndex, label: Text("")) {
                        Text("Heart Rate").tag(0)
                        Text("Steps Count").tag(1)
                        Text("Calories").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(20)
                }
            }
            .navigationBarTitle("Health Data", displayMode: .inline)
        }
    }
}

struct ChartDataPoint: View {
    var value: CGFloat
    var dayValue: String
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(.black)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }.padding(.top, 24)
            
            Text(dayValue)
                .foregroundColor(.white)
                .padding(.top, 8)
        }
    }
}

struct ChartValue {
    var day: String
    var value: CGFloat
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#endif
