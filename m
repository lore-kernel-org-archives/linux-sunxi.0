Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F030F7E8
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495631; cv=none; b=o2zvmVjfpWSx5uqnCuSzsvxeLsctVkKMzX7uqX1dSO4ZMd8r2PExGpAeOtf49CuyVkMKKtNBZiW62ux99bEbQZusY1f/p2fzz4/DxHFzScl98KWRmYq55YaiBHUwNJrKm0HprVt7LIa/azNcATRkGlNH5qU1H8CyMibfQsDVbls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495631; c=relaxed/simple;
	bh=OIQ9wV1fytaPWVFvAnMGv/HqNSfH3VqUaIN7P0RyrC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F52QS2iot9bTifCy0g3yn/VkT+jC5tldRKKMLVsOuAmkDmpghM2BlJ9lm5rnNgDdC00xR1P3D2JdXnXsGlSqH3DvusrAshKWLUZLrr4RgL3TC85q02YacadtT/RenWsaHf/75AF6i9yjNav2YJJ75QrfIY7GBUxea9C1bbCl2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSjCslbi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSjCslbi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so3847275e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495628; x=1785100428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=;
        b=hSjCslbiabGzXl8h5J323K1tKYEZgsWCsawsF8W/8kkDnGke2hM3Rw5qC8tr92XO2F
         7sCqnWWK0/93qz2jqiQQgcG9x+U495HKeRVTZzHyIdFoz+TP0DrP8r9B2Lx0KRNopLuI
         TQpHSHx6nkrSbPdhfuzkg5fRtnCbxiL/vzpL1mC05bNrAit41k3ZXCyOM7v2zL04vaQM
         p0Rr824FjFaX9DsIPYGtkhhhUyjgTLiJft7rDO6AKR+YEwGQbuH51kVo0fxNGAGOTS7d
         45sQrhe7iY7hC1pUq886CzdcoiEXorew5YzGl74I2eLYMQlvHt8J07SNYDWxVnTmtbvb
         iqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495628; x=1785100428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=;
        b=bJEu0E09rGgqRzbbj0UIqazXInguQn99Nq5IU+CpioWzX0ageO/WBG2tqPRlAY4zFi
         1jl1nFN9g3V0e8Jv2/cpQDuNoOvL8DmMCgawTNZXqoqzzAIlmB42hf5MtIZNAEhGJ7u7
         vx0ld8DdLMmsWqO240iik6ZPKRG0w8zmnlFCo44xggT9cVTqc8xFWuVjFiH2DkLuMFnZ
         J8vOlElXm2orwBxunOT1G8gol3epUN9HCxVtdRz5wBPYJWYeJXSKkKg0sWuSpP8mdkrQ
         uodtGWnNp91dU5MYAIaxGYrnwcIgi43jpoDIM+KnaD4SO1NFX74gKuyhqqa8sHWH+lcy
         yaFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrd8AIEaKOJWyaeDMoJQlvZKk+MV0/rEQzYqJN01tidqV78xKgwToGFickyhw/3XBSkydeEuTTUUe+ObQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNEeZ30PXeXYdsIPsxJGuNEEc8XgLyJSOA2nAvJEztnwnExvtR
	4R3pkKSvuxyOERLc2vQ/GuIkFnnQADuajzl8PhsFkG3BQ6KCAd4VtfkQ
X-Gm-Gg: AfdE7clqyvBGccodoH9E2wbIL/dIn1MBe4cIpW02l38I9Cc+4n6gs+/F4hWBQRHYRV4
	ikoZrFsT8bmnzVhLA4ez+ivtKHiSNwkgai1dSW74fm8xP4AdetbI2HW4QqGaQ/fHF8mQsAnYL+l
	ocK8MpUiDgAr5ZRT+OmBqKF6MctpZ0cm+PRHMMV7lK+O3g0qj8g9q51JhlhM7+A2GIXBqT85hyU
	XONajAN9ROdt8g67qd8oGl/aMaaT5Xb/SZX/TXIpmP+lKSRq6R2hD5QgicKScWMPbUaxWUHJmC7
	xHUoeQviuGcdRd/8rDy0mn+5YB7bTdkHRmdko87cg/NKIRffQg6oJYEvQW4iEtnDBuxRdyj4N5P
	k/KVYE8KXLRXGd0g/+j9XgfFv84phTt321bqWvIDfoSUiOPM8JLl4PoeX5VsvRU9Twnu792vS7K
	H0fxGS478356k0Smjf+K5hWIUUDrmZ3gMBBRgcrBORv81JZag=
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr129364555e9.8.1784495627377;
        Sun, 19 Jul 2026 14:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:46 -0700 (PDT)
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
Subject: [PATCH v1 2/4] clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not linear
Date: Sun, 19 Jul 2026 23:13:17 +0200
Message-ID: <20260719211319.982285-3-juanmanuellopezcarrillo@gmail.com>
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

