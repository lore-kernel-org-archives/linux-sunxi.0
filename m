Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BB517F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 15:15:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BC7ED1;
	Mon, 24 May 2021 08:15:24 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 531523F73B;
	Mon, 24 May 2021 08:15:23 -0700 (PDT)
Date: Mon, 24 May 2021 16:15:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>, Kever Yang
 <kever.yang@rock-chips.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC PATCH 0/3] fastboot: sunxi: Determine MMC device at
 runtime
Message-ID: <20210524161508.2129096c@slackpad.fritz.box>
In-Reply-To: <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
References: <20210524003650.24469-1-andre.przywara@arm.com>
	<f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 May 2021 10:37:31 -0400
Sean Anderson <sean.anderson@seco.com> wrote:

> On 5/23/21 8:36 PM, Andre Przywara wrote:
>  > At the moment the fastboot code relies on the Kconfig variable
>  > CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
>  > flash command. This value needs to be the *U-Boot device number*, which
>  > is picked by the U-Boot device model at runtime. This makes it quite
>  > tricky and fragile to fix this variable at compile time, as other DT
>  > nodes and aliases influence the enumeration process.
>  >
>  > To make this process more robust, allow the device number to be picked at
>  > runtime, which sounds like a better fit to find this device number. Patch
>  > 1/3 introduces a weak function for that purpose.
>  > Patch 2/3 then implements this function for the Allwinner platform. The
>  > code follows the idea behind the existing Kconfig defaults: Use the eMMC
>  > device, if that exists, or the SD card otherwise. This patch is actually
>  > not sunxi specific, so might be adopted by other platforms as well.
>  > Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
>  > this up and remove the implicit assumption that the eMMC device is always
>  > device 1 (as least for the fastboot code).
>  >
>  > I would be curious if others think this is the right way forward.
>  > The fact that the U-Boot device numbers are determined at runtime
>  > seems to conflict with the idea of a Kconfig variable in the first place,
>  > hence this series. This brings us one step closer to the end goal of
>  > removing the "eMMC is device 1" assumption.  
> 
> I would actually favor removing CONFIG_FASTBOOT_FLASH_MMC_DEV
> altogether, and just specifying the device explicitly in fastboot
> commands. If you need to dynamically change the device, you can create
> some aliases. E.g. you could have something like
> 
> "fastboot_aliases=setenv fastboot_partition_alias_user ${mmcdev}.0:0"
> 
> and then run this variable just before calling `fastboot 0` (or whatever
> your usb device is).

Fine with me. I was actually wondering about this already, but didn't
want to disrupt every user, especially since I can't really test this
very well.

So can you use this explicit device naming from the host side already
with the current code? Can you give an example how this would look
like? The documentation I could find only speaks of the Android
partition names (like "system"), which requires environment variables
to work, IIUC?

Thanks,
Andre

>  >
>  > I am looking forward to any comments on this series!
>  >
>  > Cheers,
>  > Andre
>  >
>  > Andre Przywara (3):
>  >    fastboot: Allow runtime determination of MMC device
>  >    sunxi: Implement fastboot_get_mmc_device()
>  >    sunxi: Drop sunxi FASTBOOT_FLASH_MMC_DEV defaults
>  >
>  >   board/sunxi/board.c           | 37 +++++++++++++++++++++++++++++++++++
>  >   drivers/fastboot/Kconfig      |  4 +---
>  >   drivers/fastboot/fb_command.c |  6 +++---
>  >   drivers/fastboot/fb_common.c  |  3 ++-
>  >   drivers/fastboot/fb_mmc.c     | 12 ++++++++----
>  >   include/fastboot.h            |  7 +++++++
>  >   6 files changed, 58 insertions(+), 11 deletions(-)
>  >  

