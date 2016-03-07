//
//  TTTBoard.h
//  queens
//
//  Created by Ido on 10/28/15.
//  Copyright © 2015 punch. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TTTBoardView : UIView

@property (nonatomic, strong) NSArray *cellViews;
-(instancetype)initWithFrame:(CGRect)frame andBoard:(NSArray *)board;

@end