The GPU mod clock (0x670) was modelled as a linear M+1 divider, but the
M factor of this register is a cycle-masking divider: GPU_CLK = Clock
Source * ((16-M)/16) (T527 user manual v0.92, section 2.7.6.58).

With the linear model every OPP that needed M > 0 silently ran the GPU
faster than requested.  Measured on an Orange Pi 4A (T527) with the
Mali cycle counter against the programmed register:

	OPP request	programmed	real rate
	150 MHz		600M, M=3	487.5 MHz
	200 MHz		800M, M=3	650   MHz
	300 MHz		600M, M=1	562.5 MHz
	400 MHz		800M, M=1	750   MHz
	600 MHz		600M, M=0	600   MHz

i.e. the "400 MHz" OPP ran the GPU at 750 MHz, 25% above the vendor
ceiling of 600 MHz, at the low-OPP voltage.  Thermal throttling to
"400 MHz" actually overclocked the GPU.

Switch the clock to the maskdiv type.  With least-masking preference
the vendor OPP set now resolves to 600/400/300/200 MHz taken undivided
from their periph outputs and 150 MHz = pll-periph0-200M * 12/16, all
verified exact on hardware with the same cycle-counter method.

Drop pll-periph0-800M from the selectable parents (the mux table skips
hardware index 1): the vendor BSP removed it from its parent list with
the comment "If GPU use pll-peri0-800m, gpu will occur job fault", and
with the masking semantics every vendor OPP matches exactly from the
800M parent first, so it would otherwise always be chosen.

Also drop CLK_SET_RATE_PARENT: every OPP is reachable from the fixed
pll-periph0 outputs, and pll-gpu must never be reprogrammed through this
mux.  Once the GPU moves off pll-gpu the PLL is no longer prepared, so
it loses the rate protection of CLK_SET_RATE_GATE; a propagated rate
request would then reprogram the PLL while its gate is off (the lock
bit never asserts, 70 ms poll timeout per transition) and switch the
running GPU onto it before it locks.

Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 32 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b3..979e53e63 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -21,6 +21,7 @@
 
 #include "ccu_div.h"
 #include "ccu_gate.h"
+#include "ccu_maskdiv.h"
 #include "ccu_mp.h"
 #include "ccu_mult.h"
 #include "ccu_nk.h"
@@ -442,18 +443,37 @@ static SUNXI_CCU_GATE_HWS(bus_g2d_clk, "bus-g2d", ahb_hws, 0x63c, BIT(0), 0);
 
 static const struct clk_hw *gpu_parents[] = {
 	&pll_gpu_clk.common.hw,
-	&pll_periph0_800M_clk.common.hw,
 	&pll_periph0_600M_clk.hw,
 	&pll_periph0_400M_clk.hw,
 	&pll_periph0_300M_clk.hw,
 	&pll_periph0_200M_clk.hw,
 };
 
-static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
-				    0, 4,	/* M */
-				    24, 3,	/* mux */
-				    BIT(31),	/* gate */
-				    CLK_SET_RATE_PARENT);
+/*
+ * Mux index 1 (pll-periph0-800M) is skipped: the vendor BSP removed it
+ * from the parent list ("If GPU use pll-peri0-800m, gpu will occur job
+ * fault"), and with the masking divider every OPP would match exactly
+ * from it first.
+ */
+static const u8 gpu_mux_table[] = { 0, 2, 3, 4, 5 };
+
+/*
+ * The M factor is a cycle-masking (fractional) divider, not a linear
+ * one: rate = source * (16 - M) / 16 (T527 manual, GPU_CLK_REG).
+ *
+ * No CLK_SET_RATE_PARENT: every GPU OPP is reachable from the fixed
+ * pll-periph0 outputs, and pll-gpu must never be reprogrammed through this mux.
+ * Once the GPU moves off pll-gpu the PLL is no longer prepared, so it loses
+ * the rate protection of CLK_SET_RATE_GATE; a propagated rate request would
+ * then reprogram the PLL while its gate is off (the lock bit never asserts,
+ * 70 ms timeout) and switch the running GPU onto it before it locks.
+ */
+static SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(gpu_clk, "gpu", gpu_parents,
+						gpu_mux_table, 0x670,
+						0, 4,	/* M */
+						24, 3,	/* mux */
+						BIT(31),	/* gate */
+						0);
 
 static SUNXI_CCU_GATE_HWS(bus_gpu_clk, "bus-gpu", ahb_hws, 0x67c, BIT(0), 0);
 
-- 
2.47.3

