Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAE372EC0;
	Thu,  6 Aug 2026 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998058; cv=none; b=U2sAhWR7d5tJAiGwNJAgR/johrjoQrXig8lsSGyt1bJrA0stiOzWtNKc54hjONPTezE9W5Zhpxa278m5PgqstvMS69n6unqg6fX5DTPmW7Ydha32VJr5S2Y1riChWhAHnttlP1t7U6UsEZAfBaqnbYauU1oWX1rvM+ptgmHqJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998058; c=relaxed/simple;
	bh=oGxb6hFc8gy6Y+gern/jcVen79VrjwbnDDroptn88yQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FYRAbSDcMXt/QxDkMnhbqYfRM42ogYeVix+Ft5H8W9E/tMi/E/WY52zU7+2ItDwqb9JSi1XXUEz9gajCOPGLJsvXb+IOWpBBrD1BATdxM4EK8Yeo1Pe16wvUjb2JkkoclhYXst/kngPj9D1eXJepW5e1j8Lkj105Hzc+inygT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kj6sMOxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kj6sMOxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B37E1F000E9;
	Thu,  6 Aug 2026 06:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785998057;
	bh=aXg1rMIKmNTdTFekqThk0PQEaQIIk4Z++s/CEvY32hs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kj6sMOxyhJqy7VnazYtP8PQkAF+GsIaNb7tbT9ptHYwnYHA6PEBM1fbmwPGE/uAAs
	 juodLD4YNyk+MLgJWeV3dUyTDqxdQo6olWmkXawrPfQsT6Dsf95QgNoOgS34gjGcYb
	 zKmjQ3HcX4261SwejLk7x/tQa0tGsKBQ5yIKGwljrOOsmLHg2GUcgv/R1YUtJAQylf
	 dL7hYCTHRWavNqxVFqVooxbmLaH9qJ4IEs3ija3+nf9UETw9sxt+wgG//Nx9tblb69
	 jVgX39bu6AW1fa+yZSLxr1oCpfPzXmmhGz3IcTQuDCctw9sjPpfkp+guYQ4b0KGgEp
	 Gu9s7YsM6uDSw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 samuel@sholland.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
 <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH 01/13] drm/sun4i: Fix V3s YUV scanline size
Message-Id: <178599805478.3568999.5569213345510940143.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 14:34:14 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 03 Aug 2026 18:10:39 +0200, Jernej Skrabec wrote:
> The VI scaler line buffer on V3s can hold 1024 pixels for subsampled
> formats, not 2048 as currently claimed. Since coarse horizontal scaling
> is engaged only once the source width exceeds that limit, YUV layers
> wider than 1024 pixels are passed to the scaler unchanged and the
> output is corrupted.
> 
> Use the value from the vendor driver.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[01/13] drm/sun4i: Fix V3s YUV scanline size
        commit: abffce8b1eb5e119efccc51fc6a18ba38e2f6db6
[02/13] drm/sun4i: vi scaler: Fix coefficient selection
        commit: 5c31990b21f0b535732deb2b658b78b07464f56c
[03/13] drm/sun4i: vi scaler: Restore opaque alpha in video modes
        commit: 583d99165a85c3aaee924078c0f03c72e25644ac
[04/13] drm/sun4i: tcon-top: Keep mixer routes distinct
        commit: 62bac3202042a8cfd4d4969a6d057cebd8b7cc1a
[05/13] drm/sun4i: tcon: Set output mux for DSI and LVDS
        commit: 9c90199b39637ad94253c4fd8e7b1333ca1d3e0d
[06/13] drm/sun4i: tcon: Drop TCON TOP device reference
        commit: 8208832a38ff3d2560eb8a77a9d7a2f17d8ebcdc
[07/13] drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
        commit: f5c3b1b0d228624786d22973a20c908c84e1a576
[08/13] drm/sun4i: crtc: Propagate layer initialization error
        commit: 7061ff05ed4a3cf16e83f7e3ad09cbd212508a32
[09/13] drm/sun4i: tcon: Drop remote endpoint reference
        commit: 3f77e4072630e2301efdbe521e7fca10311043ec
[10/13] drm/sun4i: dw-hdmi: Drop TCON TOP port reference
        commit: d2a242e5688a17b79c89cd966cd31820c5096d80
[11/13] drm/sun4i: Drop node references while building component list
        commit: 08a91f2a0664b73c2af9295ecbd441e852abe33c
[12/13] drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
        commit: 0ba6deddaae74f0539c0303bfb5f860adbe1a68b

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

