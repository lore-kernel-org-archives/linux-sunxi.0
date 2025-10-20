Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E99264A76
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974032; cv=none; b=f9IdJoRjR1Q9XqRja3/DPQJoxnlmjpzR9eoOWYZY5MoZZH75zMh6RbuSe14orbH17sgHTDov9o6tLsA2CiLeP4Ks+Wtw8vCYXDyjhldEyZ42Q4GzTWEbHHTpvg2FwOd2mnxNQO1Wah1y3EljvMYCeS1o7jGWnVCsN93ShFmL5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974032; c=relaxed/simple;
	bh=GAI+uGC6SFJNIjpzWPIuItSi9xgMU44NMEFN0JoMRC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7rc6Yaa4VYm+hVqY+B695WbTO1Nb8QbDcGFkh/3wG+bFjZ21yr2bWocmJqBw6YOD0LmKxHf7FoGI4n8uhSOWXdT/4j4zDh6nAY1FtE5/U0QERMkyK1Ffu57jte25nrqKSA57LoEmMMtOrV8Zz5tvDCY+KAg/U24tQ3GY8aJWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTQTUsE5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTQTUsE5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso33719795e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760974029; x=1761578829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=;
        b=KTQTUsE5DjhKCJee0GstttKh3xRawiFJFPCfCpis3Dy7Ycn9tYc0UMvoAYIYtrmYGu
         GSx9FqD2FI7Uy3ptffwpFgzaaWK7nbQ5bMExYOuzVcJ2e4SH2Zi9HLgdWXAH0cW9MrkQ
         ARwrFH75Pw5a6l+CEGTspyESP0MRvjuHD+WPICEWv2mAiETi/Gv5FP6DEXjW1HQjSj4E
         gNxmxLXUBd1dXjPJA2O0m08nwtXmRhQshXf4pSPB7xvH6ugMWC1uM+Dvok5P59l15QQJ
         tCcpuqJntPaS2hct9b9nixAiv1IQKC9nHNB9URYk2/wmeq0ycsR4a4u0lKuVEKbtljyd
         qv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974029; x=1761578829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=;
        b=PV6uNglzTGfH+Sb5ZJiiNLD9W7lNlZ6tc+TbjjrYwVcH436ZJOKKE8SiSb3dX0Kxvl
         lUcWk4oRDNv1y+dyKC5XlYeZfY2BS+qeclFO1JKwtW9pH/+7u6QQOYGhohGGGtLs8ncy
         eiJcfOqEESw4+jKKK5wiGq11fOJBXusduHn+nHWBokHC4iBcgs5a4oT3fvMuVWsAIxWb
         kMUbLZt0opvmK6+4hBjffl+7fqcKa95luI318uv5B1PqkBeDta7mpcnS7+cuydik+RaJ
         wpS7HyXlLRAK51Nprie/td3YSBCYdXFStlpToZ6BpYt828Qr3sAV8dp6DLGavo4tNrpV
         RKUw==
X-Forwarded-Encrypted: i=1; AJvYcCX6veipBk+nyDRmar8geCHvbNoEHYa00+cqhEwHtt+1tkaYiI2wcu8c/gvtW01tqZMfIh3xRh28/vuK8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4xNVVh3eZ77kZNe5ttFJGApW9xSVvqc/nKOmEJC6Wjh5ZFeEv
	+QdDpIDtgeVcvjBtuZFk/z0XahQ3O/eE8swS9Cgu8VgBrSLk+xAWFYhv
X-Gm-Gg: ASbGncvNz/w3uH2XXfiGihf9+iHxVlEAW5P8xIUWJsnTZgreZ2h4nqs0uVauB0X7hFc
	yEs1xNyxTL07p3ySRIM7qiZc2+6jmM6JnpKAaWVEGI12NqWZn3bMBBGSRaGlgzEHRnt5iYalUuR
	DZ91IGx9zWvM3KSaCVTZe5Z6Dk2r0R7BOp++sA1YOjwR8k9mH7SWIUbQxZYECd4Otrp8gpBkYSt
	TF5RT8DPrbDn3AN6+sf7KVVfU/p25Ql0iKnZU3yNU3K4InVjZ3W9o2tLfDaJXl902off724LcvI
	v/J/HlVxiHMqoaAz9OpU8UayOkt/6eiJ4fpWomUtwidm69dA8JnTnOMgW/REm/IKQRitv5YPHdD
	bWJetvKS9sVTMjtVr+eP9x+56/7rcg8mKPCZv1DQdASy20ZIdORe+uTcQ82N5gKLUTrlR5OIWkE
	AGJ5EaJ5I82q/ScWSwlOYh9hQ/TOzcWdbh/Nmxf6GM0DtQtta18uXKTNo2/At0+5ndna8mSuPtV
	4/9
X-Google-Smtp-Source: AGHT+IFdnScd3UAa6FYvms7Mk8BD0zHKLaPHlgHblA0Aa/pK4mTEeu3ZIirJn6DvinarmuaN/TRYZA==
X-Received: by 2002:a05:600c:4507:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4711787276dmr102704965e9.4.1760974028776;
        Mon, 20 Oct 2025 08:27:08 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e267fsm64723995e9.12.2025.10.20.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:27:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Date: Mon, 20 Oct 2025 17:27:04 +0200
Message-ID: <20251020152704.4804-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bus-r-cpucfg clock is important for peripheral which takes care of
powering CPU cores on and off. Since this operation is done by firmware
(TF-A), mark it as critical. That way Linux won't interfere with that
clock.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
---
Changes from v1:
- fixed typos
- added r-b and t-b tags

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..c5b0d4a2e397 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
 
 static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&r_ahb_clk.common,
-- 
2.51.1

