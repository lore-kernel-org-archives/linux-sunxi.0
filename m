Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D432F37
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:53:22 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id 13so32727904ejn.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHuTiv5pA7Z5U4slTvhn316jmXmIhRsedaLyw6JXUZ4=;
        b=clr5qcxN412LMBY5jD8myVaJv+L9wuRCNP9/q0SvA2z1598KF3UGP2J0C5iigZtfvU
         vsv4HdZQOZDvbKE3RlQzdHTq1ZGb9Faq4EHy0znY5f/iVgN3e9fDYzzUHgTJO7r6byWh
         ISWs+rkHvzbAF55lPkP+lRcKdgnz86eEG88bTWxS1JCtxRTqnRMThW0g7RLGiQNoqVyx
         I1btALmfkpTjFOJnzWeILL5B0NRLei1XjG98BnoblyGb7EyydcMcy7mIy2Nt5981xKnn
         xXIFyphzuW/cih7rzbt08H113TSopxOVWKECaB/4p/9Y28g4QivR/x8zv0hV+POJ4v/M
         LYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHuTiv5pA7Z5U4slTvhn316jmXmIhRsedaLyw6JXUZ4=;
        b=Zb2TvV5RziwELNu34h3LjQZGVPdd6mtnlQ2jrxiQ2o4KIZYgiUW6f6waKD9bzYGr4V
         ZOBk3X15sWoeAGuMjW72wXkf2FjC0BJRDF+uimUd8Lbgi92DIBjyDRwQFGHcnl26Pz3B
         WyxtHH3nRhOt/1MQpKMQ4yafWixEQNUg0Fyh3UXWYfRzAvBZtVya9crChOI3lZCL11RJ
         IKIIB3OuAo0mRpdf9RsAB/KHcl5gs99fDLcLoKoU7yfI3JtRqLMGloTo8NJMbjRUVLpo
         Bj1IHnZivhFhHhFUWni9QXqeEJvZZJ2YBBqa6TpsuV+mHwS0tWPZv3z8y2y5PxzwLI4Y
         0xLQ==
X-Gm-Message-State: ACrzQf20h2JdP8JXEHPZueTWRqUe8WosYeyzw1AKyMvaaWMAHJBA9SBv
	i6mrkjhXdRSGDeITywvmfTQ=
X-Google-Smtp-Source: AMsMyM7NOS2sIcUk455aW9lYACwFLShzitw0Ev5rmbRLgYjOyibIMT46vE6fi9XSb5TANamUkc0UXQ==
X-Received: by 2002:a17:907:74a:b0:77e:9455:b4e1 with SMTP id xc10-20020a170907074a00b0077e9455b4e1mr49239709ejb.462.1667847200786;
        Mon, 07 Nov 2022 10:53:20 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u10-20020a056402110a00b0045b3853c4b7sm4624452edv.51.2022.11.07.10.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:53:20 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 5/5] riscv: dts: allwinner: d1: Add RGB LEDs to boards
Date: Mon, 07 Nov 2022 19:53:19 +0100
Message-ID: <1806312.atdPhlSkOF@kista>
In-Reply-To: <20221107053247.1180-6-samuel@sholland.org>
References: <20221107053247.1180-1-samuel@sholland.org> <20221107053247.1180-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 06:32:46 CET je Samuel Holland 
napisal(a):
> Some D1-based boards feature an onboard RGB LED. Enable them.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


