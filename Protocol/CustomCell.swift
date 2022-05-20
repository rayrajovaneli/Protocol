//
//  CustomCell.swift
//  Protocol
//
//  Created by user218260 on 5/11/22.
//

import UIKit

protocol CustomCellProtocol: AnyObject{
    
    func tappedEditButton(value: Pessoa)
}


class CustomCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSutitle: UILabel!
    @IBOutlet weak var perfilImage: UIImageView!
    
    private var pessoa: Pessoa?
    
    weak var delegate: CustomCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: Pessoa){
        
        self.pessoa = value
        self.labelName.text = value.nome
        self.labelSutitle.text = value.sobrenome
        self.perfilImage.image = UIImage(named: value.avatar ?? "")
    }
    
    @IBAction func tappedEditButton(_ sender: UIButton) {
        
        if let _pessoa = self.pessoa{
            print("tappedEditButton")
            self.delegate?.tappedEditButton(value: _pessoa)
            
        }
    }
}
