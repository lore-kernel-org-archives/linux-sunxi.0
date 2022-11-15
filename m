Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2388323A6
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 05:11:30 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ft34so33288512ejc.12
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 21:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X5gavBgb/Wglf/XTm1Y3iI6Wt14bllzi0excp6wbNI=;
        b=Ch4GWTvFW9A/W//Ar7wULEELol5YOg8zAEI1I7wrVV1Tbe3gY/vXhtXBhuERjzEzy/
         16OFu4kKs820NNn0JEuSQPxRYdVURpgwmf/tlf3x776IbZAHInM9u0NgaoAh/eDjox8A
         X5NJTqiYSwvy1SIdL9eJzFtwCKMqRFGRiNcE1tsLFGLjbfnel3qd5AYsY4FJxDCYZcd2
         EgLWBqvA3IPUbZjp3bIJTBHA0PGAJgVsrViCxiiVKHU+Iso0blSvwxzp5ZeNsS4NI7EL
         lycMiugyOdropKwiUpBszbcJY3OdB2a/YbBWb6FRDBZ7nvjlfimiYMfElrV1RbEZSvSs
         0cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9X5gavBgb/Wglf/XTm1Y3iI6Wt14bllzi0excp6wbNI=;
        b=5Sq3eTWRnPuSBvZtsHTg+dbewBnVD2JOxFQZsZAkFOalFMPjObf7X8eYAn9WQjeITX
         /XwvgqdU1FordRcfiYMv8Qugd0vrwDUFZwuPuTEHTzmfjZZwb6OTUKqw5wUkTIgDqJpi
         tz3WKVU0x8moBudhbhcnVPO+d8a32SE2aW8apt+K451T+sNNgw0H9EgiDrtuV06zlnyB
         aS1QSxTVXoaq8m5+mhy6PmtddPeuXagJ5WjZJXFbjPLCE8F9853w5mjL3bhOELzDO6lv
         19qDoUDvioN6/Fp0fvKPZUA5nH++zzRR8j3kSVyGgfuoPrdaTdVaOBKr6+d9wjL8ITw3
         iR/Q==
X-Gm-Message-State: ANoB5pkvtiQv0/me23qYjyzhx8Ly0t+6XqMNvU5aLB9qPjCapw7/U6/X
	pdDNEdZQBG776Em+vJsXqNA=
X-Google-Smtp-Source: AA0mqf4zd79bgtCeRyvvejnHuF11adVMo41g5zMGL0LyoDgN/69gkHKT+bufC0s93YP9cfJnmie+BA==
X-Received: by 2002:a17:906:4f85:b0:7ae:c1b2:d912 with SMTP id o5-20020a1709064f8500b007aec1b2d912mr11892930eju.577.1668489088175;
        Mon, 14 Nov 2022 21:11:28 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r18-20020a1709061bb200b0077d37a5d401sm5029382ejg.33.2022.11.14.21.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 21:11:27 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/10] ARM: dts: suniv: F1C100s: add more peripherals
Date: Tue, 15 Nov 2022 06:11:25 +0100
Message-ID: <5875968.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20221115002808.5456008b@slackpad.lan>
References: <20221107005433.11079-1-andre.przywara@arm.com> <1920557.yKVeVyVuyW@kista> <20221115002808.5456008b@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 15. november 2022 ob 01:28:08 CET je Andre Przywara napisal(a):
> On Mon, 07 Nov 2022 20:33:47 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> thanks for the reviews!
>=20
> > Dne ponedeljek, 07. november 2022 ob 01:54:23 CET je Andre Przywara
> >=20
> > napisal(a):
> > > This is a fixed version of the initial post. I dropped the two patches
> > > that were already applied by the respective maintainers, and fixed the
> > > smaller issues mentioned in the review.
> > > This adds v2 of the series enabling the "Lctech Pi F1C200s" board on
> > > top,
> > > also with the comments addressed.
> >=20
> > Please don't combine series if not agreed upon before. Now whole series
> > will be delayed until USB is sorted out.
>=20
> Apologies for that. Indeed I should have added the board DT to the USB
> series instead, as there is no dependency to anything in here.
>=20
> If you don't mind, I will send a v3 with the last three patches
> dropped, and the ACKs and R-b's added (and that one line in the commit
> message fixed).

