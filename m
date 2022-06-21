Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D8BEA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:43:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id v1so26193463ejg.13
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7W8pS4HaYS/K/F5s5QPICn7aqLZXMuTyRRVdAfsAcPg=;
        b=XoZerS+qv1R28f40K6hoLnLM4Ct5C+e/yqRmtv+kzV9PCDFL/LS7bsUEdldOD+RyHB
         ukczq/1O7qTvO3tyrlZrzFhXQ33KoFDifHZODZVFjJ3TigoHkBk7geFdz+QWVVDhdZd0
         4QXA3Mcp4UOLWIVfOEaXgpOhro4R7EyEOzGxZz//6kMGNLexIQ1RMMhIHoy6Fmqp95s3
         edH6j4r60Egf0+IoooN2Kl4dh1amXJKmc5SerDqp0IPAetq8boVtQMtd1V4UihFiytjO
         i7exWG8M8Vy6qOonHlsopob38cCHeq//DmG2j5wMnELgMi7YdE2S591sC4Eqab5J28+F
         vr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7W8pS4HaYS/K/F5s5QPICn7aqLZXMuTyRRVdAfsAcPg=;
        b=udccoiosapfkpLF2MiWF7GMvY7e2mDR0ejR5qhVsr1N/WilFl5KIwlNDKHxGrdY/Qx
         KjCjPzp/3M1uZnyt/Fzc4hlSadnYzqjYJ0J/YOzUnLhUHqRrwUAEHLgdFh8aSZnIX8hI
         mKiXwZFIi4XCjvTp0AraUTbZnnKUAMNzrmoit1p8wgkMR+PEQV599q690rKmgVEYur2Z
         6TQUsi6mYmep42rPkBSa9SyPeMwNdB6129bftJlV1ClKtJk2Tlgk4bqwG9fQH4QastzD
         YE2L8DMn9Kd3noNgNuZbJxdDxkbXEvGsAngDnC3i+EQjxZV4lJ2CB+sSItPMD1U7o6KK
         jZWw==
X-Gm-Message-State: AJIora/OJPnLeyrZkm68CAMYxbXsUzA7pE9NoXUvebmlUAJsaH6Br1mF
	RfKxRc/fQ0gK7LzZHTZKU4E1LFhW7uFZnm2N9fw=
X-Google-Smtp-Source: AGRyM1uYARWsSweZJveSPRopcUyqQF9g3LZ0zGnE7aD5N8bF+zyg2cKewkA1ySgZCwIP7Hmn7pVNYQGyGOFlItx8/YQ=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr24832521ejm.636.1655804587541; Tue, 21
 Jun 2022 02:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:42:31 +0200
Message-ID: <CAHp75VfYebbY47_jOmyC0PapZB=ne1XA4gfV4OPuHcurFR6JCA@mail.gmail.com>
Subject: Re: [PATCH 39/49] gpio: sl28cpld: replace irqchip mask_invert with unmask_base
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@codeaurora.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Michael Walle <michael@walle.cc>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Lee Jones <lee.jones@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, Chen-Yu Tsai <wens@csie.org>, tharvey@gateworks.com, 
	rjones@gateworks.com, Matti Vaittinen <mazziesaccount@gmail.com>, orsonzhai@gmail.com, 
	baolin.wang7@gmail.com, zhang.lyra@gmail.com, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-actions@lists.infradead.org, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 10:10 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> An inverted mask register can be described more directly
> as an unmask register.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/gpio/gpio-sl28cpld.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
> index 52404736ac86..2195f88c2048 100644
> --- a/drivers/gpio/gpio-sl28cpld.c
> +++ b/drivers/gpio/gpio-sl28cpld.c
> @@ -70,8 +70,7 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
>         irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
>         irq_chip->num_regs = 1;
>         irq_chip->status_base = base + GPIO_REG_IP;
> -       irq_chip->mask_base = base + GPIO_REG_IE;
> -       irq_chip->mask_invert = true;
> +       irq_chip->unmask_base = base + GPIO_REG_IE;
>         irq_chip->ack_base = base + GPIO_REG_IP;
>
>         ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
> --
> 2.35.1
>


-- 
With Best Regards,
Andy Shevchenko
