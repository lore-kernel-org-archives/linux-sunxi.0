Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398992;
	b=kQX+XiDALo5y6QPyd6B6oxlw4k6q09Jp80Y3Qo3cmo9UF3y6ILW6W6+iV3VMLKBF38sx
	 lZEjyYDSVYcKuZzpHPa+u+ZfG4rUneS3CYaNuFaH6/v971e9FfSCrI6GDjxCeS9uJSwkp
	 WkoEjAT9S/5LYhyo8KPz3x7qqvC87/Q1hoFUQmlkxSehOvgGx7lzEERpQfPZ8DcYzVcuv
	 tYJWF8kEfBMdRK/KhrGSZ1vFMlBcrbEy7MmHQK9JLpm74PtpMROzoWqBcC550VdXZSQ0/
	 kMToDxKRLwPzrYl0Le8LF9rbKo+Y17cwQUF8qSq+IXSttstQZaigPRs9WWjDZpeab4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
	b=cGMiWPMEKUWi1AVQg6RhU6XmC4wTbYZlSljnXSAB4PXkf6uVRanb5hx5ZH+6zk0Xa1pU
	 I62Cm72dO/MSBWmp68v7HwGGb8XE8PXUYcNlku3oK0nylu+EElEVYP4oR9g3buR7LFEbf
	 Q0dDGhtg1WfOEpT4m9NsnrfIriC6bQPhEGLYozRo2yWwtsNZDNx1pzRKDhaTSS5Roe9+f
	 6vstz1sNQAIaZ0UMIAJm6se3L5m0CSj/qC85Ofe5q6au+N0lTAOgdTi7XGyBNmz/2Eoqj
	 KOwwScp7JiXxAo+qmayPRgbkWpUZ8Yt84o75P/NYZowLcr9nqh4J42sI2HVNqAr9qZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixxVhook;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4032606A88E
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4032606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixxVhook
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-55e0090c580so990795b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398991; x=1795003791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=ixxVhook1pEnDG3Qash9xx+jkTDhUJVhj5TtlL2w718wOsxIwt0XFATA3f0T6jo0Tt
         CexPWlwp6ZCI3bTbdZVzquR7kkEgsSoMS+ENb3CK0sgtBBdMSY2lk1pxfp1A6UXNuzl6
         HnJDqlJdtWIzQu/e5MKd5Fz12xbWIDE3TLvLQiXt6kq+1yeRzgyLH+TCQHJls1ds0zpk
         9PxWcZTy/nYblD0cyU7WrzSR3LhLzAEY8iwPkBk75ngRshjrr1aLF7uxLSMZwg7eE6xA
         HcMMbMfuQhFgt9kU4gyoL9mkKcsmQVLm9xyVWTZ5l4i848Pn4Yetf0nlshWENxj6huCQ
         jWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398991; x=1795003791;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=0+wTeL91MmB5i3N22I6a4SD7hyjuWQ13iecbSi3IACu/HPWEK6YA0uOZbd/5ZHA/H1
         gsW9cgK+1Km6iPleNtSjEg/O5zA0z89ueOelB5qsE8cNspvX6Rhle8000auxnGEjtUp6
         lNUDqM//ZtCqwYjdBYNuF91dLF51FyyUTUMiJZqHbAJR1l4FcDj4ibXsaaekdbbwTS3S
         4D1MrvjHLujaSpxboYQMtOlryJUbamUaLt7579G5ZtUctAts/FIqMMOpEeP+v7Py92Kt
         TaInDtaGNb1HpAa5UeiKzGBnjL9TraRoL1SmAf9vUVOVW6x2pinQ2wHMAjKQDdTbE2WN
         0FJA==
X-Forwarded-Encrypted: i=1; AL+hErFTBqdb7Dz8oRUmSrGzqzfqhd6ixT7XxApmFoqHhrdRBSeOx6iIbEbHeCJqm2gdTg3j8WJAionCjguKSg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+bR8dB8NhGIQ7N8pKvt/IDPwq6wnVEmYYTRdjFl+719mCj/L5h
	WvFP7Bgq2hvEgwNaXzi6UP5pfAY14k9uk6rOiyls3tO1OAE3sBLWO3Jc
