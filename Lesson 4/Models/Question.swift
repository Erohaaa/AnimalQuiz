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
                text: "Какую пищу вы предпочитаете?",
                type: .single,
                answers: [
                    Answer.init(text: "Steak", type: .dog),
                    Answer.init(text: "Fish", type: .cat),
                    Answer.init(text: "Carrot", type: .rabbit),
                    Answer.init(text: "Kukuruza", type: .turtle)
                ]
            ),
            Question(
                text: "Что вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer.init(text: "Плавать", type: .turtle),
                    Answer.init(text: "Спать", type: .cat),
                    Answer.init(text: "Обниматься", type: .rabbit),
                    Answer.init(text: "Есть", type: .dog)
                ]
            ),
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer.init(text: "Ненавижу", type: .cat),
                    Answer.init(text: "Нервничаю", type: .rabbit),
                    Answer.init(text: "Нейтрально", type: .turtle),
                    Answer.init(text: "Обожаю", type: .dog)
                ]
            )
        ]
    }
}

