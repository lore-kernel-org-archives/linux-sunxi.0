Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD6330D407
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787405310; cv=none; b=h/u42Ds9288MAztbe7db5fkFlLIGe+2GH1eye4794Srb2qRmZc9oNo8PCuOBLEVoU3sLBe60bks+YaedYlewIURP2lnAgi9H1tdKflrrJK0sYpF8pQa6czq6gn6DGzTa0MUJ8lFuXzFXhxB8AYwxoUhdNJo9NvFp5f6yWzpRZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787405310; c=relaxed/simple;
	bh=m7DD9dOsH3PWhVCOCNoXLMBTKU96ktmMdcq53OIZdRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RP4H3zcLuof1YIarMszyJiPKG2WY/743nXEjdRlHnfyK1xD3JKWfaV5LaT5PnFsiQjXG0zp6W1PfpTi+8youjd5ShagYHlri2B9hkwx8060iLu8hCdKQQl1vNv/Z6lXtYjA5IyVV7kqdLgEwOC8atYV6327cTypfJN9jqT+L9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8nMztk3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8nMztk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A1B1F00A3A
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787405309;
	bh=wFfxLl20kSDo3Us12fAFz2HuaUjJctM7H+QOcQs3ss4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=K8nMztk3bpWTmT0IBzm6kFw39YyuyOVYWi1fk1j82jcKJCHvqS5WDHzmEjBTSuMi+
	 MF/D8tsCYMVcbRJ+7Syxm7ZDNOx7NXLqjNZYpHhhE9tvaXJiY65xmtsSxYNSSscyiS
	 EK2/L1KQhqbTcJ4Zzq+FjS0zeBJk5h5IQBegTCNWIkbgk6CWF3x5aVpMKU/ipOfcIg
	 ESrWinwFW1oqkXo9ni3i6I5Z/+PUxPZRH8pA0M0M94Icozwnzw1ZUjJvkdz2SB9oyA
	 q305ZlMGiFnqwmo4O2ZigMmJ56kYnRgQd9jZ8YxVpilwIvcTZVa7NRSFvA4R/nMhl7
	 /iV4iRySjEYSg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so17432801fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 06:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpTv3PeNM4tIffJLQG6iozvTL0sC8D4/1iKCMcmDSl36qWq0x+C2c338JIoAO1uQNnAXtcqQTsUchBOiw==@lists.linux.dev
X-Gm-Message-State: AFuF++kYlSi4MEdZUsrUpHcUvrcdo0IIVje3rVxB2bFqIHoL+n5fc4/x
	DmunI2kjjAP1zVu/+hu7imkNiuXgEj/VHL+gAauDJkc40agqzjK3p4QA8QIrZfK+w7Wnejn3Wwd
	rX4d2CD6c72QWaquDSiJA4g47OlxZGOI=
X-Received: by 2002:a05:651c:1541:b0:39f:ef09:bc55 with SMTP id
 38308e7fff4ca-3a1aeba25e5mr35860871fa.3.1787405307864; Sat, 22 Aug 2026
 06:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
 <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com>
In-Reply-To: <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 22 Aug 2026 21:28:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
X-Gm-Features: AcwNN1UAxn6NvziUzL3EQNY-lCnkxah-BXg-F8YFs2LgpelevGiVNkhT-XsLGVc
Message-ID: <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
Subject: Re: Bug: PHYS_OFFSET no longer points to DRAM physical starting
 address with CONFIG_ARM64_VA_BITS_52
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml@vger.kernel.org, 
	Jernej Skrabec <jernej@kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 8:50=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> Hello Chen-Yu,
>
> On Sat, 22 Aug 2026, at 15:39, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On the Allwinner H6 & H616 SoC (and likely others), if running a kernel
> > compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
> > PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but inst=
ead
> > points to 0xfff1000040000000.
> >
> >
> > I've observed this for quite some time but hadn't really nailed down wh=
at
> > was going on. For context: the IOMMU on these SoCs can only do 32-bit
> > addresses, and that's pretty fine since the SoC only supports up to 4 G=
B
> > DRAM. However the DRAM starts at 1GB offset in the physical address spa=
ce.
> > We want to be able to map the highest 1GB I/O virtual address space and
> > thus need to check if the physical address is within 4GB without the
> > offset. Having only 32-bits addressing, the address will wrap around fi=
ne.
> > So we check the address against PHYS_OFFSE, which breaks with the mangl=
ed
> > address.
> >
> >
> > I suspect this is the result of the following commits:
> >
> >     7bc1a0f9e176 arm64: mm: use single quantity to represent the PA to
> > VA translation
> >     9684ec186f8f arm64: Enable LPA2 at boot if supported by the system
> >
> > The first commit introduces a negative (wrapped around) offset to
> > memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and th=
e
> > second commit makes the offset dependent on hardware.
> >
> >
> > I hope that Ard and the maintainers can look into it and make PHYS_OFFS=
ET
> > always point to the physical start of DRAM.
> >
>
> On what basis are you claiming that PHYS_OFFSET must always point to the
> start of physical, non-secure DRAM?

AFAIK we've been using this since armv7 in our older drivers to deal with
PA <-> IOVA offsets. This was then concentrated into one interconnect
driver: drivers/soc/sunxi/sunxi_mbus.c

The driver applies PHYS_OFFSET as the DMA address offset for a class of
devices when the system is using an older device tree that lacks interconne=
ct
properties.


There's also Documentation/admin-guide/kdump/vmcoreinfo.rst which states:

ARM64
=3D=3D=3D=3D=3D

PHYS_OFFSET
-----------

Indicates the physical address of the start of memory. Similar to
kimage_voffset, which is used to translate virtual to physical
addresses.

> On arm64, PHYS_OFFSET is the physical address of the start of memory,
> where 'start of memory' =3D=3D PAGE_OFFSET, i.e., the start of the linear
> map. When running a 52-bit VA kernel on hardware that is not LPA2 capable=
,
> the hardware does not support mapping memory at PAGE_OFFSET, so it is mov=
ed
> upward in the linear map.

So it held true until 52-bit VA support was introduced?

> I don't quite follow why you need to compare with PHYS_OFFSET in your IOM=
MU
> driver: could you elaborate?

Our IOMMU only supports 32-bit of address space. On our SoCs, DRAM physical=
ly
starts at 0x40000000 (1 GB offset), meaning any physical DRAM above 3GB
would wrap around. However putting this number in drivers was discouraged
in the past and we were told to use PHYS_OFFSET (on ARMv7) instead. Also,
in the past there was this one chip that put DRAM at a different offset,
so using a fixed number in the driver won't always work.

Right now we're just blocking any physical address above 32 bits. Ideally
we want to allow up to "start of DRAM + 4GB". So we need to know the DRAM
start address. (And we probably want to block anything below start of DRAM
as well.)


ChenYu
