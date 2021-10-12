Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB372C80
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 14:51:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v17so67682268wrv.9
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CjTQbSHcm7VtINyZoRSXIZ9bJVbGO3ptnUtUnzquW7Q=;
        b=xI3YY7OTNUdc763OfDc3VV9hte9dq1H7Sp/X9Q956NkzANA1kGGirWrn87WKTt0FQJ
         UjL5Pxeh382JtYyH0RwzzdAV6EurHgx9mYOY8rv6gkGhrKYh+Pc74JaHyl5X0Xuz4o50
         As0jbux70rntYo3L8ZnBffUxjcQnxPjG2khuZ/dxOCDpcqgsbwHQEdMtcHl2EnYK+i2y
         IgTjpRZiyWIpHjtwR2b83/2z4KhLpJCV3Xv51iBscjbVW9x5IOttox8TPsSkplKwFRj3
         m6YNiG8Udfd2SvG3PlRsHqxpn1i4zuft7FUEx0+g2tJ3dJNSWeSBJIg2qxZjSlEmrlz8
         dHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CjTQbSHcm7VtINyZoRSXIZ9bJVbGO3ptnUtUnzquW7Q=;
        b=LHq9h7fy4Fhyfh1YBqqFbcH87tJhrw3sEOjKd54pZXoMOQvcntArcnJvm2qZgRhh1p
         3LWEcisSliWroaGqYRdgq7sLGDFmpbJJYX4yniQrO0yxgi1mlSp8LBBkPbvalnKzNIXW
         k14jrCBnh2jrSpBB7vti6FT/fLgmlRr1jY6PHVNg5AbcOVLLOGOxeuZIP7vDkfSAFqzl
         czZ8ZdQGKu+4orHM8irLjVNjiSHnyk8r43K9XfF0Oc3gsZ/irdNe48LQaLY5boz6+7fJ
         ccm0SzI9PHlwvItnXpxDqguRuYYKMRfFldTx2/kKFspJuxvAHt6CGKP8EedKDcE9OW+x
         +G/A==
X-Gm-Message-State: AOAM531zdKXtLCWbZQbiMj30gk+tiVjGrt3aUV2xpiJQQuswD8mo8v1f
	nRi1z7BUrV/ZtuVXhIDl7Jr3VQ==
X-Google-Smtp-Source: ABdhPJzZ3bh4fiEUDaG8ALYrKIFy7DJqjTc+COvz2Ky6QaGqldCge7K0tJSBmcdrDZbWi6KsycgvoA==
X-Received: by 2002:a05:6000:1563:: with SMTP id 3mr8033532wrz.20.1634050258581;
        Tue, 12 Oct 2021 07:50:58 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id t3sm2621283wmj.33.2021.10.12.07.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:50:58 -0700 (PDT)
Date: Tue, 12 Oct 2021 15:50:56 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YWWg0PjnuBCKO3Tq@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>

On Tue, 12 Oct 2021, Rob Herring wrote:

> On Fri, Sep 24, 2021 at 2:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > thanks to its device tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device
> > tree bindings for that driver over to a YAML schema.
> >
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> >
> > Changes from v1:
> >   - Removed the example and moved it in the mfd schema
> > ---
> >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> >  2 files changed, 55 insertions(+), 75 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> 
> This one not being applied with the rest of the series is also
> breaking linux-next.
> 
> b4 am -P_ -sl -o - 20210924071614.868307-1-maxime@cerno.tech | git am

Thanks for the link.

Seeing as there are no *real* dependencies, it would be better for
Linus to take the patch (if he's okay with it of course).

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
