import SwiftUI

struct ContentView: View {
    @State private var questions = [Question]()

    var body: some View {
        NavigationStack {
            List(questions) { question in
                VStack {
                    Text(question.title)
                        .font(.title2)
                }
            }
            .padding()
            .navigationTitle("Questions")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            do {
                let fetchedQuestions = try await fetchQuestionsFromAPI()
                questions = fetchedQuestions
            } catch {
                questions = []
            }
        }
    }

    func fetchQuestionsFromAPI() async throws -> [Question] {
        let url = URL(string: "https://api.stackexchange.com/2.3/questions?page=1&todate=1725148800&order=desc&max=1725235200&sort=activity&site=stackoverflow")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(QuestionsResponse.self, from: data)
        return decoded.items
    }

}
#Preview {
    ContentView()
}

