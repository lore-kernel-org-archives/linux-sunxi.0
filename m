Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267E22AE48
	for <linux-sunxi@lists.linux.dev>; Fri,  9 May 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791433; cv=none; b=J9x7XVAavtOoSLnQnWG/UV9CPGv8bdLBMWA2tgVAFdzhMJox+ovTbut0riCBX+u8rCB+nmOHNm8iVYvFFyZJkz4PlD50hYNhSp/8hT0gNEIsmIMbuvquOsJ0414uq5yE1ldul2VFVhR7XZVCm/OCCqYroE/rvxtoGBEvHUCWkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791433; c=relaxed/simple;
	bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWhcnopxQ7hUbTCUwYAftTepTwC8kzqLm00FDD/XrIqVRfBE2mvEjK+Vfv3fMBZvYSOcv0a/uDrHDcKigl5MCQUY7Pu96ySGH+vtzBbuzZU9nrTpE9wiaqLAHSffB/G0ZK1fOI/o+bRAjmDHktr/BeXRTT8hDgO9Gwm0eMQpIp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gzVTVOQd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzVTVOQd"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-310447fe59aso20195581fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 09 May 2025 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746791430; x=1747396230; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
        b=gzVTVOQdbs3mx2qVC1oETzGX5sSMJlmi7PR47/og2JgBH5C7hrsoPxcfvrG6kshQtT
         gyx+vzWTI7i7cr9MEFg4mAgAMjonodC23JZOtK4g4TImYKiW6CzFgFleLrg55DkdgPec
         D+u00mxwvcN2ZXagVISJTEArwcu9EibPNTeHTC3BgKxjW3QkOSDN/WRH6f1uG58sSuWV
         TRzlEjjOJZVxKsB1SVvZcC0RexGLsCwTvtEPJb+2sW6ssWfNq5biZJlAzQqGk6+J/+aJ
         JWu8/trEpNeIvfyYQ4YQ4AFL5GCs0wutVjfgH0uF8suI4LedSWx1zvF2CSw1KtWITfa/
         DQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746791430; x=1747396230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
        b=jKOOIctoVTRZQYUSAta8ly27mcAaVbz0vLH0OZW3qawZ5oZJRFSYL72aF9IKnj1Wtr
         8K/nrQhBeWRkXpqYLX3i5faCjIMX9W76CiwmPxGYMhMaYDXWOknqkT+1W52sMx4HPpie
         LQZP0yFBt5/fjz55hbufBOjQEarr3MJZhJcBe9TI3huKgWqgKY/gmKXM4KpwEeH6blPD
         zb3M+a5pIRyEojRtHzNKHJGzphTHwcigh1nHBsdbJskf+WAyCEQySarQ2UVts7lY/Pn2
         PI+lrdL4t0cV9SH1t1825IpGxOGzJBTt3ng8VV0auprTsEyrtQSpWQRov74CNZ4vom7m
         77pg==
X-Forwarded-Encrypted: i=1; AJvYcCXs7MnVb8IrNc7wVwFBORfAFPxPlIOWmqUEKlgQKnyBsbpis/+wGQKR3gNYhpOZol9EeIuICoV5uEmbqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxokiUiz7ZTR+lPirZbkC7iRWSkAwbX8GityqabptzTM3/LzllT
	ATYvabz2I/PYW0ZcY3TQPiJgG14EVb2GIkU0UksDXAslmZAY8Ca3ePLWSsdrjEket+axzzYCNer
	YMxrvKch8sYwDVYehUvEce22LTpHCVNS8kD3YFA==
X-Gm-Gg: ASbGncswqzknEuNVD6Bobl/94R6O+mRU2wPkPMOZJRy/OFiU6YY9lG7CHh2/YctbkBG
	rEJaUy0B48MUEZee+wBaKw/ZUgNydh0YY5t//xlODAEdaaQdmxwoopHhtR8toU6fg0MoY26D539
	Scpn9oyjnv+MWfaiuPIiD3NpP8BZel/9sY
X-Google-Smtp-Source: AGHT+IE9OA/TgX88UK8wnm39DMsSy6I7xruaMSROXFg88YbOwzBbcaNlmJPRpQ8Ckx3l33XEBcNwePAgT7TtPdM2+0E=
X-Received: by 2002:a2e:a991:0:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-326c4575642mr10757241fa.18.1746791429976; Fri, 09 May 2025
 04:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org> <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
 <20250425104128.14f953f3@donnerap.manchester.arm.com> <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
 <20250425160535.5a18adbb@donnerap.manchester.arm.com>
In-Reply-To: <20250425160535.5a18adbb@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 13:50:18 +0200
X-Gm-Features: ATxdqUG6U2bPxTcfQiBy-oW1Lju29rGeV9-TYLkpQrHjbRn14HSqGi03f0yvO10
Message-ID: <CACRpkdZH+NnP0-GkLe+nHK-Oi_Z=FzPaM=k1U-gZddp+P2+DTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 5:05=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> On Fri, 25 Apr 2025 22:35:59 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> adding LinusW for a more generic pinctrl question ...

OK!

> > There isn't any assumption, as in we were fine with either the reset
> > default or whatever the bootloader left it in. However in projects at
> > work I learned that it's better to have explicit settings despite
> > working defaults.
>
> I totally agree, but my point was that this applies basically to every
> pinctrl user. I usually think of the bias settings as "do we need
> pull-ups or pull-downs", and if nothing is specified, I somewhat assume
> bias-disable.
>
> So I am fine with this being added here, but was wondering if we should
> look at a more generic solution.
>
> Linus: is bias-disable assumed to be the default, that pinctrl drivers
> should set in absence of explicit properties? Or is this "whatever is in
> the registers at boot" the default we have to live with?

We have never hammered down the semantics of that, so it's a bit
up to the specific driver how they implement it (yeah a grey area...)

There are many drivers that are carful to not touch register boot
values but others who set them to some default, and people
have different opinions on that.

Yours,
Linus Walleij
