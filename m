Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D44CE68F
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232112; cv=none; b=NfCsXGrRQtSXy19U3/XAKFaD9we4Fp9fUMW/t2FpSAddORNCNnEHAcAa4GLSaUI/aWcMYZQLWKbydvyO3sjVp2N50zYYjrCx0gLDq9G3UxAi5CUEMYFh23AYkmUsYRtN/wD26cLRu7Gf94uCX+AMNrQT4d4IufcCYHIEBwqY1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232112; c=relaxed/simple;
	bh=NZEhLjw5bMgmkKPM3eQxIzDQex+0YWm9iF8idBHlWBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsLZVmjWxI3T7ghhF1hX8d+QfzFvvGwUSiX/h+qWyt855T6Q/u//L9ceLVaofn59QSd290Qioy35mtxsyTW9pYZZne8CMDzzWE1irDfjKmPWis4bnNqCir6RTmsaK9yFtlOyxy9sCgCXGnSt08WdyIu8xe5voCqLamh/OVlsaYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkkwPM86; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkkwPM86"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb91ecaccso3446874a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232096; x=1791836896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=CkkwPM86DouKJ3GUEzqSBSu+yE89Zbf5i8gz1hxr3cUwpySpokTMiqIpUMh0+alIAb
         HTI2YId8HQbvNHkoGkb3FAtCyoKY1BZCEmPkj06yILI4d34CnF9sKYwITb0LyTDFtqdp
         J8bCzhPIBjLvZQwrl6W8PIqRJqExMQPlmybPPhCPixvuKdwxH/bHtYu0e3FW6rObcC5D
         zDkhRBH6Q7ygPMTQq5PxDF6R5Tu3kuTr6YSBAPIH39tyfgTHLjzzmKZJy199i4DvN1ZX
         kMFvylg/dDiPhNBCk41C98pO9zInwZZDY1K6Qes7REEqv2CgfSSrKcOjhxAtM2bbMOA+
         pCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232096; x=1791836896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMBmc+FSRsvVu6rZt6CiLXXT+vdxKxbXygP51xvHLZQ=;
        b=WPnA/uUedVM8YJCSXV/jEc300Lju4/gTOYripIhAM12uecMxsBG3cdikk2KopQRbsV
         xOyCGN18yh9MJ3fvYDVgY+8B7L3fQV8aiWY9aSbDdoC5ZMorv9XnZhz9tuBm1SSJhQb/
         ZyG62TKyhGLho3LkugPVvRI4OzV8gW0cH3EqJ0zHfW4T107tsEEtv6ik3AsFmo+vMIOJ
         f8z622OV2GZKRZRdyizKGYxU5tPKTqqxZdIMUsTBcBE7pGFxqXIORQIPnTTZU3fP+M4G
         VD2+7ks2pJ4r9EQXJX3QISNgzDpg/R0Kwl+sqABBY0P3W2HEmyN6I/s9zJ4Dj4vsJGfB
         tOQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxULKUJ48zOuVYaUWoIFC4yZuYoLKEG+xzouYMB0uX40mbrXWy5QLIoAKOEhUJiaQl0VCMRwEI177KEWg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJndunN+u8jSCSvae+T9nKm5hvRKzHue8qfhxpHLMp6bZG+rZOG
	CdV5FEW4J5ZVs+QqXd5Tn4ho4AKIo769WWUCSGdSkBlFivR3mLb6nwj7
X-Gm-Gg: AYBFou3/mevDOjGiVsWl4ycwAPA3e7D5zuOtOxPEIHl52BFAE6UAxP8fyT6uJKXhbf1
	45HdssMvR0N8MJMPBoqf8mAD+lcuQP6V+sXfpHc5tYfzR9pmlIWppw427UmN2Wj1o7xAeAQSiI8
	b/Rhl3HsTWb1Qwh6QFiqzsG5KkhcSuhJWtkP1w/pIlzaRue75o2aWe6ro1jSfrT3qn16jy/Ludk
	FkBZsGxDmAZlSODb9+6Zs2pbuEesItPUhNnjHLFILeI8czvBQqOBRNbTHoPodOo/woNq4pAiz/w
	Sr/RcdVJTqduMMhqMtCjWXBGTBDHTkNLQJ/Pnl/evfYRx97DPPJmWLwusMG83zC/kkq24yTOH1z
	RxrM8F21QnSibpDDyd1BRfq8XDhUCdm014OvJL07GfX7iLaZ/DHWuZbqQE8Qo67ztDaSr9KmosO
	niitHloHsW8IKjgqsw0UJyLA4tPVK+wVBP2IJ+OZzT0HrFJYteTRjReDBMqMliZv12EgCgAEjTU
	DvS6r0OyuepNdjqK7EkY8S+LU7fQZzk
X-Received: by 2002:a05:6402:360e:b0:6ac:72dc:c3af with SMTP id 4fb4d7f45d1cf-6af9e373012mr9651907a12.38.1791232096315;
        Mon, 05 Oct 2026 13:28:16 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:14 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:25 +0100
Message-ID: <20261005202731.153971-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0

