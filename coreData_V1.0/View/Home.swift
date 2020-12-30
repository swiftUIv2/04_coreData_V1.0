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
    @Environment(\.managedObjectContext) var context
    @State private var didSlide = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
            VStack(spacing: 0) {
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.secondary.opacity(0.1))
                
                // EmptyView...
                if results.isEmpty {
                    Spacer()
                    
                    Text("No Task!!")
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.heavy)
                    Spacer()
                }
                else {
                    ScrollView(.vertical, showsIndicators: false, content : {
                        LazyVStack(alignment: .leading, spacing: 20){
                            
                            ForEach(results) { task in
                                
                                VStack(alignment: .leading, spacing: 5, content: {
                                    Text(task.date ?? Date(), style: .date)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Color2"))
                                    
                                    Text(task.content ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                    
                                    Divider()
                                        .background(Color("Color2"))
                                    
                                    
//                                    LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: didSlide ? .trailing : .leading, endPoint: .leading)
//                                        .mask(Text(task.date ?? Date(), style: .date)
//                                        .fontWeight(.bold))
//                                        .animation(Animation.easeOut(duration: 1.5).delay(0.5).repeatForever(autoreverses: false))
//                                                    .onAppear(){
//                                                        self.didSlide.toggle()
//                                                    }
 
                                    
                                })
                                
                                
                                
                                .contextMenu {
                                    Button(action: {homeData.EditItem(item: task)}, label: {
                                        Text("Edit")
                                    })
                                    Button(action: {
                                        context.delete(task)
                                        try! context.save()
                                    }, label: {
                                        Text("Delete")
                                    })
                                }
                            }
                        }
                        .padding()
                    })
                }
            }
            
            // Add Button...
            
            Button(action: {homeData.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), center: .bottom)
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
