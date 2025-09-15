Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2C1514F7
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Sep 2025 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757951562; cv=none; b=bflGTJ6IUOQOuOOGexjmBAo2di8T2VClxkXDECkjA70wtdomEsgz8Ol2RfBJ2wHtGL51brboTBU5A0TcokwQqcUARs01jvz8gf0+nlH03NzXt0Mz0xGhxM0QwfW5zFyOjGFR7fp08rVrydbG9Pz1r9XAi195imtHVzs3AR9j7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757951562; c=relaxed/simple;
	bh=ja9OWYEVXSr2UiGTctDpXMZEzW/P7RpSGYnt211PIXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubfxJmlUbIai+yZHKB217Dy1dpR+8T4MZnHvrMaGT5ByLsU05G90I5LgS9Vk91l2ZuqQBRFJl8d1F9rs8pNxzzfCmuWSVjvltS15mIhugtxnzwo6n5f3NaQ47OorDKs32HwnVJZtZq3noDC1BmQiYv8c17rNeYQIfw2w6KDA1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAG412ln; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAG412ln"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so39719355e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Sep 2025 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757951559; x=1758556359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE95SRHM5WsxxyZLbDkZ5n2nrtTjMwmv21OqVrMDAkU=;
        b=LAG412ln1U89QmLpLenlHAytM11jqJSo7uMdkIflboTNTjBnNgSEq/5FWpHa3Y0gNv
         WsAaoLwUI3DJj+Mbh5GhJXVzGSZu1FNsHQIONFzPBDwm3e1Tfp7hneZFXiTk1vUUWY1S
         /tJUseAGpATQ+Als3Q6YJl4ntVHHTtFCAhQKork/p65jKHul0TXs0B7TZC8Nr9SPKpJz
         I2vjexCTGfrHFL0amgB1FRO47AuQCmGb79wN3/DmzdJUqLclm7GUiyfLz5IdXxGP8zmd
         Pi1fBwM7c9QFdY/9f1mhft6Tuc3ltIOdp7jag2y0mqY4rTe/wA+XzXWhmw5zkXtbbK9s
         DhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757951559; x=1758556359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nE95SRHM5WsxxyZLbDkZ5n2nrtTjMwmv21OqVrMDAkU=;
        b=PxNuFpYXy34Oa8y/oCN6Y8CadSBuJE4pj1r62qiyPlJlfMyiUpLctIZhmAnPTrJVXQ
         yQeg1ViLvWsxzi624UMW0oQfWSHjRvNvvzOTSZbcgQcRjku3oT5triygABz/2I+CHKZV
         er2bzBuDEO8s+xIk9HQa9+QGBFQeZ5CUL6wMf63DHyMZ0khkBGi4BYeGW1/noG37QlLC
         fGAaXg4v8172csfPXSq/v2kHNXxUCCxlI3ZqItSCE6zhbOIxN0HYH7cxuPh4zE/hVyuG
         lT/hDUAEQq3kDylYsqBdQyxHf3vPYXoMMbC8fiXnW79rjJ4z8PSsbgMHFluDyhDhT6Ei
         0P4A==
X-Forwarded-Encrypted: i=1; AJvYcCWWaSy+oaMOWZeZVGtKFiOwQMhzEFlpd5tTIAIHAjn1cDj2jtZ6qKhm5BHHeRb/I7vgxbaJio0UK7kyPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFkdfjokTt3vLCZgQDaqsxfV3DrllREO1ZervaHjrYZkSzadpP
	2hgzUHhpJrRuNs8vnGWF3UlheQVKcJVfrhLdzEf4iV7/fX1ygGHjKrLn
X-Gm-Gg: ASbGncsJlHAlgGd5XJ4v8xI4fSAfIxhVZiBzJYqkf2N51kQv1dIRWscZHIZL0zTI4bM
	jS/ouCV7Uo7z78Rscvn/B1Icz2HKtouPl0pN5yqorsxHIHFtekLevFCycnV1tt/OSIxydSi5s18
	K3fnLraEYo4xY6LxIxNbgbeVH6d9vko22O+C8rOV9wfTa+uyxYfHC12fUB6w5+V3Q6NxmGKfSYq
	5ejMFw2IA+thluLqD3EEytX92FRfXiElHhXp80wWho+zs3mBtMsVoV3Hx6HzOmLuOPXPVcLmitw
	VenvVCqDpHl14sTo6U0SZWBYXwAsedZ6Bhf8u/84V78kiQHsG/+xm3Ofcx6KuMGEEUqTdmje5Sq
	WCl1b2mb1qvLKL+7Lo3jnnBBUoQZEdfm2hw4L6ePN45kn6Sf5SOeIAt2iGaAHGKBxlTP1NH/ZoP
	OjvPLLYw7QPQ==
X-Google-Smtp-Source: AGHT+IFQYIUacefjsyaIJ/5D5w+dubs5MGw17v+/xqIxvPCKvLjZRz3vRqy9EdisyU6FhzG6jSfmiw==
X-Received: by 2002:a05:600c:4e92:b0:45f:286e:49a8 with SMTP id 5b1f17b1804b1-45f286e4c58mr74069425e9.30.1757951558614;
        Mon, 15 Sep 2025 08:52:38 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f27f44624sm107457145e9.3.2025.09.15.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 08:52:38 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lukas Schmid <lukas.schmid@netcube.li>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 =?UTF-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
