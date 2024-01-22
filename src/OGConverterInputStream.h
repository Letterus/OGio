/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGFilterInputStream.h"

@class OGInputStream;

/**
 * Converter input stream implements #GInputStream and allows
 * conversion of data of various types during reading.
 * 
 * As of GLib 2.34, #GConverterInputStream implements
 * #GPollableInputStream.
 *
 */
@interface OGConverterInputStream : OGFilterInputStream
{

}


/**
 * Constructors
 */
- (instancetype)initWithBaseStream:(OGInputStream*)baseStream converter:(GConverter*)converter;

/**
 * Methods
 */

- (GConverterInputStream*)castedGObject;

/**
 * Gets the #GConverter that is used by @converter_stream.
 *
 * @return the converter of the converter input stream
 */
- (GConverter*)converter;

@end