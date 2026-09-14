Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FCC1EBFE0;
	Mon, 14 Sep 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355983; cv=none; b=WA2ZcdlKrvXG4ZznjjomkCfiMvLR5AJyby/WuVoIEn4NDZ9C3kFCXwkWCV54y9IP/1mGXRp0Xndn0fQeEzN8yZfIB5dnUMb7oHLbzHIXksDpqjr7+PUo4qoCi2nWCg2X3qt+DXEuQmbL4uC+cRlc9VfRWfvGzvxCZAfzRM0Pa8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355983; c=relaxed/simple;
	bh=sSNh8UDcaV5JjF3uiQsJPsVdY5IiGZm9E+NPVqoO1II=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NVXHjPv6gpNRTd6GfVcaUv24eIEsWmiPKTsQ0fE9s8rMTNwlypLCtz49H9syktr+dyMlG2jnwyvq8ZY4oROkU7+KYeMvjbcURFYqeS3Y6BaHgryBx6FFtu100BXZ6QU+QQE/oVQFjRuJ4MLjWQ+HMWI2PcRCevkb5nYTHMLIbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZeKEOLR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZeKEOLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7091F000FF;
	Mon, 14 Sep 2026 03:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789355969;
	bh=gTHHZ0u/Cdmx12suvpYJdoH8kPnjSd/rUQhORL6kD5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZZeKEOLRhJb6Cx2jw/Bi4mZOGQtosaP6qrDOJzRhdAtRHQGZQXci/CC3JOKIjBVYC
	 65qo5R9tJJBIrIr0ALVl9s1KzhFjt5b/suOhFdRNKXXLoHYq6UykoFk5oVpOcfZUHO
	 XSUXF1u2MgiGLS4bNy8i30/XzGIP1cYwuGXOlH4vcsr/MWjc6kQtQVcbLnwxu4o07q
	 G4YGLWv8FtAqWK2dlbJwRsmS0FgxAyETpyHbzVpcTtJCPUvfv2szaOjnTe/YoMBzb7
	 qtnaDISXDD3RE1uSNuMtBCxsSpbGaD8xZICFqz/oz/Nq0AgdNmJUh/K8xih3vuFWsu
	 /hctmlW+4mhNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/18] mtd: rawnand: sunxi: bound DMA batches by the
 user-data register bank
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-10-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
 <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-10-7d711076a6f7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 03:19:28 +0000
Message-Id: <20260914031929.2E7091F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] DMA batching breaks because the hardware's internal chunk counter =
resets for each batch, causing it to generate incorrect flash column addres=
ses for main data chunks after the first in subsequent batches.
--

commit fcea2b1acac181df9bb3db6577c776b8c30250b9
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: sunxi: bound DMA batches by the user-data register bank

This commit splits DMA transfers into batches whose aggregate user data
fits the hardware's user-data register bank. It reuses hardware slots
from zero in each batch while maintaining logical offsets.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user=
 data length")

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index e29638c828caf..fbea6f16ea9d7 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
[ ... ]
> @@ -1761,69 +1776,88 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct=
 nand_chip *nand,
[ ... ]
> -	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
> -	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
> -	       nfc->regs + NFC_REG_CMD);
> +		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
> +		       NFC_DATA_TRANS | NFC_ACCESS_DIR,
> +		       nfc->regs + NFC_REG_CMD);

[Severity: High]
Does this batching approach cause a regression where the controller's
autonomous state machine generates incorrect flash column addresses?

When a page is split into multiple DMA batches, both
sunxi_nfc_hw_ecc_read_batch_dma() and sunxi_nfc_hw_ecc_write_page_dma()
iterate over the batches with first_step > 0. Because the hardware is
reprogrammed for each batch, it appears the controller's internal chunk
counter resets to 0.

While the first chunk of a batch is read or written correctly due to the
manual column change beforehand, won't the NFC_PAGE_OP state machine
automatically issue a 0x05/0x85 column change to jump back to main data
for the second chunk of the batch?

If the internal counter is reset, would the hardware calculate the return
column address as 1 * ecc_size instead of (first_step + 1) * ecc_size?
Could this cause the controller to read or write over the wrong flash
offsets for all chunks after the first in subsequent batches, leading
to data corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-submit-sun=
xi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com?part=3D10
