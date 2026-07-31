Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D490C45DF47
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514797; cv=none; b=GfTgIhueAF+WNf38LuciFeBMgb948IWCglOe6ksM6vSGrE2aIh4769P/jsG7sRhf/688AV4HgZsBr4gykzqpVO6jNpGZHb8OK6/WBZsD+lb90jrthNUPdeQGe1CLHg0o7Mtrl0CjIR5RGabpcKBgxOB61bGhTsYSskojOzFohRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514797; c=relaxed/simple;
	bh=cD0+/HfmX6kyKNERhJbIzwqeRqoG4S21IHzyef7ml5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRIEV9f1pZvM00nrCaYO7fhPvCiYOna9Ekybr2fWQq47zu2mtQQcEJGiD+/JNJ7Bi6woCys34OfOLd4QGiiTyzcIp3XB97JyapmWYKqR5h8sw8w6VR9B4NBHq/mBVnj/7hE0ZkkPRg/xolJDC2QkRLbbWdExJOtALSERNLBq9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hOGi+lHR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hOGi+lHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514779;
	bh=cD0+/HfmX6kyKNERhJbIzwqeRqoG4S21IHzyef7ml5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hOGi+lHRBgySpQW2uguQ7wsos1kzzG8W3hTgHG4zsO3iZhFXFRTp7MwCwGwswst0k
	 WvxJsEIy5w4NlG9nenga1sACsJ81ZwdOsrqTPIzSg1j2A2QYQ2KbEAksthrCAQlvYZ
	 hkgy4tc5gKSdJ+D6hWGZjTy9GFoNvpowysgh5qNErQhh5AIwsVQJpjkRI7dfwxi1wh
	 hGeIFE+JHvSpdx+Zy9xj3FUikWT5Tyfkv9hxJwQpc65e1EbyAaJom+UrKoK3fFzVln
	 0qt+5XW7EGq9VjfxDlrcup7lj4g1s1EoGq53tRT++BhOhsqyxfY7oPkGM3fRmBZSUP
	 kj3ySNTVNhWHw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C40717E0972;
	Fri, 31 Jul 2026 18:19:39 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:41 +0300
Subject: [PATCH v10 34/69] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ in
 io_init
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-34-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Start with HPD masked, matching RK3588, so the bridge framework controls
when interrupts are armed via hpd_enable().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f5342c5f457b..64e8e4c12cbd 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -432,7 +432,7 @@ static void dw_hdmi_qp_rk3576_io_init(struct rockchip_hdmi_qp *hdmi)
 
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
 
-	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
+	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 }
 

-- 
2.55.0

