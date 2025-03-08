//
//  ContentView.swift
//  SmoothSwiftUIDrag
//
//  Created by Caleb Kierum on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var proMotionEnabled: Bool = true
    
    @State var powerStateMonitor: PowerStateMonitor = PowerStateMonitor()
    
    var body: some View {
        VStack {
            Spacer()
            
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
            
            Spacer()
            
            Toggle("Pro Motion Enabled?", isOn: $proMotionEnabled)
                .onChange(of: proMotionEnabled) { oldValue, newValue in
                    if newValue {
                        CADisplayLink.enableProMotion()
                    } else {
                        CADisplayLink.disableProMotion()
                    }
                }
            
            Text("Low power mode on. Pro motion will not enable")
                .foregroundStyle(.red)
                .bold()
                .opacity(powerStateMonitor.lowPowerEnabled ? 1 : 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
