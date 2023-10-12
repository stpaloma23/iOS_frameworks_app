//
//  ContentView.swift
//  frameworks app
//
//  Created by Paloma St.Clair on 10/2/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]

    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(MockData.frameworks, id: \.id){ framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                        
                    }
                })
            }
            
            .navigationTitle("Apple Frameworks")
            // the sheet displays when the showing detail view is true. has to be binding
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
                
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

struct FrameworkTitleView: View {
//    let name: String
//    let imageName:String
    let framework: Framework
    var body: some View {
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}
