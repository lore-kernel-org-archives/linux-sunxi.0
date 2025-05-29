Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED382DCBE3
	for <linux-sunxi@lists.linux.dev>; Thu, 29 May 2025 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748478677; cv=none; b=eOiB4DxfjavVLXhiK12xOjPWxl9/F6jZ3qXzU+YD8lNAvUXF2DMKT/CrDWtIZ/61fV1FKj2r9bkHrq5gvZXuq4OT4/dOT3q89QR3OLzZlx37l2m8/dqzF5RzFPc7mwYbyicJMW2n3x9b9mVdbVvKTrh2eZ8YytqbfAhAadIToUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748478677; c=relaxed/simple;
	bh=q44z5Bd9/8IILONn0/cL0CaXO9i2aVCCm5R3K/3l5Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqxzs/049lp+K+iuPTr9zosjiSO8+tq7mCWsdYsYNh/zeOxWgZLnCCys0hQrU92DFsbzfKXQnGDbA4N7ttpZ+I8lIYoXlDPnzkitSwsYGznRjL+hBVCrRkIq39ZOK6DfpYt4Nzmnn/7wgmRvBkHWN01JD1lmQDxpD+QOoJ1gRtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7K39sTI; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7K39sTI"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e5995828d1so215167137.0
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 17:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748478675; x=1749083475; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q44z5Bd9/8IILONn0/cL0CaXO9i2aVCCm5R3K/3l5Mo=;
        b=h7K39sTIez8A95fHerrRhxBp+/qYO7q5qvXK+9FNthBBu8h2ALGylzI8ecdbWOg287
         Er3a8pvLjAbWgXN1r6gJKPUFvab4qm7X7eOwHug5nip0bF8mqQ7nHkbSCi17zZBPmK4t
         iK+PUEW2vTgyyNIkWE99sKlk9hxBDguh+jFGiLcK63IVuIGUMr6mXRXsX4e15o0VkVcm
         PTtDaxwuudOGDMscNLc7uIoM7Ie4O5lezEQg1Ej/Ws73we7fymDlrX+yNt73bqBmybJI
         X6z1/whWHd5rhvXWkIitgspR9IznUajoSGPYC1T+d2kK6NUiEtuA4Fx2k0fxke8YhZU1
         nlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748478675; x=1749083475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q44z5Bd9/8IILONn0/cL0CaXO9i2aVCCm5R3K/3l5Mo=;
        b=N3/4n6ZVtcpnEjKPNoW3UhVW2ZDr8S6o2r5y8ygoR1zuSwr9F+yof/d/DiZbiOwLlw
         ZJJb2fWZpoF5r3Ua4cicbMg0Pf/mbyjR3Cgm2r54vFz0mm92c5icoTUlxlmDvM4knt48
         44iloRIwfBh2oCEWE3ayd1VV3J9IWXeWHn7WhGbk67+o58JeF7Zzdmpn6XIxIgvT9NMe
         V467BX8K0KQmidbnSmEMMpVv65J3VBtjYejCj/3XjduhdQYxMw62qyZjbPFBQGSFeBeq
         AbGXVXNTcJ8njvjpSusTSE/FHkkGFsyp56sNCU9w81+NMDzgewzcGggTIwZdTKrY06gZ
         +e+A==
X-Forwarded-Encrypted: i=1; AJvYcCWdyaDeoOO17Xt6JAw13ZyciQ4W3uSDPN7V7iR+gwrVCOLKRnA6CCJYGDwE9FpQcqqbizp4JLPRGj4YUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQNiTRl2i+HT+D2phG3YcPCInxN/3/oVP71S8Kr48OghQfEZVs
	8UDUlNhUbiPj4qwvkUzN4LW0VNJNM3VBwyjZ3kjlL2IFQfc0Lx461GT7zuyb8LsZlTfV2n40A9R
	Ve5YnKa/+VzusUkq9d2hGh5KoHPFgfuQ=
X-Gm-Gg: ASbGncsY78gsuQMwpD0OQfEyOBpUqnSrLaCKe3qAerTpenbLiLUBuPAaiKt7HnM/jvU
	8d/KGrBDbUndIazmNfooVMZ84gMpUtq7QBsGKI/nxWoH7L4A1Q5nPikhzt6BIpbwY1rhg+o9Lp4
	WjhB/+CDNw3PlsIQ/9e2uxtYfUBvcNcD6gkA==
