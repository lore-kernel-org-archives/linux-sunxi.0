Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F443B19B2
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021117; cv=none; b=vB81SrwYiMdWnZnqaqSu+Q/i8LvuvnwAQOthDQQakBvXaRwqD1fXCXpLkX576dod3sGWzU5xXCH7i6jWng6yVeTvvog2CF8oG3a3fNs6zfFX3OHjdD7cUsIHoR40SGsu+WxCAOM7em1EhChMaaV/4nsabk79oS2wuIKYGC7IFBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021117; c=relaxed/simple;
	bh=7mw1SC7j2m+3fApFRtf/aio3nVzJa9ABqYViSIzMyeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYDhdP6RWTMzWsUoeGzBRrfOYttnQxVfqmwlyxOqGyZv3P4ocnfBvHge+ScmiBhhEemqhFItJfsG1J7ho3Gp7l0nXVw9eKshDOyZAxpLn0cQAjqkchggeqUg5JMx0Q/FeTytRuqdoFcHTZ941aBpxw58iSUQjFJMycc/up1MWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qU+6B9k6; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qU+6B9k6"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6ed1de994so2190699b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021115; x=1790625915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=qU+6B9k6TDUB2s8UbpfM8V1Jk3gBtZcbaKkhpj1fRfH84q+vyxLOYnb645D5A3jz4W
         /9y3LzB3vstPbq1phgQzezQFAxdy64fjFqQghA/8s7GaSSoX9Fv3AMoaHz4WAJkYbRQC
         +hdGc+veg7BZzEOq2/8RpDKmGiE607iP0Ozv8WrNeaMz4Da730K3GwfCk76zCGdREcMP
         WLvDzpvjhxA5rk7QqJ4XrFTanPV7vQcjxojC/6Onur4QZ3Itrq8JmiKE/HgUOyShT4pw
         2XN6t6F6VMzMhU2Alz2kx0DJ3JcVghsvhizYDqy2q3WKedc+5sCt5Odcyy/nwgDV8MQ9
         Lu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021115; x=1790625915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=HRkf8TgS7teZbHOQjQuOyoWMOV4K6NWcQYdnmJTao8gOXMK5w++rww1MWailWjFKa7
         ynAJ81/GtpzBRDJOpXhn1W7yXV//CniJv46Xs5fYZifmz8+r/KlTcCJiczncXONzxo7i
         LAZTM2vxKNM4UBmnW0V+ax633xPsW2Vbqwd7u2TbdZpUqG2N8kG4HO83XElDJrPXTTOA
         xiGvvQD1dRcHqu1u43m/i3DhPcpe1GtHyHAK4ll6dbTi0zGQpMXjfL+kvAy9I2dVZ8SV
         /70HTY9bxH0aUnAof6ZgsqEPr1MGNapdQcler8p4WtvMuWQHzwxKzfb36HoTUFZNhr0K
         tTig==
X-Forwarded-Encrypted: i=1; AKwUvBzqz533yDwi/45+WWnzg/LTsNy+lOIHE1q5OBoSI6BrxyUC4sAnE8WI1g6/P6gfxfgNSEWQPnHrsBoE9A==@lists.linux.dev
X-Gm-Message-State: AFuF++mOLRvIS6YgsKikJz7jAfYwinzdNSpBp4MRqhgcAdEGL25N3UQJ
	R4rE1gPY/evw14j3zTfM+O5kKZ3eXWtfJq603/gWCgmJiEHmEcfGM9Pe
X-Gm-Gg: AYBFou3/pAouBX0SZ9qTg0ZYLJpLycJG5WteDCPlU6xumRguO4jnO614tWUX7OSDXnj
	stSLwHCBONgAGArkhdKVpEXPckV7S2/p2aSqIIn7YrVsyGv/01N+6ZAIKsUrlnev3lB3aywAdXp
	RtyqX3RCSlhn1H4u0K8maCLKF5m9TIwm8g0UV7SEO8jQsBf+2MdmUaM+Deyk9w1WQ6T2uv3QJ1U
	1UI9Dfkb2zOXJwdHF60VLcuwhL0DlkRDWjfqlvRnyU6Q2Fw3Wtk6EgPHIxaeFpdV2ojgxCx0hjE
	CbSH82jjVMem8UojZko60Z9EViiLTtHG7yJJodtYLBq8w3JPmBiZivZ9hwh29GxhsgflLrbN0tj
	WXRf8cEqlXcGpBm1nxTFOJZ0z0LdkDuUZhZTsp3DQOCYsHN4Po5Xl9vWzJ/26R6oxeFkv4X4I1V
	wCEDFZxTo5YhBFHhyMOu383cnEeF3afZA24Tg1Fo0xaUjsW5b03bwN4yXhuwZubAcP6XcAzW5+P
	+p8/2f50TiPYxnLEV2Ii21JrkfGZRO7UPFg/9DGHi1EGA==
X-Received: by 2002:a05:6808:c167:b0:4c5:90f1:b9cb with SMTP id 5614622812f47-4ccf74b09a0mr10949649b6e.16.1790021114836;
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d423604f7fsm1137266b6e.7.2026.09.21.13.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Mon, 21 Sep 2026 16:05:12 -0400
Message-ID: <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

I tested the exact v4 series on a Radxa Cubie A7S. I used v7.3-rc1,
applied the four-patch A523 single-divider prerequisite, this eight-patch
series, and Andre's current seven-patch A733 pinctrl series. The test DT is
a minimal Cubie A7S harness with the main and R CCUs, RTC, pinctrl, UART0,
and MMC0. The Image, DTB, and initramfs were loaded into RAM from U-Boot.

The exact posted stack starts all eight CPUs, probes the RTC and the A733
pinctrl driver, and binds UART0. Serial output then stops immediately after
the 8250 driver replaces the boot console:

  sun60i-a733-pinctrl 2000000.pinctrl: initialized sunXi PIO driver
  printk: console [ttyS0] disabled
  2500000.serial: ttyS0 MMIO32:0x0000000002500000 ... is a 16550A
  printk: console [ttyS0] enabled
  printk: legacy bootconsole [uart8250] disabled

It never reaches the initramfs `/bin/sh` readiness line. There is no panic or
oops in the captured output.

As a private comparator, I changed only `ahb_cpus_clk` at 0x5c0 bit 28 to
`CLK_IS_CRITICAL`. That advances the same build to:

  clk: Disabling unused clocks

but serial output stops there and PID 1 is still not reached. I also added
private begin/done tracing around each individual enabled clock in
`clk_disable_unused_subtree()`. Neither trace marker appears, so the second
loss occurs before the first individual unused-clock disable is attempted.

Each run used the same RAM-only payload and was followed by an
identity-checked 120-second power recovery. The board returned to its exact
vendor kernel and eMMC root after all three runs.

So I cannot add a Tested-by for v4 as posted. The `ahb-cpus` gate appears to
be one issue, but marking it critical is not sufficient on this board. Could
you please check the CPUS/AHB dependency and the path entered immediately
after `clk: Disabling unused clocks`? I can retest a focused change or v5 on
the Cubie A7S.

Assisted-by: Codex:gpt-5
I reviewed this report and take responsibility for its contents.

Regards,
Enzo
