//
//  ButtonView.h
//  Parallax Header
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonViewDelegate <NSObject>

@optional
-(void)orderNowButtonAction:(UIButton*)btnBookNow;
-(void)shareButtonAction:(UIButton*)btnShare;

@end

@interface ButtonView : UIView

@property (retain, nonatomic) IBOutlet UIView *contentView;
@property (retain, nonatomic) IBOutlet UIButton *btnBookNow;
@property (retain, nonatomic) IBOutlet UIButton *btnShare;

@property (weak, nonatomic) id <ButtonViewDelegate> delegate;

@end
