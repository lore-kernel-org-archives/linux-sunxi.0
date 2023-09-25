Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E621117
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 13:28:06 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d86a0c97ae6so2565449276.2
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695648485; x=1696253285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZknO15oVls1exzOXk3a1gfVWqzfAFBCtfmB4d9YaDI=;
        b=ydkyvnjWZb/F7vSgDWdorgxJAAko9KyWB2zwsKg+wNjvKd1QTfk+l5mln0z2HweESD
         AdF77wnXqQqOMpg6bxGup/ttQnu+HT8JXK9h+yOz8co0PVTsWY9Lr4g2SXN9Nf9nY8uf
         0q/4EP8cgGTIaBohWhtzG4eBskqW4D+ZpBLyZpixeD3Y/zyQ3Q32TNLiSKB6zBGrLgz9
         rbVK20WEaLDIV+y+A6KIKN1Pbu52e1KBCpRurqWGrS/PTPBssUOJ2I7JrJHwQgZYDHLg
         8XnSiswQtsbdsUmNF7p8qmwlMzutIg7ziY/CVD0x6oY7tjQQ7KrdNfSAMLYHhbgmcJtd
         4Hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648485; x=1696253285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZknO15oVls1exzOXk3a1gfVWqzfAFBCtfmB4d9YaDI=;
        b=R3ysMBTF07EZjNdui5z7NvWOM1E5waDjPZdLp/I5bYTGkcpSkcW2T2xMVku0Iv6x7z
         jTvY8NG14oT+roUTo/lkUFtFox78RDfLEQduCYbgA+6ByJJfZDuJOl3paIX8kryjVUvb
         DOVkav8wtVHGjtcdmq4l9kGPhwuGObFxeXrAfW/Es39GIH6fnIrfiO9KgfI7nUQfY707
         ZN36LN5t85HjUfWw089uuvtTQVTJLeFtGlYmU+BRa4XdhJSaf4ETswneLPMWlWSuflyS
         hqIDTeDbG4OQU7kBF4V1cvrMLt8DrV98DkuRTE2SKZIPY8BxVuBXeTedtYzlvJeRn0Oh
         n0mQ==
X-Gm-Message-State: AOJu0YyouJ2DF8oeI7Xcrddaym75NdhugHV7q68197PxFMohR7qnOQX2
	Ld1dxIAoEGE2wSY0NuB8RANx9MdaZFMweUTi9DDfPw==
X-Google-Smtp-Source: AGHT+IGM7YPpQZLlMQolSiJosvS1gnpdsPSQVS9F7veXMpyagz9PcCbXUT5Cp+eVJ/Vi8PV88//TltYGmv0SU/0+xwA=
X-Received: by 2002:a25:c804:0:b0:d74:6cdc:290d with SMTP id
 y4-20020a25c804000000b00d746cdc290dmr5021839ybf.36.1695648485671; Mon, 25 Sep
 2023 06:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230916081615.4237-1-iuncuim@gmail.com>
In-Reply-To: <20230916081615.4237-1-iuncuim@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Sep 2023 15:27:54 +0200
Message-ID: <CACRpkdZeDpyy812ijbKr2gC5zfhDSuEPHydrCNpRyUnRW1QpWA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: h616: add extra gpio banks
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 10:16=E2=80=AFAM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:

> From: iuncuim <iuncuim@gmail.com>
>
> Some SoCs from the H616 family (such as the T507) have the same die but
> more output pins that are used for additional peripherals. The T507 SoC
> don't have a built-in multiphy like the AC200 or AC300 connected to the
> bank A. With the T507 these pins can be freely used for any other applica=
tion.
> This patch adds the missing muxes on banks A, D and E.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Patch applied, fixed up the commit message in the process,
thanks!

Yours,
Linus Walleij
