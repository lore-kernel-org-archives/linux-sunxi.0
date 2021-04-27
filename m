Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E6071
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Apr 2021 00:43:59 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 46F9A81F8C;
	Tue, 27 Apr 2021 02:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1619483841;
	bh=aTPJoo0K/5BBGu7ZPwriJLg+Zy8FjgWh8oXAoR3mzWM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=P9yVsLess2GCooyoIYzIIwb2jUj52o8fHgwzMLUOeuh/2PwcOTW1ANrZg+fobXram
	 uEKdomMFLB82ggV+Mi6M0+FN22QC5pxhv5dnqMrdebBMQHw5BB9tTN/IAVf5yVIiA9
	 Mr3QnUP1bxfCTHp/32uPQNVaQstFMH2fr/P0cNW+0hntRbeuvedVhIYoKRXcOFuwyU
	 WvMTdi6/+pefTQ1hq/UulWVT7krJpn61DZuGSNn4Bb1qXD507xxFeNAXljG8fkZTOn
	 Emev+jb0hr1N7qBNr4/K9n8cmGwneZvle28CH9k3YQP9X2Ec+jSnFaVIF1l/edq/P+
	 XTC0kWIgNCi3w==
Subject: Re: [PATCH] usb: musb-new: Extend Allwinner quirk to newer SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Samuel Holland <samuel@sholland.org>, Jagan Teki
 <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev
References: <20210427000323.18285-1-andre.przywara@arm.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <fece3df8-b2d5-ab42-13b6-94d4f04bfc4a@denx.de>
Date: Tue, 27 Apr 2021 02:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210427000323.18285-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean

On 4/27/21 2:03 AM, Andre Przywara wrote:
> As the comment in musb_regs.h describes, Allwinner saves the
> MUSB_CONFIGDATA register, which always return 0 on those SoCs.
> 
> This is also true for the H6 and H616, so extend the quirk to those
> controllers as well.
> 
> This fixes USB peripheral mode on H6 and H616 boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/usb/musb-new/musb_regs.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb-new/musb_regs.h b/drivers/usb/musb-new/musb_regs.h
> index c4d7203b851..bee1b715a95 100644
> --- a/drivers/usb/musb-new/musb_regs.h
> +++ b/drivers/usb/musb-new/musb_regs.h
> @@ -432,7 +432,8 @@ static inline u8 musb_read_ulpi_buscontrol(void __iomem *mbase)
>   static inline u8 musb_read_configdata(void __iomem *mbase)
>   {
>   #if defined CONFIG_MACH_SUN8I_A33 || defined CONFIG_MACH_SUN8I_A83T || \
> -		defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I
> +	defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I || \
> +	defined CONFIG_SUN50I_GEN_H6

Isn't there some better solution then ever-growing list of macros to 
check, like e.g. a single CONFIG_MACH_SUNXI ?
