//
//  SafariView.swift
//  frameworks app
//
//  Created by Paloma St.Clair on 10/5/23.
//

import SwiftUI
import SafariServices

struct SafariView: View {
    var frameworkURL: String
    
    var body: some View{
        Link(destination: URL(string: frameworkURL)!, label: {
            Text("Learn More")
                .bold()
                .frame(width: 280, height:50)
                .foregroundColor(.white)
                .background(.blue)
        })
        
    }
}
