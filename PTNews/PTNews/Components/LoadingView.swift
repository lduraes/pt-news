//
//  LoadingView.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var degrees = 0.0

    let color: Color
    let size: CGFloat

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(color, lineWidth: 5.0)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degrees))
            .onAppear { self.startAnimating()}
    }

    func startAnimating() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            withAnimation {
                self.degrees += 10.0
            }

            if self.degrees == 360.0 {
                self.degrees = 0.0
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(color: Color.white, size: 50)
    }
}
