Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE3937E5D4
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773509; cv=none; b=ZplhUnnsQCZQ7j+NMVPUAoINiiiiM6jMS5w3ID9g836o/F/DNiYvFYzvLo+47548WPolirzBjFLLXngoL+SQn99PvUgVsgFZ/ZviLrLYDVNolKR1NDPv7oT6Rvp3YHH7LgQqQ+o5ZjP9Fj99Jv95QbmYJcXAr/apygBX1lYU5Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773509; c=relaxed/simple;
	bh=QyiUpZCH56C+FxNuk6usldixE9OetGP6tDy41SiyBE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udRAqzFREe0qfz/vMKYBxJcCUY6D0FujFoYJieyGdEBr7CU0f5zfBmNoRCSUdz2Srd33roiB99jSEwFJj9pJATwM4IQkv1QjPEwxuBQWsdfixCxjkHA1eaYKGWDfNwYYEQ6jc/Q7tkWS9z3yeV8xs+vw3rvJUcl3Q7kdeRWuQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfUTPn4f; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfUTPn4f"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso491815e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773501; x=1786378301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwcCW5bnIxEMSTfDGEDmQeCwaEieT0mPnUwcX4qTD6M=;
        b=GfUTPn4fcpHm2vb+uvJMuRxzyLGxtwgiaxbEfiuc2I/5aOqJEijwa7kaV+RwbV3rv+
         1gUrYzkD86OHp/1dxHc0k/WKyVsvpBds/tt9exZ0JlYLRYXCIR/jaGb+lxf/FV8FHnzp
         UkC5rFIVqDheZ+HsyrFpBm2ZLt/yYvnaBMVInPwjhxg/NVJu1q5xHpgzLyCZtASzJO0/
         gIf4FWfSMB/+CHFhgxPN55tSbdz+DA+fn4r6KoO62RNG8FW9mlnTO8hK34HMbL/CHa7d
         22XOfR5dHgbpznu9GtwBUqorVQUaKjO9hvEBUIILVVwarRrIIME5ACxB1EGsABZt7uhI
         3jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773501; x=1786378301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwcCW5bnIxEMSTfDGEDmQeCwaEieT0mPnUwcX4qTD6M=;
        b=rE7LyBXFsD2cOfmZ+wLmVdHRAC6JZ9pSmwqwx2DsEYKqVPziUWV1HAQerHW93Rw5KJ
         CGyVR4nUKATVS8DMfg0E1uhLEWkLHtUs28p6AXRCxH6iAcldym3AKzqZ2KpvppsmTKMB
         v++cu3IsIGbpUoYLmMwlNNTaZ3Y1qUlOPHXZB6vdVWWZOHcqB4rO7XQT+yS04b+VxkqF
         HQsoPnEZfrJ0abteCqC3EzfqJFHiamp737qvpV9d2gH1zjkVCGuL9jiqeXx0Yl9IBVQ0
         Wx5YWH1Mof7aIl61DOaQy5MLcMtSMRctMD/oCxgZLVDlxkT7IetK5+i9e4iv8dAan7FI
         SgBg==
X-Forwarded-Encrypted: i=1; AHgh+Rru9QymL+GXr46a1IoE1sanEavwwpJ1uJr/wH+pGxuz7OmEc/bupkQF6rFW8ukVShoYxWp1itrtAlcD1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp4/FcAJ8sCi89WacJQJgjnqISbR7lUbf99erAO9770LdjQOlt
	RPWC3psWH2Qaf5303iR6yAsThSRG/ZQohV88UL7k0eFU8uGknODMVITO
X-Gm-Gg: AR+sD12JV+0/APbmIyC1L0NzKXbOF+ss0cZpWvdSJUqhb2oapnNo0nbzyJtQasLM+A+
	YJQZscevfgJSAuYP6BwdqFiUP13q+7QAe7MlMTfWnX93ca8o6yBkG0ftsy3V+PYIwS+oy7USGdo
	ntWo6PA/v078YN96UpbOxGTFmpmGI0uJMD0pfAG8YI+jr32ey5k3Oyuc0ef6IdXaXir0rkXmGAV
	xNtZ3RPgQQxAIBg7CW/3s51+pTK32JflsD02KdqjCxoaaUUY/x0pdm3vDAPBIEgJ54bT4QK3JJ3
	l974qVmFar/XzNowIsZovevCuvUDHJDjCgkwF/Nr9EaSeSxJs/N53Jf6yapm/rwR/u9TvtCjHjX
	aXKkdS3nrBs0fG0nLQ52bSUESukf1UiemgTdA9j1cNwjHpFBDboCtzEsNRAyDmAqj0Okmf8LCXb
	uTzzQ+OOb7XPAqYT/uxxxYKR8E5+RuDIGRiaVNeGi84ZWg9nRxKCptn7xChCMlFkxdl2qVbJOmr
	RhDEAUVoSUXPf4ye7hq4/x8Q4Q4B9+WLy1xbWrXsgTHZcwOTaj3f1sBpN8d+Avh4lRgsL95zBMf
	zZ+WAqVInWBFhajL7X8wQ4yoXW3ujizPKMrPZpOb/djXmH5m+EeUakseGbt8Jlcgwvgv9qGFISJ
	b+L+tRmzNhy6SP715BH57jwGHmC80w6fKbN2tX2/7Cb+V6EaDBQLJEPc3ZO49S0azIrQ14RigMq
	exPA==
X-Received: by 2002:a05:600c:8010:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-4994a0f6838mr3426715e9.4.1785773501354;
        Mon, 03 Aug 2026 09:11:41 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:41 -0700 (PDT)
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
Subject: [PATCH 12/13] drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
Date: Mon,  3 Aug 2026 18:10:50 +0200
Message-ID: <aec9060209473b8176eb43bc7c63c20b21306adf.1785772659.git.jernej.skrabec@gmail.com>
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

The 8-bit entry of the last MPLL row (594 MHz) doesn't lock reliably on
H6. 4K@60 RGB/YUV444, which is the mode that reaches this entry, doesn't
come up.

Align the value with the vendor driver. Other entries are left alone,
they are used by lower pixel clocks which work fine.

Tested with 4K@60 on a LG TV.

Fixes: 0fb4b858b102 ("drm/sun4i: Add support for H6 HDMI PHY")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 4fa69c463dc4..489ea94693ff 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -91,7 +91,7 @@ static const struct dw_hdmi_mpll_config sun50i_h6_mpll_cfg[] = {
 		},
 	},  {
 		594000000, {
-			{ 0x1a40, 0x0003 },
+			{ 0x1a7c, 0x0003 },
 			{ 0x3b4c, 0x0003 },
 			{ 0x5a64, 0x0003 },
 		},
-- 
2.43.0

