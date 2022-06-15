Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C177A
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 15:56:11 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id y19so24127111ejq.6
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hN3xPtShaAT5LsLypWQrcKTpTb7xDIkqAjeHts1S6PM=;
        b=kmoAz0fQDs2QEYmrIur1GlFf9LhHAbB6C8QoBQV8s21X/LPDUxtL8dZqRMUK8P0Iqr
         UtFBKLN4xMz1SCFszuJnCnJ9SJ5xSLE1X7vF9DxwNfQQTgJ5hMdXR+x4W3Y10S//MJa/
         Kg/KFtZuF93cLTSzHqfOeYKODoqO88P87pRVtjUI7zsqQ5svtZlbhJWNc1p+1RUW2jns
         q72Vda7GWUUfHaFy44raLeMva+m1hIJTH8VTNqPahC5Ou6eYWBW4ci8u8s5dAmvsOA8K
         K752d8XC8yj586BKAmcp6ZPR38L5fIOge078dCy4HcL+KbLSxuzTAWsjxws6sVevNNVk
         mZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hN3xPtShaAT5LsLypWQrcKTpTb7xDIkqAjeHts1S6PM=;
        b=JBrKUuAGuUDJG/vm76MpSSZ/TLwQp0j5UaWxE5KxAVBdShLlHSkU5EIQC4EWiEpsmj
         ygvNTdY36KcPiXNbVQaJpNun7stHSSX2vrI36sBXBz2L1A3Zre51QTU+FNP0NLLTls+F
         rF0TgVD1Fc6xSDt0nWI3QOqSGqzoRw29KQXAEKBIOa9bfGX+Hbr1mZIxqJk0AzgQXbq4
         G3g8QeYbe6zWugOYQ1cfZCWZFldqWJpt4A9jOvzTyYwDZyl8bwvQG+Mjkd7Lsf8u4toy
         H1ZLsLSvZzJ8kxPwAcOtr/j3onp3gblPxBdGXoZSZ8nLbR94sQfndaGhVLK5ey5Llpyl
         n6lA==
X-Gm-Message-State: AJIora+WR+CPukldzvGBDsfF28HIA6NSZdXAXi8Reb+Q6lHIMB+3T1F8
	rNfRWmJIVA+MpgOVzY2hddo=
X-Google-Smtp-Source: AGRyM1vo6g91ZXfiM6FogSSdc2C7LuzLyjUwdPRKKHlt0PaKC7aMQD77Divd6crIj70WqJhZd3SzOQ==
X-Received: by 2002:a17:907:7b85:b0:711:e42d:4955 with SMTP id ne5-20020a1709077b8500b00711e42d4955mr452005ejc.482.1655308569982;
        Wed, 15 Jun 2022 08:56:09 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id kb17-20020a170907925100b006f3ef214e63sm6455194ejb.201.2022.06.15.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:56:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Yangtao Li <frank@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: wens@csie.org, samuel@sholland.org, linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date: Wed, 15 Jun 2022 17:56:08 +0200
Message-ID: <3106779.5fSG56mABF@kista>
In-Reply-To: <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
References: <20220525190423.410609-1-andrey.lalaev@gmail.com> <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 15. junij 2022 ob 15:17:55 CEST je Linus Walleij napisal(a):
> On Wed, May 25, 2022 at 9:08 PM Andrei Lalaev <andrey.lalaev@gmail.com> 
wrote:
> 
> > Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> > Previous implementation used absolute pin numbering and it was incorrect
> > for R_PIO pinctrl.
> > It's necessary to take into account the base pin number.
> >
> > Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> > Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> 
> It fixes a patch by Maxime so want Maxime to ACK this if it should be
> applied. Paging Andre and Yangtao too, would be sad if we don't apply it
> if it is a necessary fix.

From what I can see, this fixes makes code consistent with pattern in other 
functions, so I think it's good.

Best regards,
Jernej


