Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171A15CA
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 18:31:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l14so31343704wrw.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 10:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vuZ7CJY0ycdtFnuj3y46+D+gGNut+18NmhYqgD4cCk=;
        b=A/b/gFWWIaZlP6nO+upfw//cia6u0pLcYbWigMSSijt+xIwlVox8kgoiXerfwh95jp
         FFnoK0GK8C4ffBg+U6/cUP7ws2NLQCeHsF28R4oPhjsDqMol77cjmXNiajaX2FvNrAnP
         /ZbLdjAs0n3lGPV3WONNlusIWlqxuJLqheDpbNihS7h2GVF500g/opMZ/ZcUvR8LnWyn
         MqdD/dk01/CoasVdQszbdX9R9yfeL2z7P2DyDgEcyTbpyasSdAPIroAVQRo5VOJmhmHQ
         DGWkj7LXOXys2i/M5n/B1jC6GBjHrECYWTcYeEyPiD2r0wOFMR/uSMbeMDRsxU/lt8W9
         HpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vuZ7CJY0ycdtFnuj3y46+D+gGNut+18NmhYqgD4cCk=;
        b=arC66D4QC7NncbUgpb8bGqDfkZ/v8Xnzp6A1+HKAZ9Aa2Xu1Id0g1JF3V2Jy4X03aa
         x7lvYWVpO9VA7ygV+oGe+3qlmU37QFL020NglFfd/e9upz6ViPlb1KCksAErYUUvaoDb
         q7dQDiRUv14XxeiZdZwhvVNPmnirXenR7a63BSaAN9yhGIYiyTI2yC+vLGJuLik0EGmE
         v6G7b5cmfDtpHojmb5lahzW2PDOX+1fqvwLKc18dokh4UHxmB+wjL3o7qj6+4pYxpcwS
         WWotXne3JA57RhVaSpWljGrtJJGIe88J+5cXlkZd9dxnFvBOpcaAjyOyy5k6jUz6mYtf
         UmSQ==
X-Gm-Message-State: ANoB5plpkif2/THHH25l6OI1jXYb1+iU6t0fn+OjZsE94aYzGRAatao5
	ct9bRL6lRrU1LnQV0PcGsVs=
X-Google-Smtp-Source: AA0mqf4Nc6OJ4lu29BUhXlv7SudGsN5nC4mOB29eH7ww/WOvGUmd1JJSnE5wzY5KO03EZEtlmaxDSw==
X-Received: by 2002:a5d:6885:0:b0:22e:3460:5e28 with SMTP id h5-20020a5d6885000000b0022e34605e28mr14796361wru.211.1668623498036;
        Wed, 16 Nov 2022 10:31:38 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c2e0c00b003b50428cf66sm2611152wmf.33.2022.11.16.10.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:31:37 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: allwinner: h6: Add IOMMU reference to Hantro G2 decoder
Date: Wed, 16 Nov 2022 19:31:36 +0100
Message-ID: <5619569.DvuYhMxLoT@kista>
In-Reply-To: <20221115090644.3602573-1-wenst@chromium.org>
References: <20221115090644.3602573-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 15. november 2022 ob 10:06:42 CET je Chen-Yu Tsai napisal(a):
> While doing some decoder tests with Fluster and Chrome's VDA tests, I
> found that the Hantro G2 was failing, and there were IOMMU fault errors
> in the kernel log.
> 
> Turns out the decoder is behind the IOMMU on the H6, as shown in the
> user manual.
> 
> This series adds the "iommus" property to the binding and the dtsi.
> Please have a look.

Applied, thanks!

Best regards,
Jernej

> 
> 
> Thanks
> ChenYu
> 
> Chen-Yu Tsai (2):
>   media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU reference property
>   arm64: dts: allwinner: h6: Add IOMMU reference to Hantro G2
> 
>  .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml           | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                 | 1 +
>  2 files changed, 6 insertions(+)
> 
> --
> 2.38.1.493.g58b659f92b-goog


