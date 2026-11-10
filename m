Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315749;
	b=zZHIglpkQHt3V1Zw2bbNyMYrJbe+Pe36yEQXu4bV5iIaErOzAmP9V9GFoBJeKHYFvRpf
	 arFcOVo0DsN3BT1cTN40hlekHu/NtLx9qx9pw9YccQ++mSZbZCWB3ZBEpFyLXW48frTIc
	 R4BdQWgabyjbowqn4uIo6AVWhlD9W+zGGo+gp3Zz8Zl9CJ8oPwrW/WyCtTwU3Tsw7AZx7
	 wwF8SzAhzTmY+krznoD6551FVaeMEiocAawbnibVJRtZKHuPD5jHOilQxmk7Hfo9hBx8n
	 Bs+O98rSMDZCbmd4jHdfVsZFqBhTeQ01KO5BCSTqudlH3wNh+flxp0bLpJ4MYtnirAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
	b=MYytwe6zrE9xl9PQw0FQM8hvqgkMsHU35kE0O4WEAWvYVFJlXZ527nsNX8E0s03sNmNr
	 NhkwlHudgD4ftnLlEBJIfEFxOoPtb6AEputRliGaTV9vJ0WU/7bBuXzZ8sv0OpzaPXmnE
	 updK+KY8orvIRgUXkDsIjUPWgCuAAMHN9sGwgScPykBOpmzAHOg4oez965DhQcT3kL0Je
	 ias7xn316tTj0kXL6a/ZC3RyLK4U966FB9Xp+5FyL0d0ubtNvUyIjiYm12FT2ERYHpI4j
	 5uj7xj6tWMz8DspxIExjBD/H8cFnVe9OgLkgKWB6dxc4lN3UspdihEiuEQoZ8Yt7aIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncM8M4TC;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC72606BFC8
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 13:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC72606BFC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncM8M4TC
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso440033241.2
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 05:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315743; x=1794920543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=ncM8M4TCi6xMaVdISY2JzgrFfj/4CNmf2q3oBQvRFUUAUmeD2ApMtvuRDi3rVJg7r3
         STMc4AsFRe2oH9S554ET8FGX5lKwKgw3FafNsBqzYiBghmLEvHo7zQJrw5AuHvSxrHIm
         ZYOAFw1vonDKRD/tDkB/E5sQOru0hBhAXMoDJRzX8ghUCO0/FdHvuqnznCvAvdajdS/p
         GLI/JGvhIdhEoox0iJyLDY0oKHLgzr2H2SZIs0eKAyUtfpv3Ajx6FrRQVMtTF/H+GM0x
         3IMEcvAZxw4BleiFgfn/XXJBfnDmAYAsAnPbDCu0gUoer/BnceJh3F47VtJQNag4sW94
         6HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315743; x=1794920543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=VHwOrh+oLMNLqxJv22h7ICVt685F8z5bFzzU/hIkgUokoNzoeRFTsPRIcaKVMsMbhf
         m9r4Vw5jiDJ3MwLx6/1IKJqICnVcNBvv9SrR+pmIeQqmQKqJvMprCIMbla2o/Ui+hH8M
         /c9gZYzSb+4lA0VMa6uKjJep45PiGxF5k7ui9kGZMyRWhhA0At3FM6eU5IiLXFfFJCv5
         6fGNIkUBf4S9jvAOwd5kY7vXvNgwzCnMWdWClOQ3VMjR592yBGx63gt3uKw90Wf0A38t
         0donHXKVVQYwr5OfaKCfzCJ5D+cek0uokPk2aM8TIzNeSCr8S8RRDvHVc8wQ5SOPsSoJ
         CPaQ==
X-Forwarded-Encrypted: i=1; AL+hErHCLj7H6E4DRWRsuww2nsGUI+RhR8lKJUGmfKBANuh/uaolxJUIcFWYc0f+SpcjMs208ihF2MoGnTzHBw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+MmDsw3n49+vWuPxAQhwjtndWTzuoo4zRFjPo0o9c8Kf/NqTYq
	jFti/05/bUXHIFY7SIvFsd12OyPJh0XYT9lhC8ZhTMeC13ttG8xwPCRm
X-Gm-Gg: AYBFou12QiseHnoIybR3bYKAnjVcSArBoJtHt0SXKJ/smasvfpsaK9kbjG+fJiVSvhC
	FEqW4XuBbsLdsXuBl6Adyb/zHd0BY3UR+jlf4GAIVts3S2gshqu0I4oLeWTtXaAr+ghZwDYlf/z
	opKybOC97v97Nz2rDH9UxKHImm13ja0/RjOTHlQJ56+dTQaDDTvkfGRcIsVi9b/L+6ZRIa3DBnN
	Iqyj4dWLYPWQskEna45YOKncFFoTnUgdyLRd+/pqZDKppon8yiCgA0bCc9g/R3VY3Ei7FhXrWQA
	pxXzvC5mq/UTUmMk0nPi1godX0jo51qmDPPm+WMDCUG5gOFukWDTp9NJxnd4MsKfJJqikQ2T0Gc
	D0+g0lqpNB4yvL39yJEloO7hIHhToGhRWh/iRtFiZyx99NqSZLZwtRZfUOucgCQTEUPxe8oeC6m
	0d5pz4G/ZDRrhETXbJc2a3P7Abf7Fqe+gMirPHyJBj8C2YPJMT7a5WOMJgk2+SU4oeg4gS2Kmc2
	XvkQI7nRJ06czQqTUl/0SBHbUPqi8My19pRKX8cH3PoFIdKsOjKp/EGtsS0nxY4CFMoybdX1nw1
	dI7dTddg9UPImJVbvjFVzmtb7K63uTPBGR1jxN7PSMhzh7ZC3LGVrRs+8ATCq22tDNXVpjZ1y/L
	a+l0GzmerGYpZ3OiQDNTexUvF7JxWNOfUxxQxc7TXXBXezSnquNnB1RCLfR83Eu9XJ+W8bUN3Pe
	g=
X-Received: by 2002:a05:6122:1d01:b0:5ec:c3ed:7d99 with SMTP id 71dfb90a1353d-5ee0d0a5264mr742890e0c.6.1794315734491;
        Tue, 10 Nov 2026 05:02:14 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5fd00esm1573509e0c.16.2026.11.10.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:02:12 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
Date: Tue, 10 Nov 2026 10:01:57 -0300
Message-ID: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
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

The A733 description sets irq_read_needs_mux. When a GPIO used as an
interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
interrupt function is 14, so after the first read the pin is left on
function 6 and its interrupt no longer fires.

On my board this breaks microSD card detection: the PF6
card-detect line is read at probe, and after that neither removal nor
insertion of the card is noticed.

The A733 data register reports the pin level while the pin is muxed
to the interrupt function, so the switch is not needed. The A523 and
D1 descriptions do not set this flag either. Drop it.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Tested on a Cubie A7Z with the pending A733 clock, PMIC and DT series
applied: before this change PF6 read back function 6 and card removal
and insertion were not seen; with it PF6 stays on function 14 and one
removal/insertion cycle was detected.

 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..456d9170c2a2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0

