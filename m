Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1648A8B4;
	Wed,  9 Sep 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943905; cv=none; b=tRXEaG75b9CLahgcTXjGu30WpY7cnxkDCibS1KH0eJNUVdlCJw77ycIkHUcVpC5/moqS5fUbPclcsoelc7ekJI6gRelCj4nln/NY+oA2PlUlLizenVFeNHbcnXQ2Y3q3raxfwq/MmUtZqSX6SymiaUTI4Vs+NZWr9vR9a7cPAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943905; c=relaxed/simple;
	bh=5xm2Blazpnjvx2S1yj/eNiDKJR7yRxKvns2MniKOW1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z3ebThfWK14qW1nGSjsTIcxA94QcZugsLQgTK9/rPb+6KddgukzO4WwjUOlwHT2PRqix/8yyzHBNVorKQUba6IjozMUq2P1Wmzim14Faf+7ZwjcZeqxGQk6+/6Kb7kQF4jTCDn4knw/2GLSZlhfSdXcqiB4MuPLwRDXm/x/wqyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPAJjXf+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPAJjXf+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A98A1F00A3D;
	Wed,  9 Sep 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788943898;
	bh=cj7lqzOPfEAccIXYNNQ0SI+fFxYm5vEZW8hfCn4nVGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UPAJjXf+WhpPHzr5PRBsoe3tMGFnhBDyQN7fRzksI5bft5bf3285msyc8WQgl+SoH
	 JXM3xDRGw1NDA01D8p27nPSimM01hwpoli6xnYIi4195SwtmlCjHzaG1wL7cuMCGOq
	 PIyDsJZsefsOCtwCt4PUHCZ14RflPASuMyBKDLf7gu5VjQz50PXzUlw3JwEh3TtZIl
	 39ttYL8w5J9UXNdCyQSAC3X1EeJRNlO2miy03nvkmCak8oHPpA2JZn+oeCiAGfPs17
	 0wxlN6bWfMiA2XUueTcPe5EFeQR+mGQoPeD0XX7T3U5QwvkrkZFvhILIEeF35rpu14
	 9QyZdjeTYMgzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/15] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-11-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
 <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-11-838cb0ba1547@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:51:38 +0000
Message-Id: <20260909085138.9A98A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The free OOB region incorrectly overlaps with the ECC OOB region f=
or ECC steps > 0, causing silent ECC data corruption.
- [High] A division by zero kernel panic occurs when maximizing ECC strengt=
h on a NAND flash with 512-byte pages.
- [High] Unbounded accumulation of user data lengths leads to out-of-bounds=
 MMIO writes, clobbering adjacent controller configuration registers.
--

commit 576ae0cb150295224ce149147695feb0bb49c1cf
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

This patch adds a randomized OOB layout for the H6/H616 controller,
configuring a separate protected user-data length for ECC step zero to match
the firmware format. It keeps the maximized user-data layout when the
property is absent.

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 138a141edbe4d..bd239d150730b 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
[ ... ]
> @@ -2365,6 +2374,12 @@ static int sunxi_nfc_maximize_user_data(struct nan=
d_chip *nand, uint32_t oobsize
>  	if (!sunxi_nand->user_data_bytes)
>  		return -ENOMEM;
> =20
> +	if (sunxi_nand->randomized_oob) {
> +		sunxi_nand->user_data_bytes[0] =3D
> +			sunxi_nfc_h6_user_data_sz(nsectors);
> +		return 0;
> +	}
> +
>  	for (step =3D 0; (step < nsectors) && (remaining_bytes > 0); step++) {
>  		for (i =3D 0; i < c->nuser_data_tab; i++) {
>  			if (c->user_data_len_tab[i] > remaining_bytes)
>  				break;
>  			sunxi_nand->user_data_bytes[step] =3D c->user_data_len_tab[i];
>  		}

[Severity: High]
This is a pre-existing issue, but does this loop lack an aggregate bounds
check against the hardware MMIO limit?

It appears this greedily assigns up to 32 bytes of user data per ECC step.
For a large page NAND flash, such as an 8KB page with 8 steps, it could
allocate up to 256 bytes in total.

When this total is later written out in sunxi_nfc_hw_ecc_set_prot_oob_bytes=
()
via a writel loop:

sunxi_nand.c:sunxi_nfc_hw_ecc_set_prot_oob_bytes() {
    ...
    for (i =3D 0; i < user_data_sz / 4; i++, ptr +=3D 4) {
        writel(sunxi_nfc_buf_to_user_data(ptr),
               nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
    }
    ...
}

Will this step outside the available USER_DATA register bank and clobber
adjacent controller configuration registers like SPARE_AREA or PAT_ID,
potentially causing controller malfunction or a kernel panic during probe?

[ ... ]
> @@ -2422,6 +2437,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand=
_chip *nand,
>  				bytes -=3D 2;
> =20
>  			bytes -=3D total_user_data_sz;
> +		} else if (sunxi_nand->randomized_oob) {
> +			total_user_data_sz =3D
> +				sunxi_nfc_h6_user_data_sz(nsectors);
> +			bytes -=3D total_user_data_sz;
>  		} else {

[Severity: High]
This isn't a bug introduced by this patch, but earlier in this function
when the NAND_ECC_MAXIMIZE_STRENGTH flag is set, the code hardcodes
ecc->size to 1024.

If this is run on a NAND device with a 512-byte page size, will nsectors
evaluate to 0?=20

If nsectors is 0, the later operation to calculate the remaining ECC bytes
performs a division by zero:

sunxi_nand.c:sunxi_nand_hw_ecc_ctrl_init() {
    ...
    /*
     * Once all user data has been subtracted, the rest can be used
     * for ECC bytes
     */
    bytes /=3D nsectors;
    ...
}

Will this crash the kernel on boot for 512-byte page devices?

[ ... ]

[Severity: High]
This is also a pre-existing issue, but does sunxi_nand_ooblayout_free()
incorrectly overlap the free OOB region with the ECC OOB region?

Looking at sunxi_nand_ooblayout_free() for sections > 0:

sunxi_nand.c:sunxi_nand_ooblayout_free() {
    ...
    oobregion->offset =3D sunxi_get_ecc_offset(sunxi_nand, ecc, section);
    oobregion->length =3D user_data_sz;

    return 0;
}

Should this be using sunxi_get_oob_offset() instead? By setting the free
region offset to the ECC region offset, it seems that if a filesystem utili=
zing
OOB writes to the free OOB area, it will write directly into the ECC parity
bytes, silently destroying the parity data and causing uncorrectable read
errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-submit-sun=
xi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com?part=3D11
