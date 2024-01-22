/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGNativeVolumeMonitor.h"

@implementation OGNativeVolumeMonitor

- (GNativeVolumeMonitor*)castedGObject
{
	return G_NATIVE_VOLUME_MONITOR([self gObject]);
}


@end