Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539613C05
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 22:46:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a950b982d4so105195ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682117190; x=1684709190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grxtbYgBEZhFXTnkmUQSXwfMPjYR4qLeWhU06c7fEJo=;
        b=LdfV8328hCSEL7clgImntNqsjxIE6gpJx7G924HHBO4P0LLmlWh8r1f3M78lmOqsRH
         K+MZax8iX6iDU5iiSuYpt+qdLoo+bv2RWJAD+kVPJqPvLLMgJ3RmPEe00lXzp9BZEzih
         RDm/s5YUQ4LdcojdFDlLWMdzD/HNSCKxBhwEHbcStUiYbKSwSxZtLJqScw2X/tMQpNue
         7Q0v7GD4Btpw/0sEet7FiJXs6P+S6HShG3YS6btnZHQB8FQwsnzh7dTn6/15dAZQLq7q
         pIDEvozCPbIlWuVAL0jx8yOg2gF0BVGzdzG/4ZTRpHyFG6Jwvwsesg6fu3nd9+s/ceqP
         w9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682117190; x=1684709190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grxtbYgBEZhFXTnkmUQSXwfMPjYR4qLeWhU06c7fEJo=;
        b=d0dImU5gC2mrBqlPJYoXDZXud1XhLXzA9BA1yFz+J/8QbojX4ujJsW47i/HSZiZ3rT
         Tt+MCLLuR67fGNXEKVyWe6MSzJbpZh2aTT0vY1w4XSDWnKnVmTl7R5vavMvqoF/nQlam
         6xVVdorBUHknfq6L6kgThDxXfVbaPPsuOmmaJrDxmJc5I73TQ1z2hL8E+G4gbK55q0zl
         p7tuqThHTj31WxpjrRjl+809M5IGzz9J+pACzYkZTe8k8BIVudBN3dJxxb3xt5rzPeYR
         auuTQuFwgLvG+unKQMiYnxvQuTXJChnH7n7DFy9N+M8B7BjAU9oYc30Ld58C+1Oh1MvB
         tzyA==
X-Gm-Message-State: AAQBX9e9ImHHoMp/qaownMk0JfE8BZp6psr4Mucerq21SspyhyHrZ59h
	q/Wt+gdPfqHJ4RSZHeAgRcSdbszVmBKzWN2DgTuy7Q==
X-Google-Smtp-Source: AKy350bEB1pKwAM1VUR5fdz9R+Z9KrwHyX5kQUSH/7E09sGk0HXwt+4pGmiw/MQ0eSqZeYh7EZsxftVWrQdX7cbk71U=
X-Received: by 2002:a17:902:ecc9:b0:198:af4f:de07 with SMTP id
 a9-20020a170902ecc900b00198af4fde07mr25570plh.7.1682117189428; Fri, 21 Apr
 2023 15:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681580558.git.noodles@earth.li> <f26d11e613df7bd55822ff3fb7689e36bf9e4f7a.1681580558.git.noodles@earth.li>
 <20230416012421.255bfd19@slackpad.lan> <ZEGOk1isRhaekk3h@earth.li>
 <CAGETcx-UnEK3CPC38Ef3gmHcq46nXSJbA9QAwEsF+Xt2bDKEWA@mail.gmail.com> <ZEJJGGeIu8QW44mh@earth.li>
