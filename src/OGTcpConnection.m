/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTcpConnection.h"

@implementation OGTcpConnection

+ (void)load
{
	GType gtypeToAssociate = G_TYPE_TCP_CONNECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GTcpConnection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTcpConnection, GTcpConnection);
}

- (bool)gracefulDisconnect
{
	bool returnValue = (bool)g_tcp_connection_get_graceful_disconnect([self castedGObject]);

	return returnValue;
}

- (void)setGracefulDisconnect:(bool)gracefulDisconnect
{
	g_tcp_connection_set_graceful_disconnect([self castedGObject], gracefulDisconnect);
}


@end