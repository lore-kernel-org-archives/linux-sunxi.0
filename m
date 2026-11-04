Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818628;
	b=ihGSFXF4zWRUcHY2nq99321cMCmE6j0EGtpuOLP0jw12q0FBHAhlVunIE3jj5srqEArA
	 knH2S3l2X2Sa8pl3rssGxT2I0P/TjRMn5ftQnhMsz25FHG2/6StacoqVJnTBxVz95oE7t
	 XfE+lQ9OxRK19lpJp+RJ0UoNRcUHCw8HN4pyZ3ngK/HcOTCphzmBev5gv0WSaG8/Bieen
	 n1gTJBhvTGAVvbVbFEgGj1tdyISPtZp35Y1Ps+CTWR7JQXnfJag9dzq+ZBc6bj54+y9Fa
	 dVyDc6v9uqvuEyHjzkmcYHOIpoMeb0iikNJKGnl0wG2dQNJaMpbgTQGwZWXtBPG2bgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
	b=d5zrfo1Xnm5xxkOGSJLMxWRgONiPl/U5YJwUv1tgkPxmAarEsfxz0sK5RL399UVmORSz
	 +UaNl3x8P35mu5cX2bS/ASvFzVQCcIKzSrzKPSCGcxrIUF2CeRHcSE7MsN5KwzAbcGjKl
	 Id5lDgxxoNqb4XyQ5jzLdwof4hDvJxCtaBKe5iYZhRHkHMYTBKrGNCF9d24o5XYVze6My
	 rMZ/PRHPUndkbuhIK+ENlSQmEONuo1hF0682qdQcrPS5eCujK6wBhomS8PHw/CdkQzSQN
	 MXUaWcPgncr2/NyyWh1TNWVX0mTHnALDcr/8sxy/Q4SM+KaExjEVzS9UOf63w/tLB9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKO942dL;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D4606EEB1
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1D4606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKO942dL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso934935f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818627; x=1794423427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
        b=FKO942dLG6Sxwn/AGKAgEmR8QKnL5mx7z7TZ7GOQYLk2Rx6kmcurTHE25kEPV9zEY2
         7y/B00/TBwi1V5Ntbpj7zDoju+QY52PLFko9kn5pvA6x7Y8g4PfzzqNj84NqsS9AB46Y
         NwkNBhagHqo0uNOm8uB6mViKZAuMhxFrkq0pocPT34d9oW4rksyJb4IsaanuRXAQ533W
         bK72rS6EaSUdMmoIjBLQ5TS0RfXgRvje/tCGlxg15cMbQ3vp3db5yCVrYeLdQ/K+hluk
         KIeETMEeoHlYqaX6+lvjrrPxL5Q5CJZ88tAl1gjs5yQENopik1m4xxN+7pQ3+qnqc0RC
         Qcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818627; x=1794423427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
        b=vZYGS5vSGwMqOD6XH33YKcU7jgLwpbJirE2RKVoenXQ2M/Pke4PuPwcb56UINQmaw1
         YTKJ4zdrnpw1YpYkhyQBpMKsg5TJqVLiDzY5r0223JoZnx+K6ldCFyBo6uADeEUr4yQL
         EqPW5SBkFj88sn9yamXNE2XqT7Vd/RflbuaqmIMalQGu6a3jap/2n7702rieHcg9E9Is
         3TdQFRH0KMxL9r0NKDQ8FETd/ulQgDNormWfypn2J/XnyAzI99pcCCggfjPyxFA8+K/L
         UJy9bn5Ion6830hXEUyGnErB1zEPH6F8biEQlrZEszNxfsIyjuVMgT/vkbkJPhBUWDvj
         dHag==
X-Forwarded-Encrypted: i=1; AKwUvBzA2WwR6JZdkYgtM7xdkuFgWAe8JQ3YY4SF9AA+5zAVEIR0s/3oLkKGhMITHVg2UIAZbvXZ2gZEweDHCg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/qUIOP2FkKUbrgEEK7gBgXLslta+D8rVOJfbOX9cKb0fDfcR78
	t6wBm2QtLAwv6gkeuMfJInnQ8sMDn10vbH5pQbJWcjI8jeLTzZxySOFU
X-Gm-Gg: AYBFou2yww/MPb5ZakBu1YSbc4Y83H/o01aiw/3CmHrI/jcbjxRPhfZiCNjlrJWrqtV
	6u56hkF2RuySP2QlekpRLI4iELHzHkF7AWbSZIu9/Ls4RD5LP0F/Kbc+VrC3hMijW9tdaepxJ6s
	cX3S2mbsX8O7E+DiE+6pV2f0FSu60mA4zVCt9+5aG0Oa7EE6zhULfFh69TQ0vflf/D9gHrILjwN
	gSFXKp551PH3OtGLo2IP7DVBy+5QPe7UQmNLR7OviRoGHOViF/qCMkEPj5Qt5a9LAdMjOKf55rP
	XNAOlqkG6emdd9rCq6FDnP+tLfLB7T2SCjpCrhg2Yy4tDbu6QPb0gFLlH7aE4kJR8xMUtlM6OVt
	aOjodaP4rWDqdh8CIkikD1w/qgiwCFlt11M7hpEP9Fym7oQ31RAoEuD/5yFjkxRzu79G2+taSy8
	ijwkxVlmvPldSrgL7k2v5ia/2zinNccN4f5y/6/f9T7a5gjnRIEJ4rziNcO/rYvkkagSoD4ITl1
	K4KLjPTGloLd0LW7wjjOxwyDpyIJRC6HGMNqdLadmAP9qREcjcbJMn50OS9lFbexYLVli2gQqCf
	V3wC0qDX5AQKz9kQH/cwDDEVgF2FZFli9ZlZfBSb3TUWgZdaGRb4pNPrzF/bHUtS+myEFbBmW7N
	tXzbijyQAXBT+qK77UoszVTWqaGC3GGIKJn7bKeq66WC9Ih62EoI8OsqMH0bnsAHGYmlbqBjkF8
	rcDWw3SQ0ee/0+a28PGfAP5KZTASN95Ho8WwQPSj7YNtkP+UMOfr9joQj57gwPYyWAGtnLPTweW
	GNlBlZkaXe9p5dV9q6afvWuxzmV3tMifoDpP8gr+MeZUw7zQHVUrTyhJ/lZ5pzcOCM=
X-Received: by 2002:a05:6000:160b:b0:48e:7476:9205 with SMTP id ffacd0b85a97d-48e74769219mr22849870f8f.31.1793818626772;
        Wed, 04 Nov 2026 10:57:06 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08343dsm5463560f8f.30.2026.11.04.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:57:06 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
Date: Wed,  4 Nov 2026 19:56:59 +0100
Message-ID: <20261104185659.884455-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
undo that, so the clocks stay enabled and every further bind attempt
enables them once more.

Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.

Fixes: c64c8e04a12e ("drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index bd3923ef5a41..983826001f12 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -209,6 +209,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 cleanup_encoder:
 	drm_encoder_cleanup(encoder);
+	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

