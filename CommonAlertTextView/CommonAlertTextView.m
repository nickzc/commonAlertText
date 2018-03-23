//
//  CommonAlertTextView.m
//
//  Created by  on 2018/1/30.
//  Copyright © 2018年. All rights reserved.
//

#import "CommonAlertTextView.h"
#import "UILabel+LineSpace.h"
//需要引入Masonry框架
#import "Masonry.h"

@interface CommonAlertTextView()
//点击手势
@property(nonatomic,strong)UITapGestureRecognizer *viewTap;
@property(nonatomic,strong)UIView *view;
//背景View
@property(nonatomic,strong)UIView *backView;
//title
@property(nonatomic,strong)UILabel *titleLabel;
//横线
@property(nonatomic,strong)UIView *hengXian;
//竖线
@property(nonatomic,strong)UIView *shuxian;
//同意按钮
@property(nonatomic,strong)UIButton *agreeButton;
//不同意按钮
@property(nonatomic,strong)UIButton *dissAgreeButton;

//view1
@property(nonatomic,strong)UIView *backViewOne;
//view2
@property(nonatomic,strong)UIView *backViewTwo;
//placeHoldLabel1
@property(nonatomic,strong)UILabel *placeHoldLabelOne;
//placeHoldLabel2
@property(nonatomic,strong)UILabel *placeHoldLabelTwo;
//textField1
@property(nonatomic,strong)UITextField *textFieldOne;
//textField2
@property(nonatomic,strong)UITextField *textFieldTwo;

@end

@implementation CommonAlertTextView

#pragma mark - life cycle

-(instancetype)initWithTitle:(NSString *)title lineTitleOne:(NSString *)lineTitleOne lineTitleTwo:(NSString *)lineTitleTwo placeHoldOne:(NSString *)placeHoldOne andPlaceHoldTwo:(NSString *)placeHoldTwo;
{
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        [self addSubview:self.view];
        [self.view addGestureRecognizer:self.viewTap];
        [self addSubview:self.backView];
        [self.backView addSubview:self.titleLabel];
        [self.backView addSubview:self.backViewOne];
        [self.backViewOne addSubview:self.placeHoldLabelOne];
        [self.backViewOne addSubview:self.textFieldOne];
        [self.backView addSubview:self.backViewTwo];
        [self.backViewTwo addSubview:self.placeHoldLabelTwo];
        [self.backViewTwo addSubview:self.textFieldTwo];
        [self.backView addSubview:self.hengXian];
        [self.backView addSubview:self.shuxian];
        [self.backView addSubview:self.agreeButton];
        [self.backView addSubview:self.dissAgreeButton];
        [self.titleLabel setText:title lineSpacing:7];
        [self.placeHoldLabelOne setText:lineTitleOne];
        [self.placeHoldLabelTwo setText:lineTitleTwo];
        self.textFieldOne.placeholder = placeHoldOne;
        self.textFieldTwo.placeholder = placeHoldTwo;
        
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title lineTitleOne:(NSString *)lineTitleOne lineTitleTwo:(NSString *)lineTitleTwo placeHoldOne:(NSString *)placeHoldOne andPlaceHoldTwo:(NSString *)placeHoldTwo LineOne:(NSString *)lineOne andLineTwo:(NSString *)lineTwo{
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        [self addSubview:self.view];
        [self.view addGestureRecognizer:self.viewTap];
        [self addSubview:self.backView];
        [self.backView addSubview:self.titleLabel];
        [self.backView addSubview:self.backViewOne];
        [self.backViewOne addSubview:self.placeHoldLabelOne];
        [self.backViewOne addSubview:self.textFieldOne];
        [self.backView addSubview:self.backViewTwo];
        [self.backViewTwo addSubview:self.placeHoldLabelTwo];
        [self.backViewTwo addSubview:self.textFieldTwo];
        [self.backView addSubview:self.hengXian];
        [self.backView addSubview:self.shuxian];
        [self.backView addSubview:self.agreeButton];
        [self.backView addSubview:self.dissAgreeButton];
        [self.titleLabel setText:title lineSpacing:7];
        [self.placeHoldLabelOne setText:lineTitleOne];
        [self.placeHoldLabelTwo setText:lineTitleTwo];
        self.textFieldOne.text = lineOne;
        self.textFieldTwo.text = lineTwo;
        self.textFieldOne.placeholder = placeHoldOne;
        self.textFieldTwo.placeholder = placeHoldTwo;
    }
    return self;
}