Subject:
 Re: [PATCH v1 1/1] sunxi: extend R528/T113-s3/D1(s) DRAM initialisation
Date: Mon, 15 Sep 2025 17:52:37 +0200
Message-ID: <3006634.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250915163637.38d05aab@donnerap>
References:
 <20250914144411.157826-1-lukas.schmid@netcube.li>
 <20250915163637.38d05aab@donnerap>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 15. september 2025 ob 17:36:37 Srednjeevropski poletni =C4=
=8Das je Andre Przywara napisal(a):
> On Sun, 14 Sep 2025 16:44:11 +0200
> Lukas Schmid <lukas.schmid@netcube.li> wrote:
>=20
> Hi Lukas,
>=20
> thanks for the patch!
>=20
> CC:ing the sunxi list and Andr=C3=A1s, who I think has some T113-s4 devic=
e as
> well.
>=20
> It would be good to see some Tested-by: tags, but otherwise the patch
> looks good, I'd say.
>=20
> Also I hear that awboot uses 0x6800 as the chip ID for the -s4, can
> someone shed some light on this?
>=20
> Cheers,
> Andre
>=20
> > Extend the DRAM initialisation code to add support for the T113-S4 aka
> > T113M4020DC0 by checking the SoC's CHIPID.
> >=20
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > ---
> >  drivers/ram/sunxi/dram_sun20i_d1.c | 13 ++++++++++++-
> >  drivers/ram/sunxi/dram_sun20i_d1.h |  7 +++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/ram/sunxi/dram_sun20i_d1.c b/drivers/ram/sunxi/dra=
m_sun20i_d1.c
> > index a1794032f3b..01d19d5feaa 100644
> > --- a/drivers/ram/sunxi/dram_sun20i_d1.c
> > +++ b/drivers/ram/sunxi/dram_sun20i_d1.c
> > @@ -54,6 +54,11 @@ static void sid_read_ldoB_cal(const dram_para_t *par=
a)
> >  	clrsetbits_le32(0x3000150, 0xff00, reg << 8);
> >  }
> > =20
> > +static u32 sid_read_soc_chipid(void)
> > +{
> > +	return readl(SUNXI_SID_BASE + 0x00) & 0xffff;
> > +}
> > +
> >  static void dram_voltage_set(const dram_para_t *para)
> >  {
> >  	int vol;
> > @@ -663,6 +668,7 @@ static void mctl_phy_ac_remapping(const dram_para_t=
 *para,
> > =20
> >  	fuse =3D (readl(SUNXI_SID_BASE + 0x28) & 0xf00) >> 8;
> >  	debug("DDR efuse: 0x%x\n", fuse);
> > +	debug("SoC Chip ID: 0x%08x\n", sid_read_soc_chipid());
> > =20
> >  	if (para->dram_type =3D=3D SUNXI_DRAM_TYPE_DDR2) {
> >  		if (fuse =3D=3D 15)
> > @@ -675,7 +681,12 @@ static void mctl_phy_ac_remapping(const dram_para_=
t *para,
> >  			switch (fuse) {
> >  			case 8: cfg =3D ac_remapping_tables[2]; break;
> >  			case 9: cfg =3D ac_remapping_tables[3]; break;
> > -			case 10: cfg =3D ac_remapping_tables[5]; break;
> > +			case 10:
> > +				if (sid_read_soc_chipid() =3D=3D SUNXI_CHIPID_T113M4020DC0)
> > +					cfg =3D ac_remapping_tables[0];
> > +				else
> > +					cfg =3D ac_remapping_tables[5];
> > +				break;

This is similar thing to what has been done in H616 DRAM driver, so FWIW:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> >  			case 11: cfg =3D ac_remapping_tables[4]; break;
> >  			default:
> >  			case 12: cfg =3D ac_remapping_tables[1]; break;
> > diff --git a/drivers/ram/sunxi/dram_sun20i_d1.h b/drivers/ram/sunxi/dra=
m_sun20i_d1.h
> > index 91383f6cf10..7bd8f67a77a 100644
> > --- a/drivers/ram/sunxi/dram_sun20i_d1.h
> > +++ b/drivers/ram/sunxi/dram_sun20i_d1.h
> > @@ -19,6 +19,13 @@ enum sunxi_dram_type {
> >  	SUNXI_DRAM_TYPE_LPDDR3 =3D 7,
> >  };
> > =20
> > +enum sunxi_soc_chipid {
> > +	SUNXI_CHIPID_F133A =3D 0x5C00,
> > +	SUNXI_CHIPID_D1S =3D 0x5E00,
> > +	SUNXI_CHIPID_T113S3 =3D 0x6000,
> > +	SUNXI_CHIPID_T113M4020DC0 =3D 0x7200,
> > +};
> > +
> >  /*
> >   * This structure contains a mixture of fixed configuration settings,
> >   * variables that are used at runtime to communicate settings between
>=20
>=20
>=20




