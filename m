Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818314;
	b=UFZGH+0ejVa8hUD4bZ+d7SXuqPheuoRV8dG2DcmLMqJhlGgmMSWp5QmaX4cYvChkNRBO
	 CipEQhdfNu23Ny9tShowF+SxV0vp0+CB8+jjOmg18/k/0bvY8HlC1L6ToYqhkrBKFPdOI
	 WSmq9SuExaPKO/Cn8vGNIzpl9vxiI2SwelhkrHlf5gBBtxis8gmYMzbf80dbpr2hq44x8
	 AaIVctCh7vhPLULUXXG9IknTBtOf1p8hl1TtnTWScMFVqKOIOkrUWiXSFcbH1PE5tQ4RT
	 zouF4+Vms1kpMTVJ0qmP7rex2j8ceXTJIRGQ6Ionf7xNkSH/NMNpJDGpUOPU5gsqVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
	b=iRNT/Y7nMlCgJYAbRRDWbTrvRrt9O2KNR547PcrtsD054dBUMi57SvNkmJ+G7DujBRTf
	 7pR4D/hHQm+CEcwBh5/uOKV0MogoQqQLLBW0eAx5/reoowzEjrvt2G5kHhT4432tLCsk8
	 MxNsVXSAMVPLgDir+avCtKitrERkEsxUyyhPtj60AGTtvcaP6/C2tzwW3uko4nS56/1xG
	 EJugOXWE9MP2XoV7+pz3gK0bw1CJ3q89QU73t42f5VqJXOmE3brhiLh6g2FzTmukcjYN9
	 HKiHUd8oC06/1hCf7mTpV7kJdCw7uyIy6sB+84HMWOkFWv1az+qxyJiuOQUVvw5k/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZFS4Ko7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1205C606D812
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1205C606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZFS4Ko7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6620265e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818312; x=1794423112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=IZFS4Ko7sEqFomuUlF2sFZKXmCppDwiZdDAtdSY3OB6wIDA+JZajqZVtF3bQzbcsh0
         4kgjB/kOxrnxkcsVfnsS1SwVSbmfPmBO1haRZa/MYYJCJyeWGxxwDIGjASmnRJSr3EJE
         CO0zkn6hn7BQkPnMU5+ImEiNWPxyBdXWZsz7ZoSQ2wXgkNn2IVth11t1lmRCVvZvxUDO
         mP5N+LTbxR9OjGwHKKG9R19BzDwAsU0IIrAHJDubrG6ZfCPFuB+5HrEwbvHQ7vJ5RCZl
         tK/oCqFX142G7Ghc35C9qPFVYLpSLyqTMuyLhVDxCDq1u0k/t9sFGY9ELXlmpn34MVdn
         AemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818312; x=1794423112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=sGiifBbaqLep2bj+OayWFxsBX+Z//1g5EOIuAdVOQxapkzIKjyfuNfgdiazDiIPvUP
         LFn1Qg9U/VqWRZn3w2cZgMp6cHL3RbeD1cCBL8+N1ZVHrZF9CbcXR/oWvOz/uygdBuP5
         +0CF3MO26RoTRoPZYdkMKVSdTTsvBTWrxKRi4lCqx4KJFq844S7OqORPXiFRH4Jhy3gi
         I2zoFrEFSavdee/pJUQ4dkQf2rP0GX0cAptFfdqNmRHuzHTL1wh9vfQe91xeYdsQTaDT
         mOrxV5QXZ39w0b00oKx5vzyy2bXu+iwBS0vjVfAuHwBLMqvldGojUH4ZyNSsTcYGi5I9
         KB6A==
X-Forwarded-Encrypted: i=1; AKwUvBxjFIbVXssXc7WxCIJHU2AK8p4fwDeMb9FqEYeJfeMRwb8ZW5oi7lrR0ugufP0OHauGRSFG06fK6UHW1A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8RqHzdpOu7YM4jroLWrGTz2SOhq5tmJXO6AY1r3u2Y8YzFIwmz
	jOjkI44DyIBUuDYhX1emqZG9wte9tNVMMuFMTWtH/jUemCDM3Pq+0Fg9
X-Gm-Gg: AYBFou1qeAXeetHa+Q6OOB+AK812AtyKGUhRvQSCcUAN8Um8yvrX+QmHiCluDhEdwMx
	1kOmKdRhwIN5naFO+P2svo+Gq3+IzmZsH46UK/RP76PKBVxHliWT3DdqxDE19yf8vCsfE6l7ako
	wx1FErYbNyhkfnxrrmVzeTN7WUApsqbfv0XIt8jCMcdM9gmGEwItGKA8Lx5kyACv8u3rnLsldTp
	oIgYmcsONe0rSPDI04g2ye1LUkowhNHmL6Z0i4qi0xFY8lX7c85UjuQdbvF3z4+ekoZUwO6HonN
	eSjhCnpiUE1/jsOAIDyMb7JPOfHjtKsLiNBoX4157f8xxIRE2l5OsfitjDlzGHP3wmFHWGropGx
	1DccowRUOIMe67joObKFHrA7GT/kSGwWpiiLhuSoEMefAPfUqkvamqdjabk4WqO2Gp76ZUIFJ8P
	c/iSqMgHJLI7+VnYUk9WPDX0Sed0Pr/viUqvHVzno3enM0kGOHM6Py3nk+A0yEfYIEs26SAsA1o
	EKCIViKu9EeTleDYIz/SKSoGtlNCOo9nsV8jLs7g9c7XEsOZZv4rYhfSMsgbk87+5IpI2nf7ELv
	qESrFaWGjGNX5vcfdLWJcYNgTkti1fvaRe0f6mpPjg5wSCTt9A6D8qxIeugxC42WxtmF0Qw2hJa
	xYlg+ZsFm1h0K5/rCEDpdV3wIRuj/i0aFuN6heqrMAlSZqN1XnZwQt5Non3KkoF5HPCrAHrQyOD
	2iQVxp689I0KJ2DZFZF8hS+TgdLcq/gLgURt/ZItFxs4ZG49qSLDE2clnA1BMdd7j9fkmaDx1bV
	nlE2cRG659JsACiqVql0nz6J51xufTD/5BRGnbCLqY4
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr378898355e9.7.1793818312397;
        Wed, 04 Nov 2026 10:51:52 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm4031515e9.7.2026.11.04.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:51:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC clock to 37.5 MHz
Date: Wed,  4 Nov 2026 19:51:48 +0100
Message-ID: <20261104185148.883318-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Samsung eMMC on Banana Pi M2 Ultra fails with "data error, sending
stop command" within a second of sustained reads in DDR52 mode at
50 MHz. At 37.5 MHz the same board survives a long read/write soak.

Limit the eMMC clock to 37.5 MHz. Also enable the hardware reset line,
which is routed to the controller (PC24), so the card can be recovered
after such errors.

Link: https://forum.libreelec.tv/thread/30663-banana-pi-m2u-emmc-data-error-sending-stop-command-fixed-with-a-40-mhz-device-tr/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
index cd2351acc32f..ddb70af25836 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -195,6 +195,8 @@ &mmc2 {
 	vmmc-supply = <&reg_dcdc1>;
 	vqmmc-supply = <&reg_dcdc1>;
 	bus-width = <8>;
+	max-frequency = <37500000>;
+	cap-mmc-hw-reset;
 	non-removable;
 	status = "okay";
 };

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

