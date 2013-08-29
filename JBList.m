//
//  JBList.m
//
//
//  Created by Julius Btesh on 8/28/13.
//
//

#import "JBList.h"

@implementation JBList {
    JBListNode *_head;
    JBListNode *_tail;
    JBListNode *_currTop;
    JBListNode *_currBottom;
    int _count;
    int nodeID;
}

- (id)init {
    if (self = [super init]) {
        _head = nil;
        _tail = nil;
        _count = 0;
    }
    return self;
}

- (void)dealloc {
    int i = 0;
    JBListNode *tmp;
    while (i < _count){
        tmp = _head;
        _head = _head.next;
        tmp = nil;
    }
}

- (void)pushFront:(NSMutableDictionary *)skills {
    JBListNode *newElement = [[JBListNode alloc] init];
    newElement.skills = skills;
    if ( _count == 0 ){
        newElement.next = nil; //Set both the head and tail to NULL
        newElement.previous = nil;
        newElement.nodeID = 1;
        _count = 1;
        _head = newElement;
        _tail = newElement;
        _currTop = newElement;
        _currBottom = newElement;
        return; //Since there is only one element, quit
    }
    nodeID += 1;
    JBListNode *tmp = _head;
    newElement.next = tmp; //The new guys next is currently pointing to the bottom most element
    newElement.previous = tmp.previous; //Now, whatever the bottom was pointing to (the tail) the new node is pointing to.
    newElement.nodeID += 1;
    _currBottom = newElement; //The new node is now the bottom most element
    tmp.previous = newElement; //Now the former bottom is pointing to the new bottom
    _head = newElement; //The head is the bottom most element
    _count += 1;
}

- (void)pushBack:(NSMutableDictionary *)skills {
    JBListNode *newElement = [[JBListNode alloc] init];
    newElement.skills = skills;
    if ( _count == 0 ) {
        newElement.next = nil;
        newElement.previous = nil;
        newElement.nodeID = 1;
        nodeID = 1;
        _count = 1;
        _head = newElement;
        _tail = newElement;
        _currTop = newElement;
        _currBottom = newElement;
        return; //Since there is only one element, quit
    }
    nodeID += 1;
    JBListNode *tmp = _tail;
    newElement.previous = tmp; // The new node is pointing to the last element added
    newElement.next = tmp.next; // What ever the current top was pointing to, now the new node is pointing to it
    newElement.nodeID = nodeID;
    _currTop = newElement; // Top most element
    tmp.next = newElement; // Now the former top node is pointing to the new node
    _tail = newElement; // The tail is the top element
    _count += 1;
}

- (void)pushFront:(NSMutableDictionary *)skills withRequirements:(NSMutableDictionary *)requirements {
    JBListNode *newElement = [[JBListNode alloc] init];
    newElement.skills = skills;
    newElement.requirements = requirements;
    if ( _count == 0 ){
        newElement.next = nil; //Set both the head and tail to NULL
        newElement.previous = nil;
        newElement.nodeID = 1;
        nodeID = 1;
        _count = 1;
        _head = newElement;
        _tail = newElement;
        _currTop = newElement;
        _currBottom = newElement;
        return; //Since there is only one element, quit
    }
    nodeID += 1;
    JBListNode *tmp = _head;
    newElement.next = tmp; //The new guys next is currently pointing to the bottom most element
    newElement.previous = tmp.previous; //Now, whatever the bottom was pointing to (the tail) the new node is pointing to.
    newElement.nodeID = nodeID;
    _currBottom = newElement; //The new node is now the bottom most element
    tmp.previous = newElement; //Now the former bottom is pointing to the new bottom
    _head = newElement; //The head is the bottom most element
    _count += 1;
}

- (void)pushBack:(NSMutableDictionary *)skills withRequirements:(NSMutableDictionary *)requirements {
    JBListNode *newElement = [[JBListNode alloc] init];
    newElement.skills = skills;
    newElement.requirements = requirements;
    if ( _count == 0 ) {
        newElement.next = nil;
        newElement.previous = nil;
        newElement.nodeID = 1;
        nodeID = 1;
        _count = 1;
        _head = newElement;
        _tail = newElement;
        _currTop = newElement;
        _currBottom = newElement;
        return; //Since there is only one element, quit
    }
    nodeID += 1;
    JBListNode *tmp = _tail;
    newElement.previous = tmp; // The new node is pointing to the last element added
    newElement.next = tmp.next; // What ever the current top was pointing to, now the new node is pointing to it
    newElement.nodeID = nodeID;
    _currTop = newElement; // Top most element
    tmp.next = newElement; // Now the former top node is pointing to the new node
    _tail = newElement; // The tail is the top element
    _count += 1;
}

