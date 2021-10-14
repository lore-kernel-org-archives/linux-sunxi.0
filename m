Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D490D2C80
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Oct 2021 06:41:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id o20so16082810wro.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Oct 2021 23:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mdoHQevChWPiak1ksDMgXK04B0B7nQ0b8w5IVONlPR0=;
        b=mSIy650ipvtRUAD8Fd6UvoKUpyT6iy9422oVCVv4DzGf+gLtD2hOQYWANJXPvqqzl+
         kxjBQG+y4bGn1xYSl3gJXj59H9uOgTZRkFZiRm7osZh9v5E5sXQEyhsrOj1oKW2PYSel
         9kClVPdceZqK249GSdBPTMhpep8sk8iGV8l6oApyIJQB5dVHPRDVlxwUh8sOHdMkAnIx
         aJUotsbRi/kGusIt0HCcAd7v3qBa2kg8HICRlwjavQuTa0Yk3hpQaRb5pSTETMkmxWHZ
         yG89znmRVkYr8QNy56uM6tTNcGgXM7RsKFKjXznt6LUHMuHesfEWqIGDBuNdjUwDf6Uu
         Nv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mdoHQevChWPiak1ksDMgXK04B0B7nQ0b8w5IVONlPR0=;
        b=nm9pWJfsbp2ZE9aIukH2o+1gegb1fa/QFdMsioWbxIqSMeNrWa72VLI+RlyVNJHqR9
         /hWUrkxEfLdQTlnDwxoy6lphHbUzCc6Xpr0bIXFkDgFqaF5eTHZuF9R6GKG4dohpNERn
         pqaXR8eS4PBY7PENXSp5tpawo46WyAa7CIMvVH79AXkEPQR9ae9RHBCOFO/k4Amu96Q+
         7bTWfgX/6lcT8gmxLVlT8Q6ohomxtMhzXZiMuxegDRuTreI/+NWbr6kMQ5VgmZB7O+91
         lQ7hyOFnbvqwETZlCcNX0mJNgii02/JmWtpsAXAc8H5ZtitZ3tWV4VDVboMgkvdp52Kk
         K2CQ==
X-Gm-Message-State: AOAM530CJaBAaILcdUi1CPrLVOIrArrok82fE7Efvs0tsKMVfU2x8PLm
	I6Asdl6FGMYfNewp0JW6L755Hg==
X-Google-Smtp-Source: ABdhPJz9pPGFHGHAvAYohz36c1b7XdKuDR7rAmgGOwGzyvFPsiz12FQm0Vu9mc2EwECRnBZsiNp+qA==
X-Received: by 2002:a05:6000:1449:: with SMTP id v9mr4349017wrx.433.1634193686149;
        Wed, 13 Oct 2021 23:41:26 -0700 (PDT)
Received: from google.com (176-35-142-29.xdsl.murphx.net. [176.35.142.29])
        by smtp.gmail.com with ESMTPSA id p18sm1313365wrt.54.2021.10.13.23.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 23:41:25 -0700 (PDT)
Date: Thu, 14 Oct 2021 07:41:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YWfREhBIFLD/9aqo@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924071614.868307-1-maxime@cerno.tech>

On Fri, 24 Sep 2021, Maxime Ripard wrote:

> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Removed the example and moved it in the mfd schema
> ---
>  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
>  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
>  2 files changed, 55 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
