Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F9258A
	for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748468755; cv=none; b=hRdHQdZdmjLpWTRNtau5omAQxiEUs7eWRMPa9XsAUUn1P7jN82I4e+vDPBPt0ULtfQHlUP5SnslUpMeeuPRnL5dWOo37OzKdmd7GiQYyq+/QRq2MVXg3ZlmXZ4x8+rp9owTYVCXAgYlR66roWUh78Y0ZmyvvtI3U037Fc8w1a0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748468755; c=relaxed/simple;
	bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke6ECF/G+9wR2Bl/fJChg2lCnQna5lSQP/7E1iAz5tLylGC8GbD+KU53LtAjvtz08C0IvcmSREvJzDUIlDWgsiNHoCV5Iz91HdC3mmMkO53LmkM2G27fVVQq+i0MfwN+t9T95ENH4TlNr581YyHLj8ZudN2coXOHVDk+CMxd5As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfLleCun; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfLleCun"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52934f4fb23so141183e0c.1
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748468753; x=1749073553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
        b=UfLleCunUEkwTadVHilTqLQCThnVbJ718NSurg0cpyDYl/K/CLpw/gQfnU+I9iNpXx
         LiReF5xgvjG/Q38RyRCSirxPcDzbvBHe/39b6/RODRWIvtpi3k6Jrq9iic02wgfiIK0k
         NnnF9UPYQNAkYwOB6F/16Ug/ZEKQb3X/4Fui2UAoxFZypzet1FMlzvJrcS2otFmgkEwQ
         0Aspqc4i/QWWS2YrdE83MHvMabUXvyVQl17Dhh6Sv1m9ui3ia9cG/CpnmFkRYb2qzMf7
         9fndb9GHll0/S+BEa7tuOHJiavnRv17bKvYyCkLoqjWnhFYbyJpzzLF3twpMAzdx97D8
         vqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748468753; x=1749073553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
        b=fvrwYtXcfqVhlBMCDgsbF+bJntBPwfqcN93Q7NFdW9QKcLtj1CFVV3uae8KVLWA+Rd
         whFNQJezXXvJBGNuBQoAPxnltzj8wOYovBw+P624eD+vbKGgbW01XqEQRyAJ1CbqJ5Io
         m40jLQucNxWs5s0yTvtHt8ItNJjFWuW6TSSj/14tsHQwRYpFp+/9uKgAJR8Ru0k/qRV5
         jKKceZdt9Il1XU0GujA4A7FzKH1VdsdHA5J7SeGGbiL4KUMGHQ0q3dFDgXv3FgBajjw3
         4SdAFQCdcgAYZEZHFHNFvjZmBNThP29qpaX9rZRHnF5bPjNm/Egk9/EPuy28D3tmtIYj
         ql6w==
X-Forwarded-Encrypted: i=1; AJvYcCWnm9p/+75Ad8QusJHW/WXatZ1kNJCUaxi3B/SI/V40Y02NJU/U82rWrK4Ar3KXrT6u7dH7V283A/bPzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEhijaQLKxeeGFtMQ6/8sEKRUrFtKiNBneT6MBVi0ixHEpwDLP
	hh1b/aBrrlcenXE2wRHj1mbhtIYc4/sx7qsjnaq27lXM2n7f5aQLGxxnAcmzRa6XPiB45Yezg87
	dXGrRi2e8iEWi3kmVxBnftXrBOilrab0=
X-Gm-Gg: ASbGncuDww9xm1GFLgtsBuMlebyFVs0Rrdo9CXZWYL1zljQl28VeQApvCBN1cmar6oq
	AUoNOLsy7msFxpPr3EegpEm3+gtWDkX48RB/lryO3QiEsvtgBkbc3PnW6oRfZxDIolnxwIDkI/r
	E5hC60oqmXd6IOlW1vzJQRlEosU40A2QCasA==
X-Google-Smtp-Source: AGHT+IGpsHKYbxIXwCy/oeyiPruU2kwkLfCm0N6ezu9dQx6lfofizVF8mmR7cTBw0/YoCHcNbrcZCx1R7ipPXQVnY1Y=
X-Received: by 2002:a05:6122:6185:b0:52f:4624:35ef with SMTP id
 71dfb90a1353d-52f46243757mr6427374e0c.6.1748468753120; Wed, 28 May 2025
 14:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch> <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch> <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
 <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
In-Reply-To: <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 15:45:40 -0600
X-Gm-Features: AX0GCFsQQOiCt1aAs6THJH6hfyWkXOQcM4Hww3s0-x--VPr5n56VGuMBPUsnYgI
Message-ID: <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
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

On Wed, May 28, 2025 at 3:29=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Describe the one PHY which actually exists in device tree for the
> > > board, and point to it using phy-handle. No runtime detection, just
> > > correctly describe the hardware.
> >
> > But the boards randomly contain SoC's with different PHY's so we
> > have to support both variants.
>
> You have two .dts files, resulting in two .dtb files, which are 95%
> identical, but import a different .dtsi file for the PHY.
>
> You can test if the correct .dtb blob is used by checking the fuse. If
> it is wrong, you can give a hint what .dtb should be used.

How is this better than just choosing the correct PHY based on the
efuse?

> Or, as Russell suggested, you give the bootloader both .dtb blobs, and
> it can pick the correct one to pass to the kernel. Or the bootloader
> can patch the .dtb blob to make it fit the hardware.

This is what I'm really trying to avoid since it requires special
handling in the bootloader and therefore will result in a lot of broken
systems since most people doing ports to H616 based boards will only
ever test against one PHY variant.

> > > Do you have examples of boards where the SoC variant changed during
> > > the boards production life?
> >
> > Yes, the boards I'm working for example, but this is likely an issue fo=
r
> > other boards as well(vendor BSP auto detects PHY variants):
> > https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=3D=
1139
>
> Mainline generally does not care what vendors do, because they often
> do horrible things. Which is O.K, it is open source, they can do what
> they want in their fork of the kernel.

That's not really true IMO, mainline implements all sorts of workarounds
for various vendor hardware quicks/weirdness.

> But for Mainline, we expect a high level of quality, and a uniform way
> of doing things.

Sure, and I'm trying to do that here rather than do some super hacky
unmaintainable bootloader based device tree selector.

> This can also act as push back on SoC vendors, for doing silly things
> like changing the PHY within a SoC without changing its name/number.

It won't here, because Allwinner doesn't care about non-BSP kernels.
