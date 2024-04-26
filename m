Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612A12C7FB
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714142367; cv=none; b=FULTzcG7LbeaFgFjVbK9pPOGTSQqptQMh5vF7jMTCc6Z992v3MbZ7rWvvdKmTjqawo1g2/z7FQg9PoS30v3INGeh2ZZ63On7OdxhUQA1e/1hgOKivD5TPQIKsM17tBQMwWSMZmBtM1TS/LVIK1tach8cqqxIuv4zSlogetGCeic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714142367; c=relaxed/simple;
	bh=GrYW9CDBavo2dcW9zM8Gw/4eM+v8rP9srC8IHUunxhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPRZPVVFaQlpmGFh3876Qz5FZfKHHPhVWxuZR6FG0vzUGk3oVAUK1poieNg4bJ484ciRULJBOGF8aU87eEYRVnRCrO8+y2QYUD/oA6FU0tYOW94Y+Ys1K/LcIS9DSde9pqA59HDmjvZPwv0JQh1Q77eJo28qGYExsbNFnoMiWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0GOs3Go; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0GOs3Go"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ffso3420455e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714142364; x=1714747164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6+Pa/hI1y9ZPcsTSA6wG8AnTaAGOiXpZcyJZzX026s=;
        b=F0GOs3GooRXKHF3ceoreEo8Hy7ClvbiofXyUwIXV2JbuVKvaRpjW89qN2zBP6ABFNS
         XjdPe0zvDLzTKSzlynaueLBTIXdNNk/Jf1GrnHIzlkLFuG7RrbgG+kcRzEEN6Gk/BSHO
         tec0R9p6Mhxx53w4XkpHpLrg89pwu7+btyTWz4+l9DL4wHGarxHZI4J+jJ+O/P6OJX+m
         lz0P2ALBmnLwSB2f3zzkgOsCBISg6A+PRNiAWBX5iwDtFen9Q7t29GbebFrLfOLzmHo6
         owSjoUPx6nAoHScaRl+htK4SMYokJNXSetF6m4p/VWoQ03xfkL3H+3UlloF4Mt1kMVjf
         YTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142364; x=1714747164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6+Pa/hI1y9ZPcsTSA6wG8AnTaAGOiXpZcyJZzX026s=;
        b=m/bnw6ALGnKDzVIJnUUTbh/2NfdYtifaggdKUV67S0K1VfBCEZ9+dF2SFFN123uUem
         Ccb4ufJxqt5FtrNlqlO1JLM7NnTxF2l8Z9anEcNUeQNORj+NXwdZItTuPImRCzM15bGd
         LFykrBlP5xsGxiR1or4E+v7VqNiznyFmcTrk89WOZgTT47N1xQuPQ59S/3CTmJJLr8TS
         qtWmIoNZZCI5C6qQ4Yqeg1rIu9PzBhGhRPvG3elkCIj8QNB9D4zwuU154w0Mzd1Wb7zo
         kBPavjVkzlP8DX1SS8XvsyFlKTbUAz6LZ92gPsjGOfqSq5DlRjztjRTetHgc8OZGTn/O
         CgSg==
X-Forwarded-Encrypted: i=1; AJvYcCWW5I+kbP9SCWc+EMBkw2kVaaZKuwWSVUER7IZRxR3gVejykgHDCVRQxhiVn0MoFnMc2fWYSvSrXVlXcVV0rgAktdNQFa4dEfNbWxE=
X-Gm-Message-State: AOJu0YxTtrTVpDKlOiVUr9TnMvV3pNj26f1jiK5ryO42OaOnKl9BNUSE
	WEumufC3GaJshRAB6+nega+q06DGM8Y0fbz/RdFaCPcX1EpPOMtP
X-Google-Smtp-Source: AGHT+IEeWmdV/an942UKZb0UcElZTOltLZZNCg90qG5k3ACvdMG2TZ2EWCL32aHLDIlkCsd0vGPv5g==
X-Received: by 2002:a05:600c:3b86:b0:419:618:ade3 with SMTP id n6-20020a05600c3b8600b004190618ade3mr2897823wms.19.1714142363495;
        Fri, 26 Apr 2024 07:39:23 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b004162d06768bsm35036561wmo.21.2024.04.26.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 07:39:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Joao Schim <joao@schimsalabim.eu>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: sunxi: DMIC: Add controls for adjusting the mic gains
