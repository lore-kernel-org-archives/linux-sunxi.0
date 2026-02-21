Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387434252D
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771666809; cv=none; b=C5LzSprPksBhHwjuZOtgNHWeoad+c8AkecnxvKXXduBXX06B4KSlc6mKyrTcNCBIyMsXudeCZ98KDdUGz9/FI4pB5OHg6/FZIX5R25apJxVryIh3a0HKL8v9/7T+pa6uWDGJHxWfZZ+j2TDUfMn75tEBuGiAoBosmygcIj2qUTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771666809; c=relaxed/simple;
	bh=kW2ZR8JhmkoxTITSUxpb+zzCswZPVMvQ2S4l4qYWBeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utx7aOU/CapFDBkNfn9J12ogH3p7uJRdC490ZSkKtomL49gcGY4TM5RH3ww1TO/Jwg3mJlJcyadowPgQCBRJHQmAEHkxW1LllP5P8ZPDI6uu2sy9KDIfc7b2riZh3VEL0wZWlZUsbRZAXvSvIYEkrA+NqHSFvd+DztOYY6YKewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ien/Nm1B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ien/Nm1B"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48371bb515eso36562295e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666807; x=1772271607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=;
        b=ien/Nm1BBJ0rOYjOpxzzMjwMq7G5rwqS1yXxBuO6UNrX/gY1dI7Xm/Z+Qfxivaiwc2
         eP1AhoNERBRKM7AiJAOcHRMs4Z+ljOIH7xWOmBkhSHlpSj+z78vh9BijJRSiTwv4NgK0
         cs4hDr1L/Tw4Bea3yHLyWLbQ9s+oUFxaxu3dgHtA8m0M7ZDSjz0gKJslSYk9AihGVIG3
         wSb5XUjgI03Xhue3DHgosdoGdaB5LmC8kxANClbu8Ah1mlKZ8kLcdqLcUfiOEx0Hbsqs
         vsA5qSVqGVZe/F4FJ9q1OFIjQrAd6TKigGNfo1W6mGSGuREwN+d5Ztw2KyFCJelbgw9Y
         UHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666807; x=1772271607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6OTrcGA+pe/I4LHNfKbWhQqpu2uqCStywvB3RV+xvsk=;
        b=R3NFkH02L4FAncZ49eA+fm0ZWMaeVbEXHbyXyX44bSZLnLVqKq0ec+4A6gK26V91bA
         MK7EAqilTSOBOyK2tc9pAChqen8ilQWsTAIT1O0Crl7OYwB2kvSX94d6m3yKRY+mYD3E
         cHamccI0kYg9QMY6ooyjSK4l2GmLDhRDwrWrx48IfVyRq/70nFjXVhBN+amrQANCmh2+
         khvP/PKhVWf4lr/0NSluFShNFwQIw4Ky83dq7ZfL32qrVWmo8vtTEMLeXI4TPYXp0ga+
         6l4MbthSGdOwx2JUhWdSGVFO2OcE5HrDbThwgE1xBvRY3/v8k8jLi8dZXP4ysp125Sv9
         LEPA==
X-Forwarded-Encrypted: i=1; AJvYcCWwsmsoh/IECU9R389+wLtNVDfnVQWHtTHpB5/T8ijmEbP/p6argvcllj1Jf99zuOzK9+RyN6tEHr1ysA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVz0GQ+XCEgfaq5bYUVenpyG9ruR2rmpGEGtsMgcYSk2AWx0NQ
	xiNESmaUz7qkrpGyVmOT8NDtgLubT+ALh1cf44Tizt0T3R4fl1UoAStv
X-Gm-Gg: AZuq6aIYchZpKFRd6mzUfYYKqI/NDFhLX6Mb+d1Opuw9ZbgiKVqwfWreYGZmfLry69B
	yE1Ea+P2LboSjtsTuqb+G4duxZlG5BwC7ECadoqbmr+G8YGjkw+1m/6QkXnfAqCIKcF/uC2oXPu
	ZxxT0D+L047lT2txd2FuJiDiXf7Y/1sCNxq20V2SENkHJCVfOFjD3q5nIJMNw8XjgsMIW0yCks2
	ztneXt8o2uy0MLATk22cUPb0c6isKSho7nYqOLHbc4pITuPHO6EiHWnUU99QVWDMx1g1iJfaVYe
	CbqmiQXxt34/dpUqcEZ2BumMKGIaPF3PaKB5g1uRb/4m4eiXYC19zEwBfm3hGjl4g6SPM/TGwUa
	3AaWAFcxRmVfLIO0CFp0b3icycwoEVu1OqwjNKDVlaAYEqCB7LSEOK7MUvpqrdZyudOVNK4oHfn
	kryJvf+12BvtpEvd2QGKM0zThQftZlzZbu3ESL4RuYWVbLnbpsMcI4EkYA2vPPNaUoW9spOwwtr
	DiuGo5O
