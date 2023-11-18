Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523AD27D
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cku8y497"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-543923af573so4526124a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 13:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700344272; x=1700949072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Sxr/0cg0TxZRHR6aK8VgbLOF1wZHnjhGaQVl3ixHFI=;
        b=cku8y497SgIOwIPrIgu9tt3jWUeIDBzI6xQC5K+DEWto/RE8/vI7QQAgepHDR3M02G
         z+9uq9ZoSeqwhvG0P9NsrqH9kF3hPGpAOkQYPIYgA6r/EZ/3//v6Lab4F2OcY+u07f/d
         AhSoxLrL6dsMFp3fARt/mcYXKfr5KhmNX0mU7H9hOaarhV4t94BRwB+Br5Z9ZvER7Jag
         qf3NgGXLznCaEiIHOP7pAH8asdc9MYZYtjAr9cBbKbhr7g3MaEue18crQj6W7k88lCrJ
         Nj1m/FxVKY44/2UIyXK0zBBs18pM/X6OwIIdIc3W3isFy+pcdRRGk8tZT+zh+R7QLzBT
         bDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700344272; x=1700949072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Sxr/0cg0TxZRHR6aK8VgbLOF1wZHnjhGaQVl3ixHFI=;
        b=oZSjqOUWs9D/2MySHCKdkhb2zL7kchyWFpW3d7IWXYDTu81/m2bOPtanl+pwKqObml
         aVPjd4KHRWz3iryeVS0ruKiq/rueQKgGkmRf94oY/POUhJseLWcY9+sRiQmOxrmKc3oN
         BT9yEQnAuAnEtPMnIdoPGYLXr6T+J5lkTO8o0owzTQ4xj44HbEs+sdxrU4vN/b0r0lGM
         tkOqIZZ+z9l8mQiRQYMs+16ewP/Xct0hDpMglPqhOFxTSKw1VAZn7AYwhibYiIJ0eD6D
         CS6tzpu5w/nWnPnUCtwDAwHBSHsXJOvn1DOgLG+U5LL2YJnYPIpXECPEaq+SvnTGJYl9
         zvwg==
X-Gm-Message-State: AOJu0YzkTX7f+fHs6nljAKk9nmoPKdZpLNxhs9I/Yp2I6KrMFupkQN0s
	NXyjGc2AJCRttvsWkP+q7Xc=
X-Google-Smtp-Source: AGHT+IFBW03ms2SVzWJ0idpdO5YHqO6UUeWsYN0Xb97W07gJzbyMEt21UBvSnXPxGvaMVI6VuPps7Q==
X-Received: by 2002:aa7:c490:0:b0:541:2476:d23e with SMTP id m16-20020aa7c490000000b005412476d23emr2622831edq.28.1700344272439;
        Sat, 18 Nov 2023 13:51:12 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id s16-20020aa7cb10000000b00544f8271b5fsm2012886edt.8.2023.11.18.13.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 13:51:12 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Rob Herring <robh@kernel.org>,
 Yangtao Li <frank.li@vivo.com>, Yuan Can <yuancan@huawei.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject:
 Re: [PATCH 07/12] bus: sunxi-rsb: Convert to platform remove callback
 returning void
Date: Sat, 18 Nov 2023 22:51:10 +0100
Message-ID: <4874510.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20231109202830.4124591-8-u.kleine-koenig@pengutronix.de>
References:
 <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
 <20231109202830.4124591-8-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 09. november 2023 ob 21:28:37 CET je Uwe Kleine-K=C3=B6ni=
g napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/bus/sunxi-rsb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index db0ed4e5d315..fd3e9d82340a 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -817,15 +817,13 @@ static int sunxi_rsb_probe(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> -static int sunxi_rsb_remove(struct platform_device *pdev)
> +static void sunxi_rsb_remove(struct platform_device *pdev)
>  {
>  	struct sunxi_rsb *rsb =3D platform_get_drvdata(pdev);
> =20
>  	device_for_each_child(rsb->dev, NULL, sunxi_rsb_remove_devices);
>  	pm_runtime_disable(&pdev->dev);
>  	sunxi_rsb_hw_exit(rsb);
> -
> -	return 0;
>  }
> =20
>  static const struct dev_pm_ops sunxi_rsb_dev_pm_ops =3D {
> @@ -842,7 +840,7 @@ MODULE_DEVICE_TABLE(of, sunxi_rsb_of_match_table);
> =20
>  static struct platform_driver sunxi_rsb_driver =3D {
>  	.probe =3D sunxi_rsb_probe,
> -	.remove	=3D sunxi_rsb_remove,
> +	.remove_new =3D sunxi_rsb_remove,
>  	.driver	=3D {
>  		.name =3D RSB_CTRL_NAME,
>  		.of_match_table =3D sunxi_rsb_of_match_table,
>=20




