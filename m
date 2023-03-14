Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E997A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:13:14 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id eg48so7713231edb.13
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfF6fwnjck3bhnls8IFYDauZUKUbRQs1EOuea+gCMoY=;
        b=FGonTE7MrEBng0ymfjw1CZ8IWnRCYQS1AtHQYa7q9i90KRfOgSTG2BPJKu4JlD1wBu
         tODSCQGSRWg4iDawk5wvG84mW5iuHP1k6ogt4zUS3EKsFCzc01Ks64JGmGNfASMrkTcA
         qfdlwVArBX8fCzBTSsbSY4IohrDfoS+ezNANqjj0GZmhBOIkSnjartU7TvASnDia0kp1
         Pbldqrhw+4XuqVyBpUeg8NHij2yXl3lScKSBIkInj5ClkC+Lee6jzDoRFhrCoOBUX4Ce
         7fjR4ugMIDSetOHcJ2ZuU2IrtyUi3ej1E6zT/DnOq9W2rGXdCCl3kklsvNkRkuTMlMkZ
         EYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfF6fwnjck3bhnls8IFYDauZUKUbRQs1EOuea+gCMoY=;
        b=QcEZR4O0v/dbVOABYlq+oVsuVf1CtYRGBFyqFCcRxEDlKD+8W0l1KUvP31qM8X8G3c
         KyrgE6lxsFKgrnPBB6Xyjjcque9tJgTEb4AHg22HqaCd25LM3hddbzEtJCFf1WLFGPOC
         iBNRBPQamwT3ZXPKZ0z1YkBw3XUC0I7LJimXscPgcU+CyULMjlmu5kntvtabIuls80xb
         3865OLwKfptiP6DDMhvLjX/U9+aMRHmOxToQ4Ya8KL+utRdEtDARrFkn18ip2tL+eHA4
         9y8J7dIicARxfOcQR/Rbrt3hIJUHf2HvyVnrx1wX+ht8LYGW6zvPW+fOhLHR3BxRv6Gg
         CcXg==
X-Gm-Message-State: AO0yUKW7xFFeKrg3PStz/XBDC2c2uHE8vK/hxvON9LZm+t0cLmrZhE80
	i/C+EGMB3pryrt+bXMh3iAg=
X-Google-Smtp-Source: AK7set8XuSrK8wcL8DFD17yUF75lwZLc+CDnrELGJXtkqu0YMqyHM3+YxMpDRgST+fx1qcmnGAP5AA==
X-Received: by 2002:a17:906:380d:b0:878:54e3:e3e1 with SMTP id v13-20020a170906380d00b0087854e3e3e1mr3520090ejc.73.1678824792668;
        Tue, 14 Mar 2023 13:13:12 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id c11-20020a50d64b000000b004fa19f5ba99sm1507227edj.79.2023.03.14.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:13:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 25/30] pwm: sun4i: Convert to platform remove callback returning
 void
Date: Tue, 14 Mar 2023 21:13:11 +0100
Message-ID: <3407592.QJadu78ljV@jernej-laptop>
In-Reply-To: <20230303185445.2112695-26-u.kleine-koenig@pengutronix.de>
References:
 <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
 <20230303185445.2112695-26-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 03. marec 2023 ob 19:54:40 CET je Uwe Kleine-K=F6nig napisal(a):
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
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/pwm/pwm-sun4i.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index b973da73e9ab..a8790a8fc53e 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -477,7 +477,7 @@ static int sun4i_pwm_probe(struct platform_device *pd=
ev)
> return ret;
>  }
>=20
> -static int sun4i_pwm_remove(struct platform_device *pdev)
> +static void sun4i_pwm_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_pwm_chip *sun4ichip =3D platform_get_drvdata(pdev);
>=20
> @@ -485,8 +485,6 @@ static int sun4i_pwm_remove(struct platform_device
> *pdev)
>=20
>  	clk_disable_unprepare(sun4ichip->bus_clk);
>  	reset_control_assert(sun4ichip->rst);
> -
> -	return 0;
>  }
>=20
>  static struct platform_driver sun4i_pwm_driver =3D {
> @@ -495,7 +493,7 @@ static struct platform_driver sun4i_pwm_driver =3D {
>  		.of_match_table =3D sun4i_pwm_dt_ids,
>  	},
>  	.probe =3D sun4i_pwm_probe,
> -	.remove =3D sun4i_pwm_remove,
> +	.remove_new =3D sun4i_pwm_remove,
>  };
>  module_platform_driver(sun4i_pwm_driver);




