Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FB175A9D
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 13:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787406447; cv=none; b=b9DgGN1wKb/wc7Rh1TnDqpfcueXi7HBz6f/T5WXcykKFkhzvlpc+7DBwKitdFNwHmssL7C5mreKI+dJ6TNV67lNz9/NSB/sMeT+1I9WpZWO6J6aUtpF/axQx3wldJ+ai3vRLVl/s11kFPGHr8+sg7HWDhrBU/GsPw3YJWORD2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787406447; c=relaxed/simple;
	bh=L6rX9M4acDnxkvQVftI4/ft83riiTPrStCBTGwYQ8ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cd3IwZjm3VEf+jpdtVsg3e4hsvddohC60DkEaSVau7wHU2RhGp2pCq69CaYSPHolDfj/GfFh3tNGiX1IC5tpYUae0REjty8FbYxytiscHtzXP+XLLqLdSfbcUhfjQexKHWXl91JPCybOFi80OtwQJohRKFdTJRS63Yn+Iz5OwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAF9SGgH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAF9SGgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313871F00AC4
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787406446;
	bh=rNiQIaeGv6fReKS3E9ERO5rwoY38CfVv6u8jPT0yorY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=EAF9SGgHh0o7b487yXWY0fnEE04QhjEINRhOUokxAGEjoCtrbopZvCkSMz1tLxDJB
	 Gavm/Eie5QkLNWyDU1xqwgs3qZJvI9aqTNk+f1Abv+fVsQP+sIf6WosDYd3kC9G3RH
	 rMNVymsr56znMOnjfLXSzAXog42hjbCCpWbnsfSvJE0D3mhnDTs0B9oSQfV5oK0VlM
	 kkZkZseAaEoOu4fsqdTM9kFP7FyFLdK77bGjvzKc0bz+pH5wb4SKB6jYo3gdiEg3lH
	 t1+f6TOy96PFnh1dTAWonX+IbuLQ0MJq+fgCARYEEo+elIXw/wjRAZaHQfHo0H6xJU
	 bXkSIFIRGtPQg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so21669591fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 06:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrknY8qCYqdlqLHo+GdE07DKJcrRHKtfPtrQ961fWzlcMvNQzS5Y7mW4leRDcHVs7WQhfn0VK40aZ+sLw==@lists.linux.dev
X-Gm-Message-State: AFuF++nzRc529yGrubq6LzjAUw4t4Q2R93s9Qi+jwjHOBqjTcSNU0Nz4
	U5i8sB3VnnlCYGJGv9Z40+Yh9iosJk/STNB2Lu/PQqbuJAdzu+f3RD1P2lrEBUypnhHpckF0KGv
	NZ0aSwTY0XZhlglN5d3/NNw/Sm8A5whQ=
X-Received: by 2002:a2e:bd11:0:b0:39f:bc94:eba6 with SMTP id
 38308e7fff4ca-3a1c1ec43d8mr13126731fa.14.1787406444589; Sat, 22 Aug 2026
 06:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
 <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com> <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
 <c599d74d-81e9-4310-b739-7bdb2c43de2c@app.fastmail.com>
In-Reply-To: <c599d74d-81e9-4310-b739-7bdb2c43de2c@app.fastmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 22 Aug 2026 21:47:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v656c+7VfPhA6K58qXJvMJRm2geXD8GEzdUQvO5ApCSMbA@mail.gmail.com>
X-Gm-Features: AcwNN1WQyLFHbedA4lod8DRY1tPmbNPgs9n1CtBruCA_2842ze7QlHzyCfr7Irs
Message-ID: <CAGb2v656c+7VfPhA6K58qXJvMJRm2geXD8GEzdUQvO5ApCSMbA@mail.gmail.com>
Subject: Re: Bug: PHYS_OFFSET no longer points to DRAM physical starting
 address with CONFIG_ARM64_VA_BITS_52
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml@vger.kernel.org, 
	Jernej Skrabec <jernej@kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 9:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Sat, 22 Aug 2026, at 16:28, Chen-Yu Tsai wrote:
> > On Sat, Aug 22, 2026 at 8:50=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >>
> >> Hello Chen-Yu,
> >>
> >> On Sat, 22 Aug 2026, at 15:39, Chen-Yu Tsai wrote:
> >> > Hi,
> >> >
> >> > On the Allwinner H6 & H616 SoC (and likely others), if running a ker=
nel
> >> > compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
> >> > PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but i=
nstead
> >> > points to 0xfff1000040000000.
> >> >
> >> >
> >> > I've observed this for quite some time but hadn't really nailed down=
 what
