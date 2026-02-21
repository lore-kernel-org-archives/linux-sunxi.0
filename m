Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E8331A45
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771666808; cv=none; b=p05hfeIWZly5dgym1Egj3wv1ofReK+ROf7wv2FrLNOP+2vdv0q6dph4eYWOHBtNMcVf1ld0RiS+NRCDXklRsxIYPKKq3czoBDPbCcnrFKzV87weyGSTO59Es2btIoXdJ6Q+MepvQzIVp3O0KBhXDl5ZvRfzkyD3ZkYfIWVVvi7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771666808; c=relaxed/simple;
	bh=N+ioHBxopYxMiJdZhLppyoVXxg4UFuHhYCAxFEhX89A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHC+6V2Lg5LHAXhLywtabR/yneoNKYZxKHTkXYrAjFt6zNXxdjymP9yOcvuJWWfwPwilxuYZiirglQagRg10Pr9XTrFyPSQeb6re5OxwiNuG4sjIQmY1eMBbiZNSgKSNERJCu/C9BxuUXYbzpI7e83pPr2QBnk/d0lhg0e+8wiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvS2ONyV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvS2ONyV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so17177765e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666805; x=1772271605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=;
        b=cvS2ONyVrXyB0P7XzwQqJWwcMJnzUj0i7eKITr8ciHMmkKmefTpRSaVfwh/SC26OrP
         7b6ogWCMVtrIDCuwgS8Y66OiVySKPO/jwvspjCC8NcqgdJx8t07G+PnAw/75ohuGGl88
         LEbmdsCPZkxqYFhRIvJrwp0alRYJ3wMgrQ+0fpUv1NN8LaJY4WRDNGfq8LSv97W79qV3
         Xetz29AN3SgMGAjpfbzADz71Z570secW4DMiiYdOyI/jJ3l4Aj/Qrq8cKmuxx7Yyden2
         vRnYvnZsrgClx6Ry+fOB9Xi+zrvMm6ugRcO+ktJMk1GPGhFKjSh7tzYoRKFKFEwo7N0p
         /+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666805; x=1772271605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SRt4pEujAjZL7YcRKGKgR1k7mcODZZuIAG7QjvJr7M=;
        b=fabsqiit9O3pwghoK1h/ewER9h2C/U7ulFYiOZwOhpTZHLbHeAwBnMbVXTxx5ap8Rb
         kYpFAWuBd0U2XOzkb+sNKIeVJEW3w56jJjC7aVh+mtwd6A0sRcQset4IuFaNh487jed6
         Zy/JR7R8ZpqEN2tizE0bi3H6udSWLcizWWXUMf66hdxEaB4/OOdAagWNCAXBUea6YflA
         JRzjyVsUKH0YashdnLUKWmHb4WEbavtZNxcO3qTRU8K4qjhiAEQjPyuOl4PaAiJ/j/SP
         dD94d+8QnnsC4zeOeBax/iROcxKlvGtb90zY0mdILOv7leeuGK7xdM6XjmKmwT+3dF9X
         dT+A==
X-Forwarded-Encrypted: i=1; AJvYcCV3aWACeTDW6vrN8UoJLAHiRFY+2+ZiOlL7HTlBx01ecoEZm7VZ7y/6yzNWHlhxN+YI3ULkv0TyisvP0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2flGFz2tmz06m5CesCIoG6eVH/NHbch/+hdYRw6/0AeIPtHHh
	9O7OzbBZMzdVSj4qL/6Z01nJPOpqRpEXIgr7HdO3mdMH2TlnyJUEn3G5
X-Gm-Gg: AZuq6aKGER+qdvB6UjxXjx0rlZHxcX/tZpaEl2I2zQmSrooI3p5V/jsniafUHGYd8Jf
	VG3Nz0w8nC4HSTDJK/PkeMZmFOAbcLOLofVu5rllvsKNgzLZFG96KhnG42pwjYsgGZdcESh65XJ
	IPa1KyYYJJHYDp/z94nir6IhJZ4pwHtOi0uo1TCOugBMOr4HGV5BmIHCEFVG2vEimiE5R28tZ6v
	nx06WQgQ0bfgboBTu5mx7D/VDG7uBNuHbOrRogddBGD6+Uidqiy92JAqibZ3SswfqTOVp4+j+J4
	Pp7shEbP8LU2S2YbUyISHBH0YM9TSs8lFfTFojqFbu0r44AAAX6q2+GVLGN4ULQOogdoPa779xM
	HTgop87yPaADmxPMX+h57uZH9U2cKa26qmwfoAzDUloiXcYV4dddjaRlL+d0CNMg0l7YC2xC+FN
	VZIQkhM3SxYlHKgBhkPG1AdYEMwyvo7IhqZzcgtoGPtkEKL5W+a+e5ZnrIrG8/GQNk/6Vpw1Bxc
	Z6KnYJkL/83A4nMCvM=
X-Received: by 2002:a05:600c:608f:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-483a95bd7e8mr38778385e9.5.1771666805222;
        Sat, 21 Feb 2026 01:40:05 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadd4sm41900045e9.11.2026.02.21.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:04 -0800 (PST)
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
Subject:
 Re: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a define -
 take2
Date: Sat, 21 Feb 2026 10:23:33 +0100
Message-ID: <13952574.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20260220161011.999642-5-richard.genoud@bootlin.com>
References:
 <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-5-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 20. februar 2026 ob 17:10:09 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The user data length (4) has been replaced almost all over the file, but
> 2 places were forgotten.
>=20
> The user data is placed before the ECC, for each step.
> So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
> OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>=20
> And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
> the same offset plus the current user data size:
> section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
>=20
> Fixes: 1be7ac78b72f ("mtd: rawnand: sunxi: Replace hard coded value by a =
define")
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

This doesn't really need Fixes tag since it's only refactoring.

With that said:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 99d305bbda53..5d925b59b618 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1051,7 +1051,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct =
nand_chip *nand,
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(nand);
>  	struct nand_ecc_ctrl *ecc =3D &nand->ecc;
> -	int offset =3D ((ecc->bytes + 4) * ecc->steps);
> +	int offset =3D ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>  	int len =3D mtd->oobsize - offset;
> =20
>  	if (len <=3D 0)
> @@ -1747,7 +1747,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info=
 *mtd, int section,
>  	if (section >=3D ecc->steps)
>  		return -ERANGE;
> =20
> -	oobregion->offset =3D section * (ecc->bytes + USER_DATA_SZ) + 4;
> +	oobregion->offset =3D section * (ecc->bytes + USER_DATA_SZ) + USER_DATA=
_SZ;
>  	oobregion->length =3D ecc->bytes;
> =20
>  	return 0;
>=20




