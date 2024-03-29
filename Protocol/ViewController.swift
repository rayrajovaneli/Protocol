//
//  ViewController.swift
//  Protocol
//
//  Created by user218260 on 5/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var arrayPessoas: [Pessoa] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        self.myTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        let pessoa1 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image1", customID: 1)
        let pessoa2 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image2", customID: 2)
        let pessoa3 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image3", customID: 3)
        let pessoa4 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image4", customID: 4)
        let pessoa5 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image5", customID: 5)
        let pessoa6 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image1", customID: 6)
        let pessoa7 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image2", customID: 7)
        let pessoa8 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image3", customID: 8)
        let pessoa9 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image4", customID: 9)
        let pessoa10 = Pessoa(nome: "Evandro", sobrenome: "Minamoto", idade: 39, genero: .masculino, avatar: "image5", customID: 10)

        self.arrayPessoas = [pessoa1, pessoa2, pessoa3, pessoa4, pessoa5, pessoa6, pessoa7, pessoa8, pessoa9, pessoa10]
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell? = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        cell?.setup(value: self.arrayPessoas[indexPath.row])
        
        cell?.delegate = self
        
        return cell ?? UITableViewCell ()
        
      

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pessoaSelecionada: Pessoa = self.arrayPessoas[indexPath.row]
        
        performSegue(withIdentifier: "DetailViewController", sender: pessoaSelecionada)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditViewController"{
            let vc: EditViewController? = segue.destination as? EditViewController
            
            vc?.pessoaSelecionada = sender as? Pessoa
            vc?.delegate = self
        
        } else {
            let vc: DetailViewController? = segue.destination as? DetailViewController
            
            vc?.pessoaSelecionada = sender as? Pessoa
        }
    }
   
}

extension ViewController: CustomCellProtocol{
    func tappedEditButton(value: Pessoa) {
        
        self.performSegue(withIdentifier: "EditViewController", sender: value)
    }
    
    
}


extension ViewController: EditViewControllerProtocol{

func updatePessoa(value: Pessoa) {
    self.arrayPessoas = self.arrayPessoas.filter({$0.customID != value.customID})
    self.arrayPessoas.append(value)
    self.myTableView.reloadData()
    
}
}
