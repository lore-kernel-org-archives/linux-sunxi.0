Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8EE1854
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Dec 2022 01:06:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9734B1FB;
	Sun, 11 Dec 2022 17:07:19 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5228D3F5A1;
	Sun, 11 Dec 2022 17:06:38 -0800 (PST)
Date: Mon, 12 Dec 2022 01:04:51 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 0/8] sunxi: Update H616 DRAM driver
Message-ID: <20221212010451.6fc99b11@slackpad.lan>
In-Reply-To: <20221211163213.98540-1-jernej.skrabec@gmail.com>
References: <20221211163213.98540-1-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Dec 2022 17:32:05 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

many thanks for putting this together!
I will have a more elaborate look at each patch later.

> Current H616 DRAM driver is completely customized to Orange Pi Zero2
> board, which is currently the only H616 board supported by U-Boot.

Not anymore, I merged the X96 Mate support lately, after the DT got
merged into the Linux tree.

Those are the values for the box I came up with:
CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
CONFIG_DRAM_SUN50I_H616_TPR0=0xc0000c05
CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557

based on this boot0 found in some firmware update image:
00045400  be 02 00 ea 65 47 4f 4e  2e 42 54 30 cc ba f3 80  |....eGON.BT0....|
00045410  00 c0 00 00 30 00 00 00  00 00 00 00 00 00 02 00  |....0...........|
00045420  00 00 02 00 00 00 00 00  00 00 00 00 34 2e 30 00  |............4.0.|
00045430  00 00 00 00 03 00 00 00  88 02 00 00 03 00 00 00  |................|
00045440  03 03 03 03 0e 0e 0e 0e  12 1c 00 00 01 00 00 00  |................|
00045450  fb 30 00 00 00 00 00 00  40 08 00 00 04 00 00 00  |.0......@.......|
00045460  08 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00045470  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00045480  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00045490  05 0c 00 c0 00 00 00 00  00 00 00 00 00 00 00 00  |................|
000454a0  80 80 80 33 07 00 2f 00  dd dd ff ff 57 75 df fe  |...3../.....Wu..|
000454b0  40 00 00 00 00 00 00 00  00 00 00 00 08 00 02 01  |@...............|

I would be grateful if you could verify this.

I built it, and it reported the 4GB correctly, also managed to boot into
Linux just fine. No extensive testing, nor didn't I compare register
dumps or disassembly (yet).

Cheers,
Andre

P.S. Any plans on upstreaming support for your T95 <whatever> H616 TV
box? That would probably help the case here.


> Needless to say, this is not ideal for adding new boards. With changes
> in this series, all DDR3 boards are supported and all that is needed is
> just vendor DRAM values extracted from Android image. New DRAM types
> should also be easier to support, since a lot of constants used before
> are not really DRAM type dependent.
> 
> Changes were verified by decompiling driver and generated values were
> compared to previous, hard coded ones. This was done without dram_para
> structures, so compiler was able to heavily optimize code and produce
> constants.
> 
> Please take a look.
> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (8):
>   sunxi: Fix write to H616 DRAM CR register
>   sunxi: cosmetic: Fix H616 DRAM driver code style
>   sunxi: parameterize H616 DRAM ODT values
>   sunxi: Convert H616 DRAM options to single setting
>   sunxi: Always configure ODT on H616 DRAM
>   sunxi: Make bit delay function in H616 DRAM code void
>   sunxi: Parameterize bit delay code in H616 DRAM driver
>   sunxi: Parameterize H616 DRAM code some more
> 
>  .../include/asm/arch-sunxi/dram_sun50i_h616.h |  18 +
>  arch/arm/mach-sunxi/Kconfig                   |  67 +--
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 445 +++++++++++-------
>  configs/orangepi_zero2_defconfig              |   8 +-
>  4 files changed, 348 insertions(+), 190 deletions(-)
> 

