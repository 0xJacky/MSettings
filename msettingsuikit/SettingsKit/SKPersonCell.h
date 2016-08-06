#import <Preferences/Preferences.h>
#import "common.h"

@interface SKPersonCell : PSTableCell {
    UIImageView *_background;
    UILabel *label;
    UILabel *label2;
    UIButton *twitterButton;
    UIButton *sinaButton;
}

-(NSString*)personDescription;
-(NSString*)imageName;
-(NSString*)name;
-(NSString*)twitterHandle;
-(NSString*)sinaHandle;

-(void)updateImage;
-(NSString*)localizedString:(NSString*)string;
@end
