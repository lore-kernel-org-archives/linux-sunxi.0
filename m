Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8FE7C
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jun 2022 01:01:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F6D512FC;
	Thu, 23 Jun 2022 18:01:40 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 877183F534;
	Thu, 23 Jun 2022 18:01:38 -0700 (PDT)
Date: Fri, 24 Jun 2022 02:00:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Simon Glass <sjg@chromium.org>, Tom
 Rini <trini@konsulko.com>
Subject: Re: [PATCH] sunxi: fix initial environment loading without MMC
Message-ID: <20220624020040.3992190c@slackpad.lan>
In-Reply-To: <20220426152556.4a3ba3fb@donnerap.cambridge.arm.com>
References: <20220421003448.4517-1-andre.przywara@arm.com>
	<bed703d6-1820-8df4-747a-6114877dedee@sholland.org>
	<20220426152556.4a3ba3fb@donnerap.cambridge.arm.com>
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

On Tue, 26 Apr 2022 15:25:56 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Samuel,

> On Sat, 23 Apr 2022 16:01:00 -0500
> Samuel Holland <samuel@sholland.org> wrote:
> 
> Hi Samuel,
> 
> thanks for having a look and the comments.
> 
> > On 4/20/22 7:34 PM, Andre Przywara wrote:  
> > > Commit e42dad4168fe ("sunxi: use boot source for determining environment
> > > location") changed our implementation of env_get_location() and enabled
> > > it for every board, even those without MMC support (like the C.H.I.P.
> > > boards). However the default fallback location of ENVL_FAT does not cope
> > > very well without MMC support compiled in, so the board hangs when trying
> > > to initially load the environment.
> > > 
> > > Change the default fallback location to be ENVL_FAT only when the FAT
> > > environment support is enabled, and use ENVL_NOWHERE and ENVL_UBI as
> > > alternative fallbacks, when those sources are enabled.
> > > 
> > > This fixes U-Boot loading on the C.H.I.P. boards.
> > > 
> > > Fixes: e42dad4168fe ("sunxi: use boot source for determining environment location")
> > > Reported-by: Chris Morgan <macroalpha82@gmail.com>
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  board/sunxi/board.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > > index 89324159d55..befb6076ca6 100644
> > > --- a/board/sunxi/board.c
> > > +++ b/board/sunxi/board.c
> > > @@ -132,7 +132,14 @@ void i2c_init_board(void)
> > >   */
> > >  enum env_location env_get_location(enum env_operation op, int prio)
> > >  {
> > > -	enum env_location boot_loc = ENVL_FAT;
> > > +	enum env_location boot_loc;
> > > +
> > > +	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
> > > +		boot_loc = ENVL_NOWHERE;
> > > +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
> > > +		boot_loc = ENVL_FAT;
> > > +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
> > > +		boot_loc = ENVL_UBI;  
> > 
> > This could leave boot_loc uninitialized. And there is still an unconditional use
> > of ENVL_FAT in the BOOT_DEVICE_MMCx case.  
> 
> Yeah, it's a mess, and there doesn't seem to be a one-fits-all fallback
> value. Returning ENVL_UNKNOWN when prio is 0 definitely hangs, as does
> returning some source without having the corresponding driver compiled in,
> so getting this right *and* nice-looking is a bit tricky.
> 
> > >  	gd->env_load_prio = prio;  
> > 
> > I don't think the hook is supposed to change this variable.  
> 
> Yeah, don't remember why I initially put that in, I must have copied that
> from somewhere. All I remember is that this code is touchy (as the bug
> report leading to that patch shows), and there are quite some corner cases
> to test.
> 
> > I'm still a bit confused on the fallback logic you have in place. Splitting it
> > up into three blocks doesn't help. If the goal is to load the environment from
> > the boot device, while preferring filesystems over raw block devices, I propose
> > the following:  
> 
> Admittedly this gets messier, I mainly wanted to fix the regression
> quickly, since it already broke the release for the CHIP boards.
> I will have a closer look at your suggestion and check for those corner
> cases, but will probably go with that instead of piling up more cruft on
> my previous code ;-)

So I was about to submit your solution, but this is suffering from the
same old problem: we must not return ENVL_UNKNOWN on the first call.
FEL booting triggers this: it will lead to env_init() returning a
negative error value, which is fatal, as it's part of init_sequence_f[].
I think the proper fix is to treat this case the same as the -ENOENT
case at the end of env_init(), but I don't dare to do this generic
change this late in the cycle.
My plan is to hack-fix this for sunxi, for now (see below), then
propose the generic change for the next cycle. Does this sound OK?
Another solution is to always select ENV_IS_NOWHERE, then return this,
but I don't know if this has more side effects, so is also risky at
this point.

> > 
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index 427113534b..27508bd306 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -129,26 +129,38 @@
> >   * Try to use the environment from the boot source first.
> >   * For MMC, this means a FAT partition on the boot device (SD or eMMC).
> >   * If the raw MMC environment is also enabled, this is tried next.
> > - * SPI flash falls back to FAT (on SD card).
> >   */
> >  enum env_location env_get_location(enum env_operation op, int prio)
> >  {
> > -	enum env_location boot_loc = ENVL_FAT;
> > +	if (prio > 1)
> > +		return ENVL_UNKNOWN;
> > 
> > -	gd->env_load_prio = prio;
> > +	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
> > +		return ENVL_NOWHERE;
> > 
> >  	switch (sunxi_get_boot_device()) {
> >  	case BOOT_DEVICE_MMC1:
> >  	case BOOT_DEVICE_MMC2:
> > -		boot_loc = ENVL_FAT;
> > +		if (prio == 0) {
> > +			if (IS_ENABLED(CONFIG_ENV_IS_IN_EXT4))
> > +				return ENVL_EXT4;
> > +			if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
> > +				return ENVL_FAT;
> > +		}
> > +		if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
> > +			return ENVL_MMC;
> >  		break;
> >  	case BOOT_DEVICE_NAND:
> > +		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
> > +			return ENVL_UBI;
> >  		if (IS_ENABLED(CONFIG_ENV_IS_IN_NAND))
> > -			boot_loc = ENVL_NAND;
> > +			return ENVL_NAND;
> >  		break;
> >  	case BOOT_DEVICE_SPI:
> > +		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
> > +			return ENVL_UBI;
> >  		if (IS_ENABLED(CONFIG_ENV_IS_IN_SPI_FLASH))
> > -			boot_loc = ENVL_SPI_FLASH;
> > +			return ENVL_SPI_FLASH;
> >  		break;
> >  	case BOOT_DEVICE_BOARD:
> >  		break;
> > @@ -156,23 +168,6 @@
> >  		break;
> >  	}
> > 
> > -	/* Always try to access the environment on the boot device first. */
> > -	if (prio == 0)
> > -		return boot_loc;
> > -
> > -	if (prio == 1) {
> > -		switch (boot_loc) {
> > -		case ENVL_SPI_FLASH:
> > -			return ENVL_FAT;
> > -		case ENVL_FAT:
> > -			if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
> > -				return ENVL_MMC;
> > -			break;
> > -		default:
> > -			break;
> > -		}
> > -	}
> > -

+	/*
+	 * If we come here for the first call, we *must* return a valid
+	 * environment location other than ENVL_UNKNOWN, or the setup sequence
+	 * in board_f() will silently hang. This is arguably a bug in
+	 * env_init(), but for now pick one environment for which we know for
+	 * sure to have a driver for. For all defconfigs this is either FAT
+	 * or UBI, or NOWHERE, which is already handled above.
+	 */
+	if (prio == 0) {
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
+			return ENVL_FAT;
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
+			return ENVL_UBI;
+	}

Cheers,
Andre

> >  	return ENVL_UNKNOWN;
> >  }
> > 
> > 
> > Regards,
> > Samuel  
> 
> 

