Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A17B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:38:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id h16so10186960wmd.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmspQXL8ssUng8+s6ocBtiiA4+mDrC4wVOVkbmyv+jc=;
        b=CIiuQVHA6iL5XR/Dt2fESMXoo6Yb1wuc1DIuHgWEvLGJHYC0z4DcWHcHwLtnLvtMvZ
         V7mg6ctge3MQY3saddAJ44l7kii5s7bYvzxSvqJ7UnyUfON8PfIoMgSCHpJyaLA63SyR
         UZzKhIAtAfwYC0UdiZwVomHq2VEo2XvXsl9/H67ug1BGq1RS0hwdE7P/EzatPCP+7LEE
         JaZ8lALrjMact0xO8EMTc4L+nE5LWRCA9f57JCzD5yl8dal6t5Sm8yyMSPfSBWN0tXun
         uaiaJlmGR7FB+mrbCnpcsdZguJbG9mGxQqP5h8/xmrKJtQA6r6Wa89K4lVjnv/4GPlU/
         3v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmspQXL8ssUng8+s6ocBtiiA4+mDrC4wVOVkbmyv+jc=;
        b=Cd4R9Iupmbs/ZQj71bAuq5PdtTciVKtsHsvMYGo0OOIKAUIoISHGlpBqrxwJPG7Gib
         +ZbG+Vdx43KiUoMmPSvNesBkg6VSln6HuFaqc5M3ufuKcyvdgMYLd4h43IloYPNrINsN
         9sAq3V5vnh33yFetDtpZNecyyDsFWG6XZfPxYctUFuRFihB56fSVi1cZrqA7/jk865lq
         BUE66zzJLU7XC0QTdCmPpT6uI59GEfXnlHHnLKerIGGwRko4bzPMSn+izLDXviOpXJXu
         42q1yRMfAx2QW6nhZ+Gu1nlCOryvriD6ojXja+u/BkhjnzYuPdZj188xYCBa+LanDgN4
         2WSA==
X-Gm-Message-State: AOAM533vH0e863UGW6XNSn/rk5prf8RXByCniHAg7nm+UfTHnye5i5dd
	ueH9drosWrAM8UASbSIbaSk=
X-Google-Smtp-Source: ABdhPJzWoncL/AiKibYMqJhjJTiMNRn07rs4GeeqsXGT8DIiJ+Eq0UE1a+s/h30NfVGfgmLSUP9Ijw==
X-Received: by 2002:a05:600c:4f0f:b0:38c:c8f5:73e7 with SMTP id l15-20020a05600c4f0f00b0038cc8f573e7mr29193223wmq.201.1649691505211;
        Mon, 11 Apr 2022 08:38:25 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a18-20020a05600c349200b0038ca453a887sm18336226wmq.19.2022.04.11.08.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:38:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 04/10] drm/sun4i: Allow building the driver on RISC-V
Date: Mon, 11 Apr 2022 17:38:23 +0200
Message-ID: <10060227.nUPlyArG6x@kista>
In-Reply-To: <20220411043423.37333-5-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org> <20220411043423.37333-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:34:16 CEST je Samuel Holland napisal(a):
> Allwinner D1 is a RISC-V SoC which contains a DE 2.0 engine. Let's
> remove the dependency on a specific CPU architecture, so the driver can
> be built wherever ARCH_SUNXI is selected.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index befc5a80222d..3a43c436c74a 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_SUN4I
>  	tristate "DRM Support for Allwinner A10 Display Engine"
> -	depends on DRM && (ARM || ARM64) && COMMON_CLK
> +	depends on DRM && COMMON_CLK
>  	depends on ARCH_SUNXI || COMPILE_TEST
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_HELPER
> -- 
> 2.35.1
> 
> 


