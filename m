Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456067C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 19:35:29 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13b103a3e5dso14581190fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 12:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPb0kmVeswZtbGBLrKOCmvBH/nbTOqL9MgWShnMw8Tg=;
        b=QR7Y7Xkvdpiaxd33/VL5xWP8sZGIsVw5IzzrhXqCKucwdKOYtO6eItHa+cU9mCgEjK
         YC/uzfZc5xjYycwcem/lUiV93JKGE+2kjZyU0WlVuCv96HDntABoOMu43h6CsSbMMA4y
         FSwJ9ahqb7pM4HcI4noaSIDqtHQG9E4YuygU6t0jVJoPbwNunOeM38RvrqEUsaC9x3a8
         JkFam6wfq+8AquDQYz8S/j53Q4BJoRVr+s0goohSAeyRzgLEqgsrizvFzBtUvsZxHscu
         umo6M0LnM+1TKLAq/Hq6ag8yzFXavZNR89+hSKIGufPFh+fmWqMMf9HReEhbIYujGQzx
         Yt5g==
X-Gm-Message-State: ACrzQf2L92prQBW0PTUjPPOAb4+p9eHNUa24Fzhfh+yZN4pa+q0zdRf2
	HbueUuw5BUdi+Yix9pCGVg==
X-Google-Smtp-Source: AMsMyM5JUFYZAqWZZIR+hRiehCPtmwqBAy3Pe0MPElCht3CsSW377O0x1+4mZmM3hg/qVtlZieuyjw==
X-Received: by 2002:a05:6870:f61a:b0:132:49:bd11 with SMTP id ek26-20020a056870f61a00b001320049bd11mr17306072oab.228.1667244928296;
        Mon, 31 Oct 2022 12:35:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b0013ae5246449sm3473506oac.22.2022.10.31.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:35:27 -0700 (PDT)
Received: (nullmailer pid 3296342 invoked by uid 1000);
	Mon, 31 Oct 2022 19:35:29 -0000
Date: Mon, 31 Oct 2022 14:35:29 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/12] dt-bindings: mtd: Remove useless file about
 partitions
Message-ID: <20221031193529.GC3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-4-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-4-miquel.raynal@bootlin.com>

On Sat, Oct 29, 2022 at 01:59:24AM +0200, Miquel Raynal wrote:
> There is already a real partitions.yaml file, nothing in this text file
> is actually needed so drop it.

There's a bunch of references to this file still. Run the doc ref check.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/partition.txt     | 33 -------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt
