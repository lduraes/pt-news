//
//  DetailNewsView.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import SwiftUI

struct DetailNewsView: View {
    var viewModel: NewsViewModel

    var body: some View {
        //newsViewModel.body.map({ Text($0) })

        ZStack {
            WebView(urlString: viewModel.shareUrl)
        }
        .shrinkNavigationBar()
    }
}

struct DetailNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNewsView(viewModel: NewsViewModel(id: 1,
                                                title: "Tilte - test",
                                                body: "Body - test",
                                                url: nil,
                                                shareUrl: nil,
                                                images: nil))
    }
}