- (NSMutableDictionary *)popFront {
    if (_count == 0){//Empty!
        NSLog(@"Empty!");
        return 0;
    }
    if (_count - 1 == 0) //If count will equal 0, there is 1 element in the list
    {
        NSMutableDictionary *value = _currBottom.skills; //hold the data, so i can delete the bottom
        _currBottom = nil; //delete the last element
        _count = 0;
        _head = nil; //head and tail are pointing to NULL
        _tail = nil;
        return value;
    }
    
    NSMutableDictionary *value = _currBottom.skills;
    JBListNode *tmp = _head;
    JBListNode *tmp2 = tmp.next;
    JBListNode *tmp3 = _tail;
    tmp2.previous = nil;
    tmp3.next = nil;
    _head = tmp2;
    _currBottom = tmp2;
    tmp = nil;
    _count -= 1;
    return value;
}

- (NSMutableDictionary *)popBack {
    if (_count == 0){//Empty!
        NSLog(@"Empty!");
        return 0;
    }
    if (_count - 1 == 0) //If count will equal 0, there is 1 element in the list
    {
        NSMutableDictionary *value = _currTop.skills; //hold the data, so i can delete the tmp
        _currTop = nil; //delete the last element
        _count = 0;
        _head = nil; //head and tail are pointing to NULL
        _tail = nil;
        return value;
    }
    
    NSMutableDictionary *value = _currTop.skills;
    JBListNode *tmp = _tail;
    JBListNode *tmp2 = tmp.previous;
    JBListNode *tmp3 = _head;
    tmp2.next = nil;
    tmp3.previous = nil;
    _tail = tmp2;
    _currTop = tmp2;
    tmp = nil;
    _count -= 1;
    return value;
}

- (NSMutableDictionary *)popNode:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    if (node == 1) //If count will equal 0, there is 1 element in the list
    {
        NSMutableDictionary *value = tmp.skills; //hold the data, so i can delete the tmp
        _head = tmp.next;
        _currBottom = tmp.next;
        _count -= 1;
        return value;
    }
    if (node == nodeID) {
        NSMutableDictionary *value = tmp.skills;
        JBListNode *tmp2 = tmp.previous;
        tmp2.next = nil;
        _tail = tmp2;
        _currTop = tmp2;
        tmp = nil;
        _count -= 1;
        return value;
    }
    
    NSMutableDictionary *value = tmp.skills;
    JBListNode *tmp2 = tmp.previous;
    JBListNode *tmp3 = tmp.next;
    tmp2.next = tmp3;
    tmp3.previous = tmp2;
    tmp = nil;
    _count -= 1;
    return value;
    
}

- (NSMutableDictionary *)findSkillsForNode:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    return tmp.skills;
}

- (void)editSkillsAtNode:(NSInteger)node setValue:(id)value forKey:(NSString *)key {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    [tmp.skills setValue:value forKey:key];
}

- (void)activateNode:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    tmp.activated = YES;
}

- (void)deactivateNode:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    tmp.activated = YES;
}

- (BOOL)isActivated:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    return tmp.activated;
}

- (void)setRequirements:(NSMutableDictionary *)requirements forNode:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    tmp.requirements = requirements;
}

- (void)editRequirementsAtNode:(NSInteger)node setValue:(id)value forKey:(NSString *)key {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    [tmp.requirements setValue:value forKey:key];
}

- (NSMutableDictionary *)findRequirements:(NSMutableDictionary *)requirements forNode:(NSInteger)node {
    JBListNode *tmp = _head;
    while (tmp.nodeID != node) {
        tmp = tmp.next;
    }
    return tmp.requirements;
}

- (NSInteger)findNodeIDForSkills:(NSMutableDictionary *)skills {
    JBListNode *tmp = _head;
    while (tmp.skills != skills) {
        tmp = tmp.next;
    }
    return tmp.nodeID;
}

- (NSInteger)findNodeIDForSkills:(NSMutableDictionary *)skills andRequirements:(NSMutableDictionary *)requirements {
    JBListNode *tmp = _head;
    while (tmp.skills != skills || tmp.requirements != requirements) {
        tmp = tmp.next;
    }
    return tmp.nodeID;
}

- (void)allNodes {
	JBListNode* tmp = _head;
	while (tmp != nil){
        NSLog(@"NodeID: %d", tmp.nodeID);
		NSLog(@"Skill: %@", tmp.skills);
        NSLog(@"Requirements: %@", tmp.requirements);
        NSLog(@"Activated: %d", tmp.activated);
		tmp = tmp.next;
	}
}

@end
