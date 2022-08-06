//
//  PostTableViewCell.swift
//  NewsApp
//
//  Created by саргашкаева on 19.07.2022.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    
    // MARK: - Properties
  

    
    // MARK: - Views
    
    
    
    private var titleTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private var bodyTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
  var mainImageView: UIImageView = {
        let image = UIImageView()
      image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    // MARK: - Init
    override func prepareForReuse() {
        super.prepareForReuse()
        titleTextLabel.text = nil
        bodyTextLabel.text = nil
        mainImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    // MARK: - Congigure
    
    private func configureUI() {
       
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        contentView.addSubview(bodyTextLabel)
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(mainImageView)
    }
    
    private func setConstraints() {
       
        titleTextLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.left.equalTo(contentView).inset(20)
            make.right.equalTo(contentView).inset(20)
        }
        bodyTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextLabel).inset(30)
            make.left.equalTo(contentView).inset(20)
            make.right.equalTo(contentView).inset(20)
        }
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(bodyTextLabel).inset(25)
            make.left.equalTo(contentView).inset(20)
            make.right.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(10)
        }
    }
  
    
    // MARK: - Helpers
    public func configure(title: String, body: String) {
        titleTextLabel.text = title
        bodyTextLabel.text = body
    }

}

