/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGInetSocketAddress.h"

#import "OGInetAddress.h"

@implementation OGInetSocketAddress

+ (void)load
{
	GType gtypeToAssociate = G_TYPE_INET_SOCKET_ADDRESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)inetSocketAddressWithAddress:(OGInetAddress*)address port:(guint16)port
{
	GInetSocketAddress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(g_inet_socket_address_new([address castedGObject], port), GInetSocketAddress, GInetSocketAddress);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGInetSocketAddress* wrapperObject;
	@try {
		wrapperObject = [[OGInetSocketAddress alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)inetSocketAddressFromStringWithAddress:(OFString*)address port:(guint)port
{
	GInetSocketAddress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(g_inet_socket_address_new_from_string([address UTF8String], port), GInetSocketAddress, GInetSocketAddress);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGInetSocketAddress* wrapperObject;
	@try {
		wrapperObject = [[OGInetSocketAddress alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GInetSocketAddress*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GInetSocketAddress, GInetSocketAddress);
}

- (OGInetAddress*)address
{
	GInetAddress* gobjectValue = g_inet_socket_address_get_address([self castedGObject]);

	OGInetAddress* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint32)flowinfo
{
	guint32 returnValue = (guint32)g_inet_socket_address_get_flowinfo([self castedGObject]);

	return returnValue;
}

- (guint16)port
{
	guint16 returnValue = (guint16)g_inet_socket_address_get_port([self castedGObject]);

	return returnValue;
}

- (guint32)scopeId
{
	guint32 returnValue = (guint32)g_inet_socket_address_get_scope_id([self castedGObject]);

	return returnValue;
}


@end