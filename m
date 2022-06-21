Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBFEA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:45:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id es26so16870435edb.4
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTHYGS8g7sCFv5p4IGpE8ByIK0vfNIUXHpKKS2cHepQ=;
        b=aZan9a+4JhusAULYzHK4QFgDvTJUfc7zekQyAVoRGCyOHUagzlr3IY3SntNiCuk2D1
         NQjyRuwmILTBnDHyj8RbP6weJG7bsYc7fpeAX5WMX7NI80xLjR2pEQelEAuHWyLISW03
         dZaw/laN5sK9zCYrzCpBc92fUeGmzlgcNNnV+C/p3f0do3S2Xro53gDdPjHT4fWtJj81
         rYkou1ikTNpl6+XOXXlO5K890puNv8x9VBAb1IKHcoUKaWjKVctK6anPKEkAjSj3/2W5
         5VnldB0KCYV6EffLfKh44jApav4JdfNauC+sb7GhpOh85EPNh735t0b35swaLkY44kt/
         +liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTHYGS8g7sCFv5p4IGpE8ByIK0vfNIUXHpKKS2cHepQ=;
        b=oxBkDI0p2z6r0usuxrSZ4ezbTVAwjZyMCjWgpXZmZIHZroi6x5jF3PgU9QHZ1OWvCT
         IA3Ajk0YtTLp7m2J5j2ee/6cloZUqGTQbG62CuM2KP/jiCf87b9+NovXAGoYYPgvNknE
         dWJCOkvCdj+PcpRekBIk/nu/R2d2QDoOZrP7XOhpPXk68R5X6/W6c0cBjt/ahuOVrzhX
         5tmCC1BN2vtA+nqAcRCR9BzIXSdbni4wOlgLoLYFZebKzBySBsQ8Q0AtE0NQ92CPsT+M
         pl3+g+6+Dry79eiTvYtTZ7pJ5pndyZs/bS5uJUrypIITQUvrtMbiE1lgITy90ngjuUfm
         SOAQ==
X-Gm-Message-State: AJIora9JIjpk2+C+Rlc+VBwfeRiyykavgMTRjPChL+TGQekK7rsVosbn
	FxwIKfofSDXyN9+6ZsoXj4A9mC48tP5Psq/7lbU=
X-Google-Smtp-Source: AGRyM1u+LlqfMEeQQX/kZr8ewmIWAzmzCCS9cETMG4/8g63994DOIJmrlDmEJXOU2GEP6EkqBPGnv4N6VF0F7gWLvvI=
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id
 eh13-20020a0564020f8d00b004356df2068amr20143116edb.209.1655804752004; Tue, 21
 Jun 2022 02:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-47-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-47-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:45:15 +0200
Message-ID: <CAHp75VcidJzb+1-uNMuDCKPSaxKkCdKnB=iF33g_PqaiyHAN8g@mail.gmail.com>
Subject: Re: [PATCH 46/49] regmap-irq: Refactor checks for status bulk read support
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

On Mon, Jun 20, 2022 at 10:11 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> There are several conditions that must be satisfied to support
> bulk read of status registers. Move the check into a function
> to avoid duplicating it in two places.

...

> -       } else if (!map->use_single_read && map->reg_stride == 1 &&
> -                  data->irq_reg_stride == 1) {
> +       } else if (regmap_irq_can_bulk_read_status(data)) {

>

While at it, you may drop this unneeded blank line.

>                 u8 *buf8 = data->status_reg_buf;
>                 u16 *buf16 = data->status_reg_buf;

-- 
With Best Regards,
Andy Shevchenko
