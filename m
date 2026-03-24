Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEAD2F5468;
	Tue, 24 Mar 2026 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356956; cv=none; b=nY0XqjlZVdk2nEpe5QreNIU0YJoGh9HG+4vCYh9EL+S3sLVctug/8l5L+++/2mk0l2gbyNshY0s+DFEL8PYGFIMmJTefcEaEfk7NQVEOAnHNR8qvFesAjoiVSvI1x/b+WBWiPNR2LOg6Y0OxNjRU7JrdwYW/n7W5krYUtQ+GO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356956; c=relaxed/simple;
	bh=x9GUZF8oVtf8rR9qYu62wTpiEswFPmE02/ei7YJtid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3R5fxBXLh8A541+WbvTcAtGQh7m0Me9qKRANdcYk3SC1eT6uc6E0skj+g0nfmeVIHA6JYu3OnQR1fqpsnOK4MvYyzy9len9wZPvv1DdQrkL9YKQ+tpc2xZkh/vRsR6LgWIDZAhC2GuEjtwbprL2S6YcrjTOsevS0nIYaR9HUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSYOw08e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSYOw08e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896B3C19424;
	Tue, 24 Mar 2026 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356956;
	bh=x9GUZF8oVtf8rR9qYu62wTpiEswFPmE02/ei7YJtid4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eSYOw08eJ6g6mU188ifGnIiCj5eU9B72ydk5Z3j79gDD2hyqgBBtm1TrxAlVCKUx1
	 XX+BA43vPXn2rPdwn72j9VJMiJAoLas4KxELQIfr7P7UVVTmvjqD68L+4MdAdWs2fH
	 m3+IwlCoV1dfc4BAkjCgu/ea0C0wf2/h27d0SoqZxaouJ1j83vRMdb+yjVyJaZRoSn
	 8lcoTRABcNcoRoxrN+n7lto8X7HIfw72/df9lLNgtxUzcffZ0uA3RDVkIoAs/etLuO
	 qAPKXZtp60DrBIrawPlMXWDywnCzEM0+etpTW626pZVG9KL/5ZFdXgiCabvk6uqacQ
	 1M+RLdJyXuSfQ==
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Liu Ying <victor.liu@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 00/14] drm: Create drm_output_color_format enum
Date: Tue, 24 Mar 2026 13:55:51 +0100
Message-ID: <177435694766.397542.7138744621268133444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Mar 2026 10:04:52 +0100, Maxime Ripard wrote:
> This series creates an enum to represent the output color format as an
> enum instead of a bitmask, and consolidate the HDMI helpers to use the
> new enum.
> 
> This should make Nicolas' work easier.
> 
> It has been build tested, and passes kunit tests.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
