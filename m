Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11E72
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 19:09:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c4so5751876wrd.9
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqTtvsJvFDR96EKSx1b5ZcJqIA6TjVY8DfdfVOQQVkg=;
        b=OraYSJLA7D1e+oAnvKBTUMG0wtMZ2I6D8QLv9+XaEhce03siSYaxzm58bn5DazpP2t
         f1exfW7FSxxnV/vfFJAcG8QbcZRMrwxX9qYJEtdu9fYqQSVFe5PNjb1fszlRu5dRGnL3
         shMm+rMdH0A77Mlfi/dy0SOdoZnbFOQO1uQFU86iFHA1GQMJgVQ7Piw3/PJYtM2X8sYS
         AvC6Ox5AqpxJ1VaKdYVTUYXIQbkYo6Ox8mVeYeF/dSSSGt+GzDOv3rsZNvT2czw1RXCb
         IGjoqmhnsrTkJlJNnWKecTYMIXewmDT0Gs68F7Kbne4QOdGFvVUJ62mJUuU4QrcX2iwf
         ZCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqTtvsJvFDR96EKSx1b5ZcJqIA6TjVY8DfdfVOQQVkg=;
        b=As39NyRASlKbAM8A2apmlNp98pPE43p6lnzXnYvSXsDWHrSUR5Up+2CouPPRT59xFP
         SS7+/SXKEiPOi2dLMHJTv0bi3gzz9rau1XM+7a2ytChZ9QBn01Ws4W4rSsCTfHrwd2fI
         39POdtTfnad54cIMuHBwX6ZPPZQ/sY1t2sS14hzbyrBWHHk7ogaM6ILeq2xydnKNsY1W
         SRTFujCriAgh4iGXLmMuCn2tq+ovIIyUpH6xciOCdkW7e5+hpBfak2Vxq+IU7p8nhDTg
         UBJyhe6ZBx1XurQ7rq4QmV0mKtIYMhq47mlZpFR1PyzIXcQ6DnNWjYR84zOoU55ITeX2
         YtSQ==
X-Gm-Message-State: AOAM531HntvM8XctNkZGaOBiqC5hfw1Bf+qzTVMElBwikBmdTftqMpAk
	eq4VIezm2rYHiCZczDaQJTY=
X-Google-Smtp-Source: ABdhPJyCmpq9lwW4IvHHyGzr8+6vKj4LGQQ8kLz7wGpBXQJHt+QjAVGJT6iIUpyLzITJtdy/87iWRQ==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr1632784wrm.402.1636571370063;
        Wed, 10 Nov 2021 11:09:30 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id k8sm659793wrn.91.2021.11.10.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:09:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, wens@csie.org, mripard@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, fazilyildiran@gmail.com
Subject: Re: [PATCH] [PATCH v2] drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Wed, 10 Nov 2021 20:09:27 +0100
Message-ID: <2602978.mvXUDI8C0e@kista>
In-Reply-To: <20211109032351.43322-1-julianbraha@gmail.com>
References: <20211109032351.43322-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Julian,

Dne torek, 09. november 2021 ob 04:23:51 CET je Julian Braha napisal(a):
> When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
> is not selected, Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
>   Depends on [n]: (ARCH_SUNXI [=n] || COMPILE_TEST [=y]) && HAS_IOMEM [=y] 
&& COMMON_CLK [=y] && RESET_CONTROLLER [=n]
>   Selected by [y]:
>   - DRM_SUN6I_DSI [=y] && HAS_IOMEM [=y] && DRM_SUN4I [=y]
> 
> This is because DRM_SUN6I_DSI selects PHY_SUN6I_MIPI_DPHY
> without selecting or depending on RESET_CONTROLLER, despite
> PHY_SUN6I_MIPI_DPHY depending on RESET_CONTROLLER.
> 
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise if this
> is not the appropriate solution.
> 
> v2:
> Fixed indentation to match the rest of the file.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


