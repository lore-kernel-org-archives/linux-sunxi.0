Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB618BE0
	for <linux-sunxi@lists.linux.dev>; Fri,  5 May 2023 16:00:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B3E61FB;
	Fri,  5 May 2023 09:01:04 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFA093F5A1;
	Fri,  5 May 2023 09:00:17 -0700 (PDT)
Date: Fri, 5 May 2023 17:00:15 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: robh+dt@kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Message-ID: <20230505170015.664c18bc@donnerap.cambridge.arm.com>
In-Reply-To: <CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
	<20230505105805.548d1a1b@donnerap.cambridge.arm.com>
	<CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
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

On Fri, 5 May 2023 17:27:07 +0400
Maxim Kiselev <bigunclemax@gmail.com> wrote:

Hi Maxim,

> > From a quick glance at the manuals, it
> > looks like there are not quite the same, though: the D1/R528/T113s
> > mentions a SPI_SAMP_DL register @0x28, whereas the older IP has a SPI_CCR
> > register @0x24 - which is not mentioned in the newer manuals. The driver
> > relies on that clock control register, so it wouldn't really work
> > reliably, if that register is not there.  
> 
> Thank you for pointing this out. I missed this difference.
> I actually have a board with T113 SoC, and it looks like writing to
> SPI_CCR@0x24 does nothing.

According to the manual, the register doesn't exist, so this would support
this theory. Most Allwinner IP just implements non-existing registers as
RAZ/WI.

> And it doesn't affect access to connected SPI NOR flash (read\write
> operations are fine).

I guess it just works with *some* (default?) clock settings then. Might be
faster than configured, but the SPI flash chip might be fine with that.

> But I completely agree with you that this difference should be handled
> by the spi driver.

As Samuel pointed out on IRC, there are patches, for the R329, using the
same IP:
https://lore.kernel.org/lkml/BYAPR20MB2472E8B10BFEF75E7950BBC0BCF79@BYAPR20MB2472.namprd20.prod.outlook.com/
And he also seemed to have issues, at least with SPI-NAND on one board:
https://lore.kernel.org/lkml/0b5b586a-3bc7-384e-103c-e40d0b2fac23@sholland.org/

Can you please try these patches, and use:
compatible = "allwinner,sun20i-d1-spi", "allwinner,sun50i-r329-spi";
for the compatible string?
If possible, you could revive this series, and add the D1/T113s support on
top: just add the compatible string combo to the binding document.

Cheers,
Andre
