Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D078F4B
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591780; cv=none; b=FzwECpPZDpB2bOOUqC4AkIF05UDKHw0sOtSm3hByXB5DZ3gPgj7vYVTDfmQ4Lvgg4qpMWwjIe0qjqhFHxu97ccHpPvFuO0zv9l890Huo3TkakqRmPRAU94t2fQLPzjvjXoMMs3nhXaf3eK4wNCBlkG9NpA0vk615ySivVcxBcz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591780; c=relaxed/simple;
	bh=l0t+c9VOElcgGwPJX41n44akw+bTfnQ6M36YJZwvlaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQMz/4v7wLF5vhJSWT7Zfk74CkE2u2feZYA5egQ2D7mw8e44KDiuk589tPVJQ4oPwWFPI5uRwASbT32whzTRpo9DCleG33FWtjJ8aA6dcGCzFfaBCAj8Td2m54xKlvZ7Gguh4n4mFeTGfzXl1N4L0c0D/uLRmnCwAhhx4a7Cgbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c461a45f8so21505671fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 07:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591774; x=1746196574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NR8AY7/r7j1Bynibp57ezAgc4LFEr9BMoNMHriAH6oo=;
        b=GU9N6r6/Lj9mM3Hmgmurxyd92iifzzWbyMFwjvf+XyxzQiSUqGJIuThKM3pdSM5/sA
         D36LRfR4RgcMenYxcLs/9OWbvZZpftomwi7X9NoY5XjxPHxkKWde0wiXmfec4AzWP6dR
         fQLvqnFR5DdVJZ/lImj/6f6cidRybYHk4gOe+I9GL09C/vccsFv91/RvrcoflhdUVEAB
         vRrlHschojieEDw87VIV4/R/sc6k2c/r8MXImVXD1R9rW73VQUOgShOsNgmn3ZCVVmQC
         7rTGE+/5bO1H50awF1uWM/QQA74uX2ERs0Bl5/h9rLNA0UwzAiEobSlRRI85VMNldNU5
         BE7w==
X-Forwarded-Encrypted: i=1; AJvYcCVzCW10PHddkOub2c/izRQqNu08tlMUps44GoUcRM50oDxYOcskWXjTWo77bJ057H7q7APfC2I/q7CT/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4QuLfk7/ZJV+uR2WdFPvtbjgoDn90n2MSy4nhclZqqw6fy9Gq
	S4+u1XFILXCnQzVoc1fm5pm1npo6a7RiZ5WXXMBZp3QttviO6ikQHtHVb90g5mQ=
X-Gm-Gg: ASbGnct/styUDrbWajtPbmsRf8WJmsmhlVzVPn4TsBx/ijenQLiBaX9WaFiXYC4Esnp
	0IaOCmxL6g5PooSG9ZC7KH1raURmM+uPatWErd/r7X71VdKaY8FouS2z0Mkaz63qMdK0rpDjJU3
	c+Tu221S/4/bMu5hORpNBQllC6wblDGg/2aCWidn2qSGKy+pqJPL3HVlEAO9vXVXC+sf+/FYLnz
	QW6oP/oysHe5VbCcQQEfy0+NCjjXdT8HD2y/JfF8YbBvgQ7pogyMl84iaDK0LNW/+5vaEkADVsA
	6Q7eRwUfNBAXTjLdv/LTToqeBEDBQ0dwRhn0BpUr4bI+LhvKZ6BKP3wXSu1Ijj45qiLRYKZrBg=
	=
X-Google-Smtp-Source: AGHT+IGsTXlKukhKps2N4tsw6HMCka6UUMqf7nXVqTxpM5/BO/ovzL/i52qfMJRaHtfIGPF2B8pmMA==
X-Received: by 2002:a05:651c:98b:b0:30d:e104:b67e with SMTP id 38308e7fff4ca-319080e24a8mr7576341fa.41.1745591773840;
        Fri, 25 Apr 2025 07:36:13 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a8285sm7687131fa.75.2025.04.25.07.36.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:36:13 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso22928511fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 07:36:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeYsjNKvUNDsoqAIRCtRl3RKH42mzk+7QzWD57FvmFYl2p5Oq/2tC3LqvDjBZeOiVAZlrCip+O6hYdlQ==@lists.linux.dev
X-Received: by 2002:a2e:bc22:0:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-31907611d07mr9058331fa.30.1745591772086; Fri, 25 Apr 2025
 07:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org> <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
 <20250425104128.14f953f3@donnerap.manchester.arm.com>
In-Reply-To: <20250425104128.14f953f3@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 22:35:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
X-Gm-Features: ATxdqUGytr4HbfY93aZiokaET82aJ2vi5Nhe3vDvbhoSCAK-s8uP_doJV3CtnsQ
Message-ID: <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 5:41=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Fri, 25 Apr 2025 13:26:25 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> > On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> > > including the A527/T527 chips. MAC0 is compatible to the A64 chip whi=
ch
> > > requires an external PHY. This patch only add RGMII pins for now.
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 40 ++++++++++++++++=
++++++++++
> > >  1 file changed, 40 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun55i-a523.dtsi
> > > index ee485899ba0af69f32727a53de20051a2e31be1d..c9a9b9dd479af05ba22fe=
9d783e32f6d61a74ef7 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > @@ -126,6 +126,15 @@ pio: pinctrl@2000000 {
> > >                         interrupt-controller;
> > >                         #interrupt-cells =3D <3>;
> > >
> > > +                       rgmii0_pins: rgmii0-pins {
> > > +                               pins =3D "PH0", "PH1", "PH2", "PH3", =
"PH4",
> > > +                                      "PH5", "PH6", "PH7", "PH9", "P=
H10",
> > > +                                      "PH14", "PH15", "PH16", "PH17"=
, "PH18";
> > > +                               allwinner,pinmux =3D <5>;
> > > +                               function =3D "emac0";
> > > +                               drive-strength =3D <40>;
> >
> > We should probably add
> >
> >                                   bias-disable;
> >
> > to explicitly turn off pull-up and pull-down.
>
> Should we? I don't see this anywhere else for sunxi, probably because it =
is
> the (reset) default (0b00).
> I wonder if we have a hidden assumption about this? As in: if no bias is
> specified, we assume bias-disable? Then we should maybe enforce this is i=
n
> the driver?

There isn't any assumption, as in we were fine with either the reset
default or whatever the bootloader left it in. However in projects at
work I learned that it's better to have explicit settings despite
working defaults.


ChenYu
