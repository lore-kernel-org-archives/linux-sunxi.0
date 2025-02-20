Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5C1DDC3B
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740083253; cv=none; b=O2JLA4iC5w2v9s9QEOuaswtsr81wfmYxwoJZ84YV8CKfYjmVTRwvtXImpKfePwHlmD625VOWrr8GX0DBZrS5W7l7P0aKtvw21ijzDHFzDUYy97djbPtyrdbn6cG88z/1HTuRQujGxM2HlXmkWVckNZUWsuBA1HRM0dPZbtQletA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740083253; c=relaxed/simple;
	bh=ZZYRX1szbwqrHQhPPSjkDoX0HCeTh2Z5cpehiI9E+hE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ar+eS32BD4x3G0ySMAeyCw5bQ7HAoGu+R5AfsFy1N3IYgTGhdE/DDQ2tuWAzp7hi/Cj178+kQbo14cFugnwocYbnZ1QG0RpfUySpvqSHKTDIASHV5bLbPjvhvAev8jSjz1AcncyNVKu4CZ0hQGZ/7SvRjgqovONS7Wv6b8ZULDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbdlFBn7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbdlFBn7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43995b907cfso8956515e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740083249; x=1740688049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtfmfrXV4Fenqpt6KK3zaAtg3JmCzHplb9SYG8vsTp0=;
        b=TbdlFBn7yruK7Ip8h9p3qSjKwkClnXCNTeWk6CmOOAW4MhTuL3jgudqSxGd544syus
         1ARbll8dMV3qZvoFtqPQAgH1sWBC6ST3RpDdiMmzndHqDyIoPni8oLVJ0yGCEoOvLmZI
         VZNzUAsFrl1Rz4IJm7sfuNdk1OAnW62ZMBm5XvHgVr5pz0qikG6lEcvSZR2PW8QMH75F
         vL6JdXfuhsPN/hYTJHtozdVPgFc7UjvmNIhvk1aN095YzsUoZDHsaV4m9RHll55Uq/aO
         zhucWsS32Dc7m6iizsPO+QIfJb5sljUqJwZIZy3sotlEQzT4GAZoa7ZGUqYcVtBGvkS0
         SA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740083249; x=1740688049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtfmfrXV4Fenqpt6KK3zaAtg3JmCzHplb9SYG8vsTp0=;
        b=MvqrQSX6refP7v2bs4V0021J4YicGj2NaztB1ycWpqMT6PjddUIprBd/Dmq8eX4YG2
         /Z64RN1WiEFEocuMq/yybcli9NTiHp0IwTbQHNRPKesmxg+kElWLUYSCobgFmEq4/J8H
         YvW39K1iVHDml5vIh7st0yMfWUki01rImTyY8nBY7TzQalMFCczdXraDuNCdXtyWPeLZ
         mlphZdsi4/5SfzltzxTjQzVS6h+59EG+kg0coKRQ8yyuHf5aNBpTsYUoyaEyGl7MkCD/
         Xl6gQ5Cl08YAYzibzHvzct56klIWsHFFOublAs+vV8OSun52OK39nOM7lWojiZr4AOZc
         DpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwsiJhNmnoJT2JFFnx1KCLSAe7ihgyXDGRwzeOU9mYUpdW5nm4HDg9xozsey0Oo14C8PUmEtXtVHQHqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKtW0u971VENjCXyCjsM1jOJ44jXWYUb4kc6QmIh9+3WTI1nbl
	PiSfdc7aw/0GGxZk7cCz/hjKyIWWc+EG2QQtYWAQh8MKTLneop86
X-Gm-Gg: ASbGncsuJSTnPxDuztYNl9k7BKMUlGy1kM2jt/DyPHb2Ke9+2ycSdInwmXKieNsx0cQ
	rAgJPYUuM9NJ8fLYqHFxC1kmxDP2JJlaouYZDNcjVnJ2qeTYRZpLJHechVkzmQp9/yNhahvtCNM
	sxy86Z1UsI43DsQv12vNz40soEjWe3cbQLBcNY9LWHr+zTm/u6vtcjCcyJIsCHp09QCj6tgklFX
	XYOnM1ZYpcfbzaPXgBwWy+CHllSiNLQJa3dK1HjNl3RX9+q6lDVij9yN7RypH80QXln+xFQ6O2V
	E783Z5iLLX9bsJK93eIbT281DGeNFl4CghCOuK6JzMj7RvEIsBYw7Tt5a18VW6MO0nA=
