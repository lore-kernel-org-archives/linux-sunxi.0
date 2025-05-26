Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE21BF33F
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 19:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748286329; cv=none; b=PrPtAqX+6ntjocCHvCH8Zvl7OI+KPSIJD9c4Wxjm5GkdYMBGWbdn4gD23sYQDHefK84MlkCsgEhPx2pJx499bWZvVRYfHEu1SKJUGtQ8UwPYUaQxOblW6dy1DcbX6BmrDUaOIcErUtS8cyHUZYMIAy7eB10X5TPgztey0a5SPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748286329; c=relaxed/simple;
	bh=qbLNtumBrWjiSYsmDA3GQS4jPxLUNzJRPt+i7A4sKjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRnj5qJXZU8bwMM9qTpS/NwBVyDrksbFhBDAGKwhraSFa5aWh5lSMvk83Bl+ZGLknFcPoeAKeYrx/QlENcZBrgvHjzGuCyCa1NkwvKO73k0L1d8wrKmXrfZG5A4sV6dBzwwvxve94nJp/MHdzfrgQl+j2csopyKONYfKyFMHjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKG2y+zu; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKG2y+zu"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5b2472969so260651185a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 12:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748286326; x=1748891126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=;
        b=LKG2y+zuOf/5jtQlxHT14gmZKLqSfNfVckNdF8Seiu+t42wNWfQV7eptqBjZR0n3kN
         jjHJF6AICeNf8OPkGvOw0YiaLIGj5lzn2P7ALZ0OKv93Wr+vKaf7hnodAEyiygy0mTGr
         duAszxcDH1D3sQg0hee+Bw6fAIb1fzUnRkra0A9+iDXV/qah/BV84UOVKKPdp+ADs9RY
         LlMANX1anCMpz4HwaUtHFWh6wCF7iaLNfTpzJDDc3m2J/CNunnOfmuT+HW941DmwXO8w
         2MKnis58w75EnaJz6+OpgkKeOxEkG9Nt15tc8XZ1rigr5iTCQ/+XWoYxPFSBXir8LvZU
         K+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748286326; x=1748891126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=;
        b=ge03abLaOXn4Fbpgc3fI34FcY3Xk1F4+jtOQjCr6VcpgdhN6YK8j7e3d3y+YYpxc7z
         hLS4Y1nmNZOn3bxHftrkdhU6L/qdmR1KOIiKMQBbrA7HBLbX9T8oAeJQB/gX/HtatAsa
         qauD+m1mRFgk0qcpDt5CMsMaT1IbsXdyo6RZJkhxPmKkbwvxrArrKrXBSC4bDoZ9nSMo
         9WqmK9PZAwS4YMwgV8vbTJ4RQ5+koDRjouOIOZ4QbFISOa/1KYI7pXetYFZSuD4nqQ2P
         pPgVeT32ez15y1YJT0wFso9KaAWFBFWQhi5D6RMaeQznnmZRvxlnHDGaR7lafLd/b6DR
         qkSw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ntnpgxuuy5ieiRQmR9MqDXy6a/1Ov4GkWQwuPFLiiGi8+BRGmj0VuhzJUg1ToHcZ6kJ1tvX+TEagtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQLuhbhfZoiU7X8HNMWG7uHE1OmKJocnEWgjtbJbx8PpL6pcxd
	oQJKxkUpvxAA5qj9qV7I5wdMh7GhSyQiBG02cn3PQh094JPUJxLAJnNWp0lMotW0e/+VGCo1Y0E
	bE93jn+/LbQS6IixUFLs+WcWEs9fbnFg=
X-Gm-Gg: ASbGncsh/zar6J780srDO57yFc9ZiS01GLLZzOHTOkgPXgIVkYZowcL5c3CMb7q6a+a
	m1eStlIYN/GR9rc+8RrAjgABtcEBM06sP0Erdu05RJLO9RrML0ZUNZmtAlRZRyANPAmQuX2K88j
	1xV2SDaupOFkjrsLjiO2KXZx+Ix/jLeGcoqHQJewsLbIOI
X-Google-Smtp-Source: AGHT+IEzr1D0xPyVVTqgXnkaxzNsP6OY+ZVcUjK4Q6hjbSAkhccfV9zIJl49kHyZ9kmtGtW7FN9E3h5L1m5LIHvS+oA=
X-Received: by 2002:a05:620a:4505:b0:7c5:a55b:fa6c with SMTP id
 af79cd13be357-7ceecc2b525mr1410143685a.38.1748286326033; Mon, 26 May 2025
 12:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com> <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
 <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
In-Reply-To: <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 13:05:14 -0600
X-Gm-Features: AX0GCFufJmB1WnNeY40vi62AOOmldrFuv3uM6nfuatEvw8W1yQgwUxsIUPzPUZI
Message-ID: <CADvTj4qvu+FCP1AzMx6xFsFXVuo=6s0UBCLSt7_ok3War09BNA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 8:14=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 09:04:40AM +0100, Russell King (Oracle) wrote:
> > On Sun, May 25, 2025 at 06:29:22PM -0600, James Hilliard wrote:
> > > +   if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> > > +           const char *phy_name =3D (val & AC300_KEY) ? "ac300" : "a=
c200";
> > > +           int index =3D of_property_match_string(dev->of_node, "phy=
-names", phy_name);
> > > +           if (index < 0) {
> > > +                   dev_err(dev, "PHY name not found in device tree\n=
");
> > > +                   return -EINVAL;
> > > +           }
> > > +
> > > +           plat_dat->phy_node =3D of_parse_phandle(dev->of_node, "ph=
ys", index);
> > > +           if (!plat_dat->phy_node) {
> > > +                   dev_err(dev, "Failed to get PHY node from phys pr=
operty\n");
> > > +                   return -EINVAL;
> > > +           }
> > > +   }
> >
> > 1. You are re-using the drivers/phy binding for ethernet PHYs driven by
> >    phylib here.
> > 2. You need to update
> >    Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> >    in a separate patch.
>
> A real user, i.e. a patch to a .dts file, would also be good.

That will be added that down the line, for now I added an example in the do=
cs:
https://lore.kernel.org/netdev/20250526182939.2593553-3-james.hilliard1@gma=
il.com/

Currently there's a few other drivers needed to fully bring up the h616 ema=
c1
with AC200/AC300 PHY's such as PWM driver support.

i.e. this(which will also need a few additional patches for the H616
PWM variant):
https://lore.kernel.org/all/20250427142500.151925-3-privatesub2@gmail.com/

I'm currently doing most of the PHY initialization in u-boot to simplify te=
sting
of the efuse based PHY selection logic in the kernel. I'm sending this
separately as a number of subsequent drivers for kernel side PHY
initialization will be dependent upon specific PHY's being discovered at
runtime via the ac300 efuse bit.

I've currently verified this works on AC200 and AC300 boards by checking
that the appropriate phy address is used(address 0 on AC300 and address 1
on AC200).

>
>   Andrew
