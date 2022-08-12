Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D7366
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 10:48:23 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id w15so582165ljw.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EhxaKIEh/wAXZD6zcgeSWFyzI2lF/EihKd+2aYnlgHc=;
        b=qrboJ4rIHDgzbJmvJnEP89NnQo6aFutdcDE5sNQAQF9N0kPvOHxHpe+7iifkwnVHAY
         GKtnzTp/S07plKrH9tAy+EPSNK1E1Jqytc9ICOewpsLe/Tpb9ZnFt53jQaZGJ8vOBpUq
         gUCKPuKboCZAgM+DTijUvInr0ErC00/On0jdKw/Sn2MKhJFR+nkryt9fRjPgrMzQvkBZ
         vtnXlFjZ9M4iHXDA8Oq0cRfgj89y5k5GOkHGCMW/P6bbVrA4HW7O+4wnHneBk8FBgeoF
         QztIC1Rkxr7KAdR0UYavxZKc8j5nwWdDdv7zu1tRCj5G+rkOJ2KEbQId8brD4EHyd8m0
         te4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EhxaKIEh/wAXZD6zcgeSWFyzI2lF/EihKd+2aYnlgHc=;
        b=BNvlp6IbugB3bd9+aceN1J/lMj/9ff2glFbjEipMv+68aQ5Y9UItHtF2pRPi1oc4cC
         agJF32Eb5MjHhO5WACdajnF2sgdVlJqwIUdlLUoBrDPNJia8aDn2ODwlkEi237RSZRV9
         rmu2wS4eW3EISbz31NwpgmmjXnIPjjZXB/y/7kJ9DUxC6nPxc7YMJ3T4VaYCkfhx1bX8
         PsEnh63HLIpZOIbo/4t1i/2Ee7+q7U09d953vhS8TiwYgd7iiaNf2/lclNLG7/NFIAT1
         DC4p7RtNhSVibOgefwTYJD2vMfRsBOLukfhcNgypCsv0O7WCCif5iLH+HibJzBf4tHdk
         eG5g==
X-Gm-Message-State: ACgBeo1ruSt1WZcKvrIjL2kldyFI5VJe8p1CYZCrSd12buosl+D7gVOy
	ohKKntmavWhjH0j/xwma29ODlg==
X-Google-Smtp-Source: AA6agR57MBAVpGC8ueukuB2CqRdXwkzjd3ZbWTc2T0r/j1Wf9Z7xAWiR/BSI7OSqtlG5F26ix5qbIg==
X-Received: by 2002:a2e:a552:0:b0:25e:6fa1:a6c4 with SMTP id e18-20020a2ea552000000b0025e6fa1a6c4mr949196ljn.90.1660301301259;
        Fri, 12 Aug 2022 03:48:21 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id 14-20020a2e154e000000b0025e53413b6dsm313231ljv.2.2022.08.12.03.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:48:20 -0700 (PDT)
Message-ID: <bb69c593-b355-a080-0ab9-334ceb5eb036@linaro.org>
Date: Fri, 12 Aug 2022 13:48:16 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] dt-bindings: display: sun6i-dsi: Fix clock
 conditional
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220812074257.58254-1-samuel@sholland.org>
 <20220812074257.58254-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812074257.58254-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2022 10:42, Samuel Holland wrote:
> The A64 case should have limited maxItems, instead of duplicating the
> minItems value from the main binding. While here, simplify the binding
> by making this an "else" case of the two-clock conditional block.
> 
> Fixes: fe5040f2843a ("dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller")
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
