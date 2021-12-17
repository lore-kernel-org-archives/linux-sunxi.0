Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0E173
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Dec 2021 16:37:21 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id o1so5443814uap.4
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Dec 2021 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AEp4T9Kp6OQ9uqAmVDJWHVQF79DqzDMm0wcZ5f4ILdM=;
        b=SgHpYuEoviE6Pv/XXd6GHBCp1NaZOTpCYqkjQcn5lC1TEa4OSNlmAeRM4jlTllxTs2
         gKN5e9OaFtersTGj7mSJVQJWGnOYgmGpWC/tM8bxxeA3yZObtPcdhcbjP4mv1V2cqmks
         EpIIH6MqP/QmTEX/vfqCnMuGMAqDc5p2AhW7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AEp4T9Kp6OQ9uqAmVDJWHVQF79DqzDMm0wcZ5f4ILdM=;
        b=zfOVHdXduHA+fuzEv6e11OCJrq2SBzNceysjaU3PrTQEip5XCUccU6c97yLyc1Touh
         1YULBL2/aB+2KNK06oEYuHeYGIDF7WjROUDqBBNhtXhVt9aKnKcMqJDCmCbti65JKVm/
         MqgtnHjpM+1sTWf83yOIxXZDhVjN+AZzMOhKbelxcBz2XlFsfkXDLIxs7nqE4HMme6D+
         S6ExWiDK+uMzIK+u4gDQSmClqJPWAAMcWT6cWKgghZI0lG3pcv5NhDbcJVvDiVeSz5Ho
         zHjC6DB4FZpQh0uNZ9WewaSa/n5wAC0P2/Qc+stFJmS65GBjLHpE9+K01Vj7hMA/MJP/
         3/+A==
X-Gm-Message-State: AOAM5321l/HxLN+Jmak8ddIShHrPiuMONfB7lXyOatMGuimH2kgzXqpF
	eWHgs2hhVhCFTdHK8vWsmeVRQLj6L0rN3fI9yum9dQ==
X-Google-Smtp-Source: ABdhPJw55zvca557135Br53Vgyb33kKsdAmmgIeQuHax0oA0pDL+Yo6csOhJVeqb/FsK7zNf/0WfWMzZpZq39EYT2I4=
X-Received: by 2002:a67:e003:: with SMTP id c3mr1408331vsl.51.1639759040440;
 Fri, 17 Dec 2021 08:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213010322.10726-1-andre.przywara@arm.com>
In-Reply-To: <20211213010322.10726-1-andre.przywara@arm.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 17 Dec 2021 09:37:08 -0700
Message-ID: <CAPnjgZ2QxLib_XLdaGzPFw8Q8yGo69UVxb5_prmMaafnLnoAeQ@mail.gmail.com>
Subject: Re: [PATCH] sunxi: add board documentation
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Sun, 12 Dec 2021 at 18:03, Andre Przywara <andre.przywara@arm.com> wrote:
>
> Add some long overdue instructions for building and installing U-Boot on
> Allwinner SoC based boards.
> This describes the building process, including TF-A and crust, plus
> installation to SD card, eMMC and SPI flash, both from Linux and U-Boot
> itself. Also describe FEL booting.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> please have a look whether this makes sense. Feel free to just try something,
> and point out ambiguities or missing bits. For missing topics, please
> send a follow-up patch ;-)
>
> Also this is quite long, shall this be split up in two (or more) files?
>
> This is what rst.ninjs.org made of it, if you prefer to read it formatted:
> https://paste.c-net.org/PleasantNeedy
>
> Cheers,
> Andre
>
>  doc/board/allwinner/index.rst |   9 +
>  doc/board/allwinner/sunxi.rst | 304 ++++++++++++++++++++++++++++++++++
>  2 files changed, 313 insertions(+)
>  create mode 100644 doc/board/allwinner/index.rst
>  create mode 100644 doc/board/allwinner/sunxi.rst

Reviewed-by: Simon Glass <sjg@chromium.org>

I agree that a follow-on patch to remove the duplicated files would be
helpful, but this patch is a big step forward on its own.

It would be interesting to convert sunxi to use binman.

Regards,
Simon
