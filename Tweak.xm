#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <substrate.h>

@interface SBFAnimationSettings : NSObject
@end

@interface SBUIProudLockIconView : UIView
@end

static bool disableFACEIDLockGlyph = false;
static bool disableParallax = false;
static bool disablePasscodeRevealAnim = false;
static bool editMenuDelayDisables = false;
static bool disableWallpaperScale = false;
static bool disablePasscodeHighlight = false;
static bool disableIconFlyIn = false;
static float simpleSpeed = 0.0;
static bool appAnimationsToggle = false;
static float sbSpeedSlider = 0.0;
static bool sbSpeedEnabled = false;
static float folderSlider = 0.0;
static bool folderEnabled = false;
static float unlockCoverSheetSlider = 0.0;
static bool unlockCoverSheetEnabled = false;
static float screenWakeSleepSlider = 0.0;
static bool screenWakeSleepEnabled = false;
static float appOpenCloseSlider = 0.0;
static bool appOpenCloseEnabled = false;
static bool kDisableAllAnimations = false;
static bool isSpringBoard = false;
static bool kEnabled = false;
static bool advancedToggle = false;
static float stiffnessSlider = 0.0;
static float dampingSlider = 0.0;
static float massSlider = 0.0;
static float VelocitySlider = 0.0;
static float durationSlider = 0.0;
static bool isExcluded = false;

