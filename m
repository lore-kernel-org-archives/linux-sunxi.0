Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A62102
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 08:45:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id r12so16284837lfp.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 00:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nenci7t4rhCZdpWVoRxbMnQAdlppXCobPbi7wEBQtJY=;
        b=THlpyONNZdQgCWbS1nPUbGlrjy7aLrSQSgr5nxOn94srvrNVV1E9iiBaMWwkdvVPjP
         wfeIT1KR0qdEGzKORsWz4uV/skULyk14PVaH99PblmmW1b2+M7SxwGLl2+FgwvR3XQpw
         Mb6MjJ7rIGPkwbo1ZL99Ah6MJhMFe4qNtEEMkVeWdorV5JFgVIi4Qbqomo7VH5eWWCoi
         tx32qaw0sjUH4cQJuxavrKpOP+Imm4rpTaFAR7YZzqUQBHp5pnZUwwfSjrcSGLBobBdU
         KbWQdBQh+XpT4OItk5xOlklNH17Ln+GSrmxYO4JgOTdkxHz/4pA6MLrr1RVaIO3eL0GY
         sAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nenci7t4rhCZdpWVoRxbMnQAdlppXCobPbi7wEBQtJY=;
        b=Ig59ZS525h71wq3SB9itUK4zGAjfJhbvJlfpR63MyEBUAsqAocsNg6NeHUlJDXgmtt
         YL2GQrjluOIe/1mV09S3rP2KefFsQrQhrgMsDzv+Ro45HNIADpTmSu2fbeLohL2Xz3Lo
         J3/356Kx0t7KTvHxyh0nyQUUZs+k3t7pAEJK2MSmcWQdgCWx4kPcuG4LhwsPyE97KVME
         QolSM0Nke/e9HTDlzpNLLX60zDxi2dnoO1NVU820N7/FYm5X8TQANUtulmLolcjrptt+
         pcxg9B28sYt/PiZpIXuQJtaRX9I2i3ESe+kZxj7Agme9Gnkb1ntfs7VnDFd5L4YXEZPD
         rypA==
X-Gm-Message-State: ANoB5pmdGY/hGG5p10zY/sGtf8isPSKECz9Q49pcw+FqRDEt9cg2euld
	iEXl+Pu4/ztpCZsz0CTCMg/qKg==
X-Google-Smtp-Source: AA0mqf5n4p6pcFE0b6JaosOzLcEa0TroXRfYPjChVw+bV7Typ63sv24F7H3QKzd6B6431QojswjUFw==
X-Received: by 2002:ac2:4bd0:0:b0:4af:ad36:7a85 with SMTP id o16-20020ac24bd0000000b004afad367a85mr16358692lfq.617.1669625098004;
        Mon, 28 Nov 2022 00:44:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c35c4720esm1158464ljb.24.2022.11.28.00.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:44:57 -0800 (PST)
Message-ID: <26577515-0681-60be-17ff-dbceb7b9a083@linaro.org>
Date: Mon, 28 Nov 2022 09:44:56 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] dt-bindings: vendor-prefixes: add Genesys Logic
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20221127073140.2093897-1-uwu@icenowy.me>
 <20221127073140.2093897-2-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127073140.2093897-2-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2022 08:31, Icenowy Zheng wrote:
> Genesys Logic, Inc. is a manufacturer for interface chips, especially
> USB hubs.
> 
> https://www.genesyslogic.com.tw/


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

