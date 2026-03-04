Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB8376BDE
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595853; cv=none; b=X+aXyZ9zVObPN9v50H0fIL/H/xrnQfNFZlb2Nq7cJ7G7/hYhI1eHGonwDTZ8EZFGEvakJ/lWkuLd7BBlBHbunRV0hIaSoYZ9iP6C/2y141kExcw3QD7STLze81k/DAG1jaVNga8Hd5wOlbHu3JivuewOff1zDnohK80heW/JzOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595853; c=relaxed/simple;
	bh=V3nE+XT6gJM1djPOVmmoXLkSIGNlRHxcehnXAsYeJSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfVBAp+bvslhlURpIHAqNCo7noD/o0ReURLeY/WoVOj3Z4Qjb7cTKegLYypBuNRl/2Cn/37aeZs6rN4U6/fvReKUcjfgY8gvC6vqRdWDSO4q47KrTo3HyqTsr8Xee1pi2XFAD5qd/T6neCk5WNYFgi/6tSu8MTG1p6wBNNSr68U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYVgsuDb; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYVgsuDb"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5033387c80aso91556651cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 19:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595851; x=1773200651; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmZUdiZZg0fCj/2i+g2j9xmvk9n9CjWeVFiVPCHQNYY=;
        b=cYVgsuDbQVBdxxs7t8G0BmdFOi+OouN9UXGzghza+47AjqTRaBYVfwZjxmLqDWcKUs
         tjaCc1bhy5oMnpRGkNrL1M1T2DYnsaKTPK6PjRtBXnSq0U03WRgpGK3WGySWWk9rn7P5
         WZiNMpJFLVN2YDcwut5VQmortMtY7mTduv7aufEeKIhgU/nGaWQeiRPjaoHqsVV/iH92
         4yezGlXRfA9iIvEyUfJL2vXoz9miXytT+dzMLNX79kk49CqLWRLKw/GwTRfs1d5vnHc8
         eyvsHcqyJ12YwOGsi82Srbk6lmRRWSGSEgfE31F50EJIzm4V5a/nJofF2FTgZ5fvRw8i
         6nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595851; x=1773200651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZmZUdiZZg0fCj/2i+g2j9xmvk9n9CjWeVFiVPCHQNYY=;
        b=cBH1JN3LV0OIPEyV2IzoNNUp9yUOA5aspNzPReQ14Jv9nzQQci6TmwrO4e8yTmd0nY
         mKijCBO6jAudsTZeTEOKkblBsZJT5Eo9pemM/wIxrNVdQ5lBMUkGmKJv3wmUXbm9bX1D
         k9k2h9ml3g9OkvdPMRcpAZOZo5iC/P9ZACkYtei1gipqIklMy7FTcEpn4lnl2mVUcgus
         wgiwHs94ukP0TcJ3ISkgSf5gri2KFvRop/vkMy8n5pLUbiFrdUd7jFkpuYOeUki8zB8t
         AdeqFs60s6lCdIzzMbOHfNsq/2FYTytu1gESIQCramFvGYMTVkRW0lKUXvwlQSS0ep0S
         kQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNhNQYwp67kQF0hRJpUCy/J9eae0xofu7pzwPamPEAslX7k/NKOfUYmvlE8CGgrEi6gUF9KIGxdIsREA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzydoin4x+b5nmHo/5JCjYcgDmInEjTrnlshaGmGrVH+GZbN8mK
	loVD00J9YFeFw/eMKVYVnUAJQVlMD69Q4NFAZcvByBGf21DwafCDBYbR
