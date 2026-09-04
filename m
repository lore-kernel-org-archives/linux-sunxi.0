Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF263655E0
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562050; cv=none; b=ol7uklxqHr7vo1zDvoBRks2AjxQ8aHQhvEpIYdu5XIH0LrFVlaXtsgEcm1EWoYSIAbwrmIsT2UZ/e4rgw6QC/d5jRJgsN2bzxAJ9A0CBK40o2HcYcA5sRCZV5WNzGQVoRrWJIqNknXBk/+Tvk9cTRZxL1ajKN5Zh4YWx9F/3ETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562050; c=relaxed/simple;
	bh=B7eWGhVJFdihjP6RIR9J8Gh4VFUHJ1Y7bVE6Zd6ZoIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XN3w6VMgFgRcRPEAz7SMr/SFLbhLuxuK0FP3MFO+7l+o2m7EdzDOLOVF7k8yNmNM1Yse1q/KRgSLQ3OHblCKvFffhRWO2HMZimuRN3rlqrKVS8g40oBGNe3IPdgmWv8NUlZWrvYDVAyxQVEL/dSVm0CdUhbjdNgJZEqexFEOLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dk4Grmwg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dk4Grmwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A781F00A3D;
	Fri,  4 Sep 2026 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788562049;
	bh=ceEtJbge7Vm+wHupZTiK4x1YWFUQ28T68QL/SRx3Phs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dk4GrmwgmRndBdZ0KNuY+LG52mRHB1Ysc3aFEtl8BXentxrahSSdLQDKym1OOlq1U
	 oPo4udZh3z4gGCc1wuqRLSR+1202qIKLAtAjXtvVD3znEo81+VrE7O2whrKQluqwJ8
	 ZNeAjXR8LakjzMJ/zGlbzm5alhPsDSsmWEowWgNiprbJ8ZJIIN6In7NWduffHJvzzy
	 B9scWqnrbvmuwnuJXtfxMSmsBjJp2r0LPlzBfp4ByErL82zc17N5p/xAKFAgevIGQK
	 +3+McUy9k0uVRGkcgmmE8o1qwL6vzhCKwx0Ug26iOMv7r0JLLiSHd1QtNH4ba/4EUG
	 KXXC+qIIbrjug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page
 size
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: "Michael Walle" <mwalle@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, linux-sunxi@lists.linux.dev, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>
In-Reply-To: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 22:47:28 +0000
Message-Id: <20260904224728.A2A781F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ECC strength maximization overestimates available capacity for 512=
-byte pages due to a bit-length calculation mismatch, causing initializatio=
n failures.
--

commit de85ead656c2f999d69dec7e2c0a592634ba071e
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: sunxi: fit maximized ECC step to page size

This commit addresses an issue where maximizing ECC strength for a NAND
with a 512-byte page yields zero ECC steps. It modifies the driver to
dynamically select a 512-byte step for 512-byte pages, while retaining
1024-byte steps for larger pages.

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 83666dd6cb2a8..de1e6b49f79aa 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2084,7 +2084,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
>  		int bytes =3D mtd->oobsize;
> =20
> -		ecc->size =3D 1024;
> +		ecc->size =3D min_t(unsigned int, mtd->writesize, 1024);

[Severity: High]
Does setting ecc->size to 512 for 512-byte pages cause a bit-length
calculation mismatch downstream?

When ecc->size is 512, the maximum ECC strength is estimated using 13 bits
per symbol (fls(4096)):

sunxi_nand_hw_ecc_ctrl_init() {
    ...
		ecc->strength =3D bytes * 8 / fls(8 * ecc->size);
    ...
}

However, the driver later unconditionally calculates the required ECC bytes
assuming 14 bits per symbol:

sunxi_nand_hw_ecc_ctrl_init() {
    ...
	/* HW ECC always request ECC bytes for 1024 bytes blocks */
	ecc->bytes =3D DIV_ROUND_UP(ecc->strength * fls(8 * 1024), 8);
    ...
}

This mismatch overestimates the maximum strength. For example, with 26
available OOB bytes, the 13-bit estimation incorrectly selects a strength of
16, but the 14-bit calculation requires 28 bytes.=20

The subsequent bounds check:

sunxi_nand_hw_ecc_ctrl_init() {
    ...
	if (mtd->oobsize < (ecc->bytes * nsectors + total_user_data_sz))
		return -EINVAL;
    ...
}

then fails, causing the driver probe to abort for 512-byte page devices when
nand-ecc-maximize is enabled.

>  		nsectors =3D mtd->writesize / ecc->size;
> =20
>  		if (!nfc->caps->reg_user_data_len) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-submit-sun=
xi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com?part=3D1
