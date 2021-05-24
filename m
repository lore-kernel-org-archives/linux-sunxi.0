Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8B817F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 14:57:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA706ED1;
	Mon, 24 May 2021 07:57:46 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436153F73B;
	Mon, 24 May 2021 07:57:45 -0700 (PDT)
Date: Mon, 24 May 2021 15:57:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>, Kever Yang
 <kever.yang@rock-chips.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC PATCH 2/3] sunxi: Implement fastboot_get_mmc_device()
Message-ID: <20210524155727.444a71f0@slackpad.fritz.box>
In-Reply-To: <c4cd77a4-5e61-d2a4-15e3-164024e0051f@seco.com>
References: <20210524003650.24469-1-andre.przywara@arm.com>
	<20210524003650.24469-3-andre.przywara@arm.com>
	<c4cd77a4-5e61-d2a4-15e3-164024e0051f@seco.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 May 2021 10:33:58 -0400
Sean Anderson <sean.anderson@seco.com> wrote:

Hi Sean,

> On 5/23/21 8:36 PM, Andre Przywara wrote:
> > The default MMC device to use for the fastboot flash command is hard to
> > decide at runtime, since the numbering of the MMC devices depends on
> > devicetree nodes. On the hardware side, the eMMC is connected to device
> > 2, but this might be U-Boot's device 1 or 2, depending on whether the DT
> > contains a WiFi node for the hardware MMC1 device.  
> 
> Can you fix this with aliases? e.g.
> 
> aliases {
> 	mmc0 = &mmc0;
> 	mmc1 = &mmc1;
> 	mmc2 = &mmc2;
> };
> 
> That way the mmcs will always have the same number even if (e.g.) hardware mmc 1 is absent.

Well, that is partly what we do today: we have a "mmc1=&mmc2;"(!) in
sunxi-u-boot.dtsi, to fix the device name for the eMMC to 1 (the
eMMC hardware controller is always &mmc2).
But actually this is fragile, and might collide when for instance the
above aliases get introduced (Rockchip got those already in Linux, and
there are patches proposed for sunxi as well, but they don't see much
love).
So I would rather see we remove the dependency on certain U-Boot device
numbers, and this patch here being the first step.

As I see it this new solution expresses directly what we want: use the
eMMC is we have one. And do this without relying on certain U-Boot
implementation or hardware details.

Apart from the above aliases being much easier, do you see problems
with this patch here? Happy to hear about any issues. And as it
stands atm, this would only be used for sunxi.

Cheers,
Andre

> > 
> > To avoid hardcoding this for each board, let's scan all MMC devices, and
> > try to find the eMMC device, given that this is enabled. If not, we use
> > the SD card.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >   board/sunxi/board.c | 37 +++++++++++++++++++++++++++++++++++++
> >   1 file changed, 37 insertions(+)
> > 
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index 21651a1bfca..5f64887e48b 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -625,6 +625,43 @@ int board_mmc_init(struct bd_info *bis)
> >   }
> >   #endif
> >   
> > +#ifdef CONFIG_FASTBOOT_FLASH_MMC
> > +int fastboot_get_mmc_device(void)
> > +{
> > +	struct udevice *dev;
> > +	static int mmc_dev = -1;
> > +	int sd_card = -1;
> > +
> > +	if (mmc_dev != -1)
> > +		return mmc_dev;
> > +
> > +	for (uclass_first_device(UCLASS_MMC, &dev);
> > +	     dev;
> > +	     uclass_next_device(&dev)) {
> > +		struct mmc *mmc = mmc_get_mmc_dev(dev);
> > +
> > +		mmc_init(mmc);
> > +		if (!mmc->has_init)
> > +			continue;
> > +
> > +		if (IS_SD(mmc)) {
> > +			sd_card = dev->seq_;
> > +			continue;
> > +		} else {
> > +			mmc_dev =  dev->seq_;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (mmc_dev == -1)
> > +		mmc_dev = sd_card;
> > +	if (mmc_dev == -1)
> > +		mmc_dev = 0;
> > +
> > +	return mmc_dev;
> > +}
> > +#endif
> > +
> >   #ifdef CONFIG_SPL_BUILD
> >   
> >   static void sunxi_spl_store_dram_size(phys_addr_t dram_size)
> >   

