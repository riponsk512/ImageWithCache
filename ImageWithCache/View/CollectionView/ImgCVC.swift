//
//  ImgCVC.swift
//  ImageWithCache
//
//  Created by Ripon sk on 15/04/24.
//

import UIKit

class ImgCVC: UICollectionViewCell {

    @IBOutlet weak var viewImg: LazyImageLoaderView!
    @IBOutlet weak var viewMain: UIView!{
        didSet{
            viewMain.layer.cornerRadius = 5
            viewMain.layer.borderWidth = 1.0
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
