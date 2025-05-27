Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3681FFC55
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378238; cv=none; b=IvGtJ43YuiDIWZrIyQW3RiPO1+FfhvSijsCyOan+hcNzKwXd8ols/ZtN8kNyOfao2AIU8TJ0TgD2qsQl0vjk2a3Crnn38mdyTnSOwddNsXBKdpAi75dj1rB3YLG5dbZtXZl52nbBN1IaTSQYe7RCZSqzyvC8NCraDp9eThkRvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378238; c=relaxed/simple;
	bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxV7b2B/vnDHpdG1qNDC95Ht/kH82W3YWopGSz2ulqVWuXMb4Kd61Alv6S9bGpaijPLwm55QITGYnhK3YJY+P9uD5wDkhR3LuCGyjejIKThaJi1n065I5cKonWvRvUbIb5jUHamq0Vv4NiW6Z4u2ZI1Hz1q6A4sznISiko6d3Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwAhRPSn; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwAhRPSn"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e11ee95b2cso2290014137.3
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748378236; x=1748983036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
        b=BwAhRPSnLiEvKU6NQ7aabuXMYIXs+I99l221iYWMfmL+3THo7pIHu5gdzo/VGc+S+5
         Enj0T0MioiKV+R/KD98JrZopKStUkcFH3cFBMhz3ZFnfYnO5ByR6e7gNx4Gk007rmIQY
         OlFfLPKGWrPC3U/vkFMauAeLDuWvrCFSLUxwX/u1S7p8Wv6xW+woiQV6ArCGhIJ/pdhL
         Fpxx8P7s7AbRZSXPxMl6JPGnIlxtElJSmttKqVzOBJJIMFpfw3OB4YZkEnzU3+dBpTsr
         /SHWDVxVv1nVVl+wZTJmiIgV4g3saVupJ2JjxJlUuvDtdd+6ibqT8/qFXgaq+sqXszPF
         z5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378236; x=1748983036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
        b=Lybi9a/duWjem5sLujyajQtdsdDeiAE16O9OrrSM+C4MCVdvBSgZxsreDA+8vhqqV6
         z1XVdiCuRsnQR7Kaf44QpB2muG+cQ1yAV4jusavO6k9jmsu6j18tPWNbNMrFd34zrYt+
         yGHD0nh9dLWbWzxVDoaB4tPcTBjN+0pQwvp7aEgf1daZc5fH69QDbLxl63HWFzbr6A/n
         yaW2PCib+pTI2ZaGWTwpKYb4xIYdCbiBeVOI69BNBkAa92U8ZQyU9K5IEjWOpSp4kxMB
         3eBIEyW3j1NndhLCsipMb4E3hNEBvy6z2YCdm6H/yRRRPwlA6o3nRTqOa28pdUjtzrrS
         NC9A==
X-Forwarded-Encrypted: i=1; AJvYcCVllDsZkekkHOLoTyVV3XJJwqHKI509qUfSVFx3fwZqJ4lPeRRMQx/Dft07ZOvqe5sPrfw+4YF53mFRdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcCTgWRIUgu/YQAEfD2Gdado7oxahvLB7U9yYpaOjVIMk7Bpha
	6cEpBRUqJ9Ttr8OmZv65quCZVGTUsdHNIHMrDfWdxEyyJSz/aoM5XNqUvCh05dbnDwQIGOeAoSQ
	xt0aYUnbx6WA/grRiLDNUyrZ/Qal3QJQ=
X-Gm-Gg: ASbGnctmfmCHqlyyMfAStTbPvvpL6Jh4BgDYNmsPcPLerPwqG8iIdo4MgNY1IHFIDFZ
	EOsWXUcSj4gHmjyoJhMLAJDy7Mt2qP0/GGD6vmjQjQJHYcjxjnMRyXgvSv2vimop+cEdiFNIXYM
	ZRpMMdPFWy6hvloh00ObZ5Tfo2Rc4IabPmyw==
X-Google-Smtp-Source: AGHT+IE6IGadDKaQe14cmUEPJjOThWelmyPbRkm0rWeExh7Z+iiuaCMzGmZ+bOotchpiLT4AwMawTY9UCWRMvMcye3A=
X-Received: by 2002:a05:6102:cd1:b0:4e2:91ce:8cad with SMTP id
 ada2fe7eead31-4e4241911f0mr12890455137.24.1748378235982; Tue, 27 May 2025
 13:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
In-Reply-To: <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 14:37:03 -0600
X-Gm-Features: AX0GCFsHvzxiinsPSv0WqpWYNJug5PA_MZLWR3SDuULgtlfcH0M8oGfitOEajfo
Message-ID: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sure, that may make sense to do as well, but I still don't see
> > how that impacts the need to runtime select the PHY which
> > is configured for the correct MFD.
>
> If you know what variant you have, you only include the one PHY you
> actually have, and phy-handle points to it, just as normal. No runtime
> selection.

Oh, so here's the issue, we have both PHY variants, older hardware
generally has AC200 PHY's while newer ships AC300 PHY's, but
when I surveyed our deployed hardware using these boards many
systems of similar age would randomly mix AC200 and AC300 PHY's.

It appears there was a fairly long transition period where both variants
were being shipped.
