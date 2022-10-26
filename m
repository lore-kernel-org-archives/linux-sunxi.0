Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BDA7B
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 14:50:16 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id x15so11644415qvp.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+Z+gNNMU3McZjMUVCV+bq5PaQ/StJP31GeGMFY00yQ=;
        b=iIPefOFcajYIabwygnBa2cr7q2N+oLtPVvhqegJSA0Ufhe7KdZ3TGqotABFnYJ0C1D
         W/NlNprE6YWePgE7Nc63LJF3EPTdaWqlceh9ze/sa8prd8ksNY1jja6yqU6JEyH95Z5L
         rQZ3+qAkbUkke5RYamqTFblSuClAZkDL+XhUYDy6vuEsXLh3WmlgcnY0ZIJNEA5VYoVx
         z0wLXQJ7vBkkOHMYgJysMz7AKiWUmVWF7OFi8IIC83dc+gOHzblo9KjbjJlSJTQ1JiUp
         L2Y3x7HRjvNzQYvoXHs65umOrL/GcvVwnHGCfM17MjXJEEIRmI/oTo4K0qlFFKNqIQAN
         tzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+Z+gNNMU3McZjMUVCV+bq5PaQ/StJP31GeGMFY00yQ=;
        b=npRLSh4+q0T/Op14urOCye7PaTy7UZPEt3QXCg63I/Ro05pdqu7FS2cg3NKkSWAqNM
         fSUfbzIftY7LDRAj6ZSC9OzUmSvW65zL8L3l/rmRaegJDZ51pA6/HFFf8/s3c2OutSUV
         PJg/hc18BJShm8aBMzzoTwmF/C20tyZk6Vxe2E6N142HWHEtZeTPMXyNJu0giQYwsTpV
         h/yvJCWs5BsoDUp8xkY+uqs0tqSMO/obVoLVfJ1P/rrB8IRpp2pioaS7HwCV/WGFR/x7
         R0hC7sEzXPHwE7VQMkq+rr6B96a0NO8vphK8oaIDr0RYjZC4Y3J+yjb72Kf9hIJkjwuP
         2pAQ==
X-Gm-Message-State: ACrzQf1UAg35GzFH6nv1N5JJFkfnstlo0zW0jNNE+9vkmQQNjcZIAKTE
	GeMVAA/EMLGtdZA6k3NcRR+N7w==
X-Google-Smtp-Source: AMsMyM6lqOGZD8a58+vf/bzIrwSNh5y/+CDdt5z9ZFq8Nfee+R0BXi3KqPEj+WUUXgJioniaHeafkA==
X-Received: by 2002:a0c:aa96:0:b0:4bb:5ed3:49b6 with SMTP id f22-20020a0caa96000000b004bb5ed349b6mr18945896qvb.80.1666795815276;
        Wed, 26 Oct 2022 07:50:15 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m17-20020a05622a055100b003994bbe91bdsm3306333qtx.60.2022.10.26.07.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:50:14 -0700 (PDT)
Message-ID: <df14e401-4ee3-920b-aeb4-6bcf52ba85cf@linaro.org>
Date: Wed, 26 Oct 2022 10:50:12 -0400
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Lctech name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, soc@kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
References: <20221025145909.2837939-1-andre.przywara@arm.com>
 <20221025145909.2837939-2-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025145909.2837939-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2022 10:59, Andre Przywara wrote:
> Shenzen LC Technology [1] is a company making various boards and related
> products around IoT and AI technology.
> They used to use the "Cherry Pi" brand before.
> 
> Add it to the vendor prefixes list.
> 
> [1] http://www.chinalctech.com
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 035ef859fbc58..e273bf9235946 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -695,6 +695,8 @@ patternProperties:
>      description: Lantiq Semiconductor
>    "^lattice,.*":
>      description: Lattice Semiconductor
> +  "^lctech,.*":
> +    description: Shenzen LC Technology Co,, Ltd.

Drop one comma.

Best regards,
Krzysztof

