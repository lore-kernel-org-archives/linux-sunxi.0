Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F42C70
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Jun 2021 00:34:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EB1FD6E;
	Sun, 20 Jun 2021 17:34:13 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5812E3F718;
	Sun, 20 Jun 2021 17:34:12 -0700 (PDT)
Date: Mon, 21 Jun 2021 01:33:56 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Qianfan Zhao <qianfanguijin@163.com>
Cc: u-boot@lists.denx.de, Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai
 <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 1/4] phy-sun4i-usb: Fix sun8i_r40_cfg
Message-ID: <20210621013356.7ad01d6a@slackpad.fritz.box>
In-Reply-To: <20210616023326.18135-1-qianfanguijin@163.com>
References: <20210616023326.18135-1-qianfanguijin@163.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2021 10:33:23 +0800
qianfanguijin@163.com (qianfanguijin@163.com) wrote:

Hi,

first many thanks for sending this! Indeed OTG support was
broken/missing on the R40, also in Linux.
So it seems you have the found the problem: the missing PHY multiplex.
Many thanks for that! This indeed enables OTG functionality for me
(although with some changes). That means that actually a similar patch
needs to go through Linux.
Do you plan on enabling support in Linux as well?

> From: qianfan Zhao <qianfanguijin@163.com>
> 
> The address of sun8i_r40's phyctrl is 0x01c13404,

But this isn't quite right, is it? See below.

> enable_pmu and dual_route.

Ah, of course! The R40 is closer to the A33/A23 here, with not having
separate EHCI0/OHCI0 controllers, instead relying on the MUSB host IP.
So indeed we don't have the PHY multiplex for PHY0.
I think this is the root cause of the non-working OTG support so far!

> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 5723c98032..608ba46242 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -587,10 +587,10 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
>  	.num_phys = 3,
>  	.type = sun8i_r40_phy,
>  	.disc_thresh = 3,
> -	.phyctl_offset = REG_PHYCTL_A33,
> +	.phyctl_offset = REG_PHYCTL_A10,

So this doesn't work for me, no device appearing on the host. Also
writing anything to this register (+0x04) reads back as 0, so it's not
implemented, as in the H3. The register at +0x10 however works, and if I
keep the A33 line, OTG indeed works for me. Same in Linux, btw.

>  	.dedicated_clocks = true,
> -	.enable_pmu_unk1 = true,
> -	.phy0_dual_route = true,
> +	.enable_pmu_unk1 = false,
> +	.phy0_dual_route = false,

If they are false, you don't need to list them, the default of 0 will
take care of this.

Cheers,
Andre

>  };
>  
>  static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {

