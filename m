Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9381367
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Oct 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761495518; cv=none; b=Hr0D1FlNmWcvEmiyQmcAKCS8V+AbNKHOwvady3jMNAZGVD16rmxQSEuzMkseV9sEvff/Svskaut+GTHMX4wFYwaa2kSrprKqzuVKlRJJggCXD86bP2Poenldd6d0C1PG7BqLPw3FWiJQ7CRZAZjkoZ5o183TJd8neXbIkIeqTD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761495518; c=relaxed/simple;
	bh=4rbvCO/u2S1emPah3QX4cH12GrqL21EYzEaImRTm0zM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eY57oS+PA/eCLLU5KE+tySsFPK4ZMKaluceLyjrGhuj+9FRxj8KSx2ESRT3UXKzgk2N56Rw0u5K62e9nZGW04UGlv3ZZQTs5onWqDjKQrGOci+qoGDYysCb4ZdoZGUhvWbAZoe0epPWt4sWjD17px8PZx8hxOJRMpFUPzMuhSsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D55A1A9A;
	Sun, 26 Oct 2025 09:08:58 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD3E3F63F;
	Sun, 26 Oct 2025 09:09:05 -0700 (PDT)
Date: Sun, 26 Oct 2025 16:08:20 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Tom Rini <trini@konsulko.com>, linux-sunxi@lists.linux.dev, John Watts
 <contact@jookia.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 u-boot@lists.denx.de
Subject: Re: [PATCH v3] sunxi: extend R528/T113-s3/D1(s) DRAM initialisation
Message-ID: <20251026160820.1947e762@minigeek.lan>
In-Reply-To: <20251026114118.3922714-1-lukas.schmid@netcube.li>
References: <20251026114118.3922714-1-lukas.schmid@netcube.li>
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

On Sun, 26 Oct 2025 12:41:17 +0100
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi,

> The T113-s4 SoC is using the same die as the T113-s3, but comes with
> 256MiB of co-packaged DRAM. Besides the doubled size, the DRAM chip
> seems to be connected slightly differently, which requires to use a
> different pin remapping.
> 
> Extend the DRAM initialisation code to add support for the T113-S4 aka
> T113M4020DC0 by checking the SoC's CHIPID, which is stored in the first
> word of the SID efuses.
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> Tested-by: John Watts <contact@jookia.org>
> Reviewed-by: John Watts <contact@jookia.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Careful with those tags: those were given for quite a different version
of the patch, I wouldn't carry them over, since there were quite some
changes since then.

> ---
> Changes in v3:
>   - Move the Chip-ID list link to a comment in the header file
>   - Use andre's suggested commit message
>   - Drop out of remapping early for T113M4020DC0 instead of doing it in the
>     switch-case
> 
> Changes in v2:
>   - Use uint32_t instead of u32 for sid_read_soc_chipid return type
>   - Add descriptive comment about source of Chip-ID list and register
> 
>  drivers/ram/sunxi/dram_sun20i_d1.c | 10 ++++++++++
>  drivers/ram/sunxi/dram_sun20i_d1.h | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/ram/sunxi/dram_sun20i_d1.c b/drivers/ram/sunxi/dram_sun20i_d1.c
> index a1794032f3b..d851deac7a5 100644
> --- a/drivers/ram/sunxi/dram_sun20i_d1.c
> +++ b/drivers/ram/sunxi/dram_sun20i_d1.c
> @@ -54,6 +54,11 @@ static void sid_read_ldoB_cal(const dram_para_t *para)
>  	clrsetbits_le32(0x3000150, 0xff00, reg << 8);
>  }
>  
> +static uint32_t sid_read_soc_chipid(void)
> +{
> +	return readl(SUNXI_SID_BASE + 0x00) & 0xffff;
> +}
> +
>  static void dram_voltage_set(const dram_para_t *para)
>  {
>  	int vol;
> @@ -663,6 +668,11 @@ static void mctl_phy_ac_remapping(const dram_para_t *para,
>  
>  	fuse = (readl(SUNXI_SID_BASE + 0x28) & 0xf00) >> 8;
>  	debug("DDR efuse: 0x%x\n", fuse);
> +	debug("SoC Chip ID: 0x%08x\n", sid_read_soc_chipid());
> +
> +	if (sid_read_soc_chipid() == SUNXI_CHIPID_T113M4020DC0) {

You don't need braces for a single statement in the "if" branch (but I
can fix this up).

Other than that this looks quite good to me now. If someone with a
board (John?) could confirm that this works, I am happy to take it.

Thanks,
Andre


> +		return;
> +	}
>  
>  	if (para->dram_type == SUNXI_DRAM_TYPE_DDR2) {
>  		if (fuse == 15)
> diff --git a/drivers/ram/sunxi/dram_sun20i_d1.h b/drivers/ram/sunxi/dram_sun20i_d1.h
> index 91383f6cf10..83ae7eb36cd 100644
> --- a/drivers/ram/sunxi/dram_sun20i_d1.h
> +++ b/drivers/ram/sunxi/dram_sun20i_d1.h
> @@ -19,6 +19,17 @@ enum sunxi_dram_type {
>  	SUNXI_DRAM_TYPE_LPDDR3 = 7,
>  };
>  
> +/*
> + * Chip-IDs taken from
> + * https://github.com/ua1arn/hftrx/blob/25d8cb9e4cfe1d7d0e4a2f641025c88a9ec5e758/inc/clocks.h#L250
> + */
> +enum sunxi_soc_chipid {
> +	SUNXI_CHIPID_F133A = 0x5C00,
> +	SUNXI_CHIPID_D1S = 0x5E00,
> +	SUNXI_CHIPID_T113S3 = 0x6000,
> +	SUNXI_CHIPID_T113M4020DC0 = 0x7200,
> +};
> +
>  /*
>   * This structure contains a mixture of fixed configuration settings,
>   * variables that are used at runtime to communicate settings between

