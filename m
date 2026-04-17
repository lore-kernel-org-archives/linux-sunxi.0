Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEAE32A3FF
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Apr 2026 05:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776490185; cv=none; b=qRey6gtOVSIURD2luji2hf4PsjLQ8Fe4ayL+IqaGhVOhdUhKBkAG8tjZbmJKiroIEWedzDKIF4deOiXpVStXRKuLhWv4/3ciHfo+Zx57OrXEIulO4QpunCSiwfSZ9zNw3uRK652+n0Sezfalax8XKyVPt6ZFXP5ZwVZQ1E/ZvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776490185; c=relaxed/simple;
	bh=w2lV6yC4k2EbLUaFguBxKzs3MB3cxMwZ+q+LhjXlej0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBZBvextXLKpgK04scroYKjZp5d3MJN6jxJbmumFI7PokNcB9xVqEQP3+untLW3mREsP2vbI7RxQhAT+AUI3BpbVB6lohgaHn3zYtZ51QzCU6dGZbt3VyavzCRxTjwX1nwj1XOJg25fKQ/G/I5uQu7P4nkhJxBKPYA7TdQ6pQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJGvgje8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJGvgje8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso16530845e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Apr 2026 22:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776490183; x=1777094983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqIGWzZtvPAAeCWKpwkY2/edDBYVB2pJE2Twv+s/yFw=;
        b=pJGvgje8PkC8YtILRteLPX/UjhuiegMC1PFcpnQ37oau2k0PVXzpRPliwMeBRiliLf
         WC0KJcX1fQwRvJsQQZwPh401+8exHtEJir011MTB46qj6JzqChmRoKMBK6t3BiLNGlE8
         2RZlUz4dDGC+NPJbQ6ZhNrdvuvaXR9nOVI7Hn9llDtFspyfvN7+r6+CpazRoomQc+Hci
         PnB+xH9tSrOD+dv8HvNFXjiFid0hfd9xtmAT9zfUeGoGTeQdy5r6J24iSIn1BbNTpt6X
         6KstSAKNPOZq2lG/D3qerdaGp38jKLFIIXJAkNuVDDbbsTWOQCciX2NgHB0zcoZ05+B8
         1H9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776490183; x=1777094983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqIGWzZtvPAAeCWKpwkY2/edDBYVB2pJE2Twv+s/yFw=;
        b=svnEZYaqx/MhF0WqnZqrMyhZsHzjDlEIHRwnAF+k2N0zH4eeAhu0006YVDJa5Toi/C
         mQAtXaUHFafLreCvKani9zdTdefwDkKUssS2Wf0ZHu+WZvvmrfiQcmIVtYYtnxj6jvlz
         dg3F44gfAhQ9hQ4oQ4XM6W170FaV2FNoh/FB0mZZpv5z0AJMw5SJ+JQOA+Foc00EESbO
         TOacmPGItjjSaEnx6GilIETQlAem+LJ/5aOkpHtA5p3aZpuzUILEQBqg7C1upOiX+9OZ
         z5gL5hmRTkfx++Ar+WgKpdbvsT2liyAT0Brr0umyKd1Cl4pndnCPZeBtVsPKXZMjZMj0
         8ICw==
X-Forwarded-Encrypted: i=1; AFNElJ/psAjcLSLT/RJyJB5eePk1Oi/USnvC7ms2JNL0gg/OaIu6oouRs5UhYn6HL4gbQw8WPROvjFC+KxITXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIp0tlGaGJv3cL3sxdYq8ThhWYajR7RCxKeY/V3VaZY7IIDAJo
	3EYx/gNWBc9inaxmHwzo97p42Z+HWIr0feLZSG2SFYoNlO8pV2VJOp4i
X-Gm-Gg: AeBDieu2UU7b2gu77hoElqTHMupsk3xdUGFd4kjUZmGbuwH3G8mwXINR0zObjMM5bIE
	Q4SGQ0d4EowoeFjmmwdetJIcfI3Zwvb7h6HCsMa3OWKyk+8tRVZ15N/ejOZMnq0jh7Bj8XtDZgN
	TcwX5mtLjTqQg5hihYX3flwAwR0SLBaafnOnF263Kpb1Fc+0J5q7nsRWDJDYckP/+FWM4nnvFyu
	IYqCLOnQTAOgLV019sGeC780NWb6plSyPQ5c337+YJWDRAOFQeQ88VKUCH2+KfCJ4y/WkOuJnUE
	n3yAZaxSY5Mp+c2ucUDYYcmFFBkgfa+Y/+CuvFz+3E+PMeLeC8U63FcJhcENWSRJ9YPrSauqpaD
	AUV3tMCalpmv2J08YqApoaHGAHA/XZ8OlwV8nU3nC8uXuYNWqNE4DAvconm0WTJNSskDzGpC6We
	2Xy/j4YjHX9DtbrNoCsxPeR4HMzYYfMhHnYRBMu4u88woBnxL/wpvfjUE=
X-Received: by 2002:a05:600c:3110:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488fb73841dmr76103025e9.3.1776490182315;
        Fri, 17 Apr 2026 22:29:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm33521165e9.11.2026.04.17.22.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 22:29:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject:
 Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for reboot
Date: Fri, 17 Apr 2026 20:19:20 +0200
Message-ID: <2825865.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
References:
 <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> available.
>=20
> Enable the SoC watchdog whose driver registers a restart handler.
>=20
> Tested on MangoPi MQ-R T113s.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dt=
s b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> index 8b3a75383816..f0232a5e903b 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
>  		interrupt-names =3D "host-wake";
>  	};
>  };
> +
> +&wdt {
> +	status =3D "okay";
> +};

Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
Watchdog should be always enabled on ARM.

Best regards,
Jernej



