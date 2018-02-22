ILSParallaxHeader
=======================

Custom UIView subclass header for UITableView with parallax effect on images. 

## Preview
<img src="./Asset/Screenshot.png?raw=false">

## Usage

1. Create a uiview subclass with horizontally scrollable images

```objective-c     
    _header = [[TableHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kHeaderViewHeight)];
    NSArray *images = @[@"1",@"2",@"3",@"4"];
    [_header initializeScrollView:images];
    _header.delegate = self;
```
2. Create a uiview subclass with buttons

```objective-c 
    _buttonView = [[ButtonView alloc] initWithFrame:CGRectMake(0, _header.frame.size.height-kButtonPadding, self.view.frame.size.width, kButtonViewHeight)];
    _buttonView.delegate = self;
```

3. Create ParallaxHeaderView and set it as uitableview header

```objective-c 
    ParallaxHeaderView *headerView = [ParallaxHeaderView parallaxHeaderViewWithSubView:@"pass first custom uiview subclass here" withButtonView:@"pass second custom uiview subclass here"];
    [self.mainTableView setTableHeaderView:headerView];
```

## Author
iLeaf Solutions
 [http://www.ileafsolutions.com](http://www.ileafsolutions.com)


## License

    MIT License

	Copyright (c) 2018 iLeaf Solutions Pvt. Ltd.

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

    

