Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BBC1EA01
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 17:28:03 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id t62so9079641oib.12
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 10:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4D8SiG5TcQnszkkwqkS3LMwkL+ZjCwfDNZ1qFEK6yjg=;
        b=SLuWCF6Pvr/OqsvXl93WtHqiBgtYowoJoMktYgsgsum/lImGkxXHqwpVCaIABEhlV8
         S5ZzogbUI1gugCAe7UCevj8i8Tr5C0ILdwklHNZtxcP31HqRLHiCHmqtUwmbgf/s9ccp
         jkPD2uWhJOkAF9MJggQARK1XBATynlJ2VNXIFUpg69g6O7fCYAeN/UmRdtE39WGH3NQX
         HdAOW8FYGbZTdDchri9nW50nsrNMKGi2UjJRALmzOAxtO7y0V8yhIxERMtkfAlx+sKs9
         iGysFo/LK4Tva5NXWbZFE8LYCu/PKVvpG1XHe2tP2W9MkboXMkbu4j3t6D1/YbpNy15A
         V3zg==
X-Gm-Message-State: ACrzQf0ra4eemSTOsVj7pvMPc2PuUHq3hY3ty9l3fOjcFRgmd261hDw5
	Bq7vBWkzRWLXxu7N/a6gWA==
X-Google-Smtp-Source: AMsMyM5Zb0nqzUSL+OiOqnhYmm+D+xeeNv4x3t6TI4qedCEV1bzv/+KONGXCMaT35MJUJzuaW+t1mg==
X-Received: by 2002:a54:4d94:0:b0:359:dbb7:8afa with SMTP id y20-20020a544d94000000b00359dbb78afamr14412245oix.65.1667410082879;
        Wed, 02 Nov 2022 10:28:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v21-20020acaac15000000b0035763a9a36csm4708031oie.44.2022.11.02.10.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:02 -0700 (PDT)
Received: (nullmailer pid 4191007 invoked by uid 1000);
	Wed, 02 Nov 2022 17:28:04 -0000
Date: Wed, 2 Nov 2022 12:28:04 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>, linux-pwm@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 1/9] dt-bindings: pwm: allwinner,sun4i-a10: Add F1C100s
 compatible
Message-ID: <166741008369.4190953.4583115054033536886.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-2-andre.przywara@arm.com>


On Tue, 01 Nov 2022 14:16:50 +0000, Andre Przywara wrote:
> The PWM controller in the Allwinner F1C100s series of SoCs is the same
> as in the A20 SoCs, so allow using that as the fallback name.
> 
> Join the V3s compatible string in an enum on the way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
