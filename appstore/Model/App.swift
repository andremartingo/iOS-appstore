class App: Decodable {
    var appId: Int?
    var name: String?
    var category: String?
    var imageName: String?
    var price: Double?
    var screenshots: [String]?
    var desc: String?
    var appInformation: [AppInformation]?

    enum CodingKeys: String, CodingKey {
        case appId = "Id"
        case name = "Name"
        case category = "Category"
        case imageName = "ImageName"
        case price = "Price"
        case screenshots = "Screenshots"
        case desc = "description"
        case appInformation
    }
}
