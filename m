Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729491;
	b=5L/i7mxwE8y9hRYAyp3nnd11ZAZYdEqPG2ySf7ZR7v/90NYlekpUdKWbQs1aInb3h7Ig
	 THjWyZ71yfOBJwa2g4mI615uzz70FQrQr8ZO+UoomrZvfsQp5U/+io/77ndalgJSpjGq2
	 LBpt5dOMJnaN/u7VnrNSvLRJQxNBiCl84uE0E4tR1sZ8ZccBng0VuHBefZdQ/NfG47Eka
	 yNjcS3JSN+6MD9OZWti7QOfNP/VRnFLIQAFm/8PHPpYcQpPEirmqe19JXYA4kJoq1/Qrv
	 kNoTNwBJSeG9S/SkFKrP3ktKTPCiVFNPJzurveRipSDgBzebZ+8DT7JeMgh401arknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
	b=U0EzHduLe+rxYleULsDO3oxBSTrA4L9S+6YKYBOq4V7yoHNyX0HTVzp7d8XbBcaEhRfB
	 CegeN9hbI3nEv6PBE1diB4h42NIGrMufW8/9vEjklKJdG/wUC50UGLkFPntsLvnxgBll+
	 xwDfxkYtVamN3JYmEE3xagIoBUjFR1Prk4s9UOrRK21OCzzEBdtRlqSK428coTAlFcL8B
	 SAClDQvRFORrB8/sgGsrb0mgDfIvfxpo6qS+vokLXBBe6IGC8dfvANO1UP8w2jYc+w2XG
	 kEEsIQL0cjlqG7z2RyjL813B+0g9sMsLLIXbJ3JHO75De+TsXADH64QSG35sZClsqMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXdK+V40;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F060A380B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249F060A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXdK+V40
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3415475f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729489; x=1796334289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=gXdK+V40Tfa4GcZJGC7oNG06e/fxANOtLww9JdNy8dHN9TVFOgMlJXBQnNfH38fsd5
         vWmiBS3zo4kc5FcDYBj863XuctQ4IPVOHGciOD4EYXe+lyevdhXjRI6DkTLdNIPf/DT2
         Qj/F0KZzqaAqa7y+NFwjc5Ek1D9qKPJXz+arVnV+n/kMW/E7FGMDaisRmpYtnz1ljc5C
         j6cxUjBQm3i3LtOu+mOBVbwQZndfkC+XhrPFkQqKzTaKGQWOo+jwg1v8fGNejkidObo2
         nvRcDqziQn0IO1b10kdY7xl9TSS5zt0CMShxzrw3hENol3aasQIlf7FT1xcKnqw34W3m
         yE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729489; x=1796334289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=VQmGfuuK2GStguO6C/gi+yc9gONR+pJzZHGfu2pvVN27Hdw7waypnfg0q64ZYhlNKc
         938EBPNiLAWOcIevFSc6h3YSBnzjwHGFah+h96EwPbyILhhy/i/4nUMmH0awrJqcRYBu
         uRBv2Lf++w8CghPWs9NAlyvXszJdB3dkcgW4x1ZzU+BkJ6enAxzJv1UsalHL4DAN+Exp
         BNQbaGQddO4n9WGa/uXtrZhUBUDODp/EfmszwV2reRpcduLy7JRgOiBLyN8Exl4zsMp4
         DjRSPzI0jyDKvkYbMxTTYBDpBeTXG0xLuYpaOdCdJaOrPTwJQUBISWVAmWDUWaj6hMh7
         CvTg==
X-Forwarded-Encrypted: i=1; AL+hErGXZDXTei3LQKCW7NAeiqa8H8ID5FHR8sjKb5b7PwkdtiTlbmMzLCf12tjbgcVeio+elKQ7NFFVyZXo0w==@lists.linux.dev
X-Gm-Message-State: APuU4Z98c249xOT2/c2p+YF4GLkqS93aaxwbfs49K3kYmD+IkMCVp32j
	B35504iz/n7vFDXi6LccXwc9jzWNEFaZv/VE2z+QNYfACL6/t1py1B349T1j1Q==
