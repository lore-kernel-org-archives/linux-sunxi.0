Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDE37171
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 17:22:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a21b6d105cso746373066b.3
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695144125; x=1695748925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9KCoHYlrD8PBCS/9p9Xtjaer8cxRzRUbZnHNFMvu9U=;
        b=iDkAhaPhmQsqC4U6AQVcYbPkqYdyXRRsQsHeBWV0/ZUS5J+EEtgD4yyMhu772W7FJP
         6XRU4vTj3WO4Iw7+VW0S8sQLWuHaWJGV23ffxFONFrX+grb6ECdBRsi4WWL5gQaeb0PZ
         zwEgAP99g3Pjdj7kyBhQcQi37JNcDWYNAPJXJaJzoIlsjKMekSC0K17VabfQ/FwpiXbl
         xA+4PbAVb4aTxjKfyHIg9Xb+OyCZOtAlLCMQxGvrSLyZhqMW3shVhDmoxwxCztiKI5Ja
         o8wyagj+vbcSGov7AqjucFP1Hewl/9a2lzmkpjid1lFKG9iiVfqqE4fBhSAO4TEXYnQp
         EigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144125; x=1695748925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9KCoHYlrD8PBCS/9p9Xtjaer8cxRzRUbZnHNFMvu9U=;
        b=HvFzzmYlBoyPIbYL/AmekYQIa3DPg4s2H5aivXD7V7OxfpJBKpIGhgeuePvgv/cJ4y
         ALlM6A4bhOPT+QnoTASg2D0+lymFN668qgnwSi3T+ELy/FyacK7xX8riJIkGSdD2ps+T
         BxSNZreloz4VwndqNoS4eAvnk5BK/XIIiINHnu51MENB/sKDTw//bV2lXwjoD8WU79no
         DeioG5bVpIzVtQYeFrrH3TERmFYagQTd0ZrH2U0nKi6MEwNECJ9z5kLEV7tuET0n+925
         fqJlmHvPV3V6n5KUKYzwHhdtJiecSvfKTWntJEXYJhi7+C4o+XXctqNg/vlA0ZEgJDJ7
         Zxag==
X-Gm-Message-State: AOJu0Ywil5r4Th2iAbRuvffvTt7hthmjBtWfC/I99FWi6FZD9SvL+YUf
	H5tCXRlATmPdK1aaVDR3KQ3RoqWIgl1+og==
X-Google-Smtp-Source: AGHT+IHHr2iqkML01TMfqpkarox1Q/kZnuOFnlxS2seZbLI5P48153e7+p997Xn/FXR+PMgsoy/vHQ==
X-Received: by 2002:a17:906:1092:b0:9a2:295a:9bbb with SMTP id u18-20020a170906109200b009a2295a9bbbmr52892eju.25.1695144124887;
        Tue, 19 Sep 2023 10:22:04 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id w26-20020a17090633da00b00988be3c1d87sm7947280eja.116.2023.09.19.10.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 10:22:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 46/59] dma: sun6i-dma: Convert to platform remove callback
 returning void
Date: Tue, 19 Sep 2023 19:22:03 +0200
Message-ID: <13354858.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230919133207.1400430-47-u.kleine-koenig@pengutronix.de>
References:
 <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-47-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 19. september 2023 ob 15:31:54 CEST je Uwe Kleine-K=F6nig napisa=
l(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/dma/sun6i-dma.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 2469efddf540..583bf49031cf 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -1470,7 +1470,7 @@ static int sun6i_dma_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun6i_dma_remove(struct platform_device *pdev)
> +static void sun6i_dma_remove(struct platform_device *pdev)
>  {
>  	struct sun6i_dma_dev *sdc =3D platform_get_drvdata(pdev);
>=20
> @@ -1484,13 +1484,11 @@ static int sun6i_dma_remove(struct platform_device
> *pdev) reset_control_assert(sdc->rstc);
>=20
>  	sun6i_dma_free(sdc);
> -
> -	return 0;
>  }
>=20
>  static struct platform_driver sun6i_dma_driver =3D {
>  	.probe		=3D sun6i_dma_probe,
> -	.remove		=3D sun6i_dma_remove,
> +	.remove_new	=3D sun6i_dma_remove,
>  	.driver =3D {
>  		.name		=3D "sun6i-dma",
>  		.of_match_table	=3D sun6i_dma_match,




