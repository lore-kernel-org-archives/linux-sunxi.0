Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215360;
	b=sGcUANv2ecqKrlzx/WxngIVmOdL2YkCFnzFE146ndLwiFZYkv8XLH3yPBr3ogfDeQvDX
	 PJYxmZ7PIT5cqSBjV4g0bUeAHgNWk9g2Sr/6GfxQYl9b0QWZ8LPYiYmhXxCEk61zl8aeu
	 +6u7pZrvyavu/2umw4Y7QPbV4fCdQ1Qnz/M/Q07TwTtgo2DO/suJqAjEdgKH4iJ/hpMhZ
	 Aeex2hrKhMNUtLWbFkgbUNQbCfyT4d6kziVakDfK2nxpFuMmOGNFENE6YeJqJELPWCn0H
	 16raW2eQwvczS7bPZiRkWmczfmS618oWy5T0jLRQ6zbinbSpdJn8DDRwybUtVkABkMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
	b=tAJ8zUp4xdWVuFdf40Wqt07fQzXR+jT23I8j9rbAvdcAa+YIdmYGq44eFnmicSYJ7I8G
	 GbWYn+T1+x+Or5N89pq21Yb664LAVhSJiBFRhEeonKnLSkIbDk4ZgX3penxj+Im3snf9K
	 BpUOa7AoZOMCbm8PpZvhvXU1y6BwlP3DbaCug/kBpb4iFB6CBSYNLBREKh6CadtpOPiTQ
	 syft54cHeBpqjv4xPty/vxK9JCEeuN8VkHsWbNeXpQ+zKsmdnX9kvp1Ah1NdgGGx0jUjI
	 PzUxTttZFxAMaGucJvvtKZUzXRpO2Rf9zVvtWGAt31A+Uvuk2WSMqHgZMmN9a16ZLkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wirenboard.com;
	spf=pass smtp.mailfrom=wirenboard.com;
	dkim=pass header.d=wirenboard.com header.i=@wirenboard.com header.a=rsa-sha256 header.s=google header.b=iaXLFkkb;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF3606A335
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 09:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDF3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.a=rsa-sha256 header.s=google header.b=iaXLFkkb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so6089535e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1794215358; x=1794820158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
        b=iaXLFkkbiHOX+6qEVwM5kL7Jy6S5QhBsw6h+cdXB6V7DiwnigzW4kz+ZGT3rsBHVb5
         cZyOWndr10b/h3AgWBOUtEYb6a65tgNW6s5fqs1gsSuI51yY4F59jsOPhw1rHeU4ie81
         h0Dn3H42pHIa51tCG/ncpvU9ipMqb/CApDhkMrwvew2eL+OEoHv0Ec02lGEPQJ/eNzy9
         UAyJrKh1yOBJAOTBJeWWSadSElvC11j4w7GhR3czQ5Bpe1kUTGiRfS7v1g1QH+gIbr2V
         SfBYTlraTen4Oc/+TlAK263qe1h21X7f3YHT3MCUR9pSA53LL7IWrUeDJ16ud2YKYrkr
         ZEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215358; x=1794820158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
        b=CLv6/HVMmJMZe3T4oSQLWDwbl10+/2ahpCzHqfCKLAP+iPw4aUon6o8ObZ5+LU6jnL
         sYCn+XdgpGuQwMnOyxsRiqYVQdegeC3WYIRTDkJLVz+cP4jxjs6ouoSEyoc9Wey40z0m
         PCaZx959xp0Uw9V8tIvDapUMqYikg47oOYHTUG//JCagTfYozuPHL4j2GtbM7YihFvjR
         hTZ10Z05hF2rJBtZk/+ItiTpkSCetwo+g+KDZ6xkTt4eC8B4jEJIODcNyYaYgFbRW/IS
         uPrVGneygPJeWf5wBJIvhJzcYi6wql28ZKfKIPlqBXRLGLrxMIcWFkl/y8BiyIPzjuXf
         KCMw==
X-Forwarded-Encrypted: i=1; AL+hErG1iOzkB5P/Z+xVEZkdKLd62MoI2rWfPMzl0K9gHwLUSiCMMSa5gHaEDluLZi9+6G1Szg8rmThv9rlqJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FkEJsJMkHHCOwrA5mvUrr+asjs/ir3mDbz7q4zimNgv/I1ihh
	u6xVA8cPvp0vQVPAjbfJF1uHWshV1KM7lBI/jWtQkVgt+o5uDBKYGICA+tqnSdssH/k=
