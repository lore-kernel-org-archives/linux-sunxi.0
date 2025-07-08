Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF602DEA9A
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981296; cv=none; b=RMfnzVi9Z4r2XJKobOj0tirkptE8VYeMz+uO6xUTmDENCKumfjTjYazKGDJ+T/Z6NnASb5GXAL2T1j8CE0IRJh4hsn2dn6Mm+Slm6/6uUiImLQpSoEBiYqstAPVBb6ceRn8Z36g8C9o0pR5O3bE0wCxi0bhz6CkKMYOqo3EBi8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981296; c=relaxed/simple;
	bh=1yZpcF/YahkL+DH/T9SpJ6dHIKpkpWwhLdbkP3+hyJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFnwxfXK89Wurm3UlVLCdaRLwHXlCc7IxCrX1Q5bM9XGys/TM+ocADaH3S7jgj6Y/v7J8GmAJy4E9thwgsGV9o1nb6yjVfmYocvu4iAJ7Jc9PC8KUUoVLwoLLxPANqomX7eVblDZ0RlPNpCeBtPNZUvCRGLQoz6m0kbVXxklzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86d00ae076dso172440339f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 06:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981290; x=1752586090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwXr5JQBPkaBLHWGddnnrahSfTIk8BLpRxGvjvBeRX0=;
        b=l3yV3ev9qEkPjJUeHI04y4V3auEnYWLxOB+bbVBjAHmt7L9wINrQmh2g7Ojs5o5Qua
         ZAu8gaU4WQ/1F3UeUPzg+Ity3i/d1BKJBJSsPlRujJ6jb/Jk6DIFR02TYOg2WbJ9T8w/
         aKvqQmVdH9tvPvODmzSHo7xRNqugoM74F9adZerGoBeRRHrpnrkuNi4t7gH4etluzWsm
         9Fk7DyhchhazpUF03ZjJu9Brv29Ov676M+5gDBAufd7TQvF0tZiHnF3QYpjFSR8M8GHQ
         9H1t3jx+OCuX4wX6XKGqD8YouXEUzMdfOmkC6ce9OVzPwbP9KWwYtN46W6E4jCBinl1z
         nILA==
X-Forwarded-Encrypted: i=1; AJvYcCVHH2QZbQWdV5WTIWNCJNXc19Q2WTVpQhRfHne4xBCERpbkUUOMzirOXvgyqIQbeTM+DU/AmjPmD8uJ8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWPXZhSYbrp03xu7iWUwYtZuuz6vHH4tKg3ooPY9GgIrnWAtsH
	5yEnk3pQBH6fGh644WTSpx2WRvuQZiVNeZT7RIbIBe0Y1Ragnlq5beASrk6WHMaMZ6Q=
X-Gm-Gg: ASbGncsKmg70n7YJ+U2nOp6ug/pj2EFnwltjYYcb0NjDeV8iz/WZSNP251ZLRfw7tnn
	hKVd1zRNb2bOJI8dNMC1lG3XnxyABNk6j4Jj6Lx724ZDkC1iNHtHhs0zxUEpRxLz4dLAfJ/HQaz
	aTUv5RzWGn76v1CGuv4urD+24bnEt8vKDYCDe1E1T6nSSkE4128Ek8i6aDTkIXs9y5vmw1iScyk
	QGCLvocX5y1cvyXZZQUZekB0uJ5u5p9NSEDVPgWQbuOP4dXFFOhKKxmG+nu+ehsUIWy0kGRvz81
	GJVDkavQKS240YxgycatPEYQDTZVq7rVd90zPP5ZDyq8Ji88KTzlhBCoODsC+Kvn6cm7qkkNae+
	AqAgry2rqLtd867I=