Date: Fri, 26 Apr 2024 16:39:22 +0200
Message-ID: <2262648.iZASKD2KPV@jernej-laptop>
In-Reply-To: <e256942d-eba1-4800-bd02-c490167dea12@schimsalabim.eu>
References:
 <20240422150213.4040734-1-joao@schimsalabim.eu>
 <5772237.DvuYhMxLoT@jernej-laptop>
 <e256942d-eba1-4800-bd02-c490167dea12@schimsalabim.eu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. april 2024 ob 13:03:56 GMT +2 je Joao Schim napisal(a=
):
> On 4/24/24 20:42, Jernej =C5=A0krabec wrote:
> > Hi Joao,
> Hi Jernej,  thanks for your prompt response.
> >
> > Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napisal=
(a):
> >> The AllWinner H6 and later SoCs that sport a DMIC block contain a set =
of registers to control
> >> the gain (left + right) of each of the four supported channels.
> >>
> >> Add ASoC controls for changing each of the stereo channel gains using =
alsamixer and alike
> > Add SoB tag.
> Yeah, i realized that too late. Thanks for bringing that to my=20
> attention. I will add it in v1.
> >
> >> ---
> >>   sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 34 insertions(+)
> >>
> >> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dm=
ic.c
> >> index c76628bc86c6..f8613d8c3462 100644
> >> --- a/sound/soc/sunxi/sun50i-dmic.c
> >> +++ b/sound/soc/sunxi/sun50i-dmic.c
> >> @@ -14,6 +14,7 @@
> >>   #include <sound/dmaengine_pcm.h>
> >>   #include <sound/pcm_params.h>
> >>   #include <sound/soc.h>
> >> +#include <sound/tlv.h>
> >>  =20
> >>   #define SUN50I_DMIC_EN_CTL			(0x00)
> >>   	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> >> @@ -43,6 +44,17 @@
> >>   	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
> >>   #define SUN50I_DMIC_CNT				(0x2c)
> >>   	#define SUN50I_DMIC_CNT_N				(1 << 0)
> >> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
> >> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
> >> +
> >>   #define SUN50I_DMIC_HPF_CTRL			(0x38)
> >>   #define SUN50I_DMIC_VERSION			(0x50)
> >>  =20
> >> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of_m=
atch[] =3D {
> >>   };
> >>   MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
> >>  =20
> >> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, =
1);
> > DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE shoul=
d be
> > used instead.
> I can't seem to find that define in HEAD. what code-base are you=20
> referring to that i should checkout ?

Here is define:=20
https://elixir.bootlin.com/linux/v6.9-rc1/source/include/uapi/sound/tlv.h#L=
52

However, I'm not sure if this message means DECLARE_TLV_DB_SCALE is
deprecated or not:
https://elixir.bootlin.com/linux/v6.9-rc1/source/include/sound/tlv.h#L12

Best regards,
Jernej

> >
> > Other than that, it looks fine.
>=20
> Thanks.
>=20
> > Best regards,
> > Jernej
> >
> >> +
> >> +static const struct snd_kcontrol_new sun50i_dmic_controls[] =3D {
> >> +
> >> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D=
0D1_VOL_CTR,
> >> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_=
VOL_CTR_0R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D=
0D1_VOL_CTR,
> >> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_=
VOL_CTR_1R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D=
2D3_VOL_CTR,
> >> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_=
VOL_CTR_2R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D=
2D3_VOL_CTR,
> >> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_=
VOL_CTR_3R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +
> >> +
> >> +};
> >> +
> >>   static const struct snd_soc_component_driver sun50i_dmic_component =
=3D {
> >>   	.name           =3D "sun50i-dmic",
> >> +	.controls	=3D sun50i_dmic_controls,
> >> +	.num_controls	=3D ARRAY_SIZE(sun50i_dmic_controls),
> >>   };
> >>  =20
> >>   static int sun50i_dmic_runtime_suspend(struct device *dev)
> >>
> >
> >
> >
> Kind regards,
>=20
> Joao
>=20
>=20




