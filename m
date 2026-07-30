Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDB443E45
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433258; cv=pass; b=RuwWXMdJVqXXgjvcyQg7gg3R2+llgtJMIeR4avJ6byfdC879sCOj0i1WyvymCSnVZPhw92nPqBlQ51BoFA7dJ99m/TBUxucq3u3rogYDQBUaDZKR2HmSD9x5FNhVbNfxC+WtToqp4LtgoW+QKPXV1yHU2mHAkyRicQxfNIjNV9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433258; c=relaxed/simple;
	bh=0T4KD+yh7eCrgqXUmpJ6jMjhizCo2dTEgcnzge07jsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiIhSqeTHte5+eaLv2TSNFB5+KRaevkO7ihSTZAlNtyz/xlh/iavyODk4yY8IYYULhKbQt4pAl0qXkoqzgyDoXsTY4Doc4VMwR7UoXpFMBvwdTNbC2aqsj/Sa1EiU+kUOmgbhk2BzINYCYfqkCXHAGu0C+HM9fIF5MkkKHMc31I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibiZi6m1; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibiZi6m1"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-977310532a7so696161241.0
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 10:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433255; cv=none;
        d=google.com; s=arc-20260327;
        b=fk4rbNAC7f4rEr9W3xqQviX11FRAIrGPpGlsVRm+geXxQoDv376xnVuwsnpQcbyXJy
         HuvOpD5mdNIxM9bDqC7N21ND9Svejcvk8heXAuOMsdI2rCPvXfiIaEMNad90lDTq42/+
         lkkmjo+JV8IGQvAjGUm77bmko+u/wJ5PWQZz2X3dTnuB8fbTSWk5y+7G2oanjNIMcRhT
         zgQAzYm1eFnWHjO+7j+BqWoysGW4SJF7aimfnmUtzNOzEqe0AnTxBxCemivUAjhvWntK
         TxVgNgRoCW1vxKHfQMBawvfF5lFO8qbL12rspI1V10CxA4YwjGZNJv60dOO4yWqBJu8K
         s0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        fh=flDGw/3L+ZFxUgCUjYrFLPerBVJIfUbr+de8JrDN8TI=;
        b=khpQyo6as1GExj8lXL4ewShjLDL4Q8MQoHQtRQgbBmrvU7Ad8IEK7IjkDVeC6Dc3kM
         amLARFUt3JE9a9EVOPYeE4mPzm4JBIT7QUPf/1Mxk0Wu/WqDTNZNTpUlUuR1CfnDXJsN
         FNmO8+LFin52K7/G36Uht3lQW0tO/iCwYvewGqDnm/fdBw6YvRwOFsVgnWwthjfaW+mj
         yGr21lLFoQ7WRrjCa/l+JfOxmtIvku3nnwDMDB00DgrSXDw3KGEdTwbJBCb8uUOVdyVX
         hBSIQuH+5jJ+gLV1rhyBCTji0boHdoReTDKl0zeWky0N/U0U7H+XdTUdaLd1WLok3jbD
         YLXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433255; x=1786038055; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        b=ibiZi6m1R3mO2fqwG3McWFbQrLGXmgMDHDfO7hZmdEllAyz0D4JiH2rl/qpCqcM7SG
         8Do08t9/2Q9PEZH/m3t3LuwvGgwHsfsSgacioRhmI/u7FaTyUUOmy4r536PsdxPAQg3v
         ZYjVrgmHKSnpuVO9ngfKF5h+kjPrBb17lkF1MyWfJC3NYPtmK/uuXW9psL8lMe++2mTz
         Q22gQWZBFceg0rmVMnCOHMnLsbrE/+5wro9+AuYmvPGNGt/UFMbQryoOSi/EshRjflgj
         dRWwDK0S1Lqy1EiF0blcTL8q9Dm5WCUGxfmI99u2AKeGuNzwvUeoNJgMu0dVxmsP2MaK
         Cx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433255; x=1786038055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        b=hmI2Fwq9GPIlTXJdn07jSCmIPUCdkEWmZe/Bx/YE7aj+V0MqHuYJYD2XSNCIPCsXcg
         PqxEEMYSDM6uvt93ITKBb52uRS8rAMs76P1qB+xWA58dfk4sDAILfUxBNHr9CjGQs5YR
         V8IzBMbXZu9LcO3Y9WPc6BB+Cv37CoHdQTK/hoT/Z5LAGH38k73xiVENJswwhUfR/3bs
         2TEmlqoLWebkS1az+W8RpOwQ/MlTazaGf4RujXK3qbTETlJWdIcuLGTNQRKlZXg3X9WD
         69tCTaTfAaNxPN3irwrEMnuqfw9EDPG1oOSusQgpOvHfukZiTa6RwipGTY83iGKOu6Pd
         RwmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBKq4KnIiqCcNU9/6XKr5KDxN4iFw7+1oiE/QJOkiX1JSBmuZyGcboR3+0MOHXyINUPXptoBTfna5/1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjoLsPmS93n8dHsOHaf6/Ra1YxlaLkS5cJcnmeEq8kG5aI0i7z
	n6mWQq6Oh+gAYAmqs+qudPWG0EV/3OCMx6nq5qZvxaJ6r1qNx0pFIvTrFn82Rk+XZ0HPvWrYEV7
	UeBjutgi/ejRSCFLDe/lkmAStnFfuRiA=
