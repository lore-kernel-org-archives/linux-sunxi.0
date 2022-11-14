Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D4256D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 10:21:57 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id g12so18522341lfh.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgnoGZsYxARor/OCp/6dnWx9J4VVIiEe0uaBuw5cWvk=;
        b=X6YMAf8ibewIU+D3PzUclDDzp8GeUq8NOXS5p4KqiO0xk1gFK3Cv7kZXBe3CybK6Cq
         y7MJxu4bX3COpToy6wUDUVdV/yD2kVcka4EbaAzcB7IlA16P1isqp8jjHaaRm2JBuCUm
         ILDGvMrbvAyThchjp1pAmtHof2e/jeZyU4GqrtZqlH5Yp1am41cu5/HpAe3QppBO2zzH
         Dn4U9yjaHjBs99Co0ewCQZm+9+WaT/2059PkzgRwqChCLTM6P88HJIT2Q+hn6htZDgBS
         Ih65atG0LXq3M0as9GGnLLHGfH+FvZDo6ZMuPNAzpZVuPm2Gg/zrQORgio9nQtSDZaee
         QrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgnoGZsYxARor/OCp/6dnWx9J4VVIiEe0uaBuw5cWvk=;
        b=uj4bXKwD0GKPxR2ArhA6Gbjpw0sP5/aJtpEhI3ObYGr/xM6xY8C5yyFBU45yet/SFT
         Kf6ep8msqB7TgSJARnGk0c6QTK4LZmUYHHPM2lsdu239O/lUi55CbF9eRVJBsxhGxoaD
         qO8EHPpqToSHpu3qmUpz/ReSkIullPJyvXhVfz4bn4h5Lmoh8HhM/WhbPFxsro4UVWCx
         UwRJYlCsVVK3errx+YKwWcY2ururHHePQW5QzsSYKaOfmxJQofcnmtQ4yMgAdctKLySY
         s+dXu6oycOyfL7GXKHIXVQMdCqMSVlGKZVbSSU5ssJKJLTfANZr67CL8yNagwEuAy0Qv
         WjyQ==
X-Gm-Message-State: ANoB5pmW7gihh6rndE8vgVi5hWplHuIoMlH+IWKGx8lSA1QRrdlhb8Ht
	H1s9VMKvuvo9ueMEuwg9cKIZxw==
X-Google-Smtp-Source: AA0mqf4ZpyyLf9KjUSnx4MxnRjq6NDx8ExuP9U5TgOYBfHBsk1rEV1fb15/VVoT6MZibItMgYxsZ+Q==
X-Received: by 2002:ac2:4d32:0:b0:497:5e53:cbb8 with SMTP id h18-20020ac24d32000000b004975e53cbb8mr4469173lfk.325.1668421315578;
        Mon, 14 Nov 2022 02:21:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p9-20020a2eb989000000b0026e90b478c6sm1937705ljp.114.2022.11.14.02.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:21:55 -0800 (PST)
Message-ID: <d8c0fb0e-d3ab-5e2a-2cf1-5d7dea8cac6f@linaro.org>
Date: Mon, 14 Nov 2022 11:21:53 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 07/18] mfd: max77693: Replace irqchip mask_invert with
 unmask_base
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lee@kernel.org
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, cw00.choi@samsung.com, brgl@bgdev.pl,
 mazziesaccount@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-8-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112151835.39059-8-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2022 16:18, Aidan MacDonald wrote:
> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

