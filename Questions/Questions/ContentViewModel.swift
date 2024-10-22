import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        var questions = [Question]()
        var network: NetworkProtocol
        
        init(network: NetworkProtocol = Network()) {
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
