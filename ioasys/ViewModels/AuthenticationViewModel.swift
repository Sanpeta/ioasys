//
//  AuthenticationViewModel.swift
//  ioasys
//
//  Created by Sidnei de Souza Junior on 24/11/21.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    
    //ATTRIBUTES
    @Published var statusLogin: Bool = false
    @Published var statusEmail = false
    @Published var statusPass = false
    @Published var email: String = "testeapple@ioasys.com.br"   //Apenas para teste os valores
    @Published var password: String = "12341234"                //Apenas para teste os valores
    
    var formIsValid: Bool {
        return email.isValidEmail == true && password.isEmpty == false
    }
    
    var buttonBackgroundColor: Color {
        return formIsValid ? .black : .gray
    }
    
   
    //METHODS
    func login(_ email: String, _ password: String) {
        guard let minhaUrl = NSURL(string: URL_LOGIN) else {
            return
        }
        
        let request = NSMutableURLRequest(url: minhaUrl as URL)
        request.httpMethod = "POST"
        request.setValue(email, forHTTPHeaderField: "email")
        request.setValue(password, forHTTPHeaderField: "password")
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let httpStatus = response as? HTTPURLResponse
            
            if httpStatus?.statusCode == 200 {
                //Consts
                guard let client = httpStatus?.allHeaderFields["client"] else {return}
                guard let uid = httpStatus?.allHeaderFields["uid"] else {return}
                guard let accessToken = httpStatus?.allHeaderFields["access-token"] else {return}
                
                //Salvando em memoria
                UserDefaults.standard.set(client as! String, forKey: "client")
                UserDefaults.standard.set(uid as! String, forKey: "uid")
                UserDefaults.standard.set(accessToken as! String, forKey: "accessToken")
                
                //Thread
                DispatchQueue.main.async {
                    self.statusLogin = true
                    self.statusEmail = false
                    self.statusPass = false
                }
                
            } else if httpStatus?.statusCode == 401 {
                //Thread
                DispatchQueue.main.async {
                    self.statusLogin = false
                    self.statusEmail = true
                    self.statusPass = true
                }
            }
            
        }
        task.resume()
    }
    
}
