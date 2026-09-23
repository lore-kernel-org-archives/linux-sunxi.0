Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2898442FDF
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195432; cv=none; b=OKhYDsa0yCWP2r5JCZ2KmYkYTNEmbg5rTEu3a45c3SAI2TK8h39tUbJ9fV3Ed9vU+0NzRoEHHIV1fKVNZMTLxkracC/ErNZJGH5eAWsdPJKYUzYKLKJ5xcvk+e3qkKoPq9GikzHvI6Y2m2tlmHyjPMdql+ae3jBHB7GswK1KbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195432; c=relaxed/simple;
	bh=dEF21iRY3WuGzKFf0qaIPhEtlHwNHOdI2DrQgKysPSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UEfkZVZt1zBofif5lQO+L4BwoqpP7uu6+zbvbtOnwgn17r0ilinkrG7DFyoQ5iWt226Hm0jn0OWqrm8KmW95aZNm60VTpRklCX/B3Dv/z8DDdufY5by1bUiJQRfIzTULwv4OJqS84NJiL86aHg9vSNG5RvrqJLYStu52UaGOB8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixXPpDWn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixXPpDWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8781F000FF;
	Wed, 23 Sep 2026 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195425;
	bh=1rXmW5yYjUujOntb3D0W12fD4zguIw7rOYZEgSRRHQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ixXPpDWn/eu1eeDVSUpWdk7ZN7QT3zBcJfbRKkn9mGNI9uqb5sgRY4Wf7I2dAGNmq
	 alBMHgjm3In762C6tqlwIPlkFkW7vwCV4JgNrH7D/YxbaHCDCgYl5K/vq3Zm0KN/zH
	 gKdEvk1elGwrtkKcaZLDWzRh7cgfmxNI9HBzV+gR4tdnugC3RZEh34Lvj3lYW6tLL6
	 7lrjvHhnU7yleZjyEkyezn5QPOKDbrFQW1i0hD6bV9PKyvOhpbM62aiaF4sN4sazC7
	 nxdvdS5Qf37LhVP5559XEqVJbbi30g7Cgpsfo31k+7ebEPWyJI0HAYp2HNyNQCYo2b
	 GcPU9LvugLmyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260923201701.43391-4-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:30:25 +0000
Message-Id: <20260923203025.8A8781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pinctrl: sunxi: IRQ index collision for pin G3
--

commit fdee02e8823a26621c358b63abf2ff74202265b9
Author: Pablo Mazzini <pmazzini@gmail.com>

pinctrl: sunxi: add Allwinner B288 pin controller driver

This commit adds the pin controller and GPIO support for the Allwinner B288
SoC, covering 78 pins across ports B, C, D, F, and G, including four banks
of external interrupt capable pins.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl=
/sunxi/pinctrl-sun8i-b288.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

[ ... ]

> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "pwm7"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi1"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "twi1"),
> +		  SUNXI_FUNCTION(0x3, "dmic0"),
> +		  SUNXI_FUNCTION(0x4, "spi1"),
> +		  SUNXI_FUNCTION(0x5, "sdc1"),
> +		  SUNXI_FUNCTION(0x7, "io_disabled"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),

[Severity: Medium]
Does this incorrectly assign IRQ index 1 instead of 3 for pin G3?

It looks like SUNXI_FUNCTION_IRQ_BANK is assigning IRQ index 1 for pin G3 in
the sun8i_b288_pins array, which collides with the IRQ mapping for pin G1
defined earlier. This could cause external interrupts on G3 to be incorrect=
ly
routed or to conflict with G1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923201701.4339=
1-1-pmazzini@gmail.com?part=3D4
