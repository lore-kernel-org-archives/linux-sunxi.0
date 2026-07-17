Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD83F7A82
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289341; cv=none; b=gierRotAgfkVl+UYiCglMKbZEX4Bb3+xKZPBSUVT4edv6lcb90oaegOUUVgh79AXh9I8isaHaGXWWfauEpbcqDrTnWphl3JSve/UpcGjmWP8JWsin2xP0pqFtppAyabmWOxMAas6aBSXxBSwNy8AkJWDcgJYzym9g0yVcTGOmOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289341; c=relaxed/simple;
	bh=9VNl3kwPKsiIRaWbFIJIf/bZWRu6H8ArKCkTG27eOHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hhgTNeSckv1Kg3KALxgX3sjpKzaZOYRSbqNUntwANPKlM/oqam6MLpBiJ1yLpdrEfCU+iph8BxvGGmrp9DOm4qvnbS2dlbuH0yjTdJXfdZoMBl9P1N1HvjfiPTD+TKJXj/5chgYIpGZWzv6xjTlUL+226qMAwukElrcN3nyLMnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yXXP7Pva; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yXXP7Pva"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EA9BF1A1055;
	Fri, 17 Jul 2026 11:55:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B542860361;
	Fri, 17 Jul 2026 11:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D107811BD013E;
	Fri, 17 Jul 2026 13:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784289332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=olb07j+R4KRuYDDsVWwKXD1OEB5dTfTfM1jnrVire4o=;
	b=yXXP7Pval4WDA/Rcwb+NuWA918Ql9SeQC53coAvcqFKI2q+nVCeCIPdGvZXsQK/cgmJwXu
	rxnEETip2qaGBb3miTiLJf4GlRcxIEarrHbRcUe6Wg7JqOuvahWSb/9V5GpX/fUkgky0Mj
	v49VDKAKy5ybZzFxAZTCgNTpj0kSz60ad2VmLEmVRMo+bN2pNuwl2RVKyLZ6QNfW9t3ZB7
	OqAOjpLEkOCC+pE1qDa4MSZbEtOzaYyUutJQVVflfgOtkrDedwXov4HTmK70CLjiXbDRH7
	llX5muQWl4ULLMzwqT/e0OaHceTR2WyHA2sd9kosxCUBYJi04OTD724YsF0LEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: fix H6/H616 controller timings
In-Reply-To: <20260715013142.640977-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Tue, 14 Jul 2026 19:31:38 -0600")
References: <20260715013142.640977-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 13:55:29 +0200
Message-ID: <87a4rpkez2.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello James,

On 14/07/2026 at 19:31:38 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The NAND timing calculation was written for the original A10 NDFC. It
> assumes command and address setup and hold intervals T1-T4, T7 and T11
> are one controller clock and uses the A10 timing-register encodings.
>
> The H6/H616 NDFC instead defines those intervals as two internal clock
> cycles and uses different encodings for tWB, tADL, tWHR and tRHW, as
> documented in the H616 User Manual.
>
> Describe the timing characteristics in the controller capability data
> so the clock solver can select a rate permitted by the NAND SDR timings
> and program valid delay fields. Keep the legacy A10 behavior unchanged.
>
> Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand cont=
roller")

Cc: stable missing here

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

...

> @@ -1667,16 +1681,35 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand=
_chip *nand, int page)
>  	return nand_prog_page_end_op(nand);
>  }
>=20=20
> -static const s32 tWB_lut[] =3D {6, 12, 16, 20};
> -static const s32 tRHW_lut[] =3D {4, 8, 12, 20};
> +static const struct sunxi_nfc_timings sun4i_a10_nfc_timings =3D {
> +	.setup_cycles =3D 1,
> +	.tWB =3D { 6, 12, 16, 20 },
> +	.tADL =3D { 7, 15, 23, 31 },
> +	.tWHR =3D { 7, 15, 23, 31 },
> +	.tRHW =3D { 4, 8, 12, 20 },
> +};

This patch looks overall correct but must be split. For instance, the
fact that you drop the LUT in favour of you own timing array shall be
done in a preparation patch, without adding new timings, nor adding the
new controller timings.

Then in a second time you could add tADL and tWHR support, etc.

> +
> +static const struct sunxi_nfc_timings sun50i_h6_nfc_timings =3D {
> +	.setup_cycles =3D 2,
> +	.tWB =3D { 28, 44, 60, 76 },
> +	.tADL =3D { 0, 12, 28, 44 },
> +	.tWHR =3D { 0, 12, 28, 44 },
> +	.tRHW =3D { 8, 24, 40, 56 },
> +};
> +
> +static void sunxi_nand_update_min_period(u32 *min_period, u32 duration,
> +					 unsigned int cycles)
> +{
> +	*min_period =3D max(*min_period, DIV_ROUND_UP(duration, cycles));
> +}
>=20=20
> -static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 d=
uration,
> -		u32 clk_period)
> +static int sunxi_nand_lookup_timing(const u8 *lut, u32 duration,
> +				    u32 clk_period)

This change is fine but likely also unrelated and should (maybe) be moved i=
n its
own commit.

>  {
>  	u32 clk_cycles =3D DIV_ROUND_UP(duration, clk_period);
>  	int i;
>=20=20
> -	for (i =3D 0; i < lut_size; i++) {
> +	for (i =3D 0; i < SUNXI_NFC_TIMING_STEPS; i++) {
>  		if (clk_cycles <=3D lut[i])
>  			return i;
>  	}

...

> @@ -1703,77 +1734,65 @@ static int sunxi_nfc_setup_interface(struct nand_=
chip *nand, int csline,
>  		return -ENOTSUPP;
>=20=20
>  	/* T1 <=3D> tCLS */
> -	if (timings->tCLS_min > min_clk_period)
> -		min_clk_period =3D timings->tCLS_min;
> +	sunxi_nand_update_min_period(&min_clk_period, timings->tCLS_min,
> +				     nfc_timings->setup_cycles);

I am not sure I get the added value of this helper?

>=20=20
>  	/* T2 <=3D> tCLH */
> -	if (timings->tCLH_min > min_clk_period)
> -		min_clk_period =3D timings->tCLH_min;
> +	sunxi_nand_update_min_period(&min_clk_period, timings->tCLH_min,
> +				     nfc_timings->setup_cycles);
>=20=20

...

>=20=20
>  static const struct sunxi_nfc_caps sunxi_nfc_h616_caps =3D {
> @@ -2641,6 +2664,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_c=
aps =3D {
>  	.nuser_data_tab =3D ARRAY_SIZE(sunxi_user_data_len_h6),
>  	.max_ecc_steps =3D 32,
>  	.sram_size =3D 8192,
> +	.timings =3D &sun50i_h6_nfc_timings,

And this should be the last change in your series.

BTW would it be relevant to align the various names ? (h6 timings in the
h616 structure).

Thanks,
Miqu=C3=A8l
