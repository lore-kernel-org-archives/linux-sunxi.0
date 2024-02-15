Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ED541C61
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Feb 2024 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708031891; cv=none; b=dyahHZppDeC2+ZDPG8hq6BXVRpu62jKqSpVAwlCvRxr0m/zpyoCfrO7k/BYkVxGVkxwZ1I3dIjOMaQjwG2oqAZFYPc2eDrZwbjdNOX3VHMPw2eQ+b2W1g3RYXvzMAZYVN2gIA2x7kGq+XY4SFB0eg3rIQl0YUJ3zWcMPwbLa2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708031891; c=relaxed/simple;
	bh=MEKQInLFoLIrFe/RI2hTv8m7ddPPsJ8B+2TSmf/ILvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXz73rPVi/nQEtpTz2lrPxoGx5r02imbnfMPdkV9FgBfNdKPevoNT7gSt1oeVv0tRTZwh1zI1aIDUZZVrLfw6mkgOztrSg7DUHtQK9ATWUkHnOjhjo5zRU9MPraAlkW21l5XY0aOJNrn8hT0xSQNgExVj3Dh9gxXCdZNRjShz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=go9iG3R2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="go9iG3R2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-411d715c401so10773385e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Feb 2024 13:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708031888; x=1708636688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS4xTIctADjL/du4nbroj5ubyuOnz8QYFJw0VPl01nY=;
        b=go9iG3R2iroVik5N094/N315abaU90Ot72f8MKbbgWtR76YVYxPT91wc3aGAxzTY1t
         PX9lVIzvQo/dLjwGp4ylxSe41Xa2QEj8xx+aCOdY3pj+Rv65VrW0ILFPqT9IzQV8DqrT
         CT+VF1OpY9ljAjPnaz1HVIw/TXuPx7PaaOp2Z4uOlvMZUKyNwBQQzJHfCRbi4tKw7VPV
         qHVllCKwdHeZOizunJ+DlDEDa9noHqOeo1HuObHvptwbgdlme3Aib6HpXw+9vtfUaSa3
         3j5VY4L83CvHEb37NieuUL77eHX+b8AU06nWq1zdy/Ab38aqbmsU/FCb3FztUFGhyxKl
         LqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708031888; x=1708636688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aS4xTIctADjL/du4nbroj5ubyuOnz8QYFJw0VPl01nY=;
        b=TlMNN8xjJ5B47cf3EpIGSQ+ZF5TEH1MDiWCUpcMV/MlUohAfiAhGqjkEgRNFADHY3e
         L/cTZ749iKn2rBGXTWSYeLDJgu0Kta/cIm3YkBuiEuUiRC5upwSzt1jLkmlG60UKz1yT
         pqpC9hwSEM8fR7he9s1sncsoacJsmEkeCIbJLlwbW9n79oHOY9rRVJwYs3Ywq1yE+fzJ
         LmgF96BDrsCj0eYksInYBKyW8SRWjdMqFQkJSMMcxl2lcjSrkUwZqSHG6wY7tLCO1B3c
         uFuyWCeLyrfDOcNxGJ+w2ENn+YOcFMpV3CrTgyoKDTCAftbNamUSMZ9y2b4XCj+Kv9XI
         O7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdedcXBjr506AvENQHiLSBqqr3kxDJ+4w3vtz2gSOMxRyqLc6pxLnLRkBMxK0kcZ3sl3ol9VuTab1PQ0BBzALliZeovDQ1G1A9Vbs=
X-Gm-Message-State: AOJu0YyFShVlGfd4LO2VeSI3Ov6J7OGBqB/ZERrU37bBLIQSeElR+mzt
	kXIAzv6ffdhGnHorFigQVyftzpyJHOfUITsAkuM4/2XnJBYhc6aw
X-Google-Smtp-Source: AGHT+IHp3itPz4qmwUhgnSD35wTOWKCX1VcKqWohIy8udfDUWx+vTB3r1HwCrq2hGaR3wHqzQMg5dQ==
X-Received: by 2002:a05:600c:3506:b0:412:1f3f:db1b with SMTP id h6-20020a05600c350600b004121f3fdb1bmr1917257wmq.3.1708031887715;
        Thu, 15 Feb 2024 13:18:07 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id z20-20020a05600c221400b0040fddaf9ff4sm271356wml.40.2024.02.15.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:18:07 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Bob McChesney <bob@electricworry.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v4 1/7] soc: sunxi: sram: export register 0 for THS on H616
Date: Thu, 15 Feb 2024 22:18:05 +0100
Message-ID: <5752001.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240215012847.7d0eeda9@minigeek.lan>
References:
 <20240209144221.3602382-1-andre.przywara@arm.com>
 <2172811.irdbgypaU6@jernej-laptop> <20240215012847.7d0eeda9@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 15. februar 2024 ob 02:28:47 CET je Andre Przywara napisa=
