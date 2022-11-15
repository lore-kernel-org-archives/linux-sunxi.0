Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD19AD47
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 14:11:18 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id g7so24630927lfv.5
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 06:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmLKUGLqokfps8GJiCgaTlP2Y9BKzDEkzABOvID/vlU=;
        b=JzJ9i59F0v10dL3aEv5XJzin87ddzgfggJa7d4CBmCZHpBZygoMfHnhygqY6kyeyzg
         DfPOPnbmUG0nhsR1O8iRZI3akiRRl7Z1QRI14XBpojSpWIGQmi2hWJTc5WEVN3I98El2
         hB7DPo5SMTBY+vcumXnYhwZ2Evmvqx7Z/3fLEEipOn8QGjAUh9GtACiUHxLqqZ+Tezkh
         1zpUwvDACTS29IiBFPFo4ZpoCUHFHjQuovtDpci591suRETZWkr0SKNnRipYGMoQi4gk
         dbqQOjLUHavwBjsXvXLmPS40aDdn8XUq/KfZ0uVafxnPS9VzEAzYj5ix1bb6dXkI+/u8
         sJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmLKUGLqokfps8GJiCgaTlP2Y9BKzDEkzABOvID/vlU=;
        b=JJDOyDAk705yMx7nbkLl30SaUI6r7i7WxCZRy/HurTVr01rhJ9NT/+vZw58/fPRMyI
         WSHnlA7w6TLT5smgCgaiqxQZTP56H/mTcZpLo/GZpISlhtIlmwvBbSEmgYipOUwvHTPF
         0yUQp7qj4aOM6x/+rjiR0UAQR9UgKiC2AvjVmgSfaC2eR0kMDdfs5JwpBKK6FdyYwi0H
         nHdthXtlOS4MjMDp5Myay+6HvveOhdmVZn3Wp9TemUzqM2JqcYxT/vlFO/IbuvAE3I+p
         D3pOzKaQLfGnUr7d6A6K4vUJ/HgSwUksIep5RYaLVFmgR13M1PlJZOKNs4h8p3LTyRAn
         7zRA==
X-Gm-Message-State: ANoB5pkSspu0L+3AIlvLb4jwuKEq2eSUTXrL3lhR95qvzrcOSuLrbDL5
	kMbHYOsF9bj30bhSDTmwDaiYMQ==
X-Google-Smtp-Source: AA0mqf6PbaokXOZgQbbzApe+IA/ePQ8zAARWw2EQc8G7b6iXLBLww0bVtbLP3c890JwEBa+g1KCxnQ==
X-Received: by 2002:a05:6512:3f8d:b0:4af:f58e:a7a0 with SMTP id x13-20020a0565123f8d00b004aff58ea7a0mr5476878lfa.507.1668521476356;
        Tue, 15 Nov 2022 06:11:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x11-20020a056512130b00b004a608ec6d8csm2228993lfu.27.2022.11.15.06.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:11:15 -0800 (PST)
Message-ID: <b7936281-fae3-97af-e480-539d2675aa35@linaro.org>
Date: Tue, 15 Nov 2022 15:11:14 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU
 reference property
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221115090644.3602573-1-wenst@chromium.org>
 <20221115090644.3602573-2-wenst@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115090644.3602573-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2022 10:06, Chen-Yu Tsai wrote:
> The Hantro G2 video decoder block sits behind an IOMMU. The device tree
> binding needs a property to reference it. Without a reference for the
> implementation to properly configure the IOMMU, it will fault and cause
> the video decoder to fail.
> 
> Add an "iommus" property for referring to the IOMMU port. The master ID
> in the example is taken from the IOMMU fault error message on Linux,
> and the number seems to match the order in the user manual's IOMMU
> diagram.
> 
> Fixes: fd6be12716c4 ("media: dt-bindings: allwinner: document H6 Hantro G2 binding")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

