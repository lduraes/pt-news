//
//  NewsListView.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if viewModel.isLoading {
                    LoadingView(color: .blue, size: 60.0)
                } else {
                    if viewModel.allNews.count > 0 {
                        List(viewModel.allNews) { viewModel in
                            NavigationLink(destination: DetailNewsView(viewModel: viewModel)) {
                                Text(viewModel.title)
                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text("list.message.unavailable")
                        }
                    }
                }
            }
            .navigationBarTitle("list.title")
        }
        .onAppear {
            self.viewModel.fetchAllNews()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
