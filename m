Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112E37A
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 01:43:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1a7ff4a454eso406505ad.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 18:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682041423; x=1684633423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIxy13HfCmUT7EC5y5m4UCU0YeS0VjV5fZQ5jhML6eE=;
        b=qw8MaCUvrN0Zk46JopzDu1i95viE1y9QMcRYLwicZ7IUpzsNd4mLhxoglU3f6L67tD
         XcHwkffp88Zp+CzDTdY0ZDrRe/0OpumfRosvaqq/M9HtwUW9JNTdtiqDzE6giLTNmfut
         F3FiSaMXOj4IirV4/0xlNrpPfnNEsfSOg61PM2JDllV/+Xk4aKiYJP9QM0ZaNA/PoVmy
         TP3aixmciyyj/ICJb85pAPLqFEW7VHzwO8TTIJDXTRDDVVRoPnHlrrl+W6hizmnSsnAp
         s66LEehvPywdjmkjlJi0ZAVxnyQj8dk96ylVOMAcK4MRhtGNcJCjpMp0splqkZs50TCu
         9SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682041423; x=1684633423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIxy13HfCmUT7EC5y5m4UCU0YeS0VjV5fZQ5jhML6eE=;
        b=AMjCTOali1ZAR3lZfkisE04VQto1ybXB7KSw/yeKrQZrn/eV68D903YKLtrvhLluKk
         QsObXT5UxcCgRBk2Qr0UEUwxK/7K9Ns4VoISyMXFonxSZRpRlKN/297wSSMoak9OaaKH
         kg8nSyb8JdNvcw4YqAFXI58DUJMm0naMDYVFCfHB8e/ue4woqNmrZvG9sif1X1+6DVoT
         P7n/Edq20H4TwxAqEFjZ4f0NnETMay87ONr2b07fHs//UFXSoy4i5QNM0DoqVs0saFB3
         h/2dGdrQC//e4CMgST0Q5Z7TLciS9Y4/8VIrXm263rtv7tPqPuCiFWTWQe7yD6eWoGU3
         5Blg==
X-Gm-Message-State: AAQBX9cpxsl/VnX0XQUYBs1ef8D2Mu06G6kC2+Tlk98dXxZrqS1wnTx2
	QEIQ/754PW9uMxsiVv1A2izWk4cuH1lYYf9pmuoc/Q==
X-Google-Smtp-Source: AKy350aS2eg9ZuypDmu9bYDHvI0CqyL2p3mLuHY04xWLwJca+BkbuN4FFuxU81uvAcWXOwQQKjaQmXxLG+p3pbWr7Rs=
X-Received: by 2002:a17:902:eb8c:b0:1a9:23a7:7c57 with SMTP id
 q12-20020a170902eb8c00b001a923a77c57mr135908plg.10.1682041423159; Thu, 20 Apr
 2023 18:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681580558.git.noodles@earth.li> <f26d11e613df7bd55822ff3fb7689e36bf9e4f7a.1681580558.git.noodles@earth.li>
 <20230416012421.255bfd19@slackpad.lan> <ZEGOk1isRhaekk3h@earth.li>
In-Reply-To: <ZEGOk1isRhaekk3h@earth.li>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 20 Apr 2023 18:43:06 -0700
Message-ID: <CAGETcx-UnEK3CPC38Ef3gmHcq46nXSJbA9QAwEsF+Xt2bDKEWA@mail.gmail.com>
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

On Thu, Apr 20, 2023 at 12:12=E2=80=AFPM Jonathan McDowell <noodles@earth.l=
i> wrote:
>
> On Sun, Apr 16, 2023 at 01:24:21AM +0100, Andre Przywara wrote:
> > On Sat, 15 Apr 2023 18:46:03 +0100
> > Jonathan McDowell <noodles@earth.li> wrote:
> >
> > > The C.H.I.P has an rtl8723bs device with the bluetooth interface hook=
ed
> > > up on UART3. Support for this didn't exist in mainline when the DTS w=
as
> > > initially added, but it does now, so enable it.
> > >
> > > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > > ---
> > >  arch/arm/boot/dts/sun5i-r8-chip.dts | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/=
sun5i-r8-chip.dts
> > > index fd37bd1f3920..4d72a181d8aa 100644
> > > --- a/arch/arm/boot/dts/sun5i-r8-chip.dts
> > > +++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
> > > @@ -255,6 +255,10 @@ &uart3 {
> > >     pinctrl-0 =3D <&uart3_pg_pins>,
> > >                 <&uart3_cts_rts_pg_pins>;
> > >     status =3D "okay";
> > > +
> > > +   bluetooth {
> > > +           compatible =3D "realtek,rtl8723bs-bt";
> > > +   }
> >
> > As the kernel test robot already pointed out, there is a semicolon
> > missing here.
> > Otherwise looks good (dt-validate passes), but don't know if there are
> > any wakeup GPIOs connected (can't seem to find a schematic?).
>
> So there are wakeups, but if I add:
>
>         device-wake-gpios =3D <&axp_gpio 3 GPIO_ACTIVE_LOW>;
>         host-wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
>
> then some odd sort of dependency issue happens where the serial port
> load is deferred waiting for the GPIO to appear, and then the device
> doesn't work.

When you say your device doesn't work, are you saying it never probes?
<debugfs>/devices_deferred should tell you what devices have deferred and w=
hy.

> Error in dmesg is:
>
> serial serial0-0: deferred probe pending
>
> on 6.3-rc and on 6.1 I get:
>
> dw-apb-uart 1c28c00.serial: Failed to create device link (0x180) with axp=
20x-gpio

This error message doesn't block anything. So I don't think this is
the cause of your blocking issue. But I still want to understand why
this error message is showing up.

> I'm not clear why it's trying to link the serial port to the GPIO; it
> seems that it should be the bluetooth device that depends on both the
> UART and the GPIO,

A fix for the device link error message went in on v6.3-rc3. Is that
the 6.3 version you tested this on?

Also, I tried looking into the UART driver
(drivers/tty/serial/8250/8250_dw.c) but it wasn't clear how it ends up
populating the bluetooth serial device. If you can point that out,
that'd be helpful (assuming 6.3-rc3 still shows that error message).

> and that the GPIO is actually optional so shouldn't
> hold up loading, but I can't see how that should be represented.

Optional dependencies should get ignored after the default
deferred_probe_timeout runs out and the supplier driver hasn't been
loaded yet.

-Saravana

> Adding Greg + Saravana in the hope they can tell me what I've done wrong
> here. The LED driver using a different GPIO line on the axp209 works
> fine, so the device is definitely loaded and working ok.
