Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACF43FC7
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 15:13:16 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id l19so15322571vst.7
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=0V1X+TMseYBMvm/DF9alw3k8+Ejem9OqY7mmxwIgxzE=;
        b=uCLRB136SmFLuv/ldO85ASPHUkMllxjl+bR8nYjks7ksjrIXmSughEU4NVWC2dfMcF
         /jsb+OBAqYDAr/wGXdt4Ff0GURC1rN4/ScalIkBn+Cs4XPIuI17HbN6gliy0ylR/XBbg
         8VmJS7ukjZtK/cWfPRUr0X9SexZQ0q75ZIaR4JrGB+m/0Ap0OGs1LCD302fm+k3Q8o/8
         TFsg5uyXNbm2gLPKOlrUxIoIdr2rIYao5NBhWuKOv7hpBORW+W8I8zuWlO22BtSBybNT
         tjUkDC4/QgGN1Zkxhfc9jZczy5r4cueQpncpCWKAcFJ0P0s6TP+Qw/x3j0NF5Vi/eqdu
         ocPg==
X-Gm-Message-State: AOAM531WgCWcile+//gELSK8lNu6e+xWDbk4lpnbP/CsNvr9IcAymjeA
	o5q0KjAvgvwoufZHfDza8OIF5w/2RfkJ3Q==
X-Google-Smtp-Source: ABdhPJzSS4lOpj+HCIfwIEglH1naUES/nU6ITzF/NQ7M3o1SRKGiyNf4+nsgQn2gxMFClE5HcJli9w==
X-Received: by 2002:a05:6102:3005:: with SMTP id s5mr16340945vsa.48.1632669195014;
        Sun, 26 Sep 2021 08:13:15 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 84sm785243vkb.11.2021.09.26.08.13.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id az15so15332293vsb.8
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
X-Received: by 2002:a05:6102:241:: with SMTP id a1mr9257116vsq.28.1632669194030;
 Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech>
In-Reply-To: <20210924071614.868307-1-maxime@cerno.tech>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 26 Sep 2021 23:13:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v66mmmiEBobPRHufNniXyuyb+b5M+wDYCEGsFdfAAAa2pA@mail.gmail.com>
Message-ID: <CAGb2v66mmmiEBobPRHufNniXyuyb+b5M+wDYCEGsFdfAAAa2pA@mail.gmail.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To: Maxime Ripard <maxime@cerno.tech>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Lee Jones <lee.jones@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 3:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
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

Acked-by: Chen-Yu Tsai <wens@csie.org>
