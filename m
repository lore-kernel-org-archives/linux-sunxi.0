Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4277D3F4
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jan 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736469430; cv=none; b=EFm3XJHS9+5s9Bt/+H9/W7zFFuYkrX6nWP3ZGrMX2CL6SY/1RrPwOptatmxhVr6sVOKoa66qw56MMSvrslWUGeDaUCQDmVO3NARv7prDb/3KGxE09g9kw+xGyBZAtJQTQmPTBEA+Ola8PIXWWcEUWwdgK03/yCwzvDa5p6tDsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736469430; c=relaxed/simple;
	bh=Md6TmjjC6dkjDk2AJBGaCDKqoixFrLvAqHYi4gdG1Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBItk2yTJieICgXtybfPW+Zc2DpzfI5GHafkzpAf8JzLeSLTE6/IaH40x6dUqPHjVUk9ZGyyacPmq9hY2Tg0hgTDcyhcLffhLYhZ7guav5oNQARKtK3daF+VVtawclJ7PanytS9mmSRidUoR4QcBBm4ROW3GJS6jjBfe+PN9iuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97EB41480;
	Thu,  9 Jan 2025 16:37:34 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F74A3F673;
	Thu,  9 Jan 2025 16:37:05 -0800 (PST)
Date: Fri, 10 Jan 2025 00:35:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] irqchip/sunxi-nmi: add missing flag
Message-ID: <20250110003552.0ff180c6@minigeek.lan>
In-Reply-To: <20250109153936.1908044-1-simons.philippe@gmail.com>
References: <20250109153936.1908044-1-simons.philippe@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Jan 2025 16:39:35 +0100
Philippe Simons <simons.philippe@gmail.com> wrote:

Hi Philippe,

thanks for sending that patch (and not just keeping it in your repo)!

> AXP717 has a PEK to wake up the device from sleep
> AXP717 is on the NMI irq pin
> add IRQCHIP_SKIP_SET_WAKE flag is required to enable wakeup from the suspend

That commit message might leave some people a bit puzzled, what about:
(with my embarrassingly little understanding of irqchip):
=================
Some boards with Allwinner SoCs connect the PMIC's IRQ pin to the SoC's
NMI pin instead of a normal GPIO. Since the power key is connected
to the PMIC, and people expect to wake up a suspended system via
this key, the NMI IRQ controller must stay alive when the
system goes into suspend.

Add the flag to prevent the sunxi NMI controller from going to sleep,
so that the power key can wake up those systems.
=================

Needs also your Signed-off-by:!

> ---
>  drivers/irqchip/irq-sunxi-nmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
> index bb92fd85e..3e87ca724 100644
> --- a/drivers/irqchip/irq-sunxi-nmi.c
> +++ b/drivers/irqchip/irq-sunxi-nmi.c
> @@ -186,7 +186,8 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
>  	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
>  	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
>  	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
> -	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED;
> +	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED
> +		| IRQCHIP_SKIP_SET_WAKE;

I think it's customary to put the operators last on the line, to make
it more obvious that this statement continues on the next line. I'd
recommend to put each flag on a line of its own here, and align them
vertically:
	flags	= IRQCHIP_... |
		  IRQCHIP_... |
		  IRQCHIP_...;

Cheers,
Andre

>  	gc->chip_types[0].regs.ack		= reg_offs->pend;
>  	gc->chip_types[0].regs.mask		= reg_offs->enable;
>  	gc->chip_types[0].regs.type		= reg_offs->ctrl;

