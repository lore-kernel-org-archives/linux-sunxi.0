Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294625;
	b=nktpQaVqGN8gegUu84olPqWCEjxJD79PS7Shi0oewoEwOKopE5XZD18Z39kYfrYkC5xS
	 gUKOnal4lMyLJamoDiyW1CvmeuHhfRZnbUB7eq55Ww31408y0IOFH361SZ3xGdZLYcvys
	 rZktUrtkK2r9Y+QaHJ2tL2q3Zes2TmO0c5GilEBYHfRGgWPhawpsr4UOjRwKNnOyvZAUW
	 BjVE2neIUnHCHvUrXjgFLQcAlYJP2CLIm9DTIr1ZrOVYtNvYo7s9jZr4o24cK5wp07D1W
	 5DIgtK/QMeOnBDlYRjK0NeQF6u9IzFXlj7X3cjHBST8pyLJlxMbuYdgMEI8/0Azsy6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
	b=v+qJqcSc331h9WDVgEZwZQvUiDgrF47Rozo8CRkcHGrairO+gCQ2Z8WT9CKFAillm8iX
	 frcmusjKLxR4CPDFFPQ/4+XtimMMh7+KxMMVwTs3yShibTamBBLNgfeuBmA+lWlNrVH5h
	 TKdFRsdgT89xdwQ1/8a/Y5e4YJKsrcWrPbzGhUPXi/xZUmGEF5l/l45slS0pza/xTGlrN
	 7+hmTh3phsFmGmEvCIsYHKvnIIn8EIMGwKXx8wTVkJW59WI94lbXVgKYenlvHSykC29jx
	 rRXJUiGo7UQZFMLOD9MSy6FHlRJ/uLrmxRL5GGvT3LYzRwM+MsQ+fnoRhzQrq2DjVGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsytW2oO;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4BC606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 17:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsytW2oO
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1378376241.3
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294624; x=1793899424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=jsytW2oOT3e+djo5S/sSdcwjRQxIeJvwgFdRWiuQDfjUQT8xLPWpb/3LSOL4u28QXt
         oPwOmNiH7dHHW5uWeP5Bad1Ojl3eUFZK3swJ+X2nD7+G/vrA3WYYk7XZKJpgKs8umgAX
         L7xbIiYcANCOksMtyzPG/V79Vmjs3p/lBtb/hJs7/6akEkXe0dOXQMumxBSNyTd//d6r
         G+XXG2obeR7VUuYwC+thDRcMe/UBSM97VF3VqU2KqRGNHRLAf87YvuhgY+buNku+zyMG
         2Z9ayCXQHIjhh+PJImpPHD/RVJV+SLi/rd+hQPsusZ+WkVppEpoDx1OGiGMrQffa0TqU
         5rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294624; x=1793899424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=LmFwo42h7HUSFKJ0yu1LpXbM4g2nT44har/PygRTW87Rqv2TzUMI8sES78zxVxmS8B
         LewsEdcjvAFF+B3/uQhWNcW0YKLIvNpR3kgzOLwrnjGh4YUP8iP6Kl4UmAxR8RerTI4f
         gnko3EpwS/Cxgw6yN8IYerodJZHhkcBRWOS0/PVUUBNNCQTYwAZd81uc1MD1QKyxy1jg
         HRX57fj+HfdK+O2D+BzHUnJicpNx6dD7DHA5BMbd4lXjxySuS0gbQGM6l3FiIBUJiU6Z
         FuktnWgR5WD59hFReKssTxwLHAUsZOJbPlRx+dv36j8E/OcDSGGphpAaF060fdjPTra3
         e0hA==
X-Forwarded-Encrypted: i=1; AKwUvBwRSQymqsnJbbhm22MWjCnaBb5cMkNBmC7FKiqEMZCQ6Xfu9yorLLZGZuEc/ifsa1aNZUQ9kedcZHoKgg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKWRjLK25mr9lreY6bVs1/qWTSCaWH14NKVch/pIoFskl/fNAFm
	rAA71XxBIPA1qSah0Tztf8yrFiSw/2puRyIAvn4oGitYCwwQUrSmOYeT
X-Gm-Gg: AYBFou2P3rOWwTCcz95KgYIoiRSp7unHiOYFJc2uSb5m4/2vfCCbkVyS1kWxHQXLUbl
	34TtlkJ/0IpSmBy25xY0uvciq8UMOlHCHjYAwYlFPcW8rNpFbmMrSW1SGTw8/MHk6xrRNZ0dmbJ
	WKHpULsQd3/hpRDHauqJ+ZiuOaN8zwJ+iOHWNGa7YciSm1ksYIW7hHVRVe5fPIU44K3/fy2CFCR
	/Ud/zjlJJdSdJUhUEpwWwZlbj04v4uQCenjwcbubrmyi1q3JEZEMgo3/sHoZ/6MBVIitZQrLgbX
	3xA3/VXjDIfe/Je80rSiiJaZbBZGTZi4N54vrY3kRuQ/yaT9wjulIEdkedTcAEK5t1WPzew7Cqc
	NEakYcyUvQpaEV6LbXKW347aWoQZikMlScSM0BH6yVOP/punSn93L9ZciXaLqPxXf5zH87iqs7d
	mN9QQ5rJrfixErP9ovyZoRmPRAM3znq5+w/wdXXlK1e7S6Fu9Mi4ZeleIfO9svKfghXDh9UamK4
	VFl+WF5o+OujQ2gUlE6Zg7p6qtUtvVRGV/6YNfmeriXQBKzVnDkQ2M1pFHFrSTIOnzie9ywQ7yQ
	HXVOQXI9En7HnSGnI3Tx7qtqCZE1UC/U0QouogK6dB6zhzkcE+NTLUbviAueUTageqV8CrSlKxY
	3BNljaJNN290WjXfjUYqlioI4l1jkCeF6buDDC2Y4j9iAWAwo/hAAuHFWqg==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr3505471137.8.1793294623916;
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Thu, 29 Oct 2026 14:23:23 -0300
Message-ID: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

This goes on top of Xu Rao's v2 "phy: allwinner: sun4i-usb: disable the
PHY2 PMU clock after SIDDQ setup", which touches the lines just above:
https://lore.kernel.org/all/CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com/

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
prerequisite-patch-id: 77e92419764dd34a945f7d546d4cb1dccb6da112
-- 
2.43.0

