Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B413AA45
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714416475; cv=none; b=nnX3AEtoe18FVcgBeO1QfQjpopW/lizcdkytbNlIqc4anmNAQWaNa/ZG7F0vUoNgbqIXbLTHQKTbRLARNII3NZW9CWkVno5XS6hHGM87IjSJQvjwfeJ5iNvgWjXHsLDgzS1piCbcmv1/U4Y0jrSJHi4GXDrNtcCovSyblJZGpn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714416475; c=relaxed/simple;
	bh=sfI+2cPmGTBiHB7TzIRHUCIU4s0NL0U1nLJOzraxfJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJ4zsnvmTaNhSqx1E7lcdtVd4dVdgQBoROBuG2ZG919qESTm0zd0MC5Zc2nJ8XsIyjzcZkRbm699xCXftfSvAmxPcGirSkMfSd4r4pweJWPVz73Qij1zHzY0qQl1p9t8A0Q/n8k7U6K5Vr1IoOkeGas0zSBkxQ4Yd9vl+6E38Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2CSe/GH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2CSe/GH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57225322312so6496307a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714416471; x=1715021271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq1Z6VTK+H4REXB+uZc6F5LGvhHCssGWCotvhjHscAA=;
        b=M2CSe/GHySGP2fB2ovQFoXSc6KScMoi8KP46wEp8BYguZMB+vSfYfmPBrF15986JzF
         EUpsCptbvs+/c13SdICCACy5KHMMP1zOzTRqt9VnhjYOu4qcQkxtE+mmmojeuDEeJN4/
         FbMrUYh9nyU4NotpA6TDFwqpmSUSeJTxne5SYQtzPowBARE+eiXcm0iLb7LuYSwLrK1G
         r93fRcgfiakiSPYsYi8Oii6hHX4bWC5W9MABaqUihBxcv88bhlThG0sy76FBarXBvjZC
         oHRbJxa0TdF6djNybAXDIs5WbDk+UYekyhAJHa7vZonhbaiMYE4EqYGNbtUl1Lt4d8zo
         +xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714416471; x=1715021271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq1Z6VTK+H4REXB+uZc6F5LGvhHCssGWCotvhjHscAA=;
        b=P9MSF5F6gCWkEhW75Zt2jRcjE4dU861udyw7/g2UUoebf9PX4aqasWPAfF89pucg2l
         tmwveQH4mud8O5N8iCqxIfTvzLuhE38RNxflbrG9KQ6FcCixFR/RH6D/tC9BM+jyDGcI
         PUAC+uwcrr6gSOb0iCmVvXJN6iEmIWGfDTKoxDBfkfe54MJVuCvsS0k9+CuNQ3ykX7VW
         ZISijV6C0Ugz4FXV5OY5yMXCxm+VnlnfndkAQSAJNmF0D/qWAY5NXk3o57W1/sHyrMqO
         ywocfqHYfECNTrrem++jKh81bf5IYSjrlFaUxVQfB3sPLaaDHCUheaZHs3AaOYV7PUyd
         uNTA==
X-Forwarded-Encrypted: i=1; AJvYcCUiug7M/JUQLzPXs3dG/khqUwOZlnTOGqC420/eQSC6/llyxjZPA/nMcuInhYh8OJ+fv5silU1mvVEjJ/QwRgMfHg1XYbymCywHQ5c=
X-Gm-Message-State: AOJu0YzKnILBg6wAqU4uHzBPEioosnTvVz+azwvKNfZLoiLwnJqT4OJ6
	sgriOqkTOpiwGb96CoaKyey9eYwOzSowa3CYLKCvgV6Cllr773TC
X-Google-Smtp-Source: AGHT+IG74LosNrsxgNf3gc2r6uvMZ7rXw4CtwJXibhsrxCiW+Y7ui7n7Uf15AUcOBckBy6ODLx9I+w==
X-Received: by 2002:a17:906:fb86:b0:a58:c80e:edd9 with SMTP id lr6-20020a170906fb8600b00a58c80eedd9mr5671018ejb.77.1714416470804;
        Mon, 29 Apr 2024 11:47:50 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id i22-20020a1709061cd600b00a55a10eb070sm11150150ejh.214.2024.04.29.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 11:47:50 -0700 (PDT)
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
Date: Mon, 29 Apr 2024 20:47:49 +0200
Message-ID: <2179677.irdbgypaU6@jernej-laptop>
In-Reply-To: <534a73a7-bc41-42a7-a060-bc1465f3a21e@schimsalabim.eu>
References:
 <20240422150213.4040734-1-joao@schimsalabim.eu>
 <2262648.iZASKD2KPV@jernej-laptop>
 <534a73a7-bc41-42a7-a060-bc1465f3a21e@schimsalabim.eu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 29. april 2024 ob 20:39:24 GMT +2 je Joao Schim napisal(a):
