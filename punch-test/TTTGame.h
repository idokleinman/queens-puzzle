//
//  TTTGame.h
//  queens
//
//  Created by Ido on 10/28/15.
//  Copyright © 2015 punch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTTBoardView.h"

@protocol TTTGameDelegate <NSObject>

-(void)turnsSwitched:(NSUInteger)currentPlayer;
-(void)gameWon:(NSUInteger)winningPlayer;


@end

@interface TTTGame : NSObject

@property (nonatomic) NSUInteger cellNum;
@property (nonatomic) BOOL player1turn;
@property (nonatomic) BOOL gameWon;
@property (nonatomic, strong) TTTBoardView *board;

@property (nonatomic, weak) id <TTTGameDelegate> delegate;

+(TTTGame *)sharedGame;
-(void)switchTurns;
-(void)start;

@end
