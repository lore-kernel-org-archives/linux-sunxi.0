Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2639022B;
	Thu, 10 Sep 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049122; cv=none; b=T0mlO2KQgakMw1PeODIxpIfVRgpxDhYl+Qr7MMKjKc46D4t1IEXr4W+SPg/I8gDqt+5F/fHbyAguCEdA8wWjyGLbh9ZUG3e4J4cPZ7zDjuUol0/kureixFpXvSvIY3E5xzDSWGB/UT+4e9tDDOUPuxYICw6vFtFeYorbWcDy7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049122; c=relaxed/simple;
	bh=iHVM/eOsTgJOj4YdhkQx7JC4rk/lp7DOCquU0fpHUOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i+g5zgGEpdNNBK0Kyv01/wXPMmg08rvmchO0o/NewTmlpsBc5tMr9in8t5nmm7wViR5crkYf3CTO/KnymsYX7n2dTf1kay5P4mmlWX9RgiMfR29fkE9sml/RvrptGfsRy5QJGDZeBqkWx9dnmRc1HK7hX214viTsyiKstj4nQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlfAJ3PV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlfAJ3PV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EEE1F00898;
	Thu, 10 Sep 2026 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049120;
	bh=TC9R53yxfMHbE+dKbgzTe3p51hLjKjWrQe7iL5LJTIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlfAJ3PViDbGZQueLWnFeDG8lURHRFkpUet6UjqcQLG9yJgb/5fhpVB+3XFZDu9H3
	 /ZS+L5zOgVNx1WYVOwVXLDPWrSa8Enmh7rL+awHwTnGZkIV4OjmFukYLqP3+9i0fO9
	 So2s54kyPJDJF5yk+KsZTN3lrlEgomK2uc5KBqUJFv2LThEd+R2HTPR2kARx3qJMb8
	 brSO08qvmVmxk6WIq1w+dd6r9BJW/Pr+j81Che6dP3vV7OYxMYug0/QhF6yPe3N96M
	 zQO7tCLhlGa+6HfVDhaXssYkrG8wz1iv+ZkqjczbloCVy/TGbKNU78nwBp3uqPqj70
	 SmbxHhaztq8sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] pinctrl: sunxi: support A733 generation MMIO
 register layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260910133519.459011-5-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
 <20260910133519.459011-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:05:19 +0000
Message-Id: <20260910140520.82EEE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] sunxi_irq_base_reg() fails to translate the logical IRQ bank i=
ndex to the physical hardware GPIO bank index for NCAT3 layout, ignoring `i=
rq_bank_map`.
--

commit 45892bb17e985dc02bb352c830f93cc75106e307
Author: Andre Przywara <andre.przywara@arm.com>

pinctrl: sunxi: support A733 generation MMIO register layout

This commit adds support for the A733 SoC generation MMIO register layout.
It introduces the SUNXI_PINCTRL_NCAT3_REG_LAYOUT flag and updates bank
offsets, sizes, and IRQ register positions to accommodate the new hardware
design.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 15aa6fe62dbbc..d09467ed437a3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
[ ... ]
> @@ -238,6 +248,10 @@ static inline u32 sunxi_irq_hw_bank_num(const struct=
 sunxi_pinctrl_desc *desc,
> =20
>  static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u=
16 bank)
>  {
> +	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
> +		return pctl->bank_offset + bank * pctl->bank_mem_size +
> +		       A733_IRQ_REGS_OFFSET;
> +

[Severity: Critical]
Does this new branch need to translate the logical IRQ bank index to the
physical hardware GPIO bank index?

By directly using bank * pctl->bank_mem_size instead of converting the
logical index via sunxi_irq_hw_bank_num(), could this calculate the wrong
physical addresses on SoCs with sparse IRQ capabilities?

For example, when sunxi_pinctrl_irq_handler() iterates over logical
IRQ banks and calls sunxi_irq_status_reg_from_bank() which then calls
sunxi_irq_base_reg(), will the handler read the wrong hardware register?

Could this cause the handler to see no pending interrupts and exit without
clearing the actual interrupt, leading to an infinite interrupt loop and
hard system lockup for level-triggered interrupts?

>  	return IRQ_REGS_OFFSET +
>  	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910133519.4590=
11-1-andre.przywara@arm.com?part=3D4