static void loadPrefs(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {

	NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile: @"/var/jb/var/mobile/Library/Preferences/alias20.speedy.plist"];
	if([prefs objectForKey:@"kEnabled"])	kEnabled = [[prefs objectForKey:@"kEnabled"] boolValue];
	else	kEnabled = false;
	if([prefs objectForKey:@"advancedToggle"])	advancedToggle = [[prefs objectForKey:@"advancedToggle"] boolValue];
	else	advancedToggle = false;
	if([prefs objectForKey:@"kDisableAllAnimations"])	kDisableAllAnimations = [[prefs objectForKey:@"kDisableAllAnimations"] boolValue];
	else	kDisableAllAnimations = false;
	if([prefs objectForKey:@"appOpenCloseEnabled"])	appOpenCloseEnabled = [[prefs objectForKey:@"appOpenCloseEnabled"] boolValue];
	else	appOpenCloseEnabled = false;
	if([prefs objectForKey:@"appOpenCloseSlider"])	appOpenCloseSlider = [[prefs objectForKey:@"appOpenCloseSlider"] floatValue];
	else	appOpenCloseSlider = 1.0 / 3;
	if([prefs objectForKey:@"screenWakeSleepEnabled"])	screenWakeSleepEnabled = [[prefs objectForKey:@"screenWakeSleepEnabled"] boolValue];
	else	screenWakeSleepEnabled = false;
	if([prefs objectForKey:@"screenWakeSleepSlider"])	screenWakeSleepSlider = [[prefs objectForKey:@"screenWakeSleepSlider"] floatValue];
	else	screenWakeSleepSlider = 0.1;
	if([prefs objectForKey:@"unlockCoverSheetEnabled"])	unlockCoverSheetEnabled = [[prefs objectForKey:@"unlockCoverSheetEnabled"] boolValue];
	else	unlockCoverSheetEnabled = false;
	if([prefs objectForKey:@"unlockCoverSheetSlider"])	unlockCoverSheetSlider = [[prefs objectForKey:@"unlockCoverSheetSlider"] floatValue];
	else	unlockCoverSheetSlider = 1000.0;
	if([prefs objectForKey:@"sbSpeedEnabled"])	sbSpeedEnabled = [[prefs objectForKey:@"sbSpeedEnabled"] boolValue];
	else	sbSpeedEnabled = false;
	if([prefs objectForKey:@"sbSpeedSlider"])	sbSpeedSlider = [[prefs objectForKey:@"sbSpeedSlider"] floatValue];
	else	sbSpeedSlider = 1.0;
	if([prefs objectForKey:@"folderEnabled"])	folderEnabled = [[prefs objectForKey:@"folderEnabled"] boolValue];
	else	folderEnabled = false;
	if([prefs objectForKey:@"folderSlider"])	folderSlider = [[prefs objectForKey:@"folderSlider"] floatValue];
	else	folderSlider = 1.0;
	if([prefs objectForKey:@"appAnimationsToggle"])	appAnimationsToggle = [[prefs objectForKey:@"appAnimationsToggle"] boolValue];
	else	appAnimationsToggle = false;
	if([prefs objectForKey:@"durationSlider"])	durationSlider = [[prefs objectForKey:@"durationSlider"] floatValue];
	else	durationSlider = 1.0;
	if([prefs objectForKey:@"VelocitySlider"])	VelocitySlider = [[prefs objectForKey:@"VelocitySlider"] floatValue];
	else	VelocitySlider = 20.0;
	if([prefs objectForKey:@"stiffnessSlider"])	stiffnessSlider = [[prefs objectForKey:@"stiffnessSlider"] floatValue];
	else	stiffnessSlider = 300.0;
	if([prefs objectForKey:@"massSlider"])	massSlider = [[prefs objectForKey:@"massSlider"] floatValue];
	else	massSlider = 1.0;
	if([prefs objectForKey:@"dampingSlider"])	dampingSlider = [[prefs objectForKey:@"dampingSlider"] floatValue];
	else	dampingSlider = 29.0;
	if([prefs objectForKey:@"simpleSpeed"])	simpleSpeed = [[prefs objectForKey:@"simpleSpeed"] floatValue];
	else	simpleSpeed = 1.0;
	if([prefs objectForKey:@"disableIconFlyIn"])	disableIconFlyIn = [[prefs objectForKey:@"disableIconFlyIn"] boolValue];
	else	disableIconFlyIn = false;
	if([prefs objectForKey:@"disablePasscodeHighlight"])	disablePasscodeHighlight = [[prefs objectForKey:@"disablePasscodeHighlight"] boolValue];
	else	disablePasscodeHighlight = false;
	if([prefs objectForKey:@"disableWallpaperScale"])	disableWallpaperScale = [[prefs objectForKey:@"disableWallpaperScale"] boolValue];
	else	disableWallpaperScale = false;
	if([prefs objectForKey:@"editMenuDelayDisables"])	editMenuDelayDisables = [[prefs objectForKey:@"editMenuDelayDisables"] boolValue];
	else	editMenuDelayDisables = false;
	if([prefs objectForKey:@"disablePasscodeRevealAnim"])	disablePasscodeRevealAnim = [[prefs objectForKey:@"disablePasscodeRevealAnim"] boolValue];
	else	disablePasscodeRevealAnim = false;
	if([prefs objectForKey:@"disableParallax"])	disableParallax = [[prefs objectForKey:@"disableParallax"] boolValue];
	else	disableParallax = false;
	if([prefs objectForKey:@"disableFACEIDLockGlyph"])	disableFACEIDLockGlyph = [[prefs objectForKey:@"disableFACEIDLockGlyph"] boolValue];
	else	disableFACEIDLockGlyph = false;
	isExcluded = [prefs[@"excludedApps"][[[NSBundle mainBundle] bundleIdentifier]] isEqual:@1];
}

%group AppAnimationAdvancedHooks
%hook CASpringAnimation
-(void)setStiffness:(double)arg1 {
	if(kEnabled && (isExcluded || isSpringBoard)) {
		return %orig(arg1);
	}
	return %orig(arg1 * stiffnessSlider);
}

-(void)setDamping:(double)arg1 {
	if(kEnabled && (isExcluded || isSpringBoard)) {
		return %orig(arg1);
	}
	return %orig(arg1 *dampingSlider);
}

-(void)setMass:(double)arg1 {
	if(kEnabled && (isExcluded || isSpringBoard)) {
		return %orig(arg1);
	}
	return %orig(arg1 * massSlider);
}

-(void)setVelocity:(double)arg1 {
	if(kEnabled && (isExcluded || isSpringBoard)) {
		return %orig(arg1);
	}
	return %orig(arg1 * VelocitySlider);
}
%end

%hook CAAnimation
-(void)setDuration:(double)arg1 {
	if(kEnabled && (isExcluded || isSpringBoard)) {
		return %orig(arg1);
	}
	return %orig(arg1 * durationSlider);
}
%end
%end

