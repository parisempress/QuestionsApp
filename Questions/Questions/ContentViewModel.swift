import SwiftUI

extension ContentView {

    @Observable
    class ViewModel: Network {
        var questions = [Question]()

        func fetchQuestions() async {
            do {
                let fetchQuestions = try await fetchQuestionsFromAPI()
                questions = fetchQuestions
            } catch {
                questions = []
                print("\(error)")
            }
        }
    }
}
