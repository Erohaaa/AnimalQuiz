//
//  ResultsViewController.swift
//  Lesson 4
//
//  Created by oleg on 14.05.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var whatAnimalAreYou: UILabel!
    @IBOutlet var textAboutYou: UILabel!
    @IBOutlet var myResult: UILabel!
    
    var surveyResults: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    
}

extension ResultsViewController {
    
    private func updateResult() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = surveyResults.map { $0.type }
    
        
        for animal in animals { // dog
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
//Метод сокращения выше написанного for in.
//        for animal in animals {
//            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//        }


        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value } // cat: 1, dog: 2 // dog: 2, cat: 1
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
     
        updateUI(with: mostFrequencyAnimal)
    }
        
    
    // Метод 2.
//    let resultAnimal = Dictionary(grouping: surveyResults, by: { $0.type }).sorted(by: {$0.value.count > $1.value.count}).first?.key
    
    //    updateUI(with: resultAnimal)
//}
    
     func updateUI(with animal: AnimalType) {
        whatAnimalAreYou.text = "Ви - \(animal.rawValue)!"
        textAboutYou.text = animal.definition
    }
}







