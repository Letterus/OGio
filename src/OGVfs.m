/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGVfs.h"

@implementation OGVfs

+ (void)load
{
	GType gtypeToAssociate = G_TYPE_VFS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGVfs*)default
{
	GVfs* gobjectValue = g_vfs_get_default();

	OGVfs* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (OGVfs*)local
{
	GVfs* gobjectValue = g_vfs_get_local();

	OGVfs* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GVfs*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GVfs, GVfs);
}

- (GFile*)fileForPath:(OFString*)path
{
	GFile* returnValue = (GFile*)g_vfs_get_file_for_path([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (GFile*)fileForUri:(OFString*)uri
{
	GFile* returnValue = (GFile*)g_vfs_get_file_for_uri([self castedGObject], [uri UTF8String]);

	return returnValue;
}

- (const gchar* const*)supportedUriSchemes
{
	const gchar* const* returnValue = (const gchar* const*)g_vfs_get_supported_uri_schemes([self castedGObject]);

	return returnValue;
}

- (bool)isActive
{
	bool returnValue = (bool)g_vfs_is_active([self castedGObject]);

	return returnValue;
}

- (GFile*)parseName:(OFString*)parseName
{
	GFile* returnValue = (GFile*)g_vfs_parse_name([self castedGObject], [parseName UTF8String]);

	return returnValue;
}

- (bool)registerUriScheme:(OFString*)scheme uriFunc:(GVfsFileLookupFunc)uriFunc uriData:(gpointer)uriData uriDestroy:(GDestroyNotify)uriDestroy parseNameFunc:(GVfsFileLookupFunc)parseNameFunc parseNameData:(gpointer)parseNameData parseNameDestroy:(GDestroyNotify)parseNameDestroy
{
	bool returnValue = (bool)g_vfs_register_uri_scheme([self castedGObject], [scheme UTF8String], uriFunc, uriData, uriDestroy, parseNameFunc, parseNameData, parseNameDestroy);

	return returnValue;
}

- (bool)unregisterUriScheme:(OFString*)scheme
{
	bool returnValue = (bool)g_vfs_unregister_uri_scheme([self castedGObject], [scheme UTF8String]);

	return returnValue;
}


@end