//布局
-(void)layoutSubviews{
    [super layoutSubviews];
    @weakify(self);
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self.backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        if (self.offSet != 0 ) {
            make.centerY.equalTo(self.mas_centerY).with.offset(-self.offSet);
            make.left.equalTo(self.mas_left).with.offset(30);
            make.right.equalTo(self.mas_right).with.offset(-30);
            make.height.mas_offset(206);
        }else{
            make.centerY.equalTo(self.mas_centerY).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(30);
            make.right.equalTo(self.mas_right).with.offset(-30);
            make.height.mas_offset(206);
        }
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.mas_offset(20);
        make.centerX.mas_equalTo(0);
        make.width.equalTo(self.backView.mas_width);
        make.height.mas_offset(20);
    }];
    
    [self.backViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.backView.mas_left).with.offset(20);
        make.right.equalTo(self.backView.mas_right).with.offset(-20);
        make.height.mas_offset(40);
    }];
    
    [self.placeHoldLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.backViewOne.mas_centerY);
        make.left.equalTo(self.backViewOne.mas_left).with.offset(5);
        make.height.mas_offset(20);
        make.width.mas_offset(70);
    }];
    
    [self.textFieldOne mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.backViewOne.mas_centerY);
        make.left.equalTo(self.placeHoldLabelOne.mas_right);
        make.right.equalTo(self.backViewOne.mas_right).with.offset(-5);
        make.height.mas_offset(25);
    }];

    [self.backViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.backViewOne.mas_bottom).with.offset(10);
        make.left.equalTo(self.backView.mas_left).with.offset(20);
        make.right.equalTo(self.backView.mas_right).with.offset(-20);
        make.height.mas_offset(40);
    }];
    
    [self.placeHoldLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.backViewTwo.mas_centerY);
        make.left.equalTo(self.backViewTwo.mas_left).with.offset(5);
        make.height.mas_offset(20);
        make.width.mas_offset(70);
    }];
    
    [self.textFieldTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerY.equalTo(self.backViewTwo.mas_centerY);
        make.left.equalTo(self.placeHoldLabelTwo.mas_right);
        make.right.equalTo(self.backViewTwo.mas_right).with.offset(-5);
        make.height.mas_offset(25);
    }];
    
    [self.hengXian mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.backViewTwo.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.backView.mas_centerX);
        make.height.mas_offset(1);
        make.width.equalTo(self.backView.mas_width);
    }];
    
    [self.shuxian mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.equalTo(self.backView);
        make.top.equalTo(self.hengXian);
        make.bottom.equalTo(self.backView);
        make.width.mas_offset(1);
    }];
    
    [self.agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.hengXian.mas_bottom).with.offset(1);
        make.left.equalTo(self.shuxian.mas_right).with.offset(1);
        make.bottom.equalTo(self.backView.mas_bottom).with.offset(-1);
        make.right.equalTo(self.backView.mas_right);
    }];
    
    [self.dissAgreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.hengXian.mas_bottom).with.offset(1);
        make.left.equalTo(self.backView.mas_left).with.offset(1);
        make.bottom.equalTo(self.backView.mas_bottom).with.offset(-1);
        make.right.equalTo(self.shuxian.mas_left).with.offset(-1);
    }];
}

#pragma mark - action Method
//点击其他区域
- (void)viewTap:(UIGestureRecognizer *)gesture {
    if ([_delegate respondsToSelector:@selector(disclaimerViewTap)]) {
        [_delegate disclaimerViewTap];
        [MainWindow endEditing:YES];
    }
}
//不同意
-(void)dissAgreeButtonClick{
    if ([_delegate respondsToSelector:@selector(dissAgreeClick)]) {
        [_delegate dissAgreeClick];
    }
}
//同意
-(void)agreeButtonClick{
    if ([_delegate respondsToSelector:@selector(agreeClickWithLineOne:andLineTwo:)]) {
        [_delegate agreeClickWithLineOne:self.textFieldOne.text andLineTwo:self.textFieldTwo.text];
    }
}
#pragma mark - getter and setter

-(UITapGestureRecognizer *)viewTap{
    if (!_viewTap) {
        _viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    }
    return _viewTap;
}
-(UIView *)view{
    if (!_view) {
        _view = [[UIView alloc]init];
        _view.userInteractionEnabled = YES;
        _view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    }
    return _view;
}
//背景View
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor colorWithHexString:COLOR_GRAYLIGHT];
        _backView.userInteractionEnabled = YES;
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 5;
    }
    return _backView;
}

