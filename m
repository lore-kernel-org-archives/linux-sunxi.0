Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2692566
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 11:14:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 12A6BC669D
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 11:03:02 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id BCA3AC0006;
	Fri, 31 Mar 2023 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1680260574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LKKzuKD/yw4rJXNV+OTo/xDF3dymlJo4Q4foJX1aiC8=;
	b=BjjXSenfeT2p1QtWT86vqvBFTvqecWO+G/3LDdXvq3DpCuxvoU2l8WyzXLiLoIgIPDD3kz
	E6krT5KhEwfypJXZC8GCBhzGM7g3Kqfeo1r5VXkUBJnSz2gdVYmEhMYlqj8NCe555hU//n
	zUuszgSB9nNjk7tT1qzz1n4prjkR2A0a+Q7306EbQJMr3wAwL5YJKyTOdHzhXi4BAH9Akv
	KiQMef/st6irzFFTsCpx9FElmpZ43hDqh9m78KcpLmctRjNiTndY+rj2uBeV/EZFXhKsYo
	nJZLdZ914uLekqavTcq09vMJKJKJePGlDBFjnCQjtZhBBSEpil6SkgqN0Rx4Bw==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm: sun4i: set proper TCON0 DCLK rate in DSI mode 
Date: Fri, 31 Mar 2023 13:02:42 +0200
Message-Id: <20230331110245.43527-1-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With bpp bits per pixel transmitted over n DSI lanes, the target DCLK
rate for a given pixel clock is obtained as follows:

DCLK rate = 1/4 * bpp / n * pixel clock

Effect of this change can be observed through the rate of Vblank IRQs
which should now match refresh rate implied by set display mode. It
was verified to do so on a A64 board with a 2-lane and a 4-lane panel.

Roman Beranek (3):
  drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
  ARM: dts: sunxi: rename tcon's clock output
  drm: sun4i: calculate proper DCLK rate for DSI

 arch/arm/boot/dts/sun5i.dtsi                  |  2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  2 +-
 drivers/gpu/drm/sun4i/Makefile                |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 46 +++++++++++--------
 .../{sun4i_dotclock.c => sun4i_tcon_dclk.c}   |  2 +-
 .../{sun4i_dotclock.h => sun4i_tcon_dclk.h}   |  0
 9 files changed, 33 insertions(+), 27 deletions(-)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.c => sun4i_tcon_dclk.c} (99%)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.h => sun4i_tcon_dclk.h} (100%)

--
2.32.0 (Apple Git-132)


