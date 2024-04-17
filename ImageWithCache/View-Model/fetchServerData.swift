//
//  fetchServerData.swift
//  ImageWithCache
//
//  Created by Ripon sk on 15/04/24.
//

import Foundation

final class fetchServerData{
    static let shared = fetchServerData()
    func fetchData( closer: @escaping (([TotalData])->Void)) async throws{
        guard let url = URL(string: StrUrl) else{
            print("Invalid URL")
            return
        }
        do{
            let req = URLRequest(url: url)
            let (data,_) = try await SharedUrl.data(for: req)
            let js = try JSONDecoder().decode([TotalData].self, from: data)
            closer(js)
        }
        catch{
            print("Error:::\(error.localizedDescription)")
        }
        
        
    }
}
