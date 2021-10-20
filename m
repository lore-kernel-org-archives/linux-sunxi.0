Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FECB2C80
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Oct 2021 16:02:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s198-20020a1ca9cf000000b0030d6986ea9fso11383121wme.1
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Oct 2021 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xq/MLWmQIO0yxHi2ZCFGeRtQRs/NeB37B3g4U/XhLrc=;
        b=O3O0v0A21zEhwU9mStfZrZOeOnwqKw1fnrUOWLRYik8HzhecXM3/YE+jDv3lJmiTNC
         zg6Yjo7dOtxBhMERCZsXy3M2v2luBfxPe52kPprF9s66PMw0RocVNMdEoJyPSGD7XOrN
         7tmmRJe9n1qz6qCvlta75FquRrWIrsf/yT8p1qQDQ5CS1HQSUfzcOpMe280g2ZysFbkw
         WFzsLKYC3N5BlC4bsfOokKwnvIs5VFyoorELD6/xGGD0Ylu/gjD889td3m3fr8ngzTeP
         djHKLLFDHuKzK6/IniWMOs+zvhQ70VaJrN1JnHMcspv3A/TlV/r1ur1KoEGD5BOyGLh2
         s3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xq/MLWmQIO0yxHi2ZCFGeRtQRs/NeB37B3g4U/XhLrc=;
        b=OUqQycsFFRiBoZHXwlFvV+EtWPb/tWd3I2uaEYYFGgBWgThK8ooZMsFb+1axYd58Y8
         EGaFyd++EwbZ/jlDnbjoviVcu7OIbFa3ziwLhKqmIwOcZQJLQqu0rQRd75c5gs5suIYH
         v6sKam/NeV5Si19+CW1upXjwasxlikO6jqbC6ZAKQ/Qp423aC7VzxGU75RZGUb3G9WxE
         Qki0Ehs42TjNETXfAGI4GdABZJt1Z/uleCRUrCOjeCBthIaJsGtdHZgdb3tBh4747hSg
         vzLACg0Nn0CGFz+YJeJD9bjMmmrfJ5N65nlLdB1Hlx6w4NKJ+lS05W7VhqfuV6H2tvKG
         OhVA==
X-Gm-Message-State: AOAM530JqtZ5rBDvzsGtAMyH0pc6LRSLwSNPg+1+5+QOG+vPu7+GDljg
	lvqmWvaEzAj6xRuBOS1NaOESjw==
X-Google-Smtp-Source: ABdhPJzxmxFWwHks8POaVy7s/vWLf/RFUmDYw1mucQozrDHY3uJDvWA2g1QI9+6dueex6HlQxqbKBQ==
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr77871wrg.23.1634745743237;
        Wed, 20 Oct 2021 09:02:23 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id l6sm2398953wmg.10.2021.10.20.09.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 09:02:22 -0700 (PDT)
Date: Wed, 20 Oct 2021 17:02:20 +0100
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
Message-ID: <YXA9jObKKOvW07IB@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <YWfREhBIFLD/9aqo@google.com>
 <CAL_Jsq+tX2TNBLwohWCh05qPsuiYb6n6qmap9f-sko1oOEsi7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+tX2TNBLwohWCh05qPsuiYb6n6qmap9f-sko1oOEsi7A@mail.gmail.com>

On Wed, 20 Oct 2021, Rob Herring wrote:

> On Thu, Oct 14, 2021 at 1:41 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Fri, 24 Sep 2021, Maxime Ripard wrote:
> >
> > > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > > thanks to its device tree binding.
> > >
> > > Now that we have the DT validation in place, let's convert the device
> > > tree bindings for that driver over to a YAML schema.
> > >
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: linux-gpio@vger.kernel.org
> > > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > ---
> > >
> > > Changes from v1:
> > >   - Removed the example and moved it in the mfd schema
> > > ---
> > >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> > >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> > >  2 files changed, 55 insertions(+), 75 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> >
> > Applied, thanks.
> 
> Pushed out? Still failing in linux-next.

No, but I did a push ~10mins ago, so will be in -next on the morrow.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
