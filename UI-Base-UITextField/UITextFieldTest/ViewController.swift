

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /********************************   UITextField  *********************/
        
        //初始化UITextField控件
        let textField = UITextField(frame: CGRect(x: 10, y: 200, width: 300, height: 40))
        
        //为方便看到效果，设置一下背景色
        textField.backgroundColor = UIColor.red
        
        //添加到视图上
        self.view.addSubview(textField)
        
        
        
        //---------------------- 常用属性
        //设置显示文本
        textField.text = "bingo"
        
        //获取文本框内容
        var textString = textField.text
        
        //设置背景色
        textField.backgroundColor = UIColor.yellow
        
        //设置背景图
        textField.background = UIImage(named: "testImage")
        
        
        //设置富文本
        let attributeStr:NSMutableAttributedString=NSMutableAttributedString(string: "无限互联3G学院")
        
        //文本0开始5个字符字体HelveticaNeue-Bold，16号
        attributeStr.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(0, 4))
        
        //设置字体颜色
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(4, 2))
        
        //设置文字背景颜色
        attributeStr.addAttribute(NSBackgroundColorAttributeName, value: UIColor.green, range: NSMakeRange(0, 4))
        
        textField.attributedText = attributeStr
        
        //设置文本字体
        textField.font = UIFont.systemFont(ofSize: 18);//使用系统默认字体，指定14号字号
        textField.font = UIFont(name: "Helvetica-Bold", size: 18)//指定字体，指定字号
        
        //设置文本颜色
        textField.textColor = UIColor.magenta
        
        //设置文本字体对齐方式，对齐属性有以下几种，默认是左对齐
        // Left : Visually left aligned
        // Center : Visually centered
        // Right : Visually right aligned
        // Justified : Fully-justified. The last line in a paragraph is natural-aligned.
        // Natural : Indicates the default alignment for script
        textField.textAlignment = .right
        
        
        //设置文本框样式，可分别看看效果
        // None
        // Line
        // Bezel
        // RoundedRect
        textField.borderStyle = .bezel
        
        //富文本占位符
        textField.attributedPlaceholder = attributeStr
        
        //设置占位字符
        textField.placeholder = "请输入"
        
        
        //最小字体
//        textField.minimumFontSize = 10.0;
        
        //文本内容自动适应标签大小，默认是false
        textField.adjustsFontSizeToFitWidth = true
        
        
        //设置删除效果
        // Never
        // WhileEditing
        // UnlessEditing
        // Always
        textField.clearButtonMode = .whileEditing
        
        
        //设置文本框编辑状态，默认true可以编辑
//        textField.isEditing = true
        textField.setValue(true, forKeyPath: "isEditing")
        
        //文本框是否可用，默认是true
        textField.isEnabled = true;
        
        //开始输入时，清空文本框原有内容
        textField.clearsOnBeginEditing = true
        
        //允许编辑富文本
        textField.allowsEditingTextAttributes = true
        
        
        
        //创建左视图
        let leftView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftView.backgroundColor=UIColor.black
        textField.leftView=leftView;
        
        //设置左视图显示类型
        // Never
        // WhileEditing
        // UnlessEditing
        // Always
        textField.leftViewMode = .whileEditing//开始编辑时显示
        
        
        //创建右视图
        let rightView: UIView = UIView(frame: CGRect(x: 260, y: 0, width: 40, height: 40))
        rightView.backgroundColor=UIColor.black
        textField.rightView=rightView;
        
        //设置左视图显示类型
        // Never
        // WhileEditing
        // UnlessEditing
        // Always
        textField.rightViewMode = .unlessEditing//开始编辑时显示
        
        //成为第一响应者，光标定位到该文本框
        textField.becomeFirstResponder()
        
        //取消光标，释放键盘
//        textField.resignFirstResponder()
        
        //---------------------- 文本框代理
        textField.delegate = self
        
        
        
        //---------------------- 通知监听
        
        //3种通知类型
        //        let UITextFieldTextDidBeginEditingNotification: NSString!
        //        let UITextFieldTextDidEndEditingNotification: NSString!
        //        let UITextFieldTextDidChangeNotification: NSString!
        
        //文本框开始编辑时，触发
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil)
        
        //文本框编辑结束时，触发
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textDidEndEditing), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: nil)
        
        //文本框内容改变时，触发
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        
        
        //---------------------- 键盘知识
        
        //键盘外观
        /*
        enum UIKeyboardAppearance : Int {
        case Default // Default apperance for the current input method.
        case Dark
        case Light
        }
        */
        //
        textField.keyboardAppearance = .default
        
        
        //首字母是否大写
        /*
        enum UITextAutocapitalizationType : Int {
        case None   不自动大写
        case Words  单词首字母大写
        case Sentences 句子的首字母大写
        case AllCharacters 所有字母都大写
        }
        */
        textField.autocapitalizationType = .words
        
        
        //设置键盘完成的按钮样式
        /*
        enum UIReturnKeyType : Int {
        case Default    默认灰色按钮，标有Return
        case Go         标有Go的蓝色按钮
        case Google     标有Google的蓝色按钮，用语搜索
        case Join       标有Join的蓝色按钮
        case Next       标有Next的蓝色按钮
        case Route      标有Route的蓝色按钮
        case Search     标有Search的蓝色按钮
        case Send       标有Send的蓝色按钮
        case Yahoo      标有Yahoo的蓝色按钮
        case Done       标有Yahoo的蓝色按钮
        case EmergencyCall  紧急呼叫按钮
        }*/
        textField.returnKeyType = .yahoo
        
        
        //        Drawing and Positioning Overrides
        //        textRectForBounds(_:)
        //        drawTextInRect(_:)
        //        placeholderRectForBounds(_:)
        //        drawPlaceholderInRect(_:)
        //        borderRectForBounds(_:)
        //        editingRectForBounds(_:)
        //        clearButtonRectForBounds(_:)
        //        leftViewRectForBounds(_:)
        //        rightViewRectForBounds(_:)
        
        
        /********************************   UITextField   END  *********************/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return true //如果返回false，文本框将不能编辑
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        //文本框开始编辑，这个时候我们可以处理一些事情
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return true //如果返回false，表示编辑结束之后，文本框不可再编辑
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        //文本框结束编辑，触发本事件，我们可以做一些事情
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        //文本框内容改变时，触发本方法，能得到改变的坐标和改变的内容
        print("bingo")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        //文本框清空时触发此事件
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //按键盘换行件位置，会触发此方法，一般用户回收键盘，或者提交数据等操作
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    // MARK: - 通知事件
    func textDidBeginEditing()
    {
        print("开始输入文本...")
    }
    
    func textDidEndEditing()
    {
        print("结束输入...")
    }
    
    func textDidChange()
    {
        print("正在输入...")
    }
}

