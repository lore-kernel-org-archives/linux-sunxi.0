Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFB168
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Dec 2021 08:35:13 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p4so28992820oia.9
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Dec 2021 00:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SS7GkvQ5xRVUO4q4KUfR5N3qe2D0VOhchnwoMe6FayA=;
        b=of0wIJtNSZNRYuBiqEv2hnRbnEh/LVGXmVJj/WHSkmH0ry1AtOssWUJqccvFs+MEOv
         NP8pIG5j1CMpRR9zWO4X7haGzk/W3VyqZskCpypcU5GtBpbEkamtabyX3VdmZNtU6ioR
         XnYg++pJkldGrxsGehiW48EntFaALgAfBNn5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SS7GkvQ5xRVUO4q4KUfR5N3qe2D0VOhchnwoMe6FayA=;
        b=juB2gwiSkLtdfZchUnStxaMxHkn6NLc832dDexhvXX9OqgbnBTyZ/E0+feauR5E7L1
         zz3pTozKF2OXRSQLfhPpPejiVax4BvIF68qfxsZfroXpnTNTq3/DAAmgwVrGrTvrGPXi
         KaKulPiqtsgmHULxrVgE6nc/W6GVcwE4EEbDgW0Zjco5N5BUmoTBTnjrqtw0eEBeA+Kk
         CUoUAa8XBtSdtUU2xi6rQyga78Z7N3O8bjb1PlbRmDerzF6j9AbBtmeVA8zlukYgMCcN
         xo3OHURLhUC4W3sDTkz5aCS4iRBebulgxAmumt1CFmWoyql4usXsU27ZN0N+J+yzwMe5
         2JRw==
X-Gm-Message-State: AOAM531ZouMpK7aySq7+0SKQx6Ls3/lZo16YCQBWSahIyZhLu11gn7/s
	pwYzAf8ThwRDee7pBuR8U2JoKRH2QGAZRsrj9VZ2XQ==
X-Google-Smtp-Source: ABdhPJwYYykO1W2GgR4D2NP1rzaFtQLpOKji8bJrSTWhuwpLO0bLF2yv6kG1jUP/v8iB/R0tTD9Dk7AhuogP99gJL9s=
X-Received: by 2002:aca:aa12:: with SMTP id t18mr8958210oie.81.1640680512880;
 Tue, 28 Dec 2021 00:35:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211227150736.1437-1-andre.przywara@arm.com>
In-Reply-To: <20211227150736.1437-1-andre.przywara@arm.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Dec 2021 01:35:00 -0700
Message-ID: <CAPnjgZ1-2cofghp2BA14fNj2s2zhiUbGyOgedCWuU8G7LMKk2w@mail.gmail.com>
Subject: Re: [PATCH v2] sunxi: add board documentation
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Maxime Ripard <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Dec 2021 at 08:08, Andre Przywara <andre.przywara@arm.com> wrote:
>
> Add some long overdue instructions for building and installing U-Boot on
> Allwinner SoC based boards.
> This describes the building process, including TF-A and crust, plus
> installation to SD card, eMMC and SPI flash, both from Linux and U-Boot
> itself. Also describe FEL booting.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changelog v1 ... v2:
> - drop optional command line parameters (-j, -v, ...)
> - more links and explanations around crust
> - use "sudo dd" instead of "#" root prompt to indicate root privileges
> - add prominent note about BROM header inside GPT
> - more hints on SoCs with 128K boot offset ability
> - add Allwinner index to top-level index.rst
> - smaller typo fixes

Reviewed-by: Simon Glass <sjg@chromium.org>
