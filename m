Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85329187D
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Jul 2023 06:14:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so29876715e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689488093; x=1692080093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l+nzHA1w2j8ZB42W8QwSQ66Dl67ufdUV+pPnAi7D890=;
        b=epUTUFAHZZH5UL2Wd2lmHIIrDm5KHuvlkJeriuxGzaaT4YVzyqSxbo4AWfFYGISyAQ
         pbf5IaekJPkvekqXj7SAXw4t/3351tL2l2c5jTtfdJXW9uPzK1e/E2IcIglyIJOCb5A5
         pintGbr3DAWr6do/UkCoMGCgwHSUHGwcoK2M4CdI/fpm/6Pyk4K5JOVb2bmFMzwwp3R9
         7YOIurIJPAggmb7YG5l47hyM1ib0JbRIi42c7F28oCv2fkefih/lxYJOBlz8CsHztjVC
         urpANVjIVOy+OgKc9zG61R+K06daQucAm7tWnqd60G7vu9U30mlV1uZ9tqDzRweFjr1h
         0L5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689488093; x=1692080093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+nzHA1w2j8ZB42W8QwSQ66Dl67ufdUV+pPnAi7D890=;
        b=ivf5S/HBOdG43rSOIYO84TGMLyPJGgb4BBbRnpdKr7FMK08qAjRvw0YBpQ50FLB0Rj
         xNpIVZkXRuMG/6L1MM9XH6IJk95HziednVGOEcvDGDxcQlOpkSerhkMaUKngZtSCsDkG
         CJWRK0Q5E4XitxQMA2L2u7M9P9JA11Rpl8fQVy3Relz391TPaAxGl+PIn7WUc2PWsMkL
         M4i8nlTkPkfIW9eh3h5N5tPq0mocmWSQCqmJlbCGKmHqZ5U7KVwRXCKxYjDlhe6/o0pm
         B4h0uZ/RmWoeHMGPbg8Voks6hrgg27IMgy7tQ4cC/G6QuN9ZzMFZAeMy6AyYI+UYVExh
         IuXQ==
X-Gm-Message-State: ABy/qLbXc/es1DPYTP6HXuOP1qMVkF49griRwTqv9V1YDpgaMArGJOkw
	SpWkeG3piumDmAPxWqOyeC8=
X-Google-Smtp-Source: APBJJlFduc0Gzly6TGUMB2gC6l8Kx3jQdgQRVjjzQGbvkEu71+UZHOsxRuWIK1zMZI0ZS6PgHEGZkw==
X-Received: by 2002:a7b:c7c8:0:b0:3fc:80a:9948 with SMTP id z8-20020a7bc7c8000000b003fc080a9948mr7250595wmk.19.1689488093122;
        Sat, 15 Jul 2023 23:14:53 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id v3-20020a05600c470300b003f7f475c3bcsm9734659wmo.1.2023.07.15.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 23:14:52 -0700 (PDT)
Date: Sun, 16 Jul 2023 08:14:50 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, retpolanne@posteo.net
Cc: Anne Macedo <retpolanne@posteo.net>,
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] sunxi: H6: Enable Ethernet on Orange Pi One Plus
Message-ID: <ZLOK2hkOhpFmgtSf@Red>
References: <20230711003957.658805-2-retpolanne@posteo.net>
 <30debca8b31ed4d2cbd64850d48b81ac@posteo.net>
 <20230716013502.1d556edc@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230716013502.1d556edc@slackpad.lan>

