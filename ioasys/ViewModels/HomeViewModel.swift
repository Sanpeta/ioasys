//
//  HomeViewModel.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 24/11/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var enterprises:[Enterprise] = []
    
    init() {
        fetchEnterprises()
    }
    
    func fetchEnterprises() {
        guard let minhaUrl = NSURL(string: URL_ENTERPRISES) else {
            return
        }
        
        let request = NSMutableURLRequest(url: minhaUrl as URL)
        request.httpMethod = "GET"
        
        print("Debug-GET \(String(describing: UserDefaults.standard.value(forKey: "access-token")))")
        
        guard let accessToken = UserDefaults.standard.value(forKey: "accessToken") else {return}
        guard let client = UserDefaults.standard.value(forKey: "client") else {return}
        guard let uid = UserDefaults.standard.value(forKey: "uid") else {return}
        
        request.setValue((accessToken as! String) , forHTTPHeaderField: "access-token")
        request.setValue((client as! String) , forHTTPHeaderField: "client")
        request.setValue((uid as! String) , forHTTPHeaderField: "uid")
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let httpStatus = response as? HTTPURLResponse
            print("DEBUG URL HOME")
            if httpStatus?.statusCode == 200 {
                
                if data?.count != 0 {
                    
                    do {
                                             
                        let enterprisesJSON = try JSONDecoder().decode(Enterprises.self, from: data!)
                        
                        //Thread
                        DispatchQueue.main.async {
                            print("DEBUG",self.enterprises.count)
                            self.enterprises = enterprisesJSON.enterprises
                        }
                        
                    } catch let error {
                        print("Error to decode \(error)")
                    }
                    
                }
                
            }
            
        }
        task.resume()
    }
    
    func filterEnterprises(name: String) -> [Enterprise] {
        return enterprises.filter({ $0.enterprise_name.contains(name) })
    }
    
}
