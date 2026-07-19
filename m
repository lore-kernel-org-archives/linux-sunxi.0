Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25C311946
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495635; cv=none; b=iqFSY/vPgOHaXH+neYizuJpRfKWAecFWLTBUE129XMUES/3CPmmU1KJd5A638MBlCfEfQ5W01SG3YYObbY6DgUj6TevCRGgskoSE14CkDuHxmHNzoXIzYL2n0nt6eQOcBdhh19r+Xvvn+oTAoREWw4rJhZBxfbCZ88A/a2JbQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495635; c=relaxed/simple;
	bh=uZZtbCVhOKhzC2tpXj5NKZbfR/sFeNe4FarJkD89skY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aY2LZdnpyze+uLXDIBxQpAYpuLexf1ytkzFZl/Wnk45DKHjpMHXNdnDobcOZ416WmiopyD6AdIFCOmNPQcUC0FKAaF8in1wI6jsyYr3VHNdeRjiP+fEfQCAxB9ZiUSRsb8IgT336rwufCwx5aVDHmvh4nM8oS7pE0aC7Phh+n9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLTgGJFm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLTgGJFm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955de8797cso1826845e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495632; x=1785100432; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=cLTgGJFmGDNjuIpJ9NYrSoWUQl2sCy8kwTCCMabS3rPAA9hHCguG2mwF3OFxQpr5OY
         3wB7X02HR6AO+AGZJD/upMJSrgLiZ7/Rdsokt0lVXmnVIgl0sYpGaCqx0MwzBohrAjtc
         7GJYo2O07kLNanScbV9wm2jXPCVnSWNhJ3444mD++fFrkN+QRiTn7mbWZjoY8Pnw/g4x
         ll2hVErktR0nQ5EVgtqI+XkSqGbM0i72H5Ar2jjYgOGo4rsKfq7wT391ig54Tez22w4c
         oe8UnEOQqlLylEOFJhCa2M4i5j/FYeAmuNAZwJ1kOKMgf0Jct+1oPhQ6/dmj9yFeOIwp
         v4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495632; x=1785100432;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=B8Bt/iLkEShrlpqfNLXPywCjcoJsRXx3c0wGDM96IpW1X1t7StiGjkNwLZ15tocQTx
         H7Qy18EFL24EVSFqpK1tENAmQKJHi8pG7HZCly1ihHYxrZvgdbMjXsSMk+Iryxqc1/Yl
         Qlw0RtNllDkYsGUNpEVUg+w0XZDrK4L1I3wcyW7F/rBHuPZr5KTAaKu/oe5oXXTBBp/p
         6k6go5S99SnuYa6FPvHqygnLYghPjksdVdBN3WNFsDrJ750P5PFO8N2vCDr/CahljZ3c
         H427gt9TiEfZN0SJmsV2P7vdjwPMGG+h2QpRtcuBSxz/FAN/3glNTxOn+by/j9lIHH/S
         yQOg==
X-Forwarded-Encrypted: i=1; AHgh+RpMj0bGOZFVJfiYFddjxtyZZHnyXT/UuDc5UzukQul/ESllywWE8bp/4Y0D5brHMvRrnTJuRXhwif88TA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1LsTSr4sX6Uakmth04JQOi8V/reZV9JKiB0GbPSsEqDOJT/dn
	YmvmUbG+7ia/ePeRrV2Gt7D9bApFLN7XrZF1ZyDtwpzHa11MbbvnqNyo
X-Gm-Gg: AfdE7cmsvlzJdg+aFiqIFHRlMjWYD2xtHgujo5BSRvSTO6Oe3vnUHt7MbVgeBh1/iLu
	Yu/9Kc0Ws0/mYdtLjUoMrAupNLMYoupS4oZ2KYf04mecoUuwtBDd3lH0UqhoIAzV1hPZyag7ROY
	kDCqUvP0uKRLzE/X7WGYqBpgVZoRHz0xbTEXFASvrRSIZoM6BHTHF1ARPCW1cI9vgYGGM2q8oUn
	AxYdd4j1VqHNBCh9uv7wPJxcqYIFc3ctd6GYg+/Bm7WaA78DJ5O8IynBDrnkoX2EN0N2gLgwN2U
	zr11mmFdtxe0pU2p2nAxgmJXSIW/1LwqQp2yk2ZI4fXxBo33bmfbEZYsdL5fVOcGI6Qf/giCmEF
	GavvaO7iupw5QKMEsWinRRaz33h8b+P1P850FOpCJloDIi1AE6GgQZsGTPwlQeCToWfnWGiTVwR
	u53VkVi7+UCQgZS3w2ng7WQSFbdg8GJUD9j/Ql
X-Received: by 2002:a05:600d:8494:10b0:495:4056:2c6d with SMTP id 5b1f17b1804b1-4954a402f4fmr101550685e9.23.1784495631684;
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
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
Subject: [PATCH v1 4/4] arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table
Date: Sun, 19 Jul 2026 23:13:19 +0200
Message-ID: <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
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

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU
instead of running at the boot clock.

All operating points use 920 mV: the BSP table specifies 900 mV for
every universal OPP, but on this board the GPU rail (AXP717 DCDC2,
vdd-gpu-sys) is a fixed 920 mV supply, so the OPP voltage states the
actual rail value and voltage transitions are no-ops.  The higher
speed-bin points of the BSP (648-792 MHz) are not included: they are
gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix (the OPP rates are
only produced correctly with the cycle-masking divider model);
validated on hardware with the Mali cycle counter: 149/199/300/399/597
MHz measured under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 055be86e5..0fd73a1bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -30,6 +30,35 @@ ext_osc32k: ext-osc32k-clk {
 		clock-output-names = "ext_osc32k";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <920000>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -116,6 +145,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	operating-points-v2 = <&gpu_opp_table>;
 	status = "okay";
 };
 
-- 
2.47.3