X-Gm-Gg: AYBFou24+JcueUC6sN6BDS7QdA1QRvZK70IJqWcUge4pMfPDs5v5RvKCJj4sIZOavHY
	TguL0hTZW2MaGMc0uVUGgUO3vryuruo9XpwC2XxkTGNz9wlJZqwbNaSSL9MeuOunssfpIB/1e6X
	qOYQDc9F+utO2vXvKJ7B8ig5w5Lj4U+kUYzijyyOoCcG3B/SDLRB6nxvZ/qt6k8JccuiO+FfW/j
	BkVSJuN6L3nr+K5sBa3DfxZXc/k5IBWZNHvY0BsAh1alnPec2QPRzZIRW9lEoohDFPL/3oB7+Jr
	Q8gW+AmuylEikKIA7OOvKeOfbKs8/qaU8dtC/rhcn2tdNwsUOHdsYNmDo0okkwt5HYxaGYAX9LZ
	1XZ4ve5WD+VRbGZ9rR0+pR5gEVkPHYfoOxo1e77qE0RThKKrTITm/q1DyNVlzyKcn2buEQAQvJ2
	xSLfkY1VmD1h58sAc6MbxGgOzMLja7m8Wz/201mb6XhhRQkqthoGEBY4PKavxc6Bl4jxXYG9DZt
	XpPa+a34rUvB9ceeKlzQ7AaxdQ1RArHaWmRGaLxaGTRGstj8UVhNXu6kfccaoOCKf64hYCZjWiy
	JxW9O7ihkaWWaI+C7sDplrFd2+zdxpEEBDBwdbGbEJTANfnsQV1P/l60zCkdsfU=
X-Received: by 2002:a05:600c:474a:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b963c6cac0mr68998635e9.5.1794215358048;
        Mon, 09 Nov 2026 01:09:18 -0800 (PST)
Received: from localhost.localdomain ([85.137.25.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398a4sm8250905f8f.6.2026.11.09.01.09.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:09:17 -0800 (PST)
From: Ilya Titov <ilya.titov@wirenboard.com>
To: sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ilya Titov <ilya.titov@wirenboard.com>
Subject: [PATCH] clk: sunxi-ng: h616: register CPU PLL notifier before mux notifier
Date: Mon,  9 Nov 2026 12:09:14 +0300
Message-ID: <20261109090914.46872-1-ilya.titov@wirenboard.com>
X-Mailer: git-send-email 2.54.0
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

Currently the CPU mux notifier is registered first, so on
POST_RATE_CHANGE the CPU is switched back to PLL_CPUX before the PLL
notifier re-locks it. The CPU then runs from the PLL while it is still
settling. The comment for ccu_pll_notifier_cb() says it must be
registered first, and the other sunxi-ng drivers (A33, H3, R40, A64,
A100) do it in that order.

We see random hangs and oopses on T507 based boards when cpufreq
switches frequency often. In the oopses and JTAG dumps we captured, CPU0
was always in ccu_mux_notifier_cb() or ccu_pll_notifier_cb(). Other
CPUs were usually stuck on dsb after tlbi, waiting for CPU0.

Running a random walk over all OPPs with some load on other cores, two
boards hung 20+ times in about 3 days. With the PLL notifier registered
first there were no hangs in the same time.

Fixes: 087b4083d3f9 ("clk: sunxi-ng: h616: Reparent CPU clock during frequency changes")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fa..00b7811f3a84 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1235,13 +1235,16 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Re-lock the CPU PLL after any rate changes. Must be registered
+	 * before the mux notifier, so CPU goes back to a locked PLL.
+	 */
+	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
+
 	/* Reparent CPU during CPU PLL rate changes */
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun50i_h616_cpu_nb);
 
-	/* Re-lock the CPU PLL after any rate changes */
-	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
-
 	/* Reparent GPU during GPU PLL rate changes */
 	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
 				  &sun50i_h616_gpu_nb);
-- 
2.54.0 (Apple Git-157)

