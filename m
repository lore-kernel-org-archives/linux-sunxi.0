Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D293F8F46
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 20:56:39 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so14835597fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 13:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvegeEey9KZKQoiJGj9a9K6oNOkm96buyBFBJMatGTs=;
        b=csrANJf6YqCDjkxF8hXW/nWb8pB99Nq62jgTxPcFl1CExdhqiSLhPeYrcpLkbkuHAM
         LhNzDrQ/OSBUhQv1OfbyOLczqEKB0zPRkEtEOB/iknKQr6nJBuoRIfRqZfW314/WTmqd
         6kVCxA/B/lsImTTtxGrgUILTvzo3RSXwGncZzx21OdIajTVrHCQGJicj6nVNuwE0VOCT
         FIWw9WVsbApYEzoYGYSm4YcavlpBqNxQNRGIbqoBcGE/gepjxRV/JKdkS4FdeJ0s20JK
         t96EzFElmbzkPrYtSajJEKyXLzkXPMYcbKXvdmNjlo8Eewf3s+JT49pOdta9wUVcMHTv
         Dr6Q==
X-Gm-Message-State: ACrzQf35RNwyfDT0rS4ppOZmEz8f9JJoTCsCaO7aYvPZOrRlXGq9kpvV
	dHQQ4wN8sroGHf7kjfF/Yw==
X-Google-Smtp-Source: AMsMyM7ot7WGQL5vQT/Scg5o+2DDdPD1reviquzBu+AauCzEoG/H14929Ca5tYII/jDSRqJizgiilw==
X-Received: by 2002:a05:6870:e30e:b0:132:e934:5c0a with SMTP id z14-20020a056870e30e00b00132e9345c0amr8424541oad.202.1667249798893;
        Mon, 31 Oct 2022 13:56:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870148600b0011f00b027bdsm3526141oab.45.2022.10.31.13.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:56:38 -0700 (PDT)
Received: (nullmailer pid 3507196 invoked by uid 1000);
	Mon, 31 Oct 2022 20:56:39 -0000
Date: Mon, 31 Oct 2022 15:56:39 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Michael Walle <michael@walle.cc>, linux-sunxi@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Pratyush Yadav <p.yadav@ti.com>, Rob Herring <robh+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 08/12] dt-bindings: mtd: spi-nor: Drop common properties
Message-ID: <166724979937.3507124.10435048977508140792.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-9-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-9-miquel.raynal@bootlin.com>


On Sat, 29 Oct 2022 01:59:29 +0200, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the SPI-NOR bindings because these
> properties already are definied in mtd.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml     | 14 --------------
>  1 file changed, 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
