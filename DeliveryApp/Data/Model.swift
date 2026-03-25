//
//  Model.swift
//  DeliveryApp
//

import Foundation

// MARK: - Models

struct Restaurant {
    let id: String
    let name: String
    let imageName: String
    let rating: Double
    let deliveryFee: Double
    let distance: Double
    let isOpen: Bool
    let categories: [String]
    let foods: [Food]
}

struct Food {
    let id: String
    let name: String
    let description: String
    let price: Double
    let imageName: String
    let category: String
    let isAvailable: Bool
}

struct Banner {
    let id: String
    let title: String
    let subtitle: String
    let imageName: String
    let gradientColors: [String]
}

// MARK: - Mock Data

enum MockData {

    static let categories: [String] = [
        "Tất cả", "Chicken", "Pizza", "Sushi", "BBQ", "Burger", "Pasta", "Drinks", "Desserts"
    ]

    static let banners: [Banner] = [
        Banner(
            id: "bn1",
            title: "Giảm 50%",
            subtitle: "Đơn hàng đầu tiên của bạn",
            imageName: "Delivery guy",
            gradientColors: ["FF6B35", "F7C59F"]
        ),
        Banner(
            id: "bn2",
            title: "Miễn phí ship",
            subtitle: "Đơn từ 100.000đ trở lên",
            imageName: "Burger",
            gradientColors: ["2DC653", "A8E6CF"]
        ),
        Banner(
            id: "bn3",
            title: "Món mới",
            subtitle: "Khám phá thực đơn hôm nay",
            imageName: "Chef cooking",
            gradientColors: ["5B5EA6", "B8B5FF"]
        ),
        Banner(
            id: "bn4",
            title: "Combo tiết kiệm",
            subtitle: "Chỉ từ 99.000đ / combo",
            imageName: "Birthday girl",
            gradientColors: ["E84393", "FFB3D9"]
        )
    ]

