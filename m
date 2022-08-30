Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB16625
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 09:36:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id z23so7861093ljk.1
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kCi8L1+oD+4JTBvg0D7KspDhAid2IOnvW3ckVIUBt9U=;
        b=YO/VLJYgQtWvyKOuDYePVhu0MG9qTHHNwyrER5jP7xrz5Ovu8sFTgTrT9hUTRdyN3+
         4TFLgf2CI3a5HHtqwqZ/JiUdBvEVWGpzZBskvMxHeqBgofR6zQjMX+YCXZevj+KiQj5Z
         Q1unqYNIZPZEVMqv8FrAEl7qK38tahod0e5h3d+ECr9O1oMkNGId9Oviz7MsvZUJwVOt
         1NF497u1MgpgtGPjqkVGj3GGumW0HBKkE2S3x3tAwK8XgJ6oyVgF09DpwatmEyCHYFEs
         FALpdbKoWv3Kr/BmJ+mDTqr8a5WOoGXvutD/GcI/HUrqfzyLnqQd4Jwuddr8bkVAXRpY
         biGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kCi8L1+oD+4JTBvg0D7KspDhAid2IOnvW3ckVIUBt9U=;
        b=lJ+N1x1Uv4JSCLWzULEAa/GKTpENixkQqkFXmsJSnyFCbAY7IsvERx4tyaRE1G/ECa
         ff3njcGQB7mOPirtEXaRq3pgCHhoiRF37jwBC1SyJktGWHSFyykdDj+wGA41i+aMi1S7
         6+SU89UiIhgclLXuoHHcla9ZuN5OUWbDpSyQDsi7LZzGpmam6UDlNw23GxZMykVunsIf
         S90OyZmH4ho3/PqhIamW3UGbFLqloHhFsEMUe11PE7MizJq6t9xwjXz9kyCzTZyYHqso
         fQTQkEWGkNkQ+ZxVL5MQoswq/Zr2M01I9w0HhyvB6q9mr4cT1YWPq3v6IMEmgZAGPNnO
         1ZHg==
X-Gm-Message-State: ACgBeo3V5DYVMpOVtH6Xa21UYknZgWnuDvBnjtKOfR4RPLBQWu42XL2d
	kNw/sxeSmPjWjek0Kt5lMvxgDQ==
X-Google-Smtp-Source: AA6agR4d1/sQGxXZPNDK/31Tjg9grm6UsSbjOwAS5Sq/aDGVQCp4oN3d9PYLjMqb5EjZ0bcCmPIeQg==
X-Received: by 2002:a2e:3006:0:b0:266:6677:5125 with SMTP id w6-20020a2e3006000000b0026666775125mr1872362ljw.352.1661852193294;
        Tue, 30 Aug 2022 02:36:33 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c9-20020a05651c014900b0025e15fe421bsm1705374ljd.17.2022.08.30.02.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:36:32 -0700 (PDT)
Message-ID: <1c9cb6c2-2030-257d-a50d-dada0ab4449e@linaro.org>
Date: Tue, 30 Aug 2022 12:36:31 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] dt-bindings: i2c: mv64xxx: Document DMA properties
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220830020824.62288-1-samuel@sholland.org>
 <20220830020824.62288-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830020824.62288-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2022 05:08, Samuel Holland wrote:
> Allwinner's I2C offload engine includes bidirectional DMA support. Add
> the properties for describing this in the devicetree. "dmas" is optional
> because not all instances of the controller have their DRQs hooked up.
> For example, R_I2C0 and R_I2C1 on V536 have no DRQ number assigned.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Thank you for your patch. There is something to discuss/improve.

> ---
> 
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml           | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> index 0ec033e48830..63d665a4f9bb 100644
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -66,6 +66,19 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  dmas:
> +    items:
> +      - description: RX DMA Channel
> +      - description: TX DMA Channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +dependencies:
> +  dmas: [ dma-names ]

Dependency is not needed. meta-schema has it.

Best regards,
Krzysztof
