//
//  ViewController.swift
//  Interview11
//
//  Created by Kenan on 02.11.24.
//

import UIKit

class ViewController: UIViewController {
    var alldata: [(String,String)] = []
    var person: [Person] = []
    var maneger: [Manager] = []
    var employee: [Branch] = []
        
    
let tableView: UITableView = {
        let tableView = UITableView()
    tableView.backgroundColor = .red
    tableView.rowHeight = 100
        return tableView
    }()
    
let buttonPerson: UIButton = {
        let button = UIButton()
        button.setTitle("Generate Person", for: .normal)
        button.backgroundColor = .blue
    button.addTarget(self, action: #selector(generatePerson), for: .touchUpInside)
        return button
}()
    
let buttonManager: UIButton = {
        let button = UIButton()
        button.setTitle("Genaret Manager", for: .normal)
        button.backgroundColor = .blue
    button.addTarget(self, action: #selector(generateManager), for: .touchUpInside)
    return button
    
}()
    
let buttonBranch: UIButton = {
        let button = UIButton()
        button.setTitle("Genaret Branch", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(GenerateBranch), for: .touchUpInside)
        return button
        
}()

    @objc func generatePerson() {
        alldata = []
    for p in person {
        alldata.append((p.name,p.surname))
        }
        tableView.reloadData()
        
    }
    
    @objc func generateManager() {
        alldata = []
        for m in maneger {
            alldata.append((m.name,m.role))
        }
        tableView.reloadData()

        
    }
    
    @objc func GenerateBranch() {
        alldata = []
        for e in employee {
            alldata.append((e.name,e.location))
        }
        
        tableView.reloadData()

    }
    
    
    private func generateAll() {
        person.append(Person(name: "Kane", surname: "Manafli"))
        person.append(Person(name: "ali", surname: "Isimilikck"))
        maneger.append(Manager(name: "Samir", role: "Ios Developer"))
        maneger.append(Manager(name: "Ali", role: "Android Developer"))
        employee.append(Branch(name: "hjkbwdjhwbd",         location:"jmkibsxikjb"))
        employee.append(Branch(name: "khsxjhasx", location: "kuhwjqwd"))
        
        
    }
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setup()
            generateAll()
            GenerateBranch()
            generatePerson()
            generateManager()
        }
    
    private func setup() {
        view.addSubview(tableView)
        view.addSubview(buttonPerson)
        view.addSubview(buttonBranch)
        view.addSubview(buttonManager)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        buttonBranch.translatesAutoresizingMaskIntoConstraints = false
        buttonPerson.translatesAutoresizingMaskIntoConstraints = false
        buttonManager.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: 0),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        tableView.topAnchor.constraint(equalTo: buttonBranch.bottomAnchor, constant: 20),
        buttonPerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        buttonPerson.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonPerson.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        buttonManager.topAnchor.constraint(equalTo: buttonPerson.bottomAnchor, constant: 10),
        buttonManager.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonManager.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        buttonBranch.topAnchor.constraint(equalTo: buttonManager.bottomAnchor, constant: 10),
        buttonBranch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonBranch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        }
                    
            
    
    
   
    
    
        
        
    }

    

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alldata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let data = alldata[indexPath.row]
        cell.nameLabel.text = data.0
        cell.secondlabel.text = data.1
        return cell
    }
    
    
}
