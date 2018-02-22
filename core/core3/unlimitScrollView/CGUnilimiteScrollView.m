//
//  CGUnilimiteScrollView.m
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CGUnilimiteScrollView.h"
#import "UIScrollView+ContentOffset.h"
#import "AFHTTPSessionManager.h"
#import "ZYHRequest.h"
#import "CGCache.h"
@implementation CGUnilimiteScrollView
{
    UIPageControl * _pageControl;
    UIImageView * _imageView1;
    UIImageView * _imageView2;
    UIImageView * _imageView3;
    UIScrollView * _scrollView;
    NSTimer * _timer;
    
    CGFloat _scrollTime;
}

-(void)setImageStrs:(NSMutableArray<UIImage *> *)imageStrs{
    
    if ( _pageControl == nil){
    
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = imageStrs.count;
        [self addSubview:_pageControl];
        [self layoutIfNeeded];
    }
    _imageStrs = imageStrs;
    [self setCurrentPage:0];
    if (_timer == nil){
        _timer = [NSTimer scheduledTimerWithTimeInterval:_scrollTime target:self selector:@selector(pageChange) userInfo:nil repeats:true];
    }
}

-(void)replaceImage:(UIImage *)image index:(NSInteger) i{
    [self.imageStrs replaceObjectAtIndex:i withObject:image];
    self.currentPage = 0;
}


-(void)setImageUrls:(NSArray<NSURL *> *)imageUrls{
    _pageControl.currentPage = 0;
    
    NSMutableArray<UIImage *> * images = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < imageUrls.count; i += 1) {
        if (images.count <= i) {
            [images addObject:[UIImage imageNamed:@"beijing"]];
        }
    }
    self.imageStrs = images;
    
    
    
    for (NSInteger i = 0; i < imageUrls.count; i ++) {
       
       UIImage * image = [[CGCache shareInstall] objectForKey:imageUrls[i].absoluteString];
        if (image != nil) {
            [self replaceImage:image index:i];
            continue;
        }
        

       NSURLSession * session = [NSURLSession sharedSession];
       CGUnilimiteScrollView  __block *s = self;
        
    
       NSURLSessionDataTask * task = [session dataTaskWithURL:imageUrls[i] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           dispatch_async(dispatch_get_main_queue(), ^{
               
               UIImage * image = [UIImage imageWithData:data];

               [[CGCache shareInstall] setObject:image forKey:imageUrls[i].absoluteString];
               if (image != nil) {
                   [s replaceImage:image index:i];
               }
               
           });
        }];
        [task resume];
    }

    
    
    _imageUrls = imageUrls;
    
}

- (void)setCurrentPage:(NSInteger)currentPage{

    
    if (currentPage < 0) {
        currentPage = self.imageStrs.count - 1;
    }
    if (currentPage >= self.imageStrs.count) {
        currentPage = 0;
    }
    NSInteger lastPage = ((currentPage - 1) >= 0) ? currentPage - 1 : currentPage - 1 + self.imageStrs.count;
    NSInteger nextPage = (currentPage + 1) >= self.imageStrs.count ? 0 : currentPage + 1;
    
   
    
    if (self.imageStrs.count > currentPage){
        _imageView2.image =  self.imageStrs[currentPage];
    }
    if (self.imageStrs.count > lastPage) {
        _imageView1.image = self.imageStrs[lastPage];
    }
    if (self.imageStrs.count > nextPage) {
        _imageView3.image = self.imageStrs[nextPage];
    }
    _currentPage = currentPage;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil){
        [self doSomeInit];
    }
    return self;
}

-(instancetype)init{
    
    
    self = [super init];
    if (self != nil){
        [self doSomeInit];
    }
    return self;
}

-(void) doSomeInit{
//    self.backgroundColor = [UIColor redColor];
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _imageView1 = [[UIImageView alloc] init];
    _imageView2 = [[UIImageView alloc] init];
    _imageView3 = [[UIImageView alloc] init];
    [_scrollView addSubview:_imageView1];
    [_scrollView addSubview:_imageView2];
    [_scrollView addSubview:_imageView3];
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    [self setDefault];
    [self setDelegate];
}
-(void) setDefault{
    _scrollTime = 5;
}
-(void) setDelegate{
    _scrollView.delegate = self;
}



-(void)layoutSubviews{
    CGFloat width = [self width];
    CGFloat height = 50;
    CGFloat x = 0;
    CGFloat y = [self maxY] - height;
    _pageControl.frame = CGRectMake(x, y, width, height);
    
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 3, _scrollView.frame.size.height);
    [_scrollView setOffSetX:[_scrollView width]];
    
    x = 0;
    y = 0;
    width = [self width];
    height = [self height];
    _imageView1.frame = CGRectMake(x, y, width, height);
    
    x = [_imageView1 maxX];
    _imageView2.frame = CGRectMake(x, y, width, height);
    
    x = [_imageView2 maxX];
    _imageView3.frame = CGRectMake(x, y, width, height);
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x >= [scrollView width] * 2) {
        [scrollView setOffSetX:[scrollView width]];
        self.currentPage += 1;
    }
    if (scrollView.contentOffset.x <= 0) {
        [scrollView setOffSetX:[scrollView width]];
        self.currentPage -= 1;
    }
    _pageControl.currentPage = self.currentPage;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self timerCancel];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
     _timer = [NSTimer scheduledTimerWithTimeInterval:_scrollTime target:self selector:@selector(pageChange) userInfo:nil repeats:true];
}

-(void) pageChange{
    [_scrollView setContentOffset:CGPointMake(2*[_scrollView width], 0) animated:true];
    
}
-(void) timerCancel{
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}

-(void)dealloc{
    [self timerCancel];
}


@end