X-Gm-Gg: AZFdTZePPdXL3jesUc19WsXqF1A3Dr35HfrY1PGptF0f+wv8IaOiprAer/3qDpXzn/i
	mmO8qzv4e9vvKnI8Y5U96pDTgkmfuyU5R0o9L76CE/VhG75CvdkGgs2HwwNVV0vWWFZ3ksE1Mg2
	LJ5W0NTJSb2GQhraPHNej/C/vN5zf2oXQiCkUfC5tLCiGt+0EqOZAalEXeZfDd4353nGwxspn09
	tyYY1KzGhETvAn1o1UuKfZBBKUQeYZyjEGkaapiSNy9FJBB0x6y0zFbcyMpyY8s/xy2nGjEXPNv
	+1BUgrevIWBR8RTSKSTcuG0hPL6kveuzfen7O1Ml/pGOgIg03SNg/CrGCMSI2jHsV6NX/HkRTSK
	TuNcq5Wk+0mhvZyUiCm3/hIHqbduwXEDmSl/DCc4021lCn/4CvlmFBC9vvBpATKwrohujoIYgln
	28pfOMvkLIqcmvEjH195mWFx9Dh4QaxbwyBYJG0pQibNYpG0KBZky2V+uLyswOAnqNHZZ/xstAh
	5enyUEETP1P03YLipdu4erBykN1zGNa8w8e/Z6t1ktv7psV2Lhebq4PvZ+zm4SkET3jx01Hawme
	WErc8U3VARxVkRwn49++z3OQENVwjMddjZE5DXPh5b7LzzXd+JYA1v7pGRTxZqt8vX+hGs69vws
	lRYh4ZpD/u8TWAWIqrK2mKdTevKvXbX2HtqpqXxSZH8hvs/oURo7HCCOBTQaTepq347ZKMhMjTd
	uiKfoY9fe2Ai/SjmQGpUFFc+ippI8IWBOEkwgdy/Ly3nL62+8ZsL5oLG9vr8JOL9D5liwy7FCdq
	5vtfXOrdc9J0lmbmcu/hEDJbWlnL7YKvN633vqdVeo=
X-Received: by 2002:a05:6000:2406:b0:4af:e519:ccd1 with SMTP id ffacd0b85a97d-4afe519ced4mr37199366f8f.49.1795729489344;
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
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
Subject: [PATCH 07/11] drm/sun4i: Add H616 TCON TV support
Date: Thu, 26 Nov 2026 22:44:29 +0100
Message-ID: <20261126214433.3562326-8-jernej.skrabec@gmail.com>
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

It needs additional quirk to enable HDMI pads.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0cbd6ae66c4e..3596537c500b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1297,6 +1297,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 				   tcon->id);
 	}
 
+	if (tcon->quirks->hdmi_pad)
+		regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
+				   SUN4I_TCON_GCTL_PAD_SEL,
+				   SUN4I_TCON_GCTL_PAD_SEL);
+
 	list_add_tail(&tcon->list, &drv->tcon_list);
 
 	return 0;
@@ -1585,6 +1590,13 @@ static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
 };
 
+static const struct sun4i_tcon_quirks sun50i_h616_tv_quirks = {
+	.has_channel_1		= true,
+	.polarity_in_ch0	= true,
+	.hdmi_pad		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1605,6 +1617,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
+	{ .compatible = "allwinner,sun50i-h616-tcon-tv", .data = &sun50i_h616_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a..98bee2bd96d2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -19,6 +19,7 @@
 
 #define SUN4I_TCON_GCTL_REG			0x0
 #define SUN4I_TCON_GCTL_TCON_ENABLE			BIT(31)
+#define SUN4I_TCON_GCTL_PAD_SEL				BIT(1)
 #define SUN4I_TCON_GCTL_IOMAP_MASK			BIT(0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON1			(1 << 0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON0			(0 << 0)
@@ -243,6 +244,7 @@ struct sun4i_tcon_quirks {
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
 	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
+	bool	hdmi_pad;	/* h616 has to enable pad for HDMI */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */
-- 
2.43.0

