//
//  ContentView.swift
//  LocalNotifications
//
//  Created by Hariom Palkar on 13/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            //trigger the function to set local notification
            // you can even do this in AppDelegate
            .onAppear(perform: { notifications(hour: 10, minute: 0, second: 0)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
