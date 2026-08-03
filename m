Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04871352036
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741763; cv=pass; b=ncHg8aH6+zAuABZDdoeENSL3MtLBg6ozrwS5QO54TMM//BPkEp8AMBmRRiOOcjKdIMZ7NGcp5AmtOhrxzi3PGe4g6UTWvZOOyvz8y6GqZYZhZZ0yl34PowXNSc6oXFQVOGuCkuJCVP3FAmqWEwZc2EInziiounTIgTb6oSSUQmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741763; c=relaxed/simple;
	bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Znrd47hFIP/e/aq8FdI9jj4m1Y6rnrAI+/mDACzNiQbAi8g7sdm7EPBjZXwn5tahu+u7fvvod8w+ulfCccqEakT2pFzWQwW/M4xogIMSvZu2w7QtphcddGmhvAzxRKC/2PSOFHQC174cD5y7W56bPir+XKmuSLowglehQ9ZbYtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUJzTaJi; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUJzTaJi"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73791ee3612so1654896137.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 00:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785741761; cv=none;
        d=google.com; s=arc-20260327;
        b=h1VJ2wUColH3qOf/ctzGhJaj1qqyUuEUJibP6JrOtdBPqmkATlq6icM66SQaf+V4oQ
         eENsNvnFE5+S30vRjW403E53V6Zb3e0pXftTtVhZbVvM/lIfTTwEv9pFY2oC8gx9JjRy
         1pYhAvhJ8+JqorZfkYnatw9W8sD0WLZNxeJF2/Xc8pDjDcX14g3ecMsHs8EC9b4+htZJ
         b0YmcRqmqpt/rD7ZbaBhEBaXKr2WLC35ITGrybDVNJB6foTML3Yv6KxE1VWlIpviozfw
         1oCNEmIBVsOale8rK8IbieK8lTXkH5GMftHhjKuQLk+Qhhv7zNr2lCbnttuC49+IgAS9
         fHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        fh=sZheqwd5qToZd1XatzDsLxDcUBXd0IjELBARqUiWrjw=;
        b=Jx1/26KXgLSRkV7yIbJIQjLa66+MrCgS3ZA2hytEuLdwjFXrAi3NX+KMnTdKdJNtox
         UpP2Gwm0eCai7OQT6GNd3K0OymIX/aHOh9XptyWFInZi3jVg9vDXyADWPM2uOWtLij0w
         3U2KD4x1vaSdeVn/F72JjuFTICp4YRFU/IfsJEHfIFs5D4Ba2sRhw4adYCP98M5c3al/
         ODEnB3OZ5gsA58nxNRtk3geMebO+1KwqO+eEj+OZaaChaJaCpQp5cQU5d2J/82Kv2Xex
         M5hFaBhtQNUkoW+lU086ZSQ9e67ET4mPbmKgK+1RHS0CglQeHbRNdkHuIVIMzjsqDE68
         ULsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785741761; x=1786346561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=TUJzTaJi66PK7YPLnKDUu/SApTP+Lty6a52BncCYzVeqebQBzJETk9sl9xSIUiKryQ
         pI1CLruiXxVRXRADWEBOIOhLMK8mpDZl5cqiDIWtoPg8ydaL0jzg5cUpvrx54JISNWNO
         8h1MAnHSHIoXHsLG6wxGetFfyJEJDRqQMSQzNJfXjcTxL5n5UOUiXK6eBe1cRBjBKQPK
         R9gS7CRZFb0Dbg7bgBzQlVNxoDAYVYxGZnKaJMPlHBUHMKfMyRDQFkuTqCsiRdJ/vMRh
         kr2KemtvcTcQDpz86CoDdnBGOmXjYuug6I6dAU1LTdCi0jgVmyuNca8C17zwylJ2LaFt
         fHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741761; x=1786346561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=PH9pzC5vrd5g/50JxAuCEnA4iHrOh93pPpz5LZVrLnALzqsvQdICkoj1S5zVpeIy/K
         xbW8xzJ32Ya1HWEN4y4fw6HbFYt5Ttkp331pmLMr58wV6Asyt5aybHLXRmUpMmBym2il
         kQMwH1+RE8KAEOcx1v4faLAceDdq5XX0zcGvY1mPNzGyfWe+fBiVeDiIxla2uJKeouyP
         CLRxmGyE+3O0HF6jbSC8PiDyVcxYDs/v4z2Jr4x7oqVYPk+kRvy3e/rURNFrczdx9q5e
         2vwFWLgigF7tgtPzAXnw8WO8E6k6ccDf8BJiiIQJf09CZAKolv6F8v3UPiS3ZFxY+iDh
         WVMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpi7dRHwl1ywks24LEZEd7O2vMlY3u8p6inAGf8oINh8jva7NjSci9rDmj1SNcdDCdA47lun2GV7z9MRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZTNbIAAQ/xR03Qb4hJQLR1LsLiML8LAxtFMs1xqdH10B0E1dK
	uHLBiPvmC1UklqI3f5wepFNfKEpx9dvw1VhdncNESdpm1Ux3DPOEuQ2D5vMjA+1Cs+KoRMMtpup
	874RtKVYxkRMX15hOGo0s+0cijcBqLwk=
X-Gm-Gg: AR+sD12zXewjRJ3L5FGnc7zbbmc+Wi5gtypJ+NVUbfD4taHUKQuiT/5FdjgvM0qx73M
	uCYy+3fKxVKClScxCpfNIGQK3jwpZd60L/XDNSOrC+5FABKrWJg3JxvRbjUh0BpV104k783BXrQ
	Ef7O07MJCvbkZ5PsfMWYfHMvW6DZml5C44WuyKJ6r3AuxfBsngX5Cn2Tst/f8a8G2X2svTQHaqw
	+1jUckhM9oW3sSW5lhl8LD7rjY2P1c22k0oH0s27UtsAvpQDAmYXvIYogISe5PoCMxav0S5cT1R
	wBz5Dy7fwaiw3ifbcYIl0PBO+Maw420gBjuqOJrxpy1hnufTjvPIce5crcwDh0f1TEmC5tIrnqU
	cI1RMIibd8rkCusL7SxxaJj23RglTFxULbH0CU7Pe9C6jUmq7abu16dH95nDbtypjkkQlDpToyc
	D+UkqRWTBf2/gRnUNG4+aWJlooFjDtCUydbp4X
X-Received: by 2002:a05:6102:441a:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-75b22260dffmr6459811137.5.1785741760783; Mon, 03 Aug 2026
 00:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com> <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
In-Reply-To: <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:22:29 -0600
X-Gm-Features: AUfX_my5qRz2h8yblU9_NUKeJ1t5ekFC9VrjQ-ysDEg0WGg4G6m5XNTvE_CWbqw
Message-ID: <CADvTj4qg8Yjwr=6KVO_J+r+tEC=6TDrU3o_8YG7vuEdDA0ZpTQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > Build the H616 PWM clock provider, AC200 MFD, both variant-specific
>
> Use full names. Is it Samsung H616 PWM clock controller?

It's the Allwinner H616 PWM.

>
> > EPHY control drivers and the shared link-PHY driver as modules. Enable =
the
> > netdev LED trigger as a module so DT-described PHY LEDs can use hardwar=
e
> > offload.
>
> Why? IOW, which upstream board needs all of these?

The Orange Pi Zero 2W for example would use this along with
any other boards using this copackaged x-powers ephy.

>
>
> Best regards,
> Krzysztof
