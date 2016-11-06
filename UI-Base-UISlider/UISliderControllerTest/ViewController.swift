

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //创建
        let slider:UISlider = UISlider(frame: CGRect(x: 20, y: 100, width: 200, height: 60))
        
        //添加到视图上
        self.view.addSubview(slider)
        
        //设置最小值
        slider.minimumValue = 10
        
        //设置最大值
        slider.maximumValue = 80
        
        //设置默认值
        slider.value = 30
        
        //设置左端图片
        slider.setMinimumTrackImage(UIImage(named: "minimumTrackImage"), for: UIControlState())
        
        //设置右端图片
        slider.setMaximumTrackImage(UIImage(named: "maximumTrackImage"), for: UIControlState())
        
        
        
        //读取当滑块控件的值：
        let value = slider.value
        print(value)
        
        
        //添加通知，获取值改变
        slider.addTarget(self, action: #selector(ViewController.sliderValueChange(_:)), for: UIControlEvents.valueChanged)
        
        //continuous默认是true，设置成false后，只有停止拖动才会触发sliderValueChange:方法
        slider.isContinuous = false
        
        
        
        //-----自定义滑块
        
        //定义左右图片
        let stetchLeftTrack:UIImage! = UIImage(named: "leftTrack.png")
        let stetchRightTrack:UIImage! = UIImage(named: "rightTrack.png")
        
        //定义滑块图片
        let thumbImage:UIImage! = UIImage(named: "thumbImage.png")
        
        //创建UISlider对象
        let newSlider:UISlider = UISlider(frame: CGRect(x: 30, y: 300, width: 257, height: 8))
        newSlider.backgroundColor = UIColor.clear
        newSlider.minimumValue = 0.5
        newSlider.maximumValue = 1.5
        newSlider.value = 1.0
        
        //设置左右图片
        newSlider.setMinimumTrackImage(stetchLeftTrack, for: UIControlState())
        newSlider.setMaximumTrackImage(stetchRightTrack, for: UIControlState())
        
        //设置拖动圆点的图片，注意这里要加UIControlState.Highlighted的状态，否则当拖动滑块时滑块将变成原生的控件
        newSlider.setThumbImage(thumbImage, for: UIControlState())
        newSlider.setThumbImage(thumbImage, for: UIControlState.highlighted)
        
        //添加通知，获取值改变
        newSlider.addTarget(self, action: #selector(ViewController.newSliderValueChange(_:)), for: UIControlEvents.valueChanged)
        
        
        //滑动拖动后的事件
        newSlider.addTarget(self, action: #selector(ViewController.newSliderTouchUpInside(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(newSlider)
        
    }

    
    //slider值改变触发的方法
    func sliderValueChange(_ sender: AnyObject?)
    {
        let newSlider:UISlider = sender as! UISlider
        let value = newSlider.value
        print(value)
    }
    
    
    //自定义滑块使用
    
    //拖动事件
    func newSliderValueChange(_ sender: AnyObject?)
    {
        let newSlider:UISlider = sender as! UISlider
        print(newSlider.value)
    }
    
    //滑动拖动后的事件
    func newSliderTouchUpInside(_ sender: AnyObject?)
    {
        let newSlider:UISlider = sender as! UISlider
        print(newSlider.value)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

