Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2451A3166
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038701; cv=none; b=pEFhqFz78hXhFY/3MJ1nczgei5eKrNvpBAGBiQCUtZdT8TzluZbvlW2O1KYMZKHx1n4B5OVaIveaCbSyTPl0S+VKENKWfS0kS12Sg6XtqLJwTqIBHkaBoUf2W0CZiIf6DCbzy55H7aBXg/Rg0HD/cw1XtT5zpFiSi6Dy1XkEVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038701; c=relaxed/simple;
	bh=wwA1DmrvPhPs+fsizX01lY2e/W3pgwFyCIJYNF6pCtM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q3bg1mkuUyGywXZ19qBYtG2s5epws8LvqnuU/EWkE+ODBGgfM4Q/eeqqxm8GV+m0cTz9k1s33ZoYKMLX3W3SGZSvMz4URhUJ8ogjuGU9ypIvoIj/jxh6wrrbYx/rxc+KUZGbYqKAh/zSu6etADxGJZPsrSYqOAUol9vExNsmKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njVMskWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njVMskWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3E01F000FF;
	Tue, 22 Sep 2026 00:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790038700;
	bh=CAlF8jX9zGq5O6H57g4173llr3DQK0LpaaaHU8YEed4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=njVMskWCVVhKsh3ftM2ZVlfpDaFVeiefH+n5ONehDZ7wHNBISbkdfLteUzTm72l30
	 ncKyAxIVYxGhqysc0XI1MepkyrCIFXmFh0jmqlm4NMnFEDmuplHa6XWgAEuvaFQMpx
	 u5uW5rLyySB88DcN2HjzQWtM6yBZmJKLlesmaslp7YyA7Vy7rhB389IINvlo3dl911
	 9FQJtvMwNw78cZ8ljg7vDXUZNJN/iAUBUnll58orpNWpdP/9UgInSbdxYjCUMkT/Qj
	 AcxE+tXUDokGDWrAtynvZZzZ013Zdki5ey8gyu929K0r15r37OUvt3zIksRV3ysjzv
	 0KFRM91xqNaaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soc: sunxi: sram: order the publication of base against
 sram_dev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jaidev Shastri" <jaidevshastri@vt.edu>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
References: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 00:58:19 +0000
Message-Id: <20260922005819.CD3E01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] soc: sunxi: code and commit message mismatch regarding sram_dev =
dependency
--

commit 02f3c870b0e732bf484750fa2453c39fde232ed6
Author: Jaidev Shastri <jaidevshastri@vt.edu>

soc: sunxi: sram: order the publication of base against sram_dev

This commit modifies sunxi_sram_probe() to use smp_store_release() when
publishing the base pointer, and sunxi_sram_claim() to use smp_load_acquire=
().
The stated goal is to prevent sunxi_sram_claim() from dereferencing a null
sram_dev pointer.

>     sunxi_sram_claim() is called from the probe functions of the EMAC, the
>     video engine and other consumers. It gates on the file-scope base
>     pointer:
>    =20
>             if (!base)
>                     return -EPROBE_DEFER;
>    =20
>     and then walks sram_dev->of_node in sunxi_sram_of_parse().
>     sunxi_sram_probe() writes sram_dev and then base, both with plain
>     stores, and the claimer reads both with plain loads. Neither the two
>     stores nor the two loads are ordered, so a claimer on another CPU can
>     pass the gate and dereference sram_dev =3D=3D NULL.

[Severity: Medium]
Is this description accurate?

Looking at sunxi_sram_claim() in drivers/soc/sunxi/sunxi_sram.c, it checks
the base pointer but then walks the consumer's dev->of_node rather than
sram_dev->of_node:

int sunxi_sram_claim(struct device *dev)
{
        ...
        if (!dev || !dev->of_node)
                return -EINVAL;

        of_for_each_phandle(&it, err, dev->of_node, SUNXI_SRAM_PROP,
                            NULL, SUNXI_SRAM_CELLS) {
        ...
}

It doesn't appear that sunxi_sram_claim() accesses the sram_dev pointer at =
all,
so the data dependency described in the commit message doesn't seem to exis=
t.

> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 2ccaeacf8c706..0e0b86ad3fd37 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
[ ... ]
> @@ -410,6 +414,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>  	const struct sunxi_sramc_variant *variant;
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap *regmap;
> +	void __iomem *regs;
>  	int ret;
> =20
>  	sram_dev =3D &pdev->dev;
[ ... ]
> +	/*
> +	 * base is the gate that sunxi_sram_claim() tests before it walks
> +	 * sram_dev->of_node. Publish it after sram_dev so that a claimer on
> +	 * another CPU that passes the gate also sees sram_dev.
> +	 */

[Severity: Medium]
Does this comment need to be updated?

Since sunxi_sram_claim() iterates over dev->of_node rather than
sram_dev->of_node, the rationale for this memory barrier seems incorrect.

> +	smp_store_release(&base, regs);
> =20
>  	if (variant->num_emac_clocks || variant->has_ldo_ctrl) {
> -		regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
> +		regmap =3D devm_regmap_init_mmio(dev, regs, &sunxi_sram_regmap_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-mb-sunxi-s=
ram-v1-1-ad7817f0ee7d@vt.edu?part=3D1
