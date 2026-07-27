Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474454028CE
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155388; cv=pass; b=LUu2tX23HSnyfvxFLgHeCeOKdWqcGglpTix3bIPh8Wdar3jJlnaT2rLcXbfJ8L0+NQt2TR8CCXrCuDps21VXYh/6ne+KgDBjHhN9cnkmyhzZLOScVH9VUswAWYPQiq60VIIwhjTQqsY3E+sdHAFOX52yLiOW1pn+SqJyAvp6NJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155388; c=relaxed/simple;
	bh=w/Wn3wM7/9NUKUI7m7jWOux0WrgpMPGVJQCe3qP3PKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVSHXlbaqAM2Ia2b4OOLCWJXWA7bLWzHaKc5qEqabybsKRaw/FfL8gMTEDmZVMskzx1IInvKBZV97Vq05Px6UebUf/9OoyG++kkDZldyjymwh4sy7okk5G9Xa21UjoQFJEIlBYd+d+StSptfUShesuG/bX419FHo/386kQtXT4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=jiF/KCQU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jiF/KCQU"
ARC-Seal: i=1; a=rsa-sha256; t=1785155322; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pa7lJklfBRLqnKnVelosGq+H8tB04+Kg1vRRtBoqlOz557Hb+10oQU337OJsKCyBlGNPJGwJkv0TwjGqFUJ1ZYJ4T+7y4kmfWdklbxLsXADl+auVHWjIod1KaDfuEbiGQjCnnOV7lsaXhRNaAB0+4fM7zmHvrqRJubXAvGHVixE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785155322; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rbp3aZfd+7hdYk4UzalcYYwe8Gd3qCTWWpzpp8ZSeuM=; 
	b=gUyO7XRtUVNjiPGqHxnu+Eea0ZVqjRN5mOe6VvOvdksySz9ZwelZEx56hKEfzTRjaRTam9QJr3pZx5APG7DjH+HfKz9TlYzxhvyyTAyYwlAxN3eR3+QnGC4U/ANcyNeJ0D0mMh8TsmeQ2FaTymR1DsQfvmIHcbNZgbZ3Ps/Gm5U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785155322;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Rbp3aZfd+7hdYk4UzalcYYwe8Gd3qCTWWpzpp8ZSeuM=;
	b=jiF/KCQUNKKZs8L61ayKwH+swRe/tLVvLK30i1nhQzEgJqdAkIrBDwxhXUAM9RU0
	5odbeTGxlu9RKfbJTBmxZVOewDlICIutON+nJxzJZfDKfAbLQAkh/9vf9msQzFtlsjB
	R6RVkXPSZCjAJFmCxYWNeR1TL9UlzcRZJ/3Kills=
Received: by mx.zohomail.com with SMTPS id 178515532026828.306970905591015;
	Mon, 27 Jul 2026 05:28:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/5] Add SCDC information to connector debugfs
Date: Mon, 27 Jul 2026 14:28:31 +0200
Message-ID: <EDiHBw8XQg-RsxQIQVIjig@collabora.com>
In-Reply-To: <1c9d3a50341129188242b1b2758fcee5eab243db@intel.com>
References:
 <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
 <1c9d3a50341129188242b1b2758fcee5eab243db@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 27 July 2026 10:35:15 Central European Summer Time Jani Nikula w=
rote:
> On Fri, 24 Jul 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com=
> wrote:
> > HDMI uses the DDC I2C bus for communicating various bits of link status
> > out of band with the actual HDMI video signal. This information can be
> > useful for debugging issues like questionable cables sabotaged by feline
> > teeth, Enthusiast Grade cables made of cow fencing wire, and other such
> > problems that ruin one's media viewing plans.
> >
> > Consequently, this series exposes various bits of pertinent information
> > from the SCDC protocol in an HDMI connector's debugfs. To continually
> > poll the link status, userspace can poll the debugfs file.
>=20
> Is there a reason we can't add a character device node for this similar
> to DP AUX? See config DRM_DISPLAY_DP_AUX_CHARDEV.

You already can just point tools at the ddc symlink to the i2c dev.

The idea here is to be able to read this out of debugfs without
any additional external tooling needed.

> It's ultimately more generic than deciphering everything in kernel.

The kernel will need to decipher this in the future anyway for HDMI 2.x
support, including so that it can set link status to bad when there's a
glut of errors.

