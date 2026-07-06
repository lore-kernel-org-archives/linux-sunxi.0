Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEDD3033FE
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332795; cv=none; b=DEZspI1CU+wVxYrmAERbwL85/AmrBJ3YL0/L6NdhjO68jn46VIyjqIHhI4hsdFwZ6R+/XrEl461sfpzcCRVQ23mIEn2qmjipRDz4BeSlZUWEgrwjnuyxdrrOq+Z+xAoy/RoB6qV8Pd2G3oXdQCiffTk/nHDUAfMCQi6Xhgx0ykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332795; c=relaxed/simple;
	bh=M+wWN+uhCsm+rCwBHGw7kCZppIs5qzAmwl9BelRZ0b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7HiT9HPmxQvXEqT4b9X6bjT9bWjFl/J7Bk8jWOtyqk8mosNq9d6BkwGLyUe+KZewgZnw0shFewdyarLm7ulpo7gTmm1F0NuK080xgVT8sQqL9xICNEc2t2TrerRKQiPr1b3Smcgpici2eXFtnxkeT7G1lesvBQf7KEMpVjc+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gLTLe2CC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gLTLe2CC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03D4C16F3;
	Mon,  6 Jul 2026 03:13:09 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB3B63F85F;
	Mon,  6 Jul 2026 03:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783332793; bh=M+wWN+uhCsm+rCwBHGw7kCZppIs5qzAmwl9BelRZ0b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gLTLe2CCOD8CeaMQbjekS2D9KXffduPDMInyWVeVj4gpzEeyf4qp3/wDi/0LN7rKO
	 qh9RO0bbr6W3QC2PluaOFUaezI9y02AmJ90H5yvUJ+65oBhGjCwY17SCFHgGzRrdgT
	 kKQbKjBea2EKF87NxI6ece8hXBwdADN2CDLCtniQ=
Message-ID: <d8042dd2-303e-4f24-b7bf-74ae080f4ae6@arm.com>
Date: Mon, 6 Jul 2026 12:13:11 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock
 after SIDDQ setup
To: raoxu <raoxu@uniontech.com>, vkoul@kernel.org
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 neil.armstrong@linaro.org, marco.crivellari@suse.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/6/26 11:35, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> sun4i_usb_phy_init() temporarily enables PHY2's clk2 when a SoC needs
> PHY2 SIDDQ setup while initializing another PHY. However, after updating
> PHY2's PMU register it disables the clk2 pointer from the PHY currently
> being initialized.
> 
> This leaves PHY2's clk2 enabled and also drops an extra reference from
> the current PHY's clk2, causing the prepare/enable accounting to become
> unbalanced.
> 
> Disable the same PHY2 clk2 that was enabled for the auxiliary PMU access.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index e2fbf8ccf99e..839856c09e30 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>   			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
>   		}
> 
> -		clk_disable_unprepare(phy->clk2);
> +		clk_disable_unprepare(phy2->clk2);

Interesting, this looks about right, and matches the comment above, 
noting that phy2->clk2 is just temporarily needed. I don't remember 
further details, only that this workaround was quite annoying and messy ;-)

However I am wondering how this worked so far: This should sabotage the 
access to the local REG_HCI_PHY_CTL access in the next few lines ...
Any idea why this worked nevertheless?

Thanks,
Andre

>   	}
> 
>   	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
> --
> 2.50.1
> 

