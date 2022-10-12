Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF908F7F
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 13:10:45 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id a5so5343474qkl.6
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7G2Yq+rJ1ZhtKUz9+hk3hjumuAmKCtJeLM6FaHLR48=;
        b=EBBu9Jumc1NjlI14sXDx18bN/BhlEoRIemgjAThwEMFR4FDMdr837XPmF153c97kiv
         KgcAuD/nM2Euj12kgMiaOXwAOTRq++/xwzxIHQmpe6xRr1dqHJ9MqCeA0wdscFQgL02T
         CF1Hk19v2NS1ExOdWA0ZFZYbLAmAIWU+Xr5GoCiIpHRVVNzhVvWjKtRJH29P+eGXrADl
         6nbKtAfmckcRubnodOptTE8/cnKXnI8/6vjIoMXu3UUADv+mF4+YcqeTq3/VO7ndRtX1
         hOhdAW3sgs2C1nkaSDXIr6P4rIAH1T94fuJJEAZ3zc7ZiMBzfB3S499/GZOz10ZE7NX6
         cigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7G2Yq+rJ1ZhtKUz9+hk3hjumuAmKCtJeLM6FaHLR48=;
        b=S6l36qq//5njxo5n2/9XuVQF3rff/n/WuvhxDjo8vkcw63YN39p8Y/yKil0hMg6/BM
         B9VME9M2lX2n58ojsXKfEuYR8NgW9XBVwe4eYALwPEUxM8KYLD4rALEIQ9C2PkMkjzjR
         ycHUfKcHp4zbtnQpT3Vj/a15tJIA4OdhbeQ8JWdRWazihUgTW8StPdwLpoEKkdxKO3bq
         Dy1U3028vBrZUzwKDpidis8qD/pH19D95GdlHuRFBsxQQdOhTKNLw8mbb0RAOAKKkyJI
         2+jOQcf7m+eTbDrMt0CvnPt86ZPU6C43YOKP80UP3dct988AmES6gdSuR4oBRt91uaXP
         fARg==
X-Gm-Message-State: ACrzQf2ZxXDgc0rboaprIzGRBtk8G3+kJhQyRsxdUOPosuZ2/oZLdNCQ
	KNovuWqaD5C21k4qL8Nkxqqy9w==
X-Google-Smtp-Source: AMsMyM47s2HEd/ei/G/HHcLx+xnZuL6fbjDhrLQjxBM2msx4b/k/ATJETtbWtIuy6tjp4xspUJ11Ug==
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr20148712qkh.723.1665580244143;
        Wed, 12 Oct 2022 06:10:44 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id br7-20020a05620a460700b006e9b3096482sm13642940qkb.64.2022.10.12.06.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:10:43 -0700 (PDT)
Message-ID: <4e5ed6bf-8af1-d8b9-b89a-e9207a6ea756@linaro.org>
Date: Wed, 12 Oct 2022 09:08:32 -0400
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 03/10] dt-bindings: usb: sunxi-musb: add F1C100s MUSB
 compatible string
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-4-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-4-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:55, Icenowy Zheng wrote:
> Allwinner F1C100s has a hybrid MUSB controller between the A10 one and
> the A33 one.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

