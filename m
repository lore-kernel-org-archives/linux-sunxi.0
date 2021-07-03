Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684072
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Jul 2021 23:25:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6068CD6E;
	Sat,  3 Jul 2021 16:25:20 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 190AB3F5A1;
	Sat,  3 Jul 2021 16:25:18 -0700 (PDT)
Date: Sun, 4 Jul 2021 00:24:44 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>,
 linux-sunxi@lists.linux.dev, Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH 0/8] sunxi: mmc: Fixes and speed increase
Message-ID: <20210704002444.22e1e507@slackpad.fritz.box>
In-Reply-To: <20210524233029.16417-1-andre.przywara@arm.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 May 2021 00:30:21 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

thanks to Jaehoon for reviewing some patches in here!

Can anyone else please have a look at this series?
I am tempted to push them in the upcoming merge window, to expose them
to a wider testing audience, but would really like to have some
people's eyes on it.

Also testing this on different boards would be much appreciated,
especially patch 7/8 deserves some scrutiny, I guess.

Thanks!
Andre

> While debugging some eMMC problem on the H616 SoC, I stumbled upon some
> weird code in the Allwinner MMC driver. Some closer inspection and some
> help from Ondrej later this series of fixes emerged:
> Some patches remove part of the #ifdef hell we needlessly had in the
> driver.
> A big chunk is around the "new timing mode", which all "newer" SoCs
> (since around 2015) have, and which requires some extra bit to be set. We
> didn't enable this mode for all SoCs, this is now fixed in patches 3-6.
> Patch 7 fixes a big performance problem we had due to using MMIO accesses
> for the actual data transfer, as opposed to DMA transfers used in Linux.
> Short from adding a lot of code to use DMA as well, we can actually halve
> the number of MMIO accesses on reads, effectively doubling the bus
> transfer performance. This helps the H6 a lot, but also improves the eMMC
> read performance.
> The final patch makes use of some generic MMC DT code, to parse generic
> DT properties. This allows us to remove sunxi specific code, but also
> adds support for "broken-cd" and more advanced MMC speed modes.
> 
> Please have a look and test this code on as many boards as possible.
> While a performance increase is nice, we don't want to risk data
> integrity over this, so please try to verify that it still works for
> you.
> 
> Cheers,
> Andre.
> 
> P.S. Patches 5 and 6 use different approaches to differentiate between
> SoCs specific quirks: Patch 5/8 selects an explicit symbol from the
> SoC specific sections in our Kconfig file, while patch 6/8 compares
> the selected SoC type in the C code. Please let me know which approach
> is better, I can then use this for both patches (and in the future).
> 
> Andre Przywara (8):
>   mmc: sunxi: Avoid #ifdefs in delay and width setup
>   mmc: sunxi: Fix warnings with CONFIG_PHYS_64BIT
>   mmc: sunxi: Fix MMC clock parent selection
>   mmc: sunxi: Cleanup "new timing mode" selection
>   mmc: sunxi: Enable "new timing mode" on all new SoCs
>   mmc: sunxi: Cleanup and fix self-calibration code
>   mmc: sunxi: Increase MMIO FIFO read performance
>   mmc: sunxi: Use mmc_of_parse()
> 
>  .../include/asm/arch-sunxi/clock_sun50i_h6.h  |   2 +-
>  arch/arm/include/asm/arch-sunxi/mmc.h         |   1 +
>  arch/arm/mach-sunxi/Kconfig                   |   3 +
>  drivers/mmc/sunxi_mmc.c                       | 160 +++++++++++-------
>  4 files changed, 102 insertions(+), 64 deletions(-)
> 

