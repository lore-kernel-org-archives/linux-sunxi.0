Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049901103
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 11:07:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso858669wmb.0
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZY/0HK5vhWq1atET0Bpv4+WgmiEnLmZw9upWsDYoJe0=;
        b=PRH4h0KL0RGYsGtinEt5uGvc6yYjP2pMeE+oPGF9McFxEnYc0ZDgmzvz/k23/MOAPo
         WFcj8l0PV1k2XjUUOpSwHakFQzJXJJFMBY1uW6lKbNd5KXQPqgeIcfobd8o3mMC8BZXZ
         K2FW2/KL16WtuL4lGcSLo0I2OZBw6Aph3e9h3W/TEBC4bVOD0j0wJlus0S1MO5xuSTVd
         XQVx7NEmkytMub8399S5u5/aMsUVjxNxa3sYsdKnFlD5r4yjZVe/SQaA/aHK015HWNlv
         H+xRU/NrzNoNdeg/xKKq51dAcnb9/MsvgK+fO6Misr9OxcWwQ2/VPntOKPDt78bR1Esr
         Yg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZY/0HK5vhWq1atET0Bpv4+WgmiEnLmZw9upWsDYoJe0=;
        b=4Jd84cOa4NjcKm91JscNd41KXpjpAvnqJZkEfzKBM6IoJmfkFn3hZhc61aulMtm/BY
         ef3mcW1TWQfFPG9sgL+wDD0yZklTu+8Ggy4toCsQ9mBMmGPZJBnZVA6D4g8tfjhz+A5k
         BlwLSCrjDD97ShVn68hroiYGRP1vOHAvHRb7JFU6aakAzZxgf1Y1joq9QzFXcFfwscbF
         lLg0RDl6ldsPlGJUIajyEt5GsuwN1dlK3i4rrNdz6wJG4A/LhEItKNSAL3pMrR2a57q/
         IhiiV43uAqvVM+qQ72MMb9ES+SZ7DXJZQEsiC6dCjdGwavRj7X3RhEVeepGm03N2Fbye
         5E9w==
X-Gm-Message-State: AFqh2krDhwNyl8sffZ5rdttA0dWvszCaKkWhNh8nv5gj6sSOxjJKjSmA
	5qbowAu3U2Kfj3jOdk5Ek/uCNA==
X-Google-Smtp-Source: AMrXdXuhrDzIoOs4ugbIUgNEN4hS46pqg+RXmxWlx7qeJfIhwodH1pzfIbnE0OeoKrRikOwmN57Xtw==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id l3-20020a05600c1d0300b003d34aa64fe6mr37858456wms.3.1673003256258;
        Fri, 06 Jan 2023 03:07:36 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c358900b003cffd3c3d6csm1502418wmq.12.2023.01.06.03.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 03:07:35 -0800 (PST)
Message-ID: <8d1c49e0-1aa2-b08d-b68a-64d9beed54e3@linaro.org>
Date: Fri, 6 Jan 2023 12:07:32 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R board
 name
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?=
 <szemzo.andras@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-4-andre.przywara@arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106010155.26868-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2023 02:01, Andre Przywara wrote:
> The MangoPi MQ-R board is a close relative to its Allwinner D1/D1s
> siblings, but features two Arm Cortex-A7 cores instead of a RISC-V core.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

