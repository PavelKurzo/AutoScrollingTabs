//
//  Product.swift
//  AutoScrollingTabs
//
//  Created by Павел Курзо on 09/03/2023.
//

import SwiftUI

struct ModelData: Identifiable,Hashable {
    var id: UUID = UUID()
    var type: ModelType
    var title: String
    var subtitle: String
    var price: String
    var image: String = ""
}

enum ModelType: String,CaseIterable {
    case horses = "Horses"
    case owners = "Owners"
    case hoovesColors = "Hooves"
    case hoofMaterials = "Material"
    case contacts = "Contacts"
    
    var tabID: String {
        return self.rawValue + self.rawValue.prefix(4)
    }
}

var products: [ModelData] = [
    ModelData(type: .horses, title: "Thunderbolt", subtitle: "Arabian Horse", price: "$100000",image: "horse1"),
    ModelData(type: .horses, title: "Midnight", subtitle: "Thoroughbred Horse", price: "$15000",image: "horse2"),
    ModelData(type: .horses, title: "Pegasus", subtitle: "Quarter Horse", price: "$50000",image: "horse3"),
    ModelData(type: .horses, title: "Spirit", subtitle: "Andalusian Horse", price: "$80000", image: "horse4"),
    ModelData(type: .horses, title: "Shadow", subtitle: "Friesian Horse", price: "$25000", image: "horse5"),

    ModelData(type: .owners, title: "Samantha", subtitle: "Patel", price: "$Shadow", image: "owner1"),
    ModelData(type: .owners, title: "William", subtitle: "Foster", price: "$Midnight", image: "owner2"),
    ModelData(type: .owners, title: "Emily", subtitle: "Chen", price: "$Thunderbolt", image: "owner3"),
    ModelData(type: .owners, title: "David", subtitle: "Nguyen", price: "$Pegasus", image: "owner4"),
    ModelData(type: .owners, title: "Rachel", subtitle: "Kim", price: "$Spirit", image: "owner5"),

    ModelData(type: .hoovesColors, title: "Silver", subtitle: "", price: "$199", image: "silver"),
    ModelData(type: .hoovesColors, title: "Black", subtitle: "", price: "299", image: "black"),
    ModelData(type: .hoovesColors, title: "Gold", subtitle: "", price: "$399", image: "gold"),
    ModelData(type: .hoovesColors, title: "Copper", subtitle: "", price: "$99", image: "copper"),
    ModelData(type: .hoovesColors, title: "Red", subtitle: "", price: "1299", image: "red"),

    ModelData(type: .hoofMaterials, title: "Steel", subtitle: "", price: "$199", image: "steelM"),
    ModelData(type: .hoofMaterials, title: "Copper", subtitle: "", price: "299", image: "copperM"),
    ModelData(type: .hoofMaterials, title: "Aluminium", subtitle: "", price: "$399", image: "aluminiumM"),

    ModelData(type: .contacts, title: "Sarah Thompson", subtitle: "Marketing Manager", price: "+1 (555) 123-4567", image: "asisstant1"),
    ModelData(type: .contacts, title: "James Rodriguez", subtitle: "Trainer", price: "+1 (555) 987-6543", image: "asisstant2"),
    ModelData(type: .contacts, title: " Emily Lee", subtitle: "Stable Manager", price: "+1 (555) 555-1212", image: "asisstant3"),
]
