Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6274143C4C
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711568617; cv=none; b=lT5xsDYtaKFfovtO2sN21QyQ5f/Amzbuj3duarNO4W+vfjmC3X4dC2D0oRq5a/56rNWBu/0w6NXuk2K08mmQj0SlXjNzkzLbfC4xHplTf/s2D9g4Z8Z3f7QaB5jecYYGZpd22Xzgs7H5dk/FqeztQ9c5+WyJULMbs8yWj1kEJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711568617; c=relaxed/simple;
	bh=uMkOMTTCJYMqd0bOvlMSglUb5JXgQT3RbYPO6J/obB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nb12AfM9/13z0lmPCA+OIggO+QlCNl3oxwIQg3dtPWjTWptw+JbV0EYoHNX6K/OyRonIYyMFqJnByaQWWCYRZF4MNWc6qVeNXHMgxEKReBS64gWWLlTKJed21Z+kjQ0w7Niw1WhMvHoGceDtP8myJNAAAQGJbhCHB+OOSJ9wFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqttZejG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqttZejG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d476d7972aso1908101fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711568614; x=1712173414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c64xHlCzEqyAPC97zuuo4cscMpx4AHNYnhUI1IMgUA=;
        b=VqttZejGUoZcM9Lvm/fBoLKmtl6kJmbJf98tRkUgm8ihXZP5ej8LBCzH+RBv4q5QYD
         CEF7N+YqAtYCpDSiH6Lx0KUHuaj6iPaou151jvp5HQq8FjzisMy4Kuz6zIlt+EZBs604
         LFybGO7OsEfdbxON0YDpTq612m60ftOdLBgUmythZcEbFxkHv9VAZkTmjJngbj4LNPg2
         5bapOuUFr/NGVOBfC+pgxFmq39Puz+MDA79sfnelrJUXXmOUAcmqXaPH0b3VA7G3kItT
         SKCUxc9TWQwi4oCCk82D3g60No8QlzaxKd7LeQru5ZHg76W+4tPLkf5e4Z7mKZX9kllc
         WQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711568614; x=1712173414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c64xHlCzEqyAPC97zuuo4cscMpx4AHNYnhUI1IMgUA=;
        b=Y+HSPUKuz3AlUiyb3/EC0/RuFpR4pPMe8jHp+8FZla15EqMHNIJSyOSe/MDvv+UZgB
         iXbw0RvYig2LnWK7HMvjeQ5PfYG1W+Xyx6/7yFks7okAcGKSZWdBNHWZSHx8W243cfG5
         dpRkPOLRhp2U2vHZrziaF3y6cM58mhdPRa/FM6M+aMLrXh3CT4xX1QfUpg7Sca5EPWfJ
         cq0dkgYnwelllYM5HxuBvVrCFXXiFEJl/Z0/3klYt2aU/9mMTGH0x7xrqvj/P8b+grcw
         ROfDjIMKuggvIdwX4YUsTDA7X+f3A9fJut/tsgQdI6+O6a7QXkBKkUUKvUZVHB4jSzyL
         HJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXqSvtP0bbxwEB+hXC++wXrQGEtVUUH2ZAZI1h1R93AKjOIIvE9nRfEVDPvffjWTRdMtgHa9+ecZspGtoc4UmbT6nwR3GXGxCLWV/Y=
X-Gm-Message-State: AOJu0YwHwWeF8Nm8sqNxJF1snIWEBUHZlFkRehKSgnw2lOjpTjIzr6yS
	6LEQ0WVaaHoMrmi7WxubJ8RjOrg9z3fCih5udpqVfVgzDGhFmEgS
X-Google-Smtp-Source: AGHT+IG9yzcV9fBkYZKDIGCOXbhoCA4Hz1gvtdCmTrhIctSfKXVoTIph0m5FtO+5obLDUuhb8mYXXA==
X-Received: by 2002:a2e:9cd8:0:b0:2d5:9bd4:4496 with SMTP id g24-20020a2e9cd8000000b002d59bd44496mr702498ljj.50.1711568613516;
        Wed, 27 Mar 2024 12:43:33 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id x1-20020a056402414100b0056c4372c161sm608546eda.55.2024.03.27.12.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:43:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org,
 =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>
Cc: Ondrej Jirman <megi@xff.cz>, kernel test robot <lkp@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Subject:
 Re: [PATCH] ASoC: sun8i-codec: Fix build with CONFIG_SND_JACK_INPUT_DEV
 disabled
