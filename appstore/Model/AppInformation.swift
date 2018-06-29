class AppInformation: Decodable {
    let name: String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
    }
}
