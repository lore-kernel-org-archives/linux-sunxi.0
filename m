Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50747D957;
	Wed,  9 Sep 2026 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943497; cv=none; b=bK2AJt5MovB4hM90Hcwfrs1m9mjeRY27a/WPm/eoGn5XmHuajGal6cXf43yaGv6NetvO7PbUzxuGBa34G7Vyhgvdpsh+NRGI9v3Rwg8pTA0nSYqlOtmovgrw+YBSZAu62P0dLd1DKBsv3sylEleXdBBempkoQYqVaCUyJHnKIhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943497; c=relaxed/simple;
	bh=Zqe8OB97ij2Kvb2paWRhuVr4nGq8KAjq5ZNb+vYzvjg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ICyScfjWWvID+dGhZ5BzOPFdHT86A6qYyYFwF01JgOng0ZZA8lzNkX9F1D7MnSgNz5vIrkv7MuQHmEM66LTkOMsEYROWjJo4+b/kH7ike4kIuXGzobbsKgRtbenxwRhDwAN6S13xYsgltK6zPkD8mtxTjSS9zuK/9d4pHvA9ji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+dtl1kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+dtl1kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C591F00A3A;
	Wed,  9 Sep 2026 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788943493;
	bh=mI/OCnPdpGXWg/zb0umgLaX5VtbHl+HNKwh0RVPjinA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N+dtl1kfr+bMzOLMsq/apz5ntBwBztjD/g+/M6gyn7iA3SXxhDduLMsWLUR7RsUjS
	 iuab1K630W5EwflhUfWLAsJ/C+tOBrUCvHSE8uOO9cLbtQMUG1EImaDr4RfKt0FPN/
	 UvjNv1IDsglrugESyEwc/yolYVWiRzC0zoN61udV5B4amXhtdjYSbXxfVUmdQM6EWK
	 xKtLCnwQk2GyoRtZbpVLM030ok0znHud0nhyJJIUjKkR0WD6t0tX0+Mf4sSjExzCyp
	 o+zfJe1My31Acj0kFnDnrGasz2OEfsHgD0FfvReYi4PEarVZ2EWX6cUtUc58d6BiJH
	 1TN00aAT/JBMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/15] mtd: rawnand: sunxi: support randomized OOB
 formats
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-10-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
 <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-10-838cb0ba1547@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:44:52 +0000
Message-Id: <20260909084453.26C591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A divide by zero occurs when maximizing ECC strength for a 512-byt=
e page NAND.
--

commit b0b5203da9f471c1f78c9b3ee0393b943af5ad6f
Author: James Hilliard <james.hilliard1@gmail.com>

    mtd: rawnand: sunxi: support randomized OOB formats

This commit adds support for randomized out-of-band (OOB) data formats on
Allwinner NAND controllers. It honors the allwinner,randomized-oob property
to keep the bad block marker in the randomizer data stream during normal
hardware-ECC transfers.

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 51d01f7f539e8..138a141edbe4d 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c

[ ... ]

> @@ -2234,6 +2462,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand=
_chip *nand,
>  		ecc->strength *=3D 2;
>  	}
> =20
> +	/* This format requires an ECC step that fits in the page. */
> +	if (sunxi_nand->randomized_oob && mtd->writesize < ecc->size)
> +		return -EINVAL;
> +

[Severity: High]
This isn't a bug introduced by this patch, but earlier in
sunxi_nand_hw_ecc_ctrl_init() there appears to be a divide-by-zero risk
when probing a NAND device with a 512-byte page size while the
nand-ecc-maximize device tree property is set:

	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
		int bytes =3D mtd->oobsize;

		ecc->size =3D 1024;
		nsectors =3D mtd->writesize / ecc->size;

		...

		/*
		 * Once all user data has been subtracted, the rest can be used
		 * for ECC bytes
		 */
		bytes /=3D nsectors;

Since ecc->size is hardcoded to 1024, nsectors evaluates to 0 if
mtd->writesize is 512. Does this cause a division by zero kernel panic
during device probe?

>  	/* Add ECC info retrieval from DT */
>  	for (ecc_mode =3D 0; ecc_mode < nfc->caps->nstrengths; ecc_mode++) {
>  		if (ecc->strength <=3D strengths[ecc_mode]) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-submit-sun=
xi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com?part=3D10
