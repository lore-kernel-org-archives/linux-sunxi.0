Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E67E
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jun 2022 22:22:34 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id w2so16103635ybi.7
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jun 2022 15:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jbsgqnojhBY4V415x3C0fDTOg6GG6s3cxgXrWlI1RRs=;
        b=vZZr8iprlZrWBkzFpxmomNEmLN9CfD1JTqvF5qBt2o84s3Xa1T3qgGz+J56QLbL77Y
         axL+HiOLq3EM348vIMSvMR3cKiVUQleIcPWU6FyP/WdnPf7Wyv0dAhCe4Ih5s5mBZgz0
         Qbb56h5a9ZsaC3sjzoGJyPva2YcruT0CwIuHWOXxJuEZCt4AtSSHktbAvLiahcdrtc9f
         44FVXHppSQbz4wpplEo9W0JSGAdQHIrc7ejPd5QrJg38OtoI1ltsMOivLzRMArYgCsiG
         uqjA21xhWQvcY/cCJ0xxTvIWYxj9OTF/nTnRAiiWyh/aeoR+FZ2sqRihoW856/AiLq6W
         ZUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jbsgqnojhBY4V415x3C0fDTOg6GG6s3cxgXrWlI1RRs=;
        b=sB1LJkXlWk0rDkHLBpjEu5Nn5FY33E5ausXpIGV3O6+Lopz1Okrg4l2Mno7R6CaKiC
         sZ89VEVaQj1OfUjPzPefAsyB8NWKvKcVzdZHQLWt6IR0QljttqL9wr7/AvTm2+9/uEtI
         ziystNhYAemEMXa2Zi7U4Cj3CBE3hWbhr8MsB83NG3MWVs1TaEBOG8z32r757pLrSYA+
         b7v1CKdI9ouiQp0IKrV04RyyeugsxnKb1mC69X0O8ITkeRmEgsK+jnK344v3MlAPPQt3
         fpQmVX/NVQqUvdLWZR+scepZ0IMgi+F2CRA0w3pcOUeSXnS32YqATCYXhHKwObesYV31
         vimQ==
X-Gm-Message-State: AOAM530w0vbW6jhRdsVQLUGX0ZDxp7ZUADQcLoE9+cINtGYPQBLXRalX
	ZvQ6od76XmyA0vMu8qbegGYhL53lG5MtCOs2GuEPiw==
X-Google-Smtp-Source: ABdhPJzK4KSQwxvyeYkM8nwzhwDrVml+dsYJsEDSZ3ExN3FHy9LipBWD2wRf514AHIUo75t/iR/84tr5YAR01oNzZTU=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr13266629ybp.492.1654294953955; Fri, 03
 Jun 2022 15:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220526024956.49500-1-samuel@sholland.org>
In-Reply-To: <20220526024956.49500-1-samuel@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 4 Jun 2022 00:22:22 +0200
Message-ID: <CACRpkdbuOm1EQgGsanb50oSFseDmgVrmf_FE1FgL7JUJJiaGtA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: a83t: Fix NAND function name for some pins
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 4:49 AM Samuel Holland <samuel@sholland.org> wrote:

> The other NAND pins on Port C use the "nand0" function name.
> "nand0" also matches all of the other Allwinner SoCs.
>
> Fixes: 4730f33f0d82 ("pinctrl: sunxi: add allwinner A83T PIO controller support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied for fixes.

Yours,
Linus Walleij
