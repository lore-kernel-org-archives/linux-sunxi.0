Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510A43231D
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780483; cv=none; b=XDAhzGWbuMUQDtaqEd4qavLEPdKHEJwA7K7GpCo2IN7cPSde2x0VN2WCb+48MdrZcYMuvebkiVr6o4J5lMxS+W1Awd45oaYIT+XNxQXV72aUgBbMUvnz7wdTNw/+xubTBLmupQFGSlXNSRExvPOOrQJmZqMr3jcqOO4F35nsoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780483; c=relaxed/simple;
	bh=BSB4UnGDRrRR4Js+ooR6Net/lkxWGmujNaDgBq+f7LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YLAb5KpzwPWZdiBb7DZ6+i33Z4WuxRkaXYQFbz4JDp7Oi/5AiUwELSmYPYKtDtfWZGsIvn8/V99PBRwDaOkgUZGTkebm5DVovhF2NSUpz9ikN+YbH/oMCTMhPHunScs7rhXMsxxKWFQaCTr1ZJz8EckmAknZH5DNVz8MexWMmtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6856Tji; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6856Tji"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so14439405e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 11:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780480; x=1786385280; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FlevvmCUo3pvNfguYi3e7oT4YWOah6gzuJqciMeBMs=;
        b=P6856TjiXc37kbu2OaFESunXQ2hJM+5DG2wVz78Kgt8sYwTQ1zX6P3TDsiAde6tCVF
         h+ppsUGEOJa+n2ZZ9lKWETt3+47LXdlNHnMf9I1vzeFmmeg7/XaPAoeAWj15rB3BpaE0
         AuVKbi1lKOFiyGbtdb1PSZ00lKk2SK/yngP5N27PA+Z44DDBKe4FRpxV8qsOSh0nG02/
         bKRRSIgwCdGT3SyO0YtzNhxePTsHlMQiaUYfcI6RAjL8cakJ1W49yNd5MoVfP4no7Nfu
         929Y/YqkYvFwMXnejZVupqd+/7WoBhPSrf30htKr+2TfhnXmDVwsCMxFluYj0LAWJ5JL
         +YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780480; x=1786385280;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FlevvmCUo3pvNfguYi3e7oT4YWOah6gzuJqciMeBMs=;
        b=RSMVZ7lpF819Ul63EMM5/wCOtPxbrLrdIrCu+iRykY+NQakw6z70GMgciPA673eOfO
         uQ/TBkzqVHHAt3xo21dBZ9c55l5NQr4DEr1wSk2gmn3PtFPEJM+mEjXhaOvbqjXRhH2r
         UJ7Q6AI9k2Q4P4fcnqFJKLSryC3LFTWQo5sC3Xge+Gwmc9ihAZZmuzXvEuPpxaKirjWS
         3GbH58jtczQcgep+JtJJ1I7XF7dAyk80T5pRJJfRUelVROR+xHeg2g7R/o8Su/jVvrKU
         qy8h2pw2KSu32OjdCRv8yjH3RgXmDJ+jqUIKBJs4zcplK8rz/rBkzjPotmlls73ooCGd
         yT2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp5bJ2TGZKu5gTwX1nVwe1l34xmIp8XRgvQfr9YDt+oQ68ydWVDWZmeHHBm9/obytQLF4WpVRl2AYMz2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG7aEVPJOT+gNqN0GgToNG321JzsAiupyokEncmE7Mf8ntXWNl
	2pizz3L1MLPcCdG1VX86uML6yqLSBNp0vMhFcWrAHOgzWnYPlV7R2e8t
X-Gm-Gg: AR+sD11Y9P0Nm0WE3buR4SqQ76XQCdI5EC6o/FOhAJgtBUGwcaRJlEMg/O5/xb9XYy7
	B1gCvyNM3lNBAH6Qmp3QpoJ2tSxHEYcUxlsuZHBhsjew/CN9XAeI0K3o/GIMmFtF8rUK0BmumZH
	6qyOZNl30vkJWSwng4Ur1qfG8NAonS9OHebF+U1zkYMAVEfGGU/38RM7bWuZvKyrx90PXinEZ2y
	IxFu0W9rJFslYLWq3yPRbJ75HkhafZ92BdrZtPzG3WnPdmZJ8pmlHUfn/mhBLrQEkOxEbijAJGm
	D6352Fov5WdChnBIN/Ocv268n553SycOUtBUGV9stkBZID7K8ggaHqC6dZPDelZ4YySLrSO/BnQ
	Ma0kLeiSigNWSCzJiFPM+JIyCQA6iLxy5kQUx/tEvW5A32PvSxIf18LroUtn/6dpzx2Sq6pZaSZ
	ZlPnmAqVgTEE1U1cumYuJtEPD4OJ3UeyOhWoFYAhM/f3BIpflaCBAntMXQc/8mjzcJ5DEb9mvW4
	dzLx6TrI1XlHoI6b2S5ovI=
