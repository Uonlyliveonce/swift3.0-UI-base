

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    
    
    var textView:UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //创建UITextView对象
        textView = UITextView(frame:CGRect(x: 10.0, y: 120.0, width: 300.0, height: 200.0))
        textView.isEditable = false
        //为方便看到效果，设置背景颜色
        textView.backgroundColor = UIColor.gray
        
        //添加到视图上
        self.view.addSubview(textView)
        
        
        //------------------ 常用属性
        
        //设置textview里面的字体颜色
        textView.textColor = UIColor.green
        
        //设置文本字体
        textView.font = UIFont.systemFont(ofSize: 18);//使用系统默认字体，指定18号字号
        textView.font = UIFont(name: "Helvetica-Bold", size: 18)//指定字体，指定字号
        
        //设置它的背景颜色
        textView.backgroundColor = UIColor.gray
        
        //设置显示内容
        textView.text = "http://www.jianshu.com/notebooks/7139633/latest    \nhttp://www.jianshu.com/notebooks/7139633/latest   \nhttp://www.jianshu.com/notebooks/7139633/latest"
        
        //文本对齐方式
        textView.textAlignment = NSTextAlignment.left
        
        //文本视图设置圆角
        textView.layer.cornerRadius = 20
        
        //是否允许点击链接和附件
        textView.isSelectable = true
        
        //返回键的类型
        textView.returnKeyType = UIReturnKeyType.done
        
        //键盘类型
        textView.keyboardType = UIKeyboardType.default
        
        //是否可以滚动
        textView.isScrollEnabled = true
        
        //自适应高度
        textView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        //设置富文本
        let attributeString:NSMutableAttributedString=NSMutableAttributedString(string: "http://www.jianshu.com/notebooks/7139633/latest    \nhttp://www.jianshu.com/notebooks/7139633/latest   \nhttp://www.jianshu.com/notebooks/7139633/latest")
        
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.green, range: NSMakeRange(0, attributeString.length))
        
        //文本所有字符字体HelveticaNeue-Bold，16号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(0, attributeString.length))
        
        //文本0开始5个字符字体HelveticaNeue-Bold，26号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 26)!, range: NSMakeRange(0, 5))
        
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(0, 3))
        
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.orange, range: NSMakeRange(3, 3))
        
        //赋值富文本
//        textView.attributedText = attributeString
        
        //选中一段文本
//        textView.becomeFirstResponder()
//        textView.selectedRange = NSMakeRange(30, 10)
        
        //获取内容整体高度
        var height:CGFloat = textView.contentSize.height;
        
        
        
        //为文本的视图中的电话和网址自动加链接
        textView.dataDetectorTypes = .phoneNumber;
        
        
        /*
         UIDataDetectorTypePhoneNumber                          电话有链接
         UIDataDetectorTypeLink                                         网址有链接
         UIDataDetectorTypeAddress                                   地址有链接
         UIDataDetectorTypeCalendarEvent                        日历时间具有链接
         
         iOS10----
         UIDataDetectorTypeShipmentTrackingNumber     货物订单号
         UIDataDetectorTypeFlightNumber                         机票
         UIDataDetectorTypeLookupSuggestion                 用户信息
         ---
         UIDataDetectorTypeNone
         UIDataDetectorTypeAll
         */
        
        //-------------------------------------------自定义菜单
        
        //定义2个菜单选择
        let menuItem1:UIMenuItem = UIMenuItem(title: "分享到微信", action: #selector(ViewController.shareWXMenu(_:)))
        let menuItem2:UIMenuItem = UIMenuItem(title: "分享到微博", action: #selector(ViewController.shareWBMenu(_:)))
        
        //获取菜单控制器
        let menuController:UIMenuController = UIMenuController.shared
        menuController.menuItems = [menuItem1,menuItem2]
        
        
        
        
        //-------------------------------------------指定代理
        textView.delegate = self
        
        //-------------------------------------------添加通知
        //文本框开始编辑时，触发
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textDidBeginEditing), name: NSNotification.Name.UITextViewTextDidBeginEditing, object: nil)
        
        //文本框编辑结束时，触发
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textDidEndEditing), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)
        
        //文本框内容改变时，触发
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
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
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UITextViewDelegate
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        return true //如果返回false，文本视图不能编辑
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool
    {
        return true //如果返回false，表示编辑结束之后，文本视图不可再编辑
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        //文本视图开始编辑，这个时候我们可以处理一些事情
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        //文本视图编辑结束，这个时候我们可以处理一些事情
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        //文本视图内容改变时，触发本方法，能得到改变的坐标和改变的内容
        
        //如果是回车符号，则textView释放第一响应值，返回false
        if (text ==  "\n") {
            textView.resignFirstResponder()
            return false;
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView)
    {
        //文本视图改变后触发本代理方法
    }
    
    func textViewDidChangeSelection(_ textView: UITextView)
    {
        //文本视图 改变选择内容，触发本代理方法
    }
    
    //@availability(iOS, introduced=7.0)
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool
    {
        //链接在文本中显示。当链接被点击的时候，会触发本代理方法
        
        return true
    }
    
    //@availability(iOS, introduced=7.0)
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool
    {
        //文本视图允许提供文本附件，文本附件点击时，会触发本代理方法
        return true
    }
    
    
    
    
    
    //按钮显示方法
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        //判断有没有选中文字，
        //如果选择，输出选择的文本
        let isSelect:Bool = textView.selectedRange.length > 0
        
        
        if(action == #selector(ViewController.shareWXMenu(_:)) && isSelect)//选择文本，并点击分享到微信菜单
        {
            return true;
        }
        else if(action == #selector(ViewController.shareWBMenu(_:)) && isSelect)//选择文本，并点击分享到微博菜单
        {
            
            return true;
        }
        
        return false; //不显示系统的菜单，改成true对比一下效果
    }
    
    
    
    //分享到微信
    func shareWXMenu(_ sender: AnyObject?)
    {
        if textView.selectedRange.length > 0 {
            print((textView.text as NSString).substring(with: textView.selectedRange))
        }
        
        print("这里实现 分享到微信 功能")
    }
    
    //分享到微博
    func shareWBMenu(_ sender: AnyObject?)
    {
        print("这里实现 分享到微博 功能")
    }

}

