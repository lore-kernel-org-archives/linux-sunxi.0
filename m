Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD992F48
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Dec 2022 16:14:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id d14so13538965edj.11
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Dec 2022 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDlb7b8NBqMN6FWJbsdwCbz++tQ9pGZH0HQP9Vha+j0=;
        b=H/2S0Zq+OaVDvD9IH8/8d1nbHPkWgngnK7ikd2ZXWHqAKnIzEV8kj/zSSFfNSPkege
         boKhLT0OHv6eaCC5EOeUVCy3VQ0teCQG8OJ9McCRjAjJs+5qUM5MsLtaN+3mo+tFTBRo
         fGkheNu7sLbnYy8lDqdvLdafg5dXqSK4nptOUV1AJ4NsHhSElI4erCZMyYeInNx7XQw/
         Q97bfoQXyJktV6j4vTHr7uMxZiDvtIwBA5tmtTmU2H+6EnNlLoPucRNiK8A4dodDt2Ia
         owjlLk0ZT40qRz93hhbgDYsKTb2vBlYlYiWaBi7JXzvwRAooM55rxgijSsFoENN1HYjT
         yXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDlb7b8NBqMN6FWJbsdwCbz++tQ9pGZH0HQP9Vha+j0=;
        b=kGInabYEM/YJ/9b08cojctGmuRcFyjNxwPkkGeW5m3Alu5OF1Ce5QaZApRDzzlkGzE
         Ijk7pplit1bsvnB0KaFPrL/bKiSxAzH7XPD4yVnnBTPRkU+eU/zo9dZE5nYhYTcq2JhE
         sAtCajgHPf+r+tS1aLBdr1DuMTIOQyHyDraJIESnhv3nd2lUU27utPvuK3XC5zZhS3Z5
         iD1LegWmd7wrLkohdzfES7ETaWSEK+gZQu24EDqixlCydUhoNGm2ezDPzaGI+yZQRuq1
         4Lu/jBQE1zi+R5WfYaovQEKZslnTRdhOcXtbT68sIiYUF/4PMG5XphtjWJulYNCwUEs9
         ncqQ==
X-Gm-Message-State: ANoB5pntteFWTkAyynxs0xXO/lRQflhRVx+6eJqe/PgRy6KnUi5rjHjY
	rpfcczLmphVtfa5VUI4NGKZ3B3R2ZzM=
X-Google-Smtp-Source: AA0mqf6SZYRwCrRe8F8hI9hHXAmyiuaJ03Co1o5lmwf45xN7bXRcGEVGt33RBFPt3PtVlwUAN3wvqQ==
X-Received: by 2002:a05:6402:22fc:b0:470:18a8:3ca6 with SMTP id dn28-20020a05640222fc00b0047018a83ca6mr703563edb.23.1670861670501;
        Mon, 12 Dec 2022 08:14:30 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id t4-20020aa7d704000000b00463bc1ddc76sm3912226edq.28.2022.12.12.08.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:14:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 0/8] sunxi: Update H616 DRAM driver
Date: Mon, 12 Dec 2022 17:14:28 +0100
Message-ID: <2123971.irdbgypaU6@jernej-laptop>
In-Reply-To: <20221212010451.6fc99b11@slackpad.lan>
References:
 <20221211163213.98540-1-jernej.skrabec@gmail.com>
 <20221212010451.6fc99b11@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne ponedeljek, 12. december 2022 ob 02:04:51 CET je Andre Przywara 
napisal(a):
> On Sun, 11 Dec 2022 17:32:05 +0100
> Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
> 
> Hi Jernej,
> 
> many thanks for putting this together!
> I will have a more elaborate look at each patch later.
> 
> > Current H616 DRAM driver is completely customized to Orange Pi Zero2
> > board, which is currently the only H616 board supported by U-Boot.
> 
> Not anymore, I merged the X96 Mate support lately, after the DT got
> merged into the Linux tree.