X-Gm-Gg: AR+sD10SA8VJkMgTfuR+TPsC4TZ7vsyFEa/8CagndaOhlM+Z28Rw+qzd5trg1M4L9xI
	ivRw0UqMwPcNUCHiChyHDgt/rZBlEcpdrZNe6ClvETEPpT6MZ6Fd5A0GJlHZ1jt1k+VCIvem52I
	PuQy7dBx+3E/OAKC2AuBPirCp0rg1tp4k7lcyhAf/HWWCnOJ50u35vcocVAbZf8PhsSksTI9LTF
	TWrZE+TK2cgyta8WWB9N1J7OYWz8V5/03Utya9mzTyNun+2x8zOrF8gSDRLo2ukxEcyNP8nMR+M
	0TME7lHzeEloFXRBmvt4ML4DFMm2Xs+5nDHPSWAGWrkwypABs13/3HtjboNrPcfK3tVORGDgfvh
	wtg==
X-Received: by 2002:a67:f584:0:b0:738:8b5c:a41a with SMTP id
 ada2fe7eead31-7582b0ed85bmr442473137.18.1785433255276; Thu, 30 Jul 2026
 10:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com> <20260723002319.2793cdaf@ryzen.lan>
In-Reply-To: <20260723002319.2793cdaf@ryzen.lan>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Thu, 30 Jul 2026 19:40:44 +0200
X-Gm-Features: AUfX_mzRjI-xu9REGBWM4Xyou0Hlcet9mWJBwP9-yY6cbvyclNHGRhHVoQ_g3AU
Message-ID: <CA+c=wxVB-cEncgBE12S2YgXhL7DVgRyg12_4jJ-CjxzBjK62kw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

> There is more to enabling Ethernet on the box, though, right? The
> EMAC25M pin needs to be configured correctly - not even sure that
> works cleanly with mainline? And what are the delay values that work
> for you?

Right, the withstand fix alone isn't enough. Three things were needed to
get GMAC1 up on the OPi 4A:

1) The PJ pinmux. Mainline's rgmii1 group was missing PJ10, which left
   one RX signal unmapped, so I got rx_packets=0. The BSP muxes the full
   PJ0..PJ15 (16 pins) as function "gmac1" (mux 5); with all 16 mapped,
   RX comes alive. I don't mux any separate/dedicated 25 MHz clock-out
   pin beyond that gmac1 group, and the link is rock solid, so on this
   board the PHY's 25 MHz reference isn't provided by an extra SoC pin.

2) RGMII clock delays. The board has a Motorcomm YT8531 PHY:
     - phy-mode          = "rgmii-rxid"
     - PHY node          : rx-internal-delay-ps = 1900  (YT8531
RXC_DLY_EN, ~1.9ns)
     - MAC syscon        : tx-internal-delay-ps = 100
                           rx-internal-delay-ps = 0
   That combo gives a stable 1 Gbps / full-duplex link, 0% packet loss.

3) Your withstand encoding fix. Before it, the PJ bank was driven at 1.8V
   while the receiver sat in 3.3V mode, so RX was effectively deaf. With
   your patch RX reads correctly.

All of the above is validated on my board (2026-07-08): link up at
1 Gbps/full, ping 0% loss over a sustained transfer.

Thanks again for the withstand fix - glad the POW_MOD_SEL patch helped
connect the dots.

Cheers,
Juan
