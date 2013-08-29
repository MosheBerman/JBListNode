//
//  JBListNode.h
//  
//
//  Created by Julius Btesh on 8/28/13.
//
//

#import <Foundation/Foundation.h>

@interface JBListNode : NSObject


@property (nonatomic) JBListNode *next;
@property (nonatomic) JBListNode *previous;

@property (nonatomic) NSInteger nodeID;
@property (nonatomic) NSMutableDictionary *skills;
@property (nonatomic) NSMutableDictionary *requirements;
@property (nonatomic) BOOL activated;



@end
