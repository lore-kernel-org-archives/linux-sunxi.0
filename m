Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD6D416846
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773488; cv=none; b=PiG2nEIF1t1i1ivSH2QZxKQE9IH5SWuCHpUI2KqdF0Ttj9qb9BMmFk49QCZR62HcbAtvQwAVYTdCPcT4bG5M8yye+ICIWFPrXRNCk0R4cL/I0nGY3Z4QGczFj+FxHluSVax2In7aBgWN1eM5c2DkM2RuEXXWLzWzyU01eqWuoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773488; c=relaxed/simple;
	bh=FPl35JURbDRAcszB3SP4dKcJ8OqIqWJgXQ6A351ijhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlp6gccDqDQz3c/RLipiUIIfjBwCY6KDfK99H2903yMOFHhRMsHxyMbiDbHYGlwlYbzeVyf0gyLpUU8XEKqo3TpVW4Bv+qQp/Ul9EPmZunwUZWzInVrmPHlVgOhr7zkzR14oWCmzAi+x3DyiTzUBV7MOQK+WfBOuUumWWj5FS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irEyw8yH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irEyw8yH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso14920535e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773485; x=1786378285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JovHwWPJVIJjedVl1fvW+GGr92iYs5PPothHhlNSmKk=;
        b=irEyw8yHsBOX9vzRzSUol+Xk/L6JQ8eYdoyitiJIsTZPo3MIhhjjxz/TfUP50RxIIN
         8ooW3Dm/mWm4znrBgu4H9sM0V15lJKoghXwxlwuwUv2b+08vw2L46WZCfmMvyFRd2NIP
         MSlzn0Ygz0xQC8fgXYeMAZY9PVwtWf8MjWv/fYR6McExha94jepsEdJfK0wFS+tSfJaM
         zQMRxAv4ZTy1r6NuKXSSFN+Qb8Otnx5FSheiPpOtrgZPyPuMxjCFwKpHqozC8g5hPwjY
         NIH8Y7atIkQCJV0c09KiHOv+kWaGCorMNtMAkRRIISbA2bgieDvEwyVSZT1mPoXPlUGC
         RJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773485; x=1786378285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JovHwWPJVIJjedVl1fvW+GGr92iYs5PPothHhlNSmKk=;
        b=N4V1+dJM5TlXRHjbMUA+32lyOFssxH07Y+lcINwPIXRssIH/H9PMYFZ+e/F+ve2RDC
         gwLNqrXVZjfByVl/q7whZtiadesjsVQLI/WBrf7+DMgDirkC6jLDkSom8wC95s//BR8G
         QSP3xnLBs83yJWqOhkRRFZ9qEmxUr4gkYR9GW/9t7Km4jIi7xZatfpkxo7E4TQz9GsrI
         eiy9kpLt89EP+dmAhBrSdZ407A9L+/g2y/voCMicWSWJ4PEkbPtYW39Ug/aIh+TP/sVH
         J7Uefxvs+dTeus6uxazAwfq93WQwgXz641seXoA8eZ7sixQGUu4loPVjvWERBU7aaQar
         KlVg==
X-Forwarded-Encrypted: i=1; AHgh+RoLlsetuAI4lPtHfGHjs2yCTwy91+L4KROYUHj4qHgLw9D6P4btm8yc6vSEK0RK9WPCl80AandJIjOhqw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvslid/vXiYQa9HRBLTSoA1JplbVt76bdFEVY7DviITwBt5LjZ
	i0+MOdn9x7VyvIUksJP9ywXSLLQn5fHI0wUOQKlhmtonY9jGmGFwKm5c
X-Gm-Gg: AR+sD12+zleB/4GGVbruhmhrkgpaL5bwbUFZraQWEVy9oJ6Z2yKSDhb4qRWhs/d0/UV
	VAM69k94PuUfGMzfTEM3Rxa3WnyfwdTlcYREiuXeZkt4lUAhp1eIq9NbI7va6+Hb2rgG/I3mvRJ
	5v8pemIxPPpp1hSO2+meq4xaCzpdcJH0IVRJqoIuDm0fY3sA5+kJqE9zF3zJJTIFC+Z7eg/tNoL
	ei7mwsNFXnyY3swK5LeQJ/Z2WeoDscOMuq3s6sw9azxYlI35oFa9kNWEjapYWdepYJOvIwaGsyI
	ixupDzZUzbQ7AhKtZjZ9zdE3s8eneVoskGl24fi03ANM9KIDPwmGK2jRphKw5Jbry65g8SjpGbe
	mKgiCVCtcnlmYAV+leQNvLhlRua3RT4ZM7waou1a/vt/xwhg752S1cnGTy7Sh85kUmWs7m7cjON
	DxClAik38FSmmIOdYwPFZYvC+mioBzLpxHxPae4i+88+Puoy9dobkFai/qWdWvo1Ttj8yZ4khZk
	MH94TZZoSOwssP60CXI8XOAWKmlV2HIzgrk4chVu3KpQZHdRxcLOEa0kRvkvu3GZC9FwEhwqsjZ
	cK48jZh47VUaur7efnAAkJVtigf3Fj06cDgaI3u+Ew9832y3bINvPQxe5NuBkBdKYy2ovdvr3dy
	uu6z/bngvnyo1Gw9hsB6Ot7gik1YrvShRYOffl51aSvsN8QIpImwedfbiu5MGJrlQ8hqarCFspz
	i0GAYfpr9zrSF8
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-4980c66c9a8mr228536025e9.3.1785773484651;
        Mon, 03 Aug 2026 09:11:24 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 05/13] drm/sun4i: tcon: Set output mux for DSI and LVDS
Date: Mon,  3 Aug 2026 18:10:43 +0200
Message-ID: <7e9dad9eed2e91a79c4e1202caa8fed7c2427531.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DSI and LVDS skip output mux setup, so TCON TOP cannot route the selected
mixer. Configure them like other channel 0 outputs.

In practice this matters for D1, where channel 0 TCONs are fed through
TCON TOP. The remaining set_mux implementations only handle TMDS and
return an error for other encoder types, as before.

Fixes: b9b52d2f4aaf ("drm/sun4i: Add support for D1 TCONs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..ea7c90fef316 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -717,9 +717,11 @@ void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
 	case DRM_MODE_ENCODER_DSI:
 		/* DSI is tied to special case of CPU interface */
 		sun4i_tcon0_mode_set_cpu(tcon, encoder, mode);
+		sun4i_tcon_set_mux(tcon, 0, encoder);
 		break;
 	case DRM_MODE_ENCODER_LVDS:
 		sun4i_tcon0_mode_set_lvds(tcon, encoder, mode);
+		sun4i_tcon_set_mux(tcon, 0, encoder);
 		break;
 	case DRM_MODE_ENCODER_NONE:
 		sun4i_tcon0_mode_set_rgb(tcon, encoder, mode);
-- 
2.43.0

