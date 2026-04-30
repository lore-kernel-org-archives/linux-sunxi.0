Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB6222A80D
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542870; cv=none; b=rqO2cEDMMZNxqBZjziI4yKO5iXh618XUk2J86oUKfv9pwpMJMl14/b6pK5XhcjPAFKK2EyMp7DHUCI1d5O+vVyW2PHp6ELQbtSKgnbeSZK4VcQGuCK1R3PjBAEy902SD6pXdiraYDLtM1vCAcJOfuRZGBYbvNE8AOzAEMyoWr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542870; c=relaxed/simple;
	bh=CxElS4XTNrwXiUHwFIyL0TTqxPlFbyxApw7ED+H4PaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lp9Nx4Sgu1mkvb7/9UA+1g0mznE5d965bYPw1ADUQE2u/pTy2nkbz/zWL1MMGjIe5mPKbFQo2GnTSuexo6UiPogVjdcla6RtO935LK3m5QinShcTOUMGWBJSuVPFjEFiz4P8k5TlnxipcSO6YcN9qmP8+lG6tTGKse1VByeImuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gi7zQlCp; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gi7zQlCp"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DB311A9A;
	Thu, 30 Apr 2026 02:54:22 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6E123F7B4;
	Thu, 30 Apr 2026 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777542867; bh=CxElS4XTNrwXiUHwFIyL0TTqxPlFbyxApw7ED+H4PaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gi7zQlCphF2oShCewAWOezqcOjQYHPBOVbC2/RHFLraEJQ/nka+gG3kaENjUjFQhu
	 Vo2P1NY70+vuLaNdG4nwQIoZJVna904dFmnDSh6ILcDmQQxmPJWayXU7QPd74ffb2f
	 v/ytkayb+6lX+lOhqCiI+W5Z+X3379uQayj9fu0w=
Message-ID: <e10c1362-59d2-46bf-914f-ef5163336e1f@arm.com>
Date: Thu, 30 Apr 2026 11:54:25 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: sunxi: wait for TX/RX fifo reset done
To: Yixun Lan <dlan@gentoo.org>, u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev, Jagan Teki <jagan@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20260421-02-spi-fifo-reset-v1-1-e2cdd4bd474d@gentoo.org>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260421-02-spi-fifo-reset-v1-1-e2cdd4bd474d@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/21/26 06:47, Yixun Lan wrote:
> Once reset SPI TX or RX fifo, the underlying hardware need to take
> some time to actually settle down, the two bits will automatically
> clear to 0, so use a poll mechanism to check status bits to make sure
> it's done correctly.

Ah, interesting, thanks for posting this!
I looked into some manuals, and it seems like this self-clearing 
property is already used in the A10, so it's fine to use unconditionally.

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Acked-by: Andre Przywara <andre.przywara@arm.com>

If you don't mind, I would pull the below paragraph into the commit 
message, since it's useful to have in the git history.

Cheers,
Andre.

P.S. Just curious if we need a similar fix for Linux, or are we saved by 
the Linux code spending more time in setup before doing a transfer?

> ---
> On Cubie A7A board which using A733 SoC, we encoutered a SPI nor flash
> timeout issue, it turns out that the SPI fifo reset take a few time to
> settle down, Add a loop to poll the status.
> 
> This was the error message shows on A7A board once this issue happened.
> 
> => sf probe
> ERROR: sun4i_spi: Timeout transferring data
> Failed to initialize SPI flash at 0:0 (error -2)
> ---
>   drivers/spi/spi-sunxi.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
> index e00532a371b..cf41905c7b7 100644
> --- a/drivers/spi/spi-sunxi.c
> +++ b/drivers/spi/spi-sunxi.c
> @@ -347,7 +347,7 @@ static int sun4i_spi_xfer(struct udevice *dev, unsigned int bitlen,
>   	struct sun4i_spi_priv *priv = dev_get_priv(bus);
>   	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
>   
> -	u32 len = bitlen / 8;
> +	u32 rst, val, len = bitlen / 8;
>   	u8 nbytes;
>   	int ret;
>   
> @@ -363,8 +363,11 @@ static int sun4i_spi_xfer(struct udevice *dev, unsigned int bitlen,
>   		sun4i_spi_set_cs(bus, slave_plat->cs[0], true);
>   
>   	/* Reset FIFOs */
> -	setbits_le32(SPI_REG(priv, SPI_FCR), SPI_BIT(priv, SPI_FCR_RF_RST) |
> -		     SPI_BIT(priv, SPI_FCR_TF_RST));
> +	rst = SPI_BIT(priv, SPI_FCR_RF_RST) | SPI_BIT(priv, SPI_FCR_TF_RST);
> +	setbits_le32(SPI_REG(priv, SPI_FCR), rst);
> +	ret = readl_poll_timeout(SPI_REG(priv, SPI_FCR), val, !(rst & val), 20);
> +	if (ret)
> +		return -EBUSY;
>   
>   	while (len) {
>   		/* Setup the transfer now... */
> 
> ---
> base-commit: 88dc2788777babfd6322fa655df549a019aa1e69
> change-id: 20260220-02-spi-fifo-reset-25e371314c3f
> 
> Best regards,

