Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1F58F46
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 20:55:38 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso14757393fac.13
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 13:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LIZ2dqSSBT+On4PWAgl6ETxuBttWHH8FQXx49BSlJI=;
        b=dKGD5CDX2SNIQLqFdqhyNb9IFeXgfD0WCccbcyyZPu5ZNjGXbuBsd1fkuR0bKQb4VO
         AupLY5DJNAG9UNncu9u/FYgRzdOhFPXfAPaxlgYr2ZJO2FP7qPiUXZ9CadQWMfQKDisV
         PpFoLK5x/ZexkW9YGN+aE1Yon4IGYeY7exIdYgsOqYOpezE+LUVpqE9cf2B6UFr6Up1d
         2vbk+V7v/Qa0ER1Sg+UdMmYRQnFD0x+yWlIaXwIK2Qrj31BLyinYeqWiNhhb02a1pEcU
         60ORFCNwZiZC1yCulO19QYJrk3jldgvWsRhx3W9gJ9wdbIcHBFUwLezkCslmMi8+h+NY
         1PDA==
X-Gm-Message-State: ACrzQf1rs4JMXS4iFMFjNB4E0tVhggrvdhH2S8WR/qFjb21pGx4rSQoB
	gMW93rS27NIQroUWH7qevQ==
X-Google-Smtp-Source: AMsMyM42H6rURv5CxNKKP6tU1K9paQFFoz/iq+4AdUhxq8YPqX+kj9on+V+Yw0UjKIjEGJDFW08Pmg==
X-Received: by 2002:a05:6870:f61a:b0:132:49:bd11 with SMTP id ek26-20020a056870f61a00b001320049bd11mr17509733oab.228.1667249737471;
        Mon, 31 Oct 2022 13:55:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q10-20020a4aa88a000000b0049bdee12662sm544026oom.6.2022.10.31.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:55:36 -0700 (PDT)
Received: (nullmailer pid 3505988 invoked by uid 1000);
	Mon, 31 Oct 2022 20:55:38 -0000
Date: Mon, 31 Oct 2022 15:55:38 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>, Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-msm@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 07/12] dt-bindings: mtd: Drop common properties from NAND
 controllers
Message-ID: <166724973801.3505934.3879671899387347829.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-8-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-8-miquel.raynal@bootlin.com>


On Sat, 29 Oct 2022 01:59:28 +0200, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the controller bindings because these
> properties already are definied in nand-controller.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/allwinner,sun4i-a10-nand.yaml       |  3 ---
>  .../bindings/mtd/arasan,nand-controller.yaml         |  3 ---
>  .../devicetree/bindings/mtd/ingenic,nand.yaml        | 12 ------------
>  .../devicetree/bindings/mtd/intel,lgm-ebunand.yaml   | 10 +---------
>  .../devicetree/bindings/mtd/qcom,nandc.yaml          |  3 ---
>  5 files changed, 1 insertion(+), 30 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
