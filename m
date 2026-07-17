Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C103F65EE
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293752; cv=none; b=k8F0bNP0XlqEBeSn4ytvEtt5RyNc/koGEkCdheSDb4h3d/nHeQcAUd3i48efdY1gaRLyRP81YTK20dq1MNPQ4lrerDlyu3USRKcM9uxQiEAdtZREZpY3o1p5M+6r1njqcRi2fL/Nmt+wUJJPuH3PhzNWO512Y6QTJzjmz+bo8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293752; c=relaxed/simple;
	bh=OAs145MHyaaUWp5Ub+DV60H2JUvu45NPs84K0ul4Lzk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hFLuJlZ1tqpEVFexDqNj2xfEKTK5alHgTTy3ROcV+sTwEaJaE0m/xHPUiYX7YVJE2cBHgfZFjAHAXU3ZfwTK0GXhWuMTOUw7Am3GxFVRyUhLnrdki0Aq9nIEHAeP44jt4EyAQHqu7VjY+gmsWfRQJBpGOp+9FwXF/L1k8DnQC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jWW7QdQ9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jWW7QdQ9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 950424E40E0E;
	Fri, 17 Jul 2026 13:09:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 604E360361;
	Fri, 17 Jul 2026 13:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78D5A11BD0158;
	Fri, 17 Jul 2026 15:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784293746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cn1pFl0mrxmZ5O9Dm58NQlDdGx8NzY2f6Z+2/X5Kfqo=;
	b=jWW7QdQ9WgtCFeBDx7anwxwxvIRt/ADCZj39QvGO/0PSwpXBSjOChomR3Dr5GmZiM+/BMZ
	CoQUHGqv3tTqeUcpCL6AAMytPZMvKel27zuWzPgJnrOdzkT+PTN6dt0wExcDB1bXK21M5i
	Ro11bNmhblT5MsF7zRzrpM5kNacc4trRWe7k3V7f9M72j81j5X26hxNDhD3CcJvRfJE6jF
	ctUgVwn7ObdGvIgOy2b3oomyQd5dEAJ4oM+drStkfghEA6qAGsLeRzbFrA5gJZRysMffBa
	ekOZx/SqXN6fQeO6Xm83cVO9SphTKN9QEfd+27thoqz5hfikpKZBBCmxeXrYBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <20260715162444.789303-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Wed, 15 Jul 2026 10:24:40 -0600")
References: <20260715162444.789303-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 15:09:02 +0200
Message-ID: <87v7adix01.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi James,

On 15/07/2026 at 10:24:40 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The H616 NAND controller uses a descriptor-based internal MBUS DMA
> engine instead of the direct address and count registers used by the
> A23/A33 controller. Since the driver does not support these descriptors,
> it currently attempts to request an external rxtx DMA channel and falls
> back to PIO when none is provided.
>
> Add a single-descriptor backend to the existing ECC page DMA paths.
> Allocate the descriptor coherently, constrain data mappings to the
> controller's 32-bit address range, program the H6-style data block mask,
> and request an interrupt for both command and DMA completion. Keep the
> existing external DMA and legacy MBUS DMA paths unchanged, and fall back
> to PIO if the descriptor cannot be allocated.
>
> Hardware testing on an H616 board with 2 KiB-page SLC NAND
> confirmed that the descriptor path improves sustained read throughput.