X-Google-Smtp-Source: AGHT+IHfIInHIFTWamWcxNBPSOw4Tx4siB6EK7vn8cN7njgaUi9kK+KbSBKG9dVUCefWMI+uCafzUA==
X-Received: by 2002:a5d:845a:0:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-8794c5d2a89mr256135439f.7.1751981290430;
        Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b5c20329sm2154224173.108.2025.07.08.06.28.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-8794259ffe8so51622639f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU28TkaEYwpqbmDDiR0pOSFvyl/EJ2PBLGlSflBDkOGeTGjG3m8rvi8aO+JyPY0HRFUeH4auMUQyjhPbQ==@lists.linux.dev
X-Received: by 2002:a5d:94cd:0:b0:86a:441:25ca with SMTP id
 ca18e2360f4ac-8794c5a73e5mr262803939f.6.1751981289780; Tue, 08 Jul 2025
 06:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan> <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
 <aG0bqasOYUwwgiQY@collins>
In-Reply-To: <aG0bqasOYUwwgiQY@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 21:27:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vYEkKm8D_6r_O+fg_tR4zG1Loai1BPVO5AiE-MO=DJw@mail.gmail.com>
X-Gm-Features: Ac12FXxFG0byldtdYQU-R8wlvBgWN23RRGAX9zRQbdtbd5Tg1tBGYvUbeASjhVY
Message-ID: <CAGb2v64vYEkKm8D_6r_O+fg_tR4zG1Loai1BPVO5AiE-MO=DJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:22=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi,
>
> Le Tue 08 Jul 25, 16:18, Chen-Yu Tsai a =C3=A9crit :
> > On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > On Mon,  7 Jul 2025 18:51:55 +0200
> > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > >
> > > Hi Paul,
> > >
> > > > The Liontron H-A133L board features an Ethernet controller with a
> > > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > > >
> > > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > > order to let the MDIO core properly reset it before trying to read
> > > > its identification registers. There's no other device on the MDIO b=
us.
> > >
> > > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > > was struggling with putting it either in the MAC or PHY node, though
> > > conceptually it would still belong in the latter, I think. But this
> > > might be a more generic problem: for most other devices we activate
> > > reset and clock gates *before* trying to access them, though this mig=
ht
> > > be historically different for Ethernet PHYs.
> >
> > The phylib core has code to deal with reset GPIOs listed under the PHY =
node.
> > It might be worth checking why that doesn't work.
>
> While this code does exist, it's too early to be called when the mdio bus=
 is
> trying to probe the phy. I was also surprised the existing reset gpio sup=
port
> in the phylib core didn't take effect (that's how I tried to implement it=
 first)
> only to find that the code was never called. It's only called once the ph=
y was
> probed and registered.

OK, that's definitely weird. The code looked like it just walked the DT
and registered PHY devices, upon which the GPIO lines would be found and
toggled.

ChenYu

> Cheers,
>
> Paul
>
> > OOTH, there's no code to deal with regulator supplies for PHYs.
> >
> > ChenYu
> >
> > > > The datasheet of the PHY mentions that the reset signal must be hel=
d
> > > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay)=
 to
> > > > be on the safe side without wasting too much time during boot.
> > > >
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > >
> > > Despite the above, this looks fine, and works for me:
> > >
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > > Tested-by: Andre Przywara <andre.przywara@arm.com>
> > >
> > > Cheers,
> > > Andre
> > >
> > > > ---
> > > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++=
++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a=
133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > > index fe77178d3e33..90a50910f07b 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dt=
s
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dt=
s
> > > > @@ -65,6 +65,25 @@ &ehci1 {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&emac0 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&rmii0_pins>;
> > > > +     phy-handle =3D <&rmii_phy>;
> > > > +     phy-mode =3D "rmii";
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&mdio0 {
> > > > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > > +     reset-delay-us =3D <2000>;
> > > > +     reset-post-delay-us =3D <2000>;
> > > > +
> > > > +     rmii_phy: ethernet-phy@1 {
> > > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +             reg =3D <1>;
> > > > +     };
> > > > +};
> > > > +
> > > >  &mmc0 {
> > > >       vmmc-supply =3D <&reg_dcdc1>;
> > > >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > >
> > >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.
