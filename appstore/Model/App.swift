import UIKit

class App: NSObject {
    @objc
    var id: NSNumber?
    @objc
    var name: String?
    @objc
    var category: String?
    @objc
    var imageName: String?
    @objc
    var price: NSNumber?
    @objc
    var screenshots: [String]?
    @objc
    var desc: String?
    @objc
    var appInformation: NSNumber?

    override func setValue(_ value: Any?, forKey key: String) {
        if key == "description"{
            self.desc = value as? String
        } else {
            super.setValue(value, forKey: key)
        }
    }
}
