//
//  CastCell.swift
//  TheMovieDb
//
//  Created by Michael do Prado on 11/11/21.
//

import UIKit
import Kingfisher

class CastCell: BaseCell {
  
  static let identifier = "CastCell"
  
  var person: Person? {
    didSet {
      setupData()
    }
  }
  
  var profileImage = ImageBuilder()
    .sizeAndAspectImage(width: 60, height: 60, aspectRatio: .scaleAspectFill)
    .roundCorners(circle: true, radius: 0, clipped: true)
    .setBackgroundColor(color: .darkGray)
    .build()
  
  var nameLabel = LabelBuilder()
    .fontStyle(textStyle: .subheadline, weight: .bold)
    .setColor(color: .darkGray)
    .build()
  
  var characterLabel = LabelBuilder()
    .fontStyle(textStyle: .subheadline, weight: .regular)
    .setColor(color: .gray)
    .build()
  
  override func setupView() {
    
    backgroundColor = DesignColor.whiteDirt.color
    layer.cornerRadius = 20

    profileImage.constrainWidth(constant: 60)
    profileImage.constrainHeight(constant: 60)

    let infoStack = VerticalStackView(arrangedSubviews: [nameLabel, characterLabel], spacing: 0)
    
    let allInfoStack = HorizontalStackView(arrangedSubviews: [profileImage, infoStack], spacing: 10)
    addSubview(allInfoStack)
    allInfoStack.alignment = .center
    allInfoStack.centerYInSuperview()
    allInfoStack.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))

  }
  
  override func setupData() {
    guard let name = person?.name, let character = person?.character, let portrait = person?.profilePath else { return }
    let imageProvider = ImageResource(downloadURL: URL(string: "\(ApiPath.baseUrlImage.path)\(portrait)")!)
    profileImage.kf.setImage(with: imageProvider)
    self.nameLabel.text = name
    self.characterLabel.text = character
  }

}