Le Sun, Jul 16, 2023 at 01:35:02AM +0100, Andre Przywara a écrit :
> On Tue, 11 Jul 2023 19:40:21 +0000
> Anne Macedo <retpolanne@posteo.net> wrote:
> 
> Hi Anne,
> 
> thanks for reaching out to the list! But please try to avoid
> pushing any patches downstream (Yocto) before they are accepted
> or at least discussed upstream, see below.
> 
> > On 11.07.2023 02:39, Anne Macedo wrote:
> > > Enable Ethernet on Orange Pi One Plus by using the correct phy for
> > > Realtek RTL8211E instead of the Generic One. Also use CONFIG_MACPWR to
> > > turn on ethernet on startup.
> > > 
> > > After this patch is applied, a few issues can be seen:
> > > 
> > > - there's still a PHY reset timed out error that doesn't seem to cause
> > >   any impacts to the overall connection
> > > 
> > > - sometimes the emac driver times out after reset (yellow LED turns on
> > >   and never blinks)
> > > 
> > > For future patches: for now, CONFIG_MACPWR is the only way to enable
> > > Ethernet on boot. There's already code on the dts for using the 
> > > 3v3-gmac
> > > regulator. However, it is not probed on boot, so it only starts after a
> > > "regulator status" command is issued.
> 
> MACPWR is going to go away (probably in the next two weeks), so please
> have a look at this patch and see if that works for you:
> https://github.com/apritzel/u-boot/commit/be1fdb42968
> 
> > > 
> > > More details about the troubleshooting on [1].
> > > 
> > > [1]
> > > https://lore.kernel.org/u-boot/4wsvwgy56e2xfgtvioru2tf2ofkqprlts36qggivxogww6pn5j@4jk63zxhzhag/
> > > 
> > > Signed-off-by: Anne Macedo <retpolanne@posteo.net>
> > > ---
> > >  arch/arm/dts/sun50i-h6-orangepi-one-plus.dts | 2 +-
> > >  configs/orangepi_one_plus_defconfig          | 4 ++++
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > b/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > index 29a081e72a..6427c58f8a 100644
> > > --- a/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > +++ b/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > @@ -37,7 +37,7 @@
> > > 
> > >  &mdio {
> > >  	ext_rgmii_phy: ethernet-phy@1 {
> > > -		compatible = "ethernet-phy-ieee802.3-c22";
> > > +		compatible = "ethernet-phy-id001c.c915", 
> > > "ethernet-phy-ieee802.3-c22" ;
> 
> So this is really odd, why would you need that? 001c.c915 is the ID for
> the normal standard Realtek 8211E PHY, which would be auto-detected via
> MDIO. You just need to define CONFIG_PHY_REALTEK to include support.
> Forcing this in the DT is not necessary and smells wrong.
> 
> But I suppose you needed that to get it to work, so could this be a
> timing issue? Maybe the PHY doesn't come up quick enough after just
> pulling PD6 high, so the auto-detection wouldn't work? The DT has a
> "startup-delay-us = <100000>;" property, which MACPWR doesn't know
> about and wouldn't observe.
> So could you check whether just applying the "Remove MACPWR" patch, plus
> adding "CONFIG_SUN8I_EMAC=y" and "CONFIG_PHY_REALTEK=y" to defconfig
> fixes the issue? You may need to enable CONFIG_DM_REGULATOR_FIXED=y as
> well, although this would become standard for all sunxi boards soon.
> 
> And you must NOT use SUNXI_SETUP_REGULATORS=0 in TF-A, as you need
> ALDO2 to be set up by TF-A. We introduced this build option to
> accommodate the OrangePi 3 board, which requires a specifically timed
> regulator setup, which both TF-A and U-Boot would not observe. To not
> crash the PHY with any incorrect regulator setup, we use this option to
> make at least Linux work. The side effect is that some peripherals
> (HDMI, Ethernet) will not work in U-Boot.
> Also please note that a reset from Linux might not affect the PMIC, so
> there might be different behaviour between and cold and warm boot.
> 
> Cheers,
> Andre
> 
> > >  		reg = <1>;
> > >  	};
> > >  };
> > > diff --git a/configs/orangepi_one_plus_defconfig
> > > b/configs/orangepi_one_plus_defconfig
> > > index aa5f540eb1..a1835492db 100644
> > > --- a/configs/orangepi_one_plus_defconfig
> > > +++ b/configs/orangepi_one_plus_defconfig
> > > @@ -8,3 +8,7 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
> > >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > >  CONFIG_USB_EHCI_HCD=y
> > >  CONFIG_USB_OHCI_HCD=y
> > > +CONFIG_SUN8I_EMAC=y
> > > +CONFIG_PHY_REALTEK=y
> > > +CONFIG_PHY_ETHERNET_ID=y
> > > +CONFIG_MACPWR="PD6"  
> > 
> > Adding linux-sunxi to the thread (I unfortunately forgot this list)
> > 
> 
> 

Hello

Note that there is already a try to fix this in upstream linux:
The v4 can be found at https://lore.kernel.org/linux-arm-kernel/Y3RDumClNkEW6L4F@lunn.ch/T/

And that I will send soon my last version https://github.com/montjoie/linux/tree/opi3-v5

Regards
