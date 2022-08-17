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
            return "Ви полюбляєте бути з друзями, ви оточуєте себе людьми, які вам подобаються."
        case .cat:
            return "Ви самі по собі та цінуєте самотність."
        case .turtle:
            return "Ваша сила в розумі. Повільний і вдумливий. Виграєте на більших дистанціях"
        case .rabbit:
            return "Ви не любите сидіти на місці. Любите спортивний спосіб життя. Здорові та енергійні."
            
    }
}
}
