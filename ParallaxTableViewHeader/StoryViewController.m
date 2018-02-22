//
//  ViewController.m
//  ParallaxTableViewHeader
//
//  Created by Hiran on 2/20/18.
//  Copyright © 2018 iLeaf solutions. All rights reserved.
//

#import "StoryViewController.h"
#import "ParallaxHeaderView.h"
#import "TableHeader.h"
#import "ButtonView.h"

//Configure header size
static CGFloat kHeaderViewHeight = 284;
static CGFloat kButtonViewHeight = 120;
static CGFloat kButtonPadding = 30;

@interface StoryViewController () <ButtonViewDelegate,TableHederViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) TableHeader *header;
@property (strong, nonatomic) ButtonView *buttonView;

@property (nonatomic) NSDictionary *story;

@property (nonatomic) NSArray *imagesDish;
@property (nonatomic) NSArray *namesDish;

@end

@implementation StoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imagesDish = @[[UIImage imageNamed:@"JackfruitTaco"],[UIImage imageNamed:@"EnchiladaLasagne"],[UIImage imageNamed:@"AvocadoChickenBurritos"],[UIImage imageNamed:@"GuacamoleBread"]];
    _namesDish = @[@"Jackfruit Taco",@"Enchilada Lasagne",@"Avocado Chicken Burritos",@"Guacamole Bread"];
    // Create ParallaxHeaderView with specified size, and set it as uitableView Header
    _header = [[TableHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kHeaderViewHeight)];
    NSArray *images = @[@"1",@"2",@"3",@"4"];
    [_header initializeScrollView:images];
    _header.delegate = self;
    _buttonView = [[ButtonView alloc] initWithFrame:CGRectMake(0, _header.frame.size.height-kButtonPadding, self.view.frame.size.width, kButtonViewHeight)];
    _buttonView.delegate = self;
    ParallaxHeaderView *headerView = [ParallaxHeaderView parallaxHeaderViewWithSubView:_header.contentView withButtonView:_buttonView];
    [self.mainTableView setTableHeaderView:headerView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark -
#pragma mark UITableViewDatasource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    UIImageView *imageview = (UIImageView *)[cell viewWithTag:1];
    imageview.image = [_imagesDish objectAtIndex:indexPath.row];
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = [_namesDish objectAtIndex:indexPath.row];
    return cell;
   
}

#pragma mark -
#pragma mark UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.mainTableView)
    {
        // pass the current offset of the UITableView so that the ParallaxHeaderView layouts the subViews.
        [(ParallaxHeaderView *)self.mainTableView.tableHeaderView refreshHeaderForScrollViewOffset:scrollView.contentOffset];
    }
}


#pragma mark -
#pragma mark buttonViewActions

-(void)orderNowButtonAction:(UIButton*)btnBookNow{
    NSLog(@"order now button pressed");
}

-(void)shareButtonAction:(UIButton*)btnShare{
    NSLog(@"share button pressed");

}

-(void)backButtonAction:(UIButton*)btnBookNow{
    NSLog(@"back button action");

}


@end
