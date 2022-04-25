//
//  ContentView.swift
//  DataRetrievalPractice
//
//  Created by Johnathan Lee on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var factString = ""
    
    var body: some View {
        
        VStack {
            Text(factString)
                .bold()
                .font(.largeTitle)
                .padding()
            
            Button {
                getNewFact()
            } label: {
                Text("Get new fact!")
            }

        }
    }
    
    func getNewFact() {
        let urlString = "http://numbersapi.com/random/trivia"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                return
            }
            
            factString = String(data: data!, encoding: .utf8) ?? ""
            
        }
        
        dataTask.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
