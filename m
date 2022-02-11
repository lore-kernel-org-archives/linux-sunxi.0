Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5B2F2A
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Feb 2022 14:10:40 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id o9-20020a9d7189000000b0059ee49b4f0fso6165963otj.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Feb 2022 06:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Uhr9cYX78qEIUsBkMhMqNMlXrRmPdKykvEXZjo7HdU=;
        b=zEcTPxUdL1GWSUbD5Yv+1ADKf16+NlDXI6AOZdVUlLV1t5cDmkFd4JhweaJ/XLzt7o
         8fT6RjR+eW8PAsQLlJZiIQKOl/lUJu7UnbGZtzxAplTND3qD1eE+SuBkKsuir2+Svw2u
         NddxSU//DdDH5nQuwqtxjjVBMqlf22opsPsxRUf323DGm0hIRXl2GVMJmBsy0peOeQyl
         kYCq6/nFdv/J2vQyHrHg3U9OK5UPCbYLCieMSD+kta73etnG2g3+DL7xnWLQNuwW9mnP
         6Ha38aNZPLA+6IK4jFe0HgzzBD4xVowWFfOp9HTDTIvWZMv2bw/AtynNW8W5gtWXWzwW
         IdaQ==
X-Gm-Message-State: AOAM531FkJCf9qM67NdcPGqUP2bFIWy2wSeviUDA6PpsnKNFH0Gyw3kk
	mowSpC262PqhkUjq3+taGQ==
X-Google-Smtp-Source: ABdhPJwmHy8wVVTgC0lq727cl6IABGxMi9jl4aT/u77Oly3Y77xIIHl2c33ygoRFzepL98cEHqf42g==
X-Received: by 2002:a9d:1ca5:: with SMTP id l37mr614305ota.221.1644588639300;
        Fri, 11 Feb 2022 06:10:39 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d7:a802:e6b0:6d9c:32f7:4bd9])
        by smtp.gmail.com with ESMTPSA id m26sm9465959ooa.36.2022.02.11.06.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 06:10:38 -0800 (PST)
Received: (nullmailer pid 287630 invoked by uid 1000);
	Fri, 11 Feb 2022 14:10:35 -0000
Date: Fri, 11 Feb 2022 08:10:35 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: SID: Add compatible for D1
Message-ID: <YgZuW9Fcg8wsGDM0@robh.at.kernel.org>
References: <20220203012502.10661-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203012502.10661-1-samuel@sholland.org>

On Wed, 02 Feb 2022 19:25:00 -0600, Samuel Holland wrote:
> D1 has a SID like other Allwinner SoCs, but with a unique eFuse layout.
> Add a new compatible string for it.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
