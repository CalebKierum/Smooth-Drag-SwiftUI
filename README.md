# Smooth Drag In SwiftUI
Theres something about a smooth 120hz animation satifys me to my core. This is why I was dissapointed to find out that SwiftUI does not allow you to run a smooth 120hz drag animation without a workaround, even on devices that support Pro Motion.

# What is Pro Motion
Pro Motion is the name for variable frame rate displays on Apple Products. Unlike a game which may want to target a constant framerate, apps more often than not do not have content animating at all times. Apps often run on devices on battery power meaning that a good app developer will carefully think about when they actaully need a high frame rate (up to 120hz/120fps) and when they can let the app refresh the screen as low as 1Hz (1fps) on some newer devices.

Normally system components handle this perfectly. A scroll view for example will, as a default behavior, not update at 120hz until it is scrolled. This way you get the best of both worlds. You arent using excess power to draw frames that arent going to be different than the previous one and youll be able to give the user a smooth and buttery experience.

# How you can enable 120hz animations for non system UI in SwiftUI

1. Add the key `CADisableMinimumFrameDurationOnPhone` `true` to your apps info plist.
<img width="937" alt="Screenshot 2025-03-08 at 2 22 28 PM" src="https://github.com/user-attachments/assets/e771ee30-52ef-4a08-877c-901ac246500c" />

2. See the file `SharedDisplayLink.swift` what this file is doing is simple. It is storing a `DisplayLink` object in a singleton so that any component in SwiftUI can request a higher framerate.

3. In your DragGesture request higher framerates when the gesture starts then turn it off when the gesture finishes so that the app can preserve battery.

It is important to note many older devices do not support pro motion and pro motion (above 60hz) is disabled if low power mode is enabled.

# Video

https://github.com/user-attachments/assets/98bf1418-d227-4fe4-89c6-15cef6887add

