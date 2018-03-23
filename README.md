# commonAlertText
//
//  CommonAlertTextView.h
//
//
//  Created by nick on 2018/1/30.
//  Copyright © 2018年 nick. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CommonAlertTextViewDelegate <NSObject>

@optional
//消失视图
-(void)disclaimerViewTap;
//同意按钮点击
/**
 * @param LineOne 用户输入的第一行字符
 * @param LineTwo 用户输入的第二行字符
 */
-(void)agreeClickWithLineOne:(NSString *)LineOne andLineTwo:(NSString *)LineTwo;
//不同意按钮点击
-(void)dissAgreeClick;


@end

@interface CommonAlertTextView : UIView

@property (nonatomic, weak) id <CommonAlertTextViewDelegate> delegate;
/**
* @param title 标题
* @param lineTitleOne 第一行标题
* @param lineTitleTwo 第二行输入框标题
* @param placeHoldOne 第一行placeHold
* @param placeHoldTwo 第二行placeHold
*
*/
-(instancetype)initWithTitle:(NSString *)title lineTitleOne:(NSString *)lineTitleOne lineTitleTwo:(NSString *)lineTitleTwo placeHoldOne:(NSString *)placeHoldOne andPlaceHoldTwo:(NSString *)placeHoldTwo;

/**
 * @param title 标题
 * @param lineTitleOne 第一行标题
 * @param lineTitleTwo 第二行输入框标题
 * @param placeHoldOne 第一行placeHold
 * @param placeHoldTwo 第二行placeHold
 * @param LineOne 第一行文字
 * @param lineTwo 第二行文字
 */
-(instancetype)initWithTitle:(NSString *)title lineTitleOne:(NSString *)lineTitleOne lineTitleTwo:(NSString *)lineTitleTwo placeHoldOne:(NSString *)placeHoldOne andPlaceHoldTwo:(NSString *)placeHoldTwo LineOne:(NSString *)lineOne andLineTwo:(NSString *)lineTwo;

//距离底部距离
@property (nonatomic)CGFloat offSet;

@end