X-Gm-Gg: AYBFou09qxLQFiA9NEIFnTSS9A3uwPNPrCaIWSvHgeoOl4R4nWoOQIoXdzB7eU7uldH
	Zgi8O+1pQytcxkl1iZ/jMAo9tbmElAmKxiKpBB567QxRp+GqvBWZ1atY00Ufi8kPo1iYPM4Ea/b
	61MunaS9iKxK7TIsOxBUOSH5fg0xW6AKbnBcHtUZLHW7r35KuH+sqGx7jtpDCqLzhvOyaoGvHV7
	Pd2pM7kkc6JBXgwBwIopvc7UWOQVc1sLMLbnRwmOjOTeC/w8U/DNSSU1tFloHaYlcm9oUqpFOq6
	zvzx94nLgPI724NPQb/2XFCldbGcW3shNMewnZV7RaiSZFIA80VC2zQZfxwz4luLBtJNmhGEeyJ
	dUER6xmLcOGBXu8mdm8fSWrpweLCIW7TawgpCfsPzwBvgXlBYOGbOaSUHropf06MwCE+TYMRers
	XF7I8XNEj4ZcFzdqJ1OV09fGlYk2GXS7RjfQ9dm0E6nAK/OE1CLdK+RM/IxjrxhVkhW9qZE3XjE
	CrrJ5pVqOOE36QtwVqVsaCOduxiiqeGvQMPSNssn1CVNVtg6bKRlkP1hM/h+5F6GBQk4GzRjrcW
	pGDcYN0wiPBwQqQzRVGmmp4ppa+gERuTetgxl3Izr7YzWolPcKfoBMzyEc0pHyjxRCPbbsNrXhD
	DnrtJ
X-Received: by 2002:a05:6808:244f:b0:53b:1d13:dffd with SMTP id 5614622812f47-56b92c464dcmr1457460b6e.7.1794398990670;
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm4958534b6e.3.2026.11.11.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Wed, 11 Nov 2026 07:09:48 -0500
Message-ID: <20261110-a733-fwclk-junhui-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech> <20261103-a733-ccu-v6-fw-clocks@gmail.com> <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
Content-Type: text/plain; charset="us-ascii"
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

Hi Junhui,

> I'd prefer not to mark these clocks as critical just for the vendor
> firmware. You can see my reply in v5:

I agree that native PSCI and a future OR100 Crust port are separate from
the vendor SCP on E902, and that future E902 remoteproc/mailbox drivers
should own these clocks. Vinicius's native-PSCI reboot report used locally
modified TF-A on A7Z [1]. Upstream TF-A still has no A733 target; its port
is under review [2]. The immediate problem is that the new CCU's
unused-clock cleanup breaks reboot with the firmware these boards ship.

On one Cubie A7S, RAM-booting v7.4-rc1 + CCU v6 + DT v3 and its dependencies
with vendor boot0/BL31/SCP/U-Boot and no clk_ignore_unused, the run without
critical flags stalled at reboot -f. With only bus-r-riscv and bus-r-msgbox
critical, two warm reboots returned to vendor Linux while r-timer0,
bus-r-timer and bus-msgbox0 were 0/0 (enable/prepare); five flags also passed
once.

> Since you've already submitted a separate patch adding these critical
> flags, I'll leave that to you.

I will narrow my separate patch [3] to bus-r-riscv and bus-r-msgbox.
Chen-Yu, Jernej, Samuel: would you take these two flags as a separate patch
until E902/mailbox drivers can own the clocks? There is precedent in A523
bus-r-cpucfg (1dba74abf3e2) and Meson AXG fclk_div3, kept critical for SCPI
firmware until the driver claims its clocks and a handoff exists
(drivers/clk/meson/axg.c).

I have not tested power-off, suspend, either flag alone on A7S, or other
boards or firmware; Vinicius found either flag alone insufficient on A7Z
with vendor BL31 [4].

[1] https://lore.kernel.org/r/20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200
[3] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[4] https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com

Thanks,
Enzo
