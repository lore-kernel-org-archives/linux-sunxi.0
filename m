Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9802FA58
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Jul 2023 19:33:28 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-cf284f4d7afso1020678276.3
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Jul 2023 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689881607; x=1690486407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAA4YKtARNm97BR+WbnNXBQbQzkaBKgEy0iMdJmOHMA=;
        b=USM3aXLAuUe8po5Nm7yr6OoNGynYpaik6D6wGKUsxVsg8yPFJtC3FFvYKyovC1/iwX
         wEq15pDuUM1o3uHKp43K+ygQTuIBIp/zDuaiWRlE+twtDrXkATJ/Ln5BIP1HNGGyHsBI
         KPUGGfGK2Yk/bDNOuBu3v2WLnqsOnuW8shrTxZngwE2gFefnS4/btqQh9rnZDPa/sEdx
         Nrhp0eHAf9bWlyLcBO8KUmX/C+W/vY9vLqxJO1XQnkZKLaSzPyt3ffCNXPXO+N8tFXus
         Uv8PlWh+VI1rsS43ONFZjYa3H6vL7t/7wVVsCoRxM2BBQFb8YneUyqCxKd13FFK39wDK
         StdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881607; x=1690486407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAA4YKtARNm97BR+WbnNXBQbQzkaBKgEy0iMdJmOHMA=;
        b=IugQCQ1gMgJiXz0TCnwt0Mou1fHunuQ9V/cI6draChJ6gBXoxz6CEGnWk7m9xtnNTj
         gXP7zUW93YRICZSPvU29WmEgpdQxNIOBRKVaAcsjJDp+u7HGuOaioPrxvVL3UBn7lbxC
         VI7Ky1cK4QoN1ZR6ElHRJWRMC11a3d5WyneM4YvCpfXg31wua1WGc0WzfFP0dsk06msT
         3KycYS5FcsIMBUndb3fG0760JmoHEBOQo/5RWEk9ppbuF7AfwSqQ6Q6H8eo6GLkpbo8P
         2O9qR2U9+LK4rjQjVsc5Sx7LXOouBj8o/oaSLNVEOt9z9af5vYMa2u+wZmb0C8/hCbVh
         5XwA==
X-Gm-Message-State: ABy/qLa/BYkGAsOzUPzTFildh5dkspdXsQGqd4kxJZcGez2+O7nCIut+
	vdW8M5ImZETzZ9f1gvfBFnGuNXAySy1edl34pe07iw==
X-Google-Smtp-Source: APBJJlFMyJGJYZl1X0Xl3JL/kHOPlmQzTpSeOAF+bjJ5Q+BjRCMdplnyIEg/TI+4GvKZXOIBKpca4PlArXmrwwGkwHk=
X-Received: by 2002:a25:d453:0:b0:c61:8ddc:88db with SMTP id
 m80-20020a25d453000000b00c618ddc88dbmr6321998ybf.6.1689881607489; Thu, 20 Jul
 2023 12:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
In-Reply-To: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Jul 2023 21:33:15 +0200
Message-ID: <CACRpkdb6P1KjGWNnYWKoG+ZxFCLo7_06zjv_8CGMFoT9S44o1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Add some defensiveness for regulators array
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 7:20=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> The sunxi pinctrl has a fixed size array it uses to store regulators used
> in the driver. There is currently nothing that ensures that the number of
> elements in the array is large enough to map the regulators defined by th=
e
> individual SoCs. While this is currently the case having an explicit chec=
k
> in there will make life easier for anyone debugging memory issues that
> manifest in the driver so let's add one.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Patch applied.

Yours,
Linus Walleij
