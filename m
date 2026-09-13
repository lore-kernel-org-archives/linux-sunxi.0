Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBC6376A1F;
	Sun, 13 Sep 2026 04:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273004; cv=none; b=boTxAZ6ioDf7XqdsvqLRyJWVHSsHJ5UwHO6oA/GyVhr97NoUZO6SGjfOKcf75d/YhkpWTF3Gh6q7yR5HdfhsMRD5JGFy8Y10K5cg50hZs10nsPttDDtIp+0WZsvBcZetQdqDRfuTzLspL+HsiO/OgLZtdUV+WGDxe8AF0u4bJjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273004; c=relaxed/simple;
	bh=XFXLtnKNgYkxtlOEAoFeGM8n1l6wJNP1hxvwtN2yqWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ILtr1QDwuRPcBMjoj0gTqqcQxm7vUgpZzM+NZi5hC+iqcjKrbqahgjK9+ySIWMvmrQK7kEBdnH1XHC8iwR1wmOCGQXf+81JPIdsyleucMOeAd9OyrHAyBPSM1KPTe29LJs2IdLLPVmAnJn7Bdy0NHf9xbN4ezFyTHDWx03vjj6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDWobjPG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDWobjPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28F81F000FF;
	Sun, 13 Sep 2026 04:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789273003;
	bh=dmq5mPIeOptHpp4G0tupVFwn2ipxzNsvlp3CfJaukUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDWobjPG7CibVRXsZCVpDKvCVU5BkQ5RejlM697tmaFAQbm/cgW4p9ztDCQ2HHBHj
	 6BpxLrKEPvGyOeLJS0xP1DWZiDgH7G3wo4wh1GDBpcgS5orKkHok2KiJ9A5zC4OOqy
	 519kqR+vHwiu+G3iqENnOndBYehWw+feSZcWKPxjBD57xdT8LCqXloeLBHMzMosZ0C
	 PZVBX1jb9+InL30PGNRqliHu6SDVR9fdIgUVQ+kq1ho0YH92L5TWKUATjFkGTxK6Qm
	 q8EGW97B+4VtRrhxD6h4iozumw00aOBYQIBNzSGKiMGKOucUq2vJCm8wjaYs9V3o1b
	 OOrPMbIrTa7FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/17] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-3-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
 <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-3-4a64bed94229@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 04:16:42 +0000
Message-Id: <20260913041642.E28F81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch introduces a regression for small-page NANDs by explicit=
ly propagating errors from `nand_change_read_column_op()`, which unconditio=
nally returns `-ENOTSUPP` when `mtd->writesize <=3D 512`.
--

commit 63fba1d4fa0b9df218cee82050011ec93e712247
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: sunxi: propagate page-setup and erased-check errors

This commit stops before starting PIO or DMA transfers when page setup fails
and shares the erased-chunk fallback between PIO and DMA. It routes PIO page
and subpage error exits through ECC disable before returning the transfer
error.

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 172c7c4b0ba6d..d5d8d383b6d12 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
[ ... ]
> @@ -1067,6 +1067,40 @@ static void sunxi_nfc_hw_ecc_update_stats(struct n=
and_chip *nand,
>  	}
>  }
> =20
> +/*
> + * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
> + * statistics updated in either case. Negative values report transport e=
rrors.
> + */
> +static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
> +				       u8 *data, int data_off,
> +				       u8 *oob, int oob_off,
> +				       unsigned int user_data_sz,
> +				       unsigned int *max_bitflips)
> +{
> +	struct nand_ecc_ctrl *ecc =3D &nand->ecc;
> +	unsigned int oob_len =3D ecc->bytes + user_data_sz;
> +	int ret;
> +
> +	/* Check the physical representation for bitflips in erased pages. */
> +	if (nand->options & NAND_NEED_SCRAMBLING) {
> +		ret =3D nand_change_read_column_op(nand, data_off, data,
> +						 ecc->size, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
> +	if (ret)
> +		return ret;

[Severity: High]
Will this introduce a regression for small-page NANDs?

When an ECC error is detected, the driver attempts an erased chunk check via
sunxi_nfc_hw_ecc_read_error(), which calls nand_change_read_column_op().

Looking at nand_change_read_column_op() in drivers/mtd/nand/raw/nand_base.c,
it does not support column changes for small-page NANDs and unconditionally
returns -ENOTSUPP:

drivers/mtd/nand/raw/nand_base.c:nand_change_read_column_op() {
        ...
        /* Small page NANDs do not support column change. */
        if (mtd->writesize <=3D 512)
                return -ENOTSUPP;
        ...
}

By explicitly propagating this error, it appears read operations on erased
pages, bad block scans, and OOB data reads on small-page NANDs will now abo=
rt
with a transport error (-ENOTSUPP) instead of correctly reporting ECC errors
(-EBADMSG) or processing erased chunks. Prior to this patch, the error from
nand_change_read_column_op() was safely ignored in this path, allowing the
driver to fall back to reporting an uncorrectable ECC error gracefully.

> +
> +	ret =3D nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL=
, 0,
> +					  ecc->strength);
> +
> +	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
> +
> +	return ret >=3D 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-submit-sun=
xi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com?part=3D3
