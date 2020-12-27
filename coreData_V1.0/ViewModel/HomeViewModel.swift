//
//  HomeViewModel.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet...
    @Published var isNewData = false 
}
