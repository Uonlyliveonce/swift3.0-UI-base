

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //先创建一个数组用于设置分段控件的标题
        let appsArray:[String] = ["1111","2222","3333","4444","5555"]
        
        //创建分段控件
        let segment:UISegmentedControl = UISegmentedControl(items: appsArray)
        
        //设置坐标大小
        segment.frame = CGRect(x: 20, y: 100, width: 320, height: 40)
        
        //添加到视图上
        self.view.addSubview(segment)
        
        
        
        //----------------- 分段控件常用属性和方法
        
        //默认选中下标为1的
        segment.selectedSegmentIndex = 1
        
        //获取选中的坐标
        let index = segment.selectedSegmentIndex
        
        //设置下标等于2的标题
        segment.setTitle("Bird Flying", forSegmentAt: 2)
        
        //设置下标等于3的图片,图片和标题不能共存，设置图片之后，原来标题就不显示了
        segment.setImage(UIImage(named: "segmentImage.png"), forSegmentAt: 3)
        
        //在坐标为2的位置，插入一个分段标题
        segment.insertSegment(withTitle: "考试导航", at: 2, animated: true)
        
        //在坐标为4的位置，插入一个分段图片
//        segment.insertSegmentWithImage(UIImage(named: "segmentImage.png")!, atIndex: 4, animated: true)
        
        //获取segment的数量
        let count = segment.numberOfSegments;
        print(count)
        
        //获取某一个下标下的标题
        let title = segment.titleForSegment(at: 1)
        
        //获取某一个下标下得图片
        let image = segment.imageForSegment(at: 2)
        
        
        //momentary默认为NO点击之后一直处于选中状态，除非点击其他分段，才恢复。 当设置为YES时，点击选中，但一会就是恢复到正常状态。
        segment.isMomentary = true;
        
        //设置某一分段是否可用
//        segment.setEnabled(false, forSegmentAtIndex: 1)
        
        //设置下标为2的segment的宽度
        segment.setWidth(80, forSegmentAt: 2)
        
        //获取某一个下标segment的宽度
        let width = segment.widthForSegment(at: 2)
        
        //设置内容偏移
        segment.setContentOffset(CGSize(width: 10, height: 10), forSegmentAt: 2)
        
        //获取某一个下标segment的内容偏移
        let size = segment.contentOffsetForSegment(at: 2)
        
        //是否根据segment的内容改变segment的宽度
        segment.apportionsSegmentWidthsByContent = true
        
        //设置标题颜色
        segment.tintColor = UIColor.red
        
        //获取颜色
        let segmentColor = segment.tintColor
        
        //移除下标是2的segment
//        segment.removeSegmentAtIndex(2, animated: true)
        
        //移出所有segment
//        segment.removeAllSegments()
        
        
        //添加事件，当segment改变时，触发
        segment.addTarget(self, action: #selector(ViewController.segmentChange(_:)), for: UIControlEvents.valueChanged)
        
        

    }

    //segemnet选择改变事件
    func segmentChange(_ sender: AnyObject?)
    {
        let segment:UISegmentedControl = sender as! UISegmentedControl
        switch segment.selectedSegmentIndex {
            
        case 0 :
            print("000 ")
        case 1 :
            print("11111 ")
        case 2 :
            print("2222 ")
        default:
            print("default ")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

