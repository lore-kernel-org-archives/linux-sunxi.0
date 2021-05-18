Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26F71
	for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 17:32:03 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id di13so12199369edb.2
        for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2OGOVQmmsBWTvxH+rz+qI7vPBDoeuwDbD9Dj3QWW7jI=;
        b=p7WXsPYyknzwXZxSq8ebnIVGfVuMQl5zwUbc9M5of4nTM5IRYINN+LRgHXXv/xBJGT
         2XPa8kp53Tcg7Ljrgg+amS/WBZgx+SfFotLCcU5HmHbo3VPBLIexbfR3MM0Fa/tzcI7o
         ksaqFIgDTOiFBkZzpz2hGvRAnCB/xmcsQrHbyU9IZbSzOxz1Ebr9XUmHMlmecumneGCG
         f8sDjGF9EnSBbuBDOyrY8pjD3s0XPth5IfVQfG5y7XDkHTLkAWMm/IpeDce1qWPy/15X
         2F2ptJRcFNsfzLkjpHLif7SyMuiXYeUh2b9DWdE7FWjSPlyxT7A4OpS2ZegLNpkrf3gq
         z6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2OGOVQmmsBWTvxH+rz+qI7vPBDoeuwDbD9Dj3QWW7jI=;
        b=r+CAiy2Emh0BUvtj8XFqvayJy0jPBjOHoG2be9d5xRZxw1sx/198XNiwNmwCvyU2vd
         +RusXcicHjTGFvkma5GgWNUpqcRmP+s9DAmsycEPW0TJw+991CZhBCpFcW7Dzr3zs7vC
         C+hAQd5YKPsOIsVZjyZXO6u9cU/A9676IjfiVO5zNRPzhkrLdi+F8lwm40BFbpHYzmec
         RGinPChMd5sOYqSE90jSeQHb7WjHa1qJU4o4K+16xSRvvxINHC25y6H+uNP01KbqFcVS
         09m5IMX9Ov9CxEnPOUFp/gshfvad6ralVb6VPANuT1QH8KHhfyHtD3mlnAJ/jbczkJs5
         /oJA==
X-Gm-Message-State: AOAM5302cd0Aat6JfoYJFppbe9KjVg9GOUQonvowtbLg4yAJHPcPVoJj
	bSXRhmi7QcRjDuDteCeVY+k=
X-Google-Smtp-Source: ABdhPJzSATLoy2D71JHE3e6bJON1d2UgPNcJgNdxmMRvs3TgRZjAJWjrmKrGr/Gja4hl4q6yJ+OQmw==
X-Received: by 2002:a05:6402:3494:: with SMTP id v20mr8344662edc.169.1621359121961;
        Tue, 18 May 2021 10:32:01 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id n25sm13380145edb.26.2021.05.18.10.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 10:32:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Subject: Re: Allwinner H616 USB support woes
Date: Tue, 18 May 2021 19:32:00 +0200
Message-ID: <1657728.PX7fZn3zjf@kista>
In-Reply-To: <20210518111008.20f0ea1c@slackpad.fritz.box>
References: <20210518111008.20f0ea1c@slackpad.fritz.box>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne torek, 18. maj 2021 ob 12:11:18 CEST je Andre Przywara napisal(a):
> Hi,
> 
> I wanted to ask for some advice on the proper upstream H616 USB
> support. This is the only problem left before I can post v6 of the
> H616 support series.
> The main problem is that only controller 2 (EHCI2+PHY2) works on its
> own, all other ports need some help from controller 2.
> Just enabling the EHCI2 DT node does the trick, but with some help from
> Samuel and Jernej (who were looking into the BROM) I wiggled it down to
> the following things actually needed:
> - CLK_BUS_PHY2 and RST_BUS_PHY2 need to be enabled.
> - PMU2.SIDDQ (0x05310810[3]) needs to be clear.
> We can add the clock and reset to the list of clocks and resets in the
> other OHCI/EHCI DT nodes, so that's not a real problem.
> 
> But this SIDDQ bit is a bit nasty in the details:
> It would only need to be flipped once, and wouldn't be changed
> back by any reset bits. So what would work is to do this
> once in U-Boot. However to actually be able to access this register, we
> need CLK_BUS_EHCI2 to be ungated. What works in U-Boot is:
> => mw.l 0x3001a8c 0x40	/* pass USBEHCI2_GATING */
> => mw.l 0x5310810 0	/* clear SIDDQ in PMU2 */
> => mw.l 0x3001a8c 0	/* mask USBEHCI2_GATING again */
> 
> Now I would rather see this done in Linux, in the kernel's
> phy-sun4i-usb.c, to be self contained and independent.
> The easiest way looks like to call sun4i_usb_phy_init() again for PHY2,
> after this function is called for another PHY. So at the end of
> sun4i_usb_phy_init() (simplified code just for demonstration):
> 
> 	if (need_phy2 && phy->index != 2)
> 		sun4i_usb_phy_init(data->phys[2].phy);
> (that does a bit more than is really needed, but OK)
> 
> However this doesn't work, because CLK_BUS_EHCI2 is still gated, it is
> only unmasked in ehci-platform.c, when EHCI2 in initialised.
> And annoyingly ehci-platform.c only parses 4 clocks, so adding
> CLK_BUS_EHCI2 to the DT would be the fifth in the ehci<x> nodes (three
> at the moment plus the still needed CLK_BUS_PHY2 plus CLK_BUS_EHCI2).
> 
> Extending this limit is trivial, but sounds a bit like a stretch, since
> it's outside of sunxi code and technically the clock is just needed for
> initialisation, not during runtime.
> 
> Do you guys have any idea how to best solve this?
> I would prefer some change confined to phy-sun4i-usb.c, without
> bending the DT parts too much. The other alternatives are a U-Boot
> solution or extending the limit in ehci-platform.c.
> 
> Would be grateful for any input!

First, thanks for working on this!

Maybe I'm missing something, but wouldn't be adding CLK_BUS_EHCI2 to usbphy 
node and clearing PHY2 SIDDQ at the end of sun4i_usb_phy_probe() be enough? At 
least judging by your U-Boot commands. PHY driver must be initialized before 
ohci/ehci anyway.

Best regards,
Jernej



