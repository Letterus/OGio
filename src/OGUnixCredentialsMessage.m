/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGUnixCredentialsMessage.h"

#import "OGCredentials.h"

@implementation OGUnixCredentialsMessage

+ (void)load
{
	GType gtypeToAssociate = G_TYPE_UNIX_CREDENTIALS_MESSAGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (bool)isSupported
{
	bool returnValue = (bool)g_unix_credentials_message_is_supported();

	return returnValue;
}

+ (instancetype)unixCredentialsMessage
{
	GUnixCredentialsMessage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(g_unix_credentials_message_new(), GUnixCredentialsMessage, GUnixCredentialsMessage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGUnixCredentialsMessage* wrapperObject;
	@try {
		wrapperObject = [[OGUnixCredentialsMessage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)unixCredentialsMessageWithCredentials:(OGCredentials*)credentials
{
	GUnixCredentialsMessage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(g_unix_credentials_message_new_with_credentials([credentials castedGObject]), GUnixCredentialsMessage, GUnixCredentialsMessage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGUnixCredentialsMessage* wrapperObject;
	@try {
		wrapperObject = [[OGUnixCredentialsMessage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GUnixCredentialsMessage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GUnixCredentialsMessage, GUnixCredentialsMessage);
}

- (OGCredentials*)credentials
{
	GCredentials* gobjectValue = g_unix_credentials_message_get_credentials([self castedGObject]);

	OGCredentials* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end