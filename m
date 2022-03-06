Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E127810EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Mar 2022 09:40:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2dc348dab52so100197567b3.6
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Mar 2022 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbHyYTr6WOPJjB6Gi+P7cukHb81trN1p7PDNUlogpq0=;
        b=ULSSmk/qS6K+NUV9dXKDoKW48orew9LWfGZ1Cay/PkA+Mdf3Ct2cpAD5r4lfzceYmJ
         Wl3CwJg9d5TDzlXloE8ym4AdZhp3s6pKva8mY7Q1I5fXzH5qgx0y5HtPipp9+WarkXU+
         /0ufDpuHq2ZEZondl02FCAyeqc97Iq0AEsuB68CiDAGvazAf+j3YwVMuoyypj6xVcTq6
         OsU8UB4JsQmhBMwXpY2PIt7h2BXWzx91K7cRVD1qFCB5NzndCADnFW9MkbmYVAM0IJUI
         HOULKjSH6tiWhFK2A7tZRb2FvPlo1QIRyhiBkgdCx9M/nxfP7J45ldwO8b6otY8mKScD
         usow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbHyYTr6WOPJjB6Gi+P7cukHb81trN1p7PDNUlogpq0=;
        b=x9WWSiFMv97QHoTxGcAveSLAezyH+28SGddMolaYUJOPnzkrjqoqEnpD6+VzHHOhVz
         lgSit7ISG/3AJjcg2cMgpUdxfbdxwPREmC/rDmtqmA+GpqRus8Mp/UxHMVnnWAbpWK7o
         bNiCJYM7vPJiFZKjAdLjNl6yDaiYxd8Dm2NiXo/RGBJPHjn54AW8EIx0pR9tqORsuJYm
         UoAVTTrwM88HSa8TFj3gEK9NpXBHhOCIfXK9DS6wWIWKnz47maHGBsXaFTkScnv1yZNf
         NWFEOPzFA/dPT4ajCGfYJe0TJEfxVwstAtEeTQ9sZ6wsjpwAPHLFmqQ+yt5e4BqSjkv9
         x73A==
X-Gm-Message-State: AOAM533Q4ruzmPHKeHYxiWyLYF/5cI4oy0fPLfZIGw4FVi35D4pc7/Uq
	xBu453IrBWF/I7ZdLsJumJAouabTnSdRL00kZXM=
X-Google-Smtp-Source: ABdhPJxGHlUXwba52RmTK6Cc/YUTsTVchbtsUg2P2U70IppClc6ePUHTgfFCfjBEzN9w52V2RDjWTrl5gNHkDeOtC/Q=
X-Received: by 2002:a0d:f507:0:b0:2dc:348e:54af with SMTP id
 e7-20020a0df507000000b002dc348e54afmr4604951ywf.204.1646559658793; Sun, 06
 Mar 2022 01:40:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com> <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
 <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com> <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
 <1e828df4-7c5d-01af-cc49-3ef9de2cf6de@gmail.com> <1j8rts76te.fsf@starbuckisacylon.baylibre.com>
 <a4d3fef1-d410-c029-cdff-4d90f578e2da@gmail.com>
In-Reply-To: <a4d3fef1-d410-c029-cdff-4d90f578e2da@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 6 Mar 2022 10:40:47 +0100
Message-ID: <CAK4VdL08sdZV7o7Bw=cutdmoCEi1NYB-yisstLqRuH7QcHOHvA@mail.gmail.com>
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 5:35 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> When using polling the time difference between aneg complete and
> PHY state machine run is random in the interval 0 .. 1s.
> Hence there's a certain chance that the difference is too small
> to avoid the issue.
>
> > If I understand the proposed patch correctly, it is mostly about the phy
> > IRQ. Since I reproduce without the IRQ, I suppose it is not the
> > problem we where looking for (might still be a problem worth fixing -
> > the phy is not "rock-solid" when it comes to aneg - I already tried
> > stabilising it a few years ago)
>
> Below is a slightly improved version of the test patch. It doesn't sleep
> in the (threaded) interrupt handler and lets the workqueue do it.
>
> Maybe Amlogic is aware of a potentially related silicon issue?
>
> >
> > TBH, It bothers me that I reproduced w/o the IRQ. The idea makes
> > sense :/
> >
> >>
> [...]
> >
>
>
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index 7e7904fee..a3318ae01 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -209,12 +209,7 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
>                 if (ret)
>                         return ret;
>
> -               val = INTSRC_ANEG_PR
> -                       | INTSRC_PARALLEL_FAULT
> -                       | INTSRC_ANEG_LP_ACK
> -                       | INTSRC_LINK_DOWN
> -                       | INTSRC_REMOTE_FAULT
> -                       | INTSRC_ANEG_COMPLETE;
> +               val = INTSRC_LINK_DOWN | INTSRC_ANEG_COMPLETE;
>                 ret = phy_write(phydev, INTSRC_MASK, val);
>         } else {
>                 val = 0;
> @@ -240,7 +235,10 @@ static irqreturn_t meson_gxl_handle_interrupt(struct phy_device *phydev)
>         if (irq_status == 0)
>                 return IRQ_NONE;
>
> -       phy_trigger_machine(phydev);
> +       if (irq_status & INTSRC_ANEG_COMPLETE)
> +               phy_queue_state_machine(phydev, msecs_to_jiffies(100));
> +       else
> +               phy_trigger_machine(phydev);
>
>         return IRQ_HANDLED;
>  }
> --
> 2.35.1

I did a lot of testing with this patch, and it seems to improve things.
To me it completely resolves the original issue which was more easily
reproducible where I would see "Link is Up" but the interface did not
really work.
At least in over a thousand jobs, that never reproduced again with this patch.

I do see a different issue now, but it is even less frequent and
harder to reproduce. In those over a thousand jobs, I have seen it
only about 4 times.
The difference is that now when the issue happens, the link is not
even reported as Up. The output is a bit different than the original
one, but it is consistently the same output in all instances where it
reproduced. Looks like this (note that there is no longer Link is
Down/Link is Up):

[    2.186151] meson8b-dwmac c9410000.ethernet eth0: PHY
[0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
[    2.191582] meson8b-dwmac c9410000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[    2.208713] meson8b-dwmac c9410000.ethernet eth0: No Safety
Features support found
[    2.210673] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
[    2.218083] meson8b-dwmac c9410000.ethernet eth0: configuring for
phy/rmii link mode
[   22.227444] Waiting up to 100 more seconds for network.
[   42.231440] Waiting up to 80 more seconds for network.
[   62.235437] Waiting up to 60 more seconds for network.
[   82.239437] Waiting up to 40 more seconds for network.
[  102.243439] Waiting up to 20 more seconds for network.
[  122.243446] Sending DHCP requests ...
[  130.113944] random: fast init done
[  134.219441] ... timed out!
[  194.559562] IP-Config: Retrying forever (NFS root)...
[  194.624630] meson8b-dwmac c9410000.ethernet eth0: PHY
[0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
[  194.630739] meson8b-dwmac c9410000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[  194.649138] meson8b-dwmac c9410000.ethernet eth0: No Safety
Features support found
[  194.651113] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
[  194.657931] meson8b-dwmac c9410000.ethernet eth0: configuring for
phy/rmii link mode
[  196.313602] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
100Mbps/Full - flow control off
[  196.339463] Sending DHCP requests ., OK
...


I don't remember seeing an output like this one in the previous tests.
Is there any further improvement we can do to the patch based on this?

Thanks

Erico
