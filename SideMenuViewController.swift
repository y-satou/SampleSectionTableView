//
//  SideMenuViewController.swift
//
//  Created by tororo_ssyy on 2017/04/25.
//

import UIKit

//セクション配列に使うenumの定義
enum SideMenuSecitonType {
    case profile    //プロフィール項目
    case news       //お知らせ
    case home       //ホーム項目
    case login      //お知らせ
    case tos        //利用規約
}

open class SideMenuViewController:UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var sections = [SideMenuSecitonType]() //Enumのセクション配列を定義
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        createSectionData() //画面読み込み時にセクション配列を作成する
    }
    
    /// セクション配列を作成する
    func createSectionData() {
        sections = [.profile,
                    .news,
                    .home,
                    .login,
                    .tos]
    }
    
    //セクション数を返却
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count //sectionsの総数を返却するだけなので便利
    }
    
    //セクションに応じたセル数を返却する。今回は1固定
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //セル生成
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Snorlax", for: indexPath)
        
        let section = sections[indexPath.section] //セクション配列から引っ張る
        var titleString = ""
        
        switch section {
        case .profile:
            titleString = "プロフィール"
        case .home:
            titleString = "ホーム"
        case .news:
            titleString = "お知らせ"
        case .login:
            titleString = "ログイン"
        case .tos:
            titleString = "利用規約"
        }
        
        cell.textLabel?.text = titleString
        
        return cell
    }
    
}
