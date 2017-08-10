//
//  ViewController.swift
//  RandomGreeting
//
//  Created by Seunghun Lee on 2017-08-08.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

let greetingEndpoint = "http://localhost:8080/greeting"

class ViewController: UIViewController {
  @IBOutlet weak var greetingLabel: UILabel!

  @IBAction func getGreeting(_ sender: UIButton) {
    let task = URLSession.shared.dataTask(with: URL(string: greetingEndpoint)!) {
      data, response, error in
      if let error = error {
        print(error)
        return
      }

      if let data = data {
        var json: [String:String]?
        do {
          json = try JSONSerialization.jsonObject(with: data) as? [String:String]
        } catch {
          print("Could not serialize \(data)")
          return
        }
        DispatchQueue.main.async {
          if let greeting = json?["greeting"] {
            self.greetingLabel.text = greeting
          }
        }
      }
    }

    task.resume()
  }
}

