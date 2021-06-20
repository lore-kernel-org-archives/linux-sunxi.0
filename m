Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AB771
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jun 2021 22:40:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D89F0D6E;
	Sun, 20 Jun 2021 15:40:17 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC8643F718;
	Sun, 20 Jun 2021 15:40:16 -0700 (PDT)
Date: Sun, 20 Jun 2021 23:39:47 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/4] mkimage: sunxi_egon: refactor for
 multi-architecture support
Message-ID: <20210620233947.09bb6433@slackpad.fritz.box>
In-Reply-To: <20210619092006.646929-1-icenowy@aosc.io>
References: <20210619091838.646779-1-icenowy@aosc.io>
	<20210619092006.646929-1-icenowy@aosc.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Jun 2021 17:20:04 +0800
Icenowy Zheng <icenowy@aosc.io> wrote:

> Refactor some functions in mkimage sunxi_egon type, in order to prepare
> for adding support for more CPU architectures (e.g. RISC-V). In
> addition, compatibility for operation w/o specified architecture is
> kept, in this case the architecture is assumed as ARM.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Looks alright:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

One thing you might want to improve (just when you respin anyway):

> ---
> Changes in v2:
> - Merged fixes in the next patch in v1 (patch rebase issue).
> 
>  tools/sunxi_egon.c | 63 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
> index a5299eb6a1..062c9bc151 100644
> --- a/tools/sunxi_egon.c
> +++ b/tools/sunxi_egon.c
> @@ -16,7 +16,25 @@
>  
>  static int egon_check_params(struct image_tool_params *params)
>  {
> -	/* We just need a binary image file. */
> +	int arch;
> +
> +	/* Assume ARM when no architecture specified for compatibility */
> +	if (params->Aflag)
> +		arch = params->arch;
> +	else
> +		arch = IH_ARCH_ARM;

This code snippet will be used three times in this file, so you might
want to factor this out.

Cheers,
Andre


> +
> +	/*
> +	 * Check whether the architecture is supported.
> +	 */
> +	switch (arch) {
> +	case IH_ARCH_ARM:
> +		break;
> +	default:
> +		return EXIT_FAILURE;
> +	}
> +
> +	/* We need a binary image file. */
>  	return !params->dflag;
>  }
>  
> @@ -25,10 +43,26 @@ static int egon_verify_header(unsigned char *ptr, int image_size,
>  {
>  	const struct boot_file_head *header = (void *)ptr;
>  	uint32_t length;
> +	int arch;
>  
> -	/* First 4 bytes must be an ARM branch instruction. */
> -	if ((le32_to_cpu(header->b_instruction) & 0xff000000) != 0xea000000)
> -		return EXIT_FAILURE;
> +	/* Assume ARM when no architecture specified for compatibility */
> +	if (params->Aflag)
> +		arch = params->arch;
> +	else
> +		arch = IH_ARCH_ARM;
> +
> +	/*
> +	 * First 4 bytes must be a branch instruction of the corresponding
> +	 * architecture.
> +	 */
> +	switch (arch) {
> +	case IH_ARCH_ARM:
> +		if ((le32_to_cpu(header->b_instruction) & 0xff000000) != 0xea000000)
> +			return EXIT_FAILURE;
> +		break;
> +	default:
> +		return EXIT_FAILURE; /* Unknown architecture */
> +	}
>  
>  	if (memcmp(header->magic, BOOT0_MAGIC, sizeof(header->magic)))
>  		return EXIT_FAILURE;
> @@ -76,10 +110,25 @@ static void egon_set_header(void *buf, struct stat *sbuf, int infd,
>  	uint32_t *buf32 = buf;
>  	uint32_t checksum = 0, value;
>  	int i;
> +	int arch;
>  
> -	/* Generate an ARM branch instruction to jump over the header. */
> -	value = 0xea000000 | (sizeof(struct boot_file_head) / 4 - 2);
> -	header->b_instruction = cpu_to_le32(value);
> +	/* Assume ARM when no architecture specified for compatibility */
> +	if (params->Aflag)
> +		arch = params->arch;
> +	else
> +		arch = IH_ARCH_ARM;
> +
> +	/*
> +	 * Different architectures need different first instruction to
> +	 * branch to the body.
> +	 */
> +	switch (arch) {
> +	case IH_ARCH_ARM:
> +		/* Generate an ARM branch instruction to jump over the header. */
> +		value = 0xea000000 | (sizeof(struct boot_file_head) / 4 - 2);
> +		header->b_instruction = cpu_to_le32(value);
> +		break;
> +	}
>  
>  	memcpy(header->magic, BOOT0_MAGIC, sizeof(header->magic));
>  	header->check_sum = cpu_to_le32(BROM_STAMP_VALUE);

