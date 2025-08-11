Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A532E0404
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927420; cv=none; b=Sg49/sTBtpC1ylB8UuSXZ3JM+7bNB8uY4eg5sxemrXMMiPmwCbEt//3qrdBbAF2Oom7DvUj9Pqm7jMjKmnbMHxw6XPg7DYp+yKI1grHShwy2QlqFUEJ+qZZPTc2ZdnjTBGiPn7Di7GoFfYr3DGlVFEMfncycwN3k28u3JpD8ziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927420; c=relaxed/simple;
	bh=kbJyv0B6NVEAhVvNXsVyLFKYDO9hiEb86bpFixFWkJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9Qwjc5vhA+k23rXysIsQM9eUZEmc7C3OUoHzh5VbZf73YOnI/H+cEQeyDIBgYmzpSn0Ax1WrAcEvaBm9IRgz/c4J9JRX2pWchG8qRN41c3vFZgJOeXqbhqUJ3vfjapxGANCDA/mLy+2TEEFBh3CCv4oqtf2jA5eLMUVTE/NNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caku9SVi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caku9SVi"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-458bece40fcso23375685e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 08:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927417; x=1755532217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtrRo/BoZTjiMTe6FzxhDKNMcjGGd7QmGBrzBr4Ji/c=;
        b=caku9SViDZ3s1j3N6OvnmgBZKTW82SloOEPJFs/izSUiZM7B8A83yTY2BKAKbjFQwM
         hzkgJmGLBtupczG0EZKNB6ZlQT8H6IAcdiw25oUJTjl0fntqQ3joH4ETaXnDHIjc2yt2
         f5yEqdmWe/cCYfKsm9dXS1qQzVJvbWzx6qnqoRAee+nL3nPm0vS+xDznxS6FqMTor9Tn
         iWtorvcRpsB+c5T9ddM7X1hr7nKAc45gsOvA18PbmroZ1G8cKCjkBMSjx9QTZNPTzCjZ
         rU41KHj0leMlMi1IyitGBDtBTT5nTvdNuYBxTKGLS8WIejQYQM/g+aQWl8Ur4puBzFaz
         pNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927417; x=1755532217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtrRo/BoZTjiMTe6FzxhDKNMcjGGd7QmGBrzBr4Ji/c=;
        b=R8LUCuzg1U2ccpEvF6BiDFj62oYVSniY6RpLYwmf+VvXmKuuRe2HGZU44H14jvR5Za
         bVj1sl/eeSc9HWi4X5TN7AMfnKMldzG3q1RpUnjVg7Bd5xoLWELq3gS/RQaL91Q+K77T
         735RqJmAmxgG639l3Mpk3pUnoEQeT5ibrrDvtMUC/IAvPmE9oQjnfA+H1NCB5QP3BIuj
         76BTyUkJ+fs3mACGBAKEJzeOxJIH3kwavds5HLL78MHIrP2JtReaO8gexPstO+xa9Xlc
         SKW/mLVTvGCfBrz5qY3xnrez4+M1AHm+8yEZHG+p0lmG0ojFmTLgyUlRhXgFHsZAEvWS
         nc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjAKPBlkGFRQd9UAT0rgg73tXxEV5sqYlvyOFBpKtTt9xModvxFh57fExvhbdhJh3C5hxk3NblHX7QgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yztn0+ZsLnhWMgwcBzOVS4AK4nLaPj0yR/n9aX9TnrIGtxv/bO9
	j9IfsVkNQ7wtCjVhqe9/gvbRs579K7M1SN+CjesOUS6x2nAlqkd0Huv7
X-Gm-Gg: ASbGnct3WFYtAdBE+kNDemHTgIZ5mV3laG7Xqk3/R9asKlfHgbSsGISp4gZDraICe9P
	F9ePLs1lG91P6ipnHjTk+JvZ7fT5PBW7IBXYtm4n9Cyr4oXSf1/U+ie9y43eezmfIzEWagg4ZJ7
	R+wlgpzdaneHVHGDMRQ/J119KadpsZ/1kX1hArVs/J0llqVx3Y5l3I9zH4Z2KKTVWaAgwHfKzqC
	XaTqkQoJ34WyfDHJzc69jS63RVTiDFVHV7t84Lt8aRdYnPR/nGtcDnLiva5lNxJUzIHiyI9EuXj
	/ZClUYmlYwNK2+IOuu4zDuqFlObqB1sdR0e2FDA0gUDIh2dPCl7sRxjPM1r2uMoHsVwyw3ZMcnW
	Ijr6hAlnC+jhb74hcorAwlxxFp4fKHmgfTkK5jRZjurh1RRiVtWLqM5GbmHlxGHC56et3CubPMQ
	==
X-Google-Smtp-Source: AGHT+IEqB1JFwUX9cVNAnqFzk+sbTvY4gcXyBKYE+G4Qk92GyC51DD6X4AW+l3WYQ6CaGg9sEVywbA==
X-Received: by 2002:a05:600c:1c27:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45a10bb6cb7mr2592555e9.15.1754927416860;
        Mon, 11 Aug 2025 08:50:16 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4beasm39949541f8f.30.2025.08.11.08.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:50:16 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, linux-sunxi@lists.linux.dev,
 Mikhail Kalashnikov <iuncuim@gmail.com>, Yixun Lan <dlan@gentoo.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject:
 Re: [PATCH 1/2] pinctrl: sunxi: a523: change Ethernet pin function name
Date: Mon, 11 Aug 2025 17:50:15 +0200
Message-ID: <3642499.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20250801002726.8924-2-andre.przywara@arm.com>
References:
 <20250801002726.8924-1-andre.przywara@arm.com>
 <20250801002726.8924-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 1. avgust 2025 ob 02:27:25 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> The name of the pin function was changed last minute in the DT, from
> emac0 to gmac0.
> Adjust the name we use in the pinctrl driver accordingly.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 03cfe23aaf8..fd357ab0d4e 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -760,7 +760,7 @@ static const struct sunxi_pinctrl_desc __maybe_unused=
 sun50i_h616_pinctrl_desc =3D
>  };
> =20
>  static const struct sunxi_pinctrl_function sun55i_a523_pinctrl_functions=
[] =3D {
> -	{ "emac0",	5 },	/* PI0-PI16 */
> +	{ "gmac0",	5 },	/* PI0-PI16 */
>  	{ "gpio_in",	0 },
>  	{ "gpio_out",	1 },
>  	{ "mmc0",	2 },	/* PF0-PF5 */
>=20




