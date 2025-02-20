Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9CF1E9B29
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740083608; cv=none; b=LYdSrEB3JD3QwuH08Ki03gI8t35ZUVyf2EX67ZhZh0ZlBp2uCGNdOWxOjw8p1CZ50CuutqVsa4+n0qMKUKKN0vUcnJaUHvX5OA1oYZLW0cLjQ0Q+8v2OmewQva6KQr8KdPZn0APR8frZZgqPj4qhXe5vfLBrVuGaGRlYpjCBKSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740083608; c=relaxed/simple;
	bh=4lTYQPnj1G0KIZ75wuzMVgktOAM+fH5Z7qXuzrTrHRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMXe1Dma+aOXm6dHRDcv/noNcd5LJ6UhvIlTp44qgyNgLXAZ6YfqK4WwACwMW9iXZophO2NdAZMjtu9sQhK0NgWpWD2nkiOcocRo2LLe9w2zbpfPZBQvZ8E7rJzcgDzB4A/KysEoLZaGYrw/DLPL3HBuciIJK6FOIHIrcsIKQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmmebIrF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmmebIrF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso1202043f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 12:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740083605; x=1740688405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUxRiLX4DyVPlrMacNkPsStsx8cpP9d0LZJXAgp6S6A=;
        b=PmmebIrFBCBvmkOQ+LpPpg3Gzx+GxphAShGBclriQQoYWaYe3uelqH9jY2ciqxOWzs
         j94n+Mb0DPWv8Z+q9s4uieKRRHu0QSdZvbIoSMpc6zrSeCBOsoj4zd6NhdsC1hvV4KKa
         2bzRXW+5hY2OwuE14XrM85yP6KYcrhBZlZundRH8cQYIazZ1pyn2vxRiQc3KL8vMAnb+
         BADRJ3ETeMEr8SuXb7dnrdg86Rc7Nfnr54y+jQPAoguqCKKApRpxEuNhPJmfdcTg8VBY
         r701pSLMcJO2fP5onZFm/CeCgKkFRdSj0pPqgrdILKZUYHkzN8Q3CyRh4n80GBhFsIFv
         5Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740083605; x=1740688405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUxRiLX4DyVPlrMacNkPsStsx8cpP9d0LZJXAgp6S6A=;
        b=PSa2LB9voS5uwstj2wFZa4rLgcMJ6NkVXbzQ9zgy/RkEQxQXqWDx2sWdj59Si2keqD
         b9wbKUVZ1jOpucFD1C+Sv7EjQ8F5GHfd84BCHTxfbUS5L19z9vrgAajKIOwJTdo1qeiJ
         cr5BmboizAVkoiZQkt+3OLiA8uFe/C4raMgyAeOpC6DhVF98HPs4u9CmYDqj2K9lmzwN
         VyIjjxbV1QGiH7Su7Oz8f1IR4672pZOVGwat2OM0tib4N1Z+dtenXefgdqNZLYtanh19
         5nRnt/fagBCgWUE4DxJokZbZRhkgsYMocTblqLzmiLjctux9hkDwe6Bbs3H7M5NCsZOM
         ehhA==
X-Forwarded-Encrypted: i=1; AJvYcCUrcNBCEG3s1eoK6+J+6I5e274XxHerUcwGq8Ak40Z6/V3an92aPidWId8JtWtYwhg6+FfaUzu+h039eg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywez2wFf0iL83VVb/mmvIc3qUu60LcKHSrjP1U/KZiIWoHxAhhy
	9RzJNxODEbFHk7d/D9MS7KdnxAXNj/ExPQg4xXqTol9LOmFk3nFj
X-Gm-Gg: ASbGncucZQYYJIuw2eLasErsbU+Xqal8hwUZQBMda/M5BB6uMhQrEpe5hJ2IejsP/RC
	KDcMznXaBjW6x0uICKx/xXlfoeYrSN89PtAsATCM2riMS+Swjoyb4S9ZIoHGnWnWso7oT+kexLA
	cpSkoQud1si9Yxqbex67iHVOU4PvrXoAD9ACkbbMeQFAzyFbHjLeXiiUw9SddC86q0nLGTfUitb
	O5vKdB0DFWCi7YGkSJI7X6es3OqNykEqsEUNkCcGJ5g3BBQbDPFHJXTu8jOK+ma9DnE9BRKh0RP
	qhWGTUlAspQeb+4KLTaEbaWrPiHZxG1Ki6DG4hvUVJx6qa6abKlYX4QnQVlikZMkajE=
X-Google-Smtp-Source: AGHT+IG3ll1f11+UZwtw+Jor04/g1jCvuU4qYpcPBlXzdyIiMI+7ByMCtbhip+csjv0HRfpmtu7BRw==
X-Received: by 2002:a5d:456b:0:b0:38f:4e50:8b0b with SMTP id ffacd0b85a97d-38f6f0630d5mr472733f8f.31.1740083605337;
        Thu, 20 Feb 2025 12:33:25 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4158sm21289979f8f.3.2025.02.20.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 12:33:25 -0800 (PST)
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
Subject: Re: [RFC PATCH 2/3] phy: override dr_mode for phy0
Date: Thu, 20 Feb 2025 21:33:24 +0100
Message-ID: <2428472.yKrmzQ4Hd0@jernej-laptop>
In-Reply-To: <20250118102207.9339-2-simons.philippe@gmail.com>
References:
 <20250118102207.9339-1-simons.philippe@gmail.com>
 <20250118102207.9339-2-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 18. januar 2025 ob 11:22:05 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> PHY0 mode is fully determined by the selected mux route.
> Ignore changes requests from controllers.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>

Some context is missing. Why is this patch needed? Which scenario causes
issues without this patch?

Please also provide cover letter to the series, with "big picture" explanat=
ion.

Best regards,
Jernej

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index 24fbabe7a..f163b355e 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -544,6 +544,18 @@ static int sun4i_usb_phy_set_mode(struct phy *_phy,
>  		return -EINVAL;
>  	}
> =20
> +	if (data->cfg->phy0_dual_route) {
> +		/*
> +		 For SoCs with dual route the PHY mode is fully determined by=20
> +		 the selected mux route (i.e. USB controller to use).
> +		 As both host (EHCI/OHCI) and peripheral (MUSB) controllers uses
> +		 the same PHY, both drivers can try to set PHY mode.
> +		 We need to ignore this requests, but not report error in case
> +		 of valid mode values.
> +		*/
> +		return 0;
> +	}
> +
>  	if (new_mode !=3D data->dr_mode) {
>  		dev_info(&_phy->dev, "Changing dr_mode to %d\n", new_mode);
>  		data->dr_mode =3D new_mode;
>=20




