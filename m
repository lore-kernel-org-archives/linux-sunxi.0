Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E7271
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jun 2021 22:40:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF45CD6E;
	Sun, 20 Jun 2021 15:40:29 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDD343F718;
	Sun, 20 Jun 2021 15:40:28 -0700 (PDT)
Date: Sun, 20 Jun 2021 23:40:13 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/4] mkimage: sunxi_egon: add support for riscv
Message-ID: <20210620234013.6808fe88@slackpad.fritz.box>
In-Reply-To: <20210619092006.646929-2-icenowy@aosc.io>
References: <20210619091838.646779-1-icenowy@aosc.io>
	<20210619092006.646929-2-icenowy@aosc.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Jun 2021 17:20:05 +0800
Icenowy Zheng <icenowy@aosc.io> wrote:

> There's now a sun20i family in sunxi, which uses RISC-V CPU.
> 
> Add support for making eGON.BT0 image for RISC-V.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Compared against the RISC-V manual.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Changes in v2:
> - Removed changes that should belong to the previous patch in v1.
> 
>  tools/sunxi_egon.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
> index 062c9bc151..836e99a6e6 100644
> --- a/tools/sunxi_egon.c
> +++ b/tools/sunxi_egon.c
> @@ -29,6 +29,7 @@ static int egon_check_params(struct image_tool_params *params)
>  	 */
>  	switch (arch) {
>  	case IH_ARCH_ARM:
> +	case IH_ARCH_RISCV:
>  		break;
>  	default:
>  		return EXIT_FAILURE;
> @@ -60,6 +61,10 @@ static int egon_verify_header(unsigned char *ptr, int image_size,
>  		if ((le32_to_cpu(header->b_instruction) & 0xff000000) != 0xea000000)
>  			return EXIT_FAILURE;
>  		break;
> +	case IH_ARCH_RISCV:
> +		if ((le32_to_cpu(header->b_instruction) & 0x00000fff) != 0x0000006f)
> +			return EXIT_FAILURE;
> +		break;
>  	default:
>  		return EXIT_FAILURE; /* Unknown architecture */
>  	}
> @@ -128,6 +133,24 @@ static void egon_set_header(void *buf, struct stat *sbuf, int infd,
>  		value = 0xea000000 | (sizeof(struct boot_file_head) / 4 - 2);
>  		header->b_instruction = cpu_to_le32(value);
>  		break;
> +	case IH_ARCH_RISCV:
> +		/*
> +		 * Generate a RISC-V JAL instruction with rd=x0
> +		 * (pseudo instruction J, jump without side effects).
> +		 *
> +		 * The following weird bit operation maps imm[20]
> +		 * to inst[31], imm[10:1] to inst[30:21],
> +		 * imm[11] to inst[20], imm[19:12] to inst[19:12],
> +		 * and imm[0] is dropped (because 1-byte RISC-V instruction
> +		 * is not allowed).
> +		 */
> +		value = 0x0000006f |
> +			((sizeof(struct boot_file_head) & 0x00100000) << 11) |
> +			((sizeof(struct boot_file_head) & 0x000007fe) << 20) |
> +			((sizeof(struct boot_file_head) & 0x00000800) << 9) |
> +			((sizeof(struct boot_file_head) & 0x000ff000) << 0);
> +		header->b_instruction = cpu_to_le32(value);
> +		break;
>  	}
>  
>  	memcpy(header->magic, BOOT0_MAGIC, sizeof(header->magic));

