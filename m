Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F048D0
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 13:33:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N9dkB-1oCgu728aj-015WFZ for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar
 2022 14:33:30 +0100
Received: by mail-wr1-f42.google.com with SMTP id x15so28549562wru.13
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 05:33:30 -0800 (PST)
X-Gm-Message-State: AOAM530bgtRtPmfNtGcnlnQ2n7xtSmZCHsZPfKssF34e+ETb3JsGEZLT
	OliwGfMLXf0OMuwii3EqTw1AhjgUZCWQDZ9D27M=
X-Google-Smtp-Source: ABdhPJzBo8+XD8cBHZ+iV3CMpw1rAQ4Kt/pckl18z9wljYid5M+Byqeh0gtSd8eJwZBlQHJruvj8qEJHrBS/gynLDAY=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr12265687wri.219.1646746409902; Tue, 08
 Mar 2022 05:33:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com> <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
In-Reply-To: <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 14:33:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0fuVSYm097X-V9MZSm9AHNp8N8JMp2xiH5CYTApx5BaA@mail.gmail.com>
Message-ID: <CAK8P3a0fuVSYm097X-V9MZSm9AHNp8N8JMp2xiH5CYTApx5BaA@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Andre Przywara <andre.przywara@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:NZBFGH1hX+JOSwD5wE2TZhWJfr5Bgd7JdzVqmpzkk4D/T4M7j9x
 mCG0BtiUNItuKMxFirnHj32camky9xHC9uClc7MwdHklHRgJm1yMzwB5d/V5oyHEQVWftEi
 xknRqCAUBKd7NdJdGEelXEXdN3WRBhk9Xhs3bjs9g8lSOLMlDO+PCB0N0oIubsKKBqyyIdO
 It/uyqwhP/7sdtHI5we4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q0tLaUo6W4k=:8VsO9Bow2zpchMzbesXW3f
 rXALfEm0E7lK9IIQp4uTIoQGT6inab7VlgUzRkebUZgrA7OVvdIEF7480Z/gwJQEVVkruB/1Q
 jI2d8vAHtoHQ+TZxX+hJcbDRCrQ8rIDK8UnKho0c0AR09x4LLdFEDOSGejE4PbRa2Zvo0wCPT
 X+MsJPWqnbVwMjZp32FaRKaHRF3VqEK73ieRTxIHDlM5HmIjv3MAcOO89mgVcuZuB7CT4TSH5
 YI6WtEUmSxPboXhTO/7EXuDRv710hWkU/HGI5t3ZaxrdfMhdPty4UeISmreWBh+0ao9fAADy8
 l0l5udb2DPYzq+I2FGqMnDY8kbSETXQY3HpXMzwGGeTDtQvGXsfQTpmLlqUHeCFINoXIw/6dE
 xewRMWjqu2OIDlwsn/qgAcoV14e5VtwZOjwGAtpXO96JxS7EmR83qajMq/5lPMwXy6qjQiAs8
 dm2iq4wDujobCZeAOrO9l6MrmNnIL/s5wX6xFeWx7QBswZBfPsNDlPp0wtfyuMwTkuzMKSvvk
 SwG+SvX9S/gfngmW4eavLj8LNkHdEGF6sl57P/OmfZWW81TtkefXUZGmj4qkON1cbOPSsxjak
 JMmSBmRpwtwxySV2w90Y6Ml193DB/Q1tavyma9PCzGiNAcPVJZFd0eDXw5Yq3JyhWTP/uSR2s
 66/oEFsqtdvXqTEkuXprvNxnuHee0Ovv1quDW1zVWGlbpo5YRViQkUoQZeI7mA7cWen9GjZ2b
 Lfq+KbHg4LrU6ogUJUSomY2yoUFro0IEuGLnG+tCWKOKMWDB2NTMCmoUd6y90FDKPTzaC9ygC
 ST68Pyg4ELffsVt9Fxj42FONlibq5xLfvXMMXmRajwzwnx+I10=

On Tue, Mar 8, 2022 at 1:07 PM Andre Przywara <andre.przywara@arm.com> wrote:
> On Tue, 8 Mar 2022 10:38:37 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Mar 7, 2022 at 3:34 PM Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Some Kconfig options have changed, some other platforms have been
> > > removed.
> >
> > Please split this up into logical chunks: list the platforms that were removed
> > and remove only the lines corresponding to those platforms in one patch,
> > do functional changes in separate patches each with a reason for doing them,
> > and cleanups (moving lines to match the savedefconfig output, removing lines
> > that are now the default) in one final patch.
>
> Actually this patch is meant to be only about the last past: to sync
> multi_v5_defconfig with the output of "make savedefconfig". .config stays
> the same. I initially tried to chase down the reason for each line change,
> but gave up quickly, because it becomes tedious to learn about this,
> especially about symbols that got *removed*. Also Kconfig is somewhat
> sensitive, a single "select" or "default" change in one random Kconfig can
> affect the result of savedefconfig.
>
> As I noted in the commit message, the .config does *not* change as a result
> of this patch, the whole purpose is just to make the next patch clearer.

