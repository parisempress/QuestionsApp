import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        var questions = [Question]()
        var network: Network

        // TODO: Add dependency injection
        init(network: Network = Network()) {
            self.network = network
        }

        func fetchQuestions() async {
            do {
                questions = try await network.fetchQuestionsFromAPI()
            } catch {
                questions = []
                print("\(error)")
            }
        }
    }
}
