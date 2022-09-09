Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046C65A
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Sep 2022 08:11:38 +0000 (UTC)
Received: from [91.65.34.88] (helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oWZ6e-0003Yp-0w; Fri, 09 Sep 2022 10:11:20 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: samuel@sholland.org, Conor.Dooley@microchip.com
Cc: wens@csie.org, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peter@korsgaard.com, uwu@icenowy.me
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
Date: Fri, 09 Sep 2022 10:11:08 +0200
Message-ID: <3687587.6M6d0yLqnL@diego>
In-Reply-To: <52217b50-c22f-5a21-e509-05d178e4a173@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org> <8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@sholland.org> <52217b50-c22f-5a21-e509-05d178e4a173@microchip.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 9. September 2022, 09:18:40 CEST schrieb Conor.Dooley@microchip.com:
> On 09/09/2022 05:37, Samuel Holland wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > 
> > Hi Conor,
> > 
> > On 8/19/22 5:10 PM, Conor.Dooley@microchip.com wrote:
> >> Finally got around to giving this a go with the fix for loading 
> >> modules which is mostly what was blocking me before..
> >> 
> >> On 15/08/2022 06:08, Samuel Holland wrote:
> >>> "D1 Nezha" is Allwinner's first-party development board for the
> >>> D1 SoC. It was shipped with 512M, 1G, or 2G of DDR3. It supports
> >>> onboard audio,
> >> 
> >> I am really not keen on the way you have things, with the memory 
> >> nodes removed from the device tree. I know your preferred flow for
> >> booting these things might be to pass the dtb up from U-Boot, but I
> >> think the devicetree in the kernel should be usable in a standalone
> >> manner, even if that is the barest-minimum memory config.
> > 
> > That is simply not possible to guarantee. As an obvious example,
> > consider the MangoPi MQ-Pro board with socketed DRAM:
> 
> Yeah, I knew in my heart-of-hearts that this probably was a non
> runner.
> 
> > 
> > https://twitter.com/mangopi_sbc/status/1516225559214583808
> > 
> > But focusing on the /memory node misses the bigger picture. The DTB
> > is passed through _all_ of the firmware stages, and gets patched by
> > every one of them:
> > 
> > - SPL/boot0 adds the /memory node with the detected DRAM size. If the
> > in-tree DTS has a "minimum memory config" (which for a board with
> > socketed DRAM means the smallest possible die), I guarantee people
> > will use it and complain about missing DRAM.
> 
> True, but they are also complaining about missing DRAM as is ;)
> No possibility of winning here unfortunately.
> 
> > - The SBI implementation reserves memory for itself and any possible
> > secure partitions. Right now, booting happens to work without the
> > reserved-memory node because the SBI implementation is loaded at the
> > beginning of RAM, and Linux ignores RAM below the kernel load
> > address.
> 
> Surely this sort of thing is a common problem though, it's not like
> any of us are doing something unique here are we? At least if there
> was a arch wide policy about the validity of the upstream DTS in the
> face of the SBI etc inflicting changes there'd be something to point
> to. I am just looking at this from a "everyone else has a usable dts
> in the kernel, but the D1 boards wont have" point of view.

Not sure if this would fly, but what about having an sbi call for
"modify this dtb for me as well"?

I'll just assume that spl/boot0 + main uboot come in some sort
of package so moving the memory node over should be in uboot's
scope, but for the sbi part just have a call pointing to the
new dtb in memory and have it modify it in the same way as the
original one?


Heiko



> > However, memory-constrained devices (e.g. D1s) will need to get those
> > 2 MiB back by loading the kernel at the start of DRAM and SBI at the
> > end of DRAM. Then the reserved-memory node becomes quite important.
> > 
> > It also adds nodes for CPU idle states, since the available states
> > and their latencies depend on the SBI implementation.
> > 
> > It also reserves devices used by it or by a secure partition. And it
> > is responsible for extracting data (e.g. MAC addresses) from "secure"
> > eFuses which the OS may not have access to.
> > 
> > - U-Boot adds other information, like boot arguments, the address of
> > the initramfs and framebuffer, etc. These are less of a concern
> > because of course U-Boot can patch these in to a DTB loaded from
> > disk, but they are relevant if you want to load a DTB from a later
> > bootloader like GRUB.
> > 
> > If you load a DTB from disk, you lose all of the changes made by the
> > earlier firmware stages. On ARM, U-Boot tries to work around this by
> > copying a few specific bits of information from the firmware DTB to
> > the DTB loaded from disk. But this misses the point that the SBI
> > implementation can modify *any* part of the DTB. (So in practice
> > U-Boot on ARM already loses CPU idle states and reserved memory nodes
> > that were added by the PSCI implementation.)
> 
> All of these things are valid, but they are reasons why your flow in
> your bootloaders etc are the way they are more than a reason why the
> upstream dts will not work for someone who is not interested in that
> flow. At the end of the day, I only care so much about this as it is
> not me that has to deal with any confusion from either approach. I'll
> continue to modify my dts in U-Boot so I can test things without me
> having to re-program the world. /shrug
> 
> > As an extreme example, consider paravirtualization, where only a
> > small subset of DRAM and peripherals may be made available to any one
> > OS partition.
> 
> Or AMP - though not likely that that is a problem for the D1..
> 
> > Fundamentally, I reserve the right to make arbitrary changes to the
> > DTB in the SBI implementation, and thus I cannot condone using the
> > DTBs generated from the Linux source tree for any purpose other than
> > validation.
> 
> Fundamentally, I reserve the right to complain that the upstream dts
> cannot be entirely validated as it does not work out-of-the-box ;)
> 
> Either way, I am only going to complain so much about something that
> triggers my OCD about keeping things the same, you have a
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> already and once the other issues are cleaned up an R-b too. Not trying
> make an issue out of this, just expressing my dislike for the
> inconsistency between the D1 stuff and vendors - partly in the hopes
> that the "higher powers" get involved. I can't imagine that this is
> the last time something like this comes up.
> 
> Thanks,
> Conor.
> 
> 
> 
> 
> 
> 




