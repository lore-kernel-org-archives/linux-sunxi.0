Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F072591C
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 21:26:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe24dd8898so14442005e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Aug 2023 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691097990; x=1691702790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBRjKE1fezP7Qj9XxCC3l9aVaR52CFdGAfl2ARBhmN0=;
        b=G4KiprO4JbtIbOz02WB/QuRpFlYSicft5qDDxF4Yl4BfetrvyQ56HApZLSFD0/Wd6q
         ezfWiM0B/gr1SuJke5otiDweLBN2k9Exc2hgnrDqt/PsxjEu9DY0+OAiQimn09zp9HbJ
         megE24KG/Mc9KYoWBFhYf0GMTJg4HYns00QwH35pAvCiG2C+AsH/EokoT2PJgN7FbIiY
         lW2sFPE0ZTvGHqmNj2vGixvfor8TikWFkhFXqmoFsLz8sB5TyjEHkPDVmESvumCREmoe
         /utUaaFThqDHfYfkv6/Y2WHHgfwZbfHe3jNgMR7jhQGFXQNsGkGqYYjJG87FfV0PxL/V
         HXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691097990; x=1691702790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBRjKE1fezP7Qj9XxCC3l9aVaR52CFdGAfl2ARBhmN0=;
        b=JppY5sRC4WvCGxc84Zyesa4+X7EtX2MgMtoabcrJCD3vei0gpWWB1T+g5Kr3Oa/ZHp
         E+BSxTP9yR8CRJaUlaO6WAi93e7OOnB4Q9njOZVhYJNANnOlLSVdRgaZS4Z73tSqTCdD
         nj11XhCdeWAKAKzup8zQaCB9oRkCuzMUP/e3h/UbPtPSPXG6x8df4KPyU/6oUcEoNeMl
         EWryxN6CSuF0hlHxeA8gpnvQjxHzjRCCDk5E3w3Ds18yWbgMtEUU4x3GsSZ3jAmZqFlk
         QvHfQ8FzG4vUKTu3Il/gV9QvSuaTpz/rt7M1CEszpHbagGePWRAUxII4wGt95+qxyOHk
         E7iA==
X-Gm-Message-State: AOJu0YyK8Gj5ngZ4Yfuxv8E+O7PAgkjE+06WaXt70nRZAipK44SUgVis
	L9aGkgUzZOtA+DFMEBvkc/OSLtMQJPooYw==
X-Google-Smtp-Source: AGHT+IHtdRkLoHSf3TFKKRRNeT+Z1T2leIj7MIDxsj4R0YHOQzcfmmkNnoCPH4tXYV/RzZBK2VIPfA==
X-Received: by 2002:a05:600c:3794:b0:3fe:2102:8085 with SMTP id o20-20020a05600c379400b003fe21028085mr11947wmr.8.1691097990175;
        Thu, 03 Aug 2023 14:26:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k18-20020a7bc412000000b003fbbe41fd78sm753001wmi.10.2023.08.03.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 14:26:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "andre.przywara@arm.com" <andre.przywara@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "MOESSBAUER, Felix" <felix.moessbauer@siemens.com>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
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
Date: Thu, 03 Aug 2023 23:26:28 +0200
Message-ID: <5853794.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <2dcc90f8329fe0f3306b8c2a6a1ab17fe1fc48c9.camel@siemens.com>
References:
 <20230627133703.355893-1-felix.moessbauer@siemens.com>
 <a137cb78-f687-e9c6-e6f3-27be92c19da3@arm.com>
 <2dcc90f8329fe0f3306b8c2a6a1ab17fe1fc48c9.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 01. avgust 2023 ob 13:59:49 CEST je MOESSBAUER, Felix napisal(a):
