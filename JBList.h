//
//  JBList.h
//
//
//  Created by Julius Btesh on 8/28/13.
//
//

#import <Foundation/Foundation.h>
#import "JBListNode.h"


@interface JBList : NSObject

@property (nonatomic) JBListNode *head; // This always points to the first position of the list
@property (nonatomic) JBListNode *tail; // Always points to the last position
@property (nonatomic) JBListNode *currTop;
@property (nonatomic) JBListNode *currBottom;
@property (nonatomic) int count;

- (void)pushFront:(NSMutableDictionary *)skills;
- (void)pushBack:(NSMutableDictionary *)skills;

- (void)pushFront:(NSMutableDictionary *)skills withRequirements:(NSMutableDictionary *)requirements;
- (void)pushBack:(NSMutableDictionary *)skills withRequirements:(NSMutableDictionary *)requirements;
- (NSMutableDictionary *)popFront;
- (NSMutableDictionary *)popBack;
- (NSMutableDictionary *)popNode:(NSInteger)node;

/* Will not work if you have multiple Skill Dictionaries with the same Keys + Values!!!!!
    Will find the FIRST nodeID with said Skill!!!!! 
*/
- (NSInteger)findNodeIDForSkills:(NSMutableDictionary *)skills;
/* Used for better search precision incase you have multiple Skill Dictionaries but different Requirement Dictionaries!!!
    But same as above, if there are multiple Skill AND Requirement Dictionaries with the same Keys + Values
    it will find the FIRST nodeID with said Skill AND Requirement!!! 
*/
- (NSInteger)findNodeIDForSkills:(NSMutableDictionary *)skills andRequirements:(NSMutableDictionary *)requirements;

- (void)activateNode:(NSInteger)node;
- (void)deactivateNode:(NSInteger)node;
- (BOOL)isActivated:(NSInteger)node;

- (void)setRequirements:(NSMutableDictionary *)requirements forNode:(NSInteger)node;
- (void)editRequirementsAtNode:(NSInteger)node setValue:(id)value forKey:(NSString *)key;
- (NSMutableDictionary *)findRequirements:(NSMutableDictionary *)requirements forNode:(NSInteger)node;

- (NSMutableDictionary *)findSkillsForNode:(NSInteger)node;
- (void)editSkillsAtNode:(NSInteger)node setValue:(id)value forKey:(NSString *)key;
- (void)allNodes;


@end