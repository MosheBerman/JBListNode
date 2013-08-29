JBListNode
==========

Description:
------------
JBList is a custom binary tree class with complete access to all nodes in the tree.
I put this class together in hopes of creating a Talent/Skill tree for a game but still not sure how to implement it correctly. 
I'm kinda new to Objective-C programming and this is basically my first "Custom" Class that I worked on. I would appreciate as much feedback as you can offer.

The nodes are initialize with each a pointer to the previous node (`firstNode->previous = nil;`) and a pointer to the next node (`lastNode -> next = nil;`)
Attributes involved:
An NSInteger called NodeID, to keep track of each node.
2 instances of NSMutableDictionary. One for the skills and another for requirements.
A BOOL called activated, to see if current node is activate or not.


Relevant Files:
---------------

Just copy all 4 Files into your project in order to use.

How it works:
-------------

Import the "JBList.h" header for to use the Tree and simply initialize with:
`JBList *list = [[JBList alloc] init];`

Being that it uses NSMutableDictionary, you can push to the back of the Tree (`pushBack:"skill"` or `pushBack:"skill" withRequirements:"requirement"`) or push to the front of the Tree (pushFront:"skill" or pushFront:"skill" withRequirements:"requirement")

The `JBList` class allows for easily removal of Nodes by using either popFront, popBack, or even popNode:"nodeID"

Other methods such as:
``` 
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
