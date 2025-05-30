Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B021C9F8
	for <linux-sunxi@lists.linux.dev>; Fri, 30 May 2025 23:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748648804; cv=none; b=lQnyhVgTIj0QFyW1Wk/JXK+4qvbPOtYEserGlRUO7FRrAceiuxaDoWbTJtc1TR3BL+ouX5mSrPpH3mK/K+Jq3OdXCJssaV0+yjLDzFb9i6RpiiQDIOe2ER1l8tvnZxyA/eDHYdp6N8R/ghV3SlhCFtK3Lb8JSbYnIf0pQl3IHQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748648804; c=relaxed/simple;
	bh=f/RgEcBhBOkPZPGEoH8L5VEwKbNgnJK3zfEBTZ2DxGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNpcfNKOx2Jxhc/No74TGcNucZ+KDTsMFYy9Zfyu/lRjklgB/B7++tukS4ISyON374IroVBP1CevFJ7Qjz96a9mQJuadJmqDG7/NnpH1nSQIq7a6xHQLfMHAL8pODoPXiY4s3kLI/jNDbp0bDFk/itAPFbSVoDR2L2kByLa1jm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuP9upd/; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuP9upd/"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e6fc4b2cd3so179123137.2
        for <linux-sunxi@lists.linux.dev>; Fri, 30 May 2025 16:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748648802; x=1749253602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=;
        b=iuP9upd/VhqCI4pv/xk/balAQ/NhdxRQ6hLtyIafopoUHGHFq8gp0dM3YomZSiX9Mu
         OYmZ+76u8vOXjec6X24IDyJImnwJ1wjWRu9ZxZ+2KXFm9B6QJ8BmjLpWd8Tpwb5mIOmv
         9Wo5aqYl2XKJ9OXO8m02FB4+dNQ4hdEPgLE048m2CPK+JMe2KcPClRCuc/MhjpUzTGQ5
         B6TBWaeCyGTeDZ7gZMl7n7My/dTjfo8m2edk7ycRZb16yxHyuuk4gjLa53HZhc22Zm5v
         TvtJDet1LQYQ5YWGSpj6YrVckTzA5NOjfutpV+Ah/4LKxjSIhajl/bQYcs7AMFtJGlU1
         cvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748648802; x=1749253602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=;
        b=WHdJJLhZser0ABXDWFIr3YZFvCsJO3PKrWFy/5GN5DFF42JLRqlu76vyt1yiGM/7z0
         PyyErLU+/g3GROoLOg+wVyusWFEQwSDDvf9RveQkWQeDRg53h6c8Ux8UzDg0HpdbCpAi
         BKYTg14R/kHIIUa4nr59u/oHNC8ajGXjp1cnL1a6uQXmSs79z+ZkA1GwmE/pmzGJCvM8
         xQYRU3iy1DHqB3I5yqyPr618nkCHnZOfZDSGHKydsDBEidtjMGcYtGVunUajh6RsNhaI
         r90XTJEIIWkUj9xyETStrOzKCZp08HV//eicmDFJCgGaAyn+h3kadtaSszIXrt2bOZbu
         d2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkqhOtjyUqS7t3RKtKrJrpv3SdUhKVZnI/1RNJmIRKfjOc1SIzMLYPyfkV4ox+eIuu79weG6I7EkqiVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtUqlO4Q1lNXH3V0UT4eEARMaE4mSvtXZGcuIPs/y6f7mpHL3+
	ZW9/oncGM2Id60Ni9vjowLxEghdp23RJR2OHhQg6XLdkhPjRirRxfCxamGBNSuSFTMnIzxTgu5O
	cI5uyZsjeeAb8c3d/nLejoxpPROwJNyk=
X-Gm-Gg: ASbGncvyYCiBvQGVJs7DT/jAtsHQsz0BheUbCNndbQieE5Nt+2fh1dgB0COl4BD0Pbu
	L6o/h6BO67QScmMXzHKE3tb8oUEuRQeMZVMl8ZpcTFnya0gYOn6U4spHVMPwqmtBf+utcDfZJQr
	A4l5XW9fGgY0z/EjWc1MbQ6CEMzoHNXbry2w==
X-Google-Smtp-Source: AGHT+IGWYRqljBTNqRjcHJ1Qx5MgLEMU3w+EcX3w2i25x1ph1+e4wdYuKsPwq6FXpfXezjeuLLMkh2UEwUEoxLdnS0I=
X-Received: by 2002:a05:6102:41ab:b0:4e6:1a8c:13dd with SMTP id
 ada2fe7eead31-4e701bcd515mr59445137.7.1748648802024; Fri, 30 May 2025
 16:46:42 -0700 (PDT)
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
Date: Fri, 30 May 2025 17:46:30 -0600
X-Gm-Features: AX0GCFsAv-uR3T4qW04ZGESiTbXNp1RMaFKH2XrMAyyDm-M83KQe_2yzaPmKFXE
Message-ID: <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
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
> clocks/PWM/Reset controllers. That should have different compatibles,
> since they are not compatible. You then need phandles to these
> different clocks/PWM/Reset controllers, and for one of the PHYs you
> need a phandle to the I2C bus, so the PHY driver can do the
> initialisation. So i think in the end you know what PHY you have on
> the board, so there is no need to do runtime detection.

Hmm, thinking about this again, maybe it makes sense to just
do the runtime detection in the MFD driver entirely, as it turns
out the AC300 initialization sequence is largely a subset of the
AC200 initialization sequence(AC300 would just not need any
i2c part of the initialization sequence). So if we use the same
MFD driver which internally does autodetection then we can
avoid the need for selecting separate PHY's entirely. This at
least is largely how the vendor BSP driver works at the moment.

Would this approach make sense?

> What you might want however is to validate the MTD device compatible
> against the fuse and return -ENODEV if the compatible is wrong for the
> fuse.
>
>         Andrew