I would be nice to show the output of a flash_speed -dc100 /dev/mtdX
before and after.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 110 ++++++++++++++++++++++++++----
>  1 file changed, 95 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 02647565c8ba..8a136b9fa7cc 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -79,6 +79,10 @@
>  #define NFC_REG_H6_MDMA_BUF_ADDR 0x0210
>  #define NFC_REG_H6_MDMA_CNT	0x0214
>=20=20
> +#define NFC_MDMA_DESC_LAST	BIT(2)
> +#define NFC_MDMA_DESC_FIRST	BIT(3)
> +#define NFC_MDMA_DESC_SIZE_MASK	GENMASK(15, 0)
> +
>  #define NFC_RAM0_BASE		0x0400
>  #define NFC_RAM1_BASE		0x0800
>=20=20
> @@ -267,12 +271,19 @@ static inline struct sunxi_nand_chip *to_sunxi_nand=
(struct nand_chip *nand)
>  	return container_of(nand, struct sunxi_nand_chip, nand);
>  }
>=20=20
> +struct sunxi_nfc_mdma_desc {
> +	__le32 config;
> +	__le32 size;
> +	__le32 buf;
> +	__le32 next;
> +};

Shouldn't this be declared __packed and possibly even __aligned?

>  /*
>   * NAND Controller capabilities structure: stores NAND controller capabi=
lities
>   * for distinction between compatible strings.
>   *
> - * @has_mdma:		Use mbus dma mode, otherwise general dma
> - *			through MBUS on A23/A33 needs extra configuration.
> + * @has_mdma:		Use A23/A33-style MBUS DMA registers
> + * @has_mdma_desc:	MBUS DMA uses H6-style descriptors
>   * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
>   * @has_ecc_clk:	If the controller needs an ECC clock.
>   * @has_mbus_clk:	If the controller needs a mbus clock.
> @@ -304,6 +315,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(s=
truct nand_chip *nand)
>   */
>  struct sunxi_nfc_caps {
>  	bool has_mdma;
> +	bool has_mdma_desc;
>  	bool has_ecc_block_512;
>  	bool has_ecc_clk;
>  	bool has_mbus_clk;
> @@ -346,6 +358,8 @@ struct sunxi_nfc_caps {
>   *	   controller
>   * @complete: a completion object used to wait for NAND controller events
>   * @dmac: the DMA channel attached to the NAND controller
> + * @mdma_desc: H6-style MBUS DMA descriptor
> + * @mdma_desc_dma: DMA address of @mdma_desc
>   * @caps: NAND Controller capabilities
>   */
>  struct sunxi_nfc {
> @@ -362,6 +376,8 @@ struct sunxi_nfc {
>  	struct list_head chips;
>  	struct completion complete;
>  	struct dma_chan *dmac;
> +	struct sunxi_nfc_mdma_desc *mdma_desc;
> +	dma_addr_t mdma_desc_dma;
>  	const struct sunxi_nfc_caps *caps;
>  };
>=20=20
> @@ -370,6 +386,11 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct =
nand_controller *ctrl)
>  	return container_of(ctrl, struct sunxi_nfc, controller);
>  }
>=20=20
> +static bool sunxi_nfc_uses_mdma(const struct sunxi_nfc *nfc)

may I suggest sunxi_nfc_use_mdma?

> +{
> +	return nfc->caps->has_mdma || nfc->mdma_desc;

I don't get the || there? What are you trying to check exactly?

> +}
> +
>  static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
>  {
>  	struct sunxi_nfc *nfc =3D dev_id;
> @@ -466,7 +487,9 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc =
*nfc, const void *buf,
>  {
>  	struct dma_async_tx_descriptor *dmad;
>  	enum dma_transfer_direction tdir;
> +	dma_addr_t buf_dma;
>  	dma_cookie_t dmat;
> +	int len =3D chunksize * nchunks;
>  	int ret;
>=20=20
>  	if (ddir =3D=3D DMA_FROM_DEVICE)
> @@ -474,12 +497,21 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nf=
c *nfc, const void *buf,
>  	else
>  		tdir =3D DMA_MEM_TO_DEV;
>=20=20
> -	sg_init_one(sg, buf, nchunks * chunksize);
> +	sg_init_one(sg, buf, len);
>  	ret =3D dma_map_sg(nfc->dev, sg, 1, ddir);
>  	if (!ret)
>  		return -ENOMEM;
>=20=20
> -	if (!nfc->caps->has_mdma) {
> +	buf_dma =3D sg_dma_address(sg);
> +
> +	if (nfc->mdma_desc &&
> +	    (len > NFC_MDMA_DESC_SIZE_MASK || !IS_ALIGNED(len, 8) ||
> +	     !IS_ALIGNED(buf_dma, 4) || upper_32_bits(buf_dma))) {
> +		ret =3D -EINVAL;
> +		goto err_unmap_buf;
> +	}
> +
> +	if (!sunxi_nfc_uses_mdma(nfc)) {
>  		dmad =3D dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
>  		if (!dmad) {
>  			ret =3D -EINVAL;
> @@ -489,14 +521,30 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nf=
c *nfc, const void *buf,
>=20=20
>  	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
>  	       nfc->regs + NFC_REG_CTL);
> -	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> +	writel(nfc->mdma_desc ? GENMASK(nchunks - 1, 0) : nchunks,

Very unclear, can this be simplified or at least explained?

> +	       nfc->regs + NFC_REG_SECTOR_NUM);
>  	writel(chunksize, nfc->regs + NFC_REG_CNT);
>=20=20
> -	if (nfc->caps->has_mdma) {
> +	if (sunxi_nfc_uses_mdma(nfc))
>  		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
>  		       nfc->regs + NFC_REG_CTL);
> -		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> -		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
> +
> +	if (nfc->mdma_desc) {
> +		struct sunxi_nfc_mdma_desc *desc =3D nfc->mdma_desc;
> +
> +		desc->config =3D cpu_to_le32(NFC_MDMA_DESC_FIRST |
> +					   NFC_MDMA_DESC_LAST);
> +		desc->size =3D cpu_to_le32(len);
> +		desc->buf =3D cpu_to_le32(lower_32_bits(buf_dma));

Does lower_32_bits() mean anything here since you already check for the
upper bits before? This check may even be redundant given the fact that
the addressing capability has already been set to 32 bits, so the
dma_map* call would catch this anyway.

> +		desc->next =3D cpu_to_le32(lower_32_bits(nfc->mdma_desc_dma));

Ditto

Plus, the endianness of the controller is little endian, so writel
already does the endianness conversion if need be. cpu_to_le32() here
seems irrelevant.

> +
> +		writel(BIT(0), nfc->regs + NFC_REG_H6_MDMA_STA);

BIT(0) should be #define'd

> +		dma_wmb();
> +		writel(lower_32_bits(nfc->mdma_desc_dma),
> +		       nfc->regs + NFC_REG_H6_MDMA_DLBA_REG);
> +	} else if (nfc->caps->has_mdma) {
> +		writel(len, nfc->regs + NFC_REG_MDMA_CNT);
> +		writel(buf_dma, nfc->regs + NFC_REG_MDMA_ADDR);
>  	} else {
>  		dmat =3D dmaengine_submit(dmad);
>=20=20
> @@ -525,6 +573,14 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nf=
c *nfc,
>  	       nfc->regs + NFC_REG_CTL);
>  }
>=20=20
> +static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
> +{
> +	if (nfc->mdma_desc)

I would prefer to stick to the same condition all the time whether we
are using peripheral dma (MDMA) or not.

> +		sunxi_nfc_rst(nfc);
> +	else if (!nfc->caps->has_mdma)

Shouldn't this be a "else" here?

> +		dmaengine_terminate_all(nfc->dmac);
> +}
> +
>  static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int c=
s)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(nand);
> @@ -1202,7 +1258,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct =
nand_chip *nand, uint8_t *buf
>=20=20
>  	wait =3D NFC_CMD_INT_FLAG;
>=20=20
> -	if (nfc->caps->has_mdma)
> +	if (sunxi_nfc_uses_mdma(nfc))
>  		wait |=3D NFC_DMA_INT_FLAG;
>  	else
>  		dma_async_issue_pending(nfc->dmac);

Thanks,
Miqu=C3=A8l
