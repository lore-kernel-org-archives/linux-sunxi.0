Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D53212
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 22:24:29 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nleSe-0005bu-O7; Tue, 03 May 2022 00:24:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	inki.dae@samsung.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	dri-devel@lists.freedesktop.org,
	samuel@sholland.org,
	krzk@kernel.org,
	wens@csie.org,
	hjc@rock-chips.com,
	airlied@linux.ie,
	sw0312.kim@samsung.com,
	alain.volmat@foss.st.com,
	daniel@ffwll.ch,
	lgirdwood@gmail.com,
	linux-samsung-soc@vger.kernel.org,
	jernej.skrabec@gmail.com,
	linux-rockchip@lists.infradead.org,
	jy0922.shim@samsung.com,
	alim.akhtar@samsung.com,
	linux-sunxi@lists.linux.dev,
	broonie@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	kyungmin.park@samsung.com,
	mripard@kernel.org
Subject: Re: (subset) [PATCH 0/5] Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date: Tue,  3 May 2022 00:24:02 +0200
Message-Id: <165153020899.255051.7449667943189045907.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421170725.903361-1-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Apr 2022 19:07:20 +0200, José Expósito wrote:
> After implementing a similar change in the VC4 driver [1], as suggested
> by Laurent in the ToDo list [2], I noticed that a similar pattern is
> used in the Exynos, Rockchip, STI and sun4i drivers.
> 
> This patchset replaces drm_detect_hdmi_monitor() with is_hdmi in the
> mentioned drivers.
> 
> [...]

Applied, thanks!

[2/5] drm/rockchip: inno_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      commit: d449222dd533ca83a3a2f88aafe06fdd8d589280
[3/5] drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      commit: d2eabdb64474c2101953859601794f1ea08ec1d9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
