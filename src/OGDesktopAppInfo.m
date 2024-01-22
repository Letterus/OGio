/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGDesktopAppInfo.h"

#import "OGAppLaunchContext.h"

@implementation OGDesktopAppInfo

+ (GList*)implementations:(OFString*)interface
{
	GList* returnValue = g_desktop_app_info_get_implementations([interface UTF8String]);

	return returnValue;
}

+ (gchar***)search:(OFString*)searchString
{
	gchar*** returnValue = g_desktop_app_info_search([searchString UTF8String]);

	return returnValue;
}

+ (void)setDesktopEnv:(OFString*)desktopEnv
{
	g_desktop_app_info_set_desktop_env([desktopEnv UTF8String]);
}

- (instancetype)init:(OFString*)desktopId
{
	GDesktopAppInfo* gobjectValue = G_DESKTOP_APP_INFO(g_desktop_app_info_new([desktopId UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initFromFilename:(OFString*)filename
{
	GDesktopAppInfo* gobjectValue = G_DESKTOP_APP_INFO(g_desktop_app_info_new_from_filename([filename UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initFromKeyfile:(GKeyFile*)keyFile
{
	GDesktopAppInfo* gobjectValue = G_DESKTOP_APP_INFO(g_desktop_app_info_new_from_keyfile(keyFile));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GDesktopAppInfo*)castedGObject
{
	return G_DESKTOP_APP_INFO([self gObject]);
}

- (OFString*)actionName:(OFString*)actionName
{
	gchar* gobjectValue = g_desktop_app_info_get_action_name([self castedGObject], [actionName UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)boolean:(OFString*)key
{
	bool returnValue = g_desktop_app_info_get_boolean([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (OFString*)categories
{
	const char* gobjectValue = g_desktop_app_info_get_categories([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)filename
{
	const char* gobjectValue = g_desktop_app_info_get_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)genericName
{
	const char* gobjectValue = g_desktop_app_info_get_generic_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isHidden
{
	bool returnValue = g_desktop_app_info_get_is_hidden([self castedGObject]);

	return returnValue;
}

- (const char* const*)keywords
{
	const char* const* returnValue = g_desktop_app_info_get_keywords([self castedGObject]);

	return returnValue;
}

- (char*)localeString:(OFString*)key
{
	char* gobjectValue = g_desktop_app_info_get_locale_string([self castedGObject], [key UTF8String]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (bool)nodisplay
{
	bool returnValue = g_desktop_app_info_get_nodisplay([self castedGObject]);

	return returnValue;
}

- (bool)showIn:(OFString*)desktopEnv
{
	bool returnValue = g_desktop_app_info_get_show_in([self castedGObject], [desktopEnv UTF8String]);

	return returnValue;
}

- (OFString*)startupWmClass
{
	const char* gobjectValue = g_desktop_app_info_get_startup_wm_class([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (char*)string:(OFString*)key
{
	char* gobjectValue = g_desktop_app_info_get_string([self castedGObject], [key UTF8String]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (gchar**)stringListWithKey:(OFString*)key length:(gsize*)length
{
	gchar** returnValue = g_desktop_app_info_get_string_list([self castedGObject], [key UTF8String], length);

	return returnValue;
}

- (bool)hasKey:(OFString*)key
{
	bool returnValue = g_desktop_app_info_has_key([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (void)launchActionWithActionName:(OFString*)actionName launchContext:(OGAppLaunchContext*)launchContext
{
	g_desktop_app_info_launch_action([self castedGObject], [actionName UTF8String], [launchContext castedGObject]);
}

- (bool)launchUrisAsManagerWithUris:(GList*)uris launchContext:(OGAppLaunchContext*)launchContext spawnFlags:(GSpawnFlags)spawnFlags userSetup:(GSpawnChildSetupFunc)userSetup userSetupData:(gpointer)userSetupData pidCallback:(GDesktopAppLaunchCallback)pidCallback pidCallbackData:(gpointer)pidCallbackData
{
	GError* err = NULL;

	bool returnValue = g_desktop_app_info_launch_uris_as_manager([self castedGObject], uris, [launchContext castedGObject], spawnFlags, userSetup, userSetupData, pidCallback, pidCallbackData, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)launchUrisAsManagerWithFdsWithUris:(GList*)uris launchContext:(OGAppLaunchContext*)launchContext spawnFlags:(GSpawnFlags)spawnFlags userSetup:(GSpawnChildSetupFunc)userSetup userSetupData:(gpointer)userSetupData pidCallback:(GDesktopAppLaunchCallback)pidCallback pidCallbackData:(gpointer)pidCallbackData stdinFd:(gint)stdinFd stdoutFd:(gint)stdoutFd stderrFd:(gint)stderrFd
{
	GError* err = NULL;

	bool returnValue = g_desktop_app_info_launch_uris_as_manager_with_fds([self castedGObject], uris, [launchContext castedGObject], spawnFlags, userSetup, userSetupData, pidCallback, pidCallbackData, stdinFd, stdoutFd, stderrFd, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (const gchar* const*)listActions
{
	const gchar* const* returnValue = g_desktop_app_info_list_actions([self castedGObject]);

	return returnValue;
}


@end