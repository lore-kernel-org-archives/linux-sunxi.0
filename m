Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF91860
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 20:57:42 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id y18so3390914iof.2
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Jul 2022 13:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wrd1tKb0ukMGehVRD4HY6PzNoWhwwKiujKNhXqXrfTA=;
        b=L9dqYSCV1rQwH5Cj1TcyVgkfVo/Qz0dM5dVTbtoUa2+7AUgUBDdsphjgb6kMzt7QCo
         UpQOVr7eLv6SjYM8zooaFgXU3VzAmk4ia4fJq2K6fArcYQZbtB6wswOZtY+MyktPdtC3
         gVpqWINzItosIl2fAS48vjW0nqOtM8x46j9ggP2WbWt7RzAONm1xMtDccecwqjvSnlwN
         OlwPsxkkjPvNeRiD1xpLBogOkaA6grT6lRVaUJEmrpfwUPel+g5+qpI8OM5qUBV4gqcx
         rWpuVnzTznN6d1AfgCmAok5b4DvSW+CdIuM6hU4JnQ61rIANQeBb7U5KXMmqiU5SC7xc
         YiIQ==
X-Gm-Message-State: AJIora8yCOjltp8qhOQJy1VOzrv+2rzjGyfTP+K69CvxVrLyw4xI2aPH
	3UcHiHLhCkAGOxfn6TmNKA==
X-Google-Smtp-Source: AGRyM1s2nL+i/VRJ0Dif3mbz/sX017+1VfxaQriSwMdUDZkqQQXwePTOLUGfM2JFY4es+43x3Vm3fA==
X-Received: by 2002:a05:6638:22c7:b0:333:f684:ccc4 with SMTP id j7-20020a05663822c700b00333f684ccc4mr10019992jat.57.1656709061730;
        Fri, 01 Jul 2022 13:57:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x11-20020a0566380cab00b00335c432c4b9sm10209572jad.136.2022.07.01.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:57:41 -0700 (PDT)
Received: (nullmailer pid 1517008 invoked by uid 1000);
	Fri, 01 Jul 2022 20:57:40 -0000
Date: Fri, 1 Jul 2022 14:57:40 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v12 4/7] dt-bindings: pinctrl: sunxi: allow vcc-pi-supply
Message-ID: <20220701205740.GA1516792-robh@kernel.org>
References: <20220701112453.2310722-1-andre.przywara@arm.com>
 <20220701112453.2310722-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701112453.2310722-5-andre.przywara@arm.com>

On Fri, 01 Jul 2022 12:24:50 +0100, Andre Przywara wrote:
> The Allwinner H616 SoC contains a VCC_PI pin, which supplies the voltage
> for GPIO port I.
> Extend the range of supply port names to include vcc-pi-supply to cover
> that.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
