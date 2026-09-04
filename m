Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75C3CB2E7;
	Fri,  4 Sep 2026 21:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558424; cv=none; b=kOYz0E1uRdXE/2cYlOUkuhaE/M+bJIPeWhHy9g4qJzMXMizkuYPVCmAvs4DERBu5ehBkPI+xz3Mhyos6oLWZOJflFWRGPkueOBz5ShXYYOxtwVylu2thKXYGvmsTnvFNTZfwObRA+99yEGhqen7s6M2DH8IdES8gY86aULWRiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558424; c=relaxed/simple;
	bh=p3i7vHLZZPpY9HWOCA/0rhR/GFhjttWmdc1ecdrYgU0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nrxck58eDXvf3m7XjER37KI80k69s5eTV9s0DUaMeWaAfEIEhzaqNRA9r2t6Ex7Lom1GSrNJogl847Il7GdNo/4n9bMzSYo3WB44TnxwdYmU3hnYPM8Z5UsR8nr0QR1WvtMbfDOPS4t70fnC86RTBFaxCC0az7RZXVRumHSpZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTyN73fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTyN73fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0A31F00A3D;
	Fri,  4 Sep 2026 21:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788558422;
	bh=OpUdLRtoEgNKhcX7+3Zn8UZ78zB2YC1sOvIpfOCSbHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FTyN73fkxqv00uI9XxCrB8Yt5u7CySvwJN5XdXffEz+r95v7vuVCub4EFQLyJhoVQ
	 Zl2cv3XrIA2dQA61nfyTwEB9r3UkP7tfQGd2C4Zv5vDVtnt3a6zgyR9nV4RRVKVZM2
	 AzG9Llt8P902J3+8Ss121n99tGgoYm867N9Zv7YPXzPMidNCiZxZJNm1pqoAZBjglU
	 0cP90pJ/3pHWN7nOXJjQk8kcv+Yr4/0vw+PjKNGXkVDxbQm79b77smpnAlaildCDiE
	 ON/XmP5iZJvEbv+yvmuGTUA3Ckp/BWPIN6eKDsvz7Zf6JTlHD0DHdYv/Xg3guvTIVY
	 EeHyg5w2HVnIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, linux-sunxi@lists.linux.dev, "Michael
 Walle" <mwalle@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, conor+dt@kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>, devicetree@vger.kernel.org, "Richard
 Weinberger" <richard@nod.at>, robh@kernel.org
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-3-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
 <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-3-b12074f4aca7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:47:01 +0000
Message-Id: <20260904214701.EA0A31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The free OOB layout for steps > 0 incorrectly overlaps with ha=
rdware ECC bytes, leading to uncorrectable data corruption.
- [High] Division by zero kernel panic when NAND_ECC_MAXIMIZE_STRENGTH is c=
onfigured on 512-byte NAND pages.
--

commit 250f35cb46a45ae57aae72a174fbcad8b8b7a7e5
Author: James Hilliard <james.hilliard1@gmail.com>
Subject: mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

This commit updates the sunxi NAND driver to support the randomized OOB
layout used by the H6/H616 controllers. It configures a separate protected
user-data length for each ECC step and allocates up to 16 bytes for step ze=
ro.

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index c1246a9268ca5..1265d900fc276 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
[ ... ]
> @@ -2111,6 +2126,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand=
_chip *nand,
>  				bytes -=3D 2;
> =20
>  			bytes -=3D total_user_data_sz;
> +		} else if (sunxi_nand->randomized_oob) {
> +			total_user_data_sz =3D
> +				sunxi_nfc_h6_user_data_sz(nsectors);
> +			bytes -=3D total_user_data_sz;
>  		} else {
>  			/*
>  			 * User-data lengths are encoded in four-byte units. Reserve

[Severity: High]
This is a pre-existing issue, but I noticed a potential division by zero
kernel panic in sunxi_nand_hw_ecc_ctrl_init() when NAND_ECC_MAXIMIZE_STRENG=
TH
is configured on 512-byte NAND pages.

If a NAND device with a 512-byte page size is configured with the
nand-ecc-maximize property in the device tree, mtd->writesize will be 512.
This function forces ecc->size =3D 1024 and calculates:

nsectors =3D mtd->writesize / ecc->size;

This resolves to 0, and a few lines down the code executes:

bytes /=3D nsectors;

Would it be safer to gracefully fail (e.g., returning -EINVAL) instead of
allowing a fatal division by zero during device probe?

[Severity: Critical]
This is also a pre-existing issue, but I wanted to ask about the free OOB
layout defined in sunxi_nand_ooblayout_free(), which isn't modified by
this patch.

For sections greater than 0, the driver does:

oobregion->offset =3D sunxi_get_ecc_offset(sunxi_nand, ecc, section);
oobregion->length =3D user_data_sz;

This appears to incorrectly overlap with hardware ECC bytes, defining the M=
TD
free region exactly over the hardware ECC bytes instead of the user data
bytes.

Could this lead to unrecoverable data corruption if standard filesystems
(like JFFS2 or UBIFS) write metadata to the free OOB area, unknowingly
overwriting the ECC codes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-submit-sun=
xi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com?part=3D3
