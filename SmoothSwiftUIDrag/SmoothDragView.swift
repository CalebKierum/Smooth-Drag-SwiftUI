//
//  SmoothDragView.swift
//  SmoothSwiftUIDrag
//
//  Created by Caleb Kierum on 3/8/25.
//

import SwiftUI

private struct DragData {
    var isFirstEvent: Bool = true
    var dragOffset: CGSize = .zero
}

struct SmoothDragView<Content: View>: View {
    @ViewBuilder let content: Content

    @GestureState private var dragData: DragData = .init()

    var dragGesture: some Gesture {
        DragGesture()
            .updating($dragData) { value, state, _ in
                if state.isFirstEvent {
                    CADisplayLink.enableProMotion()
                    state.isFirstEvent = false
                }
                state.dragOffset = value.translation
            }
            .onEnded { _ in
                CADisplayLink.disableProMotion()
            }
    }

    var body: some View {
        content
            .offset(dragData.dragOffset)
            .gesture(dragGesture)
    }
}
