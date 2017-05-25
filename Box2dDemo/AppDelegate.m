//
//  AppDelegate.m
//  Box2dDemo
//
//  Created by 宋炬峰 on 2017/5/25.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "cocos2d.h"
#import "GravityScene.h"
//#import "MainMenu.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configureCocos2d];
    
    return YES;
}

- (void)configureCocos2d
{
#if CC_CCBREADER
    // Configure the file utils to work with SpriteBuilder, but use a custom resource path (Resources-shared instead of Published-iOS)
    [CCBReader configureCCFileUtils];
#else
    CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
    
    // Setup file utils for use with SpriteBuilder
    [sharedFileUtils setEnableiPhoneResourcesOniPad:NO];
    
    sharedFileUtils.directoriesDict =
    [[NSMutableDictionary alloc] initWithObjectsAndKeys:
     @"resources-tablet", CCFileUtilsSuffixiPad,
     @"resources-tablethd", CCFileUtilsSuffixiPadHD,
     @"resources-phone", CCFileUtilsSuffixiPhone,
     @"resources-phonehd", CCFileUtilsSuffixiPhoneHD,
     @"resources-phone", CCFileUtilsSuffixiPhone5,
     @"resources-phonehd", CCFileUtilsSuffixiPhone5HD,
     @"resources-phone", CCFileUtilsSuffixMac,
     @"resources-phonehd", CCFileUtilsSuffixMacHD,
     @"", CCFileUtilsSuffixDefault,
     nil];
    
    sharedFileUtils.searchPath =
    [NSArray arrayWithObjects:
     [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Published-iOS"],
     [[NSBundle mainBundle] resourcePath],
     nil];
    
    sharedFileUtils.enableiPhoneResourcesOniPad = YES;
    sharedFileUtils.searchMode = CCFileUtilsSearchModeDirectory;
    [sharedFileUtils buildSearchResolutionsOrder];
    
    [sharedFileUtils loadFilenameLookupDictionaryFromFile:@"fileLookup.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] loadSpriteFrameLookupDictionaryFromFile:@"spriteFrameFileList.plist"];
#endif
    
    //[self configureFileUtilsSearchPathAndRegisterSpriteSheets];
    
    [self setupCocos2dWithOptions:@{
                                    CCSetupDepthFormat: @GL_DEPTH24_STENCIL8,
                                    //			CCSetupScreenMode: CCScreenModeFixed,
                                    //			CCSetupScreenOrientation: CCScreenOrientationPortrait,
                                    CCSetupTabletScale2X: @YES,
                                    CCSetupShowDebugStats: @(getenv("SHOW_DEBUG_STATS") != nil),
                                    }];
    
    [[CCDirector sharedDirector] runWithScene:[GravityScene node]];
}

- (void)configureFileUtilsSearchPathAndRegisterSpriteSheets
{
//    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:PACKAGE_STORAGE_USERDEFAULTS_KEY];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    CCFileUtils* sharedFileUtils = [CCFileUtils sharedFileUtils];
//    
//    sharedFileUtils.searchPath =
//    [NSArray arrayWithObjects:
//     [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Images"],
//     [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Fonts"],
//     [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources-shared"],
//     [[NSBundle mainBundle] resourcePath],
//     nil];
//    
//    // Register spritesheets.
//    [[CCSpriteFrameCache sharedSpriteFrameCache] registerSpriteFramesFile:@"Interface.plist"];
//    [[CCSpriteFrameCache sharedSpriteFrameCache] registerSpriteFramesFile:@"Sprites.plist"];
//    [[CCSpriteFrameCache sharedSpriteFrameCache] registerSpriteFramesFile:@"TilesAtlassed.plist"];
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    MainViewController* viewController = [[MainViewController alloc] init];
//    [self.window setRootViewController:viewController];
//    [self.window makeKeyAndVisible];
//    
//    
//    
//    CCDirector *director = [CCDirectorIOS sharedDirector];
//    CCGLView *glView = [CCGLView viewWithFrame:[self.window bounds]
//                                   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
//                                   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
//                        ];
//    
//    // Enables the multi-touch
//    [glView setMultipleTouchEnabled:YES];
//    
//    // attach the openglView to the director
//    director.view = glView;
//    
//    
//    
//    //
//    // VERY IMPORTANT:
//    // If the rotation is going to be controlled by a UIViewController
//    // then the device orientation should be "Portrait".
//    //
//    // IMPORTANT:
//    // By default, this template only supports Landscape orientations.
//    // Edit the RootViewController.m file to edit the supported orientations.
//    //
//
//    //[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
//
//    
//    [director setAnimationInterval:1.0/60];
//    //[director setDisplayFPS:YES];
//    
//    // make the OpenGLView a child of the view controller
//    [viewController setView:glView];
//    
//    // make the View Controller a child of the main window
//    //[window addSubview: viewController.view];
//    
//    //[window makeKeyAndVisible];
//    
//    // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
//    // It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
//    // You can change anytime.
//    [CCTexture setDefaultAlphaPixelFormat:CCTexturePixelFormat_RGBA8888];
//    
//    
//    GravityScene* myScene = [GravityScene node];
//    [[CCDirectorIOS sharedDirector] runWithScene:myScene];
//    return YES;
//}





@end
