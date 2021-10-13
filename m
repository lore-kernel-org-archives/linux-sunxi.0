Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBC2C81
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Oct 2021 23:35:55 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id d3so16690128edp.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Oct 2021 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+QVWEmqTwjvB4lKG2oT78utmP75huv6baJV8Y1UEyyM=;
        b=XGhEFyFE/kODzisBg+Dy3AWn53AkLeZdpDCkcVjpmgkQ5sBz/p59SBbPu5fEYROYNl
         3VZG3uLSjs6+TssumBQaLFlmPuC9hEMTTSOvtXtsBFw9OxqzEHMD1VxPUCaIUifMd/k0
         pWcd1MxVSJ6o9D1nP1dT9+KqMXkE9x8+fxYSmw0sNJ4u/yDOWhQq5P65VcHnSL5Xsyz0
         IYmTaT3V9edfHkDZO74JiRn2d3SLiqGGviUzePNz9HWEiOBqHi4lV++TlHX9no9nD8p0
         QqXDOlXbcgltsvk8a1CVTZZbJ+rBeq+d8jEVc5oae7gBFRfnfjJTU4QTwOXcQ0v4qm7h
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QVWEmqTwjvB4lKG2oT78utmP75huv6baJV8Y1UEyyM=;
        b=zXRBeBO/VkjMsnTj7Dj7KjzZt2qeo55vN4rVTQE+bqY+QeRH1hxRL3vWePQwmW+ups
         +xTKHGzpyNWan1MNIFzEVZNIF+2kOqMnRyqrUhP6xfeGN14x7dT6tUk9Pc0IlKkcTvrd
         133M9lItYKxSfLNoIaSCPlo9fYqg3oSia9ONy3R1RYJm4S/m4V5OLrTat/P/2oLjxGuz
         CdkjMRRh0M+Usdfru/vhgqxRBK60ODdhsoytpKdLVBhbg9qpvb4g72TDUtsgMqX1SIrV
         zp9qdrREpQ+IanAWGuFr/gcyp94nRnovxWU8PF2CFEsUdMlEPVu+JOq169ui0dWf6r1L
         5CmQ==
X-Gm-Message-State: AOAM532RuJ9I+8+r/cTklE8l7LizlMgKdkubSNoOSeq7DuttaL3ctX4E
	RhcBChNuofWVALd4Do4CAVBgVoS9PgjzgdH2kEsyjw==
X-Google-Smtp-Source: ABdhPJzudWwbadLJFz5Q8P5mUjjvq1YMm2nXg1AcHEp7PN3hUnfOyGsjcJO908OaBYfm4p57U+ZXDNmK5T53AbSmRP4=
X-Received: by 2002:a05:6402:410:: with SMTP id q16mr3747697edv.286.1634168153873;
 Wed, 13 Oct 2021 16:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech> <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
 <YWWg0PjnuBCKO3Tq@google.com> <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
 <YWWu+t487giK/FB2@google.com> <YWWvJKs8K9Z8WIGV@google.com>
In-Reply-To: <YWWvJKs8K9Z8WIGV@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Oct 2021 01:35:42 +0200
Message-ID: <CACRpkdYe+qJMqbFNyfSE=93ERg4XrmnxqxkT34Kv5n+ZtCyNLA@mail.gmail.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>, 
	=?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Frank Rowand <frowand.list@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 5:52 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 12 Oct 2021, Lee Jones wrote:
> > On Tue, 12 Oct 2021, Rob Herring wrote:

> > Ah, I missed Bartosz Ack up there.
> >
> > Happy to apply it.
>
> Linus, Bartosz, do you require a PR?

I'm a bit out of the loop so let Bartosz answer this but generally
not, as long as your tree builds clean we are happy!

Yours,
Linus Walleij
