Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7341D54D8
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100294; cv=none; b=gz0IiqSxJbELQsaNBL+H4rtinAUB6++3jqmIxzh0MOFHGrQBbHPtLl1GcHc4mdPYZFlvI4axfztLgB/WX+DQL85Cp6EZDZBsG5nEFMSZh8+Urg4bquWqQQuS46rYJY6657MRxT4+UklAfu50KWn+EpwVmPWsbAv2CNYat6jMzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100294; c=relaxed/simple;
	bh=Nned+2OXLAR4zbMBIAOqe5xsNi80BA2aVmJkwOizo/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKkKMNM92gvEoO3E2qzk6/2aTQEep3zJt5rTwSJ4zOgT8H+kTH8OMqRmtmm1KKMnN5+YxtKdWaGmJka/Y+lz34n6I9enah+wmuqQFi1iyi0Zhd50JobfEZpGH25WwpBV26KmSvkmBrS3x/IqzWAcxBvRcgR379t+J2ak5gtGLRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/jlqWEG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/jlqWEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FE4C4CEFC
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755100294;
	bh=Nned+2OXLAR4zbMBIAOqe5xsNi80BA2aVmJkwOizo/A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=i/jlqWEG2qrnzPbOAkn2pwy/ONAMApmORy6Hcv9pxZFQVqswqUP1H+G1evZke+33I
	 FJ6/+D/0HY40qcpoM/rkOknERVPvGNGN3fUmcTkfaKj5Ob06Ind2VR6bmjGC16sDV0
	 ogmjo0Y6BnY9SMKqN0w9ZOX0VXvj3d3tayjvpxXem+zc/hwV3xFYbzVAkX0RX6mkDt
	 4bcHHoBWDLQ2KF7fb3q77jgK8QzoWmHM6+T/aEXR1jjpW0JqhwtNEYftLG40UN9wOQ
	 DrxQiQsDQMPq1MvBwXuiGXcZYLD1Q/JZldBn7EHyTBz7a2IFCzJPzgFXqkNgsw0dJc
	 5KBKkl10clslA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3322a34e84fso57752801fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaog1/Xv6HCm4VVVpyfznX0GQoVVKAzpgF+uoOGPlgZ6dG9tSMcxxoo0pWJ5+cndry0srNX/qoC3pitg==@lists.linux.dev
X-Gm-Message-State: AOJu0YysNCP5v9/8HPaWUsK1mzUvcb3FuhoqPUD3+ztmd9ei4uW9c+HR
	H0cH82TPaGISaUAehCxyvTKjt9gy3saAdGKMQB6tsa5G6JmJ1JU3oIAX42jenXfuQGBY2rxqjxo
	DBrNczpQMln2AnQAJb4VukROVgXO8IyY=
X-Google-Smtp-Source: AGHT+IF/AlFvjXg9axEmXPnPSPFeb7xCGFHKQ17NbUjRATjXnSeff8Hv94XSiaaI3kXUimdVd3Yinhj/CTkIyHUENJo=
X-Received: by 2002:a05:651c:20cf:20b0:332:6304:3076 with SMTP id
 38308e7fff4ca-333e9548740mr7131671fa.1.1755100292240; Wed, 13 Aug 2025
 08:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813145540.2577789-1-wens@kernel.org> <20250813145540.2577789-7-wens@kernel.org>
 <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk>
In-Reply-To: <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 13 Aug 2025 23:51:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
X-Gm-Features: Ac12FXym9NQN41ia2Vqvuf9FmKIFWMrTnliSDOIAEvwEtKHt0VT0y1bsZEx7Lbg
Message-ID: <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 06/10] arm64: dts: allwinner: a527: cubie-a5e:
 Add ethernet PHY reset setting
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 11:12=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Aug 13, 2025 at 10:55:36PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > index 70d439bc845c..d4cee2222104 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > @@ -94,6 +94,9 @@ &mdio0 {
> >       ext_rgmii_phy: ethernet-phy@1 {
> >               compatible =3D "ethernet-phy-ieee802.3-c22";
> >               reg =3D <1>;
> > +             reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> > +             reset-assert-us =3D <10000>;
> > +             reset-deassert-us =3D <150000>;
>
> Please verify that kexec works with this, as if the calling kernel
> places the PHY in reset and then kexec's, and the reset remains
> asserted, the PHY will not be detected.

I found this to be a bit confusing to be honest.

If I put the reset description in the PHY (where I think it belongs),
then it wouldn't work if the reset isn't by default deasserted (through
some pull-up). This would be similar to the kexec scenario.

Whereas if I put the reset under the MDIO bus, then the core would
deassert the reset before scanning the bus.

It's confusing to me because the code already goes through the MDIO bus
device tree node and *knows* that there are PHYs under it, and that the
PHYs might have a reset. And it can even handle them _after_ the initial
bus scan.

Describing the PHY reset as a bus reset IMHO isn't correct.


ChenYu
