Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A56272E56
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115640; cv=none; b=NsG8TSFgbEfMh5dPEip++uFXhLpVxRry+lgQtZnUksgLaUX/n3/vyVDp0Dvzhp597Gqwka+RgRrPIYW1CLMgr1e4JcrABNjRUT1laLppbONSMwp7/3PaDCkQx9Oe1Nlk6iY6KW+r6Tj4vue2QtVr49s1dm5d5OyMS1ywx6aTDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115640; c=relaxed/simple;
	bh=vPaVPkElRKkI+lmUZzA09/LIbT0xt4R2+ENYZ4lLS5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raVozSS6rwLBPAASpTf6fWfvV9T5pFchsO6C0xVOEjJJxpBX3zxzl3mv+4xkT3Run1VQRqM9N6LnMDJm8H69DD5s+Xm16o92ExISn7uXoHUrSJ7twQLRkqqdst5QqyxEXBIRYpB6RuCpWj3Vyqkh8TDjlUvw7vJ+Xi9WQsI25pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=av5vx73b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="av5vx73b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71A2C2BCFF
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115639;
	bh=vPaVPkElRKkI+lmUZzA09/LIbT0xt4R2+ENYZ4lLS5g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=av5vx73bAiKuCKn/xuWqjVwaT8/gOojrPk8PuHYfDJPmDv2sqzpOCjrqr12AozgTg
	 XrkEMEGmCvvaWmRT829lw+MPzOZ2DuVr4NP7Jwl6sLbn3rlhTFUNQZD4MDs5N+Ucs7
	 h5M0utGAfqMK3Vej3dt7/13cw9omeP3AlJDxCLJJzfvWpya4vCDiFj3VeQWuCYrsCd
	 aD5Po0q3MAmZvQmZwZa7UhgupPx0t65QUeuRzCsFjTx1J3de2mHDYREOm386RkIyuF
	 IoT+XGcN/mSJEvqii7CY0gxUBQMTwdaCvGhIWpB+ytfy+5vt7ZgGflAiye15bz7zW1
	 PeL3nvmxWK2Hw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3942e9977a5so34599191fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 07:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ924zX1RMGdY+fn0xgrqR4bwGnMZ0Mv1ZkiM5xqEt0b2qlrNxzW3Ei25EZI8z4RcceUboE7yz38J+Qx/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWjs6b+PRb6FHyISs4Oe4O2XLk0Z7+a/mry3CRA3GeWf/hZ1Rk
	DEt9Ktzd2T/qPQEEe+MRpLqNvRk4qONEr6jtjhajYULoq9za+3jvT7ZQkEjAgtQM7haPmK/aPI7
	y5OqcQcPnSE0Y5oj4j12nVkEDOEBQSIA=
X-Received: by 2002:a05:651c:2215:b0:38e:58c7:cda with SMTP id
 38308e7fff4ca-3956089f9d7mr43916861fa.1.1779115638118; Mon, 18 May 2026
 07:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com> <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com> <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
In-Reply-To: <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 18 May 2026 22:47:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
X-Gm-Features: AVHnY4JuD0SObsLmoajC3ESMjVn3MS_VFZrbgNyTbswwAAsPI15UX8WD889AEwg
Message-ID: <CAGb2v65jpG-XXNjT46H2KnLoM_SHOatFw82u38ZGEELgXmvDtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Andre Przywara <andre.przywara@arm.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linux-sunxi@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:16=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Alexander,
>
> On 5/17/26 22:38, Alexander Sverdlin wrote:
> > Hi Andre,
> >
> > thanks for the quick feedback!
> >
> > On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> >>> @@ -0,0 +1,162 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>> +/*
> >>> + * Copyright (c) 2025 Arm Ltd.
> >>
> >> Please put your own copyright here, even if that has been largely copi=
ed
> >> from an existing file.
> >>
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +
> >>> +#include "sun50i-a100.dtsi"
> >>> +#include "sun50i-a100-cpu-opp.dtsi"
> >>> +
> >>> +/{
> >>> +   compatible =3D "baijie,helper-a133-core",
> >>> +                "allwinner,sun50i-a100";
> >>> +
> >>> +   aliases {
> >>> +           serial1 =3D &uart1;       /* BT module */
> >>
> >> Do we really need an alias for the BT UART? And is the BT module
> >> supported already? Then please add a child node to the UART node.
> >
> > That's the only thing I can do currently regarding BT: stabilize the
> > serial enumeration, because UART1 cannot be used for anything else
> > except BT module, because this is soldered inside "core" module.
> > We can avoid different tty enumeration, should the support for
> > BT be implemented in the future...
> >
> >> Isn't the WiFi/BT module on the SoM? Then please mention and enable MM=
C1
> >> here. Provide the child node for the WiFi chip, even if there is no
> >> upstream support in the kernel for it yet.
> >
> > So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> > has neither upstream driver, nor [upstream] DT bindings. Even github
> > driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> > pointless to me at this point to specify anything in the DT for the
> > chip which doesn't have the bindings idea even theoretically.
> >
> > Nothing in the current DT shall block any future work on the AW869A
> > support though and the above "aliases" entry shall even guarantee
> > unchanged serial enumeration shall such support arise.
>
> Fair enough for not providing DT nodes for those unsupported chips, but
> why do we need to force enumeration? For the eventual Bluetooth usage,
> the driver will find the respective serial interface by just looking at
> its parent interface. IIUC there is nothing referring to ttyS1
> explicitly. So we wouldn't really need an alias, would we?
> I see that some boards do define an alias, but others with Bluetooth
> don't, which I think is the right thing to do. Which name the kernel
> comes up with for UART1 shouldn't matter in any way.

It does provide a hint for any users enabling more UARTs and adding
aliases for them that they should number them starting from 2? And
just stable numbering overall.


ChenYu
