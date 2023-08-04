Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33FCC2CF
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 14:48:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31771bb4869so2016257f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691160537; x=1691765337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN8A9mYHMUSzpwLCsjndAvOatiyxevrG4rZNW9RnBD8=;
        b=UbxFV6iEDf8BZo5PlZ0RER6V9nhmtulIsuCSOYEQiMT9wAGhYPcDns/oSY7brgxMrH
         eTCFuwzxOK/MmcHSsI+AAlAPMrrmN/9r8ygPrpJNMKjPdLOrwdclKGqecGvy1aDjzYYg
         PkhVrw4Szwo9txJnX7zRjQ6nXtwOp4gUEsjE8q7IEQNJMHV25QcrlPAV7RgWxgrPE1Km
         /aTSf+0cCIyNfsEKSQ2fG8JSEyOfSZxUZJhHnyUiaNZ6IAHHPmIwfo3poO9PuL0nsHNc
         g0vJB4cyrXM+2iuoidwxUjjY/DKVsaFW+CJ6uC6AQhUlAgA5l5WSmoAYqrSxOsb5gUQT
         yfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691160537; x=1691765337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN8A9mYHMUSzpwLCsjndAvOatiyxevrG4rZNW9RnBD8=;
        b=LenwSml3QwctvGZWhiW9wYDXnfogT+7z1MaGXYQzomA79JaIcajgwZb3VoBw9WLgaR
         dJekEc/I9BwS5vkB4PEPYH+E5cB/qb2eGMuwdAM5NbnOe9FkQ8zjdT2bsPVzqfNl5fJh
         mnwGWHXji3VJNuMbcB+pw0Eaud4ct93tT1uaed9nqeFcDDpxpJdnIj3gp5DWuZy40aJh
         7GK873o+drtL2qc/w58TFx0qV3tHJAVco58zuv4oqwmzn82+zfmYEcqwHJKDVwQ+J8qH
         XePGmxHCrM2deyxNy5HgjZEy+JBCU6HDIgAxzmOpKuJ2LiGofyRNJ0P0QM3StwB4p8ln
         IKwA==
X-Gm-Message-State: AOJu0Yy8/GxGcIS1SKbge5FTumPoY2Hjj/CVbs3hhsUAo+mTZRSZxRmT
	nY+eBtv46fk7GjS3WEu0VmU=
X-Google-Smtp-Source: AGHT+IECR5G/m3KGNK8itqMj7Bnz1simeoZBuU4tCBWIwRkFVpJMmnSqPocPr2sy5Kos6amA1F1L3w==
X-Received: by 2002:a05:6000:1284:b0:317:5a99:4549 with SMTP id f4-20020a056000128400b003175a994549mr1437844wrx.0.1691160536384;
        Fri, 04 Aug 2023 07:48:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j6-20020adff006000000b00317b0155502sm2731877wro.8.2023.08.04.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:48:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "MOESSBAUER, Felix" <felix.moessbauer@siemens.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "wens@csie.org" <wens@csie.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Matzinger, Manuel Josef" <manuel.matzinger@siemens.com>,
 "Bovensiepen, Daniel (bovi)" <daniel.bovensiepen@siemens.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Gylstorff, Quirin" <quirin.gylstorff@siemens.com>
Subject:
 Re: [PATCH 1/1] arm: dts: Enable device-tree overlay support for sun8i-h3 pi
 devices
Date: Fri, 04 Aug 2023 16:48:54 +0200
Message-ID: <2290668.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230804153029.7ac9a6e6@donnerap.manchester.arm.com>
References:
 <20230627133703.355893-1-felix.moessbauer@siemens.com>
 <5853794.MhkbZ0Pkbq@jernej-laptop>
 <20230804153029.7ac9a6e6@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 04. avgust 2023 ob 16:30:29 CEST je Andre Przywara napisal(a):
