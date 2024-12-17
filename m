Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DD1F3D3A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442758; cv=none; b=LnmYBbrFBQmh77yLe5x6IbQtqTkvA6Wmwazjna1wOld6vIiFCUJ94b/ErXG3F6Lsg2GABB+XP8yLM1v+OsuXZI5R1rnR7RpyrpKePcv3T0QbFsf6iTsYE5AAtBWEF7zfNFEfJmiey3sicmzImvn6Vn8fxIHb+kHzM2yAqXZKXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442758; c=relaxed/simple;
	bh=+BHHgz6jyTf+Pk7wqxnrYIMZ4vqcIxReE5ZMVRAFZY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vuabs3ybPD9prNpQsQEtQNrafF5eoC2DnezdwmH/3qVu1dmPAAvxCo08BKU7qUuDGxxkyCzLyOanbkpr1tLOqBXQxLYXNh/eG/hAcTI26/0lVaLOurepoUoGezWwxNSZbkBaliQWXBjhx5TFmpcWZN/pN4LvlsVXxTKgmMyxLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j36YQ2hM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j36YQ2hM"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401ab97206so5526387e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 05:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734442755; x=1735047555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMjCYKV984QoRr28xf3w0OYwbaOYhzni2D5iyXZ+XqY=;
        b=j36YQ2hMSI10m8gbCW9S7WcuwCdbkSyJUsfZM/IyzgwttDJda53S41iCH0nJhwW++M
         UjUVSQjzle88HMYIyOFlpbUSRncJxQK6RVG3D9z6+RpiJybQjdDnBgkPYf3f+vnEH1Ky
         PinwercQeHAuIlToNkmcytD9gnhfBWXnvrCbgLM6VG+3ZLs17ArIVaZqUnavHhttgbsR
         VqFqnhv/K0PlF1EpXlqSInUvan4jr1OhE3EdWYdF3Z0EBs4hvZB6IcXBEwu9Bl7VvEw1
         6hJLSFJ3WivQoMPIcAg3kUscnts4DgJi5Mw/0R61TwBy2KT5ch3J+RBzF9U0FsRwcGpv
         rtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442755; x=1735047555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMjCYKV984QoRr28xf3w0OYwbaOYhzni2D5iyXZ+XqY=;
        b=DcRulcgEpi0Ld5oxVlcjARChx97wRzqi50+liTV5P8jCJAiw2Om6+qFS5rL2CwkUUJ
         dmy+DnyKe71R6BW4MM3rJ+0RTfgf+PoGnHv9RF8+mffwfn8wnKZMF1YJpBqw5Q6Ef4DR
         /8IN84LTLk/8/K1l0k7uRwMZRBoJkCgt0nLjlzlJuxh67B8wWrXNFM3KnfIIZyeBCccm
         YflxMpIoAoqBJqo1SWZMsO8CY0XZpg4KR0m5tdbvMlFcSEm8B/P1ltVC8ut3uZR9trqC
         v3FG5eJMs8RWDMIRNe3pctXnf2fHcXAo+ObGXzCgmwxibhdSAmtlzu5sv16IJfdwoqfD
         xFxA==
X-Forwarded-Encrypted: i=1; AJvYcCVXu5grwLoVaziRbIm1rEh9ptYa6MgiOk3aws0R6nhKk7xp87t1PDtxE8hdxwkdDgYw6duzPi/GJvwM6A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlab4NLV82WfLKSPHeruAhNHqg+Gi1GyiP2LUFCni51eTVOFRk
	BV1HnqeisbI7NLQE6vZto++VLBNaeUkt+Bkp/NwXjuFCdVwbPZK73+Y4+4G/P2RmJHXWejlwpE1
	n4mXC9LY40NQNSODMUfl9GOKYE/pDDZknZWBi2A==
X-Gm-Gg: ASbGncsnPQabW+lenSWcTN5c6E/qWaUfUV2xtLtawXK+68qYzkkEOyA+XIn5oWE1k57
	Y8eOm4nX1g+ajmfCLyt1fz9FO9bljGTchseLTqA==
X-Google-Smtp-Source: AGHT+IEjrp870JNskf6bHNzYI2aNmKqs1NPMelQxcm9rfeKc8LyEkX5SdkkUq1R1luqQe2P7T5643ul/B1u9O9Mw0vc=
X-Received: by 2002:a05:6512:1287:b0:540:1ca7:4fe9 with SMTP id
 2adb3069b0e04-5409054e4b0mr4948477e87.22.1734442754678; Tue, 17 Dec 2024
 05:39:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119140805.3345412-1-paulk@sys-base.io> <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
In-Reply-To: <ZzyoIABRArkGoZBn@collins>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:39:03 +0100
Message-ID: <CACRpkdbqufNVq4Ai6GQpgK2OY0rxLnp1wLQNmRoCv44T0xmFkQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <contact@paulk.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some discussion here, and some emotions involved.

I can't seem to follow the technical matter because of all the
social matters :/

On Tue, Nov 19, 2024 at 4:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> My use-case here was hooking up a sparkfun sensor board by the way,
> not some very advanced corner-case.

Are you adding this as a DT overlay or by modifying an existing device
tree? Does this sensor have an established device tree binding?

Are you using that sparkfun sensor by a kernel driver or from userspace
using the GPIO character device?

I noticed that the sunxi GPIO driver is implementing the
.set_config() callback calling gpiochip_generic_config,
which makes it call down to the pin control driver to set up
the pin config.

which would in turn make it eligible to use
the gpiod_set_debounce() callback to push down the debounce
period.

But pinctrl-sunxi.c's sunxi_pconf_set() does *NOT* implement
support for setting up the debounce, because it is (as I understand
it) not part of the pin config hardware, but part of the interrupt
generator hardware, correct?

In that case I think we the gpiochip .set_config() callback should
be modified something like this (pseudo code):

sunxi_pinctrl_gpio_set_config()
{
    if (irq_is_in_use && param_is_debounce) {
        modify_irq_debounce_according_to_param()
        return 0;
    }
    gpiochip_generic_config()
}

pctl->chip->set_config =3D sunxi_pinctrl_gpio_set_config()

Maybe the debounce can also be set even if the line is not used
for IRQ? I'm not sure.

In either case the latter would give the GPIO driver a handle
on the debounce, which is good because the irqchip
generally does not.

There is a way it is possible to use the interrupt with desired debounce
setting by first getting the GPIO descriptor and modify the debounce
setting and then getting the interrupt from the GPIO descriptor:

struct gpio_desc *g;
int irq;

g =3D gpiod_get(dev, "dataready", GPIOD_IN);
gpiod_set_debounce(g, 1);
irq =3D gpiod_to_irq(g);
...request irq...

Here I assume the line out from the sensor is named "dataready"
the actual component likely has a name like that for the line.

This requires changes in the device tree as well, so that a GPIO
line is assigned to the sensor instead of "just" an interrupt:

sensor {
  dataready-gpios =3D <&gpio 14>;
  ...
};

instead of:

sensor {
  interrupt-parent =3D <&gpio>;
  interrupts =3D <14 IRQ_TYPE_EDGE_RISING>;
};

Unfortunately this is one of the areas where DT bindings are
a bit ambiguous. Some just assign the GPIO line as an interrupt
as both APIs are available, sometimes a proper GPIO line is
preferred for the above reasons.

Yours,
Linus Walleij
