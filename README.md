JBListNode
==========

Description:
------------
Custom Binary Tree Class with complete access to all nodes in the tree (to be continued)
I put this class together in hopes of creating a Talent/Skill tree for a game but still not sure how to implement it correctly.

I'm kinda new to Objective-C programming and this is basically my first "Custom" Class that I worked on.
Anything that seems unnecessary or extra please let me know about it.
If anything doesn't seem to be working as expected, please let me know about it.
Please let me know if there is anything I should add to the classes.

All feedback is wanted.

The Nodes are initialize with each a pointer to the previous node (first node ->previous = nil) and a pointer to the next node (last node -> next = nil)
Attributes involved:
NSInteger NodeID to keep track of each node
2 NSMutableDictionary: 1 for the skills and 1 for requirements
BOOL activated to see if current node is activated or not


Relevant Files:
---------------

Just copy all 4 Files into your project in order to use.

How it works:
-------------

Import the "JBList.h" file for usage of the Tree and simply initialize with:
JBList *list = [[JBList alloc] init];

Being that it uses NSMutableDictionary, you can push to the back of the Tree (pushBack:"skill" or pushBack:"skill" withRequirements:"requirement") or push to the front of the Tree (pushFront:"skill" or pushFront:"skill" withRequirements:"requirement")

Class allows for easily removal of Nodes by using either popFront, popBack, or even popNode:"nodeID"

Other methods such as:
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
- (void)allNodes; // Used to print out all Nodes in the Tree