Right. First part of sentence is still true, although I later remembered that 
some values are based on T95 values, those that are not used by Orange Pi 
Zero2.

> 
> Those are the values for the box I came up with:
> CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
> CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
> CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
> CONFIG_DRAM_SUN50I_H616_TPR0=0xc0000c05
> CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
> CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
> CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
> 
> based on this boot0 found in some firmware update image:
> 00045400  be 02 00 ea 65 47 4f 4e  2e 42 54 30 cc ba f3 80 
> |....eGON.BT0....| 00045410  00 c0 00 00 30 00 00 00  00 00 00 00 00 00 02
> 00  |....0...........| 00045420  00 00 02 00 00 00 00 00  00 00 00 00 34 2e
> 30 00  |............4.0.| 00045430  00 00 00 00 03 00 00 00  88 02 00 00 03
> 00 00 00  |................| 00045440  03 03 03 03 0e 0e 0e 0e  12 1c 00 00
> 01 00 00 00  |................| 00045450  fb 30 00 00 00 00 00 00  40 08 00
> 00 04 00 00 00  |.0......@.......| 00045460  08 00 00 00 00 00 00 00  00 00
> 00 00 00 00 00 00  |................| 00045470  00 00 00 00 00 00 00 00  00
> 00 00 00 00 00 00 00  |................| 00045480  00 00 00 00 00 00 00 00 
> 00 00 00 00 00 00 00 00  |................| 00045490  05 0c 00 c0 00 00 00
> 00  00 00 00 00 00 00 00 00  |................| 000454a0  80 80 80 33 07 00
> 2f 00  dd dd ff ff 57 75 df fe  |...3../.....Wu..| 000454b0  40 00 00 00 00
> 00 00 00  00 00 00 00 08 00 02 01  |@...............|
> 
> I would be grateful if you could verify this.

Looks correct. I'll use them in my v2 patches.

> 
> I built it, and it reported the 4GB correctly, also managed to boot into
> Linux just fine. No extensive testing, nor didn't I compare register
> dumps or disassembly (yet).
> 
> Cheers,
> Andre
> 
> P.S. Any plans on upstreaming support for your T95 <whatever> H616 TV
> box? That would probably help the case here.

Not really, X96 Mate is basically the same as T95, except DRAM configuration. 
As I said, I verified that these patches provide same register values as 
before. This includes those which were modeled after T95 DRAM values.

Best regards,
Jernej

> 
> > Needless to say, this is not ideal for adding new boards. With changes
> > in this series, all DDR3 boards are supported and all that is needed is
> > just vendor DRAM values extracted from Android image. New DRAM types
> > should also be easier to support, since a lot of constants used before
> > are not really DRAM type dependent.
> > 
> > Changes were verified by decompiling driver and generated values were
> > compared to previous, hard coded ones. This was done without dram_para
> > structures, so compiler was able to heavily optimize code and produce
> > constants.
> > 
> > Please take a look.
> > 
> > Best regards,
> > Jernej
> > 
> > Jernej Skrabec (8):
> >   sunxi: Fix write to H616 DRAM CR register
> >   sunxi: cosmetic: Fix H616 DRAM driver code style
> >   sunxi: parameterize H616 DRAM ODT values
> >   sunxi: Convert H616 DRAM options to single setting
> >   sunxi: Always configure ODT on H616 DRAM
> >   sunxi: Make bit delay function in H616 DRAM code void
> >   sunxi: Parameterize bit delay code in H616 DRAM driver
> >   sunxi: Parameterize H616 DRAM code some more
> >  
> >  .../include/asm/arch-sunxi/dram_sun50i_h616.h |  18 +
> >  arch/arm/mach-sunxi/Kconfig                   |  67 +--
> >  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 445 +++++++++++-------
> >  configs/orangepi_zero2_defconfig              |   8 +-
> >  4 files changed, 348 insertions(+), 190 deletions(-)




