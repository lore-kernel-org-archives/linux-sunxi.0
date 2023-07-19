Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4BCC138
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 12:26:22 +0000 (UTC)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230719122619eab87f04c0831bb82f
        for <linux-sunxi@lists.linux.dev>;
        Wed, 19 Jul 2023 14:26:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SFjbsl0Mw2fylIqOjv0Vve4M5pxJN5yXXdFIXx3vH+I=;
 b=k+HJNG8JCJKmVa/VUgJXUaqUZWiO8ADilkB3JzWZDNIy1u3U5INblJ27b/OI4QETUHQm0i
 yAzhR5G2+bmnL67UAFIK5LxysoJHBQ360mNw5nv7bKG3MO872w+DWCRfAGvzMEntvkZLz8uN
 vx15qmA13LIdJAJpwaR5o3IB9XWyY=;
Message-ID: <17c7a0c952913e21d9a323f42a1cfad84ed8a51b.camel@siemens.com>
Subject: Re: [PATCH 1/1] arm: dts: Enable device-tree overlay support for
 sun8i-h3 pi devices
From: Moessbauer Felix <felix.moessbauer@siemens.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Rob Herring
	 <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Bovensiepen
	 <daniel.bovensiepen@siemens.com>, Quirin Gylstorff
	 <quirin.gylstorff@siemens.com>, manuel.matzinger@siemens.com, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Date: Wed, 19 Jul 2023 20:26:13 +0800
In-Reply-To: <1830379.atdPhlSkOF@jernej-laptop>
References: <20230627133703.355893-1-felix.moessbauer@siemens.com>
	 <1830379.atdPhlSkOF@jernej-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer

On Tue, 2023-07-11 at 21:42 +0200, Jernej =C5=A0krabec wrote:
> Dne torek, 27. junij 2023 ob 15:37:03 CEST je Felix Moessbauer
> napisal(a):
> > Add the '-@' DTC option for the sun8i-h3 pi-class devices. This
> > option
> > populates the '__symbols__' node that contains all the necessary
> > symbols
> > for supporting device-tree overlays (for instance from the firmware
> > or
> > the bootloader) on these devices.
> >=20
> > These devices allow various modules to be connected and this
> > enables
> > users to create out-of-tree device-tree overlays for these modules.
> >=20
> > Please note that this change does increase the size of the
> > resulting DTB
> > by ~30%. For example, with v6.4 increase in size is as follows:
> >=20
> > 22909 -> 29564 sun8i-h3-orangepi-lite.dtb
> > 24214 -> 30935 sun8i-h3-bananapi-m2-plus.dtb
> > 23915 -> 30664 sun8i-h3-nanopi-m1-plus.dtb
> > 22969 -> 29537 sun8i-h3-nanopi-m1.dtb
> > 24157 -> 30836 sun8i-h3-nanopi-duo2.dtb
> > 24110 -> 30845 sun8i-h3-orangepi-plus2e.dtb
> > 23472 -> 30037 sun8i-h3-orangepi-one.dtb
> > 24600 -> 31410 sun8i-h3-orangepi-plus.dtb
> > 23618 -> 30230 sun8i-h3-orangepi-2.dtb
> > 22170 -> 28548 sun8i-h3-orangepi-zero-plus2.dtb
> > 23258 -> 29795 sun8i-h3-nanopi-neo-air.dtb
> > 23113 -> 29699 sun8i-h3-zeropi.dtb
> > 22803 -> 29270 sun8i-h3-nanopi-neo.dtb
> > 24674 -> 31318 sun8i-h3-nanopi-r1.dtb
> > 23477 -> 30038 sun8i-h3-orangepi-pc.dtb
> > 24622 -> 31380 sun8i-h3-bananapi-m2-plus-v1.2.dtb
> > 23750 -> 30366 sun8i-h3-orangepi-pc-plus.dtb
> >=20
> > Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> > ---
> > Please note that I only tested the overlay on the sun8i-h3-nanopi-
> > neo
> > device. However, the devices are quite similar and in general the
> > change to add symbols should be pretty safe. Similar patches have
> > been
> > applied to various other devices in the past without any negative
> > effect (except for the increased size).
>=20
> I'm not a fan of this approach. What's wrong with letting kernel
> builders=20
> specify this flag on their own at compile time? That way size is
> still=20
> completely in domain of builder.

That's easier said than done. These symbols are only needed for some
targets (that are commonly used with overlays). But how should a
general purpose kernel builder like Debian know which DT to build with
symbols and which without? In Yocto the overlays are not really needed,
as often the original dts is just patched directly.

There has been a discussion in 2017 to improve the situation in
general, but without any final decision or implementation [1]. By that,
these patches got more and more common. I recently sent a very similar
patch for a riscv board that got accepted [2].

IMHO it is better to have these patches in the kernel instead of
carrying different variants of this in each Linux distro. IMHO, the
board vendors themselves should add this when they add a board.

[1]
https://lore.kernel.org/lkml/1502831736-28282-1-git-send-email-trini@konsul=
ko.com/
[2]
https://lore.kernel.org/linux-devicetree/20230627080620.329873-1-felix.moes=
sbauer@siemens.com/

Best regards,
Felix

>=20
> Best regards,
> Jernej
>=20
> >=20
> > Felix Moessbauer
> > Siemens AG
> >=20
> > =C2=A0arch/arm/boot/dts/allwinner/Makefile | 19 +++++++++++++++++++
> > =C2=A01 file changed, 19 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile
> > b/arch/arm/boot/dts/allwinner/Makefile index
> > 589a1ce1120a..eebb5a0c873a
> > 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -179,6 +179,25 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun7i-a20-pcduino3-nano=
.dtb \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun7i-a20-wexler-tab720=
0.dtb \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun7i-a20-wits-pro-a20-=
dkt.dtb
> > +
> > +# Enables support for device-tree overlays for all pis
> > +DTC_FLAGS_sun8i-h3-orangepi-lite :=3D -@
> > +DTC_FLAGS_sun8i-h3-bananapi-m2-plus :=3D -@
> > +DTC_FLAGS_sun8i-h3-nanopi-m1-plus :=3D -@
> > +DTC_FLAGS_sun8i-h3-nanopi-m1 :=3D -@
> > +DTC_FLAGS_sun8i-h3-nanopi-duo2 :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-plus2e :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-one :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-plus :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-2 :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-zero-plus2 :=3D -@
> > +DTC_FLAGS_sun8i-h3-nanopi-neo-air :=3D -@
> > +DTC_FLAGS_sun8i-h3-zeropi :=3D -@
> > +DTC_FLAGS_sun8i-h3-nanopi-neo :=3D -@
> > +DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
> > +DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
> > +DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> > =C2=A0dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i-a23-evb.dtb \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i-a23-gt90h-v4.dtb =
\
>=20
>=20
>=20
>=20

