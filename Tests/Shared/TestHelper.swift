import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

struct TestHelper {
    static func data(_ length : Int) -> Data {
        let buffer = [UInt8](repeating: 0, count: length)
        return Data(bytes: buffer)
    }

    static func triggerApplicationEvents() {
        #if os(iOS)
        NotificationCenter.default.post(name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.post(name: UIApplication.willTerminateNotification, object: nil)
        #elseif os(tvOS)
        NotificationCenter.default.post(name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
        NotificationCenter.default.post(name: Notification.Name.UIApplicationWillTerminate, object: nil)
        #else
        NotificationCenter.default.post(name: NSApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.post(name: NSApplication.didResignActiveNotification, object: nil)
        #endif
    }
}