Ok, then just change the symbols that move around, not the ones that
may have gone missing unintentionally.

> So I can try find the reason for each removal, if you like, but I am not
> sure that's worthwhile? It is my understanding that Kconfig changes tend
> to accumulate cruft in the various defconfigs over time. In U-Boot we gave
> up on reasoning, and just regularly sync the output of savedefconfig over
> to the *_defconfigs, to keep them minimal and meaningful.
>
> And I found Olof's commit 30b10c77837c ("ARM: defconfig: re-run
> savedefconfig on multi_v* configs") as a precedence for this kind of cleanup.

I know, but I never liked doing this because it hides regressions.

> > >  CONFIG_AEABI=y
> > >  CONFIG_HIGHMEM=y
> > > -CONFIG_ZBOOT_ROM_TEXT=0x0
> > > -CONFIG_ZBOOT_ROM_BSS=0x0
> > >  CONFIG_ARM_APPENDED_DTB=y
> > >  CONFIG_ARM_ATAG_DTB_COMPAT=y
> > >  CONFIG_CPU_FREQ=y
> >
> > These were not removed, what happened here is that 'savedefconfig'
> > no longer produces the lines because they now match the defaults.
>
> Yes, I understand. Is there some policy here, for instance to keep
> those in, for clarity?

In this case, as with the moving lines around, there is no functional
change at all, and doing the same thing on older kernels will still
result in the same behavior. I'm not worried about those at all, so
just put them all into one patch.

> > > @@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
> > >  CONFIG_I2C_AT91=y
> > >  CONFIG_I2C_IMX=y
> > >  CONFIG_I2C_MV64XXX=y
> > > -CONFIG_I2C_NOMADIK=y
> > >  CONFIG_SPI=y
> > >  CONFIG_SPI_ATMEL=y
> > >  CONFIG_SPI_IMX=y
> >
> > This one is still there. Not sure why it's no longer enabled.
>
> It's not in the current .config. From what I can see, it depends on
> ARCH_AMBA, which is selected by ARCH_NOMADIK, but that one is not enabled
> by multi_v5_defconfig. Not sure if that is an oversight, or a change, a
> the dependency is bogus, or something else.
>
> If you find that useful, I can try to find those dependency chains for the
> other options, but I definitely lack the knowledge about the history of
> those old platforms, so I can't reason about them. But I could present you
> the findings and you can then say what to do?

I see this was the result of 66e0c12f9e17 ("ARM: nomadik: switch to use the
Nomadik I2C driver"). It's ok to remove this line and others like it,
just explain
what happened for these, as the driver is still enabled.

> > >  CONFIG_REGULATOR_FIXED_VOLTAGE=y
> > >  CONFIG_MEDIA_SUPPORT=y
> > >  CONFIG_MEDIA_CAMERA_SUPPORT=y
> > > -CONFIG_V4L_PLATFORM_DRIVERS=y
> > > -CONFIG_VIDEO_ASPEED=m
> > > -CONFIG_VIDEO_ATMEL_ISI=m
> > >  CONFIG_DRM=y
> > >  CONFIG_DRM_ATMEL_HLCDC=m
> > > -CONFIG_DRM_PANEL_SIMPLE=y
> > > -CONFIG_DRM_PANEL_EDP=y
> > >  CONFIG_DRM_ASPEED_GFX=m
> > > -CONFIG_FB_IMX=y
> > > -CONFIG_FB_ATMEL=y
> > > -CONFIG_BACKLIGHT_ATMEL_LCDC=y
> >
> > This doesn't look right at all. If you want to disable graphics support,
> > please do that in a separate patch and explain why we can't have those
> > any more. Are you running into problems with the vmlinux size?
>
> As I mentioned, the .config didn't change at all, so those options are
> already not included in mainline anymore.
>
> AFAICS, those last options depend on CONFIG_FB, which isn't enabled. Is
> that a regression due to the recent fbdev changes?

Correct, this part was clearly unintentional, and I don't ever want to see
a patch to remove lines like these with a changelog text that fails to
explain why we want them to be removed. We clearly have platforms
that are enabled in multi_v5_config that use some of those drivers, and
we had users that wanted them to be enabled.

I think there are three separate issues here: FB_IMX and FB_ATMEL
broke because of f611b1e7624c ("drm: Avoid circular dependencies for
CONFIG_FB"), VIDEO_ASPEED and VIDEO_ATMEL_ISI  broke
during b0cd4fb27665 ("media: Kconfig: on !EMBEDDED && !EXPERT,
enable driver filtering"), and PANEL_EDP was introduced in 310720875efa
("ARM: configs: Everyone who had PANEL_SIMPLE now gets
PANEL_EDP") without the option ever making it in [1]. These are all
bugs that need to be addressed individually, and not just in a single
defconfig file but across all the affected platforms.

         Arnd

[1] https://lore.kernel.org/all/CAD=FV=VbYcdSqxLHdSaDPh=X0hbW6VWV0mM-iFy3k0J1q+6MWg@mail.gmail.com/
