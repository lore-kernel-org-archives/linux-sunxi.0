Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879623AB88;
	Fri, 29 May 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047902; cv=none; b=oL8aIKdaZJfvrJxo1Fl/BUWtacnH1IEPSw9NYWbL2bU5mAoZHNKmdJ83wISuHsBlRrwmBjuTrWB8X9EluArHB76IsPpXSCSFaBQqORzd/bg8z0UlmqHw0fkWVmI12NxQ9dhYCe7f0mS4ya22r281bYWdXY2u/Hp7upLZDUjWWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047902; c=relaxed/simple;
	bh=RHVHrlzv1lzFeYNRDNP1L75L3nAMuR2vN18uyWO0W8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOq0npKQtz2ouSiCDNxzD7mcHAnH9/bKSMJuct/Bg9pEMVYWWuJh2Qh8BaC2duF7Wo/FjxWvnRxm67GZezQNb2iMjUUwksONyu/FWE7IEHWXgRIY9JGD5I8WjnzWWO38pHgB2O6WHQ1ldnXd1PnRw4qEkVrODVBbTVUX2WKfpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNcHfibn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNcHfibn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7761F00893;
	Fri, 29 May 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780047901;
	bh=7RTjgH7cR4g1plwKCLhYGLVrvQZCj948qud0birIVKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HNcHfibnRNMLyOqVp7W9kvfKqxv/RbLwtM3Codujo0cAFq3R63T8yeLjyld3drx2V
	 6LwPSdOa6ReLeYSW7hna3tQvtoIG9pFATM1ZEeglDwJbPyVzM2vFOjc1htVhMBl0fb
	 GzO6mjodOKj08HSLPFreBXUB+7tuhm+yZsxmfisz8ZxnB7TuEjnxcByJt5P02kv1iu
	 D4lYpo3ne3AM5bbQohx0IbiE0GLPgB1p+2BWQZOY6wxQSaIVpuVxK7djGcq3Jjd9SY
	 oOU9uHrUNwW8EdX8JwP2a1bVc8K0itiNRamsK/lWmu0eO93YMvWGQUr6QlKHcwPcsD
	 RSdb5gDwoh8iQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 00/19] drm/atomic: Rework initial state allocation
Date: Fri, 29 May 2026 11:44:56 +0200
Message-ID: <178004789161.1619320.5591445399376924968.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 18:46:12 +0200, Maxime Ripard wrote:
> This series started from my work on the hardware state readout[1], and
> more specifically a discussion with Thomas[2].
> 
> This series expands the work that has been merged recently to make
> drm_private_obj and drm_private_state allocation a bit more consistent
> and ended up creating a new atomic_create_state callback to allocate a
> new state with no side effect.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
