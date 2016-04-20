// JS Demo： https://github.com/bang590/JSPatch/wiki/JSPatch-基础用法

//将设置页面的背景色改为红色
require('UIView, UIColor')
defineClass('JSPatchSwiftTest.ViewController', {
            viewDidLoad: function (){
            self.super().viewDidLoad();
            self.view().setBackgroundColor(UIColor.yellowColor());
            
            var view = UIView.alloc().init();
            view.setFrame({x:100, y:100, width:100, height:100});
            view.setBackgroundColor(UIColor.redColor());
            self.view().addSubview(view);
            }
            });


/**
 if your patch doesn't take effect, you should consider adding the dynamic attribute to the function
 
 http://stackoverflow.com/questions/25651081/method-swizzling-in-swift
 
 In production environment, I advise you to add the dynamic attribute to all your Custom Function.
 But you must know, this operation will reduce efficiency.
 */
defineClass('JSPatchSwiftTest.ViewController',{
                getNameAsync: function (){
                    return "Swift test";
                }
            });

defineClass('ObjCViewController',{
                getNameAsync: function (){
                    return "ObjC test";
                }
            });

