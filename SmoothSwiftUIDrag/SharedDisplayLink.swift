//
//  SharedDisplayLink.swift
//  SmoothSwiftUIDrag
//
//  Created by Caleb Kierum on 3/6/25.
//

import UIKit

extension CADisplayLink {
    @MainActor private static var swiftUIDisplayLink: DisplayLink = .init()

    @MainActor static func enableProMotion() {
        swiftUIDisplayLink.enableProMotion()
    }

    @MainActor static func disableProMotion() {
        swiftUIDisplayLink.disableProMotion()
    }
}

// There is no need to expose this, so let's put it in a private extension
private extension CADisplayLink {
    @MainActor
    private class DisplayLink: NSObject {
        private var displayLink: CADisplayLink!

        private var proMotionEnabledCount: Int = 0

        override init() {
            super.init()

            displayLink = CADisplayLink(target: self, selector: #selector(handler))
            displayLink.add(to: .main, forMode: .default)
        }

        @objc func handler(_ displayLink: CADisplayLink) {
            // Nothing to do
        }

        public func enableProMotion() {
            if proMotionEnabledCount == 0 {
                displayLink.preferredFrameRateRange = CAFrameRateRange(minimum: 90, maximum: 120, preferred: 120)
            }
            proMotionEnabledCount += 1
        }

        public func disableProMotion() {
            proMotionEnabledCount -= 1
            if proMotionEnabledCount == 0 {
                displayLink.preferredFrameRateRange = CAFrameRateRange.default
            }
        }
    }
}
