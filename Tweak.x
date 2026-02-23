#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

%hook NSBundle
- (NSDictionary *)infoDictionary {
    NSMutableDictionary *fakeDict = [%orig mutableCopy];
    [fakeDict setObject:@"9.26.2" forKey:@"CFBundleShortVersionString"];
    [fakeDict setObject:@"9.26.2" forKey:@"CFBundleVersion"];
    return fakeDict;
}
- (id)objectForInfoDictionaryKey:(NSString *)key {
    if ([key isEqualToString:@"CFBundleShortVersionString"] || [key isEqualToString:@"CFBundleVersion"]) {
        return @"9.26.2";
    }
    return %orig;
}
%end

%hook NSMutableURLRequest
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    if ([field.lowercaseString isEqualToString:@"user-agent"] || [field.lowercaseString isEqualToString:@"app-version"]) {
        if ([value containsString:@"8.26.2"]) {
            NSString *spoofedValue = [value stringByReplacingOccurrencesOfString:@"8.26.2" withString:@"9.26.2"];
            %orig(spoofedValue, field);
            return;
        }
    }
    %orig; 
}
%end

