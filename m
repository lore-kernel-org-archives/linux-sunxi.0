Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D2870
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 14:13:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73B1F31B;
	Tue, 30 Mar 2021 07:13:39 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 523C63F719;
	Tue, 30 Mar 2021 07:13:38 -0700 (PDT)
Date: Tue, 30 Mar 2021 15:13:28 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Samuel Holland
 <samuel@sholland.org>, Simon Glass <sjg@chromium.org>, Tom Rini
 <trini@konsulko.com>, U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi
 <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] sunxi: dts: H616: Drop reserved-memory node
Message-ID: <20210330151328.661324b7@slackpad.fritz.box>
In-Reply-To: <CAMty3ZDpETzmE=1CRo2d3yT4FN0nSi7p+pvf8cLjBSwfu7Kpkg@mail.gmail.com>
References: <20210330130122.3915-1-andre.przywara@arm.com>
	<20210330130122.3915-3-andre.przywara@arm.com>
	<CAMty3ZDpETzmE=1CRo2d3yT4FN0nSi7p+pvf8cLjBSwfu7Kpkg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Mar 2021 18:58:23 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

Hi Jagan,

> On Tue, Mar 30, 2021 at 6:31 PM Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Trusted Firmware now adds the /reserved-memory subnode to the DT at
> > runtime[1], putting in the right values.
> >
> > Drop our hard-coded version, as this might clash with the actual values
> > (which have also changed), and rely on TF-A to add the node.
> >
> > [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7770
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/dts/sun50i-h616.dtsi | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/arch/arm/dts/sun50i-h616.dtsi b/arch/arm/dts/sun50i-h616.dtsi
> > index 953e8fac20f..dd4d2f31111 100644
> > --- a/arch/arm/dts/sun50i-h616.dtsi
> > +++ b/arch/arm/dts/sun50i-h616.dtsi
> > @@ -51,18 +51,6 @@
> >                 };
> >         };
> >
> > -       reserved-memory {
> > -               #address-cells = <2>;
> > -               #size-cells = <2>;
> > -               ranges;
> > -
> > -               /* 512KiB reserved for ARM Trusted Firmware (BL31) */
> > -               secmon_reserved: secmon@40000000 {
> > -                       reg = <0x0 0x40000000 0x0 0x80000>;
> > -                       no-map;
> > -               };
> > -       };
> > -  
> 
> As said always. it's better to not touch Linux dts files. If the same
> fix same available in Linux add SHA1 on the commit message otherwise
> keep /delete-node on -u-boot.dtsi. This how we are maintaining sofar
> at least on sunxi.

this DT is not in Linux yet.
As this is a new SoC, we have to start at some point, and getting TF-A,
Linux and U-Boot patches merged at the same time is virtually
impossible. Ideally we have some bootloader support first, so that
people can test the kernel patches, for instance.

So this DT is a tentative one, just here to make U-Boot happy. It is
expected to change, and will be synced once it's merged into Linux.

As mentioned, the TF-A patches were changed after the U-Boot patches
were merged, so this node was needed back then, but is obsolete now.

Cheers,
Andre
