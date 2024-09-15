import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        var questions = [Question]()

        func fetchQuestionsFromAPI() async throws -> [Question] {
            let url = URL(string: "https://api.stackexchange.com/2.3/questions?fromdate=1725753600&todate=1726358400&order=desc&sort=activity&site=stackoverflow&filter=!nNPvSNPI7A")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(QuestionsResponse.self, from: data)
            return decoded.items
        }

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

//"https://api.stackexchange.com/2//.3/questions?page=1&todate=1725148800&order=desc&max=1725235200&sort=activity&site=stackoverflow"