X-Google-Smtp-Source: AGHT+IFG095fC3FxIkcr8wXE/8rgaYSmXktT8c+7Ug5Ck8RJXbeQXCBHRZraCpMc7Swq4SZENwhJZHvYWPtIc5+DC5Q=
X-Received: by 2002:a05:6102:a51:b0:4db:e01:f2db with SMTP id
 ada2fe7eead31-4e67dd1919bmr264553137.0.1748478674832; Wed, 28 May 2025
 17:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch> <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch> <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
 <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch> <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
 <0c7a1602-61d3-4840-83f2-72a74ffd52b8@lunn.ch>
In-Reply-To: <0c7a1602-61d3-4840-83f2-72a74ffd52b8@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 18:31:03 -0600
X-Gm-Features: AX0GCFvqUXpScx-Ym-AQvb--BAqo5_tl8KEywhB2ivVxb9ECD-mfCTp-d4WPAIs
Message-ID: <CADvTj4q96aGsPi6wfMaxTnC-52-Svu_K6raj=LWyOJd+DniEUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 5:47=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Or, as Russell suggested, you give the bootloader both .dtb blobs, an=
d
> > > it can pick the correct one to pass to the kernel. Or the bootloader
> > > can patch the .dtb blob to make it fit the hardware.
> >
> > This is what I'm really trying to avoid since it requires special
> > handling in the bootloader and therefore will result in a lot of broken
> > systems since most people doing ports to H616 based boards will only
> > ever test against one PHY variant.
>
> Which in some ways is good. They will then issue four letter words at
> Allwinner, and go find a better SoC vendor.

No, they won't, because the vendor that actually buys from Allwinner
also uses the BSP and doesn't care as long as the BSP works.

>
> > > > > Do you have examples of boards where the SoC variant changed duri=
ng
> > > > > the boards production life?
> > > >
> > > > Yes, the boards I'm working for example, but this is likely an issu=
e for
> > > > other boards as well(vendor BSP auto detects PHY variants):
> > > > https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?I=
D=3D1139
> > >
> > > Mainline generally does not care what vendors do, because they often
> > > do horrible things. Which is O.K, it is open source, they can do what
> > > they want in their fork of the kernel.
> >
> > That's not really true IMO, mainline implements all sorts of workaround=
s
> > for various vendor hardware quicks/weirdness.
> >
> > > But for Mainline, we expect a high level of quality, and a uniform wa=
y
> > > of doing things.
> >
> > Sure, and I'm trying to do that here rather than do some super hacky
> > unmaintainable bootloader based device tree selector.
> >
> > > This can also act as push back on SoC vendors, for doing silly things
> > > like changing the PHY within a SoC without changing its name/number.
> >
> > It won't here, because Allwinner doesn't care about non-BSP kernels.
>
> It can be indirect pressure. There are some OEMs which care about
> Mainline. They will do their due diligence, find that user report
> Mainline if flaky on these devices, and go find a different
> vendor.

There are zero OEMs in my industry that provide hardware with
any mainline support at all. The vendors are outright hostile to 3rd
party firmware and put significant effort into preventing 3rd party
firmware. The OEMs will view the lack of mainline support as a bonus
unfortunately as they like everything locked down.

> There will be some OEM which get burnt by this mess, and when
> they come to their second generation device, they will switch vendor
> and tell the old vendor why. It could well be Allwinner can support
> their bottom line without caring about Mainline, so really don't
> care. But Mainline can help point OEMs away from them to those which
> are more Mainline friendly.

The OEMs in my industry will not change due to a lack of mainline
support, they have no interest in mainline support, they only care
that their products work well enough to sell, and since there is
little competition

> We also need to think about this as a two way street. What does this
> SoC bring to Mainline? Why should Mainline care about it?

The H616 is used in a number of development boards(orangepi and
such) and TV boxes, having decent mainline support at least allows
downstream integrators to have a chance at improving the situation
regardless of vendor cooperation, maybe the SoC vendor will
eventually care if people are actually using mainline kernels more.

> It has some
> major design issues, do we want to say that is O.K? Do we want other
> vendors to think we are O.K. with bad designs?

I mean, it's a second source issue for the PHY, less of an outright
design issue and more likely was just some cost optimization.

If we excluded all vendors with bad designs then Linux would have
far less hardware support.

> Worse still, this is
> stmmac, which lots of vendors already abuse in lots of different
> ways. Russell has put in a lot of effort recently to clean up some of
> that abuse, and we are pushing back hard on new abusers.
>
> If you can hide this mess away in the bootloader, it just looks like a
> regular device, we are likely to accept it. If you try to do something
> different to the normal for PHYs, we are very likely to reject it.

I'm confused, the kernel isn't the bootloader so how can it be accepted
by the kernel if the implementation is not in the kernel? Linux supports
plenty of weird hardware so I really don't see why having a quirk for
this specific board is such a problem as long as the quirk doesn't
introduce maintainability issues.
