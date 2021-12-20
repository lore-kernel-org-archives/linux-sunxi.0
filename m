Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81EB173
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Dec 2021 17:01:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E786D6E;
	Mon, 20 Dec 2021 09:01:45 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45F803F774;
	Mon, 20 Dec 2021 09:01:44 -0800 (PST)
Date: Mon, 20 Dec 2021 17:01:41 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Simon Glass <sjg@chromium.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, Samuel Holland <samuel@sholland.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard
 <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: add board documentation
Message-ID: <20211220170141.21770084@donnerap.cambridge.arm.com>
In-Reply-To: <CAPnjgZ2QxLib_XLdaGzPFw8Q8yGo69UVxb5_prmMaafnLnoAeQ@mail.gmail.com>
References: <20211213010322.10726-1-andre.przywara@arm.com>
	<CAPnjgZ2QxLib_XLdaGzPFw8Q8yGo69UVxb5_prmMaafnLnoAeQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Dec 2021 09:37:08 -0700
Simon Glass <sjg@chromium.org> wrote:

Hi Simon,

> On Sun, 12 Dec 2021 at 18:03, Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Add some long overdue instructions for building and installing U-Boot on
> > Allwinner SoC based boards.
> > This describes the building process, including TF-A and crust, plus
> > installation to SD card, eMMC and SPI flash, both from Linux and U-Boot
> > itself. Also describe FEL booting.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >
> > please have a look whether this makes sense. Feel free to just try something,
> > and point out ambiguities or missing bits. For missing topics, please
> > send a follow-up patch ;-)
> >
> > Also this is quite long, shall this be split up in two (or more) files?
> >
> > This is what rst.ninjs.org made of it, if you prefer to read it formatted:
> > https://paste.c-net.org/PleasantNeedy
> >
> > Cheers,
> > Andre
> >
> >  doc/board/allwinner/index.rst |   9 +
> >  doc/board/allwinner/sunxi.rst | 304 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 313 insertions(+)
> >  create mode 100644 doc/board/allwinner/index.rst
> >  create mode 100644 doc/board/allwinner/sunxi.rst  
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> I agree that a follow-on patch to remove the duplicated files would be
> helpful, but this patch is a big step forward on its own.

Thanks! I will address the other comments ASAP.

> It would be interesting to convert sunxi to use binman.

But Samuel fixed that already, didn't he? Or is there anything left that
binman should do? We even now use mkimage to generate the magic BROM
SPL signature, and then let binman combine this with the FIT image into the
final binary. Or am I missing something here?

Or are you asking for patches that remove sunxi as the bad example from
the existing documentation? ;-)

Cheers,
Andre
