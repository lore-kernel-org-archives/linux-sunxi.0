Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA00320E4
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Mar 2022 22:10:42 +0000 (UTC)
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
	(Authenticated sender: petr@true.cz)
	by smtp-out.xnet.cz (Postfix) with ESMTPSA id B12CE3334;
	Sun, 20 Mar 2022 23:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=true.cz; s=xnet;
	t=1647814234; bh=2AMFer/rFPCmjU48W8GTZLINgPduqpekH9m1R3F7NGQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=HILxYXGJKOiMyC6ndZ8ZXjquUc/0Ofi6fpWXLZK0bxCPQFTxW/q88V4YaStcLjhPZ
	 wmvR2ry6r5Aj3OVY7kbECBv18Ou4Yn0mjePFi1DHhktiV7ScrPXYdJSp4qpROHH3U6
	 Pc21E9Uk168ZDYWcle16HgYryIPsqQtsbFhfJUWY=
Received: 
	by meh.true.cz (OpenSMTPD) with SMTP id 1e165c9a;
	Sun, 20 Mar 2022 23:10:09 +0100 (CET)
Date: Sun, 20 Mar 2022 23:10:31 +0100
From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: A20-OLinuXino-LIME2 network regression [Was: [PATCH v2 1/5] sunxi:
 move non-essential code out of s_init()]
Message-ID: <20220320221031.GA20535@meh.true.cz>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
References: <20220201014116.25864-1-andre.przywara@arm.com>
 <20220201014116.25864-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201014116.25864-2-andre.przywara@arm.com>
X-PGP-Key: https://gist.githubusercontent.com/ynezz/477f6d7a1623a591b0806699f9fc8a27/raw/a0878b8ed17e56f36ebf9e06a6b888a2cd66281b/pgp-key.pub

Andre Przywara <andre.przywara@arm.com> [2022-02-01 01:41:12]:

Hi Andre,

> Since we have an SPL, which is called right after s_init(), move those
> calls to our board_init_f() function. As we overwrite this only for
> the SPL, this has the added benefit of not doing this setup *again*
> shortly afterwards, when running U-Boot proper.

something didn't went as expected, since this commit has broken ethernet on my
A20-OLinuXino-LIME2:

 U-Boot SPL 2022.04-rc4-00052-g2a243d9bd62f (Mar 20 2022 - 22:57:07 +0100)
 DRAM: 1024 MiB
 CPU: 912000000Hz, AXI/AHB/APB: 3/2/2
 Trying to boot from FEL


 U-Boot 2022.04-rc4-00052-g2a243d9bd62f (Mar 20 2022 - 22:57:07 +0100) Allwinner Technology

 CPU:   Allwinner A20 (SUN7I)
 Model: Olimex A20-OLinuXino-LIME2-eMMC
 DRAM:  1 GiB
 Core:  38 devices, 19 uclasses, devicetree: separate
 WDT:   Not starting watchdog@1c20c90
 MMC:   mmc@1c0f000: 0, mmc@1c11000: 1
 Loading Environment from FAT... Unable to read "uboot.env" from mmc0:1...
 Unknown monitor
 Unknown monitor
 In:    serial
 Out:   serial
 Err:   serial
 Allwinner mUSB OTG (Peripheral)
 Net:   Could not get PHY for ethernet@1c50000: addr 1

Reverting this commit fixes it:

 Net:   eth0: ethernet@1c50000, eth1: usb_ether

Cheers,

Petr
