Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069AEEA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:40:49 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id n20so19461726ejz.10
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yO9ZPtHQWlDG8pJW5AjR6r/iVBmTjGfBSQKVmAjwZYM=;
        b=MiT9YSgqAyyHbC2NgSFHcI9mU0I4SmbelZoevB0+h8amRGfyUTmMrWazwaITPEHarp
         ymKzl2T79u9M7zLSooXOXyVg4z58w0poQeJaq3PyZdrpSWwinByRfTzDd3MJMVKc+Jh1
         HrosNpkC9SLF6USdA/ZDhAg0uPAMPxz5wZw22PnS/SvBpuDabh76flqB27+QDjuz85Rk
         kVWCot5G6uKY0ebmYx0cAKxiYNCgHV9fAO4fsWARBr5Cz29I6Pl4NDihgDbx49z6TXgM
         upDr6OeHbZyVU5E1CaDMSJLWT9I584x/Nsc/beJSY8ZvpOWxhrcr5L3ty9BdiC7iyRCj
         44Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yO9ZPtHQWlDG8pJW5AjR6r/iVBmTjGfBSQKVmAjwZYM=;
        b=nGI8ekpTX5ym4nqBbMdDGE5Zx0eDHFLCE2sw0uz6ZtH3u0sDiovk1/AuWlkK5yyVjb
         3+oP+7HxHgZ1D6P2XFssEsX0ZTYQsKLGAaVWfi9JslT/LHvZf4EHYM6Vj3W3nh6QJdSS
         UTiQZP97KiuGujWZVUiB+EfdpBYv7bvQ8eIJB3uH629uPY0djC79oWQ2bSP89FS6VtG/
         ZDLGeZbyQY7ucUkhROvQV4DmZYrRONOW09fnEcZAayqXkfaGwcVnDYY2kWJ+x6f2e8MF
         gTAHVE9XGA3oLQ0g3RV12h6192rXriYeQSxwAQ+B4+b6VufPw62pm+A6QQKrOYX+zvn8
         COfg==
X-Gm-Message-State: AJIora/SbmMZFJ0Q1kydB83PxjNf/G+0wWxlv2xBESmv8Af1te4W91/s
	Il8ej2gzZvo8aHgtAS7sOkMqwc71HbYB9myCQrI=
X-Google-Smtp-Source: AGRyM1t+MEvnyKMMSOFbe0KDznz+llRYAN363T+/fom4dMy2mWe1LxJilznTSxS3mrmOTfCBkGAcauPWgPhktFyIGgA=
X-Received: by 2002:a17:907:72c7:b0:722:e5af:f666 with SMTP id
 du7-20020a17090772c700b00722e5aff666mr1301982ejc.44.1655804448287; Tue, 21
 Jun 2022 02:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-21-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-21-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:40:12 +0200
Message-ID: <CAHp75VdRC5_AUZttMqY8f9gBAct+q5sEUjqOAwVfdtCvwsE_dg@mail.gmail.com>
Subject: Re: [PATCH 20/49] regmap-irq: Fix inverted handling of unmask registers
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
> To me "unmask" suggests that we write 1s to the register when
> an interrupt is enabled. This also makes sense because it's the
> opposite of what the "mask" register does (write 1s to disable
> an interrupt).
>
> But regmap-irq does the opposite: for a disabled interrupt, it
> writes 1s to "unmask" and 0s to "mask". This is surprising and
> deviates from the usual way mask registers are handled.
>
> Additionally, mask_invert didn't interact with unmask registers
> properly -- it caused them to be ignored entirely.
>
> Fix this by making mask and unmask registers orthogonal, using
> the following behavior:
>
> * Mask registers are written with 1s for disabled interrupts.
> * Unmask registers are written with 1s for enabled interrupts.
>
> This behavior supports both normal or inverted mask registers
> and separate set/clear registers via different combinations of
> mask_base/unmask_base. The mask_invert flag is made redundant,
> since an inverted mask register can be described more directly
> as an unmask register.
>
> To cope with existing drivers that rely on the old "backward"
> behavior, check for the broken_mask_unmask flag and swap the
> roles of mask/unmask registers. This is a compatibility measure
> which can be dropped once the drivers are updated to use the
> new, more consistent behavior.

...

> +                       if (ret != 0)

if (ret)

> +                               dev_err(d->map->dev, "Failed to sync masks in %x\n",
> +                                       reg);

...

> +                       if (ret != 0)

Ditto.

> +                               dev_err(d->map->dev, "Failed to sync masks in %x\n",

...

> +       /*
> +        * Swap role of mask_base and unmask_base if mask bits are inverted.

the roles

> +        *
> +        * Historically, chips that specify both mask_base and unmask_base
> +        * got inverted mask behavior; this was arguably a bug in regmap-irq
> +        * and there was no way to get the normal, non-inverted behavior.
> +        * Those chips will set the broken_mask_unmask flag. They don't set
> +        * mask_invert so there is no need to worry about interactions with
> +        * that flag.
> +        */

Reading this comment perhaps the code needs a validator part that will
issue a WARN_ON / dev_warn() / etc in case where the above is not
satisfied?

...

> +                       if (ret != 0) {

if (ret)


> +                               dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
> +                                       reg, ret);

...

> +                       if (ret != 0) {

Ditto.

> +                               dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
> +                                       reg, ret);

-- 
With Best Regards,
Andy Shevchenko
