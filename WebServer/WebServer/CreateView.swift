//
//  CreateView.swift
//  WebServer
//
//  Created by Léo Lesimple on 06/03/2024.
//

import SwiftUI

struct CreateView: View {
    @State private var isSidebarOpen = false
    
    var body: some View {
        VStack {
            Text("Créer un serveur")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            Spacer()
        }
        .padding()
        .background(.white)
        
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
