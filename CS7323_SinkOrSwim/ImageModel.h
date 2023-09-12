//
//  ImageModel.h
//  CS7323_SinkOrSwim
//
//  Created by Hans Soland on 9/11/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;

-(UIImage*)getImageWithIndex:(NSInteger)index;

-(NSInteger)numberOfImages;

-(NSString*)getImageNameIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
