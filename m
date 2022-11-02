Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E361EA01
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 17:28:57 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13b23e29e36so21037519fac.8
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 10:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9a0wvsCSnT/xWIPqbzQDwoWxsjty2U93TRnjNkLEzk=;
        b=2s0rLRv/C8Bl2IerUnaJNjObyJyfL8tiDb24+QrJG6ZOdte7wB4sVY7lTzrAcxwvKm
         UPLxDxUyMvO4l1Byw5UoZI0nHUvSNckO6/XxBIH9LzMmq5s+sVHAjNejMVHJonvqBfDU
         PWGTU4zGndHvhJWorcs+vSoww0M8JFwrxHdmhVMzc5mm60u3NvxJqJM0VFTlq8d/75Pf
         vQBKm7fPWKZLW3zA61+9wrllRfOGciZJllHF/9YqCuL8WOhBQItaU3errXbldUxUV6fv
         WKIq9xydjyoAtwxYA6qQ4UvOIeeFX6XzHONWiJqCnREVQiJfcYm3wKjKuYhgZ8l3jZBh
         mmAQ==
X-Gm-Message-State: ACrzQf2SBOQyDDMmTTJixHz7YuiE6sMoBGK3w10vC3MNyHKb16sLf37X
	VaadQ64M4thN8whwdc6POQ==
X-Google-Smtp-Source: AMsMyM7GXGQgFi8k32FyKSuR0yvQ/Sbs93jOubBAmge3qsz5gJqJMOz2GbMWlZbbHd4ERK4fcKXjUA==
X-Received: by 2002:a05:6870:a44a:b0:13c:7aa9:4614 with SMTP id n10-20020a056870a44a00b0013c7aa94614mr16934422oal.229.1667410136849;
        Wed, 02 Nov 2022 10:28:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p5-20020a056870830500b0013b92b3ac64sm6258146oae.3.2022.11.02.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:56 -0700 (PDT)
Received: (nullmailer pid 4192420 invoked by uid 1000);
	Wed, 02 Nov 2022 17:28:58 -0000
Date: Wed, 2 Nov 2022 12:28:58 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 8/9] dt-bindings: input: sun4i-lradc-keys: Add F1C100s
 compatible
Message-ID: <166741013756.4192364.675668624512332912.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-9-andre.przywara@arm.com>


On Tue, 01 Nov 2022 14:16:57 +0000, Andre Przywara wrote:
> The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
> compatible to the version in other SoCs.
> The manual doesn't mention the ratio of the input voltage that is used,
> but comparing actual measurements with the values in the register
> suggests that it is 3/4 of Vref.
> 
> Add an F1C100s compatible string to the list, and pair it with the
> A83T fallback. Since the A64 is the same, combined both using an enum.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
