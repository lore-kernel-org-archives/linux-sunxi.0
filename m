Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089B184524
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142233; cv=none; b=dcgb8efD9zOUh4T8OMceEBTk22MPf1p1SG/6xn2Auy2LRXEgGhRdn8/ciIsIrZFm4oJBImzhk4TN8mvdrbsAhqfHeKFNOi43MxUpowOUDlWt8VPdJ2N8Zoig14mNoE6eYSUONU0t/seL3hlwAWpOd7ppovSZXCa6troaMgr67cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142233; c=relaxed/simple;
	bh=bbjnrJAFI1Tuoyj9/YKdysdZwKiMlXzdNqNKnQzj2gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuZGcLBQhPNU2uiOCXnN9yLV9xWcxFwOe0JIwxl6aEO/twutHSTQxU9MmYp3crJ3uvrmLDDBzwWkoJLcTrzYz3EgQ8nTWWGtCC6elXhCTB7l2a1DOL2QNn3V/AZQYquAxfbj8EjzsAOrpZiCThjvCskOsvlcSoGBOpH17xzGmuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcTjWiKb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcTjWiKb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so36055605e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142230; x=1792747030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljIDRjf0Yief38ZtqYKzP1Y5f3xxiLVfBeA9j6h2kXQ=;
        b=YcTjWiKbK10+A4agdnokBOpK2tzes8gOc1PYCbnHwzGH+M1fk5pVk3NKUdKMM6e3/h
         lSmCqHH6iVywdAXHUsInqEYVnFP15lXTCBmhLjlyW6XfgClsizz/t/JGvCkc30A9bNEn
         cX5wW6nPwUGhRgpdSqR7XqPvArt4L9v3y6lH/g17wuekNWrDGrbZrtEhOlCbtRdBvaP4
         OhAQcocwbpSkGJMTeYbig4q9RAFpp6hJcfpGn7GvUVLZQw4Z65j8wLdd3Ibtaw+Z8LEg
         J/0oYH6PxUPxNqxalZ0sAOhiQ/MWDklOoHXK5yQrsEIxmTfvFrLVl5o1gPSgRvj66nuv
         5KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142230; x=1792747030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ljIDRjf0Yief38ZtqYKzP1Y5f3xxiLVfBeA9j6h2kXQ=;
        b=ryJQFZiWjs6sT9Vm+TiAE6WpUVC9/jPlhxGwvI1H/du3giFkU9nBdQ/iTH7RuVxAFl
         X6ba9ro5bA1i7Df6iCVKM0Q0ZCAYfio8EVvRhvz+DA3HL4IJDWx1L1oqc0rIKHmODbBJ
         Fcr5v31R+L3YjMmDTexg2/19dWBfjNrRAaJynVbHG9h6RK17rh+/3AeSL5RoNguwG8Fh
         S9zfWFJi63mzwfLKCtj4SyP5GfijcMG/J+GFGA7fzIy2mnaP8LghdLblZcN1WAXNWJbT
         H+DHxK+moydF9bCwyxuWip2t55PAwDM1dxZ4QayRdBEjrRN/aqaIDnPp7ynLsBFOyBnw
         BrWw==
X-Forwarded-Encrypted: i=1; AKwUvBx+dw/sfapw1Uvez6h2MWfUVFMMzyYzaeY1C0TCIaCHe4p6kllDmzRs652rE49d35QwXeZ9j+VXR/D0eA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKyx3Pq4aW3q5wgWt0i3zzr0jurSkMkm82N0Ti/cvUL8G2cIZRV
	byqY6YTd0GLrLsJZDXOZ6bF9nMMEqL4LRNYDiipOOXjyXJeTcGHTm97bUXXJnl/GMcsiGQ==
X-Gm-Gg: AYBFou3Q97MHvkWf5Zyne7X7BQofb7Qc55I0XS9+XCNlfobYQW7tdO7BQpUh2huL6fN
	5iCk4xyc6PjTOKmRB6cAr5pb02YWDDEYcvXcdgdC3Cpx0hyvzi4Jy3u2iBGLJWm8KYXmOTOoHlE
	jqc+F6x6z1oVe1mlwOabLHJDOOv1HJpoi6Lhzi+2s5r2RJD+1cvqCIcun2SwFkNw0xEcpHQJmFw
	j+wBXGNkUhdTd2dQ3yqMrze+a6oaUEbXiGYhKEqM4MvFDWDAvPpY03rfwuVNaHrMatsD9+YC8P+
	2l6Z8dcbU5J5wsqgtxoSsYJ78/wC2MAzPAPMkQxylaZ4t8ocy03W/rY3eRSyd/P/dkx9rkwnuOt
	cagRqCU5/Hfuur71IZ0iH75U0YxNNVN1CgbN5wqy7Pck2xEyCKwJgPg4Wg6RuuRtK653PmD7Ai5
	vv2xcy3VmCugHwsm+eC7rDtucKHwjLPMAAqL8NvVMJ4eI47WGkFfVteBM/ROA=
X-Received: by 2002:a05:600c:3ba3:b0:4a1:d15e:792f with SMTP id 5b1f17b1804b1-4a1d15e7d43mr15824855e9.12.1792142230452;
        Fri, 16 Oct 2026 02:17:10 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:17:08 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/7] pinctrl: sunxi: add the Allwinner B288 PIO
Date: Fri, 16 Oct 2026 10:16:06 +0100
Message-ID: <20261016091608.121842-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016091608.121842-1-pmazzini@gmail.com>
References: <20261016091608.121842-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pin functions used by the PocketBook Verse.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig         |  5 +++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 54314992299..748a4140fbd 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -54,6 +54,11 @@ config PINCTRL_SUN8I_A33
 	default MACH_SUN8I_A33
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I_B288
+	select PINCTRL_SUNXI
+
 config PINCTRL_SUN8I_A83T
 	bool "Support for the Allwinner A83T PIO"
 	default MACH_SUN8I_A83T
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index ab4e88c9918..29219c11b93 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -448,6 +448,22 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun8i_a33_pinctrl_desc = {
 	.num_banks	= 8,
 };
 
+static const struct sunxi_pinctrl_function sun8i_b288_pinctrl_functions[] = {
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "i2c0",	2 },	/* PB6-PB7 */
+	{ "mmc0",	2 },	/* PF0-PF5 */
+	{ "mmc3",	5 },	/* PC1, PC4-PC14 */
+	{ "uart0",	2 },	/* PB4-PB5 */
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun8i_b288_pinctrl_desc = {
+	.functions	= sun8i_b288_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun8i_b288_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_A,
+	.num_banks	= 7,
+};
+
 static const struct sunxi_pinctrl_function sun8i_a83t_pinctrl_functions[] = {
 	{ "gmac",	4 },	/* PD2-PD23 */
 	{ "gpio_in",	0 },
@@ -912,6 +928,12 @@ static const struct udevice_id sunxi_pinctrl_ids[] = {
 		.data = (ulong)&sun8i_a33_pinctrl_desc,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_SUN8I_B288
+	{
+		.compatible = "allwinner,sun8i-b288-pinctrl",
+		.data = (ulong)&sun8i_b288_pinctrl_desc,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_SUN8I_A83T
 	{
 		.compatible = "allwinner,sun8i-a83t-pinctrl",
-- 
2.52.0

