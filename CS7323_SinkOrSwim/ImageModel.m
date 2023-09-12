//
//  ImageModel.m
//  CS7323_SinkOrSwim
//
//  Created by Hans Soland on 9/11/23.
//

#import "ImageModel.h"

@interface ImageModel()
// makes ImageModel class properties private
@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* images;
@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize images = _images;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

// Handle init of all properties when object is created
-(instancetype)init{
    self = [super init];
    if (self){
        if(!_imageNames){
            _imageNames = @[@"exclamationmark.3",@"paperplane",@"tray"];
        }
        
        if(!_images){
            _images = @{_imageNames[0]: [UIImage systemImageNamed:_imageNames[0]],
                        _imageNames[1]: [UIImage systemImageNamed:_imageNames[1]],
                        _imageNames[2]: [UIImage systemImageNamed:_imageNames[2]]
            };
        }
    }
    return self;
}

// Return the UIImage associated with a given NSString in the global images dictionary
-(UIImage*)getImageWithName:(NSString*)name{
    return _images[name];
}

// Return the UIImage associated with a given NSInteger in the global images dictionary
-(UIImage*)getImageWithIndex:(NSInteger)index{
    return _images[_imageNames[index]];
}

// Return the size (number of UIImage entries) of the global images dictionary
-(NSInteger)numberOfImages{
    return [_images count];
}

// Return the NSString associated with a given integer in the array of image assets
-(NSString*)getImageNameIndex:(NSInteger)index{
    return _imageNames[index];
}

@end
