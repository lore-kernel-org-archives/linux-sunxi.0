Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE023A8
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 20:53:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so424268wme.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:from:to:cc:subject:in-reply-to:date:message-id
         :mime-version:content-transfer-encoding;
        bh=uR19dUJmcNaxBwdM2oTyzNVaO2KBzPX6s9JgcdgMii0=;
        b=ij55DIpBjm/hJbjc0ntL8Q2eWnzNJC2eDhKfxvV1EykMihvHpPJDo3uD/32lOcvKvF
         +Nub1SNXWszsbsqNrrOZywFANBPl6ZQxpN+ByL6OCsk5SheLF4ClaATXOY2xs7A0cBlg
         JAh8CpZNLrm1wTf/ZyU42B38HdJvGMfVTdfI7NPHrngS9uVghyow7eDum8QPsJURP/lm
         nGsgFVuP5u+Sj/fy1JQvRyFUTWu4ChJBQh70+mErYPMicSVDCWeFZv0Qmp42+DP8RQWH
         37PqXCX0mjI5Ww40jRdGzUjybml3+Zz/VJod3AczUP5t0Ncdc/pVDM3foOeWPsbmZdmU
         YUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=uR19dUJmcNaxBwdM2oTyzNVaO2KBzPX6s9JgcdgMii0=;
        b=G105pHn2wJh1H3PwnsG/R2/qCpWsUlNoMjiKi7kWmBZUS1+RKbf/HU2IRXvJ1qv95U
         OznVqCHoVbF6spxDU/n6y6tiu+KSaCilWB+IGWLJrZWp8ljw1HLskPsqkxzCpGdx5m8j
         ojm9CkjLyzIGI1/Ays/mg12bUZACPRLT5TAnCuDZUH/c/S/5AT3895N+/ZXD1LnaLfn5
         vDMBersCLuwfbl0dhxwllj2teXzsPUJtllsKxPpa78XC8zdl98ACye41IJec5SpDpD8c
         4EdZsHNvU9wVSkvNZyUb9Dg2bhHueGCTDbO+f5mlf+YvgEk2bvxpH8k1PwYL3GSgUeD1
         xZmQ==
X-Gm-Message-State: AJIora/ZwrqxK+pwuypd+oBx7xwFeqqHTODpkwqRft02jEsRk/DOTkiD
	QZH4FvD4QhXk7pG7Syxev0g=
X-Google-Smtp-Source: AGRyM1tIBcbqqjiLWicrbHaR6vX8/2L6/5uVJuB9R6VbK4sR7Y33O50Sc4VbODYyYuYA5cMC0BoYeA==
X-Received: by 2002:a05:600c:4f15:b0:39c:7eaf:97e7 with SMTP id l21-20020a05600c4f1500b0039c7eaf97e7mr6415694wmq.199.1656017612752;
        Thu, 23 Jun 2022 13:53:32 -0700 (PDT)
Received: from localhost (92.40.171.44.threembb.co.uk. [92.40.171.44])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d67ce000000b0021b89c07b6asm406757wrw.108.2022.06.23.13.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 13:53:32 -0700 (PDT)
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
 <CAHp75Vd7Sq9RMqin_y-8qUEAJLaGfuqxAbe+qcMB22=bqkyZqg@mail.gmail.com>
 <FQHPnJKuXUHf8vLiZoXidpoim5RtEYUC@localhost>
 <CAHp75VfoMKo9-_OTF1AAC0KyNJOb5qvYPTgHxmkYwOfTJFSLkg@mail.gmail.com>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@codeaurora.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Michael Walle <michael@walle.cc>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Cristian
 Ciocaltea <cristian.ciocaltea@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 "tharvey@gateworks.com" <tharvey@gateworks.com>, "rjones@gateworks.com"
 <rjones@gateworks.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>, "baolin.wang7@gmail.com"
 <baolin.wang7@gmail.com>, "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, "linux-actions@lists.infradead.org"
 <linux-actions@lists.infradead.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, ALSA Development Mailing List
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
In-reply-to: <CAHp75VfoMKo9-_OTF1AAC0KyNJOb5qvYPTgHxmkYwOfTJFSLkg@mail.gmail.com>
Date: Thu, 23 Jun 2022 21:54:37 +0100
Message-ID: <8qRxwIYmbvte9HM2KVfkdhwPpeZ7oY9s@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Tuesday, June 21, 2022, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>=
 wrote:
>> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>>
>> > On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
>> > <aidanmacdonald.0x0@gmail.com> wrote:
>> >>
>> >> No drivers currently use mask_writeonly, and in its current form
>> >> it seems a bit misleading. When set, mask registers will be
>> >> updated with regmap_write_bits() instead of regmap_update_bits(),
>> >> but regmap_write_bits() still does a read-modify-write under the
>> >> hood. It's not a write-only operation.
>> >>
>> >> Performing a simple regmap_write() is probably more useful, since
>> >> it can be used for chips that have separate set & clear registers
>> >> for controlling mask bits. Such registers are normally volatile
>> >> and read as 0, so avoiding a register read minimizes bus traffic.
>> >
>> > Reading your explanations and the code, I would rather think about
>> > fixing the regmap_write_bits() to be writeonly op.
>>
>> That's impossible without special hardware support.
>>
>> > Otherwise it's unclear what's the difference between
>> > regmap_write_bits() vs. regmap_update_bits().
>>
>> This was not obvious to me either. They're the same except in how they
>> issue the low-level write op -- regmap_update_bits() will only do the
>> write if the new value differs from the current one. regmap_write_bits()
>> will always do a write, even if the new value is the same.
>
> Okay, it makes a lot of sense for W1C type of bits in the register.
> Also, =E2=80=9Creading=E2=80=9D might imply to restore last value from ca=
che, no?

Maybe there needs to be some explanation of what the typical use case is
and why you'd choose write_bits() over update_bits(), because the more I
think about it the less clear it is. You're right that the read could be
served from a cache. But I'm not sure if a cache would be safe if even
one bit in the register is volatile, and I can't really see a use case
for write_bits() that doesn't involve volatile behavior of some sort.

In any event, I'm just going to drop this patch and the related driver
patches in favor of removing mask_writeonly entirely, since it looks
like it was never used, and after thinking about it I'm not sure what
I did helps much. If some driver needs write_bits() for mask registers
down the road it's not a big deal to add this back.

>> I think the problem is lack of documentation. I only figured this out
>> by reading the implementation.
>>
>> >>         if (d->chip->mask_writeonly)
>> >> -               return regmap_write_bits(d->map, reg, mask, val);
>> >> +               return regmap_write(d->map, reg, val & mask);
>> >>         else
>> >>                 return regmap_update_bits(d->map, reg, mask, val);

