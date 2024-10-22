import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.questions) { question in
                    NavigationLink(value: question) {
                        Text(question.title)
                    }
                }
            }
            .padding()
            .navigationDestination(for: Question.self) { question in
                QuestionDetail(question: question)
            }
            .navigationTitle("Questions")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.grouped)
        }
        .refreshable {
            await viewModel.fetchQuestions()
        }
        .task {
            await viewModel.fetchQuestions()
        }
    }
}
#Preview {
    ContentView()
}
