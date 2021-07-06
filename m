Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB3170
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 14:23:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id nd37so34440033ejc.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Jul 2021 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4o1TdLi09yGFx/0vrPQXG9W9Ym3vbmhNdLW/6AcNEY4=;
        b=Bv8S5tic8luNXnFOSbEow1By+watP3n2S5dn1UKmBEPMMn7ScJxRC77acbYfi+Dt/6
         UDxMA3b7A2gRRe9KAHsBC4vT9Dji4qc20Q5mqD6QN6HkCJ1E9D5eTpirtEmeX3Oth8u9
         ivFNH8ObWM1HKT6osfEoNyL5b+aTEKcPibYPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4o1TdLi09yGFx/0vrPQXG9W9Ym3vbmhNdLW/6AcNEY4=;
        b=fK73SOOhg6b8gkpeGv6kAxXzzflaDWqUPPYz1NaflaZyZZ1ukUsLwbxK3iG/JvUc7j
         lPJv2TGocBpzLR0jUhKZ4xtibH1dFZ6p+O2pdwVSWSq4AMaV6ku33to91nXNgIrnI2pg
         z7T2LjBlupCLAtg5kxWMrtGCKeNJ5Cdqw+GiS33VzS2sAE31pYvPqrwtvPOleyVw9VRH
         WY1j4S0HUGn+F75Gc7jY4MA7ncCXpD42xpsPvDeWicCHSU73ostfli/g4ifSktdCf8Uw
         JSzXsBErgLB3JmlSSRLbvqbEHGu0Pn2AHseTLkhHsvgwfxTYAgN8HUtM2UgOt/gRG3NB
         /EtQ==
X-Gm-Message-State: AOAM532wgNwcyla+5+uuxF2I9yKjgX/ga7ENY2y3LpuA6GG3aeNuu1xl
	UwB2pvBymuP57/hdMYOiGRrXr630cVC8z6klHp3x+A==
X-Google-Smtp-Source: ABdhPJy0fhk/SVM9TaoXf/40hEy+kTkzkNqte7Zy5noVkUCyF/GpnOY7w5hCc9ryXFkcR3PVTHxt7Fy42ZIabgdseXU=
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr19075919ejc.60.1625581389310;
 Tue, 06 Jul 2021 07:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210705230445.14834-1-andre.przywara@arm.com> <20210705230445.14834-3-andre.przywara@arm.com>
In-Reply-To: <20210705230445.14834-3-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 6 Jul 2021 19:52:58 +0530
Message-ID: <CAMty3ZAaJQu7L99kwHX3cdiapQnR1rVgoH8mfwgyYktV4zQ4-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] sunxi: SPL SPI: Add SPI boot support for the
 Allwinner H616 SoC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:35 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> The H616 SoC uses the same SPI IP as the H6, also shares the same clocks
> and reset bits.
> The only real difference is a slight change in the pin assignment: the
> H6 uses PC5, the H616 PC4 instead. This makes for a small change in
> our spi0_pinmux_setup() routine.
>
> Apart from that, just extend the H6 #ifdef guards to also cover the H616,
> using the shared CONFIG_SUN50I_GEN_H6 symbol.
> Also use this symbol for the Kconfig dependency.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
