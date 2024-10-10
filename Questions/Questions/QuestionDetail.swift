import SwiftUI

struct QuestionDetail: View {
    let question: Question
    var body: some View {
        VStack {
            Section {
                Text("\(question.body.stripHTML)")
                Link("See Answer", destination: URL(string: "\(question.link)")!)
                    .font(.subheadline)
                    .foregroundStyle(.blue)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension String {
    var stripHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
