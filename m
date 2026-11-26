Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729492;
	b=sRtrUgd/Twq+RT6kGaKxQ03J8CGmQqAT2Rt1VuALERFQbZ6nTiG5G6jNEppyXHgxQ+Mn
	 d+TmdzvX34d6ip0xKp5yipFBAC214ozx0JajyIVE1uhldB0OAy23ylae1LCpxzsBpWvAL
	 cGlC83PCa1+j8G08dhd+fU/MiYe89fUSlchjOvLFZaS0YzPvGN/qGwjdLw0pgj2gyoWH1
	 LTi4I1BSOl+5sko6/zEvs5sK3ihpm78D9huYVTGUQh4YiOTSr4d/SBVw/cRAb/VMxBYJw
	 AnDnl8rFj+aJDQZAeUhQ5BgnWJVrl4Pg8hCl6d4nnC9xVsKSmlYHLjhsBvE4k6kuVYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
	b=r6Vsz7Nyy4jiVHF4X/IZIvo6jEVXEDLOTukGnwwOAFkor8CLYHrXrrzxOyRdlmc2W+7y
	 3T8ML/GKX9MQiZIdpp5EoIHygeWEF37tlKCQjPL1eahOoVciM/DeyUBEU5Z3FDWhs8kSR
	 5aHvdW75rToHCCPIlxGyfnKLruD+/V6P+QWuP7kxPnMPxjQtPvVk0SlAf1WammrBWKtQi
	 N2eaFtFNyA5U00tZ/g1cXW3+koRMSGKvc4Wxb6q46DVFnx3kDfFIQuWbsNAQGFqyBWRCY
	 6URNSfJMuWaMp2pztS1YOCDjZB+A/njMJPCTGxY2BNs9C8/tcVAZ0mpoAFr4Rn3a9eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRf5jKUZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108B606A695
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3108B606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRf5jKUZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so52993985e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729491; x=1796334291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=mRf5jKUZUvSl+ubMLxg2boz+Ij6c6pp/ZLQHemdGS7TipLTOkLs5E5m4gm5jftvIMf
         yAgHjo7LC0RTYlh8gEk53AVJdK8NSEUfnGja7tFThaqseMi1kHpPkVrR4LL0BSnZloQp
         CvCoM1MqgRfXHwPH7wEhryD1e15s2ztUjQkhjiiE2TtuJXtDPHyefoccTcMN487iASgb
         svgW6sKLBV6ux6VCZ/GpJ/ZqIaVrsvTMSSrQD1nQd1pg5Zk8A5VX5hh2RAmHOAd7vY4x
         z4YJNEjEWhsHKPm3v8c9iJBOxcM2eMIT2LFtDLfyDR+vnWtjC14yaI30fHjTPBXM/5bq
         NIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729491; x=1796334291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=FjhPkLV+n25P6rEziIdOoqmPG2eyPObYKt8qtwYc1megywBohU2SXZCJ9TzYQKoFtC
         YiVeeAxrCJFCg570Owcsb7YBiNML2Ycmg5GxCheOFQwBgzdnnqhALfTOJLOKQPQjX9ZI
         qSQqxrBh+5gA1mPSX5qXZ5OIjeoVkZvqj+Xe39cEsPpu73miEX8hT6ngzco61DVZ9BL6
         jV8RQiYLRMDVVS87+BGiqYD9OEt+wDfzmeMBkIFBUr/xpvx6nF/+sKi5w0zKKjvHHIeq
         5MciHESGzOqr1x3O6X4ZP4fuggOHbUXVK/m7JLgj/D6mM5KPk1uHPBD4ebrURAdixUJt
         hcyA==
X-Forwarded-Encrypted: i=1; AL+hErF35lgTnbhwVhpelsefRfifayPbUnc4vYbnUcD5VOSISGyhovl+Ze5jjGnwNx8ap0GYJN+D69YS1Ci+XA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+aK4T6nK9Lc9+NxfYjo4qZFE2pMfzja3A+SdmUHA4fjkBX5FHR
	DKLVKtUVChaNBMC+J7/QsEh2N/c2MqSVZQg9wWq8sQRSVlzg9LkX5ZAW
X-Gm-Gg: AZFdTZfRxy8z0qpvu4HZGszxIwn6DZNv+mu9JioyywOZTulAQOL3XMnhCBXpxDu3V/W
	0eeZiF6hpYzJeDanxWdGrCKsn8e3A2LjvL3IYjnpWAGw2Mpt4N0NG88gbgtC+gF95g678QMbChi
	s5k4EfjxOWQGD11YnjuIdHRcOcP10hxRumGAkqog9UHX/aF7913OKCHkzFgo1I1ET41Xus4SiU4
	FJHoBAjX+zfFJnu9pGapYuKxQuV4FQnXhFmM/gHNAZ9U6sgYTvODdk8KCkzuapreEvoX6QE1Vhc
	KhkLG5lFVjkhut3fx1eGJiTHB4DU2VimW2CNSIyntFPRpKYp3E6lE3En5Q4xVfmYBHv1XaB/8wg
	LgE3nF4ZU6gJrEN1Do48ENE7r0t0cH6fsDwbLOFaviUEPyL5ieekERdQZ9cImV2RrVnC4xXvK6H
	H/6po52SqR3WlEy+CcLqH2NRjA0LYz0GOrE4MRBPGdqi7THfBGKnlTHSv8K7OePCqdmDMrY3JEy
	coZi67W5GgIiZNbx+q3t/eYSG74qCmHjU12a+vcyG9VMjK6VfLEKPYRRYjUgjQsrGnicDKbdJMl
	E55RJe9//d48sk0qGRkN68ZHuei6bQkVffO+PsH3SurW2qa5eW0rD1EI9cMeif54XCEa2chsthc
	XEb4y9bFxLkypOETXCpCcShSfvXOQF/R+NJVqQZ6n3vKAx4vkE1so/68Zbz3e5ZEx9YPh7K1nLj
	C0iBi/UZACA7X1HhkCBxzLD5u16GeaEYjyDY03PErAwGXMh7LuK9T2aKp0k0G+NJYvGpoNuIbWi
	mB57qK1bDZchw8MOsZDGHtqKFZJzba/crLx0tFCPw==
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr445462945e9.17.1795729490644;
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] drm/sun4i: Add support for H616 HDMI PHY
Date: Thu, 26 Nov 2026 22:44:30 +0100
Message-ID: <20261126214433.3562326-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

