//
//  TTTBoard.m
//  punch-test
//
//  Created by Ido on 10/28/15.
//  Copyright © 2015 punch. All rights reserved.
//

#import "TTTBoardView.h"
#import "TTTCellView.h"
#import "TTTGame.h"
#import "queens-Swift.h"

//typedef (NSArray<NSArray<Cell *>> *) Board;

@interface TTTBoardView()
@property (nonatomic, strong) NSMutableArray *internalCells;

@end

@implementation TTTBoardView



-(instancetype)initWithFrame:(CGRect)frame andBoard:(NSArray *)board {
    self = [super initWithFrame:frame];
    if (self)
    {
        
        NSUInteger cellNum = board.count;
        
        
        self.internalCells = [[NSMutableArray alloc] init];
        
        CGFloat maxDim = MIN(frame.size.width, frame.size.height);
        CGFloat cellDim = maxDim/cellNum;
        
        
        for (NSUInteger i=0; i<cellNum; i++)
        {
            [self.internalCells addObject:[[NSMutableArray alloc] init]];
            
            for (NSUInteger j=0; j<cellNum; j++)
            {
                TTTCellView *cellView = [[TTTCellView alloc] initWithFrame:CGRectMake(i*cellDim, j*cellDim, cellDim, cellDim)];
                cellView.cell = [board[i][j] copy];
                [self addSubview:cellView];
                [self.internalCells[i] addObject:cellView];
            }
        }
    }
    return self;
    
}

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    
//}

-(NSArray *)cellViews
{
    return [self.internalCells copy];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
