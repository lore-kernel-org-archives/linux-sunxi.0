Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08AF1A3144
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 00:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748824868; cv=none; b=RW+oTkqFtx5M+bu+4s0e0FBVFLibYfnzQtHl5cQ9n3QSBHsDMsK3NwwMyAvsvOhixFeciAzk3iUR99RgGRAFSevY+sibZJL3qJG/OPdDcPiWuBuZnwFFRrWGAxl2xtrj5QORY/JrFWZpkaE31nwU11vgm4+rwkh2UIWiFPucYtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748824868; c=relaxed/simple;
	bh=gECbdSwC28nngRwlg9WMLEdcNCmLjq2gFG8DoNXtQns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0fe56WBc8aiMtD5k5EiY0HJEXBEGBA74+dCsX4ZkUFJyDiZeEj7t09x1A0MevDO4wlOEX5AQPTExwha0r6kxSqP1aGuG339ZgUif454NBXt8VLS/23x4UvLmPIPvJx2FekwBOEZBZG2Futxol6VSgX5n67fFQ4yd2ji7iu12yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 709481515;
	Sun,  1 Jun 2025 17:40:49 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12E483F673;
	Sun,  1 Jun 2025 17:41:04 -0700 (PDT)
Date: Mon, 2 Jun 2025 01:40:24 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/6] sunxi: pinecube: Enable EMAC and network support
Message-ID: <20250602014024.2476a87a@minigeek.lan>
In-Reply-To: <20250601153943.2690123-5-contact@paulk.fr>
References: <20250601153943.2690123-1-contact@paulk.fr>
	<20250601153943.2690123-5-contact@paulk.fr>
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

On Sun,  1 Jun 2025 17:39:41 +0200
Paul Kocialkowski <contact@paulk.fr> wrote:

Hi,

> The pinecube has an ethernet connector which uses the EMAC and internal
> PHY of the chip. Enable it in the config.
> 
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  configs/pinecube_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
> index ea40d227bd53..2741e7ed9079 100644
> --- a/configs/pinecube_defconfig
> +++ b/configs/pinecube_defconfig
> @@ -7,13 +7,13 @@ CONFIG_DRAM_CLK=504
>  CONFIG_DRAM_ODT_EN=y
>  # CONFIG_HAS_ARMV7_SECURE_BASE is not set
>  CONFIG_SPL_I2C=y
> -CONFIG_NO_NET=y
>  CONFIG_SPL_SYS_I2C_LEGACY=y
>  CONFIG_SYS_I2C_MVTWSI=y
>  CONFIG_SYS_I2C_SLAVE=0x7f
>  CONFIG_SYS_I2C_SPEED=400000
>  CONFIG_MTD=y
>  CONFIG_SPI_FLASH_WINBOND=y
> +CONFIG_SUN8I_EMAC=y
>  CONFIG_AXP209_POWER=y
>  CONFIG_AXP_DCDC2_VOLT=1250
>  CONFIG_AXP_DCDC3_VOLT=3300