> On Thu, 03 Aug 2023 23:26:28 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi,
>=20
> > Dne torek, 01. avgust 2023 ob 13:59:49 CEST je MOESSBAUER, Felix=20
napisal(a):
> > > On Mon, 2023-07-31 at 10:53 +0100, Andre Przywara wrote:
> > > > Hi,
> > > >=20
> > > > On 31/07/2023 03:46, MOESSBAUER, Felix wrote:
> > > > > On Mon, 2023-07-31 at 00:12 +0200, Jernej =C5=A0krabec wrote:
> > > > > > Dne sreda, 19. julij 2023 ob 14:26:13 CEST je Moessbauer Felix
> > > > > >=20
> > > > > > napisal(a):
> > > > > > > On Tue, 2023-07-11 at 21:42 +0200, Jernej =C5=A0krabec wrote:
> > > > > > > > Dne torek, 27. junij 2023 ob 15:37:03 CEST je Felix
> > > > > > > > Moessbauer
> > > > > > > >=20
> > > > > > > > napisal(a):
> > > > > > > > > Add the '-@' DTC option for the sun8i-h3 pi-class devices.
> > > > > > > > > This
> > > > > > > > > option
> > > > > > > > > populates the '__symbols__' node that contains all the
> > > > > > > > > necessary
> > > > > > > > > symbols
> > > > > > > > > for supporting device-tree overlays (for instance from the
> > > > > > > > > firmware
> > > > > > > > > or
> > > > > > > > > the bootloader) on these devices.
> > > > > > > > >=20
> > > > > > > > > These devices allow various modules to be connected and
> > > > > > > > > this
> > > > > > > > > enables
> > > > > > > > > users to create out-of-tree device-tree overlays for these
> > > > > > > > > modules.
> > > > > > > > >=20
> > > > > > > > > Please note that this change does increase the size of the
> > > > > > > > > resulting DTB
> > > > > > > > > by ~30%. For example, with v6.4 increase in size is as
> > > > > > > > > follows:
> > > > > > > > >=20
> > > > > > > > > 22909 -> 29564 sun8i-h3-orangepi-lite.dtb
> > > > > > > > > 24214 -> 30935 sun8i-h3-bananapi-m2-plus.dtb
> > > > > > > > > 23915 -> 30664 sun8i-h3-nanopi-m1-plus.dtb
> > > > > > > > > 22969 -> 29537 sun8i-h3-nanopi-m1.dtb
> > > > > > > > > 24157 -> 30836 sun8i-h3-nanopi-duo2.dtb
> > > > > > > > > 24110 -> 30845 sun8i-h3-orangepi-plus2e.dtb
> > > > > > > > > 23472 -> 30037 sun8i-h3-orangepi-one.dtb
> > > > > > > > > 24600 -> 31410 sun8i-h3-orangepi-plus.dtb
> > > > > > > > > 23618 -> 30230 sun8i-h3-orangepi-2.dtb
> > > > > > > > > 22170 -> 28548 sun8i-h3-orangepi-zero-plus2.dtb
> > > > > > > > > 23258 -> 29795 sun8i-h3-nanopi-neo-air.dtb
> > > > > > > > > 23113 -> 29699 sun8i-h3-zeropi.dtb
> > > > > > > > > 22803 -> 29270 sun8i-h3-nanopi-neo.dtb
> > > > > > > > > 24674 -> 31318 sun8i-h3-nanopi-r1.dtb
> > > > > > > > > 23477 -> 30038 sun8i-h3-orangepi-pc.dtb
> > > > > > > > > 24622 -> 31380 sun8i-h3-bananapi-m2-plus-v1.2.dtb
> > > > > > > > > 23750 -> 30366 sun8i-h3-orangepi-pc-plus.dtb
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Felix Moessbauer
> > > > > > > > > <felix.moessbauer@siemens.com>
> > > > > > > > > ---
> > > > > > > > > Please note that I only tested the overlay on the sun8i-h=
3-
> > > > > > > > > nanopi-
> > > > > > > > > neo
> > > > > > > > > device. However, the devices are quite similar and in
> > > > > > > > > general
> > > > > > > > > the
> > > > > > > > > change to add symbols should be pretty safe. Similar
> > > > > > > > > patches
> > > > > > > > > have
> > > > > > > > > been
> > > > > > > > > applied to various other devices in the past without any
> > > > > > > > > negative
> > > > > > > > > effect (except for the increased size).
> > > > > > > >=20
> > > > > > > > I'm not a fan of this approach. What's wrong with letting
> > > > > > > > kernel
> > > > > > > > builders
> > > > > > > > specify this flag on their own at compile time? That way si=
ze
> > > > > > > > is
> > > > > > > > still
> > > > > > > > completely in domain of builder.
> > >=20
> > > At least the Debian maintainers decided to NOT include the -@ for all
> > > targets, but purely rely on what the kernel offers [5]. They motivate
> > > this with a similar decision made in the Kernel. This brings us back =
to
> > > my patch which enables the -@ for particular boards in the Kernel
> > > itself.
> > >=20
> > > [5] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D910727#28
> > >=20
> > > > > > > That's easier said than done. These symbols are only needed f=
or
> > > > > > > some
> > > > > > > targets (that are commonly used with overlays). But how should
> > > > > > > a
> > > > > > > general purpose kernel builder like Debian know which DT to
> > > > > > > build
> > > > > > > with
> > > > > > > symbols and which without? In Yocto the overlays are not real=
ly
> > > > > > > needed,
> > > > > > > as often the original dts is just patched directly.
> > > > > >=20
> > > > > > LibreELEC (distro I help with) has support for DT overlays for
> > > > > > some
> > > > > > time and
> > > > > > it was easy to enable symbols for all DTs with simple
> > > > > > "DTC_FLAGS=3D-@"
> > > > > > addition
> > > >=20
> > > > So why don't you use the U-Boot provided copy of the DTB? We sync t=
he
> > > > DTs regularly from the kernel repo to the U-Boot repo, and the U-Bo=
ot
> > > > build system builds all DTBs with overlay support already.
> > > > This also saves you from the hassle to actually find and load the
> > > > right
> > > > DTB, as it automatically comes as part of the U-Boot binary.
> > > > On the U-Boot prompt (or rather in a script) you would then do:
> > > > =3D> fdt move $fdtcontroladdr $fdt_addr_r
> > > > =3D> load <source> $fdtoverlay_addr_r <your_overlay>.dtbo
> > > > =3D> fdt apply $fdtoverlay_addr_r
> > >=20
> > > For systems that use u-boot this is a very convenient option. Thanks
> > > for bringing this up. However, there are other boot-chains where this
> > > is not an option.
>=20
> What other firmware / bootloader would those boards use then? And how wou=
ld
> the overlays be applied then? Can't the DTs then not be built with overlay
> support in this other firmware build process?
>=20
> > Also, with this argument no target in the Kernel
> >=20
> > > would need to be compiled with -@.
> > >=20
> > > My understanding was that adding the -@ is generally accepted if it is
> > > only done on a per-device basis (which this patch does), but not
> > > accepted for whole architectures. By that, I expect to see many simil=
ar
> > > patches in the future.
> >=20
> > I don't necessarly agree with this approach, but since other ways are
> > rejected, I'll merge this one if there are no further complaints.
>=20
> Well, I don't really mind too much, but I don't think this is sustainable:
> - The requirement to apply overlays is not really confined to just a few
> named boards, because anyone could find a reason why they would need to
> change something. So what about the
> sun8i-h3-emlid-neutis-n5h3-devboard.dts, for instance?

