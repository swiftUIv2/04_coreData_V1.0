//
//  Home.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        Button(action: {homeData.isNewData.toggle()}, label: {
            Text("Button")
        })
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataView(homeData: homeData)
        })
    }
}
