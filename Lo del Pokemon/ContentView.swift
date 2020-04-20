//
//  ContentView.swift
//  Lo del Pokemon
//
//  Created by Heliodoro Tejedor Navarro on 4/20/20.
//  Copyright © 2020 Heliodoro Tejedor Navarro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            ChachiMapView()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Group {
                            Text("Lat: \(self.viewModel.location.coordinate.latitude)")
                            Text("Lon: \(self.viewModel.location.coordinate.longitude)")
                        }.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }.padding()
                    Spacer()
                }
            .background(
                RoundedRectangle(cornerRadius: 20).fill(
                    colorScheme == .dark ? Color.gray : Color.white))
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.viewModel.requestAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .dark)
            ContentView()
                .environment(\.colorScheme, .light)
        }
    }
}
