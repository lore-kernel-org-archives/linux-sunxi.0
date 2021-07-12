Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFC8168
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 11:53:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DF586D;
	Mon, 12 Jul 2021 04:53:52 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DBDB3F766;
	Mon, 12 Jul 2021 04:53:51 -0700 (PDT)
Date: Mon, 12 Jul 2021 12:53:19 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Samuel Holland
 <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy
 Zheng <icenowy@aosc.io>, Sunil Mohan Adapa <sunil@medhas.org>,
 linux-sunxi@lists.linux.dev, u-boot@lists.denx.de
Subject: Re: [RESEND PATCH v2 2/3] sunxi: eMMC: Improve automatic boot
 source detection
Message-ID: <20210712125319.31350da4@slackpad.fritz.box>
In-Reply-To: <881f4ae3-a635-29d2-1549-8a27b8781f37@samsung.com>
References: <20210712100651.6912-1-andre.przywara@arm.com>
	<CGME20210712100805epcas1p20992d4369e127fe979bd6003d938abcd@epcas1p2.samsung.com>
	<20210712100651.6912-3-andre.przywara@arm.com>
	<881f4ae3-a635-29d2-1549-8a27b8781f37@samsung.com>
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

On Mon, 12 Jul 2021 19:57:04 +0900
Jaehoon Chung <jh80.chung@samsung.com> wrote:

> Hi Andre,
> 
> On 7/12/21 7:06 PM, Andre Przywara wrote:
> > When the Allwinner BROM loads the SPL from an eMMC boot partition, it
> > sets the boot source byte to the same value as when booting from the
> > user data partition. This prevents us from determining the boot source
> > to load U-Boot proper from the proper partition for sure.
> > 
> > The generic SPL MMC code already looks at the enabled boot partition
> > number, to load U-Boot proper from the same partition, but this fails
> > if there is nothing bootable in this partition, as the BROM then
> > silently falls back to the user data partition, which the SPL misses.
> > 
> > To learn about the actual boot source anyway, we repeat the algorithm
> > the BROM used to select the boot partition in the first place:
> > - Test EXT_CSD[179] to check if an eMMC boot partition is enabled.
> > - Test EXT_CSD[177] to check for valid MMC interface settings.
> > - Check if BOOT_ACK is enabled.
> > - Check the beginning of the first sector for a valid eGON signature.
> > - Load the whole SPL.
> > - Recalculate the checksum to verify the SPL is valid.
> > 
> > If one of those steps fails, we bail out and continue loading from the
> > user data partition. Otherwise we load from the selected boot partition.
> > 
> > Since the boot source is needed twice in the boot process, we cache the
> > result of this test to avoid doing this costly test multiple times.
> > 
> > This allows the very same image file to be put onto an SD card, into the
> > eMMC user data partition or into the eMMC boot partition, and safely
> > loads the whole of U-Boot from there.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > 
> > (resent to also include forgotten U-Boot list)
> > 
> >  arch/arm/mach-sunxi/board.c | 80 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> > 
> > diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> > index e979e426dd1..2552c34733b 100644
> > --- a/arch/arm/mach-sunxi/board.c
> > +++ b/arch/arm/mach-sunxi/board.c
> > @@ -334,6 +334,86 @@ u32 spl_boot_device(void)
> >  	return sunxi_get_boot_device();
> >  }
> >  
> > +/*
> > + * When booting from an eMMC boot partition, the SPL puts the same boot
> > + * source code into SRAM A1 as when loading the SPL from the normal
> > + * eMMC user data partition: 0x2. So to know where we have been loaded
> > + * from, we repeat the BROM algorithm here: checking for a valid eGON boot
> > + * image at offset 0 of a (potentially) selected boot partition.
> > + * If any of the conditions is not met, it must have been the eMMC user
> > + * data partition.
> > + */
> > +static bool sunxi_valid_emmc_boot(struct mmc *mmc)
> > +{
> > +	struct blk_desc *bd = mmc_get_blk_desc(mmc);
> > +	uint32_t *buffer = (void *)(uintptr_t)CONFIG_SYS_TEXT_BASE;
> > +	int bootpart = EXT_CSD_EXTRACT_BOOT_PART(mmc->part_config);
> > +	uint32_t spl_size, emmc_checksum, chksum = 0;
> > +	ulong count;
> > +
> > +	/* The BROM requires BOOT_ACK to be enabled. */
> > +	if (!EXT_CSD_EXTRACT_BOOT_ACK(mmc->part_config))
> > +		return false;
> > +
> > +	/*
> > +	 * The BOOT_BUS_CONDITION register must be 4-bit SDR, with (0x09)
> > +	 * or without (0x01) high speed timings.
> > +	 */
> > +	if ((mmc->ext_csd[EXT_CSD_BOOT_BUS_WIDTH] & 0x1b) != 0x01 &&
> > +	    (mmc->ext_csd[EXT_CSD_BOOT_BUS_WIDTH] & 0x1b) != 0x09)
> > +		return false;
> > +
> > +	/* Partition 0 is the user data partition, bootpart must be 1 or 2. */
> > +	if (bootpart != 1 && bootpart != 2)
> > +		return false;
> > +
> > +	mmc_switch_part(mmc, bootpart);  
> 
> It can be failed to switch to bootpart. Doesn't need to control error?

Yeah, good point, we should check this. If we can't switch to the boot
partition, that hopefully means the BROM couldn't do either. In any case
we can't continue booting from there, so we can as well return false
here.

Cheers,
Andre

> Best Regards,
> Jaehoon Chung
> 
> > +
> > +	/* Read the first block to do some sanity checks on the eGON header. */
> > +	count = blk_dread(bd, 0, 1, buffer);
> > +	if (count != 1 || !is_boot0_magic(buffer + 1))
> > +		return false;
> > +
> > +	/* Read the rest of the SPL now we know it's halfway sane. */
> > +	spl_size = buffer[4];
> > +	count = blk_dread(bd, 1, DIV_ROUND_UP(spl_size, bd->blksz) - 1,
> > +			  buffer + bd->blksz / 4);
> > +
> > +	/* Save the checksum and replace it with the "stamp value". */
> > +	emmc_checksum = buffer[3];
> > +	buffer[3] = 0x5f0a6c39;
> > +
> > +	/* The checksum is a simple ignore-carry addition of all words. */
> > +	for (count = 0; count < spl_size / 4; count++)
> > +		chksum += buffer[count];
> > +
> > +	debug("eMMC boot part SPL checksum: stored: 0x%08x, computed: 0x%08x\n",
> > +	       emmc_checksum, chksum);
> > +
> > +	return emmc_checksum == chksum;
> > +}
> > +
> > +u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
> > +{
> > +	static u32 result = ~0;
> > +
> > +	if (result != ~0)
> > +		return result;
> > +
> > +	result = MMCSD_MODE_RAW;
> > +	if (!IS_SD(mmc) && IS_ENABLED(CONFIG_SUPPORT_EMMC_BOOT)) {
> > +		if (sunxi_valid_emmc_boot(mmc))
> > +			result = MMCSD_MODE_EMMCBOOT;
> > +		else
> > +			mmc_switch_part(mmc, 0);
> > +	}
> > +
> > +	debug("%s(): %s part\n", __func__,
> > +	      result == MMCSD_MODE_RAW ? "user" : "boot");
> > +
> > +	return result;
> > +}
> > +
> >  void board_init_f(ulong dummy)
> >  {
> >  	spl_init();
> >   
> 

