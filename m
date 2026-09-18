Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757F451AEC1
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 16:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750474; cv=none; b=Makhn0R5X8d2E1fKKPW9E+ds8xGZpFyGhrhLnvP2vS+jwkuzF06WYoGx5ml2Yg6e3uAbzdgpXsDU0jpxTZdTuXnB7UEddatChPyUAx1Y4qH8grmU1A8qwdLXoDa0AHWVeBo35b0tjl+ZosA5ho+9+E6nvfowtyjP4eVU6dSzeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750474; c=relaxed/simple;
	bh=sFmc55UAaHNbBDtVN3vYWMohL/LpvZSep9r6J267NOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMWhq1FkrB/AqfyJV5PzC+KRrSk/iSnh9ahnVprF9ymWYD1A71soPNBNudX8fJKO8t13j2sQqa+p0G+rfH679fgl3jGMVAQ+75H1vnxNBAEqPLmUQILUQEtLRV+SO3kJwxFkLoLePLr5QKx0dHRrs+ppwudI1fNDjHPYD12/8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K49eSBH4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K49eSBH4"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso821832a91.0
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750470; x=1790355270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=;
        b=K49eSBH4Hg6fvnJVEmCIs52APQ1sh4GkOkxUWXbFfoqMGKamc4XSStXDUm0/LcXa8g
         zLUKLYG4JV9+IxHZAS4EZFHVeN57wrjoytnb3TrdNu5LTThSQ3eFGWwqkG4gX3vJ6VCM
         4UwWBXJbgVaSoZZi/g40wtcc1j7rKIwH2qsdTamnW3JVmRem6SEOkC0UCLtPUtnIPNVR
         n56egUheXQe7ptXQg4E+HKE/EL+TKS3SoEBX4K5h+plgE5prEd8r6RnFNqSNrytKv9nm
         o4g09JhocVONhe7SYaT+6PwXp1HWyCikM7Zwo7lEwLdaJtGuF6BTh+cD5iJGi2LXBayf
         +tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750470; x=1790355270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=;
        b=cx4Jj678cWTJqujZyx8jA3roQtIgkGs1zjbRKoMOpEuNhz2pSnHv+XTSq8KmLOG2Gl
         YRMd8ZW9Y3M6zo8MHRUH1kdd0ylRy86nChyQXQP/Li95I+VHMVTaUzgFOcPo9yISRFSq
         eE7uLnyizhrECt3MeFF9VijF6+ia6EibkDAVIV6ExaZGjZI7uq1X4qJyTolWllPgPniO
         U66zkJh7hm7Ac6DASX4y7cQeTXUJzxW5vs0Z0jzvKSxzIIuz6CsTzqw9NPaCS9tDdKKm
         v0KmuoJ66l4iFwIE86IBh0KU3PKEJ312HwaaR2TmLS2fABajfQy6zGSUYA7Eo6M1Trtk
         MCUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG4FAH4Y2Xs1lRD0CvrlA23DsGrdvqvjflVzL9DEicCQxycXuZWh5wXqvoEvFHyA/JVOfceTqHdkXgJw==@lists.linux.dev
X-Gm-Message-State: AFuF++ncbt0kBR85nMuf1pUBqpcseL17fgZU8Ax8BDXsy2lU3W7ZIdhN
	HwEYtaD6eadu9JUEh1BWuQcJOIqEhh0/TI3W8pezoqyrRUpVNmtbPqwm
X-Gm-Gg: AYBFou2i2bCJsUuIldC/19LppFMfxknSTl58xLO5OSZ+x1JcaKbPdP6l7VIHuDJPUrl
	SY4706DmnpN4us+lw99cm7khsAZgshFpPeMaIBOvWSRGWoUF3H6MerDp6pRKDCXT9nwnUrptRcU
	JdIzakuZEMgnkALMscWJ3gwaJbKI8IWQYdm5hQEnVdRIVr2wkKlt0YhI86f2Vl3cyvFbw9gpndi
	08WPxcnrkulEtxqCIZ5R8p59BZlYjdGziovDpzwc2o8tKrYWFTQQwSqFxAL2+wAIR2b7iBrSUIo
	8Y1sKhjfew0DaQq19XYiWPZaERXNfaJ7Cqgq9dY4NnWnaLBe1tCOM+CtLa78PvHGc2u/+qTfqn2
	JuMBJH19gzMxG8+Fqi2EsR6dLNaww8VlWDvxNps8tsl9YTO6W+0g0AYgeyrvsNJF+oSaoevz09b
	phbZStqJwMqrMgmDFdtO5KVt22OjbUR/eAU6Fbtk3l1x01vgNiGB+OJL46z98OgfU=
X-Received: by 2002:a17:90a:da90:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-39e6a80b849mr771187a91.38.1789750469839;
        Fri, 18 Sep 2026 09:54:29 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Sat, 19 Sep 2026 00:54:10 +0800
Message-ID: <20260918165414.1129076-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what mainline supports today.

Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks are
not supported in mainline yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extraction from the Android
firmware kernel module; the file will be added to a public repository
later.

The values below were obtained experimentally via evtest:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 420 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 446 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0

