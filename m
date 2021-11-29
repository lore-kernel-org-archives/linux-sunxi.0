Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F1168
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 23:13:44 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso27818295otf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 15:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zdZYPJcMdD8wr28rd+KcGV1ImyttgAJtTmto0qzfN9I=;
        b=ZwBB/cpNVcA7uf+rR7HN7SG1w908imsMmfhHPq1B8eLKdGBp/Wd2sGBjb5YHauhqh0
         WH/N+KdU35/kB4mWqa1PJAPZl12XvzFOTTQamfIwuvi5anBze1+aO3YmVkjZ89RwiWoZ
         PFmpfEMNTuSY1Lj4y3czBV92I2ZSHyBQx08fa6STa5+uN4uTw0U0wawEm/eCkHS/OTEK
         dszMyT1uoozSTmf1BLQttDzHo38DfUkYIsZkSQ7sVyZc+mS4rV2g5Ej2YQJ+igctLjs7
         z1bLWxC2eMkcm3wmLfkmtW45gYQQNnZ9gh1lhU62NbC4j+LIzQkg2MlRgIJkmdlMRVEo
         0/RA==
X-Gm-Message-State: AOAM533yIlkX1fNJklDjYirEHloIf9KqEEOYrbvXST+E7IdzBSRiLhXU
	+o42QtlDNxPTXO60iHs3PA==
X-Google-Smtp-Source: ABdhPJwlOcBLipQCR0h3G80bR+R1jXN6jbmi9p1p3ZtXNEWw+UVg4SLmgYXTJ+malU/zYNbk3+JiPA==
X-Received: by 2002:a9d:750c:: with SMTP id r12mr46401373otk.273.1638227623991;
        Mon, 29 Nov 2021 15:13:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u40sm3496985oiw.56.2021.11.29.15.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 15:13:43 -0800 (PST)
Received: (nullmailer pid 789766 invoked by uid 1000);
	Mon, 29 Nov 2021 23:13:42 -0000
Date: Mon, 29 Nov 2021 17:13:42 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: dma: sun50i-a64: Add compatible for D1
Message-ID: <YaVepmEInHXCPvQA@robh.at.kernel.org>
References: <20211119052702.14392-1-samuel@sholland.org>
 <20211119052702.14392-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119052702.14392-2-samuel@sholland.org>

On Thu, 18 Nov 2021 23:26:58 -0600, Samuel Holland wrote:
> D1 has a DMA controller similar to the one in other Allwinner SoCs.
> Add its compatible, and include it in the list of variants with a
> separate MBUS clock gate.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/dma/allwinner,sun50i-a64-dma.yaml           | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
