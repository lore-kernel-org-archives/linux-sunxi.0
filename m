Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8FD72
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 14:47:25 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id q18so12288212lfc.7
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Jul 2021 07:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=xu3zTmSjkZSEuxjpur5NXuqL59nEnkxLftPSvCoU/Dc=;
        b=YtV1nBMzKsoEaMsOBh/ztxllJ/MWkquAFf49T1dRtQrtlBfkcsPcWsnAi8+/XmreN7
         /SAFO3mavBh5lxIQlHz0blNQlWuJCp2ydDMAwyYuPe0Rl/S4wk5tO+/2dVE8bZJ99eP7
         R0U27i1DCrlbGP+hWd/EetLVuJIBSP45C2xb/K1OBPHHazFvbdK1OtE+wDKB4U4fMoGD
         bEi8X5a5nnkeEu7QcGnQ/lSQrExhDJToyAQMBFR2oaRkFC0uTnkkU4qg0hONJ6rX1WsW
         2/gYAsSN8xafp2QEPs9yvAxzbsh/fBWQoyXAt5Y/leJr9naTnF6pF0z8iAMeHX5RqycE
         3/sA==
X-Gm-Message-State: AOAM531BMwam7wZcTwoGm50oA2i1s9LvQGsG4YhLradDXVDKd2pLpq06
	bIYR/UiivaQt21LdJg0tzVWZmZ9L3Y9QeA==
X-Google-Smtp-Source: ABdhPJzBNOHMq2Q43FaH+E0YJu3LLabbHFknnOgwYtjawJX8SkWAQkV8AXettpy4TPqMXkpu4axRxQ==
X-Received: by 2002:ac2:5c49:: with SMTP id s9mr426075lfp.382.1625150842906;
        Thu, 01 Jul 2021 07:47:22 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id z20sm28660ljk.50.2021.07.01.07.47.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 07:47:22 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id h6so8810499ljl.8
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Jul 2021 07:47:22 -0700 (PDT)
X-Received: by 2002:a2e:9ac3:: with SMTP id p3mr12967609ljj.94.1625150841826;
 Thu, 01 Jul 2021 07:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210701015009.13985-1-qianfanguijin@163.com> <20210701015009.13985-3-qianfanguijin@163.com>
 <20210701153720.42c1f512@slackpad.fritz.box>
In-Reply-To: <20210701153720.42c1f512@slackpad.fritz.box>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 Jul 2021 22:47:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
Message-ID: <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable usb_otg
To: Andre Przywara <andre.przywara@arm.com>
Cc: qianfanguijin@163.com, linux-sunxi@lists.linux.dev, 
	Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Thu,  1 Jul 2021 09:50:09 +0800
> qianfanguijin@163.com wrote:
>
> Hi,
>
> > From: qianfan Zhao <qianfanguijin@163.com>
> >
> > Enable it.
> >
> > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > ---
> >  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > index a6a1087a0c9b..072535b383b5 100644
> > --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > @@ -43,6 +43,7 @@
> >
> >  /dts-v1/;
> >  #include "sun8i-r40.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> >
> > @@ -299,6 +300,11 @@
> >       regulator-name = "vdd1v2-sata";
> >  };
> >
> > +&reg_usb0_vbus {
> > +     gpio = <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> > +     status = "okay";
> > +};
>
> So there is the same USB0-DRVVBUS signal connected to this GPIO, but
> also to the AXP's N_VBUSEN line.
>
> Not sure if that means either of them can control the voltage?

It's better to use N_VBUSEN if that is connected. Since the PMIC
may have that pin already enabled, it can cause issues with VBUS
input not being correctly used.

ChenYu

> > +
> >  &tcon_tv0 {
> >       status = "okay";
> >  };
> > @@ -328,7 +334,15 @@
> >       };
> >  };
> >
> > +&usb_otg {
> > +     dr_mode = "peripheral";
>
> That should be "otg", since we have a working ID pin and can control
> VBUS.
>
> > +     status = "okay";
> > +};
> > +
> >  &usbphy {
> > +     usb0_id_det-gpios = <&pio 8 4 GPIO_ACTIVE_HIGH>; /* PI4 */
> > +     usb0_vbus_det-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; /* PH8 */
>
> The comment should say PI8.
>
> I don't have the board, but can at least confirm that the GPIO pins
> (PI4, PI8 and PI13) match the schematic.
>
> Cheers,
> Andre
>
> > +     usb0_vbus-supply = <&reg_usb0_vbus>;
> >       usb1_vbus-supply = <&reg_vcc5v0>;
> >       usb2_vbus-supply = <&reg_vcc5v0>;
> >       status = "okay";
>
