//
//  Home.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    // fetching data...
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
            VStack {
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.secondary)
                
                ScrollView(.vertical, showsIndicators: false, content : {
                    LazyVStack(alignment: .leading, spacing: 20){
                        
                        ForEach(results) { task in
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text(task.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(task.date ?? Date(), style: .date)
                                    .fontWeight(.bold)
                            })
                            .foregroundColor(.primary)
                        }
                    }
                    .padding()
                })
            }
            
            // Add Button...
            
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), center: .center)
                    )
                    .clipShape(Circle())
            })
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataView(homeData: homeData)
        })
    }
}