//title
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

//横线
-(UIView *)hengXian{
    if (!_hengXian) {
        _hengXian = [[UIView alloc]init];
        _hengXian.backgroundColor = [UIColor colorWithHexString:COLORLINE];
    }
    return _hengXian;
}

//竖线
-(UIView *)shuxian{
    if (!_shuxian) {
        _shuxian = [[UIView alloc]init];
        _shuxian.backgroundColor = [UIColor colorWithHexString:COLORLINE];
    }
    return _shuxian;
}

//同意按钮
-(UIButton *)agreeButton{
    if (!_agreeButton) {
        _agreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_agreeButton setTitle:@"确定" forState:UIControlStateNormal];
        [_agreeButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_agreeButton setTitleColor:[UIColor colorWithHexString:COLORBLUEBOARD] forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _agreeButton;
}

//不同意按钮
-(UIButton *)dissAgreeButton{
    if (!_dissAgreeButton) {
        _dissAgreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dissAgreeButton setTitle:@"取消" forState:UIControlStateNormal];
        [_dissAgreeButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_dissAgreeButton setTitleColor:[UIColor colorWithHexString:COLORTEXT] forState:UIControlStateNormal];
        [_dissAgreeButton addTarget:self action:@selector(dissAgreeButtonClick)forControlEvents:UIControlEventTouchUpInside];
    }
    return _dissAgreeButton;
}

//view1
-(UIView *)backViewOne{
    if (!_backViewOne) {
        _backViewOne = [[UIView alloc]init];
        _backViewOne.backgroundColor = [UIColor whiteColor];
        _backViewOne.layer.masksToBounds = YES;
        _backViewOne.layer.cornerRadius = 5.0;
        _backViewOne.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
        _backViewOne.layer.borderWidth = 1;
    }
    return _backViewOne;
}
//view2
-(UIView *)backViewTwo{
    if (!_backViewTwo) {
        _backViewTwo = [[UIView alloc]init];
        _backViewTwo.backgroundColor = [UIColor whiteColor];
        _backViewTwo.layer.masksToBounds = YES;
        _backViewTwo.layer.cornerRadius = 5.0;
        _backViewTwo.layer.borderColor = [UIColor colorWithHexString:@"e6e6e6"].CGColor;
        _backViewTwo.layer.borderWidth = 1;
    }
    return _backViewTwo;
}
//placeHoldLabel1
-(UILabel *)placeHoldLabelOne{
    if (!_placeHoldLabelOne) {
        _placeHoldLabelOne = [[UILabel alloc]init];
//        _placeHoldLabelOne.backgroundColor = [UIColor yellowColor];
        _placeHoldLabelOne.textColor =[UIColor colorWithHexString:COLORTEXT];
        _placeHoldLabelOne.font = [UIFont systemFontOfSize:13];
        _placeHoldLabelOne.textAlignment = NSTextAlignmentCenter;
    }
    return _placeHoldLabelOne;
}
//placeHoldLabel2
-(UILabel *)placeHoldLabelTwo{
    if (!_placeHoldLabelTwo) {
        _placeHoldLabelTwo = [[UILabel alloc]init];
//        _placeHoldLabelTwo.backgroundColor = [UIColor yellowColor];
        _placeHoldLabelTwo.textColor =[UIColor colorWithHexString:COLORTEXT];
        _placeHoldLabelTwo.font = [UIFont systemFontOfSize:13];
        _placeHoldLabelTwo.textAlignment = NSTextAlignmentCenter;
    }
    return _placeHoldLabelTwo;
}

//textField1
-(UITextField *)textFieldOne{
    if (!_textFieldOne) {
        _textFieldOne =[[UITextField alloc]init];
        _textFieldOne.font = [UIFont systemFontOfSize:14];
        _textFieldOne.textColor = [UIColor colorWithHexString:COLORTEXT];
        _textFieldOne.clearButtonMode = YES;
//        _textFieldOne.backgroundColor = [UIColor blueColor];
    }
    return _textFieldOne;
}

//textField2
-(UITextField *)textFieldTwo{
    if (!_textFieldTwo) {
        _textFieldTwo =[[UITextField alloc]init];
        _textFieldTwo.font = [UIFont systemFontOfSize:14];
        _textFieldTwo.textColor = [UIColor colorWithHexString:COLORTEXT];
        _textFieldTwo.clearButtonMode = YES;
//        _textFieldTwo.backgroundColor = [UIColor blueColor];
    }
    return _textFieldTwo;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
