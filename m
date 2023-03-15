Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9090B53AB
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 16:04:23 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h8so33713200ede.8
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn0w3t08AxgUFgbBz/0VL9DhPFjtB6IrsFayVvSEfCE=;
        b=V+XG+Dx4c7L4AZOeVkQ3DF4PJxyEUaJ4JI0/QFNxpYfbfAjn1G0NG9DvlZbgPiyPSK
         TKFfrYt8VwDIX97KwNoJD7uZlt24RIlFyR7x2PE9SQxBzcZcHOYqP7Bpxn+kGe++3/eu
         ki9APm7B+IHY9l3CGl3TJUmDjCjtumiD+agkJ5PbxUM4EezMx7PS9mYbdWMuegdTD14X
         bHW4ITfV6GOnvn1hJk+SeoQS+ORF4QJze3LcPgWQYbqRLcp5nA0kj/NPrFJVo0m8j+HB
         IRbQRBPJB5htw1xhSm+5l8uU3lNwiiPlL7ILHSxoTs4Bogzp3WxL9Vj4ZxuCo4Qe9NfA
         ToKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn0w3t08AxgUFgbBz/0VL9DhPFjtB6IrsFayVvSEfCE=;
        b=hY01RaDxQYGunjju0s8pPqOh2JQUDmn3mKo3dyJDLQ7IAM4FaINzGwMZ46yXBwr6iW
         k8TUz07vQ68fDK5fGp7eexjekhrDvKX+BgOCtt5Ti5RGCtMb1b1V2QonyD6JOpHxOWgv
         IJELh5i717WUPwej45EPP1zhxzcr2cNCeapBWel3xL4mJOB/yKstyhC3q0T7vZmJlexv
         n0J/rmW9N6yE5KgnJwftlEkSvO4Pl0AdXV7w1EYSMudH5F/IEPf133+6yaVPcQyrUYWW
         wy0FnlDgSUksLZTQN5HHhr2Ze9MxZE02DzNhGgpn6WqY3+1TRKeQKtudmCvYtMk2v9jw
         YFwQ==
X-Gm-Message-State: AO0yUKWcqCk8shqLruzQfsnhfNhWUi1CALdZByfnAk3oPlT+9lL/Ng5l
	kvunI6GHdEJQyc16eqlawr4=
X-Google-Smtp-Source: AK7set8bqQSQclpYXN1O4ZXhg6LspXdmsJjgsY7sBOpVihYNP7lQUf0mcRKvw872oUIGEXBbaM/qYw==
X-Received: by 2002:a17:906:518:b0:88f:8a5:b4cd with SMTP id j24-20020a170906051800b0088f08a5b4cdmr7808720eja.1.1678896261531;
        Wed, 15 Mar 2023 09:04:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id qq11-20020a17090720cb00b008c6c47f59c1sm2726532ejb.48.2023.03.15.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:04:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Li Chen <lchen@ambarella.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 140/173] ASoC: sunxi: sun4i-codec: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:04:18 +0100
Message-ID: <5349071.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20230315150745.67084-141-u.kleine-koenig@pengutronix.de>
References:
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-141-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 15. marec 2023 ob 16:07:12 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun4i-codec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 835dc3404367..55328850aef5 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1821,7 +1821,7 @@ static int sun4i_codec_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_codec_remove(struct platform_device *pdev)
> +static void sun4i_codec_remove(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card =3D platform_get_drvdata(pdev);
>  	struct sun4i_codec *scodec =3D snd_soc_card_get_drvdata(card);
> @@ -1830,8 +1830,6 @@ static int sun4i_codec_remove(struct platform_device
> *pdev) if (scodec->rst)
>  		reset_control_assert(scodec->rst);
>  	clk_disable_unprepare(scodec->clk_apb);
> -
> -	return 0;
>  }
>=20
>  static struct platform_driver sun4i_codec_driver =3D {
> @@ -1840,7 +1838,7 @@ static struct platform_driver sun4i_codec_driver =
=3D {
>  		.of_match_table =3D sun4i_codec_of_match,
>  	},
>  	.probe =3D sun4i_codec_probe,
> -	.remove =3D sun4i_codec_remove,
> +	.remove_new =3D sun4i_codec_remove,
>  };
>  module_platform_driver(sun4i_codec_driver);




