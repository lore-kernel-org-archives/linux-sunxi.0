Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F149EA4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 09:35:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id mf9so5893669ejb.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a56PheGcF+r+BjhYmHX7tYRduE7y97a0JE0aqCMtBZI=;
        b=UixjmExeWC3NrbmY2//fqkfPnJRAmI3sK61SBW8J25ecyvNRu8cdjcXzZrB9vFZaVW
         YUpJGfwbiuk1/Q15sPGbqfe6e4JyoZUF59VlyzpkI8jO20sjRrqotK1X7unN/KnfUqEu
         p1Se6aKX+tKaHJYE71hUPqHSk+sEw3O9OOYNMtYAQ70/ZfGxiMBPLX85OQUMZjK6B5Cg
         tPCfGRSWvPAgVwm+hlCyY4iVKhj6g7/5PYEeerpe5McbZ3g4CAAkUyCi8c3KpFsTdeoC
         DSdWLIDZ7kz2SMZgvQ71gwC1mUwdwSgDGv5XUY5Mjm6N+iOs/pHvh4h7V4c3k1ultgT7
         JV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a56PheGcF+r+BjhYmHX7tYRduE7y97a0JE0aqCMtBZI=;
        b=pE0KMUZt08nvhSGEbVidAO+ngbk7L2FFw4iLv7pzl+x4q8JWxt6fTIKmwldE3YU+3q
         A5Rs7ZG2jwOWUrndqRkhbajLqnAf24lMN0R2xq7tUedf6qUAb22PDgLwM7cFxP0aHTKx
         N9VQ5Ln/mrdV4qrOJjuiOY9XB+AG0fQ8DsMtVuspWN2HhAU5cwI4l/CgVEp6e7YmdmC6
         NO18ujbstfZAUTFALBqnYeUI3ovTGdzCWSa3QJw9e4/iBc0z0s6TAUBpI5Q8SGlLVh3h
         xXWil1nYN8OnStN1vkgZvE52iuSQQLSk9lLgWse+RvQ8dfPYzo0DoUTpxeDqLZvWBkmB
         nWTA==
X-Gm-Message-State: AJIora8i1so10sTsQWU+BWoJN6L1zI+dVYMGbPlbJHlSDDRVk2m88gD/
	JXMyvrio0dtkjz3Cyd5B9ghM9+c4RBu0Am2PfPQ=
X-Google-Smtp-Source: AGRyM1vsBhYdy8df/ZvLMM++hzJQmiiHBbGOufLVS/g7a50OxkgQ40vccBsdp5QFt6gNbEpmAGHvXM35Y2xJUEtiTAs=
X-Received: by 2002:a17:906:d9d9:b0:710:f2ae:b455 with SMTP id
 qk25-20020a170906d9d900b00710f2aeb455mr25461664ejb.77.1655804146381; Tue, 21
 Jun 2022 02:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com> <20220620200644.1961936-19-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-19-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:35:09 +0200
Message-ID: <CAHp75Vea8F5ogP8kjfdP4SK3aeohoRnkGZ7LtsLuwfXwL+APvA@mail.gmail.com>
Subject: Re: [PATCH 18/49] mfd: qcom-pm8008: Add broken_mask_unmask irq chip flag
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
> The qcom-pm8008 appears to use "1 to enable" convention for
> enabling interrupts, with separate set and clear registers.
> It's relying on masks and unmasks being inverted from their

It relies

> intuitive meaning, so it needs the broken_mask_unmask flag.

How has it worked until now?

-- 
With Best Regards,
Andy Shevchenko
