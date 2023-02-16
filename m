Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBA7B
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Feb 2023 08:37:01 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gs13so774394ejc.1
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Feb 2023 00:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4KBTMU8jBmlXCRW1BaMb/5ofBQCyWlJecu0txQ7QDQ=;
        b=sX6bc4X1bXcDji0c9x8LU9221lS5GZNrB0hpiW83JiXZB8E7BbjFgomSAkDec2QDRP
         xMMyabXWimG5hrxVlKDQsh8/ig2WIJix2+a7B/zbbhwrNrK7YYYB+HL8T9THmhJRnB9X
         rZMI5uVRsL06y+UQxD8HugesN7xlwDsPgoOctNF2yN2ZOo4u+N2zez2OTxFRbKKiRa7V
         BIhTV0uc2PPHOg2VKcWBPujv07qjX21mpJr7rGUih6wbn+8yIi7TRyKHqeDdT1mo4BLE
         xNNAl39lS836wPU/L7VrIhemaC5i4wjQwCzd6zMBCiq1+0SnaoaOTTUMrdHqEcvWH9jT
         8Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4KBTMU8jBmlXCRW1BaMb/5ofBQCyWlJecu0txQ7QDQ=;
        b=BDghfznOkeV8O6yY/yDQICUNnGtoULEjJjon5tOtIT0LWczOTX1CuccBKGWwJWObpa
         rN2MfPO9eE0AzlEPaRVFpwhdlD4D8q0XaxsAudwVGz21sr/LK4EEL71KBrvTyB0E1SzN
         wx/tEy9ABVXrr4nod/yaWStNTJQnGwsNR4A4UyD9sz33qqPk5pWY5p+aiWMwJoEELf/L
         Qc5K9V3JBNvEBXqc0pn0Uo38dOCHek7Rs0DPuVB3VkHUAFAgJ5y8fhQSDBrdHYgU/zfI
         eZuXh3/m6LKPKm3z6KZ4xsbIhmsdnrRul+YHBvc0zwkS3ZO4SqB5hZ7tqUgzY7BR+rKc
         i3NQ==
X-Gm-Message-State: AO0yUKV+xygl7qkqmEN2sGbFvSxM9kOYKbEV7CapnO7F85K6P6mGJZAJ
	ppFBT4KJui5AK1q9O/lGKAqnww==
X-Google-Smtp-Source: AK7set/DjcOeEnTTPlpWqyb5qlVnKQSuJzZgIydVcNrWDHVrvPif6RZ/z5BOKu/cP6sB+osLLeO7hw==
X-Received: by 2002:a17:907:9868:b0:887:5f45:d688 with SMTP id ko8-20020a170907986800b008875f45d688mr6646754ejc.41.1676536620210;
        Thu, 16 Feb 2023 00:37:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906a39400b008b14c5a82e7sm497276ejz.127.2023.02.16.00.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:36:59 -0800 (PST)
Message-ID: <f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org>
Date: Thu, 16 Feb 2023 09:36:58 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/5] arm64: dts: allwinner: a64: Add hwspinlock node
Content-Language: en-US
To: Bastian Germann <bage@debian.org>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
References: <20230215203711.6293-1-bage@debian.org>
 <20230215203711.6293-6-bage@debian.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230215203711.6293-6-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2023 21:37, Bastian Germann wrote:
> Add the hwspinlock to A64 which is already implemented for A31.
> 
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 77b5349f6087..f2ecc21f06ed 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -851,6 +851,17 @@ wdt0: watchdog@1c20ca0 {
>  			clocks = <&osc24M>;
>  		};
>  
> +		hwspinlock: hwlock@1c18000 {
> +			compatible = "allwinner,sun50i-a64-hwspinlock",
> +				     "allwinner,sun6i-a31-hwspinlock";
> +			reg = <0x01c18000 0x1000>;
> +			clocks = <&ccu CLK_BUS_SPINLOCK>;
> +			clock-names = "ahb";

Please drop.

> +			resets = <&ccu RST_BUS_SPINLOCK>;
> +			reset-names = "ahb";

Please drop.

Fix the driver instead.

Best regards,
Krzysztof

