//
//  FrameworkGridViewModel.swift
//  frameworks app
//
//  Created by Paloma St.Clair on 10/3/23.
//

import SwiftUI

// Observable object makes it able to publish information
final class FrameworkGridViewModel: ObservableObject{
    
    var selectedFramework: Framework? {
        didSet{
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    
}