    static let restaurants: [Restaurant] = [

        // MARK: - CHICKEN

        Restaurant(
            id: "r1",
            name: "Bobo Chicken House",
            imageName: "restaurant1",
            rating: 4.6,
            deliveryFee: 15000,
            distance: 1.2,
            isOpen: true,
            categories: ["Chicken", "Burger", "Rice"],
            foods: [

                Food(id: "c1", name: "Fried Chicken Original", description: "Crispy fried chicken", price: 45000, imageName: "food1", category: "Chicken", isAvailable: true),
                Food(id: "c2", name: "Spicy Fried Chicken", description: "Hot & crispy", price: 47000, imageName: "food2", category: "Chicken", isAvailable: true),
                Food(id: "c3", name: "Honey Butter Chicken", description: "Sweet honey glaze", price: 52000, imageName: "food3", category: "Chicken", isAvailable: true),
                Food(id: "c4", name: "BBQ Chicken", description: "Grilled BBQ style", price: 55000, imageName: "food4", category: "Chicken", isAvailable: true),
                Food(id: "c5", name: "Garlic Chicken", description: "Garlic sauce flavor", price: 53000, imageName: "food5", category: "Chicken", isAvailable: true),
                Food(id: "c6", name: "Chicken Wings 6pcs", description: "Crispy wings", price: 65000, imageName: "food6", category: "Chicken", isAvailable: true),
                Food(id: "c7", name: "Chicken Nuggets", description: "8pcs nuggets", price: 48000, imageName: "food7", category: "Chicken", isAvailable: true),

                Food(id: "c8", name: "Chicken Burger", description: "Grilled chicken burger", price: 60000, imageName: "food8", category: "Burger", isAvailable: true),
                Food(id: "c9", name: "Double Chicken Burger", description: "Double patty", price: 75000, imageName: "food9", category: "Burger", isAvailable: true),
                Food(id: "c10", name: "Cheese Chicken Burger", description: "With cheddar cheese", price: 68000, imageName: "food10", category: "Burger", isAvailable: true),
                Food(id: "c11", name: "Chicken Wrap", description: "Tortilla wrap", price: 55000, imageName: "food11", category: "Burger", isAvailable: true),

                Food(id: "c12", name: "Chicken Rice", description: "Rice with grilled chicken", price: 50000, imageName: "food12", category: "Rice", isAvailable: true),
                Food(id: "c13", name: "Spicy Chicken Rice", description: "Extra spicy", price: 52000, imageName: "food13", category: "Rice", isAvailable: true),
                Food(id: "c14", name: "Teriyaki Chicken Rice", description: "Japanese style", price: 58000, imageName: "food14", category: "Rice", isAvailable: true),
                Food(id: "c15", name: "Chicken Combo 1", description: "Chicken + Coke", price: 99000, imageName: "food15", category: "Combo", isAvailable: true),
                Food(id: "c16", name: "Chicken Combo 2", description: "Chicken + Fries", price: 105000, imageName: "food16", category: "Combo", isAvailable: true)
            ]
        ),

        // MARK: - PIZZA

        Restaurant(
            id: "r2",
            name: "Bobo Pizza World",
            imageName: "restaurant2",
            rating: 4.8,
            deliveryFee: 20000,
            distance: 2.5,
            isOpen: true,
            categories: ["Pizza", "Pasta"],
            foods: [

                Food(id: "p1", name: "Pepperoni Pizza", description: "Classic pepperoni", price: 120000, imageName: "food17", category: "Pizza", isAvailable: true),
                Food(id: "p2", name: "Cheese Pizza", description: "Mozzarella cheese", price: 100000, imageName: "food18", category: "Pizza", isAvailable: true),
                Food(id: "p3", name: "Seafood Pizza", description: "Shrimp & squid", price: 150000, imageName: "food19", category: "Pizza", isAvailable: true),
                Food(id: "p4", name: "BBQ Chicken Pizza", description: "BBQ chicken topping", price: 135000, imageName: "food20", category: "Pizza", isAvailable: true),
                Food(id: "p5", name: "Hawaiian Pizza", description: "Ham & pineapple", price: 125000, imageName: "food1", category: "Pizza", isAvailable: true),

                Food(id: "p6", name: "Spaghetti Bolognese", description: "Beef sauce pasta", price: 95000, imageName: "food2", category: "Pasta", isAvailable: true),
                Food(id: "p7", name: "Carbonara", description: "Creamy bacon pasta", price: 99000, imageName: "food3", category: "Pasta", isAvailable: true),
                Food(id: "p8", name: "Seafood Pasta", description: "Shrimp & mussels", price: 110000, imageName: "food4", category: "Pasta", isAvailable: true)
            ]
        ),

        // MARK: - SUSHI

        Restaurant(
            id: "r3",
            name: "Bobo Sushi Bar",
            imageName: "restaurant3",
            rating: 4.7,
            deliveryFee: 25000,
            distance: 3.1,
            isOpen: true,
            categories: ["Sushi", "Roll"],
            foods: [

                Food(id: "s1", name: "Salmon Sushi", description: "Fresh salmon slice", price: 90000, imageName: "food5", category: "Sushi", isAvailable: true),
                Food(id: "s2", name: "Tuna Sushi", description: "Fresh tuna slice", price: 95000, imageName: "food6", category: "Sushi", isAvailable: true),
                Food(id: "s3", name: "Ebi Sushi", description: "Shrimp sushi", price: 85000, imageName: "food7", category: "Sushi", isAvailable: true),
                Food(id: "s4", name: "California Roll", description: "Crab & avocado", price: 80000, imageName: "food8", category: "Roll", isAvailable: true),
                Food(id: "s5", name: "Dragon Roll", description: "Eel & avocado", price: 120000, imageName: "food9", category: "Roll", isAvailable: true),
                Food(id: "s6", name: "Tempura Roll", description: "Shrimp tempura", price: 100000, imageName: "food10", category: "Roll", isAvailable: true)
            ]
        ),

        // MARK: - BBQ

        Restaurant(
            id: "r4",
            name: "Bobo BBQ Grill",
            imageName: "restaurant4",
            rating: 4.4,
            deliveryFee: 18000,
            distance: 2.0,
            isOpen: true,
            categories: ["BBQ"],
            foods: [

                Food(id: "b1", name: "BBQ Pork", description: "Grilled pork", price: 110000, imageName: "food11", category: "BBQ", isAvailable: true),
                Food(id: "b2", name: "Grilled Beef", description: "Premium beef", price: 140000, imageName: "food12", category: "BBQ", isAvailable: true),
                Food(id: "b3", name: "BBQ Chicken Skewers", description: "Chicken skewers", price: 90000, imageName: "food13", category: "BBQ", isAvailable: true),
                Food(id: "b4", name: "BBQ Ribs", description: "Pork ribs", price: 160000, imageName: "food14", category: "BBQ", isAvailable: true)
            ]
        ),

        // MARK: - DRINKS

        Restaurant(
            id: "r5",
            name: "Bobo Drinks & Desserts",
            imageName: "restaurant5",
            rating: 4.9,
            deliveryFee: 12000,
            distance: 0.8,
            isOpen: true,
            categories: ["Tea", "Coffee"],
            foods: [

                Food(id: "d1", name: "Milk Tea", description: "Brown sugar milk tea", price: 45000, imageName: "food15", category: "Tea", isAvailable: true),
                Food(id: "d2", name: "Peach Tea", description: "Fresh peach tea", price: 40000, imageName: "food16", category: "Tea", isAvailable: true),
                Food(id: "d3", name: "Black Coffee", description: "Vietnamese coffee", price: 30000, imageName: "food17", category: "Coffee", isAvailable: true),
                Food(id: "d4", name: "Latte", description: "Milk coffee", price: 45000, imageName: "food18", category: "Coffee", isAvailable: true),
                Food(id: "d5", name: "Cappuccino", description: "Italian style", price: 50000, imageName: "food19", category: "Coffee", isAvailable: true)
            ]
        )
    ]
}
