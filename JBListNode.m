//
//  JBListNode.m
//  
//
//  Created by Julius Btesh on 8/28/13.
//
//

#import "JBListNode.h"

@implementation JBListNode {
    JBListNode *_next;
    JBListNode *_previous;
    
    NSInteger _nodeID;
    NSMutableDictionary *_skills;
    NSMutableDictionary *_requirements;
    BOOL _activated;
}


- (id)init {
    if (self = [super init]) {
        _next = nil;
        _previous = nil;
        _activated = NO;
    }
    return self;
}

@end
