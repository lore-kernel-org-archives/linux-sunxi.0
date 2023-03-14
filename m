Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0996A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:11:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x13so19601796edd.1
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOmN2wxHAubP/wjFGXET4njJl/QO5fM/z9sdlvX83rU=;
        b=CHhAm/7O/gstpGzq7X5DDLTXks05VMX04VZtP6IfWpvHV1BPITJBPtOZQzL9SfVrOP
         K7nelNQDZ9fwxi+pliz4LX5qQ44yGJpAVVO3y+nV+piezOVBGBSSnPw47TMugdQuh8v/
         QwWK4fQmvfOfvFByvx4fsvkgJv7c+eAE027MmoJjaf7Vc6TTC6t8SrAXj7g9hoR0PiMP
         huzQ0bA05qJOPNg+B9W/Jf9ln49b41v935ouW7KI45o/owobC6yJhVdr3l7aQ3dmG+WU
         qLoun8HykJR4mPX8w0DjwMEO48xJUazKN+cDziLEzfeRO3IzlWdCZek0a5pd8zhpHenA
         afRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOmN2wxHAubP/wjFGXET4njJl/QO5fM/z9sdlvX83rU=;
        b=6S58COybRwsSNs+NPvzeOXad1FaZBCF2SZhi+hTswVcdh9F4j3lGbdumdAfSD8+CM2
         7HfV9BtQ54W25b5IBYivgwzoFivwhs2sHzUddPycOsrEGupVd8mAKAKuV7qyPEr/V5s/
         Lgts2BtDiQ72SsZNlqwMy3gQGv6MfXeqHcN68gNaMC/q8Q3djUp+sUvX6iH+9J9r4krZ
         nr1bJam1GRgfbZNdguoIj24aa9Upi2MNSwY74t6D4aDGL3m2GwW5zZ8TO98qt8XSxfBv
         108k8HmJr15w0yoOrMds3w8y7CbWMyrdqFzi/pxwIQoV4JnR34s06OxbJmhJxzfUM37n
         PrCw==
X-Gm-Message-State: AO0yUKXhO2Hj1G+ROz1tS8795I9/3j9z44GObGINAhMQY9pubR7WV+2s
	Vszd3+Mkz16xLWK1bCu1tHQ=
X-Google-Smtp-Source: AK7set+qCVKByxD7iuQXEmywLPaTa1vcwJ7G6XCqfhULVzCL/kVmJIdeJKzJeKK2tj317A2Zl/2klw==
X-Received: by 2002:a17:907:9708:b0:878:711d:9310 with SMTP id jg8-20020a170907970800b00878711d9310mr4432767ejc.1.1678824679798;
        Tue, 14 Mar 2023 13:11:19 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i16-20020a170906851000b008e8e9859905sm1540068ejx.184.2023.03.14.13.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:11:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Icenowy Zheng <uwu@icenowy.me>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 01/31] phy: allwinner: phy-sun4i-usb: Convert to platform remove
 callback returning void
Date: Tue, 14 Mar 2023 21:11:18 +0100
Message-ID: <9076995.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20230307115900.2293120-2-u.kleine-koenig@pengutronix.de>
References:
 <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
 <20230307115900.2293120-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 07. marec 2023 ob 12:58:30 CET je Uwe Kleine-K=F6nig napisal(a):
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

>  drivers/phy/allwinner/phy-sun4i-usb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> b/drivers/phy/allwinner/phy-sun4i-usb.c index fbcd7014ab43..6a74e5ce180a
> 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -698,7 +698,7 @@ static struct phy *sun4i_usb_phy_xlate(struct device
> *dev, return data->phys[args->args[0]].phy;
>  }
>=20
> -static int sun4i_usb_phy_remove(struct platform_device *pdev)
> +static void sun4i_usb_phy_remove(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct sun4i_usb_phy_data *data =3D dev_get_drvdata(dev);
> @@ -711,8 +711,6 @@ static int sun4i_usb_phy_remove(struct platform_device
> *pdev) devm_free_irq(dev, data->vbus_det_irq, data);
>=20
>  	cancel_delayed_work_sync(&data->detect);
> -
> -	return 0;
>  }
>=20
>  static const unsigned int sun4i_usb_phy0_cable[] =3D {
> @@ -1054,7 +1052,7 @@ MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
>=20
>  static struct platform_driver sun4i_usb_phy_driver =3D {
>  	.probe	=3D sun4i_usb_phy_probe,
> -	.remove	=3D sun4i_usb_phy_remove,
> +	.remove_new =3D sun4i_usb_phy_remove,
>  	.driver =3D {
>  		.of_match_table	=3D sun4i_usb_phy_of_match,
>  		.name  =3D "sun4i-usb-phy",




