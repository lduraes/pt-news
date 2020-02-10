//
//  LoadingView.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import SwiftUI

struct LoadingConfig {
    static let Trim: CGFloat = 0.8
    static let StrokeLineWidth: CGFloat = 5.0
    static let TimeInterval = 0.02
    static let AnimationDegrees = 10.0
    static let Degrees360 = 360.0
    static let DefaultSize: CGFloat = 50.0
}

struct LoadingView: View {
    @State private var degrees = 0.0

    let color: Color
    let size: CGFloat

    var body: some View {
        Circle()
            .trim(from: 0, to: LoadingConfig.Trim)
            .stroke(color, lineWidth: LoadingConfig.StrokeLineWidth)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degrees))
            .onAppear {
                self.startAnimating()
            }
    }

    func startAnimating() {
        Timer.scheduledTimer(withTimeInterval: LoadingConfig.TimeInterval, repeats: true) { _ in
            withAnimation {
                self.degrees += LoadingConfig.AnimationDegrees
            }

            if self.degrees == LoadingConfig.Degrees360 {
                self.degrees = 0.0
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(color: Color.white, size: LoadingConfig.DefaultSize)
    }
}
