//
//  ViewController.swift
//  ImageWithCache
//
//  Created by Ripon sk on 15/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cv: UICollectionView!
    private var shared = fetchServerData.shared
    private var arrTotalData = [TotalData]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        cv.delegate = self
        cv.dataSource = self
        let nib = UINib(nibName: "ImgCVC", bundle: nil)
        cv.register(nib, forCellWithReuseIdentifier: "ImgCVC")
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateValue), for: .valueChanged)
        cv.addSubview(refresh)
        setupLayout()
        getArrData()
 
        // Do any additional setup after loading the view.
    }


  
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTotalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCVC", for: indexPath) as! ImgCVC
        let arr = arrTotalData[indexPath.row]
        cell.viewImg.loadimage(from: getURL(domain: arr.thumbnail?.domain, basePath: arr.thumbnail?.basePath)!)
        return cell
    }
    
    
}

extension ViewController{
  private  func setupLayout(){
        let padding: CGFloat = 5
             let collectionViewSize = cv.frame.size.width - padding
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5.0
        layout.itemSize = CGSize(width: collectionViewSize/4, height: collectionViewSize/4)
        layout.scrollDirection = .vertical
        cv.collectionViewLayout = layout
    }
    @objc private func updateValue(_ sender:UIRefreshControl){
        sender.beginRefreshing()
        Task.init {
            try await shared.fetchData{ data in
                DispatchQueue.main.async {
                    self.arrTotalData.removeAll()
                    self.arrTotalData = data
                    self.cv.reloadData()
                    print(self.arrTotalData)
                }
               
            }
        }
        sender.endRefreshing()
    }
    private func getArrData(){
        Task.init {
            try await shared.fetchData{ data in
                DispatchQueue.main.async {
                    self.arrTotalData.removeAll()
                    self.arrTotalData = data
                    self.cv.reloadData()
                    print(self.arrTotalData)
                }
               
            }
        }
    }
}