%group AppAnimationHooks
%hook CASpringAnimation
-(void)setDuration:(double)arg1 {
	if(isExcluded) {
		%orig;
		return;
	}
	if(simpleSpeed == 0.0) {
		simpleSpeed = 1.93475f;
	}
	%orig(arg1 * simpleSpeed);
}
%end
%end

%group SpeedyHooks 
%hook SBFAnimationSettings
-(void)setMass:(double)arg1 {
	if(kEnabled && folderEnabled) {
		arg1 = 0.0;
	}
	%orig(arg1);
}

-(void)setDamping:(double)arg1 {
	if(kEnabled && folderEnabled) {
		arg1 = arg1 * folderSlider;
	}
	%orig(arg1);
}

-(void)setStiffness:(double)arg1 {
	if(kEnabled && folderEnabled) {
		arg1 = arg1 * folderSlider;
	}
	%orig(arg1);
}

-(void)setSpeed:(double)arg1 {
	if(kEnabled && folderEnabled) {
		arg1 = arg1 * folderSlider;
	}
	%orig(arg1);
}
%end

%hook UIViewInProcessAnimationState
-(id)actionForLayer:(id)arg1 forKey:(id)arg2 forView:(id)arg3 {
	if(!isSpringBoard) {
		return %orig(arg1, arg2, arg3);
	}
	if(kEnabled && kDisableAllAnimations) {
		return %orig(arg1, arg2, nil);
	}
	return %orig(arg1, arg2, arg3);
}
%end

%hook SBFolderIconZoomAnimator
-(void)_performAnimationToFraction:(double)arg1 withCentralAnimationSettings:(id)arg2 delay:(double)arg3 alreadyAnimating:(BOOL)arg4 sharedCompletion:(/*^block*/id)arg5 {
	if(!isSpringBoard) {
		%orig(arg1, arg2, arg3, arg4, arg5);
		return;
	}
	if(kEnabled && kDisableAllAnimations) {
		%orig(arg1, arg2, arg3, true, arg5);
		return;
	}
	%orig(arg1, arg2, arg3, arg4, arg5);
}

-(unsigned long long)_numberOfSignificantAnimations {
	if(!isSpringBoard) {
		return %orig;
	}
	if(kEnabled && kDisableAllAnimations) {
		return 0;
	}
	return %orig;
}
%end

%hook _SBInnerFolderIconZoomAnimator
-(unsigned long long)_numberOfSignificantAnimations {
	if(!isSpringBoard) {
		return %orig;
	}
	if(kEnabled && kDisableAllAnimations) {
		return 0;
	}
	return %orig;
}
%end

%hook SBLockScreenManager
-(BOOL)_setPasscodeVisible:(BOOL)arg1 animated:(BOOL)arg2 {
	if(kEnabled && disablePasscodeRevealAnim) {
		return %orig(arg1, false);
	}
	return %orig(arg1, arg2);
}
%end

%hook SBHFolderZoomSettings
-(void)setInnerFolderFadeSettings:(SBFAnimationSettings *)arg1 {
	if(kEnabled && folderEnabled) {
		%orig(nil);
		return;
	}
	%orig(arg1);
}

-(void)setOuterFolderFadeSettings:(SBFAnimationSettings *)arg1 {
	if(kEnabled && folderEnabled) {
		%orig(nil);
		return;
	}
	%orig(arg1);
}
%end

%hook BSMutableSpringAnimationSettings
-(void)setSpeed:(float)arg1 {
	if(kEnabled && folderEnabled) {
		arg1 = arg1 * folderSlider;
	}
	%orig(arg1);
}
%end

%hook SBFFluidBehaviorSettings
-(void)setResponse:(double)arg1 {
	if(kEnabled && appOpenCloseEnabled) {
		if(appOpenCloseSlider == 0.0) {
			%orig(0.0001);
			return;
		}
		%orig(appOpenCloseSlider);
		return;
	}
	%orig(arg1);
	return;
}
%end

%hook CSCoverSheetTransitionsSettings
-(void)setTension:(double)arg1 {
	if(kEnabled && unlockCoverSheetEnabled) {
		arg1 = unlockCoverSheetSlider;
	}
	%orig(arg1);
}
%end