>=20
>=20
> BR,
> Jani.
>=20
>=20
>=20
>=20
>=20
> >
> > ---
> > Changes in v9:
> > - Unlock mode_config.mutex on disconnected connector early exit
> > - Calculate and print Reed-Solomon error corrections counter on !=3D 4
> >   lane FRL as well. Technically a functional change to an already
> >   reviewed patch, but I kept the R-b because it's so minor.
> > - Link to v8: https://patch.msgid.link/20260722-scdc-link-health-v8-0-c=
d1dacbb85d9@collabora.com
> >
> > Changes in v8:
> > - Acquire mode_config mutex in an interruptible way during
> >   scdc_status_show to avoid racing connector state
> > - Remove scdc_debugfs_priv, use connector as debugfs entry priv instead
> > - Allocate and free state in scdc_status_show, since it doesn't need to
> >   persist across debugfs reads
> > - Check for NULL ddc in drm_scdc_read_state in the unlikely event an
> >   EDID with the SCDC flag was forced on a connector with no DDC
> > - Note: drm_connector_get() is omitted from drm_scdc_debugfs_init
> >   because drm_scdc_debugfs_init is called on connector construction and
> >   the debugfs is removed on connector destruction. Adding a redundant
> >   reference increase here would necessitate introducing a destruction
> >   callback to mirror the debugfs_init connector op for the sole purpose
> >   of decreasing the counter again.
> > - Link to v7: https://patch.msgid.link/20260721-scdc-link-health-v7-0-9=
2df1b6ad5fc@collabora.com
> >
> > Changes in v7:
> > - Move HDMI debugfs registration to new state helper, fix up all users
> >   (sun4i, vc4, bridge)
> > - Register scdc debugfs in new hdmi debugfs helper
> > - Link to v6: https://patch.msgid.link/20260611-scdc-link-health-v6-0-6=
307875a6b5e@collabora.com
> >
> > Changes in v6:
> > - Fix off-by-one error in drm_scdc_read_state
> > - Link to v5: https://patch.msgid.link/20260604-scdc-link-health-v5-0-1=
1173b0ac3de@collabora.com
> >
> > Changes in v5:
> > - Read all SCDC data regardless of update flags
> > - Dump SCDC data as hex before the human-readable output. It's separated
> >   with "\n----------------\n\n".
> > - No longer write 0 to read-only registers
> > - Add Reed-Solomon Corrections counter parsing
> > - Parsing has been kept. A desire was expressed to get this data without
> >   any external userspace tooling, and the kernel will need to parse it
> >   eventually anyway to set the link status.
> > - Functions have been made static as of right now, since external users
> >   may do another pass over the function signatures anyway.
> > - Link to v4: https://patch.msgid.link/20260527-scdc-link-health-v4-0-6=
22ea40a1f59@collabora.com
> >
> > Changes in v4:
> > - Don't use C struct bitfields for parsing status flags. Switch to
> >   bitwise AND for boolean flags, and FIELD_GET for multi-bit values.
> > - Drop the superfluous !! and parens
> > - Drop the __pure attributes on static functions
> > - Initialise stack local arrays with {}, not { 0 }.
> > - I've kept the print macros and %-30s format. Reason being that I don't
> >   want to repeat the format specifier and str_yes_no(foo) a bunch, and I
> >   like the %-30s format because it means all values are aligned with the
> >   value of the longest field, which is 30 chars long.
> > - Link to v3: https://patch.msgid.link/20260526-scdc-link-health-v3-0-5=
9e4a4aaead1@collabora.com
> >
> > Changes in v3:
> > - Add patch to change return type of drm_scdc_read/write.
> > - Rework error counter reading to duplicate less code.
> > - Also check lane 3 counter valid flag when reading its error counter.
> > - Use memset to clear buf for error counters, rather than doing it in
> >   the loop.
> > - Make read_error_counters not accept 0 as num_lanes; fix it up in the
> >   caller instead.
> > - Link to v2: https://patch.msgid.link/20260520-scdc-link-health-v2-0-5=
11af18cd64b@collabora.com
> >
> > Changes in v2:
> > - Add HDMI 2.1 SCDC status reporting
> > - Link to v1: https://patch.msgid.link/20260415-scdc-link-health-v1-0-8=
e731e88eaf0@collabora.com
> >
> > To: Jani Nikula <jani.nikula@linux.intel.com>
> > To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > To: Maxime Ripard <mripard@kernel.org>
> > To: Thomas Zimmermann <tzimmermann@suse.de>
> > To: David Airlie <airlied@gmail.com>
> > To: Simona Vetter <simona@ffwll.ch>
> > To: Andrzej Hajda <andrzej.hajda@intel.com>
> > To: Neil Armstrong <neil.armstrong@linaro.org>
> > To: Robert Foss <rfoss@kernel.org>
> > To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > To: Jonas Karlman <jonas@kwiboo.se>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > To: Daniel Stone <daniel@fooishbar.org>
> > To: Hans Verkuil <hverkuil+cisco@kernel.org>
> > To: Chen-Yu Tsai <wens@kernel.org>
> > To: Samuel Holland <samuel@sholland.org>
> > To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > To: Ma=C3=ADra Canal <mcanal@igalia.com>
> > To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: kernel@collabora.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-sunxi@lists.linux.dev
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >
> > ---
> > Nicolas Frattaroli (5):
> >       drm/scdc-helper: Don't use ssize_t return type for scdc_read/write
> >       drm/scdc-helper: Add scdc_status debugfs entry
> >       drm/scdc-helper: Implement parsing and printing HDMI 2.1 fields
> >       drm/debugfs: Move HDMI debugfs registration to state helper
> >       drm/display: hdmi-state-helper: Init SCDC debugfs for HDMI
> >
> >  drivers/gpu/drm/display/drm_bridge_connector.c  |   3 +
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 156 +++++++++++++
> >  drivers/gpu/drm/display/drm_scdc_helper.c       | 289 ++++++++++++++++=
+++++++-
> >  drivers/gpu/drm/drm_debugfs.c                   | 157 -------------
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          |   1 +
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                  |   1 +
> >  include/drm/display/drm_hdmi_state_helper.h     |   3 +
> >  include/drm/display/drm_scdc.h                  |  21 +-
> >  include/drm/display/drm_scdc_helper.h           | 103 ++++++++-
> >  9 files changed, 568 insertions(+), 166 deletions(-)
> > ---
> > base-commit: b747a63003130bef1a3d5d6ba97c94d0cee36f55
> > change-id: 20260413-scdc-link-health-89326013d96c
> >
> > Best regards,
> > -- =20
> > Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >
>=20
>=20




