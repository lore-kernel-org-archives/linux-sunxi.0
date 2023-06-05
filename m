Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8097A1C777
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jun 2023 14:16:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58E1DD75;
	Mon,  5 Jun 2023 07:16:48 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8CE23F663;
	Mon,  5 Jun 2023 07:16:01 -0700 (PDT)
Date: Mon, 5 Jun 2023 15:15:59 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Piotr
 Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/2] sunxi: H616: Add LPDDR3 DRAM type
Message-ID: <20230605151559.537f35c6@donnerap.cambridge.arm.com>
In-Reply-To: <20230603135506.51071-1-iuncuim@gmail.com>
References: <20230603135506.51071-1-iuncuim@gmail.com>
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

On Sat,  3 Jun 2023 16:55:04 +0300
Mikhail Kalashnikov <iuncuim@gmail.com> wrote:

Hi Mikhail,

> From: iuncuim <iuncuim@gmail.com>
> 
> At the moment, the driver only supports DDR3 memory.
> Add support for a new type DRAM. 
> These changes have been successfully tested by me 
> with tvbox tra###eed t98-h2b-lp3.

Ah, many thanks for sending this! This looks very good, in general.
There is one newline issue introduced in patch 1, which gets fixed in
patch 2, but that's just a small thing.

There is one bigger problem, though:
The code size grows by a bit, when compiling for the OrangePi Zero2:
$ size spl/arch/arm/mach-sunxi/dram_sun50i_h616.o
   text    data     bss     dec     hex filename
   7463       0       0    7463    1d27 dram_sun50i_h616_before.o
   8155       0       0    8155    1fdb dram_sun50i_h616_after.o

This is somewhat surprising, given that the DRAM type is known at compile
time, so the compiler wouldn't need to include the other case in the binary.

Looking a bit closer at the disassembly, I saw that the constant
propagation isn't really working as we would hope for. I suspect it's due
to struct dram_para having both fixed, but also dynamic members, so the
compiler avoids optimising this further.
Just marking the fixed members as "const" in the struct declaration didn't
change anything, unfortunately, again I believe the constant propagation
is conservative here.
I then went ahead and split struct dram_para up into two structures: one
which is always constant, and one dynamic, with just cols, rows, banks, and
full_bus_width in it. Then putting "const" into the right places in the
function prototypes *and* moving the struct dram_para definition outside
of the sunxi_dram_init() function, resulted in quite a drop in code size:
for current mainline (without your patches) the size of the DRAM driver
goes down from the above mentioned 7463 bytes to 5723 bytes. Adding your
patches on top then didn't change the size at all, as expected.

So I will send out those changes soonish, and will put your rebased
patches on top.

Cheers,
Andre

> iuncuim (2):
>   sunxi: H616: add DRAM type selection
>   sunxi: H616: add LPDDR3 DRAM support
> 
>  .../include/asm/arch-sunxi/dram_sun50i_h616.h |   1 +
>  arch/arm/mach-sunxi/Kconfig                   |  18 +-
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 215 ++++++++++++------
>  arch/arm/mach-sunxi/dram_timings/Makefile     |   4 +-
>  .../arm/mach-sunxi/dram_timings/h616_lpddr3.c |  95 ++++++++
>  configs/orangepi_zero2_defconfig              |   1 +
>  configs/x96_mate_defconfig                    |   1 +
>  7 files changed, 266 insertions(+), 69 deletions(-)
>  create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c
> 

