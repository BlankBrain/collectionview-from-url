//
//  AlamofireModel.swift
//  ios_task_mehedi_hasan
//
//  Created by Md. Mehedi Hasan on 3/5/20.
//  Copyright © 2020 Mehedihasan290. All rights reserved.
//

import Foundation

struct ImageGallaryModel :Decodable {
    
        let page: Int?
        let per_page: Int?
        let total: Int?
        let total_pages: Int?
        let data: [Imagedata]
        let ad: adv
    
    init( page: Int?,
          per_page: Int?,
          total: Int?,
          total_pages: Int?,
          data: [Imagedata] = [],
          ad: adv
                        )
        {
           self.page = page ?? 0
            self.per_page = per_page ?? 0
            self.total = total ?? 0
            self.total_pages = total_pages ?? 0
            self.data = data
            self.ad = adv.init(company: "", url: "", text: "")
            
        }

}

struct Imagedata :Decodable {

        let page: Int?
        let email: String?
        let first_name: String?
        let last_name: String?
        let avatar: String?

}
struct adv :Decodable {

        let company: String?
        let url: String?
        let text: String?

}


