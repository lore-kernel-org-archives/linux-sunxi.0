Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2507C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 19:46:03 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id b124so1347479oia.4
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 12:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqPBfh/sHLOCUkJwzrRXE8QNX4/bCsSnqwI1z6aeHg0=;
        b=ikVzl1Nc9vm9J9jua57xwWIQPO5lh9XKxjA0Qvp47XOrW1Y1CQ1urqhPdTHSQd0Lrp
         1wWLWqoSLidIuDIs4vuYNBwkgdTP+wEpTOL84ShR6AdsRhkX1cdDxGNJeet+JQKpSzLN
         6YwVs8hZJD/65KzLSjvB1RorloPHb0xYnEFHjol05ZSlyVizde66GPTgvR3/uNUasmtV
         7uM00iw3UjjX7bPNi51u5RbgMjz0tZEksrYLWrRKFdC6RHW4QJy9KGGqlTWd4PtFHfCi
         LQtECGMiiAJacRwBEjUzJvGmlIsQGnP+pIwi+79acv9wee6QN0q9Hkh/eiOVA6olvUK0
         ysVA==
X-Gm-Message-State: ACrzQf0X0guvL/U48ftksRhYu0K6Dkw2oEJFCOFxk1wb8lKnd4P3nNQE
	QjMOsPH51k/hJ/5xpoRwvccd0bi1oQ==
X-Google-Smtp-Source: AMsMyM5DjCcuMLrtnUf3Usg92SdXXm4p/mUKMHioTXVsEWUiB+C3u5HR/ONxnbc5Kn3g5zOFM7xPVQ==
X-Received: by 2002:a05:6808:178a:b0:359:fe7a:14ac with SMTP id bg10-20020a056808178a00b00359fe7a14acmr4520490oib.34.1667245562350;
        Mon, 31 Oct 2022 12:46:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0685000000b0066c41be56e7sm2778937otx.55.2022.10.31.12.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:46:01 -0700 (PDT)
Received: (nullmailer pid 3307676 invoked by uid 1000);
	Mon, 31 Oct 2022 19:46:03 -0000
Date: Mon, 31 Oct 2022 14:46:03 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Richard Weinberger <richard@nod.at>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the
 controller node as deprecated
Message-ID: <166724556189.3307605.7479486129187361560.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-5-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-5-miquel.raynal@bootlin.com>


On Sat, 29 Oct 2022 01:59:25 +0200, Miquel Raynal wrote:
> Defining partitions as subnodes of the controller has been deprecated
> long time ago, but unlike having partitions within the controller node,
> having an enveloppe named "partitions" (which is not itself within a
> chip subnode) is not that common, so keep this deprecated definition in
> this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
