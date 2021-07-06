Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F3E168
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 15:58:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83AE6106F;
	Tue,  6 Jul 2021 08:58:08 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603753F73B;
	Tue,  6 Jul 2021 08:58:07 -0700 (PDT)
Date: Tue, 6 Jul 2021 16:57:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, U-Boot-Denx <u-boot@lists.denx.de>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] cmd: ums: Enable by default for sunxi
Message-ID: <20210706165732.7a532568@slackpad.fritz.box>
In-Reply-To: <CAMty3ZDv3WPqRAMQEZe6D8BxJgz+MhzxdaKMQLUcG5K-CL7=Ew@mail.gmail.com>
References: <20210705232319.15149-1-andre.przywara@arm.com>
	<CAMty3ZDv3WPqRAMQEZe6D8BxJgz+MhzxdaKMQLUcG5K-CL7=Ew@mail.gmail.com>
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

On Tue, 6 Jul 2021 19:56:24 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

Hi Jagan,

thanks for the response!

> On Tue, Jul 6, 2021 at 4:53 AM Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > The ums command (presenting a U-Boot block device as a USB mass storage
> > device) is very useful for accessing eMMC devices via USB-OTG.
> >
> > At the moment we enable USB fastboot by default for Allwinner devices,
> > so it makes sense to do the same with USB mass storage, which is
> > actually more versatile and can be accessed on any USB host easily.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  cmd/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/cmd/Kconfig b/cmd/Kconfig
> > index a9fb4eead29..7b1c96910a8 100644
> > --- a/cmd/Kconfig
> > +++ b/cmd/Kconfig
> > @@ -1347,6 +1347,7 @@ config CMD_USB_MASS_STORAGE
> >         bool "UMS usb mass storage"
> >         select USB_FUNCTION_MASS_STORAGE
> >         depends on BLK && USB_GADGET
> > +       default y if ARCH_SUNXI && USB_MUSB_GADGET
> 
> UMS or any secondary-emmc accessible are considered in production
> u-boot config instead of mainline u-boot since we have fastboot
> already available for this kind of purpose. This might be one of the
> reason not conisidered UMS by default till now, atleast on Allwinner.

Well, I consider fastboot inferior to UMS. I understand that
Android phone hackers use it all the time, but I think having a block
device is far more versatile - you can partition it as you like, create
and populate a filesystem, dd an image to it, extract or update
firmware, etc. - most without extra software, even on Windows or Mac.
I think fastboot offers a reboot command, but are there other killer
reasons for it? And having the ums command in addition to fastboot does
not hurt, both would still work.
So are there any real arguments for not adding ums as well? I am not
sure many people tweak their config, so I would like to offer a decent
out-of-the-box experience, even for casual users.

Thanks,
Andre