> On 4/26/24 16:39, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 25. april 2024 ob 13:03:56 GMT +2 je Joao Schim napis=
al(a):
> >> On 4/24/24 20:42, Jernej =C5=A0krabec wrote:
> >>> Hi Joao,
> >> Hi Jernej,  thanks for your prompt response.
> >>> Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napis=
al(a):
> >>>> The AllWinner H6 and later SoCs that sport a DMIC block contain a se=
t of registers to control
> >>>> the gain (left + right) of each of the four supported channels.
> >>>>
> >>>> Add ASoC controls for changing each of the stereo channel gains usin=
g alsamixer and alike
> >>> Add SoB tag.
> >> Yeah, i realized that too late. Thanks for bringing that to my
> >> attention. I will add it in v1.
> >>>> ---
> >>>>    sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++=
++++
> >>>>    1 file changed, 34 insertions(+)
> >>>>
> >>>> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-=
dmic.c
> >>>> index c76628bc86c6..f8613d8c3462 100644
> >>>> --- a/sound/soc/sunxi/sun50i-dmic.c
> >>>> +++ b/sound/soc/sunxi/sun50i-dmic.c
> >>>> @@ -14,6 +14,7 @@
> >>>>    #include <sound/dmaengine_pcm.h>
> >>>>    #include <sound/pcm_params.h>
> >>>>    #include <sound/soc.h>
> >>>> +#include <sound/tlv.h>
> >>>>   =20
> >>>>    #define SUN50I_DMIC_EN_CTL			(0x00)
> >>>>    	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> >>>> @@ -43,6 +44,17 @@
> >>>>    	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
> >>>>    #define SUN50I_DMIC_CNT				(0x2c)
> >>>>    	#define SUN50I_DMIC_CNT_N				(1 << 0)
> >>>> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
> >>>> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
> >>>> +
> >>>>    #define SUN50I_DMIC_HPF_CTRL			(0x38)
> >>>>    #define SUN50I_DMIC_VERSION			(0x50)
> >>>>   =20
> >>>> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of=
_match[] =3D {
> >>>>    };
> >>>>    MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
> >>>>   =20
> >>>> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75=
, 1);
> >>> DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE sho=
uld be
> >>> used instead.
> >> I can't seem to find that define in HEAD. what code-base are you
> >> referring to that i should checkout ?
> > Here is define:
> > https://elixir.bootlin.com/linux/v6.9-rc1/source/include/uapi/sound/tlv=
=2Eh#L52
> >
> > However, I'm not sure if this message means DECLARE_TLV_DB_SCALE is
> > deprecated or not:
> > https://elixir.bootlin.com/linux/v6.9-rc1/source/include/sound/tlv.h#L12
>=20
> Right, apparently i sneaked in another D in the name. That explains i=20
> could not find it.
>=20
> Will send v1 in a few minutes. Thanks.

that would be v2?

v1 is first submission and it's usually not marked as such.

Best regards,
Jernej

>=20
> Kind regards,
>=20
> Joao
>=20
> > Best regards,
> > Jernej
> >
> >>> Other than that, it looks fine.
> >> Thanks.
> >>
> >>> Best regards,
> >>> Jernej
> >>>
> >>>> +
> >>>> +static const struct snd_kcontrol_new sun50i_dmic_controls[] =3D {
> >>>> +
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC=
_D0D1_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D=
1_VOL_CTR_0R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC=
_D0D1_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D=
1_VOL_CTR_1R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC=
_D2D3_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D=
3_VOL_CTR_2R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC=
_D2D3_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D=
3_VOL_CTR_3R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +
> >>>> +
> >>>> +};
> >>>> +
> >>>>    static const struct snd_soc_component_driver sun50i_dmic_componen=
t =3D {
> >>>>    	.name           =3D "sun50i-dmic",
> >>>> +	.controls	=3D sun50i_dmic_controls,
> >>>> +	.num_controls	=3D ARRAY_SIZE(sun50i_dmic_controls),
> >>>>    };
> >>>>   =20
> >>>>    static int sun50i_dmic_runtime_suspend(struct device *dev)
> >>>>
> >>>
> >>>
> >> Kind regards,
> >>
> >> Joao
> >>
> >>
> >
> >
> >
>=20




