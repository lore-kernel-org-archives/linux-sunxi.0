Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F312DA5
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 10:21:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id b2so3763954eja.6
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DzVccqK8r10+eJcWFau+z76oVshVdUbajb+fpILwHo4=;
        b=ZjAWG299WEYD3yhWLaSEkxdPYu/zU0l6XzZeRRxVMF/TbyNqO4VjpXuAtPmN3OE7BL
         WU2ayYqvlurEI4IIqWefXARXvKodyhMPCIxUPeJu0Wh1rxfXBmsmxAsZ9rwxvpm+n3Hi
         VgYa3tKEmTetYUmFNPmOiQYDc29IZE9tv0tikOdFijyjoI+j6hQTy9qfLlku3jA1HkLs
         f6W5V2yQgG0zE/u+0ciDWzq/kYEuk9KoylB+bifB34zPgkF0WRaaUUizmpqThuzbGiJ6
         llmCosDcSRBA0zcQPfvGKeH2F3JPCtozxm+ClTMVSYwHlZXroAQwhFCO6W2IuHWUSg3X
         gZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzVccqK8r10+eJcWFau+z76oVshVdUbajb+fpILwHo4=;
        b=i/TRxfKTCqB5N9w5bLRLbkjvOzQbl9hqyls1cmCYkjtO/LTm46fFeU4uATaN2O0bWM
         IY+OybHjSilAgWHenhR6pw7m/OLbKPWPq9dx8pQqAMSZ8krSIbHiQQmo1WDWfJrP2FYn
         9+GYTkuLnuzJ0NAqGXFUz2ucmdUGY6U6gHkrxSYOqGNUIylnatNL2+PHlYhXEK7YKVR8
         hqh9UQFq5uTUlHwQSSaXyIc5Ub93oS7dmlS12GfeCeyaTis8NMsRLIMntF0pEtDRmJsN
         w0uruPxsOBm7Kxf8fOW796VoM5jCPceNOQ/G2ZIfK2PJRQL216FAPlfhoH+482Jg65fz
         9x0A==
X-Gm-Message-State: ACrzQf39skAyFP+n4lmsj0ePxoO7dsaTmqx3cDT7q2HbODGMHCac9xRh
	DSUs7Sbhc/VEYUBo7TkSK4bobkZxc7oudj/RurHXoQ==
X-Google-Smtp-Source: AMsMyM7gTYta/+pVULXdP/rsWKEEJRTzX78HLJvZMbTb+bGDejI9yp4s7ufQUVVK7iJ/aB5J8JreNEBML0pwIRci4UA=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr60349152ejw.203.1668075673995; Thu, 10
 Nov 2022 02:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221110014255.20711-1-andre.przywara@arm.com>
In-Reply-To: <20221110014255.20711-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Nov 2022 11:21:02 +0100
Message-ID: <CACRpkdb=5mobcWBJYtXd=nC7A+Uo__itk0F9oZBeTjWHBkBU1w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] pinctrl: sunxi: Introduce DT-based pinctrl builder
To: Andre Przywara <andre.przywara@arm.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 10, 2022 at 2:44 AM Andre Przywara <andre.przywara@arm.com> wrote:

> Compared to my previous effort almost exactly five years ago [1], this
> new version drops the idea of describing the pinctrl data entirely in
> the DT, instead it still relies on driver provided information for that.
(...)
> On the DT side all that would be needed is *one* extra property per
> pin group to announce the mux value:
>
>         uart0_pb_pins: uart0-pb-pins {
>                 pins = "PB9", "PB10";
>                 function = "uart0";
>                 pinmux = <2>;
>         };

So what you need to do is to convince the device tree people that this
is a good idea.

For me as linux maintainer it's no big deal, it's fine either way. The new
code looks elegant.

But from a DT point of view this needs to make sense also for Windows
and BSD, so that is who you have to convince. If it is possible to derive
the same information from the compatible string (like today) that will
need an extended argument why all operating systems will benefit from
this.

Yours,
Linus Walleij
