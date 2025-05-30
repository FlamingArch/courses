//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit:addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    .autocapitalization(.none)
                
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                Text("Score: \(score)")
                    .padding()
            }
            .onAppear(perform: startGame)
            .toolbar {
                Button("Restart Game") {
                    score = 0
                    usedWords = [String]()
                    startGame()
                }
            }
            .navigationTitle(rootWord)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            return
        }
        guard newWord != rootWord else {
            wordError(title: "Word same as root", message: "Don't copy paste")
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognised", message: "You can't just make it up, you know?")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word")
            return
        }
        score += answer.count
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from the bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        if (word.count <= 3) {
            errorMessage = "Word too Short"
            return false
        } else {
            let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            return misspelledRange.location == NSNotFound
        }
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
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
//
//
//List(0..<5) {
//    Text("Dynamic row \($0)")
//}
//.listStyle(InsetGroupedListStyle())
//
//let people = ["Finn", "Leia", "Luke", "Rey"]
//
//var body: some View {
//    List(people, id: \.self) {
//        Text("\($0)")
//    }
//    .listStyle(InsetGroupedListStyle())
//}
//
//let input = "a b c"
//let letters = input.components(separatedBy: " ")
//let letter = letters.randomElement()
//let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//
//if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: ".txt"){
//    if let fileContents = try? String(contentsOf: fileURL) {
//
//    }
//}
//
//let word = "swift"
//let checker = UITextChecker()
//let range = NSRange(location: 0, length: word.utf16.count)
//let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//let allGood = misspelledRange.location == NSNotFound