H616 HDMI PHY is a standard Synopsys HDMI 2.0 TX PHY, like on H6, but it
needs its own configuration table. Values are taken from the BSP.

The BSP also sets undocumented bit 15 of MSM_CTRL at 594 MHz. 4K@60 works
fine without it, same as on H6, so it's left out.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 170 +++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 0d284804e11f..8bef4806c65b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -124,6 +124,165 @@ static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
+/*
+ * Values are from the BSP. Like on H6, PLL settings depend on the TMDS clock
+ * band. The BSP has its own values for CEA clocks, which also apply to
+ * their 1000/1001 variants. PLLGMPCTRL is always 3.
+ */
+static const struct dw_hdmi_mpll_config sun50i_h616_mpll_cfg[] = {
+	{
+		30666000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40f3, 0x0003 },
+		},
+	},
+	{
+		36800000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		46000000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		61333000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		73600000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		92000000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		122666000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		147200000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		184000000, {
+			{ 0x0051, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		226666000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		272000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		340000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		593400000, {
+			{ 0x1a40, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		594000000, {
+			{ 0x1a7c, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		~0UL, {
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+		},
+	}
+};
+
+static const struct dw_hdmi_curr_ctrl sun50i_h616_cur_ctr[] = {
+	/* pixelclk    bpp8    bpp10   bpp12 */
+	{ 26995000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 27032000,  { 0x0012, 0x0000, 0x0000 }, },
+	{ 30666000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 36800000,  { 0x0000, 0x0000, 0x0008 }, },
+	{ 46000000,  { 0x0000, 0x0008, 0x0008 }, },
+	{ 61333000,  { 0x0008, 0x0008, 0x0008 }, },
+	{ 73600000,  { 0x0008, 0x0008, 0x001b }, },
+	{ 74175000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 74250000,  { 0x0013, 0x0013, 0x0013 }, },
+	{ 92000000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 122666000, { 0x001b, 0x001a, 0x001b }, },
+	{ 147200000, { 0x001b, 0x001a, 0x0034 }, },
+	{ 148350000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 148500000, { 0x0019, 0x0019, 0x0019 }, },
+	{ 184000000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 226666000, { 0x0036, 0x0033, 0x0034 }, },
+	{ 272000000, { 0x0036, 0x0033, 0x001b }, },
+	{ 296700000, { 0x0036, 0x001b, 0x001b }, },
+	{ 297000000, { 0x0019, 0x001b, 0x0019 }, },
+	{ 340000000, { 0x0036, 0x001b, 0x001b }, },
+	{ 593400000, { 0x003f, 0x001b, 0x001b }, },
+	{ 594000000, { 0x0010, 0x001b, 0x001b }, },
+	{ ~0UL,       { 0x0000, 0x0000, 0x0000 }, }
+};
+
+static const struct dw_hdmi_phy_config sun50i_h616_phy_config[] = {
+	/*pixelclk   symbol   term   vlev*/
+	{ 26995000,  0x8009, 0x0004, 0x0232 },
+	{ 27032000,  0x8009, 0x0007, 0x02b0 },
+	{ 74175000,  0x8009, 0x0004, 0x0232 },
+	{ 74250000,  0x8019, 0x0004, 0x0290 },
+	{ 148250000, 0x8009, 0x0004, 0x0232 },
+	{ 148350000, 0x8009, 0x0004, 0x0230 },
+	{ 148500000, 0x8019, 0x0004, 0x0290 },
+	{ 218250000, 0x8009, 0x0004, 0x0230 },
+	{ 288000000, 0x8009, 0x0004, 0x0273 },
+	{ 296700000, 0x8029, 0x0004, 0x0273 },
+	{ 297000000, 0x8039, 0x0004, 0x022b },
+	{ 340000000, 0x8029, 0x0004, 0x0273 },
+	{ 593400000, 0x8039, 0x0004, 0x014a },
+	{ 594000000, 0x8029, 0x0000, 0x008a },
+	{ ~0UL,      0x0000, 0x0000, 0x0000 }
+};
+
 static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
 					const struct drm_display_mode *mode)
 {
@@ -626,6 +785,13 @@ static const struct sun8i_hdmi_phy_variant sun50i_h6_hdmi_phy = {
 	.phy_init = &sun50i_hdmi_phy_init_h6,
 };
 
+static const struct sun8i_hdmi_phy_variant sun50i_h616_hdmi_phy = {
+	.cur_ctr  = sun50i_h616_cur_ctr,
+	.mpll_cfg = sun50i_h616_mpll_cfg,
+	.phy_cfg  = sun50i_h616_phy_config,
+	.phy_init = &sun50i_hdmi_phy_init_h6,
+};
+
 static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-hdmi-phy",
@@ -647,6 +813,10 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-hdmi-phy",
 		.data = &sun50i_h6_hdmi_phy,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-hdmi-phy",
+		.data = &sun50i_h616_hdmi_phy,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.43.0

