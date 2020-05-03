//
//  ImageGalleryViewController.swift
//  ios_task_mehedi_hasan
//
//  Created by Md. Mehedi Hasan on 2/5/20.
//  Copyright © 2020 Mehedihasan290. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ImageGalleryViewController: UIViewController {
 
    //MARK: - var
    var urlForImages:String = "https://reqres.in/api/users?page=1"
    var numberOfCells:Int = 0
    let decoder = JSONDecoder()
    var myImageGallery = ImageGallaryModel.init(page: 0, per_page: 0, total: 0, total_pages: 0, data: [], ad: adv.init(company: "", url: "", text: "") )
    
    // MARK: - Outlets
    @IBOutlet weak var CollectionView: UICollectionView!
    
    // MARK: - viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        getImages()
    }

    // MARK: - API call
   func getImages(){
        AF.request(urlForImages).responseJSON{ response in
                do{
                    let imageGallery = try self.decoder.decode(ImageGallaryModel.self , from: response.data! )
                    self.myImageGallery = imageGallery
                   print(self.myImageGallery)
                    self.CollectionView.reloadData()
                }catch{
                    print("error parsing json data")  }
                                   
            }
        }

}
//MARK: - CollectionView func
extension ImageGalleryViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  myImageGallery.per_page ?? 0
     }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageGallery
        cell.gallaryImage.sd_setImage(with: URL(string: self.myImageGallery.data[indexPath.row].avatar ?? ""),placeholderImage: UIImage(named: "loading"))
        return cell
     }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //since there was nothing mentioning doing somthing different for a perticular user
        self.performSegue(withIdentifier: "segueToGoogle", sender: self)

    }
}
