import UIKit

class Category: NSObject {
    @objc
    var type: String?
    @objc
    var name: String?
    @objc
    var apps: [App]?

    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            apps = [App]()
            if let value = value as? [[String: Any]] {
                for object in value {
                    let app = App()
                    app.setValuesForKeys(object)
                    apps?.append(app)
                }
            }
        }
    }
}
