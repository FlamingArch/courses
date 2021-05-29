//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return Text("Sup")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//List {
//    Section(header: Text("Section 1")) {
//        Text("Static row 1")
//        Text("Static row 2")
//    }
//    Section(header: Text("Section 2")) {
//        ForEach(0..<5) {
//            Text("Dynamic row \($0)")
//        }
//    }
//    Section(header: Text("Section 3")) {
//        Text("Static row 3")
//        Text("Static row 4")
//
//    }
//}
//.listStyle(InsetGroupedListStyle())


//List(0..<5) {
//    Text("Dynamic row \($0)")
//}
//.listStyle(InsetGroupedListStyle())

//let people = ["Finn", "Leia", "Luke", "Rey"]
//
//var body: some View {
//    List(people, id: \.self) {
//        Text("\($0)")
//    }
//    .listStyle(InsetGroupedListStyle())
//}

//let input = "a b c"
//let letters = input.components(separatedBy: " ")
//let letter = letters.randomElement()
//let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

//if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: ".txt"){
//    if let fileContents = try? String(contentsOf: fileURL) {
//
//    }
//}

//let word = "swift"
//let checker = UITextChecker()
//let range = NSRange(location: 0, length: word.utf16.count)
//let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//let allGood = misspelledRange.location == NSNotFound
