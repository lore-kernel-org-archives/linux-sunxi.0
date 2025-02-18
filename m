Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0D2862B0
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910582; cv=none; b=lGWT4KXu2YSP7uAxuyrigzx2hznGDSIC+LlxvjboBpjRgSkVW9tFf22VYJk+2Xk7zWZHJysyjGX4TozxgT/k50mvxjIE2Wl+2igJCoUyECA90OXSbjjT3saBi+O+t4UICCJWsPb+NSVucbMSZnopCu8QeT4Zuc/N1xGBCeQAm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910582; c=relaxed/simple;
	bh=XBvnhtwDek26Gxo79u1Ux49f0Y8cX7xfyLyyUK69Kd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqIaxlzXgCXgBg6jGoir91/faNf5Nx1vwhzRBRXqVJaDxo5g0M8a7m2S/rhEw9XeiQV1gGivU4OeVyy6awtqvvHUqRKGiE3LMrwwwSh24e9nMv9MlBaYE5Vc5ExlVXGrCBtKFA8TmI8nv/PWN+zU9OfVmzTp5VDuuRy6FsfYUNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e18WG79B; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e18WG79B"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so2723059f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 12:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739910579; x=1740515379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjzKe68KszeGBalKiITt7UFDZHe2rbRtyPnG3dABayc=;
        b=e18WG79By14SHzL0MvU72cX+6diKxj3nsZrQIqxpLC+GVTefhnDNUJi1pxSGtv+AOP
         BuKoZrzDhGh8kaWt0pqF6ezfZouCEDVEdAqD1upUBAFfI6SkgicQQ1SUmK9CsamLOAKv
         9GPRk6RKqhOWs/ikS9QNdA1z5RONaejQ3G5e+FUDO5Ip/mnUiFqeSNe+yennO66LvGdj
         DD7/BXlmj4DXkFG68DL/ttH27FanAzX9KGUF2iNgo8oMGwci96V5dQcwqKkmf+Mjqzeo
         jW5+DPtDDg3hUUknQ7F4RtmFXFxPcy27B0iEMYskRTgENl8QyQ0JF/qGG+2R9g4Bsd69
         33fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739910579; x=1740515379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjzKe68KszeGBalKiITt7UFDZHe2rbRtyPnG3dABayc=;
        b=e+ZeZ0WjqUDzx+qjalwQ9sqRDbDY3Xo+NtFpy7Wtihj9YAb0O7Y7oxcqYY58xkxcSq
         DnpjvgWhMChok3jWW8wwJLja1dot5v7Lian0taD9Ul1E+rouQ2u2g7j19wB+a4APl3xn
         qTxwbC4XXTY1jlL7DeSVB2dId7PFYv1IXbhd3ZJ6bMtkRTxHHb+iVo4+i7dpQwtBfgU5
         OcTkgqljHyB5x4DYpaxoLYesgi7w5+3HS/d2fkV9Yea3jQwnvvCkLGz3HPZgF5AGh75W
         osk2fV0jmbyinV1eCEKdUjOPA9CZzOVVzp9kSSP4yPfLkiVELBbXYmTAPZCYA8rY/k1i
         JFdg==
X-Forwarded-Encrypted: i=1; AJvYcCV0phGwG1tOzoFNl9eLSYLZJv3P/jfYW19YS/MrUXq+455sUek62fruxASmbxcOYHkHlylCzihsQ8j+Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPlcuB48ozfHXziGD1XQDUpKsktEGvE4naUbjsSJSOqiVrbzs/
	s7e7qfwopteU9Q27Let7p9PBw7wemVeM5vPQDPYK6gdDcC12dvwn
X-Gm-Gg: ASbGncuq8pmuTSH27nLCSxWPjpONSkEpi64wkZhVB0cJEM/UWe53MllKtlU7q7fgrqk
	jheVv0qLo8gmVvfESb2L16XX/YqdIDUEyOhwj0V74TVO+2TG7dutNKiXFUFlK9AK58pnZnYoG9O
	yZ/QUaRziymbneSKyLJoCh8jtPnkyAvOuc34sI62SK/toGtIYYi7WypCZQs9mpE1yCheToDr5mV
	nKOh6YvFUSPzkDcI7tV7B1rd3vDXH50Dc5WWlBZ+G9ijoN/g+Shpdu5I0nsmxpzlVfLJ2ti5KJj
	26rv73+/sQlQgYjhjgw55RKOclDvefl0byPHdjtsiPTYILdxVSGRaK6RLPsGSrAmqWQ=
