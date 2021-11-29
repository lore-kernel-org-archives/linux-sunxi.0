Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7D68
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 00:24:57 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso23143543ota.5
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Nov 2021 16:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gpxsLU6o1Yq28IvHM8hocQq391YFp9KWdpHzvMtrL3c=;
        b=3Zh9jauqE82OsASoWWlfUX7kLwyk5AaJHZW3jqlaI1RyEqigpjJ55PQNn+lTdtodbX
         d6xLkyNPNep2FVg5n6mRPloX98dz5OnwvBmAm94CRvHPn+OSaqsev3cF3OVR5tY45RjH
         cCvOYBo685yo/hsguQLzYiQNwU4s4k0KeueQQelKIjdm4Z15jiJRinAXEpLwgZ8W9m8C
         ze+72eztcAj68DQMCpD+ZWgOj4oz5wHboCnUxxpyD7qYEZ2qFFw+oifCNetbppO82u99
         ox/c7poqPdASd5gdHXgVTMfegt1raqRleOm4monwYkFtijEACgcYlmrBC91aAZ5ujXqh
         pCaw==
X-Gm-Message-State: AOAM5332NsJVJrTpDfcf5XyYz9NC46D4cnvfC2knaazCAIKUG2QIQlak
	YYKv3sx8KIKAyWCOtVvDxQ==
X-Google-Smtp-Source: ABdhPJyEZsw2qHoboCT4LrMarGV5mtt2ZYCTg2tcgA7wYu841PQ1G8u9xoP52/RDscxcu1bC2U3Lxg==
X-Received: by 2002:a05:6830:12c3:: with SMTP id a3mr42299961otq.24.1638145497026;
        Sun, 28 Nov 2021 16:24:57 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
        by smtp.gmail.com with ESMTPSA id bn41sm2638724oib.18.2021.11.28.16.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:24:56 -0800 (PST)
Received: (nullmailer pid 2883129 invoked by uid 1000);
	Mon, 29 Nov 2021 00:24:53 -0000
Date: Sun, 28 Nov 2021 18:24:53 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED
 controller
Message-ID: <YaQd1bSS3VCvvj5l@robh.at.kernel.org>
References: <20211119054044.16286-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119054044.16286-1-samuel@sholland.org>

On Thu, 18 Nov 2021 23:40:42 -0600, Samuel Holland wrote:
> The Allwinner R329 and D1 SoCs contain an LED controller designed to
> drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
> has configurable timing and pixel format.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v3:
>  - Removed quotes from enumeration values
>  - Added vendor prefix to timing/format properties
>  - Renamed "format" property to "pixel-format" for clarity
>  - Dropped "vled-supply" as it is unrelated to the controller hardware
> 
> Changes in v2:
>  - Fixed typo leading to duplicate t1h-ns property
>  - Removed "items" layer in definition of dmas/dma-names
>  - Replaced uint32 type reference with maxItems in timing properties
> 
>  .../leds/allwinner,sun50i-r329-ledc.yaml      | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
