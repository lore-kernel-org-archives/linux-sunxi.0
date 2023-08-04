Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76F2846C
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 09:37:30 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c897d33ecso126622366b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 02:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691141849; x=1691746649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldSCG+6LPCN3GhOyLEkZnY6hjS6A7mk0dYNnbDmjePo=;
        b=pxcxlQSG4c0ekuugNe7J/VBx3DparTKH6aU2NfbMhCqFcu1uBMIOTmV36b5n9B2wXx
         2ic7wb6gh8C0XgnUv+8UTz7IsIYSPBpGKs2UNoZ4BFLq30a3KTegJDFRUjYOWDrIPL1v
         QSQPYzAaIhwXbszkJYxfEko+57sxV0k9boirQeBgjfOiGsiV4BOeLrF/nouftxnxr3Oy
         IUv9orhhnY3GAGY5M2HKWlO6RMIe6heyyId2ualfkchG1ophTPYDICGmdLKVNP4mzKYQ
         0JzL+U0a0z3sGT47CfoS6GtUuxy8YheAUk9ExEq/PjYor/eryYQ9RKX2bAfIWcCaK42Y
         9E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691141849; x=1691746649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldSCG+6LPCN3GhOyLEkZnY6hjS6A7mk0dYNnbDmjePo=;
        b=RBHAyvy8CMRIa99dTwDginGDUetrAdxW5OFNAcStz56A/47ouiWsQDCRQnU9cwHxZZ
         etJqz81UvQs4UYzDF8mIAXBVBP/5ZNKD6LiHajI+YDyPxsBBP5D4VJ0OWcYmkTlo/bTf
         Qs6/VCUMD47AOxuB/fQRnNAZRFkQ/Hw+irTrWqMEWBJvB1juP4Mp5O9RaK0Dul95jOXF
         0XWofiyd2CWPD0hVeJzZ2MYTxH9o0WHMf/kUXmq2vJJLyZYmc+JvqqpYSYxwotJQ91QL
         9gZceXbuIxE+MjKpNJ8PCNfaiwpALOLmxA6EJBqfOi06a9NT7mKo1tDRKjpClvF8AXa3
         FzQQ==
X-Gm-Message-State: AOJu0YyhlZ7h+s4sV7tdqZHw4iSdGwpbOwrSfYnN+LKOtndbXCMXqV6C
	Nt5JyWSmCl6+Cx532KSulSVkyw==
X-Google-Smtp-Source: AGHT+IGvg/xMMV17wiJBz5ohTtX2f3abYbGt2Syqm1MyR5UOQm2AuKUvMAoVGZ1hdzgZzOZGhf00Pg==
X-Received: by 2002:a17:907:7888:b0:99b:7297:fbf5 with SMTP id ku8-20020a170907788800b0099b7297fbf5mr1124105ejc.61.1691141848923;
        Fri, 04 Aug 2023 02:37:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id z5-20020a170906434500b00977cad140a8sm1040821ejm.218.2023.08.04.02.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 02:37:28 -0700 (PDT)
Message-ID: <d0d7f1ef-4549-e563-e83e-6a6aab40eb38@linaro.org>
Date: Fri, 4 Aug 2023 11:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add BigTreeTech
Content-Language: en-US
To: Martin Botka <martin@biqu3d.com>, martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Andrew Lunn <andrew@lunn.ch>, Ludwig Kormann <ludwig.kormann@ict42.de>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230804090102.273029-1-martin@biqu3d.com>
 <C2CB4DF32C2C55DC+20230804090102.273029-2-martin@biqu3d.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <C2CB4DF32C2C55DC+20230804090102.273029-2-martin@biqu3d.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/08/2023 11:00, Martin Botka wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> BigTreeTech is a company based in Shenzhen that makes
> 3D printers and accessories.
> 
> Add prefix for it.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

