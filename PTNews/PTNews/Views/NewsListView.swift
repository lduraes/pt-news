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
        // in order to appear records list in your iPad device or simulator, please perform following instructions:
        //   - swipe right from the left edge OR
        //   - rotate your iPad device / simulator OR
        //   - uncomment workaround mentioned below. though, it will change the default way of showing a list records on iPad
        //.navigationViewStyle(StackNavigationViewStyle())
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