X-Gm-Gg: ATEYQzzWtiHxXTNgm+pYDhUGzytP37yQEkB9WMhFUFPX+47cerlgeUX2JDgtXK8BU/I
	oLYUqz8dBH3EPI9gW17jYhreZKS1NbX6xtgAIwsyftuotewxC4XwvwM4lJA56R/sPjeq2A58j5y
	wxzd+fZ+vMe6Fq43CZNfD65KJOw5nf4NO2/cv9hZVu4b4i4SEhgLa1osSS7nXBPSq4Krvzcq/gN
	SvI0SUtw7Toji7Ei58JwE+EiE+0XU3+a/Fk79cscmL/kMb8nGhS6oWbqCBwqX3G4ShAAf/mFtQz
	3GyuAOSreDJ49e6ALLl20IqEkPs9YcscCLTtnFkN31JNU3Q/xZ9kBBr+LduOYmyA9Ryllwisa1i
	BX1f4CkL0nTcKTP4GHsi1twsAi9rLKKMOn1rhjYItApkFBh/lxWcCczuVfoWpL+7EFYwLQ13y1g
	ehprbNe5T6wBU0ndvh+mupyI+Mpog=
X-Received: by 2002:a05:622a:1490:b0:501:4b9d:ad19 with SMTP id d75a77b69052e-508cea9b44fmr52007601cf.22.1772595851140;
        Tue, 03 Mar 2026 19:44:11 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm88603286d6.14.2026.03.03.19.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:44:10 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 04 Mar 2026 03:43:45 +0000
Subject: [PATCH 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-b4-pck600-a733-v1-2-2f54efdb8cc2@gmail.com>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
In-Reply-To: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3

The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
customized version of ARM PCK-600 power controller. It shares
the same BSP driver with A523. According to the BSP provided
by Radxa, unlike A523, it doesn't require reset.

Make reset optional in the sunxi pck600 driver and add support
for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 53 ++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index c7ab51514531..8f9fdc3915bd 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -52,6 +52,7 @@ struct sunxi_pck600_desc {
 	u32 logic_power_switch0_delay;
 	u32 logic_power_switch1_delay;
 	u32 off2on_delay;
+	bool has_rst_clk;
 };
 
 struct sunxi_pck600_pd {
@@ -151,9 +152,11 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	rst = devm_reset_control_get_exclusive_released(dev, NULL);
-	if (IS_ERR(rst))
-		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
+	if (desc->has_rst_clk) {
+		rst = devm_reset_control_get_exclusive_released(dev, NULL);
+		if (IS_ERR(rst))
+			return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
+	}
 
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
@@ -193,7 +196,14 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 }
 
 static const char * const sun55i_a523_pck600_pd_names[] = {
-	"VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
+	"VE",
+	"GPU",
+	"VI",
+	"VO0",
+	"VO1",
+	"DE",
+	"NAND",
+	"PCIE",
 };
 
 static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
@@ -206,7 +216,36 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
 	.device_ctrl1_delay = 0xffff,
 	.logic_power_switch0_delay = 0x8080808,
 	.logic_power_switch1_delay = 0x808,
-	.off2on_delay = 0x8
+	.off2on_delay = 0x8,
+	.has_rst_clk = true,
+};
+
+static const char * const sun60i_a733_pck600_pd_names[] = {
+	"VI",
+	"DE_SYS",
+	"VE_DEC",
+	"VE_ENC",
+	"NPU",
+	"GPU_TOP",
+	"GPU_CORE",
+	"PCIE",
+	"USB2",
+	"VO",
+	"VO1",
+};
+
+static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
+	.pd_names = sun60i_a733_pck600_pd_names,
+	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
+	.logic_power_switch0_delay_offset = 0xc00,
+	.logic_power_switch1_delay_offset = 0xc04,
+	.off2on_delay_offset = 0xc10,
+	.device_ctrl0_delay = 0x1f1f1f,
+	.device_ctrl1_delay = 0x1f1f,
+	.logic_power_switch0_delay = 0x8080808,
+	.logic_power_switch1_delay = 0x808,
+	.off2on_delay = 0x8,
+	.has_rst_clk = false,
 };
 
 static const struct of_device_id sunxi_pck600_of_match[] = {
@@ -214,6 +253,10 @@ static const struct of_device_id sunxi_pck600_of_match[] = {
 		.compatible	= "allwinner,sun55i-a523-pck-600",
 		.data		= &sun55i_a523_pck600_desc,
 	},
+	{
+		.compatible	= "allwinner,sun60i-a733-pck-600",
+		.data		= &sun60i_a733_pck600_desc,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);

-- 
2.53.0

