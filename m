Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957523;
	b=KgRFqTUaFnLirdONW3EjGSutXzAE7FSnxBaDKuGizR4TzOkaM9UhRC+QQo9aiEOO0wHC
	 5P8tCqrQNHAdmKi0ZW1kUAHLNLCykinFWCycHbbFF1fc/FYUr22Z/CTik7sg66vjFLIM8
	 TF4juXgMxiQoIXKXVEecqgYGnMYETbne0+Po7Mz+kyoUEqi2JmHmdsgg8BgFqCjQri+zI
	 gMN1BAyEATkRLNVgWWKtusivJm0hvE99NmEkjvAlrrHFH4iDmYLqKlT9XBbsSr+EftE8O
	 aGId09bRhDAH+Ps9Oieqlldo1R3PJw1xujLkZXuJCB09MsovrvML8KsoY61CSwPmRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957523;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=iIGCznXhTjwwAbtISLd9zxt6KkpRGg6tsCKG2gaFg90=;
	b=to0BadNhYnMGYmoSHE3ClVz5T9Iu8s/7AmgJk50ENp3Bsvm/YYRgTH3QzTh387elgRSt
	 puGDwKDwZ3Oa5kusc05Ixm4iR8KANNpm/HpK9wd26eXqUFKeoPnvewCDdhWoMLErKIKcK
	 O03Cg/Ufe58+Y+MY9YlaZcul806yv5mQb9Uiy/ZD79DlQR+NX7epC38TmebRKU/bQcntd
	 8eCG310bZN9aI3U55XHtrvlQJpNtfXB/i2FEJZxTF/d9ZDM8aQHPXVeJKPBli6hdjxeXS
	 XgEr1/gvJQQMeYQv9eYk9QoN1qmuYr9RJnLuhIDcHbseyaeMZV71DIE7gEkn5xs0QaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SvLsGhkT;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28175606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 23:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28175606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SvLsGhkT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iI
	GCznXhTjwwAbtISLd9zxt6KkpRGg6tsCKG2gaFg90=; b=SvLsGhkTDPXzAfq3BR
	9/l8k4//D8k9qjpqRh6nqSAT52sbBOOoDZV1S38pDyyER2j/AgTIWZL6jMwOD1sH
	CwstOyXCpV9EwQiVgZB+gbA4YVlyD4r5+KrkJ6Q1pyEtVD/eY55ea0C9I4CINX0I
	7b4hH93gFoHRAHeRsNjYh5mww=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S2;
	Wed, 18 Nov 2026 07:18:07 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/sun4i: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:49 +0800
Message-ID: <20261117231751.264258-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117091932.12063-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCXyQiu4Pxq15exGA--.55935S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrW8ZFy3Zw1rAw15ZFWUJwb_yoW8Jw18pF
	WrG3Z8G34kGr4av3WfJa47XFy3ua1fGFWrWrnxJ3Z3Aw1DAFy5Gryjk3Wa9FWDJr4Ikw47
	tws8ur9IkFyDC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0GQDUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RA+cmr84LABfwAA3J

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property.  Neither the DE2+ mixer planes nor the DE1 backend
planes create one.

Both engines blend a layer with its own alpha channel and do not
premultiply, which is the DRM "coverage" equation, so advertise exactly
DRM_MODE_BLEND_COVERAGE and leave the register programming unchanged.

Changes in v2:
- Drop the Fixes: tag.  860e748bddcc only added the generic check; it did
  not change this driver.
- Drop the code comments; they only restated the commit message.
- Handle the DE1 backend planes too, in a separate patch, since they
  expose alpha formats as well and still warned on A10/A20/A31/A33.
- Link to v1: https://lore.kernel.org/dri-devel/20261117091932.12063-1-hsyysy@163.com/

Yang Siyuan (2):
  drm/sun4i: mixer: report coverage blending for alpha-capable planes
  drm/sun4i: backend: report coverage blending for alpha-capable planes

 drivers/gpu/drm/sun4i/sun4i_layer.c    | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++++++
 3 files changed, 23 insertions(+)

base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.1