%hook SBFWakeAnimationSettings
-(double)backlightFadeDuration {
	if(kEnabled && screenWakeSleepEnabled) {
		if(screenWakeSleepSlider == 0.0) {
			return 0.000001;
		}
		return screenWakeSleepSlider;
	}
	return %orig;
}
%end

//Maybe mistake?
%hook SBScreenWakeAnimationController
+(double)backlightFadeDurationForSource:(long long)arg1 isWake:(BOOL)arg2 {
	if(kEnabled && screenWakeSleepEnabled) {
		if(screenWakeSleepSlider == 0.0) {
			return 0.000001;
		}
		return screenWakeSleepSlider;
	}
	return %orig;
}
%end

%hook SBUIProudLockIconView
-(void)didMoveToWindow {
	%orig;
	if(kEnabled && disableFACEIDLockGlyph) {
		[self setHidden:true];
	}
}
%end

%hook _UIMotionEffectEngine
+(BOOL)_motionEffectsEnabled {
	if(kEnabled && disableParallax) {
		return false;
	}
	return %orig;
}

+(BOOL)_motionEffectsSupported {
	if(kEnabled && disableParallax) {
		return false;
	}
	return %orig;
}
%end

%hook UITextSelectionView
-(void)showCalloutBarAfterDelay:(double)arg1 {
	if(kEnabled && editMenuDelayDisables) {
		arg1 = 0.0;
	}
	%orig(arg1);
}
%end

%hook TPNumberPadButton
-(void)setHighlighted:(BOOL)arg1 {
	if(kEnabled && disablePasscodeHighlight) {
		arg1 = false;
	}
	%orig(arg1);
}
%end

//Unknown Class
%hook CVLockPasscodeButton
-(void)setHighlighted:(BOOL)arg1 {
	if(kEnabled && disablePasscodeHighlight) {
		arg1 = false;
	}
	%orig(arg1);
}
%end

//Deprecated Class
%hook SBCoverSheetTransitionSettings
-(void)setIconsFlyIn:(BOOL)arg1 {
	if(kEnabled && disableIconFlyIn) {
		arg1 = false;
	}
	%orig(arg1);
}
%end

%hook CSCoverSheetTransitionSettings
-(void)setIconsFlyIn:(BOOL)arg1 {
	if(kEnabled && disableIconFlyIn) {
		arg1 = false;
	}
	%orig(arg1);
}
%end

%hook SBFluidSwitcherAnimationSettings
-(void)setWallpaperScaleInSwitcher:(double)arg1 {
	if(kEnabled && disableWallpaperScale) {
		arg1 = 1.0;
	}
	%orig(arg1);
}

-(void)setWallpaperScaleInApplication:(double)arg1 {
	if(kEnabled && disableWallpaperScale) {
		arg1 = 1.0;
	}
	%orig(arg1);
}

-(void)setHomeScreenScaleInSwitcher:(double)arg1 {
	if(kEnabled && disableWallpaperScale) {
		arg1 = 1.0;
	}
	%orig(arg1);
}

-(void)setHomeScreenScaleInApplication:(double)arg1 {
	if(kEnabled && disableWallpaperScale) {
		arg1 = 1.0;
	}
	%orig(arg1);
}
%end

//Deprecated Class
%hook SBAppSwitcherSettings
-(void)setHighlightSquishyScale:(double)arg1 {
	if(kEnabled && disableWallpaperScale) {
		arg1 = 1.0;
	}
	%orig(arg1);
}
%end

%hook UIViewAnimationState
-(BOOL)_allowsUserInteraction {
	if(kEnabled)
		return true;
	return %orig;
}
%end
%end

%ctor {
	@autoreleasepool {
		isSpringBoard = [[[NSBundle mainBundle] bundleIdentifier] isEqual:@"com.apple.springboard"];

		CFNotificationCenterRef center = CFNotificationCenterGetDarwinNotifyCenter();
		CFNotificationCenterAddObserver(center, NULL, loadPrefs, CFSTR("alias20.speedy/preferencesChanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		loadPrefs(0,0,0,0,0);
		if(appAnimationsToggle) {
			if(advancedToggle) {
				%init(AppAnimationAdvancedHooks);
			} else {
				%init(AppAnimationHooks);
			}
		}
		%init(SpeedyHooks);
	}
}