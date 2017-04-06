

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /********************************   UIButton  *********************/
        
        
        //通过frame来初始化UIButton
        let button = UIButton(frame: CGRect(x: 0, y: 300, width: 320, height: 60))
        
        //通过UIButtonType来初始化UIButton
        /*
        enum UIButtonType : Int {
        case Custom 自定义风格
        case System 系统风格
        
        case DetailDisclosure   蓝色小箭头按钮，主要做详细说明用
        case InfoLight          亮色感叹号
        case InfoDark           暗色感叹号
        case ContactAdd         十字加号按钮
        }
        */
        
        var button2 = UIButton(type: UIButtonType.custom)
        
        
        //设置背景色，方便看到效果
        button.backgroundColor = UIColor.orange
        
        //添加到视图上
        self.view.addSubview(button)
        
        
        
        //---------------常用属性和方法
        
        //修改背景色
        button.backgroundColor = UIColor.orange
        
        //获取标题标签控件
        var aLabel = button.titleLabel
        
        //设置标题，需要注意，这里需要指定设置UIButton的哪个状态的title
        /*
        struct UIControlState : RawOptionSetType {
        init(_ value: UInt)
        static var Normal: UIControlState { get }
        static var Highlighted: UIControlState { get } // used when UIControl isHighlighted is set
        static var Disabled: UIControlState { get }
        static var Selected: UIControlState { get } // flag usable by app (see below)
        static var Application: UIControlState { get } // additional flags available for application use
        static var Reserved: UIControlState { get } // flags reserved for internal framework use
        }
        */
        button.setTitle("", for: UIControlState())
        
        
        //设置标题颜色
        button.setTitleColor(UIColor.red, for: UIControlState())//正常状态标题颜色
        button.setTitleColor(UIColor.black, for: .highlighted)//鼠标按下标题颜色
        
        
        //设置标题阴影颜色
        button.setTitleShadowColor(UIColor.black, for: UIControlState())
        
        
        //设置图片，图片会遮挡butoon的标题
        //        button.setImage(UIImage(named: "testImage"), forState: .Normal)
        
        
        //设置背景图片
        //         button.setBackgroundImage(UIImage(named: "testImage"), forState: .Normal)
        
        
        //设置富文本
        let buttonAttribute:NSMutableAttributedString=NSMutableAttributedString(string: "swift大法好!")
        
        //文本0开始5个字符字体HelveticaNeue-Bold，16号
        buttonAttribute.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 20)!, range: NSMakeRange(0, 4))
        
        //设置字体颜色
        buttonAttribute.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(4, 2))
        
        //设置文字背景颜色
        buttonAttribute.addAttribute(NSBackgroundColorAttributeName, value: UIColor.green, range: NSMakeRange(0, 6))
        
        button.setAttributedTitle(buttonAttribute, for: UIControlState())
        
        //默认情况下，钮高亮的情况下图像的颜色会被画的深一些，如果下面的这个属性设置为false，那么可以去掉这个功能
        button.adjustsImageWhenHighlighted = false
        
        
        //默认情况下，当按钮禁用的时候，图像会被画得深一点，设置NO可以取消设置
        button.adjustsImageWhenDisabled = false
        
        //下面这个属性设置为yes的状态下，按钮按下会发光
        button.showsTouchWhenHighlighted = true
        
        //获取富文本
        var attributedTitle = button.attributedTitle(for: UIControlState())
        
        //获取标题
        var titleOfState = button.title(for: UIControlState())
        
        //获取标题颜色
        var titleColorOfState = button.titleColor(for: UIControlState())
        
        //获取标题阴影颜色
        var titleShadowColorOfState = button.titleShadowColor(for: UIControlState())
        
        //获取图片
        var imageOfState = button.image(for: UIControlState())
        
        
        
        //事件
        button.addTarget(self, action: #selector(ViewController.buttonUpInsideFunc(button:)), for: .touchUpInside)
        
        
        
        /********************************   UIButton   END  *********************/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //按钮事件
    func buttonUpInsideFunc(button : UIButton)
    {
        print("--- 在控件之内触摸并抬起事件 ---")
        
        let loginViewCtl = LoginViewController(nibName: "LoginViewController", bundle: Bundle.main)
        self.present(loginViewCtl, animated: true) { () -> Void in
            
        }
    }

}

