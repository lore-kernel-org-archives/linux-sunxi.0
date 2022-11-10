Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E557412DAD
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 11:33:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18A031FB;
	Thu, 10 Nov 2022 03:34:04 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87C283F534;
	Thu, 10 Nov 2022 03:33:56 -0800 (PST)
Date: Thu, 10 Nov 2022 11:33:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Icenowy
 Zheng <uwu@icenowy.me>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 0/2] pinctrl: sunxi: Introduce DT-based pinctrl
 builder
Message-ID: <20221110113352.32daa5c6@donnerap.cambridge.arm.com>
In-Reply-To: <CACRpkdb=5mobcWBJYtXd=nC7A+Uo__itk0F9oZBeTjWHBkBU1w@mail.gmail.com>
References: <20221110014255.20711-1-andre.przywara@arm.com>
	<CACRpkdb=5mobcWBJYtXd=nC7A+Uo__itk0F9oZBeTjWHBkBU1w@mail.gmail.com>
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

On Thu, 10 Nov 2022 11:21:02 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

Hi Linus,

thanks for having a look!

> On Thu, Nov 10, 2022 at 2:44 AM Andre Przywara <andre.przywara@arm.com> wrote:
> 
> > Compared to my previous effort almost exactly five years ago [1], this
> > new version drops the idea of describing the pinctrl data entirely in
> > the DT, instead it still relies on driver provided information for that.  
> (...)
> > On the DT side all that would be needed is *one* extra property per
> > pin group to announce the mux value:
> >
> >         uart0_pb_pins: uart0-pb-pins {
> >                 pins = "PB9", "PB10";
> >                 function = "uart0";
> >                 pinmux = <2>;
> >         };  
> 
> So what you need to do is to convince the device tree people that this
> is a good idea.
> 
> For me as linux maintainer it's no big deal, it's fine either way. The new
> code looks elegant.
> 
> But from a DT point of view this needs to make sense also for Windows
> and BSD, so that is who you have to convince. If it is possible to derive
> the same information from the compatible string (like today) that will
> need an extended argument why all operating systems will benefit from
> this.

This is actually an argument in favour of it: at the moment *every* OS
(or DT user) has to carry some form of this table[1]. For U-Boot this is a
major pain, for instance, and we came up with some minimal and
simplified version of that (assuming one pinmux per function name,
ignoring different mappings in different ports: [2]), but we are already
touching its limits.
And I don't think this DT argument counts anyway: we already store a much
bigger chunk of "information" in the DT, namely the function name. This has
no technical meaning, really, other than to map this to a 4-bit value
internally. I don't know why we have an information like "UART0 is using
the 'uart0' pin group" in the DT, but refuse to put the actual
hardware information in there. We could possibly even get rid of the
string, and derive this from the node name, if we need some human readable
identifier.

And just to make sure: I don't propose to change this for existing DTs,
it's just for new SoCs going forward. Allwinner at the moment spins out
many SoCs with only little differences, but all require this largish
table, since the pin assignments are the ones that differ.

Cheers,
Andre

[1]
https://github.com/freebsd/freebsd-src/blob/main/sys/arm/allwinner/a64/a64_padconf.c
[2]
https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pinctrl/sunxi/pinctrl-sunxi.c#L587-605
