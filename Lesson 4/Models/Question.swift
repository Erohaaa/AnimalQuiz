//
//  Question.swift
//  Lesson 4
//
//  Created by oleg on 11.05.2022.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Яку їжу ви полюбляєте?",
                type: .single,
                answers: [
                    Answer.init(text: "Стейк", type: .dog),
                    Answer.init(text: "Риба", type: .cat),
                    Answer.init(text: "Морква", type: .rabbit),
                    Answer.init(text: "Кукурудза", type: .turtle)
                ]
            ),
            Question(
                text: "Що вам подобається більше?",
                type: .multiple,
                answers: [
                    Answer.init(text: "Плавати", type: .turtle),
                    Answer.init(text: "Спати", type: .cat),
                    Answer.init(text: "Обійматися", type: .rabbit),
                    Answer.init(text: "Їсти", type: .dog)
                ]
            ),
            Question(
                text: "Чи полюбляєте ви їздити на авто?",
                type: .ranged,
                answers: [
                    Answer.init(text: "Ненавиджу", type: .cat),
                    Answer.init(text: "Нервую", type: .rabbit),
                    Answer.init(text: "Нейтрально", type: .turtle),
                    Answer.init(text: "Обожнюю", type: .dog)
                ]
            )
        ]
    }
}

