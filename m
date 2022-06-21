Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEA0EA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:30:01 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id eo8so18588731edb.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eVfQd3XPechRFli107C/XOXRbeHsShcnB7OFUBR1wN4=;
        b=SkWmIxEV+ESyHsCbsR1Xt7I9SQuAWrV1KNmPiHSefbw6tjpPMuthp3LqtVQ2N+GIyh
         BF0EUqeIjZ/fTFqxBB6wXJ7xGaqQxl7IRe8eZi1sO2oZD7dNwzX7VC5QBndK7WTzX8pW
         ar9X/Z0jZRtZLQ6fUs2aQmiDZ2d91v914nUh+KGkyPNtXOmVVYNnVMMqb+EzlDt8o66V
         a0FVH1Zp8dBl16N3CmVzQ4p+Wj0SgKmTk9HwQkqHXo0LNrXTGtskvMPd3alLj3K0vLA/
         //ny6WHJ/gvkwxF84HzdQy++kjBUu8yXxysyZC5+Z+VkMghwv8Mv/zySzZVeO0ePODU+
         GlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eVfQd3XPechRFli107C/XOXRbeHsShcnB7OFUBR1wN4=;
        b=erjSSyzOJ4z0zbMsst/6EaPQIEl2jLhiP3zPwBFG30/0n4ioXN3l/9xKU0IRe8Dw2g
         ezTRxoAmICtdnruz9GaKDXco0AuTb9//vJbcoJtofTCyxyLcIvcfKocpvXz7FzooIzyU
         xpNLxm6XCGQpFXH9Ufel5InwkQoub3oua+Sk2EStKEcemFDEheFNYsgQNsIAv1qqxK6D
         A1AonDSBDZvW2YUxVuDTsuenFRduO0Dz83pkmgM7cIX/yvY0ysFUUlvUl1PMINxuMdEj
         GpYI2ZVG+4c/K7tpC+4eIy1INEIVKc2wvGOaEoejl/tdCYJaijA/YXc8J4+K7b964pmB
         wofQ==
X-Gm-Message-State: AJIora/9D+tTUVszf5uM45bpRXkOZCtBIxJdZKkz37S+dnz5YRnMfCkM
	HOZgvYUV7vRwpy1NIRrl332UvGCakA1xm988Oh4=
X-Google-Smtp-Source: AGRyM1tM0xU4gMjk8srBUxoaihaU7C2henLT+DWnWAydDDa7goTMcwvw8+NLuBGCqmwgWP4p2sY0HbLwAwb7ohmPFDY=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr34685476edc.97.1655803800295; Tue, 21
 Jun 2022 02:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:29:23 +0200
Message-ID: <CAHp75Vd7Sq9RMqin_y-8qUEAJLaGfuqxAbe+qcMB22=bqkyZqg@mail.gmail.com>
Subject: Re: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
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

On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> No drivers currently use mask_writeonly, and in its current form
> it seems a bit misleading. When set, mask registers will be
> updated with regmap_write_bits() instead of regmap_update_bits(),
> but regmap_write_bits() still does a read-modify-write under the
> hood. It's not a write-only operation.
>
> Performing a simple regmap_write() is probably more useful, since
> it can be used for chips that have separate set & clear registers
> for controlling mask bits. Such registers are normally volatile
> and read as 0, so avoiding a register read minimizes bus traffic.

Reading your explanations and the code, I would rather think about
fixing the regmap_write_bits() to be writeonly op.

Otherwise it's unclear what's the difference between
regmap_write_bits() vs. regmap_update_bits().

...

>         if (d->chip->mask_writeonly)
> -               return regmap_write_bits(d->map, reg, mask, val);
> +               return regmap_write(d->map, reg, val & mask);
>         else
>                 return regmap_update_bits(d->map, reg, mask, val);

-- 
With Best Regards,
Andy Shevchenko
