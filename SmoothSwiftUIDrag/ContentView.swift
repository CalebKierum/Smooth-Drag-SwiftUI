//
//  ContentView.swift
//  SmoothSwiftUIDrag
//
//  Created by Caleb Kierum on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SmoothDragView {
                Color.blue
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
            }

            SmoothDragView {
                Color.purple
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
