Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15575EA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:36:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id kq6so26165216ejb.11
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3mXXvSs4qGpLiVTug5tdC+fphrM4PCUnQdpfU/r3B4=;
        b=GZTXPEfS47hEV7elN7AWU0dyhKzNKwdabIk8g/G/aEeYWfI/AEfKiiKKiJ0evIjaEd
         FtH51zPQdYz0Wv0AmPXOMQLodWRlV7HyTinHEw6fgJQgOlyjsTl6fQZSl/ybu604W4F+
         UxX4FRJSL6jlr9oxoyyq/C/sBcO8EH2byvWx7KEErHyh/iWfN8aNrTMTHnPVZ2W1J4lS
         1/7esI1emn382GWt20lYVLjXhb37rvclxIVWEiEfxWQVq7ufkcL+iuwCEDXuZqtEs1hI
         31L1rsZzI7J12QKbgN32jIG+MHsmRs2cNl3LB3qH6J7/PgBIg4Xu7+4egEgkvTA5IXOX
         L5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3mXXvSs4qGpLiVTug5tdC+fphrM4PCUnQdpfU/r3B4=;
        b=TR9yExNYmjww6Qjy7rOYqEVymEJ16M33pKWgOYe05rmNNDIvT6MbPC4U0ILiMDC9V5
         SLtjFp5WSUQg9yqoyDvQoXVDpz12WBcI3eGWASNl3P3mNL1u6HopDX2XtBadcmjkch2i
         f1PoYAHOBxFN6FRjp9/PB71byT44hTK9AGp/amd/mL2BFe9Zjow093ezD3xa3vqAkyU+
         APSynrmy2YiAImwZtMPQKA2/5xtalmTOXFri7AK3a15soz7T/1O5rSIWmh2V9bxTpF7W
         +MrxLAKzSy1ZVrWuXBk/aD6pFWBC3RacGGsZ25YiDIe9Ic9ABa1PSkx8bei9zrcvqZSg
         JSUw==
X-Gm-Message-State: AJIora+jbhoe6vrAJAwzfxosezxCsm8m6E4gRnK21O7Bd2XJvZCpIk0W
	vbFZ2qwbktKw2zyCdyM7/++TIGjchOk4c3Ag4ik=
X-Google-Smtp-Source: AGRyM1sRYgfxiRNVCrgQTqEdasUCfu0meMegNlwo9FOn+D5YKqJkROr+llcEryQym3oDDQnhAyovKBjYaNBAW2RF8Ek=
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr24694089ejc.132.1655804186418; Tue, 21
 Jun 2022 02:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-20-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-20-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:35:49 +0200
Message-ID: <CAHp75Vc9=fcUCAZuTAg9FTWCAtsOo8PaCdGj3NNyOwkN9PJHUA@mail.gmail.com>
Subject: Re: [PATCH 19/49] mfd: stpmic1: Add broken_mask_unmask irq chip flag
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
> The STPMIC1 has a normal "1 to disable" mask register with
> separate set and clear registers. It's relying on masks and
> unmasks being inverted from their intuitive meaning, so it
> needs the broken_mask_unmask flag.

Same comment as per previous patch and continues to all patches of a kind.

-- 
With Best Regards,
Andy Shevchenko