In-Reply-To: <ZEJJGGeIu8QW44mh@earth.li>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 21 Apr 2023 15:45:52 -0700
Message-ID: <CAGETcx8JDYUT2bdDhJ0PN8_CPmHJ37jCfnuoav6CGFJoovfSqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: sun5i: chip: Enable bluetooth
To: Jonathan McDowell <noodles@earth.li>
Cc: Andre Przywara <andre.przywara@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 1:28=E2=80=AFAM Jonathan McDowell <noodles@earth.li=
> wrote:
>
> On Thu, Apr 20, 2023 at 06:43:06PM -0700, Saravana Kannan wrote:
> > On Thu, Apr 20, 2023 at 12:12=E2=80=AFPM Jonathan McDowell <noodles@ear=
th.li> wrote:
> > > On Sun, Apr 16, 2023 at 01:24:21AM +0100, Andre Przywara wrote:
> > > > On Sat, 15 Apr 2023 18:46:03 +0100
> > > > Jonathan McDowell <noodles@earth.li> wrote:
> > > >
> > > > > The C.H.I.P has an rtl8723bs device with the bluetooth interface =
hooked
> > > > > up on UART3. Support for this didn't exist in mainline when the D=
TS was
> > > > > initially added, but it does now, so enable it.
> > > > >
> > > > > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > > > > ---
> > > > >  arch/arm/boot/dts/sun5i-r8-chip.dts | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/=
dts/sun5i-r8-chip.dts
> > > > > index fd37bd1f3920..4d72a181d8aa 100644
> > > > > --- a/arch/arm/boot/dts/sun5i-r8-chip.dts
> > > > > +++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
> > > > > @@ -255,6 +255,10 @@ &uart3 {
> > > > >     pinctrl-0 =3D <&uart3_pg_pins>,
> > > > >                 <&uart3_cts_rts_pg_pins>;
> > > > >     status =3D "okay";
> > > > > +
> > > > > +   bluetooth {
> > > > > +           compatible =3D "realtek,rtl8723bs-bt";
> > > > > +   }
> > > >
> > > > As the kernel test robot already pointed out, there is a semicolon
> > > > missing here.
> > > > Otherwise looks good (dt-validate passes), but don't know if there =
are
> > > > any wakeup GPIOs connected (can't seem to find a schematic?).
> > >
> > > So there are wakeups, but if I add:
> > >
> > >         device-wake-gpios =3D <&axp_gpio 3 GPIO_ACTIVE_LOW>;
> > >         host-wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> > >
> > > then some odd sort of dependency issue happens where the serial port
> > > load is deferred waiting for the GPIO to appear, and then the device
> > > doesn't work.
> >
> > When you say your device doesn't work, are you saying it never probes?

Read your whole email and it's a strange issue. Also, going forward to
avoid confusion, only reply to questions with respect to 6.3-rc7.

> The bluetooth device (realtek,rtl8723bs-bt) never appears, apparently
> because the UART it's attached to never loads - it doesn't even try to
> load the firmware.
>
> > <debugfs>/devices_deferred should tell you what devices have deferred a=
nd why.
>
> root@chip:~# cat /sys/kernel/debug/devices_deferred
> serial0-0

Do you see this in 6.3-rc7 too?

> > > Error in dmesg is:
> > >
> > > serial serial0-0: deferred probe pending
> > >
> > > on 6.3-rc and on 6.1 I get:
> > >
> > > dw-apb-uart 1c28c00.serial: Failed to create device link (0x180) with=
 axp20x-gpio
> >
> > This error message doesn't block anything. So I don't think this is
> > the cause of your blocking issue. But I still want to understand why
> > this error message is showing up.
> >
> > > I'm not clear why it's trying to link the serial port to the GPIO; it
> > > seems that it should be the bluetooth device that depends on both the
> > > UART and the GPIO,
> >
> > A fix for the device link error message went in on v6.3-rc3. Is that
> > the 6.3 version you tested this on?
>
> I originally tried on 6.1.21, which is where I got the "Failed to create
> device link" message. I then moved to 6.3-rc7 as I saw there had been
> further changes recently. There I just get the:
>
> serial serial0-0: deferred probe pending

If the deferral is related to fw_devlink, you should see the reason
for deferring in the devices_deferred file. So I don't think the issue
is related to fw_devlink.

> message.
>
> > Also, I tried looking into the UART driver
> > (drivers/tty/serial/8250/8250_dw.c) but it wasn't clear how it ends up
> > populating the bluetooth serial device. If you can point that out,
> > that'd be helpful (assuming 6.3-rc3 still shows that error message).
>
> I have the following in my device tree:
>
> &uart3 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart3_pg_pins>,
>                     <&uart3_cts_rts_pg_pins>;
>         status =3D "okay";
>
>         bluetooth {
>                 compatible =3D "realtek,rtl8723bs-bt";
>                 device-wake-gpios =3D <&axp_gpio 3 GPIO_ACTIVE_LOW>;
>                 host-wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 *=
/
>         };
> };
>
> uart3 is a snps,dw-apb-uart, defined in arch/arm/boot/dts/sun5i.dtsi
>
> The UART and AXP209 device drivers are compiled into the kernel:
>
> CONFIG_PINCTRL_AXP209=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
>
> The bluetooth bits are modules (btrtl, hci_uart).
>
> If I remove the device-wake-gpios line then the Bluetooth device works
> fine, and /sys/kernel/debug/devices_deferred is empty.
>
> Somehow it seems like the GPIO is being parsed as a dependency for the
> serial port, even though the serial port + GPIO are both dependencies
> for the bluetooth device.

I'm fairly sure that fw_devlink isn't causing that. Because even
without bluetooth, fw_devlink doesn't consider any suppliers listed in
child DT nodes as mandatory suppliers. That has been the case since
the beginning.

> Even with that, given both are built-in I
> don't understand why the serial port never completes setup.

My guess is that the driver itself has some bug that's sensitive to
device probe order even though it shouldn't.

Can you add #define DEBUG 1 to the top of drivers/base/core.c and
share the boot log? I can try and help debug it.

-Saravana

> > > and that the GPIO is actually optional so shouldn't
> > > hold up loading, but I can't see how that should be represented.
> >
> > Optional dependencies should get ignored after the default
> > deferred_probe_timeout runs out and the supplier driver hasn't been
> > loaded yet.
>
> When I say it's optional I mean if it's not listed everything works
> fine, but I don't believe there's anyway to express that in the DTS.
> It's certainly not required for the serial port, just the bluetooth
> device.
>
> J.
>
> --
> Web [                     Don't be a stranger.                     ]
> site: https:// [                                          ]      Made by
> www.earth.li/~noodles/  [                      ]         HuggieTag 0.0.24
