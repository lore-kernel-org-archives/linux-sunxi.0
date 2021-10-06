Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8D2C83
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Oct 2021 08:16:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s15so6165068wrv.11
        for <linux-sunxi@lists.linux.dev>; Wed, 06 Oct 2021 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fjDmuyYAWKr6P0pHvHeSBdlK7NcMQQHBMjktw4KR7vQ=;
        b=jQMvHZjWS0R5XwZgjHVcw7A7P4hFwMl7vqQ4+7/Swxq47RIW+Bh3XsNzGXDO0i3tkg
         Dhw2gQMr/r9wHINiT61mQDrKwzb4kzSWgZOT+6+PFMrOSrhI9jUTZG7eOyndTzFViQai
         7MNJ3wo4END4u03ruEJnkV9R1kQ881Cyd1mhdUadoxvzR577dpjUNwEG8SgAt7Ont5db
         J2e6HYCbIOoAsjVNZTDU1b1AU9gkwja12zwn9OuVZDXFDpNWOayXN5Lgn5DfhJx9IPvC
         Nx2sdFzNz+zDy0Y3pFkM3NAaLsillgFZuwlEfVFI+ECx7c7/1n5MAIT3Lq33OCtfrynj
         rdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fjDmuyYAWKr6P0pHvHeSBdlK7NcMQQHBMjktw4KR7vQ=;
        b=j668k5hCzlG3OPoBAKt5/swR/21uv8Je3CSWg9ueOB676j1uoTohjZ/nu3+t6A8Wfv
         Bv0XepNqECfvfcEq5eVW9ZHLya6IauQ8Dy9kgB0NKBeMDuUsLW4tyu+PgA+YSG57SHY7
         0v6LYg4UgJasMN2Vatw6HC7LRImhqdGplX/PJAgVxLnTDkS+Uv8gBiia5XDHlXZ6fUoQ
         Hp1G4kCzPMweCUywbx2HhOJw79S2G8G1KnsnG8o3q+B2jHnQJRmWcEiEiAf+eArcRviI
         MC/7OBoF+JJm00QoXd+uiyPMJrrXJl3Ksq3iypz7j6nZpgHRCSATg8VaQPeTrVGlBFw6
         062Q==
X-Gm-Message-State: AOAM532w3bgEjvsRAgX6YS3hyH314m0BKZit2tA8pew4ZvRV9itwRa/0
	uNuFs0cPACrvCKg/1VE/wcvhQg==
X-Google-Smtp-Source: ABdhPJzjDLj6FScTVYD6Zlb3qdP4c1FYA3YbxNKNKe2OIHiYE8aCXN+5NJMerGwz6p4itGts3kOMkA==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr5344011wmb.142.1633508177687;
        Wed, 06 Oct 2021 01:16:17 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id p3sm4474052wmp.43.2021.10.06.01.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 01:16:17 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:16:15 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RESEND v2 2/3] dt-bindings: mfd: Convert X-Powers AXP binding
 to a schema
Message-ID: <YV1bT16AzinR5jQM@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <20210924071614.868307-2-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924071614.868307-2-maxime@cerno.tech>

On Fri, 24 Sep 2021, Maxime Ripard wrote:

> The X-Powers AXP PMICs are supported by Linux thanks to its device tree
> binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Add GPIO example
>   - Remove the limitation on regulator-ramp-delay
> ---
>  .../i2c/allwinner,sun6i-a31-p2wi.yaml         |   2 +-
>  .../devicetree/bindings/mfd/axp20x.txt        | 273 ------------
>  .../bindings/mfd/x-powers,axp152.yaml         | 400 ++++++++++++++++++
>  3 files changed, 401 insertions(+), 274 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/axp20x.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
