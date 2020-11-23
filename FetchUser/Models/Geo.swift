// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let geo = try? newJSONDecoder().decode(Geo.self, from: jsonData)

import Foundation

// MARK: - Geo
class Geo: Codable {
    var lat: String?
    var lng: String?

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }

    init(lat: String?, lng: String?) {
        self.lat = lat
        self.lng = lng
    }
}
