//
//  FrameworkDetailView.swift
//  frameworks app
//
//  Created by Paloma St.Clair on 10/2/23.
//

import Foundation
import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowingDetailView = false
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.white)) // light in card mode, dark in light mode
                        .imageScale(.large)
                        .frame( width: 44, height: 44)
                }
            }.padding()
            
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button{
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
            Spacer()
        }
        .sheet(isPresented: $isShowingSafariView, content: {
                    SafariView(frameworkURL: framework.urlString)
                })
    }
}
#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        .preferredColorScheme(.dark)
}
