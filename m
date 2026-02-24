Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B539A7F4
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Feb 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937114; cv=none; b=cQ+yOLT2vzbBKLkFTxKKWZ0HilVViSsDQvlIz6N6ZKYU1urjSSyzvmWJfDc/yLuXEpuStfiwy7sKddk6KqqtrgRzPx/bn5VtkCtISPKGf2dVolVeMfnkxZT61NK3RY+gj5z08flPUZ7ThmE2N/ldzgYvnsKB1fHBWRYtImaZQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937114; c=relaxed/simple;
	bh=W7iFt2fkt7YDpfXHd4Koz7uX1w/SnCnrgCNowt9OOFg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FMlAHkIazFAX0VHIvE61aBp8xtFbooxkit/zE3UIFrMvpV+VBdEfS6lW/wUWj8aTAUbCdwFxgmdnL+w1CgnN6wF94IA1EZaQ43twD6euPx9D/iTgaf9jM1YnxrwQiGr9553V+CzAfIeMN70Jm2ev87KYWu3p+bHne7cWR63WReo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeTDMNcA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeTDMNcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771937114; x=1803473114;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=W7iFt2fkt7YDpfXHd4Koz7uX1w/SnCnrgCNowt9OOFg=;
  b=IeTDMNcAwD40mzY1+plh0CDE5hq1sc5k0Hknx5cfiGqgnxwWbhXZ7rOu
   al3pRfq+DrAQpYa9bDjFKocYyHp7T2kIdGa6LW5unDX5n0WVQRxSlRgFf
   iONXvKvTmZSn8zOdDgBYreI7ANCZQXypV5kCJZPok50OVkTjt9l7No8vg
   +bZC2LgcImj1SQBLirT5W7gYRGFO+0eW2mIk02xZh7mxmh17A0oa3df4V
   NOYQDhAnvhwq4PhefnlYKNqsCk+Dpg/xnLKDPvMeMJrSMk+ox7Zvliqzp
   ZWxsiwuqo3sZc/GLa6DNSroskskNNVzR1L3qFKHy2LWSmzMVWDorDwStR
   w==;
X-CSE-ConnectionGUID: 3AYZimLoR5yPUoBYoTULlA==
X-CSE-MsgGUID: xTiLHwhZTqKDkyfGvd+dOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73128798"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73128798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:45:13 -0800
X-CSE-ConnectionGUID: hR5Tp+z0SeiMexLEVtwNdg==
X-CSE-MsgGUID: RMgpOpjdSHuKzcfGeOggUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215752727"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.20])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:45:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan
 <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Liu
 Ying
 <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland
 <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance
 <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/14] drm: Create drm_output_color_format enum
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
Date: Tue, 24 Feb 2026 14:44:57 +0200
Message-ID: <f8e02ae7d60814d3d0540ab81ebccbe46eaf5e29@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 24 Feb 2026, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> This series creates an enum to represent the output color format as an
> enum instead of a bitmask, and consolidate the HDMI helpers to use the
> new enum.
>
> This should make Nicolas' work easier.
>
> It has been build tested, and passes kunit tests.
>
> Let me know what you think,

I like this. I eyeballed through the series, but did not spend enough
time to call it detailed review.

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel
