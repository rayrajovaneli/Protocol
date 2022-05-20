//
//  DetaillViewController.swift
//  Protocol
//
//  Created by user218260 on 5/11/22.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailSobrenomeLabel: UILabel!
    @IBOutlet weak var detailGeneroLabel: UILabel!
    @IBOutlet weak var detailIdadeLabel: UILabel!
    
    var pessoaSelecionada: Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImageView.image = UIImage(named: self.pessoaSelecionada?.avatar ?? "")
        self.detailNameLabel.text = self.pessoaSelecionada?.nome
        self.detailSobrenomeLabel.text = self.pessoaSelecionada?.sobrenome
        self.detailGeneroLabel.text = self.pessoaSelecionada?.genero?.rawValue
        self.detailIdadeLabel.text = String(self.pessoaSelecionada?.idade ?? 0)
        
    }
}
