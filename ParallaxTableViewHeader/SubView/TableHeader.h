//
//  TableHeader.h
//  Parallax Header
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableHederViewDelegate <NSObject>

@optional
-(void)backButtonAction:(UIButton*)btnBookNow;
@end

@interface TableHeader : UIView{
    BOOL pageControlBeingUsed;
}

@property (retain, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UIView *contentView;
@property (retain, nonatomic) IBOutlet UIButton *btnBack;

@property (weak, nonatomic) id <TableHederViewDelegate> delegate;

- (void)initializeScrollView:(NSArray*)images;


@end
