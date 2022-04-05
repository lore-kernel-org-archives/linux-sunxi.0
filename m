Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5281E322F
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Apr 2022 23:02:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA70A1474;
	Tue,  5 Apr 2022 16:02:36 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C4A3F718;
	Tue,  5 Apr 2022 16:02:35 -0700 (PDT)
Date: Tue, 5 Apr 2022 23:42:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, samuel@sholland.org, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/3] sunxi: H6/H616: PRCM updates
Message-ID: <20220405234226.14836c1e@slackpad.lan>
In-Reply-To: <20220130142715.291427-1-jernej.skrabec@gmail.com>
References: <20220130142715.291427-1-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jan 2022 15:27:12 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> During H616 boot0 blob and H6 boot0 sources analysis, I noticed that
> SPL doesn't set resistor calibration and PLL LDO on H6. Tests didn't
> show any observable difference, but nevertheless it's better to mimick
> boot0 behaviour.
> 
> In the process I also added names for few PRCM registers so it's
> clearer what code does.
> 
> Please take a look.

All merged into sunxi/master, which already landed in mainline.

Thanks!
Andre

> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (3):
>   sunxi: prcm: Add a few registers
>   sunxi: clock: H6/H616: Add resistor calibration
>   sunxi: clock: H6: Adjust PLL LDO before clock setup
> 
>  arch/arm/include/asm/arch-sunxi/prcm_sun50i.h | 10 ++++++++++
>  arch/arm/mach-sunxi/clock_sun50i_h6.c         | 20 ++++++++++++++++---
>  arch/arm/mach-sunxi/dram_sun50i_h6.c          |  8 +++++---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        |  7 +++++--
>  4 files changed, 37 insertions(+), 8 deletions(-)
> 

