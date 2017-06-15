//
//  YPSlider.m
//  Rippton
//
//  Created by yeyongping on 2017/6/3.
//  Copyright © 2017年 Rippton. All rights reserved.
//

#import "YPSlider.h"

@interface YPSlider ()<UIScrollViewDelegate>

@property (weak, nonatomic) UIView *slider;
@property (weak, nonatomic) UIView *leftBackgroundView;
@property (copy, nonatomic) void(^sliderHandle)( BOOL);
@property (weak, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) BOOL isRight;
@end

@implementation YPSlider

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (!CGRectContainsPoint(self.slider.frame,point) && CGRectContainsPoint(self.bounds, point)) {
        return nil;
    }
    return hitTestView;
}


+ (instancetype)sliderWithFrame:(CGRect)frame sliderToRight:(void(^)(BOOL))sliderHandle{
    YPSlider *sliderView = [[self alloc] initWithFrame:frame];
    sliderView.sliderHandle = sliderHandle;
    sliderView.isRight = NO;
    return sliderView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.backgroundColor = [UIColor greenColor];
    
    self.layer.cornerRadius = height/2;
    self.layer.masksToBounds = YES;
    self.contentSize = CGSizeMake(2*width - height, 0);
    self.contentOffset = CGPointMake(width - height, 0);
    
    self.delegate = self;
    
    UIView *leftBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width - height/2, height)];
    _leftBackgroundView = leftBackgroundView;
    leftBackgroundView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:leftBackgroundView];
    
    UIView *slider = [[UIView alloc] initWithFrame:CGRectMake(width - height, 0, height, height)];
    _slider = slider;
    slider.backgroundColor = [UIColor whiteColor];
    slider.layer.cornerRadius = height/2;
    slider.layer.masksToBounds = YES;
    [self addSubview:slider];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat width = CGRectGetWidth(self.frame);
    
    self.layer.cornerRadius = height/2;
    self.layer.masksToBounds = YES;
    
    _leftBackgroundView.frame = CGRectMake(0, 0, width - height/2, height);
    _slider.frame = CGRectMake(width - height, 0, height, height);
    _slider.layer.cornerRadius = height/2;
    _slider.layer.masksToBounds = YES;
    
    if (_titleLabel) {
        [_titleLabel sizeToFit];
        _titleLabel.center = CGPointMake(self.bounds.size.width/2 + self.contentOffset.x, self.bounds.size.height/2);
    }
}

#pragma mark - scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    if (0 == x) {
        if (_sliderHandle && !_isRight) {
            _sliderHandle(YES);
            _isRight = YES;
        }
    } else if (CGRectGetWidth(scrollView.frame) - CGRectGetHeight(scrollView.frame) == x && _isRight) {
        if (_sliderHandle) {
            _sliderHandle(NO);
            _isRight = NO;
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat x = scrollView.contentOffset.x;
    if (0 == x) {
        if (_sliderHandle && !_isRight) {
            _sliderHandle(YES);
            _isRight = YES;
        }
    } else if (CGRectGetWidth(scrollView.frame) - CGRectGetHeight(scrollView.frame) == x && _isRight) {
        if (_sliderHandle) {
            _sliderHandle(NO);
            _isRight = NO;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_titleLabel) {
        _titleLabel.center = CGPointMake(self.bounds.size.width/2 + self.contentOffset.x, self.bounds.size.height/2);
    }
}

#pragma mark - Action
- (void)sliderToRight:(void(^)(BOOL isRight))sliderHandle {
    _sliderHandle = sliderHandle;
}

#pragma mark - Frame Notifation
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"frame"]) {
        CGFloat height = CGRectGetHeight(self.frame);
        CGFloat width = CGRectGetWidth(self.frame);
        self.contentSize = CGSizeMake(2*width - height, 0);
        self.contentOffset = CGPointMake(width - height, 0);
    }
}

#pragma - Life Cycle
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"frame"];
}


#pragma mark -
- (void)setTitle:(NSString *)title {
    _title = title;
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        _titleLabel = label;
        [self addSubview:label];
    }
    _titleLabel.text = title;
    if (_titleColor) {
        _titleLabel.textColor = _titleColor;
    }
    if (_titleFont) {
        _titleLabel.font = _titleFont;
    }
    
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(self.bounds.size.width/2 + self.contentOffset.x, self.bounds.size.height/2);
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    if (_titleLabel) {
        _titleLabel.textColor = titleColor;
        [_titleLabel sizeToFit];
        _titleLabel.center = CGPointMake(self.bounds.size.width/2 + self.contentOffset.x, self.bounds.size.height/2);
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (_titleLabel) {
        _titleLabel.font = titleFont;
        [_titleLabel sizeToFit];
        _titleLabel.center = CGPointMake(self.bounds.size.width/2 + self.contentOffset.x, self.bounds.size.height/2);
    }
}

@end
