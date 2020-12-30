//
//  NewDataView.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("\(homeData.updateItem == nil ? "Add New": "Update") Task")
                    .font(.system(size: 65))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            TextEditor(text: $homeData.content)
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
            }
            .padding()
            HStack(spacing: 8) {
                DateButton(title: "Today", homeData: homeData)
                DateButton(title: "Tomorrow", homeData: homeData)
                
                //Data Picker...
                
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            
            
            
            
            
            //Add Button....
            Button(action: {homeData.writeData(context: context)}, label: {
                
            Label(
                title: { Text(homeData.updateItem == nil ? "Add Now" : "Update")
                .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
            },
                icon: { Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.primary)
                })
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(
                    LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(8)
            })
            .padding()
            // disabling button when no data...
            .disabled(homeData.content == "" ? true : false)
            .opacity(homeData.content == "" ? 0.5 : 1)
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}
