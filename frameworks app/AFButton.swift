//
//  AFButton.swift
//  frameworks app
//
//  Created by Paloma St.Clair on 10/3/23.
//

import Foundation
import SwiftUI

struct AFButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
