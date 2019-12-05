//
//  SwiftUIView.swift
//  Hades
//
//  Created by Jeremy Shaw on 12/2/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI



struct PostUIView: View {
    @State private var name: String = ""
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $name)
                TextField("Content", text: $name)
                HStack {
                    Button(action: {}) {
                        SubmitButton()
                    }
                    Button(action: {}) {
                        BackButton()
                    }
                }
            }
            .padding()
        }
    }
}
struct SubmitButton : View {
    var body: some View {
        return Text("Submit")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60)
            .background(Color.blue)
            .cornerRadius(5.0)
    }
}
struct BackButton : View {
    var body: some View {
        return Text("Back")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60)
            .background(Color.blue)
            .cornerRadius(5.0)
    }
}

struct PostUIView_Previews: PreviewProvider {
    static var previews: some View {
        PostUIView()
    }
}
