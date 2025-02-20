Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F31E9B1C
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740078344; cv=none; b=AtG1HcI1tKVEJA/tOvukwLUwEUgT09JekRRLZ3xbZDTwoHWUrGnzmoRJKvyWBx/fwxvBRu+YoLafMUfvubBTFMr4ZMl1Zu+93t32Mt2JCx6lMn4wVxiEZm+rI+J7s71UmE/TIZ7M08vM/2wb4y0Pt31V42iMQGkGrPRN7i+Zhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740078344; c=relaxed/simple;
	bh=7Q6Q5WJ5jLsdiIjqXRzNZWHgWgvJqZqVEo0Zn5BT6K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCBnU8JBBRDhZmJp6IGWNPemEBJ/Fh6TI2SxHnuooAbcYCoTUEbr71aYbgrjpJJquDPONSapRQRuFrt8oFMmpX0z4JM2Bq5sjaYuIPeamRc4G60wtGXYcXOn/8wbcLeAZt98qYbg0z6Z7G6Q6r7iB0UkantlPqasVo+3GAF9ZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkyQtFRT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkyQtFRT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f3ac22948so709272f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 11:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740078341; x=1740683141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxXRd6kScNWklP0aI84Uk3jfvKHEaeWScRLyJ37G088=;
        b=lkyQtFRTdo4EB3nMWkp4UAT8scGesDaXd+9Or50ioGdfMXLCdMPEv0Czb7/o+S5KxB
         tUZOteBKVViWTZKrTMHtpsqb/kwso4KVdxy/cKVD6vtDsB9/M0/PReOpjNT4jjifsipN
         +cTFQuW6935SfHg2Vejkto57JdAPZhcTFaLlx4faK2mGJXDlaD8pYtLxwKfXPRbJ6oQ5
         cRq+N49n4MdHttkXL16aRL2W/LFn+JKs/oDdwSukE2JLIN0oapzGUsWHZmGjskZQM2Zg
         tRjGV+OXa5Wphemygbb3VTXYn8CQEqp7ayUwEjPBHoNtZulFPI+8PDb1bXTviQzYi0F2
         VHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740078341; x=1740683141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxXRd6kScNWklP0aI84Uk3jfvKHEaeWScRLyJ37G088=;
        b=JBlBz54x/LAV45lbdPol2bMXg/T5OHszgDTgaw09joway9bGZQwizelo4flNnoEqwV
         fq2S4zJ23zx+zf5NH+fJHcLenJOuZC+Cq5DO68frNdfFxW66ZYKRyXUNc0ZrmRyQClcQ
         vCHgZAKnEK+Ex7RSgYM9aVOQmyYwJktAKEXPseistxz7qfFHf2aA2fgKRKCuDRd8klxb
         5SttSTiP4jvXuDbXnD8E7S0NDQ33YbwVe7BKlI+khK6iFVselVj3/uZEdKGuQWb18SHq
         srH3LF183JvyLcCpWzEkM/RtUymQimouw2d7P0c6ut5QRC1HMa3hxIm3nUHeSDhUljkf
         pmrw==
X-Forwarded-Encrypted: i=1; AJvYcCVgvSmdM6ZD4E7b85GFU057+zTPJIEWAd5MlAYtW/EOJJfl/fuC4UqzTeCfZGpCv1qQR49Qjd3o1jzJ9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5H7fW5eOAG8dornjBxD8/ss0LZP6xbE0uLRdnU/eJfkpfBkNJ
	ucpmdt5d5wCtB/TnOzrXMrv4ElLFyGlYt3PLi9I+hW3iDbH1xPRk
X-Gm-Gg: ASbGncuuUpQjZeHsnWzEkOKRgiHRg/kgDh0mxwZOvdQzDRcHnRIfrUu1oi12z/rw97z
	i4Bfj8A3srcA1/RwSG2oizYg2evHR1/zWoB2IqMVnPJw5qhFsHkRGWRiBy1dZpCWKhhnA7uZrT9
	FH+9DoChlJHwkfAeOddmDaGI8T55G1gXVDlc/jshEAEOCUCuYCf/mcRyIJ+1CrLlbv/HiQSyWZV
	yYyOZNylF7yovaBASWKuLcwZcEIEZ2mAFILytv0vQb/fswU9aym4VbJ5NEE7undT3+kZh1KQmQt
	ksvLgfsr8LxKt6oixPnrm6AIT8OpDZkNuJXvWYvus982OXeEdVDtHEY7s0HYhzWGfIo=
X-Google-Smtp-Source: AGHT+IHGlrHIltTgTcFWFI4O0gp4KyFom8vkd8k5Kir49mlEGZQwrYgDsE0U7DMZu3givQVd9isJuA==
X-Received: by 2002:a05:6000:1ac6:b0:38f:6149:9235 with SMTP id ffacd0b85a97d-38f6e95f233mr316305f8f.16.1740078341247;
        Thu, 20 Feb 2025 11:05:41 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8121sm21083169f8f.88.2025.02.20.11.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 11:05:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v3 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for
 h616
Date: Thu, 20 Feb 2025 20:05:39 +0100
Message-ID: <2733255.KRxA6XjA2N@jernej-laptop>
In-Reply-To: <20250214220247.10810-3-ryan@testtoast.com>
References:
 <20250214220247.10810-1-ryan@testtoast.com>
 <20250214220247.10810-3-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 23:02:24 Srednjeevropski standardni =C4=8Das=
 je Ryan Walklin napisal(a):
> The previous H616 support patch added a single LINEOUT DAPM pin switch
> to the card controls. As the codec in this SoC only has a single route,
> this seemed reasonable at the time, however is redundant given the
> existing DAPM codec widget definitions controlling the digital and
> analog sides of the codec.
>=20
> It is also insufficient to describe the scenario where separate
> components (muxes, jack detection etc) are used to modify the audio
> route external to the SoC. For example the Anbernic RG(##)XX series of
> devices uses a headphone jack detection switch, GPIO-controlled speaker
> amplifier and a passive external mux chip to route audio.
>=20
> Remove the redundant LINEOUT card control, and add a Speaker pin switch
> control and Headphone DAPM widget to allow control of the above
> hardware.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 886b3fa537d26..f24bbefeb3923 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1916,10 +1916,11 @@ static const struct snd_soc_component_driver sun5=
0i_h616_codec_codec =3D {
>  };
> =20
>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D {
> -	SOC_DAPM_PIN_SWITCH("LINEOUT"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),

Will this break sun50i-h616-x96-mate and sun50i-h616-orangepi-zero based bo=
ards?
If so, other solution must be found.

Best regards,
Jernej

>  };
> =20
>  static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widg=
ets[] =3D {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
>  	SND_SOC_DAPM_LINE("Line Out", NULL),
>  	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
>  };
>=20