> On Mon, 2023-07-31 at 10:53 +0100, Andre Przywara wrote:
>=20
> > Hi,
> >=20
> > On 31/07/2023 03:46, MOESSBAUER, Felix wrote:
> >=20
> > > On Mon, 2023-07-31 at 00:12 +0200, Jernej =C5=A0krabec wrote:
> > >=20
> > > > Dne sreda, 19. julij 2023 ob 14:26:13 CEST je Moessbauer Felix
> > > > napisal(a):
> > > >=20
> > > > > On Tue, 2023-07-11 at 21:42 +0200, Jernej =C5=A0krabec wrote:
> > > > >=20
> > > > > > Dne torek, 27. junij 2023 ob 15:37:03 CEST je Felix
> > > > > > Moessbauer
> > > > > >=20
> > > > > > napisal(a):
> > > > > >=20
> > > > > > > Add the '-@' DTC option for the sun8i-h3 pi-class devices.
> > > > > > > This
> > > > > > > option
> > > > > > > populates the '__symbols__' node that contains all the
> > > > > > > necessary
> > > > > > > symbols
> > > > > > > for supporting device-tree overlays (for instance from the
> > > > > > > firmware
> > > > > > > or
> > > > > > > the bootloader) on these devices.
> > > > > > >=20
> > > > > > > These devices allow various modules to be connected and
> > > > > > > this
> > > > > > > enables
> > > > > > > users to create out-of-tree device-tree overlays for these
> > > > > > > modules.
> > > > > > >=20
> > > > > > > Please note that this change does increase the size of the
> > > > > > > resulting DTB
> > > > > > > by ~30%. For example, with v6.4 increase in size is as
> > > > > > > follows:
> > > > > > >=20
> > > > > > > 22909 -> 29564 sun8i-h3-orangepi-lite.dtb
> > > > > > > 24214 -> 30935 sun8i-h3-bananapi-m2-plus.dtb
> > > > > > > 23915 -> 30664 sun8i-h3-nanopi-m1-plus.dtb
> > > > > > > 22969 -> 29537 sun8i-h3-nanopi-m1.dtb
> > > > > > > 24157 -> 30836 sun8i-h3-nanopi-duo2.dtb
> > > > > > > 24110 -> 30845 sun8i-h3-orangepi-plus2e.dtb
> > > > > > > 23472 -> 30037 sun8i-h3-orangepi-one.dtb
> > > > > > > 24600 -> 31410 sun8i-h3-orangepi-plus.dtb
> > > > > > > 23618 -> 30230 sun8i-h3-orangepi-2.dtb
> > > > > > > 22170 -> 28548 sun8i-h3-orangepi-zero-plus2.dtb
> > > > > > > 23258 -> 29795 sun8i-h3-nanopi-neo-air.dtb
> > > > > > > 23113 -> 29699 sun8i-h3-zeropi.dtb
> > > > > > > 22803 -> 29270 sun8i-h3-nanopi-neo.dtb
> > > > > > > 24674 -> 31318 sun8i-h3-nanopi-r1.dtb
> > > > > > > 23477 -> 30038 sun8i-h3-orangepi-pc.dtb
> > > > > > > 24622 -> 31380 sun8i-h3-bananapi-m2-plus-v1.2.dtb
> > > > > > > 23750 -> 30366 sun8i-h3-orangepi-pc-plus.dtb
> > > > > > >=20
> > > > > > > Signed-off-by: Felix Moessbauer
> > > > > > > <felix.moessbauer@siemens.com>
> > > > > > > ---
> > > > > > > Please note that I only tested the overlay on the sun8i-h3-
> > > > > > > nanopi-
> > > > > > > neo
> > > > > > > device. However, the devices are quite similar and in
> > > > > > > general
> > > > > > > the
> > > > > > > change to add symbols should be pretty safe. Similar
> > > > > > > patches
> > > > > > > have
> > > > > > > been
> > > > > > > applied to various other devices in the past without any
> > > > > > > negative
> > > > > > > effect (except for the increased size).
> > > > > >=20
> > > > > >=20
> > > > > > I'm not a fan of this approach. What's wrong with letting
> > > > > > kernel
> > > > > > builders
> > > > > > specify this flag on their own at compile time? That way size
> > > > > > is
> > > > > > still
> > > > > > completely in domain of builder.
>=20
>=20
> At least the Debian maintainers decided to NOT include the -@ for all
> targets, but purely rely on what the kernel offers [5]. They motivate
> this with a similar decision made in the Kernel. This brings us back to
> my patch which enables the -@ for particular boards in the Kernel
> itself.
>=20
> [5] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D910727#28
>=20
>=20
> > > > >=20
> > > > > That's easier said than done. These symbols are only needed for
> > > > > some
> > > > > targets (that are commonly used with overlays). But how should
> > > > > a
> > > > > general purpose kernel builder like Debian know which DT to
> > > > > build
> > > > > with
> > > > > symbols and which without? In Yocto the overlays are not really
> > > > > needed,
> > > > > as often the original dts is just patched directly.
> > > >=20
> > > >=20
> > > > LibreELEC (distro I help with) has support for DT overlays for
> > > > some
> > > > time and
> > > > it was easy to enable symbols for all DTs with simple
> > > > "DTC_FLAGS=3D-@"
> > > > addition
> >=20
> >=20
> > So why don't you use the U-Boot provided copy of the DTB? We sync the
> > DTs regularly from the kernel repo to the U-Boot repo, and the U-Boot
> > build system builds all DTBs with overlay support already.
> > This also saves you from the hassle to actually find and load the
> > right=20
> > DTB, as it automatically comes as part of the U-Boot binary.
> > On the U-Boot prompt (or rather in a script) you would then do:
> > =3D> fdt move $fdtcontroladdr $fdt_addr_r
> > =3D> load <source> $fdtoverlay_addr_r <your_overlay>.dtbo
> > =3D> fdt apply $fdtoverlay_addr_r
>=20
>=20
> For systems that use u-boot this is a very convenient option. Thanks
> for bringing this up. However, there are other boot-chains where this
> is not an option. Also, with this argument no target in the Kernel
> would need to be compiled with -@.
>=20
> My understanding was that adding the -@ is generally accepted if it is
> only done on a per-device basis (which this patch does), but not
> accepted for whole architectures. By that, I expect to see many similar
> patches in the future.

