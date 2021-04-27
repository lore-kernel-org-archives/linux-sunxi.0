Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECAC2F80
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Apr 2021 08:11:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3209531B;
	Tue, 27 Apr 2021 01:11:08 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44493F694;
	Tue, 27 Apr 2021 01:11:06 -0700 (PDT)
Date: Tue, 27 Apr 2021 09:10:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Marek Vasut <marex@denx.de>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Samuel Holland
 <samuel@sholland.org>, Jagan Teki <jagan@amarulasolutions.com>,
 u-boot@lists.denx.de, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] usb: musb-new: Extend Allwinner quirk to newer SoCs
Message-ID: <20210427091032.045d079d@slackpad.fritz.box>
In-Reply-To: <fece3df8-b2d5-ab42-13b6-94d4f04bfc4a@denx.de>
References: <20210427000323.18285-1-andre.przywara@arm.com>
	<fece3df8-b2d5-ab42-13b6-94d4f04bfc4a@denx.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Apr 2021 02:37:20 +0200
Marek Vasut <marex@denx.de> wrote:

Hi,

> On 4/27/21 2:03 AM, Andre Przywara wrote:
> > As the comment in musb_regs.h describes, Allwinner saves the
> > MUSB_CONFIGDATA register, which always return 0 on those SoCs.
> > 
> > This is also true for the H6 and H616, so extend the quirk to those
> > controllers as well.
> > 
> > This fixes USB peripheral mode on H6 and H616 boards.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >   drivers/usb/musb-new/musb_regs.h | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/musb-new/musb_regs.h b/drivers/usb/musb-new/musb_regs.h
> > index c4d7203b851..bee1b715a95 100644
> > --- a/drivers/usb/musb-new/musb_regs.h
> > +++ b/drivers/usb/musb-new/musb_regs.h
> > @@ -432,7 +432,8 @@ static inline u8 musb_read_ulpi_buscontrol(void __iomem *mbase)
> >   static inline u8 musb_read_configdata(void __iomem *mbase)
> >   {
> >   #if defined CONFIG_MACH_SUN8I_A33 || defined CONFIG_MACH_SUN8I_A83T || \
> > -		defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I
> > +	defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I || \
> > +	defined CONFIG_SUN50I_GEN_H6  
> 
> Isn't there some better solution then ever-growing list of macros to 
> check, like e.g. a single CONFIG_MACH_SUNXI ?

I was wondering the same, but I think this does not apply to the older
SoCs (we use ARCH_SUNXI in the two functions above and below, so I
guess the differentiation here is deliberate). I will test this later.

So we could probably use the quirk also for the older, working(?) SoCs,
but I am not sure we should do that. CONFIG_SUN50I_GEN_H6 is already a
symbol covering multiple SoCs, so ideally we won't need to add many
more.
I can have a look if we have other checks like that in the code, then
maybe define a collective symbol for newer SoCs?

Cheers,
Andre
