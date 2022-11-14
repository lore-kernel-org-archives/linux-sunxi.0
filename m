Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414A4C78
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 13:45:15 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w14so18318987wru.8
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=QlaQ+5L6ISjl1Quqoe6Zjc/8uHOtFVdW/GdcCpp/E/Q=;
        b=jSCYGC5OOaP6wUoO8qDSxyvxYcDe1o8zBe8FkfWoFAjWSsikhUAtNoMBmNwFeq3uhI
         G32ZWxouIGIydr0MRB9Py4ixg/z42dGJg9X3xVAoWk12hPfQEaNinSiqp34K6y+SQ+iY
         XAHHzVH+RkkSRuTNC9lGBtDX2pacFYyCNwmOOJPgLFOA4nU8UyGPUpGxeHPDvVChT8Oa
         U7WGPpTpSh9yPgOa8AOpqwwv6cLCWiKgJqiqk9m82By7kvu171l8969qwArbJxs+66N0
         WP+Mr33C3tQ6IQaS1TkZIpp2QgXt+NE+dcRr4s5aRbbi+eBghyuQtoYo9k6XbuSKJQ4d
         b3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlaQ+5L6ISjl1Quqoe6Zjc/8uHOtFVdW/GdcCpp/E/Q=;
        b=EShAv5aM0RDQoWSGXM188RFB6uPZw87OlbT2Fbn2TKZR7pXNDUQ6ABEJQLVe1sRgX/
         VDfxu3jbSqAFoRJG5xe9RjyHZszXXePuXmZOcdywISqglz0D3EP3pyPisGlpKzYHJEzX
         twpCewTyKK0khTLRiRRnFgR3wBF7+khtLWTygv5C34kzPjL8Z7S3BF5i5J3GCtKU9IXv
         8SL2TvZok5WxPLBOyy/xYmiMe0I9FrTazGsFX4ICXqKatC5GrnWKYyO2YiKR1oc6z/Cw
         oHhwNuYgaAyh7OQmqpGoNQVBGfjrovRmxKAtLgTTtnCgy383yY3vV1bkDIgZdGAonc0P
         J9Sw==
X-Gm-Message-State: ANoB5pkvwPs3+sDrbERwEBLcP2439+QzzouzfmF+LfmDF/XJaQ2gB/MB
	GVFxpCWenMmjBAIlvA5cESQ=
X-Google-Smtp-Source: AA0mqf6t6wgbEYsEROt1KuQTFtTIDd5a+5nbKAjINA0i+aNpO23kv16iWfHV1aCU/yGepWTsRNrKrA==
X-Received: by 2002:adf:bb43:0:b0:22e:6f0d:d69 with SMTP id x3-20020adfbb43000000b0022e6f0d0d69mr7759486wrg.134.1668433513466;
        Mon, 14 Nov 2022 05:45:13 -0800 (PST)
Received: from localhost (94.197.10.112.threembb.co.uk. [94.197.10.112])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d694b000000b0023691d62cffsm9536367wrw.70.2022.11.14.05.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 05:45:13 -0800 (PST)
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-6-aidanmacdonald.0x0@gmail.com>
 <03b94d20-05a6-71fb-61e4-00889f5aa64d@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: lee@kernel.org, mani@kernel.org, cristian.ciocaltea@gmail.com,
 wens@csie.org, tharvey@gateworks.com, cw00.choi@samsung.com,
 brgl@bgdev.pl, mazziesaccount@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 05/18] mfd: max14577: Replace irqchip mask_invert with
 unmask_base
Date: Mon, 14 Nov 2022 13:34:10 +0000
In-reply-to: <03b94d20-05a6-71fb-61e4-00889f5aa64d@linaro.org>
Message-ID: <KGy5eAsJh4YwYjYVTvnohmym61EBqJX5@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 12/11/2022 16:18, Aidan MacDonald wrote:
>> Remove use of the deprecated mask_invert flag. Inverted mask
>> registers (where a '1' bit enables an IRQ) can be described more
>> directly as an unmask register.
>>
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>  drivers/mfd/max14577.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> Mention this is a resend or provide a changelog for v2.

Most of these patches are resends, but they're so trivial it seems
pointless to mention that fact. There are no changes from v1.

Regards,
Aidan

>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
