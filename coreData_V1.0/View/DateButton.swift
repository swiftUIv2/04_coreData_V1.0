//
//  DateButton.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI

struct DateButton: View {
    var title: String
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        Button(action: {homeData.updateDate(value: title)}, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .primary : .secondary)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    homeData.checkDate() == title ?
                    LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing) :
                        LinearGradient(gradient: .init(colors: [Color.secondary]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    }
}

 
