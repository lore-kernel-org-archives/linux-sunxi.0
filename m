Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8857B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:40:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g18so7380128wrb.10
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kURCqWE8pomFkfYFiXr4O15/fAJHColFs2BDAs5/sSY=;
        b=JtoaVvLTXvRhY3gYKm77KhSxq+xb1+GNAnVO3CZFzO9gm8QRx1cDg3BS7TrSiYd6sP
         NQJFtUPhw9/KvCsKvJv+9LmViJLY1/vOcRqH9UVoS4nrkacZGUr+QMzjX9vSzAKYT0r/
         ZNwbY1n6vQCPWLPbZgQ2PmigGmGzuglGmfX8wxSMW6sFPo6+ad/HNxr1nObKLDhVznyw
         14BVrHCXdbAZ6CIUMpFt7lClsNf5WkZxiL41emF5hIIzgbI82zNPcubfwP2ZcJc9SHJ7
         QOXzF2p5wih7tlA+wCqGhR0sbcXPQZVO9BMe10mNM+OhIG9BAjICICEStMJA0HeXCIls
         HPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kURCqWE8pomFkfYFiXr4O15/fAJHColFs2BDAs5/sSY=;
        b=51BBm5C2JdY2QLxVxYzn1qCWug8VmjAU21G9KNFaYXUgbqhdGl9msR9GZXhBR5lt6r
         y4eoLjyXQR/R+Dx0GMcww7qss1QK9vTdYnrLvLkscJuq8zLrfu7IwXDUQr7fA0oHyHnH
         XbBrIlfLhQQhjmYCYZ/v8EYO2/dRWcLnELRuXhEmEISey8p/TNkmZUOAnFPlocGZG2Kj
         Ihh3klNJlBKEYfOFlSrPbObqJLY+q4Lkx4onHtO5ZawduLaSthT6x8gKtRYwvMlM30HX
         1iFtHMKcUkOXvILpguH3clUpwdYNVBi4LqceNx2hliHPXzQZznNp/yGkFyIv0GGAS/zM
         ambA==
X-Gm-Message-State: AOAM531Fi5w0cu/vm6CxIi6mbySs/hl00ljQ8dfM/IJdazAeCkHDAgpY
	30DcW/dFKAmHpi0JTa+A5Gg=
X-Google-Smtp-Source: ABdhPJw+7iaYzPWSZQx3m2FbTZmDAGdYmIThnu0ups3wQnpV0ymEdmrs+11yOe3CNNLF+7H6a6WQwQ==
X-Received: by 2002:adf:dd8a:0:b0:207:9e5f:fd0a with SMTP id x10-20020adfdd8a000000b002079e5ffd0amr9290217wrl.94.1649691639887;
        Mon, 11 Apr 2022 08:40:39 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id g8-20020a5d4888000000b00207a49fa6a1sm4710207wrq.81.2022.04.11.08.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:40:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 05/10] drm/sun4i: csc: Add support for the new MMIO layout
Date: Mon, 11 Apr 2022 17:40:38 +0200
Message-ID: <21425699.EfDdHjke4D@kista>
In-Reply-To: <20220411043423.37333-6-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org> <20220411043423.37333-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:34:17 CEST je Samuel Holland napisal(a):
> D1 changes the MMIO address offset for the CSC blocks in the first
> mixer. The ccsc field value is used as an index into the ccsc_base
> array; allocate the next available value to represent the new variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/gpu/drm/sun4i/sun8i_csc.c   | 3 ++-
>  drivers/gpu/drm/sun4i/sun8i_csc.h   | 1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++--
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/
sun8i_csc.c
> index 9bd62de0c288..1ed10c6447a3 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -8,9 +8,10 @@
>  #include "sun8i_csc.h"
>  #include "sun8i_mixer.h"
>  
> -static const u32 ccsc_base[2][2] = {
> +static const u32 ccsc_base[][2] = {
>  	{CCSC00_OFFSET, CCSC01_OFFSET},
>  	{CCSC10_OFFSET, CCSC11_OFFSET},
> +	{CCSC00_OFFSET, CCSC01_OFFSET_D1},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/
sun8i_csc.h
> index 022cafa6c06c..bd54166b2bcc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -13,6 +13,7 @@ struct sun8i_mixer;
>  /* VI channel CSC units offsets */
>  #define CCSC00_OFFSET 0xAA050
>  #define CCSC01_OFFSET 0xFA050
> +#define CCSC01_OFFSET_D1 0xFA000
>  #define CCSC10_OFFSET 0xA0000
>  #define CCSC11_OFFSET 0xF0000
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/
sun8i_mixer.h
> index 5b3fbee18671..22f1b7ef9225 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -151,8 +151,10 @@
>   *	scaler and 2 UI channels with scaler, bitmask would be 0xC.
>   * @ccsc: select set of CCSC base addresses
>   *	Set value to 0 if this is first mixer or second mixer with VEP 
support.
> - *	Set value to 1 if this is second mixer without VEP support. Other 
values
> - *	are invalid.
> + *	Set value to 1 if this is second mixer without VEP support.
> + *	Set value to 2 if this is first mixer or second mixer with VEP 
support,
> + *	and the SoC uses the MMIO layout found in the D1 SoC.
> + *	Other values are invalid.

It would be better to introduce some kind of enum. Number 2 is completely 
arbitrary.

Best regards,
Jernej

>   * @mod_rate: module clock rate that needs to be set in order to have
>   *	a functional block.
>   * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
> -- 
> 2.35.1
> 
> 