That would be nice. I was planning to merge other patches anyway if USB ser=
ies=20
is not sorted out in time, but I prefer merging whole series at once. I sho=
uld=20
add that to previous response, sorry.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > Best regards,
> > Jernej
> >=20
> > > The whole series goes on top of v3 of Icenowy's F1C100s USB support
> > > series [1]. There is no real conflict, but the lctech-pi.dts file
> > > references the new USB DT nodes from the .dtsi.
> > >=20
> > > I put a git repo with all those patches up here:
> > > https://github.com/apritzel/linux/commits/f1c100s-devices-v2
> > >=20
> > > For a changelog see below.
> > >=20
> > > [1]
> > > https://lore.kernel.org/linux-arm-kernel/20221106154826.6687-1-andre.=
prz
> > > ywa
> > > ra@arm.com/T/#t
> > >=20
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > The Allwinner F1C100s series of SoCs shares many peripherals with oth=
er
> > > Allwinner SoCs. Since they are compatible, we can use the existing
> > > drivers, and just need to enable the devices in the DT.
> > >=20
> > > This series adds the I2C controllers, the PWM device, the CIR (infrar=
ed)
> > > device and the LRADC (aka. KEYADC, low res ADC) to the F1C100s .dtsi,=
 so
> > > boards can just use them by setting 'status =3D "okay";'.
> > >=20
> > > The only thing missing driver-wise is the IR mod clock, which was not
> > > modeled in our CCU driver. Patch 4/10 fixes that.
> > >=20
> > > For every device there is one patch that adds the new compatible stri=
ng
> > > to the DT binding, and another patch to add the DT node.
> > >=20
> > > This has been tested on the Lctech Pi F1C200s board, by:
> > > - Connecting an LED to PE6, and configuring this as the PWM pin in the
> > > DT.
> > >=20
> > >   Doing a sweep on /sys/class/pwm/pwm1/duty_cycle made the LED fade o=
ut.
> > >=20
> > > - Configuring PD0/PD12 as I2C0, and letting i2c-detect find the on-bo=
ard
> > >=20
> > >   NS2009 I2C chip.
> > >=20
> > > - Connecting two resistors to the "ADC" pin, and configuring them as =
two
> > >=20
> > >   buttons in the DT. /dev/input/event0 properly reported button press=
es.
> > >=20
> > > - Connecting an infrared receiver to PE11, configured as CIR.
> > >=20
> > >   ir-keytable reported key presses on a remote control.
> > >=20
> > > All those (basic) tests were successful, and prove that the periphera=
ls
> > > do work and are compatible.
> > >=20
> > > The final three patches add the binding docs and the .dts file for the
> > > Lctech Pi F1C200s development board.
> > >=20
> > > Please have a look and test on your hardware, if possible.
> > >=20
> > > Cheers,
> > > Andre
> > >=20
> > > Changelog v1 ... v2:
> > > - dropped former patch 3/9 and 8/9: already applied
> > > - increase register frame size in DT for PWM and LRADC
> > > - drop I2C1 pins from pinctroller DT node
> > > - increase IR mod clock mux to 2 bits
> > > - fix mistyped comma in vendor prefix name
> > > - drop unneeded mmc0 and spi0 aliases from Lctech Pi DT
> > > - add /omit-if-no-ref/ tag to UART1 pins
> > > - add ACKs and Reviewed-by tags
> > >=20
> > > Andre Przywara (10):
> > >   dt-bindings: pwm: allwinner,sun4i-a10: Add F1C100s compatible
> > >   ARM: dts: suniv: f1c100s: add PWM node
> > >   ARM: dts: suniv: f1c100s: add I2C DT nodes
> > >   clk: sunxi-ng: f1c100s: Add IR mod clock
> > >   dt-bindings: media: IR: Add F1C100s IR compatible string
> > >   ARM: dts: suniv: f1c100s: add CIR DT node
> > >   ARM: dts: suniv: f1c100s: add LRADC node
> > >   dt-bindings: vendor-prefixes: add Lctech name
> > >   dt-bindings: arm: sunxi: add compatible strings for Lctech Pi
> > >   ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
> > > =20
> > >  .../devicetree/bindings/arm/sunxi.yaml        |  6 ++
> > >  .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
> > >  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  4 +-
> > >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> > >  arch/arm/boot/dts/Makefile                    |  1 +
> > >  arch/arm/boot/dts/suniv-f1c100s.dtsi          | 76 ++++++++++++++++++
> > >  arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 78 +++++++++++++++++=
++
> > >  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++-
> > >  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
> > >  include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 +
> > >  10 files changed, 180 insertions(+), 3 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
> > >=20
> > > --
> > > 2.35.5




