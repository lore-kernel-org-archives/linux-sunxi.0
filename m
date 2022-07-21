Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F2F291C
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 11:29:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E72C1042;
	Thu, 21 Jul 2022 04:29:07 -0700 (PDT)
Received: from [10.57.43.160] (unknown [10.57.43.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 171FD3F70D;
	Thu, 21 Jul 2022 04:29:05 -0700 (PDT)
Message-ID: <1d28ba1c-3fa1-a8fb-849d-b3f4d77c6054@arm.com>
Date: Thu, 21 Jul 2022 12:28:59 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Increasing stabilization time in sunxi_mmc_core_init
Content-Language: en-GB
To: Da Xue <da@libre.computer>, linux-sunxi@lists.linux.dev
Cc: u-boot@lists.denx.de
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2022 12:03, Da Xue wrote:

Hi Da,

> Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5). u-boot
> gets stuck in SPL with this message for SD/eMMC respectively.
> 
> Trying to boot from MMC1 or Trying to boot from MMC2
> 
> I tested about 20 MicroSD cards from different brands and some were
> happy and some were not. Increasing the udelay to 8-10ms in
> drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to fix
> the issue for the MicroSD cards.

That's interesting, thanks for the report. I don't remember hearing of 
issues with MMC before, at least not in the SPL.
It's a bit odd that waiting after the *controller* reset should affect 
SD cards, and 1ms seems plenty for just the reset.
I just checked and at least the SOFT_RESET and FIFO_RESET bits are self 
clearing. Can you try to use wait_for_bit_le32() to wait for those parts 
to finish? See sun8i_emac_eth_start() for an example.

And since you mentioned it's card related: can you check whether the 
delay is actually needed somewhere else, later? At some point where we 
wait to the card to response, for instance?

I am not against taking this patch, if it fixes problems for you, but 
just want to avoid that it papers over other issues.

Cheers,
Andre

> 
> Author: Da Xue <da@libre.computer>
> Date:   Wed Jul 20 19:11:55 2022 -0400
> 
>      sunxi: raise stabilization time for mmc from 1ms to 8ms
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 1bb7b6d0e9..499e057725 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)
> 
>          /* Reset controller */
>          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> -       udelay(1000);
> +       udelay(8000);
> 
>          return 0;
>   }
> 
> I don't know the implications of this change so I am seeking feedback.
> Are other boards having this issue as well or is it specific to our
> hardware?
> 
> Best,
> Da
> 

