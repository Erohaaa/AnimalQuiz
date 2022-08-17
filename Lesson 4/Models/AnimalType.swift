//
//  AnumalType.swift
//  Lesson 4
//
//  Created by oleg on 11.05.2022.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case turtle = "🐢"
    case rabbit = "🐰"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями, вы окружаете себя людьми, которые вам нравяться."
        case .cat:
            return "Вы сами себе на уме. Вы цените одиночество."
        case .turtle:
            return "Ваша сила в мудрости. Медленный и вдумчивый. Выигрывает на больших дистанциях"
        case .rabbit:
            return "Вы непоседа. Любите спортивный образ жизни. Здоровы и энергичны."
            
    }
}
}
