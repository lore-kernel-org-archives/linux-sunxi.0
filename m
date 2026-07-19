Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18231352A
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495632; cv=none; b=NGs223qxsj+IrnYZ5MyY+549u26p30VDMsuHJ1Dq8oI4CuGhuBrqL+2JET5+BX4CnuZyjBnsZibxyd59Mn4V6puF8a9PpNtn3VbtqxAyz8A93kNixNNG7H+MScmaQJZiUjPjw7dzyoN9WF49gy9pZh0NvY1EMiLqQBxhwiNI2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495632; c=relaxed/simple;
	bh=DDsOXp+Z72kK9qdiLJoanRdwCGRm/6FA5U02/PGt8IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aham9LjW8AeADIlNOgTyC/aCV6pFBrYpHoYXEa/wOOoomeINwfph1v8qAFpkufLjaiBRHsfDUTMsWG+vYMoGqgS3MPD3G5udpAw3eg/JLkIw0/j2X+ZZWybkNWEwnOhYDRAPjZ3sT6AGBQjaZGiBw3ZInFWGiRDpAxbI1ogp8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4iRxZ9E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4iRxZ9E"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11178605e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495629; x=1785100429; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=b4iRxZ9EvJD7YbbPLZacUODZCcRKuVVNZRCdbiAXh19zCY4Zla3l0nx8PkbeVtvR2p
         FoGb1SuEdfCKHUUccxN5l4qZQM/pBIdlCOD6moSXvvhbM+sPekDiEICdsmLm09qJFhk3
         zuOQiNyn/7AUBNudU1Rwc2kD0EZmjYI6/Or/yLkjxXQymtZIOmjcx5oV6k2vi/APZDnd
         s//oFEl4tv2T82H/CoKIm6IIrXCk6LyWXCtFDlekbShrc6rNwvpT/OO+evtTKezX5MW+
         bZN9zNL7vfTxY/TBRBPrFP1UlaJfPHwUxY6nvk9Ri/pmEJT7x0GVLESV7GVcR1G+TX2f
         Y9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495629; x=1785100429;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=IHtE22cX44yru535p1rIQAt/px02Ag6XgkQG3cNfXUfKCs/VGkXkRb7kpJMiUGgHq8
         Nw1xrkj/c+QRFAcbRMDtE5KotJu7dDQKYXrVwnwASmU6heSF9AvO5JZeJNtMR455mg70
         lmkmdirS31DQduMehbo5FFGEGSPI5kXZp+SQAUu6DyKwCbogOHHWyqPTbdw3aPlQ/r+5
         KsjUuaqcwomGmQjEawLtEdHwXOSytG2Y0gUysEacHpg/OzOOtyEevFMt/DQ3ZhZL2YUt
         NpfqJIwYwtJNve52F9XmP8XWRNNMY/Z7Yde64fz2y4d8arsAsf5lIGYMSSuauQ74bfye
         Salg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4I9A6YwWd02fWOPVbO5f87DFwDobBy4XG/uxk0d5OCW4nY9TsRPomXHEGWobL64rfkgm5gxXy4Zae0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFqSUmM0/ZZpUQC4GDTRv6CdnOx/4GxIwpxaHlobHvRYeSLVme
	os6IoXWB6Blke1+UjPvk3GpKMcIP8cJ/gyLJLsiEdLsIYCQAH77fLxK8
X-Gm-Gg: AfdE7ckNB6zU5bpNugiMUrRbbvwM7y2OUiYKeejK0H1QhCmAm10gyJEufDeUEqon68c
	cKhH3ZZzVIjiJa2cN3/RqZYAnIZs/0Ck+Dp74kvbzvvHfBpskKj8YkfE37rCKogX1eRqC08mWoQ
	LBvDYp/EfSBJg2cScMEEH+9DlNk3msVo2afSUvA5a7VIyMBBsdHYb9KF25mycaUHjG7X+kQ8qCK
	OyfpwoGtq26yoBjsgLljFVCZOXk5iJgBdwkkprTIF2fBBrjh8UL6Z44T2IgB9ClgEpoleCF4N0M
	TybIFvW52R4UvyaQf3BZvkI7FpwFhuVvnuihaEaoZyIDTeMCdaG9VyxsNIJlcH5l3YTG/CDsTjU
	C+rKwFwS8LfGipoq8BL2qDNwnYmA77v45VRMAFKs8yu5G5a8VDp22PWcBw9zGFVFaYygUyHXxi1
	8hv65jJ5zwNpYtoNbKTiJxDCeEU4Qx+mzii50k
X-Received: by 2002:a05:600c:4703:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4954e893f8cmr104567935e9.15.1784495629064;
        Sun, 19 Jul 2026 14:13:49 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:48 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 3/4] clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
Date: Sun, 19 Jul 2026 23:13:18 +0200
Message-ID: <20260719211319.982285-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register the existing sunxi-ng mux notifier on pll-gpu so the GPU mod
clock is parked on the fixed pll-periph0-600M output while the PLL is
being reprogrammed, and switched back once it has locked, following the
cpux precedent of other sunxi SoCs.  The mux switch is glitch-free per
the T527 manual (GPU_CLK_REG, "The clock selection supports glitch-free
switch").

Nothing retunes pll-gpu at runtime today (the mux does not propagate
rate requests and all standard OPPs resolve to pll-periph0 outputs),
but the higher speed-bin operating points (648-792 MHz) will need
pll-gpu as a live parent, and any direct clk_set_rate() on the PLL is
now safe.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 979e53e63..4341eb66c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -1667,6 +1667,17 @@ static const u32 pll_regs[] = {
 	SUN55I_A523_PLL_NPU_REG,
 };
 
+/*
+ * Park the GPU on the fixed pll-periph0-600M output while pll-gpu
+ * changes rate; the mux switch is glitch-free (T527 manual, GPU_CLK_REG).
+ */
+static struct ccu_mux_nb sun55i_a523_gpu_nb = {
+	.common		= &gpu_clk.common,
+	.cm		= &gpu_clk.mux,
+	.delay_us	= 1,
+	.bypass_index	= 1, /* pll-periph0-600M */
+};
+
 static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1698,6 +1709,10 @@ static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Reparent the GPU during pll-gpu rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun55i_a523_gpu_nb);
+
 	return 0;
 }
 
-- 
2.47.3

