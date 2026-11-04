Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818191;
	b=Mweh9e8BLJHtbUre7COsAJl2m5Saf+E2p1o9mt16IRC0+OvnJ+yLraabFo+ssZfrfhu7
	 sY909qnBNytsxyzfOhjpdT6BlB3CmxFrBtA13Uew+bZ8cpmCTwk9c6ohKvkWdEUyVKod0
	 vkXwfmiODHODhy4Hcb3EiWhde80wW8o7Zsv3P3oCuleyYjR6IQGQTRvWuWD6Reangd/py
	 Sr6oMAwQCqR1YKYqqVbVB54QC8YFEVp8/7+ydqLoi789LnhYW5OXTNgxg5CtVDmk6UCK+
	 r2zFiHRgIVSk+6wVQ6bYzxxLuha/Uz3bQQiwj/9qHHO7Qlt41XN9QwNV3kvuyPuGGdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
	b=d2X0N127Mn/9aTWHaulytacrYHW3sFE3FC1i0tGPgUDxhBno5mlMg3pSVNDBema+MWqW
	 8ldCu19lHO5RnIX/vq72fvoV+YjgL9RO+JmIYz6Nr0ZQtGKLjCifbpJYa/CoDh6Rs9H4S
	 yH0aaKDRajXRI221V+XCnQLL3GFwRlp9FNxiKveQbEdifhELqhoJKnBBGdsOmd5sozS/0
	 HhdtBxJavgO6eqSHyv0IL4l0oIqoryCRcDyJ7NKRKLQHhRrJLtTBlyDjRp85Qy5P0qVEt
	 D5CHIK+0Xjk89UlxpRu2KikGnjOguGdg2BaUDQKt6yA/ZBA/bnNuALNO7ZTtjFjJgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd7MPIXH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9B60A2627
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B9B60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd7MPIXH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9378035e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818190; x=1794422990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=yd7MPIXHDQMTgpuc6/dsbaM8Y9ivTUyQDtKjZNQVMmunX6BQCzhoPKOXVD/frubLzF
         r7wqEnd9QocHW4oF2RnH3Jv+JnEQcM3+2zJVUGpZvVRwVXDK9LGsO+Gocb0fZO1Ypa/D
         YFsoxfKfXgW06vF/bD+xRKFJrYQHANEXnlen/30uY7Aqleqx0rJUii3wYHJXGltKQyE4
         I6SflJGamNPym2SqGGHCRssu5lCNRWNlax8pFxDTBDoHhuiIMmV0kxXNXoEgdNlLoLjJ
         HtTe0K00BFeXTCgIsM2DH6Ld17gbqX7wxr0cVVcyR8HFxboSnqsAWe2OaM9dz1ou+26g
         rmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818190; x=1794422990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=eZnk5ytcq6ipGT9JBGke6Y9DN5mZ/jcOKAVJOm2IiaFmFL/PcMHAkEU5C6jkXPc/Q8
         PxpTNtYmg0M2Q+QkJnha8Iy0kY3vPvXik07FrCDEgg8VuAv9s86mJY4oiW8H94UnUT76
         SR8A+iEDTEHOmZXe1m0cD1+wd3zOfPf7Hlko0iBU8mHwf4nS20Zl4X4i0RblDJ4yLuQ4
         4cgb4H+ZqmXm/tJAiRydH0/KMb/6rbYqlz27zpINSb3C+Ds3gOHqlZrxdD3b2sDSfpkW
         rWptJQTAWl98MhAcvR2R4va/7p3IFZ+uqN8QMtzPbxFOca8J6YUl4LprI36tQm9AQM1l
         RNzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxL0J7n/Uq/6A1uBL/nFVdpYHFt0MC8YpYGX8WCf6kJ1drEYZ6oZb6FRbtwHoKyBFt4sKcLs7ZLl//51w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8wQjTwEB6EyxauV33BLHbyu5mLZmpEyqQMfG3JOu0X70NTaCZz
	ZiGiWZfyghY07OXBNP+l58Dx4SEF/timPyY1BvHpAFzzHZH+2CJ5wJh4
X-Gm-Gg: AYBFou1hZBMJ4l9o065L9Hdne9mxIOik8GQrcZFik3tceojaj27oIlplCf8Ke4HJN/f
	2NLqGGfgTmuuMQv38/PQS+V3mIaWkSuwbi8J3h4CLW3C86pfxuqRaOLWhf1jwmkIxAGAoF9kpJ9
	pT4JfamvAisXfXstc6/dUo03Q8fMN9dAkiTVmd1y3XkPHWnyaikE9vn8f8tcBDsjjW5F3ETvpzz
	jSqoR0HlSv9+W2tcDhK0/Rq4UShn8GGWPGQbgGywGyhySCiy8LjT47+wVrxhqA23W9suA6MNOK9
	/imO9vrdHJn9aVIOwMMoA1xyHOG4xenol2PFL66wPXMKpeSUaQwoyVkujpH2RYMM7iLqAoapj4b
	bImo8F4ds9UiYG+w1AWVfwuC695gwjt+ZGFrcmTT7Tk8zkHcL1TnjhJDyQICr1ye8pJyy9Q6+Vp
	FuevN75JREQOsGNkRAkx8fvfIF6ZmT+ebcVd4u8jk83ikWWEa6YpirJSF7g+MY+tfWx2voeer7+
	77Bf16F+MLzZ2IPY/VK01D3lVDliPSkaHJeNfSWVMTbZ4pdKBFMT2ntKdeESMlQ7pxtnJ1c7/2l
	Fi8kdy3R46eAuycYxRVsYCkF8dh2YnDxuOvKkdo5aIlq29nKUrT10x3vdQWsSsp1FPTCK3eWt5/
	37zRdzRaHC3gxlQJiWp0Pp5mpR92tlXnaw6mSiFohDDdDaETtcrB8R1N6IgRI02Nom4gIPeAPY+
	6iZTZ731nfbEC5ksyL9HfSZE8MRVTpcZmbckghuB2v/iZVmFYPqjmE1Cp2tXnh+3lbFr+BCRgJI
	glG/LrUFo/UU8+U+dPNBknMOOWq7GwYJrlEraWz7QKp
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr197486915e9.20.1793818189742;
        Wed, 04 Nov 2026 10:49:49 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:48 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Wed,  4 Nov 2026 19:49:40 +0100
Message-ID: <20261104184940.882833-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 2948369cd659..b7351b1db97c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0

