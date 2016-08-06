@protocol SKListControllerProtocol

@optional

-(NSString*)plistName;
-(NSArray*)customSpecifiers;
-(NSString*)customTitle;

-(BOOL) showHeartImage;
-(BOOL) shiftHeartImage;
-(NSString*) shareMessage;
-(UIColor*) heartImageColor;

-(BOOL) tintNavigationTitleText;
-(BOOL) tintSwitches;

-(UIColor*) tintColor;
-(UIColor*) navigationTintColor;
-(UIColor*) navigationTitleTintColor;
-(UIColor*) switchTintColor;
-(UIColor*) switchOnTintColor;

-(NSString*) headerImage;
-(NSString*) headerText;
-(NSString*) headerSubText;
-(NSString*) headerByText;
-(UIView*) headerView;
-(UIColor*) headerColor;
@end