Date: Wed, 27 Mar 2024 20:43:31 +0100
Message-ID: <1785985.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20240327080542.3649840-1-megi@xff.cz>
References: <20240327080542.3649840-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 27. marec 2024 ob 09:05:34 CET je Ond=C5=99ej Jirman napisal(a):
> From: Ondrej Jirman <megi@xff.cz>
>=20
> When CONFIG_SND_JACK_INPUT_DEV is disabled, struct snd_jack doesn't
> have 'type' field. We can't rely on this field being always present,
> so store the jack_type in the codec driver itself.
>=20
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403261243.kcXCPAYs-lkp@i=
ntel.com/
> ---
> This is a followup for https://lore.kernel.org/lkml/2vhd45kylttgonosdcfn7=
ugwyy2vx56gijwf3ealz4tel65iqr@cs3kxrl6d2hh/
>=20
>  sound/soc/sunxi/sun8i-codec.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 43795362fed0..b5dafb749c3f 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -232,6 +232,7 @@ struct sun8i_codec {
>  	struct delayed_work		jack_work;
>  	int				jack_irq;
>  	int				jack_status;
> +	int				jack_type;

Where is this variable set? Below I see just usage of its value.

Best regards,
Jernej

>  	int				jack_last_sample;
>  	ktime_t				jack_hbias_ready;
>  	struct mutex			jack_mutex;
> @@ -1352,7 +1353,6 @@ static void sun8i_codec_jack_work(struct work_struc=
t *work)
>  	struct sun8i_codec *scodec =3D container_of(work, struct sun8i_codec,
>  						  jack_work.work);
>  	unsigned int mdata;
> -	int type_mask =3D scodec->jack->jack->type;
>  	int type;
> =20
>  	guard(mutex)(&scodec->jack_mutex);
> @@ -1363,7 +1363,7 @@ static void sun8i_codec_jack_work(struct work_struc=
t *work)
> =20
>  		scodec->jack_last_sample =3D -1;
> =20
> -		if (type_mask & SND_JACK_MICROPHONE) {
> +		if (scodec->jack_type & SND_JACK_MICROPHONE) {
>  			/*
>  			 * If we were in disconnected state, we enable HBIAS and
>  			 * wait 600ms before reading initial HDATA value.
> @@ -1376,7 +1376,7 @@ static void sun8i_codec_jack_work(struct work_struc=
t *work)
>  			scodec->jack_status =3D SUN8I_JACK_STATUS_WAITING_HBIAS;
>  		} else {
>  			snd_soc_jack_report(scodec->jack, SND_JACK_HEADPHONE,
> -					    type_mask);
> +					    scodec->jack_type);
>  			scodec->jack_status =3D SUN8I_JACK_STATUS_CONNECTED;
>  		}
>  	} else if (scodec->jack_status =3D=3D SUN8I_JACK_STATUS_WAITING_HBIAS) {
> @@ -1417,17 +1417,17 @@ static void sun8i_codec_jack_work(struct work_str=
uct *work)
>  		if (type =3D=3D SND_JACK_HEADPHONE)
>  			sun8i_codec_set_hmic_bias(scodec, false);
> =20
> -		snd_soc_jack_report(scodec->jack, type, type_mask);
> +		snd_soc_jack_report(scodec->jack, type, scodec->jack_type);
>  		scodec->jack_status =3D SUN8I_JACK_STATUS_CONNECTED;
>  	} else if (scodec->jack_status =3D=3D SUN8I_JACK_STATUS_CONNECTED) {
>  		if (scodec->last_hmic_irq !=3D SUN8I_HMIC_STS_JACK_OUT_IRQ_ST)
>  			return;
> =20
>  		scodec->jack_status =3D SUN8I_JACK_STATUS_DISCONNECTED;
> -		if (type_mask & SND_JACK_MICROPHONE)
> +		if (scodec->jack_type & SND_JACK_MICROPHONE)
>  			sun8i_codec_set_hmic_bias(scodec, false);
> =20
> -		snd_soc_jack_report(scodec->jack, 0, type_mask);
> +		snd_soc_jack_report(scodec->jack, 0, scodec->jack_type);
>  	}
>  }
> =20
> @@ -1491,7 +1491,7 @@ static irqreturn_t sun8i_codec_jack_irq(int irq, vo=
id *dev_id)
>  		if (scodec->jack_last_sample >=3D 0 &&
>  		    scodec->jack_last_sample =3D=3D value)
>  			snd_soc_jack_report(scodec->jack, type,
> -					    scodec->jack->jack->type);
> +					    scodec->jack_type);
> =20
>  		scodec->jack_last_sample =3D value;
>  	}
>=20




