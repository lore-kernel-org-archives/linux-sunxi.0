Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDE2CA1
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 18:31:14 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id i19so13625764qvx.12
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 10:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAq3Aw1ybEeRSqT/qCBaoBSWDhM07pp4fGD0hDfaeXE=;
        b=G+gXIy6/dGEYBoEmk30Mqf0MoK0ksDT2HDCt92EP/YgftwGMppCYKZATNJINqCjshT
         etykmpsRVi8TFnW1OIEEp4cBkvI0l3qCY9PeZZWqKSahvH8tlLgiyiRmMqzyFckdB3ru
         zzw9ALrEXU0rvAgs574EpRZZYKd9xqgdM5pxG5wSvgN1/jkX/+MfA3bYDiYRSCuurB/+
         8up0H1ALTJzbDrXsIic15n1lTWDxwUvyGOK1Sxtf4frSw5i6YwZDOonPnxB15harTqKW
         uh+MCafhdV8QPZ+k9n2m5MkS7YncsRP/ul5jIXkiV90gg7JotLmx/hV5cUc2or6DYdLU
         pfKQ==
X-Gm-Message-State: AOAM530Qq/yLjix9J3voomgRtuvFromX9Ioqd/g7zm7CP2BK+8QY2VyX
	tOvavV75TrcV9A+3Kqjb5LwL6BCark3MtYI9
X-Google-Smtp-Source: ABdhPJxpIoQNLFYnjCWhtdh1DHbFO0FWUB+eIQ/khI158ssZ/jhDafKs0nG085/a+NLZQZevCGB88w==
X-Received: by 2002:a05:6214:2b0e:: with SMTP id jx14mr19149057qvb.72.1643653872727;
        Mon, 31 Jan 2022 10:31:12 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id j13sm5824602qko.46.2022.01.31.10.31.11
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 10:31:11 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id p5so43132641ybd.13
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 10:31:11 -0800 (PST)
X-Received: by 2002:ab0:44c:: with SMTP id 70mr9021725uav.78.1643653861178;
 Mon, 31 Jan 2022 10:31:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220131172450.4905-1-saeed@kernel.org> <20220131095905.08722670@hermes.local>
In-Reply-To: <20220131095905.08722670@hermes.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Jan 2022 19:30:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU17cBzivFm9q-VwF9EG5MX75Qct=is=F2h+Kc+VddZ4g@mail.gmail.com>
Message-ID: <CAMuHMdU17cBzivFm9q-VwF9EG5MX75Qct=is=F2h+Kc+VddZ4g@mail.gmail.com>
Subject: Re: [PATCH net-next] net: kbuild: Don't default net vendor configs to y
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Saeed Mahameed <saeed@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Mark Einon <mark.einon@gmail.com>, 
	Lino Sanfilippo <LinoSanfilippo@gmx.de>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Chris Snook <chris.snook@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jeroen de Borst <jeroendb@google.com>, Catherine Sullivan <csully@google.com>, 
	David Awogbemila <awogbemila@google.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Jon Mason <jdmason@kudzu.us>, 
	Simon Horman <simon.horman@corigine.com>, Rain River <rain.1986.08.12@gmail.com>, 
	Zhu Yanjun <zyjzyj2000@gmail.com>, Shannon Nelson <snelson@pensando.io>, drivers@pensando.io, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Jiri Pirko <jiri@resnulli.us>, 
	Edward Cree <ecree.xilinx@gmail.com>, Martin Habets <habetsm.xilinx@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, Andy Gospodarek <andy@greyhouse.net>, 
	Michal Simek <michal.simek@xilinx.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jacob Keller <jacob.e.keller@intel.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Rob Herring <robh@kernel.org>, l.stelmach@samsung.com, 
	rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>, 
	Edwin Peer <edwin.peer@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Chan <michael.chan@broadcom.com>, Richard Cochran <richardcochran@gmail.com>, 
	Gerhard Engleder <gerhard@engleder-embedded.com>, Marcin Wojtas <mw@semihalf.com>, 
	Oleksij Rempel <linux@rempel-privat.de>, Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Slark Xiao <slark_xiao@163.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Liming Sun <limings@nvidia.com>, David Thompson <davthompson@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Prabhakar Kushwaha <pkushwaha@marvell.com>, 
	Omkar Kulkarni <okulkarni@marvell.com>, Shai Malin <smalin@marvell.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Gary Guo <gary@garyguo.net>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, intel-wired-lan@lists.osuosl.org, 
	linux-hyperv@vger.kernel.org, oss-drivers@corigine.com, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 31, 2022 at 6:59 PM Stephen Hemminger
<stephen@networkplumber.org> wrote:
> On Mon, 31 Jan 2022 09:24:50 -0800
> Saeed Mahameed <saeed@kernel.org> wrote:
>
> > From: Saeed Mahameed <saeedm@nvidia.com>
> >
> > NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
> >
> > Since all drivers belonging to a vendor are supposed to default to 'n',
> > defaulting all vendors to 'n' shouldn't be an issue, and aligns well
> > with the 'no new drivers' by default mentality.
> >
> > Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>
> This was done back when vendors were introduced in the network drivers tree.
> The default of Y allowed older configurations to just work.

And changing the defaults means all defconfigs must be updated first,
else the user's configs will end up without drivers needed.

> So there was a reason, not sure if it matters anymore.
> But it seems like useless repainting to change it now.

It might make sense to tune some of the defaults (i.e. change to
"default y if ARCH_*") for drivers with clear platform dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
