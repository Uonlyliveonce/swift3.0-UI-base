

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建开关控件
        let switchView:UISwitch = UISwitch(frame: CGRect(x: 20, y: 100, width: 60, height: 40))
        
        //添加到视图上
        self.view.addSubview(switchView)
        
        //设置开启
        switchView.isOn = true
        
        //或
        switchView.setOn(true , animated: true)
        
        //添加UIControlEvents.ValueChanged事件，检测开关的切换
        switchView.addTarget(self, action: #selector(ViewController.switchChange(_:)), for: UIControlEvents.valueChanged)
        
        
        
        
        //--------------------------
        
        //创建进步控件
        let stepperView:UIStepper = UIStepper(frame: CGRect(x: 200, y: 100, width: 80, height: 40))
        
        //添加到视图上
        self.view.addSubview(stepperView)
        
        //设置最小值，默认是0.0
        stepperView.minimumValue = 60
        
        //设置最大值，默认是100.0
        stepperView.maximumValue = 800
        
        //设置当前值，默认是0.0
        stepperView.value = 100
        
        //设置递增或递减的值，默认是1.0
        stepperView.stepValue = 50
    }

    //检测开关的切换的事件
    func switchChange(_ sender: AnyObject?)
    {
        let newSwitch:UISwitch = sender as! UISwitch
        
        print(newSwitch.isOn)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

