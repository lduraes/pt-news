//
//  View+Extension.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import SwiftUI

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarHidden(true)
    }

    func shrinkNavigationBar() -> some View {
        self
            .navigationBarTitle("", displayMode: .inline)
    }
}
