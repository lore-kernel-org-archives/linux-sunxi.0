Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833FD80B
	for <linux-sunxi@lists.linux.dev>; Sat, 31 May 2025 00:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748649792; cv=none; b=pmNA+yE0Wp06YyH1fJ2CXV3S05ljBoMF+UXLWto6QFAfx5FeLK3P3yq57h7FIvefb+zLaJ9+prtmDtpHPSLMNQ+qwVRBZxWRxG0yLMHFpK7Xvotk3/zpxeul3whUCq5xzIErl+9uOTlisjjlqb5t8vpt61c/N806WSIYlt2csbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748649792; c=relaxed/simple;
	bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC7xZNL1qimZdOc0B9YcmTNEAOGIijIY+Y2xacVR93GzemICp8sTOIP0Y8qnVAjd25G2U7ngUu7WjEKztnhGk1txMVnBZNaSkXLtabKXDPuJn+72rDxFshu8yzFJMlTb7UJqourC7jwj2wXOlDswfZQuub0Def/iLwuSUIQC8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNUqzTFn; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNUqzTFn"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7cd0a7b672bso171942085a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 30 May 2025 17:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748649789; x=1749254589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
        b=bNUqzTFndo2xPkWS2xsv4PN3ln9qN3+kpCSfzMvYzxgubUCCc1fvARFXAz7Djke+yb
         cwCWPiczYvL+7RxpudwzNd0+wm55FATokK9JLHgnH6Q6HRzAJGYUtS3xXqyQsqTXidaA
         couv66H/k4Ip6W1dpQ+uwZaL7n7OhZyGnSCxLrCg7jPdLkDpI1CAXUTmxe2X7XEw+0WD
         Cih5MdO6Wx0dlijq5C1CDgS4t7CwqX5oYWeew8vE+q7Z6+/zs4uB/MFV3VEsgJ4uUhIA
         AqZG3XzsFJ1yRjJy4c5R18Gw2v07xt+oLrDFg1YobyOAbVxZU54uSf2hd3PEkuPrl1oy
         lW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748649789; x=1749254589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
        b=ODIna1+GpR/7VxsFnGp99iAXp3NDEOQwXIpf5cZPuvHIActL7+mm0d6ZCgImbkVneO
         z9Vr+gblD6dHa7gcWBV1Dlvu7jdYZmgQmK0Mm++f24PkPxOsU19kN3sf+BpILdD7nKzT
         6SApPifAIsvLs3qrwTiT9tDmp3K5bTFgoPnU19NDwza6y7d9jq3YfAZaDqsP5NVL2hvh
         OrrIN5SizK1XOqyj9kzqSMrIdDYvsw05XXi3MUn2vCtFPBizCk4m9ac8yfob0g4/iWWX
         kzoXAHyMTh7EkcJ/bDbe9Njqmbt/4dhR06ckfJt99OD2ZHV/xH4jraZpsm/UUgrNzSN9
         hD6A==
X-Forwarded-Encrypted: i=1; AJvYcCXdTZw/bGBu92ZD3UQF6Sy/XwLhho3kh8foglVYafCsOKgQ4qye1obmiXBzxpDjDkSpAR5sddp/GRXOSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqzb8B9uCybcL81sm9+naY5ZaPp/ZqxK8kIA8L3HtBgd9DFZeO
	JC1+/kiT1xvEGUsCHLlCARkErfackuo5xLQ2kuiaOvlQZU9rJy2CZt4CPj/n21vJNeMxYIrtL/I
	WPq2UexefAy/Iq4Fr6Il/QJapGlyhmmw=
X-Gm-Gg: ASbGncvEYMeY+2ar8/RNdJ7e8FihYfiD3WEasHnsN4ca5nPbPAPZtAh5wZNZJTS85jG
	p67pP9rK1DY4L8UFtZQ4yLXrHVk65MJtAVFcc6WnfWgJBJ4DCBpgHiJbCu1VwEPu8Ef+SAAG4s/
	prjDjsWNwEUilIO3ZsHq/TgE08iZ6tLjMEZQ==
X-Google-Smtp-Source: AGHT+IHYyJlGTtpjLfDS2korruhddZalmtfRzHquW+3WyYzNkhp5Cmo7Al9su+C9WS0W0IHm4jkhbhjqHsgACCoVWZw=
X-Received: by 2002:a05:620a:4508:b0:7ce:f58e:7e9c with SMTP id
 af79cd13be357-7d0eac3dc9bmr54414885a.7.1748649789320; Fri, 30 May 2025
 17:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
 <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
In-Reply-To: <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 18:02:58 -0600
X-Gm-Features: AX0GCFszR54VKhpbiCp7QT24c4JTQPW5wRggeGSsldqyRuwmihD2lRx7cFJ2K-I
Message-ID: <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 5:56=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 5/30/25 16:46, James Hilliard wrote:
> > On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> >>
> >> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> >>> On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> =
wrote:
> >>>>
> >>>> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> >>>>> Some devices like the Allwinner H616 need the ability to select a p=
hy
> >>>>> in cases where multiple PHY's may be present in a device tree due t=
o
> >>>>> needing the ability to support multiple SoC variants with runtime
> >>>>> PHY selection.
> >>>>
> >>>> I'm not convinced about this yet. As far as i see, it is different
> >>>> variants of the H616. They should have different compatibles, since
> >>>> they are not actually compatible, and you should have different DT
> >>>> descriptions. So you don't need runtime PHY selection.
> >>>
> >>> Different compatibles for what specifically? I mean the PHY compatibl=
es
> >>> are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
> >>
> >> You at least have a different MTD devices, exporting different
> >> clocks/PWM/Reset controllers. That should have different compatibles,
> >> since they are not compatible. You then need phandles to these
> >> different clocks/PWM/Reset controllers, and for one of the PHYs you
> >> need a phandle to the I2C bus, so the PHY driver can do the
> >> initialisation. So i think in the end you know what PHY you have on
> >> the board, so there is no need to do runtime detection.
> >
> > Hmm, thinking about this again, maybe it makes sense to just
> > do the runtime detection in the MFD driver entirely, as it turns
> > out the AC300 initialization sequence is largely a subset of the
> > AC200 initialization sequence(AC300 would just not need any
> > i2c part of the initialization sequence). So if we use the same
> > MFD driver which internally does autodetection then we can
> > avoid the need for selecting separate PHY's entirely. This at
> > least is largely how the vendor BSP driver works at the moment.
> >
> > Would this approach make sense?
>
> This has likely been discussed, but cannot you move the guts of patch #2
> into u-boot or the boot loader being used and have it patch the PHY
> Device Tree node's "reg" property accordingly before handing out the DTB
> to the kernel?

No, that's not really the issue, the "reg" property can actually be
the same for both the AC200 and AC300 phy's, both support using
address 0, the AC200 additionally supports address 1. In my example
they are different simply so that they don't conflict in the device tree.

The actual issue is that they have differing initialization sequences and
won't appear in mdio bus scans until after the initialization is complete.

> Another way to address what you want to do is to remove the "reg"
> property from the Ethernet PHY node and just let of_mdiobus_register()
> automatically scan, you have the advantage of having the addresses
> consecutive so this won't dramatically increase the boot time... I do
> that on the boards I suppose that have a removable mezzanine card that
> includes a PHY address whose address is dictated by straps so we don't
> want to guess, we let the kernel auto detect instead.

Yeah, I noticed this, but it doesn't really help since it's not the address
that's incompatible but the reset sequence, I'm having trouble finding
examples for mdio based reset drivers in the kernel however.
