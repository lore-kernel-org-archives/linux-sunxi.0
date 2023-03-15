Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556B53AB
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 16:04:42 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w9so6715950edc.3
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTxHDgaVdAlRa2VNlay45Oqnyvz/HhDbjYf8cb4/2Tk=;
        b=azeJduTbNEMY6CR9BFCqeeLgBLexitLByxnpnV13tmgavA7XljemiuRLuaIrb2J2X+
         aVS6uT6F5i6q9yg0tLIp3fPqCab/6eksH76OTBxdlDIo9uS4GWPUntxi1U4F1f4eBzx/
         G6uSdBpQMBZ82s46c/mOZItV+HP1Box//P9ivizUhQgyeOsrst4nBAABEaa7riNWf6De
         pYNeVuIqX14OWaaW75erkaNMwx3MoRdLxY5z8eXws2ykS0kRtVPUSlzS5upy7NlT/muS
         XrP6BQeONHuCWpzvbijbCUtTjdZGJJyE27VGIxwYyw/JE4tAQKMtZh6BqRattktMQ8oa
         io1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTxHDgaVdAlRa2VNlay45Oqnyvz/HhDbjYf8cb4/2Tk=;
        b=crQ6eD8cGZ5JgNnKvPhuovYo7EwzyHlkucHKMym0tdeL8xSSHZJwmw2nlOqRM8Rkcj
         3nQLNcKz7voXr5WYxpb8L1AAQ+TMmc2zT6gerUrKcxt8FCtbG0dpljzOlKsijJeHnlgf
         eLXOYLkME8cTZQ8a0UZ4wOxLaBd0k9xkJ3gBm+RZrkswvcU/sPtsN8ItKdUaGW67LN15
         I3md0/gyhED4MZ15xxxTJMm+XaMuk53k6CBtcIpLFb+RM43BjYFT7waVIcBxwsON9aaW
         1vYnZ7QFvQBtMQSzy8nhh9xSm9Dj2jGmD57tb1u3sAkj2hH2aU1ZEw791Ea7Z6CcyPyu
         UJ4A==
X-Gm-Message-State: AO0yUKUdcpEyxe93bqv+hkEPTMLOdUzaLGf3hvPrdNatxtVODLlnhgMf
	A4Fc63Z/of3tP/9ptDoqYo0=
X-Google-Smtp-Source: AK7set9exElF6sSx9RJmJhi/SicijsfPgz32u15q4hOmHY8b4Mo6bccbZ6ceF0L7H/PW+5M7ydAmxQ==
X-Received: by 2002:a05:6402:1b07:b0:4af:6e95:861b with SMTP id by7-20020a0564021b0700b004af6e95861bmr3215998edb.2.1678896281005;
        Wed, 15 Mar 2023 09:04:41 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id l9-20020a50d6c9000000b004fc649481basm2672529edj.58.2023.03.15.09.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:04:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 141/173] ASoC: sunxi: sun4i-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:04:38 +0100
Message-ID: <2100888.OBFZWjSADL@jernej-laptop>
In-Reply-To: <20230315150745.67084-142-u.kleine-koenig@pengutronix.de>
References:
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-142-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 15. marec 2023 ob 16:07:13 CET je Uwe Kleine-K=F6nig napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-i2s.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 6028871825ba..669d712bbe9f 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1606,7 +1606,7 @@ static int sun4i_i2s_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_i2s_remove(struct platform_device *pdev)
> +static void sun4i_i2s_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_i2s *i2s =3D dev_get_drvdata(&pdev->dev);
>=20
> @@ -1616,8 +1616,6 @@ static int sun4i_i2s_remove(struct platform_device
> *pdev)
>=20
>  	if (!IS_ERR(i2s->rst))
>  		reset_control_assert(i2s->rst);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_i2s_match[] =3D {
> @@ -1660,7 +1658,7 @@ static const struct dev_pm_ops sun4i_i2s_pm_ops =3D=
 {
>=20
>  static struct platform_driver sun4i_i2s_driver =3D {
>  	.probe	=3D sun4i_i2s_probe,
> -	.remove	=3D sun4i_i2s_remove,
> +	.remove_new =3D sun4i_i2s_remove,
>  	.driver	=3D {
>  		.name		=3D "sun4i-i2s",
>  		.of_match_table	=3D sun4i_i2s_match,




