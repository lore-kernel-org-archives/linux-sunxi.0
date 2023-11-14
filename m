Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2BB3FE40
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Nov 2023 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJWaa40m"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-66cfd35f595so28780056d6.2
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Nov 2023 05:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699968288; x=1700573088; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXlobsUXWVZnCCx4FHbx2dgLdz+a6A+PeoEHES5fC5k=;
        b=TJWaa40mzK4ZrHCrO/BAGtahGgX6y6u7Qtvgvm/DgmFgN7UgjETFRNmY1nYrVDiDsU
         NjMpAZ2/hgK2i63YnQ0/dSsoUDQNdLwsAm/wbLol48B+tlX8TjruakQJh77v6S4iNqwF
         hXwJNURip4TRYNEOYiS8PTVUsg+LHKB+RPQ+vjWt1WlcFepVKsS1pUpdpQYx9D2Rojpy
         2mCfESHRyB45VPIFIVE1+RwHObqxr5uZXfs84k79JhBHSQoPri/X52oKialEO45y1NaA
         P0lX6YC6vXgczSxzdbRwTQ7bea61k6IMZc5x8znusGo65o8b+R7RoG2iJIfmrf13Pgnj
         K/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968288; x=1700573088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXlobsUXWVZnCCx4FHbx2dgLdz+a6A+PeoEHES5fC5k=;
        b=g5dA6ePC79PcpJE4bLTZaLRY7kD1wkPw4o0QES1pnrjFLnbgoAxjeRc7Ldb/6f1jt1
         tZ5ehJK+21ALpVlO6PuWQj+DlwGVYNkV9uqQ60QMqYP/XMc3wf//xk8//saDFa25A3J+
         EKYWfiAlGXR6w5NRJ1wcfDdVDyHvQL01KlKkmB6yH2jKFIB0c1htwyQSNsDHV0JPkV3f
         2hvwSfmBSp/0kg8tslBdnKfy55Q0XMXBvNfs+icTtBkGvSvMh6N276+f/keDTwFgE20z
         KoAIyMiVMWwztH9zoilv7RgeErafDPFNa2OVUc37DDnqtZ5L3/NCTo3IDcCvvW/PbVAK
         blJw==
X-Gm-Message-State: AOJu0YzA5Aa6Di8X8k5IL7OcZdH915pf992zBHQkW2O3TQV440i7BnBc
	bj6VXxRjMD6TCzGEyOlksRg=
X-Google-Smtp-Source: AGHT+IGgmUF/XJsntUbaGCg0CCDaLKsNA6AqR/Ad7EQl2bbNRD6hrvVQE8KG4x0OM/k/Fnzrb35tCA==
X-Received: by 2002:ad4:4ea5:0:b0:66c:ffe1:e244 with SMTP id ed5-20020ad44ea5000000b0066cffe1e244mr3095105qvb.62.1699968288514;
        Tue, 14 Nov 2023 05:24:48 -0800 (PST)
Received: from [172.20.3.47] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id dl15-20020ad44e0f000000b006709b9f0a72sm2882825qvb.22.2023.11.14.05.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 05:24:48 -0800 (PST)
Message-ID: <41c7aa9d-9c7f-4a4a-a9d3-ec5c6909337d@gmail.com>
Date: Tue, 14 Nov 2023 22:24:37 +0900
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] sunxi: H616: remove default AXP305 selection
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Vignesh R <vigneshr@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-3-andre.przywara@arm.com>
From: Jaehoon Chung <jh80.chung@gmail.com>
In-Reply-To: <20231114013106.31336-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/14/23 10:31, Andre Przywara wrote:
> The original H616 devices released about three years ago were typically
> paired with an X-Powers AXP305 PMIC. Newer devices uses the smaller
> AXP313, and there seem to be far more systems with this PMIC around now.
> 
> Remove the default AXP305 selection for the H616 SoC from the Kconfig,
> and move the PMIC selection into the board defconfig files instead.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
>  configs/orangepi_zero2_defconfig | 1 +
>  configs/x96_mate_defconfig       | 1 +
>  drivers/power/Kconfig            | 1 -
>  3 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
> index f13735e91c7..127cf9e365a 100644
> --- a/configs/orangepi_zero2_defconfig
> +++ b/configs/orangepi_zero2_defconfig
> @@ -19,6 +19,7 @@ CONFIG_SYS_I2C_SPEED=400000
>  CONFIG_SPI_FLASH_MACRONIX=y
>  CONFIG_PHY_REALTEK=y
>  CONFIG_SUN8I_EMAC=y
> +CONFIG_AXP305_POWER=y
>  CONFIG_SPI=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_OHCI_HCD=y
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> index 318951e19c2..e805e0952b3 100644
> --- a/configs/x96_mate_defconfig
> +++ b/configs/x96_mate_defconfig
> @@ -18,6 +18,7 @@ CONFIG_SPL_SYS_I2C_LEGACY=y
>  CONFIG_SYS_I2C_MVTWSI=y
>  CONFIG_SYS_I2C_SLAVE=0x7f
>  CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_AXP305_POWER=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_OHCI_HCD=y
> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> index 2395720c99c..33b8bc1214d 100644
> --- a/drivers/power/Kconfig
> +++ b/drivers/power/Kconfig
> @@ -56,7 +56,6 @@ choice
>  	depends on ARCH_SUNXI
>  	default AXP209_POWER if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I
>  	default AXP221_POWER if MACH_SUN6I || MACH_SUN8I_A23 || MACH_SUN8I_A33 || MACH_SUN8I_R40
> -	default AXP305_POWER if MACH_SUN50I_H616
>  	default AXP818_POWER if MACH_SUN8I_A83T
>  	default SUNXI_NO_PMIC if MACH_SUNXI_H3_H5 || MACH_SUN50I || MACH_SUN8I_V3S
>  
