Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCD2CA4
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 21:30:30 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id ud5so39461063ejc.4
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 13:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YMB5wqa41Qx7Nhpc1b1K/YGC00PDJRyqPvnVv8h9bw=;
        b=H94SosSAInfkcwKBQIK27bslSv2Xdm3jxgjp2d0WXHIgaKTzQ9TBMGGEa7GtKyCQ2l
         DGVvIvHWBlOMW6FH0t/HLwSfByqktPEwJqsL3IWDUyYKdj5fGOEOWwVtBF7jK9aPrijX
         dB3RtYXmZzjxTkp/qw09Se8fHdUGBVsBLKyb63g5nBBn985rwqs9UqKOc0XZePKm21JZ
         yW2kFLoD5UuixPn8zx1i4wkxkOnkHqkzl7OJtkMYImQWsIGNBUwRX3mg7Qcz6crVQ3wQ
         WHNas3JTSMVD0bYDCEOpHwDtwkGfwe2hsNXlJWAD6i/i/NjD8DSxwR1+Pb6NRDfAOXPg
         vlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YMB5wqa41Qx7Nhpc1b1K/YGC00PDJRyqPvnVv8h9bw=;
        b=snElTFrBnRMZIcw9dD38rUPMzrclwKtm0xjOTQsZiqAZBTw+CIKA3xG8mMqT7u3ieM
         by4fMgYhgrvwpF6oVoDLnt0ZNKBcfK1I1X6lE+Mg84yiBjaP/gbYItOVGF0UQPIMqvYw
         DOFwlZWwWtTyRTc1ijfWlA+RC1155kLnJD0+VEloeju1mD8zNRkABSdsenRDmznnndi5
         rzMudZc1oT+b1J6unYgtOPeCl/x1K++g3gcGAWybq4eQXiVul+28O+cBffCuCN18fOlA
         8UoMgvYpko1y4hJXTD+uXV6gVQu7/Uz68Q8RyIGc4f7ZlYJ5wOiUztv6cTqt3dupyEjF
         p1Kg==
X-Gm-Message-State: ANoB5pn9Acc8qndIJ6bUaRq1kZAq6n3hpQpTboV5geJARngtrQvxKsAZ
	vmiq1y3nU0VmlsPUimHFNHs=
X-Google-Smtp-Source: AA0mqf5NuFVrNYRrXLO9HcnMljXOMrLrHDjFWROyEYkpFGTdhpCcqTY3MCd3RNI/6kfbaaZPOzEplQ==
X-Received: by 2002:a17:906:3a55:b0:78d:f2d8:4623 with SMTP id a21-20020a1709063a5500b0078df2d84623mr15863994ejf.274.1668547828479;
        Tue, 15 Nov 2022 13:30:28 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7d742000000b004623028c594sm6639814eds.49.2022.11.15.13.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 13:30:27 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU reference property
Date: Tue, 15 Nov 2022 22:30:26 +0100
Message-ID: <2121144.irdbgypaU6@jernej-laptop>
In-Reply-To: <20221115090644.3602573-2-wenst@chromium.org>
References: <20221115090644.3602573-1-wenst@chromium.org> <20221115090644.3602573-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 15. november 2022 ob 10:06:43 CET je Chen-Yu Tsai napisal(a):
> The Hantro G2 video decoder block sits behind an IOMMU. The device tree
> binding needs a property to reference it. Without a reference for the
> implementation to properly configure the IOMMU, it will fault and cause
> the video decoder to fail.

Note, Hantro G2 can happily work without IOMMU, if it is disabled for whole 
system, like disabling driver in kernel config. In such cases, it uses CMA.

Anyway, it's true that there should be proper reference in DT and bindings, 
so:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> Add an "iommus" property for referring to the IOMMU port. The master ID
> in the example is taken from the IOMMU fault error message on Linux,
> and the number seems to match the order in the user manual's IOMMU
> diagram.
> 
> Fixes: fd6be12716c4 ("media: dt-bindings: allwinner: document H6 Hantro G2
> binding") Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
> b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
> index 24d7bf21499e..9d44236f2deb 100644
> ---
> a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
> +++
> b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
> @@ -36,6 +36,9 @@ properties:
>    resets:
>      maxItems: 1
> 
> +  iommus:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -43,6 +46,7 @@ required:
>    - clocks
>    - clock-names
>    - resets
> +  - iommus
> 
>  additionalProperties: false
> 
> @@ -59,6 +63,7 @@ examples:
>          clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
>          clock-names = "bus", "mod";
>          resets = <&ccu RST_BUS_VP9>;
> +        iommus = <&iommu 5>;
>      };
> 
>  ...




