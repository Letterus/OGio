/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGFileInfo.h"

@implementation OGFileInfo

+ (void)load
{
	GType gtypeToAssociate = G_TYPE_FILE_INFO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)fileInfo
{
	GFileInfo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(g_file_info_new(), GFileInfo, GFileInfo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGFileInfo* wrapperObject;
	@try {
		wrapperObject = [[OGFileInfo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GFileInfo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GFileInfo, GFileInfo);
}

- (void)clearStatus
{
	g_file_info_clear_status([self castedGObject]);
}

- (void)copyIntoWithDestInfo:(OGFileInfo*)destInfo
{
	g_file_info_copy_into([self castedGObject], [destInfo castedGObject]);
}

- (OGFileInfo*)dup
{
	GFileInfo* gobjectValue = g_file_info_dup([self castedGObject]);

	OGFileInfo* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GDateTime*)accessDateTime
{
	GDateTime* returnValue = (GDateTime*)g_file_info_get_access_date_time([self castedGObject]);

	return returnValue;
}

- (OFString*)attributeAsStringWithAttribute:(OFString*)attribute
{
	char* gobjectValue = g_file_info_get_attribute_as_string([self castedGObject], [attribute UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)attributeBooleanWithAttribute:(OFString*)attribute
{
	bool returnValue = (bool)g_file_info_get_attribute_boolean([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (OFString*)attributeByteStringWithAttribute:(OFString*)attribute
{
	const char* gobjectValue = g_file_info_get_attribute_byte_string([self castedGObject], [attribute UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)attributeDataWithAttribute:(OFString*)attribute type:(GFileAttributeType*)type valuePp:(gpointer*)valuePp status:(GFileAttributeStatus*)status
{
	bool returnValue = (bool)g_file_info_get_attribute_data([self castedGObject], [attribute UTF8String], type, valuePp, status);

	return returnValue;
}

- (OFString*)attributeFilePathWithAttribute:(OFString*)attribute
{
	const char* gobjectValue = g_file_info_get_attribute_file_path([self castedGObject], [attribute UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (gint32)attributeInt32WithAttribute:(OFString*)attribute
{
	gint32 returnValue = (gint32)g_file_info_get_attribute_int32([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (gint64)attributeInt64WithAttribute:(OFString*)attribute
{
	gint64 returnValue = (gint64)g_file_info_get_attribute_int64([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (OGObject*)attributeObjectWithAttribute:(OFString*)attribute
{
	GObject* gobjectValue = g_file_info_get_attribute_object([self castedGObject], [attribute UTF8String]);

	OGObject* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GFileAttributeStatus)attributeStatusWithAttribute:(OFString*)attribute
{
	GFileAttributeStatus returnValue = (GFileAttributeStatus)g_file_info_get_attribute_status([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (OFString*)attributeStringWithAttribute:(OFString*)attribute
{
	const char* gobjectValue = g_file_info_get_attribute_string([self castedGObject], [attribute UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (char**)attributeStringvWithAttribute:(OFString*)attribute
{
	char** returnValue = (char**)g_file_info_get_attribute_stringv([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (GFileAttributeType)attributeTypeWithAttribute:(OFString*)attribute
{
	GFileAttributeType returnValue = (GFileAttributeType)g_file_info_get_attribute_type([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (guint32)attributeUint32WithAttribute:(OFString*)attribute
{
	guint32 returnValue = (guint32)g_file_info_get_attribute_uint32([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (guint64)attributeUint64WithAttribute:(OFString*)attribute
{
	guint64 returnValue = (guint64)g_file_info_get_attribute_uint64([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (OFString*)contentType
{
	const char* gobjectValue = g_file_info_get_content_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GDateTime*)creationDateTime
{
	GDateTime* returnValue = (GDateTime*)g_file_info_get_creation_date_time([self castedGObject]);

	return returnValue;
}

- (GDateTime*)deletionDate
{
	GDateTime* returnValue = (GDateTime*)g_file_info_get_deletion_date([self castedGObject]);

	return returnValue;
}

- (OFString*)displayName
{
	const char* gobjectValue = g_file_info_get_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)editName
{
	const char* gobjectValue = g_file_info_get_edit_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)etag
{
	const char* gobjectValue = g_file_info_get_etag([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GFileType)fileType
{
	GFileType returnValue = (GFileType)g_file_info_get_file_type([self castedGObject]);

	return returnValue;
}

- (GIcon*)icon
{
	GIcon* returnValue = (GIcon*)g_file_info_get_icon([self castedGObject]);

	return returnValue;
}

- (bool)isBackup
{
	bool returnValue = (bool)g_file_info_get_is_backup([self castedGObject]);

	return returnValue;
}

- (bool)isHidden
{
	bool returnValue = (bool)g_file_info_get_is_hidden([self castedGObject]);

	return returnValue;
}

- (bool)isSymlink
{
	bool returnValue = (bool)g_file_info_get_is_symlink([self castedGObject]);

	return returnValue;
}

- (GDateTime*)modificationDateTime
{
	GDateTime* returnValue = (GDateTime*)g_file_info_get_modification_date_time([self castedGObject]);

	return returnValue;
}

- (void)modificationTimeWithResult:(GTimeVal*)result
{
	g_file_info_get_modification_time([self castedGObject], result);
}

- (OFString*)name
{
	const char* gobjectValue = g_file_info_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (goffset)size
{
	goffset returnValue = (goffset)g_file_info_get_size([self castedGObject]);

	return returnValue;
}

- (gint32)sortOrder
{
	gint32 returnValue = (gint32)g_file_info_get_sort_order([self castedGObject]);

	return returnValue;
}

- (GIcon*)symbolicIcon
{
	GIcon* returnValue = (GIcon*)g_file_info_get_symbolic_icon([self castedGObject]);

	return returnValue;
}

- (OFString*)symlinkTarget
{
	const char* gobjectValue = g_file_info_get_symlink_target([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)hasAttribute:(OFString*)attribute
{
	bool returnValue = (bool)g_file_info_has_attribute([self castedGObject], [attribute UTF8String]);

	return returnValue;
}

- (bool)hasNamespace:(OFString*)nameSpace
{
	bool returnValue = (bool)g_file_info_has_namespace([self castedGObject], [nameSpace UTF8String]);

	return returnValue;
}

- (char**)listAttributesWithNameSpace:(OFString*)nameSpace
{
	char** returnValue = (char**)g_file_info_list_attributes([self castedGObject], [nameSpace UTF8String]);

	return returnValue;
}

- (void)removeAttribute:(OFString*)attribute
{
	g_file_info_remove_attribute([self castedGObject], [attribute UTF8String]);
}

- (void)setAccessDateTimeWithAtime:(GDateTime*)atime
{
	g_file_info_set_access_date_time([self castedGObject], atime);
}

- (void)setAttribute:(OFString*)attribute type:(GFileAttributeType)type valueP:(gpointer)valueP
{
	g_file_info_set_attribute([self castedGObject], [attribute UTF8String], type, valueP);
}

- (void)setAttributeBoolean:(OFString*)attribute attrValue:(bool)attrValue
{
	g_file_info_set_attribute_boolean([self castedGObject], [attribute UTF8String], attrValue);
}

- (void)setAttributeByteString:(OFString*)attribute attrValue:(OFString*)attrValue
{
	g_file_info_set_attribute_byte_string([self castedGObject], [attribute UTF8String], [attrValue UTF8String]);
}

- (void)setAttributeFilePath:(OFString*)attribute attrValue:(OFString*)attrValue
{
	g_file_info_set_attribute_file_path([self castedGObject], [attribute UTF8String], [attrValue UTF8String]);
}

- (void)setAttributeInt32:(OFString*)attribute attrValue:(gint32)attrValue
{
	g_file_info_set_attribute_int32([self castedGObject], [attribute UTF8String], attrValue);
}

- (void)setAttributeInt64:(OFString*)attribute attrValue:(gint64)attrValue
{
	g_file_info_set_attribute_int64([self castedGObject], [attribute UTF8String], attrValue);
}

- (void)setAttributeMask:(GFileAttributeMatcher*)mask
{
	g_file_info_set_attribute_mask([self castedGObject], mask);
}

- (void)setAttributeObject:(OFString*)attribute attrValue:(OGObject*)attrValue
{
	g_file_info_set_attribute_object([self castedGObject], [attribute UTF8String], [attrValue gObject]);
}

- (bool)setAttributeStatus:(OFString*)attribute status:(GFileAttributeStatus)status
{
	bool returnValue = (bool)g_file_info_set_attribute_status([self castedGObject], [attribute UTF8String], status);

	return returnValue;
}

- (void)setAttributeString:(OFString*)attribute attrValue:(OFString*)attrValue
{
	g_file_info_set_attribute_string([self castedGObject], [attribute UTF8String], [attrValue UTF8String]);
}

- (void)setAttributeStringv:(OFString*)attribute attrValue:(char**)attrValue
{
	g_file_info_set_attribute_stringv([self castedGObject], [attribute UTF8String], attrValue);
}

- (void)setAttributeUint32:(OFString*)attribute attrValue:(guint32)attrValue
{
	g_file_info_set_attribute_uint32([self castedGObject], [attribute UTF8String], attrValue);
}

- (void)setAttributeUint64:(OFString*)attribute attrValue:(guint64)attrValue
{
	g_file_info_set_attribute_uint64([self castedGObject], [attribute UTF8String], attrValue);
}

- (void)setContentType:(OFString*)contentType
{
	g_file_info_set_content_type([self castedGObject], [contentType UTF8String]);
}

- (void)setCreationDateTimeWithCreationTime:(GDateTime*)creationTime
{
	g_file_info_set_creation_date_time([self castedGObject], creationTime);
}

- (void)setDisplayName:(OFString*)displayName
{
	g_file_info_set_display_name([self castedGObject], [displayName UTF8String]);
}

- (void)setEditName:(OFString*)editName
{
	g_file_info_set_edit_name([self castedGObject], [editName UTF8String]);
}

- (void)setFileType:(GFileType)type
{
	g_file_info_set_file_type([self castedGObject], type);
}

- (void)setIcon:(GIcon*)icon
{
	g_file_info_set_icon([self castedGObject], icon);
}

- (void)setIsHidden:(bool)isHidden
{
	g_file_info_set_is_hidden([self castedGObject], isHidden);
}

- (void)setIsSymlink:(bool)isSymlink
{
	g_file_info_set_is_symlink([self castedGObject], isSymlink);
}

- (void)setModificationDateTimeWithMtime:(GDateTime*)mtime
{
	g_file_info_set_modification_date_time([self castedGObject], mtime);
}

- (void)setModificationTimeWithMtime:(GTimeVal*)mtime
{
	g_file_info_set_modification_time([self castedGObject], mtime);
}

- (void)setName:(OFString*)name
{
	g_file_info_set_name([self castedGObject], [name UTF8String]);
}

- (void)setSize:(goffset)size
{
	g_file_info_set_size([self castedGObject], size);
}

- (void)setSortOrder:(gint32)sortOrder
{
	g_file_info_set_sort_order([self castedGObject], sortOrder);
}

- (void)setSymbolicIcon:(GIcon*)icon
{
	g_file_info_set_symbolic_icon([self castedGObject], icon);
}

- (void)setSymlinkTarget:(OFString*)symlinkTarget
{
	g_file_info_set_symlink_target([self castedGObject], [symlinkTarget UTF8String]);
}

- (void)unsetAttributeMask
{
	g_file_info_unset_attribute_mask([self castedGObject]);
}


@end