X-Google-Smtp-Source: AGHT+IGFZQdwRCcDyN6MklzsVuExi442JwSaJur4Z7WeMPqhRjBlV4K4yUGnpTqPPMSpQeIwBBw7qA==
X-Received: by 2002:a05:6000:1569:b0:38f:5057:57f6 with SMTP id ffacd0b85a97d-38f505758c1mr4329515f8f.27.1739910578982;
        Tue, 18 Feb 2025 12:29:38 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm16332176f8f.18.2025.02.18.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 12:29:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] clk: sunxi-ng: a523: add reset lines
Date: Tue, 18 Feb 2025 21:29:37 +0100
Message-ID: <15399016.tv2OnDr8pf@jernej-laptop>
In-Reply-To: <20250214125359.5204-14-andre.przywara@arm.com>
References:
 <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-14-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 13:53:57 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Allwinner SoCs do not contain a separate reset controller, instead the
> reset lines for the various devices are integrated into the "BGR" (Bus
> Gate / Reset) registers, for each device group: one for all UARTs, one
> for all SPI interfaces, and so on.
> The Allwinner CCU driver also doubles as a reset provider, and since the
> reset lines are indeed just single bits in those BGR register, we can
> represent them easily in an array of structs, just containing the
> register offset and the bit number.
>=20
> Add the location of the reset bits for all devices in the A523/T527
> SoCs, using the existing sunxi CCU infrastructure.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 83 ++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index fbed9b2b3b2f9..d57565f07a112 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -1475,11 +1475,94 @@ static struct clk_hw_onecell_data sun55i_a523_hw_=
clks =3D {
>  	},
>  };
> =20
> +static struct ccu_reset_map sun55i_a523_ccu_resets[] =3D {
> +	[RST_MBUS]		=3D { 0x540, BIT(30) },
> +	[RST_BUS_NSI]		=3D { 0x54c, BIT(16) },
> +	[RST_BUS_DE]		=3D { 0x60c, BIT(16) },
> +	[RST_BUS_DI]		=3D { 0x62c, BIT(16) },
> +	[RST_BUS_G2D]		=3D { 0x63c, BIT(16) },
> +	[RST_BUS_SYS]		=3D { 0x64c, BIT(16) },
> +	[RST_BUS_GPU]		=3D { 0x67c, BIT(16) },
> +	[RST_BUS_CE]		=3D { 0x68c, BIT(16) },
> +	[RST_BUS_SYS_CE]	=3D { 0x68c, BIT(17) },
> +	[RST_BUS_VE]		=3D { 0x69c, BIT(16) },
> +	[RST_BUS_DMA]		=3D { 0x70c, BIT(16) },
> +	[RST_BUS_MSGBOX]	=3D { 0x71c, BIT(16) },
> +	[RST_BUS_SPINLOCK]	=3D { 0x72c, BIT(16) },
> +	[RST_BUS_CPUXTIMER]	=3D { 0x74c, BIT(16) },
> +	[RST_BUS_DBG]		=3D { 0x78c, BIT(16) },
> +	[RST_BUS_PWM0]		=3D { 0x7ac, BIT(16) },
> +	[RST_BUS_PWM1]		=3D { 0x7ac, BIT(17) },
> +	[RST_BUS_DRAM]		=3D { 0x80c, BIT(16) },
> +	[RST_BUS_NAND]		=3D { 0x82c, BIT(16) },
> +	[RST_BUS_MMC0]		=3D { 0x84c, BIT(16) },
> +	[RST_BUS_MMC1]		=3D { 0x84c, BIT(17) },
> +	[RST_BUS_MMC2]		=3D { 0x84c, BIT(18) },
> +	[RST_BUS_SYSDAP]	=3D { 0x88c, BIT(16) },
> +	[RST_BUS_UART0]		=3D { 0x90c, BIT(16) },
> +	[RST_BUS_UART1]		=3D { 0x90c, BIT(17) },
> +	[RST_BUS_UART2]		=3D { 0x90c, BIT(18) },
> +	[RST_BUS_UART3]		=3D { 0x90c, BIT(19) },
> +	[RST_BUS_UART4]		=3D { 0x90c, BIT(20) },
> +	[RST_BUS_UART5]		=3D { 0x90c, BIT(21) },
> +	[RST_BUS_UART6]		=3D { 0x90c, BIT(22) },
> +	[RST_BUS_UART7]		=3D { 0x90c, BIT(23) },
> +	[RST_BUS_I2C0]		=3D { 0x91c, BIT(16) },
> +	[RST_BUS_I2C1]		=3D { 0x91c, BIT(17) },
> +	[RST_BUS_I2C2]		=3D { 0x91c, BIT(18) },
> +	[RST_BUS_I2C3]		=3D { 0x91c, BIT(19) },
> +	[RST_BUS_I2C4]		=3D { 0x91c, BIT(20) },
> +	[RST_BUS_I2C5]		=3D { 0x91c, BIT(21) },
> +	[RST_BUS_CAN]		=3D { 0x92c, BIT(16) },
> +	[RST_BUS_SPI0]		=3D { 0x96c, BIT(16) },
> +	[RST_BUS_SPI1]		=3D { 0x96c, BIT(17) },
> +	[RST_BUS_SPI2]		=3D { 0x96c, BIT(18) },
> +	[RST_BUS_SPIFC]		=3D { 0x96c, BIT(19) },
> +	[RST_BUS_EMAC0]		=3D { 0x97c, BIT(16) },
> +	[RST_BUS_EMAC1]		=3D { 0x98c, BIT(16) | BIT(17) },	/* GMAC1-AXI */

GMAC AXI reset should be separate.

> +	[RST_BUS_IR_RX]		=3D { 0x99c, BIT(16) },
> +	[RST_BUS_IR_TX]		=3D { 0x9cc, BIT(16) },
> +	[RST_BUS_GPADC0]	=3D { 0x9ec, BIT(16) },
> +	[RST_BUS_GPADC1]	=3D { 0x9ec, BIT(17) },
> +	[RST_BUS_THS]		=3D { 0x9fc, BIT(16) },
> +	[RST_USB_PHY0]		=3D { 0xa70, BIT(30) },
> +	[RST_USB_PHY1]		=3D { 0xa74, BIT(30) },
> +	[RST_BUS_OHCI0]		=3D { 0xa8c, BIT(16) },
> +	[RST_BUS_OHCI1]		=3D { 0xa8c, BIT(17) },
> +	[RST_BUS_EHCI0]		=3D { 0xa8c, BIT(20) },
> +	[RST_BUS_EHCI1]		=3D { 0xa8c, BIT(21) },
> +	[RST_BUS_OTG]		=3D { 0xa8c, BIT(24) },
> +	[RST_BUS_3]		=3D { 0xa8c, BIT(25) },	/* BSP + register */
> +	[RST_BUS_LRADC]		=3D { 0xa9c, BIT(16) },
> +	[RST_BUS_PCIE_USB3]	=3D { 0xaac, BIT(16) },
> +	[RST_BUS_DPSS_TOP]	=3D { 0xabc, BIT(16) },

Docs say that there is extra display top reset at 0xacc.

Best regards,
Jernej

> +	[RST_BUS_HDMI_MAIN]	=3D { 0xb1c, BIT(16) },
> +	[RST_BUS_HDMI_SUB]	=3D { 0xb1c, BIT(17) },
> +	[RST_BUS_MIPI_DSI0]	=3D { 0xb4c, BIT(16) },
> +	[RST_BUS_MIPI_DSI1]	=3D { 0xb4c, BIT(17) },
> +	[RST_BUS_TCON_LCD0]	=3D { 0xb7c, BIT(16) },
> +	[RST_BUS_TCON_LCD1]	=3D { 0xb7c, BIT(17) },
> +	[RST_BUS_TCON_LCD2]	=3D { 0xb7c, BIT(18) },
> +	[RST_BUS_TCON_TV0]	=3D { 0xb9c, BIT(16) },
> +	[RST_BUS_TCON_TV1]	=3D { 0xb9c, BIT(17) },
> +	[RST_BUS_LVDS0]		=3D { 0xbac, BIT(16) },
> +	[RST_BUS_LVDS1]		=3D { 0xbac, BIT(17) },
> +	[RST_BUS_EDP]		=3D { 0xbbc, BIT(16) },
> +	[RST_BUS_VIDEO_OUT0]	=3D { 0xbcc, BIT(16) },
> +	[RST_BUS_VIDEO_OUT1]	=3D { 0xbcc, BIT(17) },
> +	[RST_BUS_LEDC]		=3D { 0xbfc, BIT(16) },
> +	[RST_BUS_CSI]		=3D { 0xc1c, BIT(16) },
> +	[RST_BUS_ISP]		=3D { 0xc2c, BIT(16) },	/* BSP + register */
> +};
> +
>  static const struct sunxi_ccu_desc sun55i_a523_ccu_desc =3D {
>  	.ccu_clks	=3D sun55i_a523_ccu_clks,
>  	.num_ccu_clks	=3D ARRAY_SIZE(sun55i_a523_ccu_clks),
> =20
>  	.hw_clks	=3D &sun55i_a523_hw_clks,
> +
> +	.resets		=3D sun55i_a523_ccu_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun55i_a523_ccu_resets),
>  };
> =20
>  static const u32 pll_regs[] =3D {
>=20




