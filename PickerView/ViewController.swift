//
//  ViewController.swift
//  PickerView
//
//  Created by Nam on 2024/06/27.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10  // 이미지 파일명 저장하는 배열의 최대 크기
    let PICKER_VIEW_COLUMN = 1  // 피커 뷰의 열의 개수
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var imageArray = [UIImage?]() // UIImage 타입의 배열 선언
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    @IBOutlet var pickerImage: UIPickerView!    // delegate 메서드로 호출받은 동작을 위임해 수행한다
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {  // 배열에 이미지 할당
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
    }
    
    // pickerView에게 컴포넌트의 수를 정수 값으로 넘겨주는 메서드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 컴포넌트의 높이를 반환
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // pickerView에게 컴포넌트의 열의 개수를 정수 값으로 넘겨줌
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // 각 열의 타이틀을 문자열 값으로 넘겨줌 -> imageFileName에 파일명을 넘겨줌
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    // pickerView에서 선택된 이미지를 이미지 뷰에 나타냄
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
}

