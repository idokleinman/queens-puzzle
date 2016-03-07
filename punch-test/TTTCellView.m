//
//  TTTCellView.m
//  queens
//
//  Created by Ido on 10/28/15.
//  Copyright © 2015 punch. All rights reserved.
//

#import "TTTCellView.h"
#import <QuartzCore/QuartzCore.h>
#import "TTTGame.h"

#import "queens-Swift.h"

@interface TTTCellView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TTTCellView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

-(void)baseInit
{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2.0f;
    self.cell = [[Cell alloc] initWithState:CellStateEmpty];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.imageView];
    [self bringSubviewToFront:self.imageView];
    
//    [self.cell addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)setCell:(Cell *)cell
{
    _cell = cell;
    [self updateDrawState];
}


-(void)updateDrawState {
    if (self.cell.state == CellStateEmpty) {
        self.imageView.image = nil;
    } else {
        [self.imageView setImage:[UIImage imageNamed:@"queen"]];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    NSLog(@"cell: %@",object);
    
    [self updateDrawState];
}

-(void)dealloc {
//    [self.cell removeObserver:self forKeyPath:@"state"];
}


@end
