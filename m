Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6282FB6
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 15:01:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r12so14386698wrp.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c0+Rd0cN2Kxw3wKjuJyw1Wk3NaAqV4eEJpjpMHxfUv4=;
        b=kcd3FqRM5X5eqTTvuyfAWPDoWUsD4/bk52rm15XClI+2cg1leIUR+vrZb8DKHOe6VY
         iyHIvTrO3o+gR8f9WPl2A/EIHVM8YjcxIGtgYEZTxq+nXfjbcW/QVD5xI+8o5GKpimwT
         3rX4OSoTVYwIBrPreaRPlWF4JA86oGbujIuK6u2i/xvHLO8/BObruVW0yC92P1TohZYa
         +VA/RNi3hY88h/dvLwhsIW/swdFXWrxAG4P9T3gk7q31a3suE4L+2vT2b1qS126/P9Gm
         JgaNg0sCOu75FiikrKvhJzQg6XGEjpzPf7D6FIUDUDaLg4taods3VzxYs3q+LMhYv2Kv
         /GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c0+Rd0cN2Kxw3wKjuJyw1Wk3NaAqV4eEJpjpMHxfUv4=;
        b=K44izlBysPjHkgISrjjddHoWgfc0s9gfhm8M4HaqQorNKnip9izEnQpAR7ikINn8ID
         F62VUpnJk4UcSqa4yz6B3m4SwkH2kA+3yMN6Pm41BnqkxlbEPZYyc8LJ1ba6dmrZzpuo
         CSbgbSP5/LowS5R+svn0dKwi2ObXTqcm2vTahEtP/E4Gbxkxl4cgMetBETmQZ4oOFYnO
         AhP55Dr9YgNGIP/oITRl5eM+EmC4Y5dP+XCLLEvgEGjTBZE3/4PRiA1FI7aTaJq+NbH5
         ccIearkePPrHgQPMMcindr0QenK3GKPSWadr4GV0Q35sN2h2D7ge+FtGjNiTpMkr6Nxm
         O+1w==
X-Gm-Message-State: AOAM533Vx5sCqB819olTcrSI5wzsuPTLchKAjaeA0qEJfNI8IKWcOGMZ
	su4weIKSyxy5GzmZ3hVfsty0Uw==
X-Google-Smtp-Source: ABdhPJy7knz9TUpnkbC+wqZIWQaUoocLsIedqxu7VoxDQCx+5R5XOPgJt/z9xw6/DeDVn71JvZHbeg==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr1448508wrn.219.1621436500429;
        Wed, 19 May 2021 08:01:40 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id a23sm9890212wrc.22.2021.05.19.08.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:01:40 -0700 (PDT)
Date: Wed, 19 May 2021 16:01:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/17] mfd: axp20x: Allow AXP 806 chips without
 interrupt lines
Message-ID: <20210519150138.GK2549456@dell>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-3-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519104152.21119-3-andre.przywara@arm.com>

On Wed, 19 May 2021, Andre Przywara wrote:

> Currently the AXP chip requires to have its IRQ line connected to some
> interrupt controller, and will fail probing when this is not the case.
> 
> On a new Allwinner SoC (H616) there is no NMI pin anymore, and at
> least one board does not connect the AXP's IRQ pin to anything else,
> so the interrupt functionality of the AXP chip is simply not available.
> 
> Check whether the interrupt line number returned by the platform code is
> valid, before trying to register the irqchip. If not, we skip this
> registration, to avoid the driver to bail out completely.
> Also we need to skip the power key functionality, as this relies on
> a valid IRQ as well.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mfd/axp20x.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
