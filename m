Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7E6010
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:30:12 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id h16so42149ila.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mtbdmlSxv4Cd125/TbfgcIJrtF3An7hCFaLz0pLZoWs=;
        b=Om5CAeIegsM7b06HdHMaPYISPRXbWUMvK3m+/D1eJA1L5rGczwUIqR7JgzydC1x9SH
         mu6q0B9QSxrpAjiqS3u5/eV0cJyhcAeIk4K+I7mpGnHDxugEGlMv+799F+74HJgpX5iC
         5OI0Mniy1bb5YmKX+zoPi8ba3A46YPiu/Hsw3vZ6rsIEgKeClMOAthUaaOt1OnjdHX2S
         okAzjy9JL2dNxNJ/J3cbOcbo5fa2zLgJ88k0Nqgk0XTIV0+VezgR0w3XsxhAaueCazHY
         ZbJLr8kz4YUgXatWwUmM2E2L4sGeWvf/oHaEQCOLVb52LDC08hIZXpFjXVU7DJj4RoQt
         xjkQ==
X-Gm-Message-State: AJIora9tacB4Uy18G+iagOuVEdcqs4tVg3vMOTDcyy8ucmSOANZjvAYb
	jWBoprwDjTNdgXO6hFfOzA==
X-Google-Smtp-Source: AGRyM1vSWK3svILYFkwe79VCaH7I7KebPNrKoSiZdUGdvJ6Egzq/600Yzb17y2wogLo9jufFUm0cHg==
X-Received: by 2002:a92:6f0a:0:b0:2d9:24b5:9401 with SMTP id k10-20020a926f0a000000b002d924b59401mr20676113ilc.89.1657053011532;
        Tue, 05 Jul 2022 13:30:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y25-20020a027319000000b00339e42c3e2fsm15225003jab.80.2022.07.05.13.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:30:11 -0700 (PDT)
Received: (nullmailer pid 2572306 invoked by uid 1000);
	Tue, 05 Jul 2022 20:30:09 -0000
Date: Tue, 5 Jul 2022 14:30:09 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-usb@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: sunxi-musb: Add Allwinner D1
 compatible
Message-ID: <20220705203009.GA2572274-robh@kernel.org>
References: <20220702195249.54160-1-samuel@sholland.org>
 <20220702195249.54160-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702195249.54160-2-samuel@sholland.org>

On Sat, 02 Jul 2022 14:52:47 -0500, Samuel Holland wrote:
> The MUSB controller in the Allwinner D1 has 10 endpoints, making it
> compatible with the A33 variant of the hardware.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
