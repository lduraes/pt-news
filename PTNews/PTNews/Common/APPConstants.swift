//
//  APPConstants.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import Foundation

struct APPConstants {
    static let Url = "https://www.publico.pt/"

    enum Endpoint: String {
        case allNews = "api/list/ultimas#"
    }
}
