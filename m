Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D371E7A
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Mar 2022 10:33:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD2881650;
	Thu, 10 Mar 2022 02:33:47 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AC6E3FA27;
	Thu, 10 Mar 2022 02:33:45 -0800 (PST)
Date: Thu, 10 Mar 2022 10:33:41 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev,
 Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC
 Team <soc@kernel.org>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from
 savedefconfig
Message-ID: <20220310103342.74b8e516@donnerap.cambridge.arm.com>
In-Reply-To: <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
	<20220307143421.1106209-14-andre.przywara@arm.com>
	<CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
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

On Tue, 8 Mar 2022 10:38:37 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

Hi,

> On Mon, Mar 7, 2022 at 3:34 PM Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Some Kconfig options have changed, some other platforms have been
> > removed.  
> 
> Please split this up into logical chunks: list the platforms that were removed
> and remove only the lines corresponding to those platforms in one patch,
> do functional changes in separate patches each with a reason for doing them,
> and cleanups (moving lines to match the savedefconfig output, removing lines
> that are now the default) in one final patch.

OK, I did that, and will send that as a separate series, as it's not
really related to the F1C100 DT changes.

Please disregard patches 13/14 and 14/14 for now.

For the sake of completeness of this thread, this is what I found out:

> 
> >  CONFIG_AEABI=y
> >  CONFIG_HIGHMEM=y
> > -CONFIG_ZBOOT_ROM_TEXT=0x0
> > -CONFIG_ZBOOT_ROM_BSS=0x0
> >  CONFIG_ARM_APPENDED_DTB=y
> >  CONFIG_ARM_ATAG_DTB_COMPAT=y
> >  CONFIG_CPU_FREQ=y  
> 
> These were not removed, what happened here is that 'savedefconfig'
> no longer produces the lines because they now match the defaults.
> 
> > @@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
> >  CONFIG_I2C_AT91=y
> >  CONFIG_I2C_IMX=y
> >  CONFIG_I2C_MV64XXX=y
> > -CONFIG_I2C_NOMADIK=y
> >  CONFIG_SPI=y
> >  CONFIG_SPI_ATMEL=y
> >  CONFIG_SPI_IMX=y  
> 
> This one is still there. Not sure why it's no longer enabled.

ARCH_U300 was the only user, and we lost a prerequisite (ARCH_AMBA) when
it was removed, so this symbol cannot be selected anymore.
 
> 
> >  CONFIG_REGULATOR_FIXED_VOLTAGE=y
> >  CONFIG_MEDIA_SUPPORT=y
> >  CONFIG_MEDIA_CAMERA_SUPPORT=y
> > -CONFIG_V4L_PLATFORM_DRIVERS=y
> > -CONFIG_VIDEO_ASPEED=m
> > -CONFIG_VIDEO_ATMEL_ISI=m
> >  CONFIG_DRM=y
> >  CONFIG_DRM_ATMEL_HLCDC=m
> > -CONFIG_DRM_PANEL_SIMPLE=y
> > -CONFIG_DRM_PANEL_EDP=y
> >  CONFIG_DRM_ASPEED_GFX=m
> > -CONFIG_FB_IMX=y
> > -CONFIG_FB_ATMEL=y
> > -CONFIG_BACKLIGHT_ATMEL_LCDC=y  
> 
> This doesn't look right at all. If you want to disable graphics support,
> please do that in a separate patch and explain why we can't have those
> any more. Are you running into problems with the vmlinux size?

CONFIG_FB was not selected anymore, when DRM_KMS_FB_HELPER was removed, so
we lost all those drivers. I brought CONFIG_FB in explicitly, as
multi_v7_defconfig did a while ago.

More details in the commit messages of the upcoming series.

Cheers,
Andre


> >  CONFIG_LIBCRC32C=y
> >  CONFIG_DEBUG_INFO=y
> > -CONFIG_DEBUG_FS=y
> >  CONFIG_MAGIC_SYSRQ=y
> > +CONFIG_DEBUG_FS=y
> >  CONFIG_DEBUG_KERNEL=y
> >  # CONFIG_SCHED_DEBUG is not set
> >  # CONFIG_DEBUG_PREEMPT is not set  
> 
> This should probably go along with the ZBOOT_ROM change, it's
> only cosmetic.
> 
>         Arnd

