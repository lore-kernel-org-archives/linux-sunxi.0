Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839112;
	b=wSZO8iMpTRhAe09kcMLZmrUmXEg49Er00uYbAUhF6z0MrbekYCVGW+ocf/rPH5dehI4k
	 zHAc7ZlFhcatsy01+BTAJiRO2HoUOIKxrZL7yUrGF/H7wWHKMZL8d8HSLmDBhaiwzxUt4
	 DH3lAJo7OYoTZdJjANjDc9wofCejWWYAfwpBuG5Gt+eMxZvLE0BviClwqCauJqYQJULzh
	 KdtWojmE0F3L90C6774IsntoTsegXkXZbti7PYJdoIzseduP7ux+jEGiEPu0kWazNHPPW
	 9vguvTah5J90LWTCJOSJpTOXj5u3WKehb9QO0qwJB3DYZhE/nqAPpo4gjR6q8cpYYCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
	b=x5tcWoboynM4AmIuWyjC8JTlS7cLR0dwxFbeg1ssPExOW7FUxuuYoKqqi39oFUdHiXBH
	 lScF4qSZXW2lFrrBam0j7bKavHNsPnKbeAuL2lPho+4szu1FRgfHk+4a2ZqulD7x6OceC
	 ky4mutd0xZ8tzI7eQWV4wdQaNdTfZ0ttduEoAg5s/HmVw7+kkJjqDd8TudFI8sX+7gAiZ
	 C9T1E/1sFuDaspKR3iUQskZa8o8HQai/xtZBTHGkYRWGW7HTfQta9+wHqFhisgrpFZQZI
	 +d5q0tNoJFTqAPVMjOXWz92jBtgQ55Y6Z8q2HgUaZUn6WVpIfVwrnBUCwwh4CEJKQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpRbeKzP;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9F606A32C
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD9F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpRbeKzP
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b2382bf051so1926893b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839111; x=1795443911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=DpRbeKzPekqV3yvqayxKbTtqLOMzfT+8FCBW/FhNVaHKRYMXhvctB9x7IGN7eJWMlj
         qN0aCAWeYvxSNuIQuffnKk+3pdiBog8w0yCOWI6VZkzCNKDvZk0y3XOnRmb66sZuu9GB
         j9ftNhXVzk4vzWwOVSLRupolx7Xpp7ch8xWqk6U4cdqMPC5yn8UsNjH2gBUNoIxjSLZg
         JbA2xVftxUP3brTtaLMR06r54+0KDhLodJLGBPwzypgOtleOu15/vA4/Iv4nNfHhTk5l
         /pq9w6+U5NMnVdJUioVglYx9GX1RQIBrHZbRfEAnhYsMnFpsucL/LJqvGfGAG4xHGvu0
         tF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839111; x=1795443911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=Oe2g7gBeqzyQU64hTCpzWegb8E/iKGJRW/CeJpyjB/qtsFAX2SMrCC4IFfL5Ryb9bg
         zFttvncJPvwr7aDiBatrJw29q44mfQtzYMGXiQaX810L/CJBXqK6Xo2qignA4bEzq74C
         iDKZt4lCOO1s3AorExlYMCgNQQNDF7v1S89Ff6QVrV8bomxbyekno++o04wKlCTG6ENq
         dysmvPNET5d9EERxqX+TDsozUyO2ihfDq7ADXiokcIhrJXpMH6MMnklmHvNw4B861k+K
         luqvfyewy/2QtaykbX5mCFM4KcIgGsixxpekKVmQFDOUHbEiDEzB0oTotSUOZ42I1GoM
         SxhA==
X-Forwarded-Encrypted: i=1; AL+hErEcil0wu5VnTOdy5AXD5CM3TsdtD2Tksmx5Gt7hmiBgqY2GdImsBCPjdeFFU11n1gMQdzW4CjFo9vWJ3Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9sRr/UYZfenOMTiPbo0zg0fViE2m74x4usphkWVpdSeAOEgzy3
	hr47Y228C6PiYsCODw/YegKVSL7dS4GLE2eYtfwfLQ4kFDoHr0NJjjR+
X-Gm-Gg: AYBFou2DdHciIm+hghm+tDR9vUU6Xb/ULdfVVpkAb/P1N09Z08Symd7lc+aFkTq2cth
	RDHG2NEGRJGusEPlJibkAIqLNCDnZalpy2+NzDhEIUGBIK4EnbupDxhW7s+GwcfAXyF4IneF48x
	3b2v7/+JHdw2t9IshH9NDQQTUTUwkI/9WeOkwyhPh/LgJ+IxsYperzqSpVOE36Aodrrvo5n5DdY
	HLLQ23VvIxuTWmoZGjImiHKtNUzuz/to9sOedvBqbABubZwroUNAtYIowUnE90QXcjZ2mzSNbUs
	/GKURiRBrsxTnDU116GexFr3zfSzR0iMWtkoRcRdS/KcsLwrcIne+yIiCSS8FNTXpdKJmcdZZWh
	rrZwFx2fLP7hCDDY2CvqWda9WNy9xBz3T+Fy91r9b5IxGp0LinYsLFspAVgu9ILkD7bLNCn/9Zq
	Gi0dtuUdXpkLteTBB+IPApKGaiy/LWJeHFHM87aA+4JauviTxKqQgPItjz4kooMxzJsEC6MBB96
	3aaWP60DtokiFlFYQtA74L1M61lWuuM2w4fqlDgDc/wuq25ocozMfzShBuV5X4c6ymApFhe6I9w
	R2FejlalL6E+hORPaD/fgSTIaLE+pH62WEjV4hJukEmziXYINflmjSck7e43
X-Received: by 2002:a05:6a21:8883:b0:3e2:2234:62a with SMTP id adf61e73a8af0-3f7a84cef9bmr7584081637.55.1794839111006;
        Mon, 16 Nov 2026 06:25:11 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm3834158b3a.36.2026.11.16.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:25:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Mon, 16 Nov 2026 22:25:03 +0800
Message-ID: <20261116142503.671907-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

Hi Jernej,

> The AC200 MFD and Ethernet PHY drivers and their bindings were merged
> in v7.4-rc1. This series adds the device tree parts needed to use them
> on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
> Ethernet port goes through the PHY in the AC200 co-packaged with the
> H6.
> 
> Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
> the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
> from PWM1, the RMII pins and the EPHY calibration value in the SID.
> Everything stays disabled.
> 
> Patch 2 enables Ethernet on the Tanix boards.
> 
> Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
> direction, and the link comes up both after cold boots with no
> Ethernet initialisation in U-Boot and after U-Boot has used it. The
> TX6 mini shares the same dtsi and was not tested separately.
> 
> The arm64 defconfig does not enable CONFIG_MFD_AC200 and
> CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.
> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (2):
>   arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
>   arm64: dts: allwinner: tanix: Enable Ethernet
> 
>  .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
> 
> -- 
> 2.43.0

Same AC200 setup on TaiqiCat (TQC) A01; I'll send the board enablement
separately once the H6 dtsi changes are merged.

Thanks,
Jun
