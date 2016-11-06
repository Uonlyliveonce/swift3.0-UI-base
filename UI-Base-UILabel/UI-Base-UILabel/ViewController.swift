
import UIKit

extension String {
    //    constrainedToSize 如果一行，用CGSizeZero，否则用CGSizeMake(你想要的宽度, CGFloat(MAXFLOAT)
    func textSizeWithFont(font: UIFont, constrainedToSize size:CGSize) -> CGSize {
        var textSize:CGSize!
        if size.equalTo(CGSize.zero) {
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
            textSize = self.size(attributes: attributes as? [String : AnyObject])
        } else {
            let option = NSStringDrawingOptions.usesLineFragmentOrigin
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
            let stringRect = self.boundingRect(with: size, options: option, attributes: attributes as? [String : AnyObject], context: nil)
            textSize = stringRect.size
        }
        return textSize
    }
}

class ViewController: UIViewController {
    
    
    //声明UILabel输出口
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        /********************************   UILabel   *********************/
        //初始化UILabel
        //        var nameLabe:UILabel = UILabel(frame: CGRectMake(100, 100, 200, 60))
        var nameLabe:UILabel = UILabel(frame: CGRect(x:100, y:100, width:200, height:60))
        //为了方便看到效果，设置红色背景色
        nameLabe.backgroundColor=UIColor.red
        
        //添加到视图中
        
        self.view.addSubview(nameLabe)
        
        //设置tag值
        nameLabe.tag = 68
        
        //通过tag值获取nameLabel
        //        nameLabe = self.view.viewWithTag(68) as UILabel
        
        //2015年5月2号修改
        nameLabe = self.view.viewWithTag(68) as! UILabel
        
        //设置显示文本
        nameLabe.text = "Swift大法好"
        
        //设置文本字体
        nameLabe.font = UIFont.systemFont(ofSize: 18);//使用系统默认字体，指定14号字号
        nameLabe.font = UIFont(name: "Helvetica-Bold", size: 18)//指定字体，指定字号
        
        //设置背景色
        nameLabe.backgroundColor = UIColor.red//系统色值
        nameLabe.backgroundColor = UIColor(red: 125/255.0, green: 125/255.0, blue: 255/255.0, alpha: 1)//使用RGB来设置颜色,rgb范围0-1，所以255颜色值要除以255.0转换成0-1范围内
        
        //设置文本颜色
        nameLabe.textColor = UIColor.blue
        
        //设置文本字体阴影延时
        nameLabe.shadowColor = UIColor.yellow
        
        //设置阴影方向和大小
        //(0,-1)：上阴隐
        //(0,1)：下阴隐
        //(-1,0)：左阴隐
        //(1,0)：右阴隐
        nameLabe.shadowOffset = CGSize(width:1,height:1)
        
        
        
        //设置文本字体对齐方式，对齐属性有以下几种，默认是左对齐
        // Left : Visually left aligned
        // Center : Visually centered
        // Right : Visually right aligned
        // Justified : Fully-justified. The last line in a paragraph is natural-aligned.
        // Natural : Indicates the default alignment for script
        nameLabe.textAlignment = .right
        
        
        //设置换号模式，换行模式有以下几种，默认是ByWordWrapping
        
        // ByWordWrapping /* What to do with long lines */ /* Wrap at word boundaries, default */
        // ByCharWrapping /* Wrap at character boundaries */
        // ByClipping /* Simply clip */
        // ByTruncatingHead /* Truncate at head of line: "...wxyz" */
        // ByTruncatingTail /* Truncate at tail of line: "abcd..." */
        // ByTruncatingMiddle /* Truncate middle of line:  "ab...yz" */
        
        //设置折行方式
        nameLabe.lineBreakMode = .byTruncatingHead
        
        //是否能与用户交互,默认是false
        nameLabe.isUserInteractionEnabled = true;
        
        //文本是否可变，默认是true
        nameLabe.isEnabled = false;
        
        //文本行数，等于0时没有行数限制
        nameLabe.numberOfLines = 2;
        
        //最小字体，行数为1时有效，默认为0.0
        nameLabe.minimumScaleFactor = 10.0;
        
        //文本内容自动适应标签大小，默认是false
        nameLabe.adjustsFontSizeToFitWidth = true
        
        //
        //设置文本高亮
        nameLabe.isHighlighted = true;
        
        //设置文本高亮颜色
        nameLabe.highlightedTextColor = UIColor.green
        
        
        
        //富文本设置
        let attributeString:NSMutableAttributedString=NSMutableAttributedString(string: "1234567890123")
        
        //文本0开始5个字符字体HelveticaNeue-Bold，16号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(0, 5))
        
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(0, 3))
        
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.green, range: NSMakeRange(3, 3))
        
        
        nameLabe.attributedText = attributeString
        
        
        //设置文本基线位置,有以下三种，只有文本行数等于1时有效
        //AlignBaselines ： 默认值文本最上端于 label 中线对齐
        //AlignCenters ： 文本中线于 label 中线对齐
        //None ： 文本最低端与 label 中线对齐
        nameLabe.baselineAdjustment = .alignCenters
        
        
        let textString = "Swift大法好"
        //固定宽度，来计算自适应的高度
        
        let size1:CGSize = textString.textSizeWithFont(font: UIFont.systemFont(ofSize: 14), constrainedToSize: CGSize(width:200, height:CGFloat(MAXFLOAT)))
        
        print("固定宽度200时，文本的区域为：\(size1)")
        print("固定宽度200时，文本的高度是：\(size1.height)")
        
        //不限制宽度，自适应文本之后，计算文本的长度
        let size2:CGSize = textString.textSizeWithFont(font: UIFont.systemFont(ofSize: 14), constrainedToSize: CGSize.zero)
        
        print("不限制宽度，文本的区域为：\(size2)")
        print("不限制宽度，文本的长度是：\(size2.width)")
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

