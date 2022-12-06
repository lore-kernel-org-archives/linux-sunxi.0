Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321F2100
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Dec 2022 08:22:40 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id x6so16355833lji.10
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Dec 2022 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJbdOZupl580ZQnipM7/rZhVrLHidmlJrwN3qpwkXsU=;
        b=Fezlkgz9ZmwoUdx5wNirGzZ1G7y+H71PivmUr1qQfYcfMGRsv/67Z6J8RUzL7Akcsy
         3DGVkL3CG3SnNHLLkwdoIa3GiQRAXiNSBs08h9V4OvrxNhYGNOX3TFBh8qrx8Owtbhmp
         lCtwy9pZsuvv0PDQClV+ybfMud3BlVJ8T/SH9xqkEdtm1kLixVxj47wmWzvdbDYGoQqz
         eA1UTFRn7ZeI0ndBgJ7p7gM+mALHxoASw8jL/rpKwKyOCUO2To4WBXhTCS7csThodn0y
         JyHLoq0u9A6r3Hjh/vu0d5R/rEaa9q4Jah3nW7T8EonNkX3bWlGSX3hegLSEVB58wR3D
         es0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJbdOZupl580ZQnipM7/rZhVrLHidmlJrwN3qpwkXsU=;
        b=rF8inopiadfWWClcU9HP1S5wICYyYe72wFRMZPGC0cPui/Xzm/wi8amRhcI48vNLb8
         pxp91w7x1FP3Y01fel0AQjKQRekNGPRRC7WAroPROyUpJy2VdDulgLoBw3N8Y054qvAh
         l520SKO4z9KrwOx1q0EIiqy3OZXA6QdmgKSPMpNRxnAq26122JhnOAXarfEzVhDWf3Wr
         giirhFhDdzZszP+hra1zuVda2e5y/XTCKNCvJSu1gXbKOXKX06C4mIg5B0AZXAurEM7G
         +D6dxcbmVnA1sKUDX2HCckur2VKeUSeDuz05p+3Ge4D37uyXUYZiosGxqirtHp+IyI9q
         195Q==
X-Gm-Message-State: ANoB5pnz1FIwHvzPNnceCd8YN3T5S7yLXK+zeQv73OWycXjtW2eqL8or
	4fge4cpArLF2xv17/a6T5+tAOw==
X-Google-Smtp-Source: AA0mqf4OymOixUgOb7slcZLoIcSq5wa584Qglf9rt4lj/l7R8uYGMZB8PgUCEvxrirRV38777UTeYw==
X-Received: by 2002:a2e:9884:0:b0:279:fe8e:2848 with SMTP id b4-20020a2e9884000000b00279fe8e2848mr2332223ljj.188.1670314958177;
        Tue, 06 Dec 2022 00:22:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c9-20020ac25f69000000b0049944ab6895sm2407853lfc.260.2022.12.06.00.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 00:22:37 -0800 (PST)
Message-ID: <9d32cf45-c506-8990-a14b-004de520a931@linaro.org>
Date: Tue, 6 Dec 2022 09:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: Add binding for Genesys Logic
 GL850G hub controller
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
References: <20221206055228.306074-1-uwu@icenowy.me>
 <20221206055228.306074-3-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206055228.306074-3-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2022 06:52, Icenowy Zheng wrote:
> The Genesys Logic GL850G is a USB 2.0 Single TT hub controller that
> features 4 downstream ports, an internal 5V-to-3.3V LDO regulator (can
> be bypassed) and an external reset pin.
> 
> Add a device tree binding for its USB protocol part. The internal LDO is
> not covered by this and can just be modelled as a fixed regulator.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