X-Received: by 2002:a05:600c:6209:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-4980c649f67mr273458325e9.4.1785780479424;
        Mon, 03 Aug 2026 11:07:59 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:07:58 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 0/3] clk: sunxi-ng: fix the A523/T527 GPU clock model, enable GPU DVFS
Date: Mon,  3 Aug 2026 20:07:52 +0200
Message-ID: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

v2 of the A523/T527 GPU clock series.  v1 is here:
https://lore.kernel.org/linux-sunxi/20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com/

The GPU mod clock is not a linear M+1 divider: the M factor masks M pulses
out of every 16 parent cycles, so rate = parent * (16 - M) / 16 (T527 user
manual v0.92, section 2.7.6.58).  Modelling it with ccu_div programs a faster
clock than requested for every M > 0, which is what mainline does today.

Measured on an Orange Pi 4A with the Mali cycle counter, the OPPs labelled
150/200/300/400 MHz were really running at 487/648/560/750 MHz, and thermal
throttling to "400" actually raised the clock to 750.  With this series the
same measurement gives 149/199/300/399/597 MHz.

Changes since v1:

 - Dropped the pll-gpu reparenting notifier (patch 3/4 in v1).  I wrote it
   when the plan for the higher speed-bin points was to retune pll-gpu at
   runtime: it parked the GPU on the fixed pll-periph0-600M output while the
   PLL was being reprogrammed, so the GPU would never see it relocking.  That
   plan has been superseded.  The maskdiv in patch 1 can divide any parent
   down, and the speed-bin work on top of it (first follow-up below) pins
   pll-gpu once via assigned-clock-rates and reaches every operating point by
   moving only the mux and the divider.  The PLL therefore never changes rate
   at runtime, the notifier can never fire, and gpu_clk deliberately does not
   set CLK_SET_RATE_PARENT either.  That is how the 696 MHz point runs here
   today, with no notifier.  It would only be needed again if a future series
   reprograms the PLL instead of pinning it.  Chen-Yu, you asked for this
   notifier in the v1 discussion: tell me if you would rather have it now
   anyway and I will put it back.

 - maskdiv: honour CCU_FEATURE_UPDATE_BIT and CCU_FEATURE_KEY_FIELD in
   set_rate, clamp determine_rate() to the request bounds, and document that
   CLK_SET_RATE_PARENT is not supported.  These were folded into patch 1 so
   the new type is correct as introduced, rather than introduced and then
   fixed.  They also address the two issues the CI bot reported on v1.

 - The GPU OPP table moved from the board .dts to sun55i-a523.dtsi, and the
   operating-points-v2 reference now lives in the SoC's GPU node (Chen-Yu).

 - opp-microvolt now uses the <target min max> form, <900000 900000 920000>:
   900 mV is what the BSP universal table specifies, and the 920 mV ceiling
   covers boards whose GPU rail is a fixed 920 mV supply (Chen-Yu).

 - Rebased from v7.2-rc4 onto sunxi/for-next.

Tested on an Orange Pi 4A (T527, 2 GB): rates verified with the Mali cycle
counter under load, thermal-emulation throttling exercised, no job faults.

Two follow-ups are already working on the board and I can send them next.
Tell me which one is more useful to you first, or if you would rather they
waited:

 - GPU operating points above 600 MHz, gated on the SoC speed bin read from
   the SID.  This chip is bin 1, where the vendor table sanctions 696 MHz at
   the same 900 mV; it has been running games here without job faults.

 - The A523/T527 CPU clock unit (ccu-sun55i-a523-cpu.c) and the generic
   sunxi-ng fix it depends on, which is what cpufreq needs on this SoC.  The
   DSU/L3 clock lives in the same unit.

Juan Manuel López Carrillo (3):
  clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
  clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not
    linear
  arm64: dts: allwinner: a523: add GPU OPP table

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  30 +++
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  32 ++-
 drivers/clk/sunxi-ng/ccu_common.h             |   3 +
 drivers/clk/sunxi-ng/ccu_maskdiv.c            | 213 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h            |  76 +++++++
 drivers/clk/sunxi-ng/ccu_mux.c                |   2 -
 7 files changed, 349 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h


base-commit: 859c0e1925332d413ca8f9159c8ca5d04eea32a2
-- 
2.47.3

