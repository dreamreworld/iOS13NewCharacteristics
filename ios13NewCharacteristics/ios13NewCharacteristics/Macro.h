//
//  Macro.h
//  iOS13Demo
//
//  Created by scj on 2019/10/30.
//  Copyright © 2019 scj. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


/// 4.屏幕大小尺寸
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0]

#define kisiPhoneX   \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define kNavHeight  (kisiPhoneX ? 88 : 64)

#endif /* Macro_h */