X-Received: by 2002:a05:600c:5020:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-483a95fb29cmr44815955e9.9.1771666806876;
        Sat, 21 Feb 2026 01:40:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31efe02sm135100995e9.10.2026.02.21.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Sat, 21 Feb 2026 10:21:55 +0100
Message-ID: <1947198.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20260220161011.999642-4-richard.genoud@bootlin.com>
References:
 <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-4-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 20. februar 2026 ob 17:10:08 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> BBM is part of USER_DATA section, so we should remove it twice
>=20
> This was working ok because we are on the safe size, advertising that
> there was 2 bytes less available than reality.

Missing "in" before "reality".

>=20
> But we can't change old platforms, since it may lead to a different ECC
> strength, so, introduce a legacy flag for old platforms, and switch the
> new platforms to the correct count.

There aren't any users of H6/H616 driver, right? If it would be, ECC streng=
th
can't be changed, since it can impact systems, which already use it.

Best regards,
Jernej

>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 9c6e0625e34f..99d305bbda53 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -281,6 +281,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(s=
truct nand_chip *nand)
>   * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
>   * @has_ecc_clk:	If the controller needs an ECC clock.
>   * @has_mbus_clk:	If the controller needs a mbus clock.
> + * @legacy_max_strength:If the maximize strength function was off by 2 b=
ytes
> + *			NB: this should not be used in new controllers
>   * @reg_io_data:	I/O data register
>   * @reg_ecc_err_cnt:	ECC error counter register
>   * @reg_user_data:	User data register
> @@ -310,6 +312,7 @@ struct sunxi_nfc_caps {
>  	bool has_ecc_block_512;
>  	bool has_ecc_clk;
>  	bool has_mbus_clk;
> +	bool legacy_max_strength;
>  	unsigned int reg_io_data;
>  	unsigned int reg_ecc_err_cnt;
>  	unsigned int reg_user_data;
> @@ -1811,10 +1814,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nan=
d_chip *nand,
>  		ecc->size =3D 1024;
>  		nsectors =3D mtd->writesize / ecc->size;
> =20
> -		/* Reserve 2 bytes for the BBM */
> -		bytes =3D (mtd->oobsize - 2) / nsectors;
> +		/*
> +		 * The 2 BBM bytes should not be removed from the grand total,
> +		 * because they are part of the USER_DATA_SZ.
> +		 * But we can't modify that for older platform since it may
> +		 * result in a stronger ECC at the end, and break the
> +		 * compatibility.
> +		 */
> +		if (nfc->caps->legacy_max_strength)
> +			bytes =3D (mtd->oobsize - 2) / nsectors;
> +		else
> +			bytes =3D mtd->oobsize / nsectors;
> =20
> -		/* 4 non-ECC bytes are added before each ECC bytes section */
> +		/*
> +		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
> +		 * section, they contain the 2 BBM bytes
> +		 */
>  		bytes -=3D USER_DATA_SZ;
> =20
>  		/* and bytes has to be even. */
> @@ -2379,6 +2394,7 @@ static const u8 sunxi_user_data_len_h6[] =3D {
> =20
>  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps =3D {
>  	.has_ecc_block_512 =3D true,
> +	.legacy_max_strength =3D true,
>  	.reg_io_data =3D NFC_REG_A10_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
>  	.reg_user_data =3D NFC_REG_A10_USER_DATA,
> @@ -2400,6 +2416,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_ca=
ps =3D {
>  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps =3D {
>  	.has_mdma =3D true,
>  	.has_ecc_block_512 =3D true,
> +	.legacy_max_strength =3D true,
>  	.reg_io_data =3D NFC_REG_A23_IO_DATA,
>  	.reg_ecc_err_cnt =3D NFC_REG_A10_ECC_ERR_CNT,
>  	.reg_user_data =3D NFC_REG_A10_USER_DATA,
>=20




