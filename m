Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937187;
	b=Y2p4OwY896bt+x9JPMbYWo3UEGBYro1XmSHTMCQ4amlsEsgJ7rnbEhIRwAbiLPLqNBEY
	 UV3jtK34uf33th90v00/SR05aur25cILkXNs4BibYAomR3ZoCUpKW8P79SUeMq2IOJMnv
	 CSPuZ71Y89zThYYPpMjLG6IAouXVrQJCKH3clplSHmQE9P6l4Pn77UfZogv+GbvaqEx0R
	 ArXtQigWxo+YRWocu2zUW1GZr/NZXuO3VO+1Q3qP6RWw8Fx6Wutap3Bip18xu8gO+gn6P
	 ennQsymiybNxWiTKDvSFxCnp+ZS+2ANQiMq2kn/9N8rvp3mCaRl5m0rWKNcmPL7FWsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sYFPd41i3hKOPb7ElJhVpPl7TKbKVA+dirHOxIiACxg=;
	b=kYkkryfPnJ6wzTRe/WgO2FGKhyLuLHkbQMS/aSebGoh1tD6z5QF5Qd4ncEZCMA6gIm/T
	 RmSsihfP31TrcKMV1Rbp+NsZ4rnqd1USd2PSTxA4FMaHP0dKCBJU1P8sU0WsnDcwYwi1P
	 Bk9fxKRSuU3QG3X3YmhbKEOwSGjEgZqCMUA6VUzP0KD3Y7oaOZJm+tUIto2UrztcEFcJW
	 E0LgWynrvNxQ/EdTSI3cE15IpJ1n6Avw99FcgYzdFb5uyEXEJXZb4p65/+Fg/wEG3eBTu
	 pnj+omrpALnxy5do8BBR0sGwMoIx/9whTTXWAacqgXasEeh7OvY1hNbmvP89WFUCfRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B594WxHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC482606A31A;
	Sun, 25 Oct 2026 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B594WxHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148A61F01825;
	Sun, 25 Oct 2026 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792937186;
	bh=sYFPd41i3hKOPb7ElJhVpPl7TKbKVA+dirHOxIiACxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B594WxHkbQEYBjhurEkNH+8eFDOf8E9TVu0XXp2RPXglP9owiAIbZVpKSj1XuSHqk
	 ULzGPImv8NAa2Xl/yeUzls9P2bcTpv55arDGkj4oKJFCQz6nh9VZg5r9EtJ0IyCB38
	 TqPQshPLIvBJnLNnk+XJ+PTVWMm3g3BiS10RhJn0uJVcK7uLFo8Jdvg6DaSey9V46r
	 zlJFLuLW31EmZntbZY6ENIVbB9QUmVmLOfiF4ddcgT+5UvEsd+VpMDQSWjYiKG4MQw
	 YZJJYvMhm6M+qR1naC88nrtMRXuRU0EEha6o3jiwcefCLRUmxSEmw2Ud4RlfYfEtYI
	 xW3wik+rcxUWg==
Message-ID: <sashiko-outbox-184238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025135745.102970-4-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
 <20261025135745.102970-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 14:06:25 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A733
--

commit 1d99efa95c547fd409284e1974176bcf35345f69
Author: Pablo Mazzini <pmazzini@gmail.com>

pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs

This commit updates prepare_function_table() in the sunxi DT pinctrl
driver to number logical IRQ banks starting from 0 at the first bank that
supports interrupts, rather than starting from PA. It also updates
a523_irq_bank_map and adds a733_irq_bank_map to map logical IRQ banks
0..9 back to hardware banks 1..10 (PB..PK).

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctr=
l/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65b..3ebe926a1bc6b 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_=
BANKS] =3D
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>  	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> =20
> +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, 7,=
 8, 9, 10 };
> +
>  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> -	.irq_banks =3D 10,
> +	.irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> +	.irq_bank_map =3D a733_irq_bank_map,
>  	.irq_read_needs_mux =3D true,
>  	.io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>  };

[Severity: High]
Does sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h ignore
a733_irq_bank_map when SUNXI_PINCTRL_NCAT3_REG_LAYOUT is set?

In drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c, a733_pinctrl_probe() passes
SUNXI_PINCTRL_NCAT3_REG_LAYOUT to sunxi_pinctrl_dt_table_init(). However,
when accessing IRQ registers via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(),
sunxi_irq_status_reg(), or sunxi_irq_debounce_reg(), sunxi_irq_base_reg()
only calls sunxi_irq_hw_bank_num() on the non-NCAT3 path:

drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
		return pctl->bank_offset + bank * pctl->bank_mem_size +
		       A733_IRQ_REGS_OFFSET;

	return IRQ_REGS_OFFSET +
	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
}

With prepare_function_table() in drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
now numbering PB..PK as logical IRQ banks 0..9 instead of 1..10, and
pctl->bank_offset set to A733_BANK_OFFSET (0x80, the base of PA),
passing the unmapped bank index in the SUNXI_PINCTRL_NCAT3_REG_LAYOUT
branch shifts every GPIO IRQ register access on the A733 down by one bank
(0x80 bytes), so PB..PK access offsets 0x0c0..0x540 (PA..PJ) instead of
0x140..0x5c0.

Should the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch in sunxi_irq_base_reg()
also translate bank through sunxi_irq_hw_bank_num(pctl->desc, bank)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.1029=
70-1-pmazzini@gmail.com?part=3D3