I completely agree with you on "not sustainable", but unfortunately catch a=
ll=20
solution with kernel config was rejected. I don't see any other option.

Best regards,
Jernej=20

>=20
> - I understand that this might sound like a broken record, but I still
> consider the whole idea of building DTBs through the *kernel* build
> system, then somehow deploying them along with the kernel and letting the
> board's firmware load them again as somewhat bonkers to begin with.
> Although by now it apparently became so ubiquitous that most people seem
> to accept this as a given.
>=20
> As the devicetree describes the device, it should be considered part of
> the firmware, so just integrating it into the firmware (SPL/bootloader) is
> the natural choice. And in this process you can choose to build with
> overlay support - which is exactly what U-Boot does.
>=20
> I consider the Linux kernel repository just the canonical place to store
> the DT files, although more for historic than for really good reasons.
> So building them using the kernel build system is more a matter of build
> testing and validation than something really to be used.
>=20
> Cheers,
> Andre.
>=20
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > Best regards,
> > Jernej
> >=20
> > > Cheers,
> > > Felix
> > >=20
> > > > You could also chime in on this U-Boot patch of mine, that loads and
> > > > applies all .dtbo files found in a given directory:
> > > > https://lore.kernel.org/u-boot/20230210110213.2531190-1-andre.przyw=
ara
> > > > @arm
> > > > .com/
> > > >=20
> > > > Cheers,
> > > > Andre
> > > >=20
> > > > > Thanks for the pointer. If this would be a kconfig option, I would
> > > > > agree. There's a patch to add this option, but this did not get
> > > > > accepted [3]. Just manually adding some "magic" options does not
> > > > > feel
> > > > > correct.
> > > > >=20
> > > > > > to build command [1]. Do you see any downside except knowing you
> > > > > > have
> > > > > > to
> > > > > > include it? On the upside, there is no need to patch each and
> > > > > > every
> > > > > > file and
> > > > > > kernel builder has a choice if overlays should be supported or
> > > > > > not.
> > > > >=20
> > > > > There is a similar feature request for Debian, but without a
> > > > > decision
> > > > > yet [4]. I just cross-referenced it to this thread.
> > > > >=20
> > > > > > Note that
> > > > > > in some cases overlays can be needed even in the case when board
> > > > > > doesn't have
> > > > > > expansion ports.
> > > > >=20
> > > > > If that is the case, why can't we at least add the patch from [3]
> > > > > and
> > > > > provide the distros an easy option to enable overlays? Once
> > > > > integrated,
> > > > > we can eventually get rid of all the per-device patches in the
> > > > > kernel.
> > > > >=20
> > > > > Best regards,
> > > > > Felix
> > > > >=20
> > > > > [3] https://www.spinics.net/lists/kernel/msg4252361.html
> > > > > [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D910727
> > > > >=20
> > > > > > Best regards,
> > > > > > Jernej
> > > > > >=20
> > > > > > [1]
> > > > > > https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/=
lin
> > > > > > ux/
> > > > > > package.mk#L213
> > > > > >=20
> > > > > > > There has been a discussion in 2017 to improve the situation =
in
> > > > > > > general, but without any final decision or implementation [1].
> > > > > > > By
> > > > > > > that,
> > > > > > > these patches got more and more common. I recently sent a very
> > > > > > > similar
> > > > > > > patch for a riscv board that got accepted [2].
> > > > > > >=20
> > > > > > > IMHO it is better to have these patches in the kernel instead
> > > > > > > of
> > > > > > > carrying different variants of this in each Linux distro. IMH=
O,
> > > > > > > the
> > > > > > > board vendors themselves should add this when they add a boar=
d.
> > > > > > >=20
> > > > > > > [1]
> > > > > > > https://lore.kernel.org/lkml/1502831736-28282-1-git-send-emai=
l-t
> > > > > > > rini
> > > > > > > @konsulk
> > =20
> >  o.com/ [2]
> > =20
> > > > > > > https://lore.kernel.org/linux-devicetree/20230627080620.32987=
3-1
> > > > > > > -fel
> > > > > > > ix.moess
> > =20
> >  bauer@siemens.com/
> > =20
> > > > > > > Best regards,
> > > > > > > Felix
> > > > > > >=20
> > > > > > > > Best regards,
> > > > > > > > Jernej
> > > > > > > >=20
> > > > > > > > > Felix Moessbauer
> > > > > > > > > Siemens AG
> > > > > > > > >=20
> > > > > > > > >   arch/arm/boot/dts/allwinner/Makefile | 19
> > > > > > > > >=20
> > > > > > > > > +++++++++++++++++++
> > > > > > > > >=20
> > > > > > > > >   1 file changed, 19 insertions(+)
> > > > > > > > >=20
> > > > > > > > > diff --git a/arch/arm/boot/dts/allwinner/Makefile
> > > > > > > > > b/arch/arm/boot/dts/allwinner/Makefile index
> > > > > > > > > 589a1ce1120a..eebb5a0c873a
> > > > > > > > > 100644
> > > > > > > > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > > > > > > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > > > > > > > @@ -179,6 +179,25 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
> > > > > > > > >=20
> > > > > > > > >          sun7i-a20-pcduino3-nano.dtb \
> > > > > > > > >          sun7i-a20-wexler-tab7200.dtb \
> > > > > > > > >          sun7i-a20-wits-pro-a20-dkt.dtb
> > > > > > > > >=20
> > > > > > > > > +
> > > > > > > > > +# Enables support for device-tree overlays for all pis
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-lite :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-bananapi-m2-plus :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-m1-plus :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-m1 :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-duo2 :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-plus2e :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-one :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-plus :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-2 :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-zero-plus2 :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-neo-air :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-zeropi :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-neo :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
> > > > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> > > > > > > > >=20
> > > > > > > > >   dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > > > > > > > >  =20
> > > > > > > > >          sun8i-a23-evb.dtb \
> > > > > > > > >          sun8i-a23-gt90h-v4.dtb \




