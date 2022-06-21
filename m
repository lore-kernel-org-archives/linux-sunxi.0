Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA46EA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:51:55 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e2so7662868edv.3
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G4W5iRCpxf3logbYUk+vaaUqbarkwwxMMo6upR9gUBQ=;
        b=F0iKTn0IOPk1RyoIOXx/9fQrQDEUk5S+5p/PPjKPXwc6epvlQST71mWhxR+3waqXCB
         8hYjHeK4kQBeh/zfnt8/Gd8m+FNvsHQojomMiE00ZoSMMoPCBmxiqXxRF2r1SU5v9k46
         Kv5bnO0ly5N7kd0NckGXgl7qGBHBvHYAhAN63gHHeZyCo6bAMhnaJ2sYiwp3oPpXGEH3
         6XchV5hNnxVAkNSd3UVw0UzBrN2cQ6+/VTxPNrklzoDcSUwASVvijaAQrWC95FgtqYxJ
         fSkvYOc61sxOfweyaUW/pFZcpDp7Gv/lyIqAEKbVzLxcPJEMGWZW70kD4F7aQeiKBMkB
         jArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G4W5iRCpxf3logbYUk+vaaUqbarkwwxMMo6upR9gUBQ=;
        b=QqKT0F7iDhDqGiBoQb9LITGBiz2k1OvEtuL+semw9uu2CUJ26NgpuKrMrLNbCnWIVd
         IOAnfWrlH1XXYpdDgNhb5H2j3ZH4XfTJBbUWLjGBnV37BecdMZ9NTq8CrMRS1Lfe6Gh7
         pEJE9hilQ+6NJJLLFdkrPbZOGTk1h+d7MEeaLlAylstkebIe1Qa2pIAYhBwJZsrSBleO
         mu1t+xvH/KvuT1EDDthrUmGGL2cxDp2Z9MeSN3d74c7wTMocy/4NNRx0QbMUsCYr1ZqN
         cjUqiRcPi1u2Va/zJQcms5F0PVuAGjHUkhRuiEDTK6qFEBqJBMkhzke+V4lpThzEc53d
         UvAw==
X-Gm-Message-State: AJIora9dmtgK2hty/zsy/TesE+pO3K5EFWEpEacnPWl7y+7pwaOZAJUT
	vh0Gcvb2IqOmLPcKDmJhj/5iiXmo0xPFGeXXXYg=
X-Google-Smtp-Source: AGRyM1uSpltIo/3tQd5aozJm5BFkUH3HKZnQozi1BRUdyqFMI1s00iuw7CgJCEeiuzaGluK7dwLzZcUki9IF9TJ/www=
X-Received: by 2002:aa7:d29a:0:b0:435:705f:1319 with SMTP id
 w26-20020aa7d29a000000b00435705f1319mr18633856edq.54.1655805113414; Tue, 21
 Jun 2022 02:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-48-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-48-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:51:16 +0200
Message-ID: <CAHp75VeGfBUq+jhyZ3F9M2JaaSZMe1+y9+-89bQTW0SCRgUkVg@mail.gmail.com>
Subject: Re: [PATCH 47/49] regmap-irq: Add get_irq_reg() callback
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

On Mon, Jun 20, 2022 at 10:12 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> Replace the internal sub_irq_reg() function with a public callback
> that drivers can use when they have more complex register layouts.
> The default implementation is regmap_irq_get_irq_reg_linear(), used
> if the chip doesn't provide its own callback.

...

> +       /*
> +        * While possible that a user-defined get_irq_reg callback might be

->get_irq_reg()

> +        * linear enough to support bulk reads, most of the time it won't.
> +        * Therefore only allow them if the default callback is being used.
> +        */
>         return !map->use_single_read && map->reg_stride == 1 &&
> -               data->irq_reg_stride == 1;
> +               data->irq_reg_stride == 1 &&
> +               data->get_irq_reg == regmap_irq_get_irq_reg_linear;

If initially this had been as

return _reg_stride && irq_reg_stride &&
  !map->use_single_read;

you would have done less changes by squeezing a new condition just in
between the other two. It will preserve the grouping of the checks as
well.

>  }

...

> +               /*
> +                * Note we can't use get_irq_reg() here because the offsets

->get_irq_reg()

> +                * in 'subreg' are *not* interchangeable with indices.
> +                */

...

> +                       /*
> +                        * For not_fixed_stride, don't use get_irq_reg().

Ditto.

> +                        * It would produce an incorrect result.
> +                        */

...

> +                               reg = chip->main_status +
> +                                       (i * map->reg_stride *
> +                                        data->irq_reg_stride);

Parentheses are not necessary. And perhaps the last two can be put on
a single line.

...

> +       /*
> +        * NOTE: This is for backward compatibility only and will be removed

FIXME ?

> +        * when not_fixed_stride is dropped (it's only used by qcom-pm8008).
> +        */

-- 
With Best Regards,
Andy Shevchenko