> >> > was going on. For context: the IOMMU on these SoCs can only do 32-bi=
t
> >> > addresses, and that's pretty fine since the SoC only supports up to =
4 GB
> >> > DRAM. However the DRAM starts at 1GB offset in the physical address =
space.
> >> > We want to be able to map the highest 1GB I/O virtual address space =
and
> >> > thus need to check if the physical address is within 4GB without the
> >> > offset. Having only 32-bits addressing, the address will wrap around=
 fine.
> >> > So we check the address against PHYS_OFFSE, which breaks with the ma=
ngled
> >> > address.
> >> >
> >> >
> >> > I suspect this is the result of the following commits:
> >> >
> >> >     7bc1a0f9e176 arm64: mm: use single quantity to represent the PA =
to
> >> > VA translation
> >> >     9684ec186f8f arm64: Enable LPA2 at boot if supported by the syst=
em
> >> >
> >> > The first commit introduces a negative (wrapped around) offset to
> >> > memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and=
 the
> >> > second commit makes the offset dependent on hardware.
> >> >
> >> >
> >> > I hope that Ard and the maintainers can look into it and make PHYS_O=
FFSET
> >> > always point to the physical start of DRAM.
> >> >
> >>
> >> On what basis are you claiming that PHYS_OFFSET must always point to t=
he
> >> start of physical, non-secure DRAM?
> >
> > AFAIK we've been using this since armv7 in our older drivers to deal wi=
th
> > PA <-> IOVA offsets. This was then concentrated into one interconnect
> > driver: drivers/soc/sunxi/sunxi_mbus.c
> >
> > The driver applies PHYS_OFFSET as the DMA address offset for a class of
> > devices when the system is using an older device tree that lacks interc=
onnect
> > properties.
> >
>
> That sounds like a hack to me tbh.

There was little documentation around the actual interconnect, and the offs=
et
only really caused issues for devices with 2 GB DRAM, which was quite rare
back in the day. So the driver "workarounds" were added as issues were foun=
d.

> >
> > There's also Documentation/admin-guide/kdump/vmcoreinfo.rst which state=
s:
> >
> > ARM64
> > =3D=3D=3D=3D=3D
> >
> > PHYS_OFFSET
> > -----------
> >
> > Indicates the physical address of the start of memory. Similar to
> > kimage_voffset, which is used to translate virtual to physical
> > addresses.
> >
>
> This information is inaccurate. kimage_voffset is the offset between the
> kernel mapping in the vmalloc space and the associated physical memory.
> It has nothing to do with PHYS_OFFSET or with the start of memory.
>
> >> On arm64, PHYS_OFFSET is the physical address of the start of memory,
> >> where 'start of memory' =3D=3D PAGE_OFFSET, i.e., the start of the lin=
ear
> >> map. When running a 52-bit VA kernel on hardware that is not LPA2 capa=
ble,
> >> the hardware does not support mapping memory at PAGE_OFFSET, so it is =
moved
> >> upward in the linear map.
> >
> > So it held true until 52-bit VA support was introduced?
> >
>
> It still holds true.

Well, yes. I guess I meant the physical start of the linear map =3D=3D PHYS=
_OFFSET.

> >> I don't quite follow why you need to compare with PHYS_OFFSET in your =
IOMMU
> >> driver: could you elaborate?
> >
> > Our IOMMU only supports 32-bit of address space. On our SoCs, DRAM phys=
ically
> > starts at 0x40000000 (1 GB offset), meaning any physical DRAM above 3GB
> > would wrap around. However putting this number in drivers was discourag=
ed
> > in the past and we were told to use PHYS_OFFSET (on ARMv7) instead. Als=
o,
> > in the past there was this one chip that put DRAM at a different offset=
,
> > so using a fixed number in the driver won't always work.
> >
> > Right now we're just blocking any physical address above 32 bits. Ideal=
ly
> > we want to allow up to "start of DRAM + 4GB". So we need to know the DR=
AM
> > start address. (And we probably want to block anything below start of D=
RAM
> > as well.)
> >
>
> Should you be using memblock_start_of_DRAM() instead perhaps?

That seems like the thing we want. Thanks for the pointer, and sorry for th=
e
noise.


ChenYu