l(a):
> On Wed, 14 Feb 2024 21:29:30 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> thanks for having a look and the tags on the other patches!
>=20
> > Dne petek, 09. februar 2024 ob 15:42:15 CET je Andre Przywara napisal(a=
):
> > > The Allwinner H616 SoC contains a mysterious bit at register offset 0=
x0
> > > in the SRAM control block. If bit 16 is set (the reset value), the
> > > temperature readings of the THS are way off, leading to reports about
> > > 200C, at normal ambient temperatures. Clearing this bits brings the
> > > reported values down to reasonable ranges.
> > > The BSP code clears this bit in firmware (U-Boot), and has an explicit
> > > comment about this, but offers no real explanation.
> > >=20
> > > Since we should not rely on firmware settings, allow other code (the =
THS
> > > driver) to access this register, by exporting it through the already
> > > existing regmap. This mimics what we already do for the LDO control a=
nd
> > > the EMAC register. =20
> >=20
> > Are you sure that this bit doesn't control actual SRAM region?
>=20
> Pretty much so, yes: I did some experiments from U-Boot:
> I filled SRAM C with some pattern, then read this back. Then flipped bit
> 16, read again: same result. Then wrote something again and read it
> back: no change. In fact no bits at 0x3000000 had any effect on SRAM
> accessibility, only clearing bit 24 in 0x3000004 made the whole SRAM C
> (0x28000-0x47fff) go read-as-zero/write-ignore, from the CPU side.
>=20
> I then triggered the THS device, to do temperature readings, but
> this didn't change a single byte in the SRAM regions, with or without
> bit 16 set. It only changed the returned values, at 0x50704c0.
>=20
> So yes, I am pretty certain there is no SRAM region that gets switched.
> Even if we would want to claim there is: I wouldn't know which
> address values to put into the SRAM DT node.
>=20
> So I guess it's another example of: oh, we have this spare bit here. Or
> it's some kind of chicken bit? I don't know, and I think the BSP code
> we have seen didn't offer an explanation as well.
>=20

It would be nice to mention this in commit message.

> Cheers,
> Andre
> >=20
> > Best regards,
> > Jernej
> >=20
> > >=20
> > > Since this bit is in the very same register as the actual SRAM switch,
> > > we need to change the regmap lock to the SRAM lock. Fortunately regmap
> > > has provisions for that, so we just need to hook in there.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/soc/sunxi/sunxi_sram.c | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >=20
> > > diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi=
_sram.c
> > > index 4458b2e0562b0..71cdd1b257eeb 100644
> > > --- a/drivers/soc/sunxi/sunxi_sram.c
> > > +++ b/drivers/soc/sunxi/sunxi_sram.c
> > > @@ -287,6 +287,7 @@ EXPORT_SYMBOL(sunxi_sram_release);
> > >  struct sunxi_sramc_variant {
> > >  	int num_emac_clocks;
> > >  	bool has_ldo_ctrl;
> > > +	bool has_ths_offset;
> > >  };
> > > =20
> > >  static const struct sunxi_sramc_variant sun4i_a10_sramc_variant =3D {
> > > @@ -308,8 +309,10 @@ static const struct sunxi_sramc_variant sun50i_a=
64_sramc_variant =3D {
> > > =20
> > >  static const struct sunxi_sramc_variant sun50i_h616_sramc_variant =
=3D {
> > >  	.num_emac_clocks =3D 2,
> > > +	.has_ths_offset =3D true,
> > >  };
> > > =20
> > > +#define SUNXI_SRAM_THS_OFFSET_REG	0x0
> > >  #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
> > >  #define SUNXI_SYS_LDO_CTRL_REG		0x150
> > > =20
> > > @@ -318,6 +321,8 @@ static bool sunxi_sram_regmap_accessible_reg(stru=
ct device *dev,
> > >  {
> > >  	const struct sunxi_sramc_variant *variant =3D dev_get_drvdata(dev);
> > > =20
> > > +	if (reg =3D=3D SUNXI_SRAM_THS_OFFSET_REG && variant->has_ths_offset)
> > > +		return true;
> > >  	if (reg >=3D SUNXI_SRAM_EMAC_CLOCK_REG &&
> > >  	    reg <  SUNXI_SRAM_EMAC_CLOCK_REG + variant->num_emac_clocks * 4)
> > >  		return true;
> > > @@ -327,6 +332,21 @@ static bool sunxi_sram_regmap_accessible_reg(str=
uct device *dev,
> > >  	return false;
> > >  }
> > > =20
> > > +

Nit: superfluous empty line.

Best regards,
Jernej

> > > +static void sunxi_sram_lock(void *_lock)
> > > +{
> > > +	spinlock_t *lock =3D _lock;
> > > +
> > > +	spin_lock(lock);
> > > +}
> > > +
> > > +static void sunxi_sram_unlock(void *_lock)
> > > +{
> > > +	spinlock_t *lock =3D _lock;
> > > +
> > > +	spin_unlock(lock);
> > > +}
> > > +
> > >  static struct regmap_config sunxi_sram_regmap_config =3D {
> > >  	.reg_bits       =3D 32,
> > >  	.val_bits       =3D 32,
> > > @@ -336,6 +356,9 @@ static struct regmap_config sunxi_sram_regmap_con=
fig =3D {
> > >  	/* other devices have no business accessing other registers */
> > >  	.readable_reg	=3D sunxi_sram_regmap_accessible_reg,
> > >  	.writeable_reg	=3D sunxi_sram_regmap_accessible_reg,
> > > +	.lock		=3D sunxi_sram_lock,
> > > +	.unlock		=3D sunxi_sram_unlock,
> > > +	.lock_arg	=3D &sram_lock,
> > >  };
> > > =20
> > >  static int __init sunxi_sram_probe(struct platform_device *pdev)
> > >  =20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20




