//
//  TTTGame.m
//  queens
//
//  Created by Ido on 10/28/15.
//  Copyright © 2015 punch. All rights reserved.
//

#import "TTTGame.h"
#import "TTTBoardView.h"
#import "TTTCellView.h"


@implementation TTTGame

+(TTTGame *)sharedGame
{
    static TTTGame *sharedGame;
    @synchronized(self)
    {
        if(!sharedGame)
        {
            sharedGame = [[TTTGame alloc] init];
            sharedGame.player1turn = YES;
            sharedGame.cellNum = 3;
            sharedGame.gameWon = NO;
        }
        return sharedGame;
    }
}

-(void)start
{
    self.gameWon = NO;
    self.player1turn = YES;
}

-(void)switchTurns {

    
}

@end
