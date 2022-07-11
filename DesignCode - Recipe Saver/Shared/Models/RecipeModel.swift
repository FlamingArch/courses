//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    var id = UUID()
    
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category
    let datePublished: String
    let url: String
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(
            name: "Oats Porridge",
            image: "https://www.vegrecipesofindia.com/wp-content/uploads/2015/05/oats-porridge-recipe-quick.jpg",
            description:"""
               Oats porridge recipe with step by step pics – quick oats porridge made with quick-cooking oats or rolled oats. This is an easy, low-fat porridge made in just 6 minutes. Oats porridge is one porridge I had a dislike for a long time. It was one food which was given to me twice or thrice every day as a toddler and even later. Sometimes too much of anything does more harm than good. So naturally, I avoided oats in my life like anything. I do make this porridge for the family, but its never for me :-). Slowly slowly I have now got used to having oats in my diet like in Oats idli, Oats dosa or Oats upma recipe. Making a porridge with oats just takes about 5 to 6 minutes to cook And is a real quick recipe. With the morning hours getting too busy at times, this oats porridge recipe can come to your rescue as a quick instant breakfast.
               
               This oats porridge can be served to kids as well as adults. While making for toddlers & babies, you need to powder the oats and then make the porridge. Also, avoid adding any dry fruits or large chunks of fruits to the porridge. You can add mango puree, mashed bananas or apple puree and mix it with the powdered oats porridge once it becomes warm or cools down. Avoid making the porridge with milk, if you plan to add fruit purees in the end. Since milk and fruits are an incompatible combination as per Ayurveda.
               
               While buying oats or oats products for babies, do check the contents on the pack. Its should only mention oats and no other flavorings or additional ingredients.
               
               You can easily make the oats porridge with only water or with only milk or a combo of both. I make the porridge with only water and with a combination of both water+milk. the recipe can be easily doubled or tripled.
               
               Oats porridge can be served hot or warm or at room temperature.
               """,
            ingredients: """
                1. ½ cup quick cooking oats or rolled oats
                2. 2 cups water + ½ to 1 cup milk or 2 to 2.5 cups water or 2 to 2.5 cups milk
                3. 2 tablespoon sugar or add as per taste - optional
                """,
            directions: """
               1. Take ½ cup quick-cooking oats or rolled oats in a pan.
               2. Add 2 cups of water.
               3. Then add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water.
               4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic.
               5. Stir very well and heat the oats porridge mixture on a low to medium flame.
               6. Do stir often at times and allow the porridge to simmer.
               7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes.
               8. Serve oats porridge hot or warm or at room temperature. If serving oats porridge at room temperature then do note that it will thicken more as it cools. If adding chopped fruits, then add it when the porridge becomes lukewarm or cooled down completely. You can also add chopped dry fruits of your choice.
               """,
            category: .breakfast,
            datePublished: "2020-08-21",
            url: "https://www.vegrecipesofindia.com/oats-porridge-recipe/"
        ),
        Recipe(
            name: "Aloo Paratha",
            image: "https://www.vegrecipesofindia.com/wp-content/uploads/2009/08/aloo-paratha-recipe-4.jpg",
            description:"""
               Oats porridge recipe with step by step pics – quick oats porridge made with quick-cooking oats or rolled oats. This is an easy, low-fat porridge made in just 6 minutes. Oats porridge is one porridge I had a dislike for a long time. It was one food which was given to me twice or thrice every day as a toddler and even later. Sometimes too much of anything does more harm than good. So naturally, I avoided oats in my life like anything. I do make this porridge for the family, but its never for me :-). Slowly slowly I have now got used to having oats in my diet like in Oats idli, Oats dosa or Oats upma recipe. Making a porridge with oats just takes about 5 to 6 minutes to cook And is a real quick recipe. With the morning hours getting too busy at times, this oats porridge recipe can come to your rescue as a quick instant breakfast.
               
               This oats porridge can be served to kids as well as adults. While making for toddlers & babies, you need to powder the oats and then make the porridge. Also, avoid adding any dry fruits or large chunks of fruits to the porridge. You can add mango puree, mashed bananas or apple puree and mix it with the powdered oats porridge once it becomes warm or cools down. Avoid making the porridge with milk, if you plan to add fruit purees in the end. Since milk and fruits are an incompatible combination as per Ayurveda.
               
               While buying oats or oats products for babies, do check the contents on the pack. Its should only mention oats and no other flavorings or additional ingredients.
               
               You can easily make the oats porridge with only water or with only milk or a combo of both. I make the porridge with only water and with a combination of both water+milk. the recipe can be easily doubled or tripled.
               
               Oats porridge can be served hot or warm or at room temperature.
               """,
            ingredients: """
                1. ½ cup quick cooking oats or rolled oats
                2. 2 cups water + ½ to 1 cup milk or 2 to 2.5 cups water or 2 to 2.5 cups milk
                3. 2 tablespoon sugar or add as per taste - optional
                """,
            directions: """
               1. Take ½ cup quick-cooking oats or rolled oats in a pan.
               2. Add 2 cups of water.
               3. Then add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water.
               4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic.
               5. Stir very well and heat the oats porridge mixture on a low to medium flame.
               6. Do stir often at times and allow the porridge to simmer.
               7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes.
               8. Serve oats porridge hot or warm or at room temperature. If serving oats porridge at room temperature then do note that it will thicken more as it cools. If adding chopped fruits, then add it when the porridge becomes lukewarm or cooled down completely. You can also add chopped dry fruits of your choice.
               """,
            category: .breakfast,
            datePublished: "2020-08-21",
            url: "https://www.vegrecipesofindia.com/oats-porridge-recipe/"
        ),
        Recipe(
            name: "Potato 65",
            image: "https://www.vegrecipesofindia.com/wp-content/uploads/2012/10/potato-65-recipe.jpg",
            description:"""
               Oats porridge recipe with step by step pics – quick oats porridge made with quick-cooking oats or rolled oats. This is an easy, low-fat porridge made in just 6 minutes. Oats porridge is one porridge I had a dislike for a long time. It was one food which was given to me twice or thrice every day as a toddler and even later. Sometimes too much of anything does more harm than good. So naturally, I avoided oats in my life like anything. I do make this porridge for the family, but its never for me :-). Slowly slowly I have now got used to having oats in my diet like in Oats idli, Oats dosa or Oats upma recipe. Making a porridge with oats just takes about 5 to 6 minutes to cook And is a real quick recipe. With the morning hours getting too busy at times, this oats porridge recipe can come to your rescue as a quick instant breakfast.
               
               This oats porridge can be served to kids as well as adults. While making for toddlers & babies, you need to powder the oats and then make the porridge. Also, avoid adding any dry fruits or large chunks of fruits to the porridge. You can add mango puree, mashed bananas or apple puree and mix it with the powdered oats porridge once it becomes warm or cools down. Avoid making the porridge with milk, if you plan to add fruit purees in the end. Since milk and fruits are an incompatible combination as per Ayurveda.
               
               While buying oats or oats products for babies, do check the contents on the pack. Its should only mention oats and no other flavorings or additional ingredients.
               
               You can easily make the oats porridge with only water or with only milk or a combo of both. I make the porridge with only water and with a combination of both water+milk. the recipe can be easily doubled or tripled.
               
               Oats porridge can be served hot or warm or at room temperature.
               """,
            ingredients: """
                1. ½ cup quick cooking oats or rolled oats
                2. 2 cups water + ½ to 1 cup milk or 2 to 2.5 cups water or 2 to 2.5 cups milk
                3. 2 tablespoon sugar or add as per taste - optional
                """,
            directions: """
               1. Take ½ cup quick-cooking oats or rolled oats in a pan.
               2. Add 2 cups of water.
               3. Then add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water.
               4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic.
               5. Stir very well and heat the oats porridge mixture on a low to medium flame.
               6. Do stir often at times and allow the porridge to simmer.
               7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes.
               8. Serve oats porridge hot or warm or at room temperature. If serving oats porridge at room temperature then do note that it will thicken more as it cools. If adding chopped fruits, then add it when the porridge becomes lukewarm or cooled down completely. You can also add chopped dry fruits of your choice.
               """,
            category: .breakfast,
            datePublished: "2020-08-21",
            url: "https://www.vegrecipesofindia.com/oats-porridge-recipe/"
        ),
        Recipe(
            name: "Paneer Butter Masala",
            image: "https://www.vegrecipesofindia.com/wp-content/uploads/2020/01/paneer-butter-masala-1.jpg",
            description:"""
               Oats porridge recipe with step by step pics – quick oats porridge made with quick-cooking oats or rolled oats. This is an easy, low-fat porridge made in just 6 minutes. Oats porridge is one porridge I had a dislike for a long time. It was one food which was given to me twice or thrice every day as a toddler and even later. Sometimes too much of anything does more harm than good. So naturally, I avoided oats in my life like anything. I do make this porridge for the family, but its never for me :-). Slowly slowly I have now got used to having oats in my diet like in Oats idli, Oats dosa or Oats upma recipe. Making a porridge with oats just takes about 5 to 6 minutes to cook And is a real quick recipe. With the morning hours getting too busy at times, this oats porridge recipe can come to your rescue as a quick instant breakfast.
               
               This oats porridge can be served to kids as well as adults. While making for toddlers & babies, you need to powder the oats and then make the porridge. Also, avoid adding any dry fruits or large chunks of fruits to the porridge. You can add mango puree, mashed bananas or apple puree and mix it with the powdered oats porridge once it becomes warm or cools down. Avoid making the porridge with milk, if you plan to add fruit purees in the end. Since milk and fruits are an incompatible combination as per Ayurveda.
               
               While buying oats or oats products for babies, do check the contents on the pack. Its should only mention oats and no other flavorings or additional ingredients.
               
               You can easily make the oats porridge with only water or with only milk or a combo of both. I make the porridge with only water and with a combination of both water+milk. the recipe can be easily doubled or tripled.
               
               Oats porridge can be served hot or warm or at room temperature.
               """,
            ingredients: """
                1. ½ cup quick cooking oats or rolled oats
                2. 2 cups water + ½ to 1 cup milk or 2 to 2.5 cups water or 2 to 2.5 cups milk
                3. 2 tablespoon sugar or add as per taste - optional
                """,
            directions: """
               1. Take ½ cup quick-cooking oats or rolled oats in a pan.
               2. Add 2 cups of water.
               3. Then add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water.
               4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic.
               5. Stir very well and heat the oats porridge mixture on a low to medium flame.
               6. Do stir often at times and allow the porridge to simmer.
               7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes.
               8. Serve oats porridge hot or warm or at room temperature. If serving oats porridge at room temperature then do note that it will thicken more as it cools. If adding chopped fruits, then add it when the porridge becomes lukewarm or cooled down completely. You can also add chopped dry fruits of your choice.
               """,
            category: .breakfast,
            datePublished: "2020-08-21",
            url: "https://www.vegrecipesofindia.com/oats-porridge-recipe/"
        ),
        Recipe(
            name: "Chana Masala",
            image: "https://www.vegrecipesofindia.com/wp-content/uploads/2021/07/chana-masala-1.jpg",
            description:"""
               Oats porridge recipe with step by step pics – quick oats porridge made with quick-cooking oats or rolled oats. This is an easy, low-fat porridge made in just 6 minutes. Oats porridge is one porridge I had a dislike for a long time. It was one food which was given to me twice or thrice every day as a toddler and even later. Sometimes too much of anything does more harm than good. So naturally, I avoided oats in my life like anything. I do make this porridge for the family, but its never for me :-). Slowly slowly I have now got used to having oats in my diet like in Oats idli, Oats dosa or Oats upma recipe. Making a porridge with oats just takes about 5 to 6 minutes to cook And is a real quick recipe. With the morning hours getting too busy at times, this oats porridge recipe can come to your rescue as a quick instant breakfast.
               
               This oats porridge can be served to kids as well as adults. While making for toddlers & babies, you need to powder the oats and then make the porridge. Also, avoid adding any dry fruits or large chunks of fruits to the porridge. You can add mango puree, mashed bananas or apple puree and mix it with the powdered oats porridge once it becomes warm or cools down. Avoid making the porridge with milk, if you plan to add fruit purees in the end. Since milk and fruits are an incompatible combination as per Ayurveda.
               
               While buying oats or oats products for babies, do check the contents on the pack. Its should only mention oats and no other flavorings or additional ingredients.
               
               You can easily make the oats porridge with only water or with only milk or a combo of both. I make the porridge with only water and with a combination of both water+milk. the recipe can be easily doubled or tripled.
               
               Oats porridge can be served hot or warm or at room temperature.
               """,
            ingredients: """
                1. ½ cup quick cooking oats or rolled oats
                2. 2 cups water + ½ to 1 cup milk or 2 to 2.5 cups water or 2 to 2.5 cups milk
                3. 2 tablespoon sugar or add as per taste - optional
                """,
            directions: """
               1. Take ½ cup quick-cooking oats or rolled oats in a pan.
               2. Add 2 cups of water.
               3. Then add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water.
               4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic.
               5. Stir very well and heat the oats porridge mixture on a low to medium flame.
               6. Do stir often at times and allow the porridge to simmer.
               7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes.
               8. Serve oats porridge hot or warm or at room temperature. If serving oats porridge at room temperature then do note that it will thicken more as it cools. If adding chopped fruits, then add it when the porridge becomes lukewarm or cooled down completely. You can also add chopped dry fruits of your choice.
               """,
            category: .breakfast,
            datePublished: "2020-08-21",
            url: "https://www.vegrecipesofindia.com/oats-porridge-recipe/"
        ),
        Recipe(
            name: "Dal Makhani",
            image: "https://www.vegrecipesofindia.com/wp-content/uploads/2015/01/dal-makhani-recipe-restaurant-style.jpg",
            description:"""
               Oats porridge recipe with step by step pics – quick oats porridge made with quick-cooking oats or rolled oats. This is an easy, low-fat porridge made in just 6 minutes. Oats porridge is one porridge I had a dislike for a long time. It was one food which was given to me twice or thrice every day as a toddler and even later. Sometimes too much of anything does more harm than good. So naturally, I avoided oats in my life like anything. I do make this porridge for the family, but its never for me :-). Slowly slowly I have now got used to having oats in my diet like in Oats idli, Oats dosa or Oats upma recipe. Making a porridge with oats just takes about 5 to 6 minutes to cook And is a real quick recipe. With the morning hours getting too busy at times, this oats porridge recipe can come to your rescue as a quick instant breakfast.
               
               This oats porridge can be served to kids as well as adults. While making for toddlers & babies, you need to powder the oats and then make the porridge. Also, avoid adding any dry fruits or large chunks of fruits to the porridge. You can add mango puree, mashed bananas or apple puree and mix it with the powdered oats porridge once it becomes warm or cools down. Avoid making the porridge with milk, if you plan to add fruit purees in the end. Since milk and fruits are an incompatible combination as per Ayurveda.
               
               While buying oats or oats products for babies, do check the contents on the pack. Its should only mention oats and no other flavorings or additional ingredients.
               
               You can easily make the oats porridge with only water or with only milk or a combo of both. I make the porridge with only water and with a combination of both water+milk. the recipe can be easily doubled or tripled.
               
               Oats porridge can be served hot or warm or at room temperature.
               """,
            ingredients: """
                1. ½ cup quick cooking oats or rolled oats
                2. 2 cups water + ½ to 1 cup milk or 2 to 2.5 cups water or 2 to 2.5 cups milk
                3. 2 tablespoon sugar or add as per taste - optional
                """,
            directions: """
               1. Take ½ cup quick-cooking oats or rolled oats in a pan.
               2. Add 2 cups of water.
               3. Then add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water.
               4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic.
               5. Stir very well and heat the oats porridge mixture on a low to medium flame.
               6. Do stir often at times and allow the porridge to simmer.
               7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes.
               8. Serve oats porridge hot or warm or at room temperature. If serving oats porridge at room temperature then do note that it will thicken more as it cools. If adding chopped fruits, then add it when the porridge becomes lukewarm or cooled down completely. You can also add chopped dry fruits of your choice.
               """,
            category: .breakfast,
            datePublished: "2020-08-21",
            url: "https://www.vegrecipesofindia.com/oats-porridge-recipe/"
        ),
    ]
}
