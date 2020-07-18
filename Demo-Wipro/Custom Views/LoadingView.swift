

import UIKit

class LoadingView: UIView{
    class func getLoadingView () -> LoadingView{
        return Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.last as! LoadingView
    }
    
    func showLoadingView (withFrame frame: CGRect){
        DispatchQueue.main.async {
            self.frame = frame
            UIApplication.shared.keyWindow?.addSubview(self)
        }
    }
    
    func removeLoadingView (){
        DispatchQueue.main.async {
            self.removeFromSuperview()
        }
    }
}
