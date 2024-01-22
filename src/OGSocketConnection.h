/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGIOStream.h"

@class OGSocket;
@class OGCancellable;
@class OGSocketAddress;

/**
 * #GSocketConnection is a #GIOStream for a connected socket. They
 * can be created either by #GSocketClient when connecting to a host,
 * or by #GSocketListener when accepting a new client.
 * 
 * The type of the #GSocketConnection object returned from these calls
 * depends on the type of the underlying socket that is in use. For
 * instance, for a TCP/IP connection it will be a #GTcpConnection.
 * 
 * Choosing what type of object to construct is done with the socket
 * connection factory, and it is possible for 3rd parties to register
 * custom socket connection types for specific combination of socket
 * family/type/protocol using g_socket_connection_factory_register_type().
 * 
 * To close a #GSocketConnection, use g_io_stream_close(). Closing both
 * substreams of the #GIOStream separately will not close the underlying
 * #GSocket.
 *
 */
@interface OGSocketConnection : OGIOStream
{

}

/**
 * Functions
 */

/**
 * Looks up the #GType to be used when creating socket connections on
 * sockets with the specified @family, @type and @protocol_id.
 * 
 * If no type is registered, the #GSocketConnection base type is returned.
 *
 * @param family a #GSocketFamily
 * @param type a #GSocketType
 * @param protocolId a protocol id
 * @return a #GType
 */
+ (GType)factoryLookupTypeWithFamily:(GSocketFamily)family type:(GSocketType)type protocolId:(gint)protocolId;

/**
 * Looks up the #GType to be used when creating socket connections on
 * sockets with the specified @family, @type and @protocol.
 * 
 * If no type is registered, the #GSocketConnection base type is returned.
 *
 * @param gtype a #GType, inheriting from %G_TYPE_SOCKET_CONNECTION
 * @param family a #GSocketFamily
 * @param type a #GSocketType
 * @param protocol a protocol id
 */
+ (void)factoryRegisterTypeWithGtype:(GType)gtype family:(GSocketFamily)family type:(GSocketType)type protocol:(gint)protocol;

/**
 * Methods
 */

- (GSocketConnection*)castedGObject;

/**
 * Connect @connection to the specified remote address.
 *
 * @param address a #GSocketAddress specifying the remote address.
 * @param cancellable a %GCancellable or %NULL
 * @return %TRUE if the connection succeeded, %FALSE on error
 */
- (bool)connectWithAddress:(OGSocketAddress*)address cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously connect @connection to the specified remote address.
 * 
 * This clears the #GSocket:blocking flag on @connection's underlying
 * socket if it is currently set.
 * 
 * Use g_socket_connection_connect_finish() to retrieve the result.
 *
 * @param address a #GSocketAddress specifying the remote address.
 * @param cancellable a %GCancellable or %NULL
 * @param callback a #GAsyncReadyCallback
 * @param userData user data for the callback
 */
- (void)connectAsyncWithAddress:(OGSocketAddress*)address cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Gets the result of a g_socket_connection_connect_async() call.
 *
 * @param result the #GAsyncResult
 * @return %TRUE if the connection succeeded, %FALSE on error
 */
- (bool)connectFinish:(GAsyncResult*)result;

/**
 * Try to get the local address of a socket connection.
 *
 * @return a #GSocketAddress or %NULL on error.
 *     Free the returned object with g_object_unref().
 */
- (OGSocketAddress*)localAddress;

/**
 * Try to get the remote address of a socket connection.
 * 
 * Since GLib 2.40, when used with g_socket_client_connect() or
 * g_socket_client_connect_async(), during emission of
 * %G_SOCKET_CLIENT_CONNECTING, this function will return the remote
 * address that will be used for the connection.  This allows
 * applications to print e.g. "Connecting to example.com
 * (10.42.77.3)...".
 *
 * @return a #GSocketAddress or %NULL on error.
 *     Free the returned object with g_object_unref().
 */
- (OGSocketAddress*)remoteAddress;

/**
 * Gets the underlying #GSocket object of the connection.
 * This can be useful if you want to do something unusual on it
 * not supported by the #GSocketConnection APIs.
 *
 * @return a #GSocket or %NULL on error.
 */
- (OGSocket*)socket;

/**
 * Checks if @connection is connected. This is equivalent to calling
 * g_socket_is_connected() on @connection's underlying #GSocket.
 *
 * @return whether @connection is connected
 */
- (bool)isConnected;

@end