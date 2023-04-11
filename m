Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D254F53B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:19:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62194D75;
	Tue, 11 Apr 2023 03:20:23 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DC6A3F73F;
	Tue, 11 Apr 2023 03:19:38 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:19:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/10] sunxi: Update H616 DRAM driver
Message-ID: <20230411111936.3f1f3f98@donnerap.cambridge.arm.com>
In-Reply-To: <20230410082119.24616-1-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
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

On Mon, 10 Apr 2023 10:21:09 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Current H616 DRAM driver is completely customized to Orange Pi Zero2
> board, which is only one of two H616 boards supported by U-Boot.
> Needless to say, this is not ideal for adding new boards. With changes
> in this series, all DDR3 boards are supported and all that is needed is
> just vendor DRAM values extracted from Android image. New DRAM types
> should also be easier to support, since a lot of constants used before
> are not really DRAM type dependent.
> 
> Changes were verified by decompiling driver and generated values were
> compared to previous, hard coded ones. This was done without dram_para
> structures, so compiler was able to heavily optimize code and produce
> constants.
> 
> Please take a look.

many thanks for your work on this, and the changes and updates, also
for including the X96 Mate values in its defconfig. I tested it there, and
it seems to work (TM). Also it's a massive improvement, and paves the way
for other boards, and LPDDR3/LPDDR4 support, so I will include it in the
pull request later this week.

Queued for sunxi/master.

Cheers,
Andre

> 
> Changes from v1:
> - added tags
> - updated dram config macros to have 8 or 4 nibbles
> - renamed unknown macros to something useful when known
> - removed unknown macro when not known what it does
> - added patch 9 and 10 which introduces TPR2 (needed on one h313 board)
> - update commit subjects
> 
> Jernej Skrabec (10):
>   sunxi: Fix write to H616 DRAM CR register
>   sunxi: cosmetic: Fix H616 DRAM driver code style
>   sunxi: parameterize H616 DRAM ODT values
>   sunxi: Convert H616 DRAM options to single setting
>   sunxi: Always configure ODT on H616 DRAM
>   sunxi: Make bit delay function in H616 DRAM code void
>   sunxi: Parameterize bit delay code in H616 DRAM driver
>   sunxi: Parameterize "unknown feature" in H616 DRAM driver
>   sunxi: Parameterize some of H616 DDR3 timings
>   sunxi: Add TPR2 parameter for H616 DRAM driver
> 
>  .../include/asm/arch-sunxi/dram_sun50i_h616.h |  17 +
>  arch/arm/mach-sunxi/Kconfig                   |  83 +--
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 530 ++++++++++++------
>  .../mach-sunxi/dram_timings/h616_ddr3_1333.c  |  20 +-
>  configs/orangepi_zero2_defconfig              |   8 +-
>  configs/x96_mate_defconfig                    |   7 +
>  6 files changed, 442 insertions(+), 223 deletions(-)
> 