X-Google-Smtp-Source: AGHT+IECii+tVv+IZA8Kwcb9HLreQ7WkQqdHkR9yh3R3Vri6Dsiv8yRmWFnRoRF5/CwPCmIDOfBbOQ==
X-Received: by 2002:a05:600c:3b93:b0:439:96b2:e9b with SMTP id 5b1f17b1804b1-439ae1e6a3amr4585785e9.9.1740083249349;
        Thu, 20 Feb 2025 12:27:29 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b824dsm250156575e9.34.2025.02.20.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 12:27:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Philippe Simons <simons.philippe@gmail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH 1/3] phy: don't let controllers change vbus reg
Date: Thu, 20 Feb 2025 21:27:27 +0100
Message-ID: <2261426.ZfL8zNpBrT@jernej-laptop>
In-Reply-To: <20250118102207.9339-1-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 18. januar 2025 ob 11:22:04 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> Allwinners SoCs share phy0 between the MUSB controller and HCI controller.
> If we let these controllers independently power on the vbus on that phy,
> peripheral mode is dangerous because HCI never power down the phy, result=
ing
> in 5v being applied against the host 5v.
>=20
> Override power_on/off for phy0 in that case, and let regulator be enabled=
/disabled
> based on id_det only.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>

Is this fix for some observed issue? If so, Fixes tag would be appropriate.

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index b0f19e950..24fbabe7a 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -465,6 +465,10 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
>  	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
>  	int ret;
> =20
> +	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state =
*/
> +	if (phy->index =3D=3D 0 && data->cfg->phy0_dual_route)
> +		return 0;
> +
>  	if (!phy->vbus || phy->regulator_on)
>  		return 0;
> =20
> @@ -493,6 +497,10 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
>  	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
>  	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
> =20
> +	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state =
*/
> +	if (phy->index =3D=3D 0 && data->cfg->phy0_dual_route)
> +		return 0;
> +
>  	if (!phy->vbus || !phy->regulator_on)
>  		return 0;
> =20
> @@ -573,9 +581,21 @@ static void sun4i_usb_phy0_reroute(struct sun4i_usb_=
phy_data *data, int id_det)
>  	if (id_det =3D=3D 0) {
>  		/* Host mode. Route phy0 to EHCI/OHCI */
>  		regval &=3D ~OTGCTL_ROUTE_MUSB;
> +
> +		/* Enable VBUS reg */
> +		if (phy->vbus && !phy->regulator_on) {

I don't see any "phy" variable in this function. Also, you should add same
protection as it is implemented in sun4i_usb_phy_power_on(). Skip enabling
regulator if:

sun4i_usb_phy0_have_vbus_det(data) && data->vbus_det

> +			regulator_enable(phy->vbus);
> +			phy->regulator_on =3D true;
> +		}
>  	} else {
>  		/* Peripheral mode. Route phy0 to MUSB */
>  		regval |=3D OTGCTL_ROUTE_MUSB;
> +	=09
> +		/* Disable VBUS reg */
> +		if (phy->vbus && phy->regulator_on) {
> +			regulator_disable(phy->vbus);
> +			phy->regulator_on =3D false;
> +		}
>  	}
>  	writel(regval, data->base + REG_PHY_OTGCTL);
>  }
> @@ -603,6 +623,12 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct w=
ork_struct *work)
>  		return;
>  	}
> =20
> +	/* Disable internal VBUS reg if there is an external VBUS */
> +	if (vbus_det !=3D 0 && phy->vbus && phy->regulator_on) {

Ideally, this should never happen.

Best regards,
Jernej

> +		regulator_disable(phy->vbus);
> +		phy->regulator_on =3D false;
> +	}
> +
>  	force_session_end =3D data->force_session_end;
>  	data->force_session_end =3D false;
> =20
>=20




