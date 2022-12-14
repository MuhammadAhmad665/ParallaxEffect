//
//  ViewController.swift
//  Parallax Effect
//
//  Created by ahmed on 2022-11-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let topView = UIView()
    let imageView = UIImageView()
    let lblName = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        topView.backgroundColor = .black
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        topView.frame = imageView.frame
        imageView.image = UIImage.init(named: "moneyHeist")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        topView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.addSubview(topView)
        view.updateConstraintsIfNeeded()
        lblName.frame = CGRect(x: 20, y: 100, width: 400, height: 22)
        lblName.text = "Money Heist"
        lblName.textColor = UIColor.white
        lblName.font = UIFont.systemFont(ofSize: 26)
        lblName.clipsToBounds = true
        imageView.addSubview(lblName)
        tableView.contentInset = UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0)
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Dummy Data"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let leading = (self.view.frame.width - lblName.intrinsicContentSize.width) / 2
        
        let y = 300 - (scrollView.contentOffset.y + 300)
        
        if y > 60{
            print(1 - (y/(294)))
            topView.alpha = 1 - (y/(294))
        }
        
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        
        if height < 150{
            UIView.animate(withDuration: 0.1, delay: 0.1) { [weak self] in
                guard let self else {return}
                self.lblName.frame = CGRect(x: leading, y: height - 30, width: 200, height: 22)
            }
        }else{
            lblName.frame = CGRect(x: 20, y: height - 30, width: 200, height: 22)
        }
        
    }
    
}
