Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500244C9A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 16:09:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFE391FB;
	Tue, 17 Jan 2023 08:10:04 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB3D93F67D;
	Tue, 17 Jan 2023 08:09:21 -0800 (PST)
Date: Tue, 17 Jan 2023 16:09:14 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117160914.7c2ba373@donnerap.cambridge.arm.com>
In-Reply-To: <20230117131518.GW3880571@bill-the-cat>
References: <20230117120938.818180-1-andre.przywara@arm.com>
	<20230117131518.GW3880571@bill-the-cat>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jan 2023 08:15:18 -0500
Tom Rini <trini@konsulko.com> wrote:

Hi Tom,

> On Tue, Jan 17, 2023 at 12:09:38PM +0000, Andre Przywara wrote:
> 
> > Commit 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconfig")
> > moved some NS16550 configuration variables into Kconfig.
> > Among those there is CONFIG_SYS_NS16550_REG_SIZE, which used to be only
> > defined for SPL build runs, but now is always set (thanks for Kconfig).
> > However this breaks the gating logic in ns16550.h, where we *override*
> > this variable for DM build, as we learn this setting from the DT instead.
> > 
> > As a consequence, we did the register shift twice: once when building
> > the register struct (as required for non-DM SPL builds), but then also
> > again in the driver after we parsed the reg-shift DT property.
> > 
> > Change the logic to match what the comment says: only observe
> > CONFIG_SYS_NS16550_REG_SIZE when not using DM, and ignore it otherwise.
> > 
> > This fixes U-Boot proper for all sunxi boards, since they are relying
> > on this driver being build non-DM for the SPL, but DM for U-Boot proper.
> > 
> > Fixes: 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconfig")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> > 
> > this is admittedly a quick fix, to get sunxi booting again. This whole
> > code around the register access looks somewhat bonkers, to be honest,
> > but at the moment I don't have time to rework this.
> > Another possible "quicker fix" would be use a separate variable for the
> > register shift, so that we don't have to redefine a Kconfig variable.
> > Another idea would be to get rid of the struct for the registers
> > altogether, to remove the hacks about when to shift.
> > 
> > Cheers,
> > Andre
> > 
> >  include/ns16550.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/ns16550.h b/include/ns16550.h
> > index 243226fc3d9..e9e2aeedd16 100644
> > --- a/include/ns16550.h
> > +++ b/include/ns16550.h
> > @@ -26,11 +26,12 @@
> >  
> >  #include <linux/types.h>
> >  
> > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SIZE)
> > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> >  /*
> >   * For driver model we always use one byte per register, and sort out the
> >   * differences in the driver
> >   */
> > +#undef CONFIG_SYS_NS16550_REG_SIZE
> >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> >  #endif  
> 
> Does:
> https://patchwork.ozlabs.org/project/uboot/patch/20230110161946.3816866-5-trini@konsulko.com/
> work for you as well?

Unfortunately not. This changed condition there does not trigger for
sunxi. If I hack it that it applies, but only to the proper build, it
works, though. But I don't feel like adding to this #if even more ;-)

Cheers,
Andre
