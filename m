Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8087F10FD
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748377000; cv=none; b=dypQGiVuO4W7IIFcIClOEds2kNpNwHFQeyJMhkJ5d/TQy7qzDIUvNw7kOdVpHcHPdzPzM7juNr1RqwSXVqLYI3jDHO+4qzEe5pgOEa59G9wxT9da+99B3Xf6/p01d4t42iioU+WySKM6RYohLik9kdsBUJhaovpHqsvIYG4kNo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748377000; c=relaxed/simple;
	bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izq3HzuGkHM0X4DZXhsApOvJ1eQCPqV0mrWhU7zoZRWQmIf5xe/XQRuktyKxbivFdL9yc+s2lviiI68KzoR4NnxY5gqNVt145erlpAsoj+ifWfOKClhFjuet/CbvZtR+aXthDdeSf6mm/N01D5EUkmP98eponhOoW1aKVeiX/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qx1jCvWo; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qx1jCvWo"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52f404ddf3eso1305488e0c.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748376997; x=1748981797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
        b=Qx1jCvWoS8sHrkgwSkekHG+v3GIKZqEIYzoSYhBor0AJQbYIBnYi3zXsCpX67LhNfp
         qpGsTbAhZjJb7V3NJ+wHZJw0KPiB653RDZClWKm034xUznpuJOaT8k2OsGu6qcZy7P1q
         N2+PMj6iFgtAC10slBLqe5Fg+NTptYgIpJTfdUbzvhP94dyRS1ZYmOifW2jN7G87jVce
         Gpf6E1+OSqTBqYo1zklYD7jPKtMScFl32e6C6N4EJhLjnpZYznumO6ct2Mupo+FFI+tY
         tPeyqhjwM6+WLqbJpMbWx29zDnIFo9KM64PO0SPySq4j47eFtyCMmWv/t/cHj+yMSSS2
         72mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376997; x=1748981797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
        b=RrXQPwT8f982vD2r9D0LOAFHHGju8WujWHZlNUfoEDfX5MUT9xFv4vAvCyQ87zH4P6
         Vq1hKrFO1/Asc2H1Hi3fNdBncBWEXMo7govQdkpyuG/r3pJaW2CUQXVSdDM35poLh2t8
         651K3FDdYdGRzp/mDxq+mekqXR3e0SupZrQFdDhTmO8+qf3BV2zuqVN4hRIVHnyNxHA9
         DZP1/SK8HOQI+8+S5obmjBC274Mhrgu4xRK2aLxzRJQZT2edzZMrVoDVwHNaC2nnPW4F
         Y8nnm6SyvIyAqLyLuJ/mKBF799WYP1vC/F79Ob823FWtrsI7rGgwM9EJTET6ArUjy6eG
         TFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcL1ytz7N/BXBJSMyHIiLAcjNW+xBelv5cFav8TgafpF/5RIUyj3mSiEr7QrXo/98C32jkWifuSoeuyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVmVCYuEPFgVIJzXgsNRraMIuJeeJBudKECDG9+8K5NzuRpCUi
	NIAazfHGe1NXYEtH7hTSw4eUIDnkz09U9r89P+xK05jHSPvMOVQARg4ZCKX183TfkKC88vodcMO
	+Bwgo6be800XkuquIWIopV2io+1e+Ng0=
X-Gm-Gg: ASbGncs/3EsakaQdNSumVVkicvt8UoKJhKTp5hlvu0S00/QnuGqlNTKNuvAtF1tW349
	u+ci2xwfMMSEdKvGK+Du5z3pBXPsr+frYV3553glrlwD6bGVQ4a8M9MOOdSCrvCxvhLImQIHWzH
	57I63DPaWOHOh+0wg3HHu6+XO1YyLmIvsVCg==
X-Google-Smtp-Source: AGHT+IETycDNDAJyxv3VLNHb+TIrTja35S1519qoE+Q/rK9pDA/sheHZNaSXrhFkGJah8hc3P6ff0SwCLKvwf9KpQ8o=
X-Received: by 2002:a05:6122:3d0d:b0:52f:204d:4752 with SMTP id
 71dfb90a1353d-52f2c5ca414mr12169837e0c.11.1748376997259; Tue, 27 May 2025
 13:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
In-Reply-To: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 14:16:26 -0600
X-Gm-Features: AX0GCFv4cap4ZOGqZcta-siDQMwW0SvAemE-pnT7ig2Oyj0apu2kFeIEsXbam6w
Message-ID: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
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

On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> > > > Some devices like the Allwinner H616 need the ability to select a p=
hy
> > > > in cases where multiple PHY's may be present in a device tree due t=
o
> > > > needing the ability to support multiple SoC variants with runtime
> > > > PHY selection.
> > >
> > > I'm not convinced about this yet. As far as i see, it is different
> > > variants of the H616. They should have different compatibles, since
> > > they are not actually compatible, and you should have different DT
> > > descriptions. So you don't need runtime PHY selection.
> >
> > Different compatibles for what specifically? I mean the PHY compatibles
> > are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
>
> You at least have a different MTD devices, exporting different
> clocks/PWM/Reset controllers.

I assume you mean MFD not MTD devices here.

> That should have different compatibles,
> since they are not compatible.

I agree with that for the MFD devices, but we still need a way
to choose the correct one at runtime otherwise initialization
won't succeed AFAIU.

> You then need phandles to these
> different clocks/PWM/Reset controllers, and for one of the PHYs you
> need a phandle to the I2C bus, so the PHY driver can do the
> initialisation.

Well this would be an indirect reference to the i2c bus right?
I mean the phy would reference a reset controller which would
in turn reference the I2C bus right?

> So i think in the end you know what PHY you have on
> the board, so there is no need to do runtime detection.

But we still need to somehow runtime select the correct phy
which in turn references the phandle to the correct reset
controller right?

> What you might want however is to validate the MTD device compatible
> against the fuse and return -ENODEV if the compatible is wrong for the
> fuse.

Sure, that may make sense to do as well, but I still don't see
how that impacts the need to runtime select the PHY which
is configured for the correct MFD.
