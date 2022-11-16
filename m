Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2115C9A
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 23:42:22 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id b124so143409oia.4
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 15:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5LdKOGlH65lOSoImyTv5F76TVsoyOjJ93aGKFHERCSs=;
        b=vOTBX32mxEfKHp9qM6iCbVhqjP80A5pj0IFetJujlGZ9yLuh2S9EazcJP/N7ExO/mg
         6FOk+XH6R7IGvFMdkM8mn058yjxRjkjd9xSzpPbVd5f+niVb3gWoTxbfuPtgURhroyct
         khJzDLUDTqJzaLW1DkWBRhCRDE/yGtTEBan2HdCfJWFAsC/9tc00jA0mt3h7Vb1OmYAf
         6N6BnH/O+z3FXD7rYsn1D5T5CVo4HBiC/viyzcAx9B2PGIJlV0leAmqNmW8f3RKk2I6k
         k1+/SFlx1ZuC9sh4k7IhW0Bcffb17SRx5qjTb9sK7gF9oTI5CgAENFlKAVFlksF3vSkg
         n/Zg==
X-Gm-Message-State: ANoB5pkLSNt9UNxwSKjDNDskXfRjYY9eMbbS7TYZXJi8/VGPtc+USldv
	xres8UvBPnhuz0n9xBPfUw==
X-Google-Smtp-Source: AA0mqf6FgriVlXfvMJ9LHdjfinowMEqzwwe+lERbtwJvX0bDChLkPIPUTIL+nJTeLRlM0Zj9da+qXg==
X-Received: by 2002:a05:6808:ec9:b0:34d:d3a5:b2d with SMTP id q9-20020a0568080ec900b0034dd3a50b2dmr2771547oiv.224.1668642141339;
        Wed, 16 Nov 2022 15:42:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a9d450d000000b00661948e6119sm7300245ote.47.2022.11.16.15.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 15:42:20 -0800 (PST)
Received: (nullmailer pid 1236701 invoked by uid 1000);
	Wed, 16 Nov 2022 23:42:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, samuel@sholland.org, linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev, mchehab@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, wens@csie.org
In-Reply-To: <20221116193105.363297-2-jernej.skrabec@gmail.com>
References: <20221116193105.363297-1-jernej.skrabec@gmail.com>
 <20221116193105.363297-2-jernej.skrabec@gmail.com>
Message-Id: <166864203895.1233471.6009951127753236678.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: allwinner: video-engine: Fix
 number of IOMMU channels
Date: Wed, 16 Nov 2022 17:42:22 -0600


On Wed, 16 Nov 2022 20:31:04 +0100, Jernej Skrabec wrote:
> Cedrus (video engine) on Allwinner H6 actually uses two IOMMU channel,
> not just one. However, Cedrus on SoCs like D1 only uses one channel.
> 
> Allow up to 2 IOMMU channels.
> 
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


video-codec@1c0e000: iommus: [[10, 3]] is too short
	arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb
	arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb

video-codec@1c0e000: iommus: [[12, 3]] is too short
	arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dtb
	arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dtb
	arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb
	arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dtb
	arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dtb
	arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dtb

