Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B626D36B928
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784847266; cv=none; b=ZoRrRiqDiQ3UBd5kLiY4/Yk7aEuYVYKgzbSlKt4qtrYrhRGYboI14RcLSHke+RD21NHMD25QI8x/K0mjm1/gi5d7Ntz679DsRjpZ+Fb2WzfRWNlhj0KEyyydYdnAYKOzjZ51ksk5fl2XRUFNNhQ9SkXiJNDI5Qkf2Pum+1Z9gNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784847266; c=relaxed/simple;
	bh=wO+GPa+BM/YWHHJByIplHakZDpdtNMLhODjU5i7NfFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mi6TXooPjt9k9jhrXqUsocmM23gjNZ45BbuaQQVjeHoiSnUNs1R+nEA7O2BmO11ohVcO8T/xhupTGA5OxQNyDeXnPtPYvnvcZOV6TngT59EGCgAykvxyAh0EDMghu4HJ7kaN+lD5/DBJcSVUKa34G9gV+YXnml7iYquzLN/3sQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eOLbtSZT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eOLbtSZT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80D61476;
	Thu, 23 Jul 2026 15:54:18 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BC703F86F;
	Thu, 23 Jul 2026 15:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784847263; bh=wO+GPa+BM/YWHHJByIplHakZDpdtNMLhODjU5i7NfFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eOLbtSZT/uIGsj+XplLrkvg21OOxVRWXEHN1w8DWOAAPrnjChJAVcSbamtd3gtPeN
	 L8TX7hFmyl9RWo5ks7xuJgmjQVHi28NczHq1qrOA6DO+D2BQ+PILssu/1jghifxnzg
	 EWGGaWI2kyoVegAsm4LO9iadYV76R0UdHjye4tmA=
Date: Fri, 24 Jul 2026 00:50:30 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: fix EINT bank indexing for SoCs with
 empty leading banks
Message-ID: <20260724005030.229fc6e2@ryzen.lan>
In-Reply-To: <20260704030821.561389-1-enzo.adriano.code@gmail.com>
References: <20260704030821.561389-1-enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Jul 2026 23:08:21 -0400
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

Hi Enzo,

> The DT-table init assigns interrupt bank indices by incrementing on
> every bank transition, starting from bank 0 - correct only when bank
> A actually has pins. On the A733 bank A is empty, so every EINT bank
> got an index one too high: the per-bank parent interrupt was taken

So that is the same problem with the A523: bank A is also not
implemented. But there is an interrupt for that bank: the A523
user manual mentions that explicitly (GPIOA_NS at int-id 99). And it
seems to be the same case for the A733: there is a gap right before the
GPIO IRQ for bank B. So it should work to just put that int-ID (99 =>
SPI 67) in the DT.
We actually just fixed that in the DT for the A523[1], so I am afraid
working around/fixing it in the driver would break that again. At the
end of the day it's a question for the DT binding: what IRQs do the
entries of the interrupts array refer to? We should agree on an answer
to that. Always starting with BankA seems reasonable, but on
the other hand providing dummy interrupts doesn't sound ideal as well.
Definitely we want one answer for all SoCs, so the A523 needs to be
considered here as well.

[1]
https://lore.kernel.org/linux-sunxi/20260327113006.3135663-1-andre.przywara@arm.com/

Some process related remark below ...

> from the next bank's slot in the DT list (bank K falling off the end
> entirely), while the EINT registers were still addressed correctly
> only because the shifted index happened to coincide with the pin-bank
> number under the NCAT3 layout.
> 
> Assign 0-based indices over the IRQ-capable banks that actually have
> pins, record the pin bank each index refers to in an irq_bank_map,
> and honour that map in the NCAT3 register-base formula the same way
> the legacy layout already does.
> 
> On the Cubie A7S this makes a PB EINT consumer raise its events on
> GPIOB's interrupt line instead of GPIOC's - the previously observed
> 'bank-B IRQ storm' with gpio-keys was the unclaimed GPIOB line
> screaming while the handler listened one bank up.
> 
> Assisted-by: Claude-Code:claude-fable-5
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Andre,
> 
> This sits on top of your (as-yet unmerged) A733/NCAT3 pinctrl series -
> it does not apply to mainline on its own, so it is offered for you to

Please try to avoid sending follow-up patches for not-yet-merged
series. Ultimately we want to merge a working solution, not
something that needs a fix already. So it would need to be
squashed somehow. And then providing a proper patch gets tricky: how
do we attribute the code, since it's clearly your patch? It's not
unsolvable, but the situation should be avoided.

