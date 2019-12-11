//
//  SwiftUIView.swift
//  Hades
//
//  Created by Jeremy Shaw on 12/2/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import SwiftUI

struct PostUIView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var posted: Bool = false
    @State private var failed: Bool = false
//    var title: UITextField!
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack {
            if (posted) {
                Text("Posted!")
            } else {
                Text("")
            }
            TextField("Title", text: $title)
            TextField("Content", text: $content)
            
            if (posted) {
                Button(action: { self.mode.wrappedValue.dismiss() })
                {
                    BackButton()
                }
            } else {
                if (failed) {
                    Text("Please fill out both fields")
                } else {
                    Text("")
                }
                HStack {
                    Button(action: {
                        if (!self.title.isEmpty && !self.content.isEmpty) {
                            self.posted = true
                            self.failed = false
                        } else {
                            self.posted = false
                            self.failed = true
                        }
                    }) {
                        if (!posted) {
                            SubmitButton()
                        }
                    }
                    Button(action: { self.mode.wrappedValue.dismiss() })
                    {
                        if (!posted) {
                            CancelButton()
                        }
                    }
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
struct SubmitButton : View {
    var body: some View {
        return Text("Post")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60)
            .background(Color.blue)
            .cornerRadius(5.0)
    }
}
struct CancelButton : View {
    var body: some View {
        return Text("Cancel")
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
