//
//  HeroHeaderUiView.swift
//  Neflix
//
//  Created by 김하람 on 2023/08/07.
//

import UIKit

class HeroHeaderUiView: UIView {
    
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        // 이미지가 이미지 뷰에 꽉 차도록 확장, 비율은 유지되며, 이미지가 이미지 뷰의 영역을 벗어날 수 있음
        imageView.contentMode = .scaleAspectFill
        // 이미지 뷰의 프레임을 벗어나는 내용을 잘라낼지 여부를 지정
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "movie1")
        return imageView
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.clear,
            UIColor.systemBackground.cgColor
        ]
//        layer.addSublayer(layer: CALayer)
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
}
