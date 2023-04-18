Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03F2C94A
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Apr 2023 21:41:17 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-187b07ad783so758655fac.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Apr 2023 14:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681854077; x=1684446077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElC7aqM0OYKhp7zqQxQuTXx1H9IDxJGXKnxZVOIROXA=;
        b=TbE4xgpTXm+D4PDcg0aU6ZXEJOBlRuy04mNPJZk8/f68BWa1IkJ45HZIGAyHV4AAWJ
         factK+GxsADz+2fFp6hqWFPIhhQgvoqzX0QTtFN8exUHuuPABIFYqISt1o5R5lZmE3NI
         eElwahQ/+JF1Sn+HbQw3mFbzRPqK5YTJmnAVCgSE/JI/ykjBDqys/k3b7Jtmicb0t3MN
         SocEE8vGZIWoRJCywxLc1gHxs/vd/pdjIMt4CcjoAqs50oGBMnDrjsIF9wPm3o9aBK22
         QnQ8JA6eWyAuMtB0sPtN/+HK3kXyxjNRmFZtZgX+Fg46Wz38eudmhOzdO0ccq+OS7Pi2
         gP0A==
X-Gm-Message-State: AAQBX9emJ0/ztgm1lvVeVsO13qFmGo9TwAuLW6REsWTsLEm0Zsl2tcfe
	4Udmpuzl6mNtaYsEZSe+2g==
X-Google-Smtp-Source: AKy350Y/zUwTPUY+bloMxG86x5GIO5/WgZZJ0w2lgVcgHZEOKfFzsX6+0hRjmFOdov3MNztPcibQZw==
X-Received: by 2002:a05:6870:1702:b0:187:8f01:7107 with SMTP id h2-20020a056870170200b001878f017107mr2215193oae.44.1681854076847;
        Tue, 18 Apr 2023 14:41:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o19-20020a9d5c13000000b006a3f8f7b686sm6075534otk.28.2023.04.18.14.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:41:16 -0700 (PDT)
Received: (nullmailer pid 2378744 invoked by uid 1000);
	Tue, 18 Apr 2023 21:41:15 -0000
Date: Tue, 18 Apr 2023 16:41:15 -0500
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org, samuel@sholland.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 1/3] dt-bindings: display: synopsys,dw-hdmi: Add property
 for disabling CEC
Message-ID: <20230418214115.GA2376963-robh@kernel.org>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-2-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415104613.61224-2-jernej.skrabec@gmail.com>

On Sat, Apr 15, 2023 at 12:46:11PM +0200, Jernej Skrabec wrote:
> Even though some DW-HDMI controllers have perfectly usable HDMI-CEC
> implementation, some boards might prefer not to use it or even use
> software implementation instead.
> 
> Add property for disabling CEC so driver doesn't expose unused CEC
> interface, if CEC pin isn't connected anywhere.

Isn't this all true for any bridge supporting CEC? Make this common.

> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 4b7e54a8f037..624d32c024f6 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -48,6 +48,11 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  snps,disable-cec:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Disable HDMI-CEC.
> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.40.0
> 