So please reply to the patch that contains the problem, or the cover
letter in case that's not easy to find. That also helps to keep the
thread together, and avoid this patch falling through the cracks. And
it would be already enough to *report* the problem, you don't need to
provide a solution. If you do, maybe sketch it out, or use pseudo
code, but try to avoid embedding a patch.

Cheers,
Andre

> fold into your v2 rather than as a standalone submission. I found the
> off-by-one while bringing up EINTs on the Cubie A7S; it retroactively
> explains the bank-B "IRQ storm" you may have seen with gpio-keys.
> 
> Not marked Tested-by: the register-addressing and DT-list reasoning is
> confirmed by inspection and the IRQ-line behaviour was observed on
> hardware, but a clean end-to-end EINT boot is still blocked on an
> unrelated DVFS-lane instability on my tree, so I do not want to
> overclaim. Take it, adapt it, or drop it as you see fit for v2.
> 
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 34 +++++++++++++++++-------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h    |  5 ++--
>  2 files changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd..e0036df81 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -143,12 +143,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>   */
>  static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  				  struct sunxi_desc_pin *pins, int npins,
> -				  unsigned pin_base, const u8 *irq_bank_muxes)
> +				  unsigned int pin_base, const u8 *irq_bank_muxes,
> +				  struct sunxi_pinctrl_desc *desc)
>  {
>  	struct device_node *node;
>  	struct property *prop;
>  	struct sunxi_desc_function *func;
> -	int num_funcs, irq_bank, last_bank, i;
> +	unsigned int *irq_bank_map;
> +	int num_funcs, irq_bank, last_irq_bank, i;
>  
>  	/*
>  	 * We need at least three functions per pin:
> @@ -207,8 +209,20 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  	 * Assign the function's memory and fill in GPIOs, IRQ and a sentinel.
>  	 * The extra functions will be filled in later.
>  	 */
> -	irq_bank = 0;
> -	last_bank = 0;
> +	/*
> +	 * The interrupt bank index selects both the per-bank parent
> +	 * interrupt (the DT lists one per IRQ-capable bank, in order)
> +	 * and, through irq_bank_map, the pin bank holding the EINT
> +	 * registers. The first IRQ-capable bank with any pins must get
> +	 * index 0 even when lower banks (like PA here) have no pins.
> +	 */
> +	irq_bank_map = devm_kcalloc(dev, SUNXI_PINCTRL_MAX_BANKS,
> +				    sizeof(*irq_bank_map), GFP_KERNEL);
> +	if (!irq_bank_map)
> +		return -ENOMEM;
> +
> +	irq_bank = -1;
> +	last_irq_bank = -1;
>  	for (i = 0; i < npins; i++) {
>  		struct sunxi_desc_pin *pin = &pins[i];
>  		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -221,17 +235,17 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  		func[1].muxval = 1;
>  
>  		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (bank != last_irq_bank) {
>  				irq_bank++;
> +				irq_bank_map[irq_bank] = bank;
> +				last_irq_bank = bank;
> +			}
>  			func[lastfunc].muxval = irq_mux;
>  			func[lastfunc].irqbank = irq_bank;
>  			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
>  			func[lastfunc].name = "irq";
>  		}
>  
> -		if (bank > last_bank)
> -			last_bank = bank;
> -
>  		pin->functions = func;
>  
>  		/* Skip over the other needed functions and the sentinel. */
> @@ -244,6 +258,8 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  		pin->variant = 2;
>  	}
>  
> +	desc->irq_bank_map = irq_bank_map;
> +
>  	return 0;
>  }
>  
> @@ -352,7 +368,7 @@ int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
>  		return PTR_ERR(pins);
>  
>  	ret = prepare_function_table(&pdev->dev, pnode, pins, desc->npins,
> -				     desc->pin_base, irq_bank_muxes);
> +				     desc->pin_base, irq_bank_muxes, desc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 699ae8850..9aab94601 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -252,8 +252,9 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
>  static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
>  {
>  	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
> -		return pctl->bank_offset + bank * pctl->bank_mem_size +
> -		       A733_IRQ_REGS_OFFSET;
> +		return pctl->bank_offset +
> +		       sunxi_irq_hw_bank_num(pctl->desc, bank) *
> +		       pctl->bank_mem_size + A733_IRQ_REGS_OFFSET;
>  
>  	return IRQ_REGS_OFFSET +
>  	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;

