Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016573;
	b=rRP8vEbIduGF0KsJPtrECmIz1tGRSjZwSBdH4rZXFQ4aNVgiTjVIK4CNZ1TZsi54PqRj
	 ZRe25vwmigwBSWg/3xf9TktzjnzmqO0sHGTQzGp2BdlaPUXBQpGG/HF5Twy5dCFIJrBzG
	 Ijmc8rI+HwC/2HpXhxqHUstc23Lx0+sU+jsn3B1iSyOAw2xfpWGl5YV/RF/u7tzMCQw+h
	 P1HYXAtN6tenbIr+dA3XpOBIjL3bOC6QEhCY70vXZi4TqPRnE/fWNdBBzQKKSDoDF8n4J
	 gxdJv9bsJM2yacYlPAtkt4P/6qWPX2cPui3Y6P/F357FfKoAC1mIH2epPoE0z5cE/NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
	b=tLtj2C8AaETrcHrhxh7Q+sGZk4tm0nGh/EI2s6RyRmSzPNlUUiokuTYhBUEdiAN7XNTe
	 boSTMXQstLExpqFtrFurHheh+TXjwdt/2uMiauj12tFgHXVwFnuSykJlGHHYVTH7jXyQw
	 df1K4X1MbrdzsQhDGNm6ysYY7uUT1lBimaFN2XAyD0Wsfn0IzxPNCpiJydAT5+1HA4eSc
	 3UOjukjoPw4ZrcpW7b3xBh9In6sJev5IkC43c1+TutlRIm7xAZayhhMPG49+WhrRP0AKR
	 +VU1FH8i4HFQqc5hMajKtltbmiaj/gYaUIPNJhHrvR78qxHhI/we2gCrVIEJAGdS1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ptjlMVpc;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025760A2615
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 15:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2025760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ptjlMVpc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49a92144733so519343f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795016570; x=1795621370; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=ptjlMVpcN5VpUP3dzK/bI6gaQZTUXIBl2e95XJc6UpqejKMUhU6PRRB7Oj9ZevGtXg
         2lRtJu5D89FYtHycMDaa1IC2z6dc+flvVvJQP0flYCIafCn3bTlLL0HiFOsNqIqpInxm
         zkrH2dlp8MGMP+dVWbpYuUwDbI1LlHwNa9iMDDfS14ckWAeQjIui/SlIZ741zxo7EfJv
         4nleNAXqAYPZ9457WJvDTKbPYeZpaE8ZnnbBEMbKrLWP2Wk3kFK2S2UFSLa0Vop8VgcG
         C1auWf4/feCSsV/Ndx3ZOPPIPXaMvmFIbD1VI3achNOkLrrDZ/I85ojTAFkOheDtaWup
         4sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016570; x=1795621370;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=dA/6wIzen/JH8OJST9W74af3SqnT1iTv3QOrZ9fT+dMHQN/imaJyRutAp7BU5Uqewd
         SCLqC4IsJCGrUkuLBuwk4UxOqUEbBRmOMWCziRrsfSjgFsaSwBdnOem0dkrhI2Y3ug23
         Ndw7UD9BT2tHHjWjoxCMzw/UKejLzOplCcwdOR+sJ3PCUpSfjeQMqLeLW0mzXK4ty3fT
         0Q87FSlzIePNYtwRGqj5fIbVsk/VqGMQVlOLO25GwgvoRf+U4bs1021SQzJVfZ91Scx+
         5kzWMrnTq80raEM1oLIOrbt3kopCFfoLqb1E3FjWQJHGVAs0gBLNoD1pDEIQXEqYXD6G
         yc9g==
X-Forwarded-Encrypted: i=1; AL+hErFsQHWoH1w6JLeLkqC5x7nNPI97qtdJriHKpnaR8y3cUZyZkDyi6kG4vwOMRz8CmIPuxAyH3PjDwa8vRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ty7cxShpj+gPpmxxaabqCVehz9sP9nGcryapeZPKNb0EZZPW7
	6z8RNxyeeJznvB2uaTacx8d6Rvhovjc9NYiIDn7YMpxqOLS50Vp2r0FR4EzMddftTOA=
X-Gm-Gg: AZFdTZe7/CE75503/bmASbGQf/SZ23hkczURR8/E0uhXg5EZFGrZKT5kPItg/reMg/9
	vPRxGBbUdk08CbrHjbrJUMOGNaV7ssLGrSoncENWdwcp5sq8x0WSatiqymUp4XXLvXJ8udD/9n3
	A+CyQPcEndHn+9srIVdB54Tyu2jSG/x0DiiADtViCzwPazNRDRmId8BgE4K9p41kmM+gY0mbQp+
	bA+hBirEFGO+zGDxAFuIiblG2d+9LqrSL+2CHwWROoFCOQEGrnXBAbHh2DM8XLUzBWwwMS9WBOk
	GaOhur5Wv83qcnTudOZm7noci3Itwd628Z9/HeYgJTV2ytc8mFb9mukP0d8m72CfKK6Y+qUyEU7
	p/QYRu7wFuuJZ8xynKm5ILy5bgSFhGWdWkK6lHuBhzfZXJVSdT1ZR7R6M9LQQU4TfoyA+43csY+
	eI/cNy8T1zjaieUqE7ApyeSyXh/6GspdJORwP7Y9XGmFp0V7nrO6ytafAyW2ouGEdqujSig8BMA
	hm6+hpWOcChcwUhyxNDkX/0WX6kH0zln2gRQe1pA0548CWGJgPmpUZco5Qq6to+wmhOlR7k679T
	m/vEPO4gjKO2uuehYVzHBiLD0ZkAMwDW
X-Received: by 2002:a05:6000:220f:b0:4a7:8406:1e91 with SMTP id ffacd0b85a97d-4a7840621e8mr4063009f8f.30.1795016570528;
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
Received: from [10.42.0.1] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5555261f8f.36.2026.11.18.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Wed, 18 Nov 2026 15:42:39 +0000
Subject: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Add PHY enable
 delay
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuE/3mBZXQqvYr4ENpsBuZaWhBl7
 O6C3wG+A92aW0ekA83e3r3siCQDIT11X409IxKmcbqIyI1L9aCctlwCN31Vzrbpl8OsSZOYXMc
 ZA6E2W/zzj++P8/wBbu4jhWgAAAA=
X-Change-ID: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3

The Motorcomm YT8531 Ethernet PHY on the Orange Pi 4A was not being
detected: its ID was reading back as zero and preventing ethernet from
working:

  dwmac-sun55i 4510000.ethernet eth0: cannot attach to PHY (error: -EINVAL)

Add an enable delay to the PHY supply regulator, as was done for the
same reason on the Radxa Cubie A5E in commit 7076938d20d2 ("arm64: dts:
allwinner: a527: cubie-a5e: Enable second Ethernet port").

This is also similar to the original vendor DTS which has this regulator
as always-on.

Fixes: a3606e8a7819 ("arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port")
Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 26ce579b42bf..e1cd43ea7e03 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -319,6 +319,8 @@ reg_cldo4: cldo4 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc-3v3-phy1-lcd";
+				/* enough time for the PHY to fully power on */
+				regulator-enable-ramp-delay = <150000>;
 			};
 
 			reg_cpusldo: cpusldo {

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>