I don't necessarly agree with this approach, but since other ways are=20
rejected, I'll merge this one if there are no further complaints.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Cheers,
> Felix
>=20
>=20
> >=20
> > You could also chime in on this U-Boot patch of mine, that loads and=20
> > applies all .dtbo files found in a given directory:
> > https://lore.kernel.org/u-boot/20230210110213.2531190-1-andre.przywara@=
arm
> > .com/
=20
> > Cheers,
> > Andre
> >=20
> >=20
> > >=20
> > > Thanks for the pointer. If this would be a kconfig option, I would
> > > agree. There's a patch to add this option, but this did not get
> > > accepted [3]. Just manually adding some "magic" options does not
> > > feel
> > > correct.
> > >=20
> > >=20
> > > > to build command [1]. Do you see any downside except knowing you
> > > > have
> > > > to
> > > > include it? On the upside, there is no need to patch each and
> > > > every
> > > > file and
> > > > kernel builder has a choice if overlays should be supported or
> > > > not.
> > >=20
> > >=20
> > > There is a similar feature request for Debian, but without a
> > > decision
> > > yet [4]. I just cross-referenced it to this thread.
> > >=20
> > >=20
> > > > Note that
> > > > in some cases overlays can be needed even in the case when board
> > > > doesn't have
> > > > expansion ports.
> > >=20
> > >=20
> > > If that is the case, why can't we at least add the patch from [3]
> > > and
> > > provide the distros an easy option to enable overlays? Once
> > > integrated,
> > > we can eventually get rid of all the per-device patches in the
> > > kernel.
> > >=20
> > > Best regards,
> > > Felix
> > >=20
> > > [3] https://www.spinics.net/lists/kernel/msg4252361.html
> > > [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D910727
> > >=20
> > >=20
> > > >=20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > [1]
> > > > https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/linu=
x/
> > > > package.mk#L213
> > > >=20
> > > >=20
> > > > >=20
> > > > > There has been a discussion in 2017 to improve the situation in
> > > > > general, but without any final decision or implementation [1].
> > > > > By
> > > > > that,
> > > > > these patches got more and more common. I recently sent a very
> > > > > similar
> > > > > patch for a riscv board that got accepted [2].
> > > > >=20
> > > > > IMHO it is better to have these patches in the kernel instead
> > > > > of
> > > > > carrying different variants of this in each Linux distro. IMHO,
> > > > > the
> > > > > board vendors themselves should add this when they add a board.
> > > > >=20
> > > > > [1]
> > > > > https://lore.kernel.org/lkml/1502831736-28282-1-git-send-email-tr=
ini
> > > > > @konsulk
 o.com/ [2]
> > > > > https://lore.kernel.org/linux-devicetree/20230627080620.329873-1-=
fel
> > > > > ix.moess
 bauer@siemens.com/
> > > > >=20
> > > > > Best regards,
> > > > > Felix
> > > > >=20
> > > > >=20
> > > > > > Best regards,
> > > > > > Jernej
> > > > > >=20
> > > > > >=20
> > > > > > > Felix Moessbauer
> > > > > > > Siemens AG
> > > > > > >=20
> > > > > > >   arch/arm/boot/dts/allwinner/Makefile | 19
> > > > > > > +++++++++++++++++++
> > > > > > >   1 file changed, 19 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/arch/arm/boot/dts/allwinner/Makefile
> > > > > > > b/arch/arm/boot/dts/allwinner/Makefile index
> > > > > > > 589a1ce1120a..eebb5a0c873a
> > > > > > > 100644
> > > > > > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > > > > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > > > > > @@ -179,6 +179,25 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
> > > > > > >          sun7i-a20-pcduino3-nano.dtb \
> > > > > > >          sun7i-a20-wexler-tab7200.dtb \
> > > > > > >          sun7i-a20-wits-pro-a20-dkt.dtb
> > > > > > > +
> > > > > > > +# Enables support for device-tree overlays for all pis
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-lite :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-bananapi-m2-plus :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-m1-plus :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-m1 :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-duo2 :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-plus2e :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-one :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-plus :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-2 :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-zero-plus2 :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-neo-air :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-zeropi :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-neo :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
> > > > > > > +DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> > > > > > >   dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > > > > > >          sun8i-a23-evb.dtb \
> > > > > > >          sun8i-a23-gt90h-v4.dtb \
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > >=20
>=20
>=20




